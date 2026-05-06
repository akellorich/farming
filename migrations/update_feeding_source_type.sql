-- MIGRATION: Enhance feeding log with source type and dynamic feed selection
-- Created: 2026-05-05

-- 1. Update feedinglogs table
ALTER TABLE `feedinglogs` 
ADD COLUMN `feed_source_type` ENUM('Feed', 'Ration') DEFAULT 'Feed' AFTER `penid`,
ADD COLUMN `feed_id` INT DEFAULT NULL AFTER `feed_source_type`;

-- 2. Update sp_savefeedinglog to handle new fields
DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_savefeedinglog`$$
CREATE PROCEDURE `sp_savefeedinglog`(
    IN `$id` INT,
    IN `$logdate` DATE,
    IN `$shiftid` INT,
    IN `$penid` INT,
    IN `$feed_source_type` VARCHAR(50),
    IN `$feed_id` INT,
    IN `$quantitykg` DECIMAL(10, 2),
    IN `$notes` TEXT,
    IN `$animalsjson` JSON,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$i` INT DEFAULT 0;
    DECLARE `$animal_count` INT;
    DECLARE `$feedname` VARCHAR(100);
    
    START TRANSACTION;
    
    -- Get feed name for audit narration
    IF `$feed_source_type` = 'Feed' THEN
        SELECT `itemname` INTO `$feedname` FROM `inventoryitems` WHERE `id` = `$feed_id`;
    ELSE
        SELECT `feedname` INTO `$feedname` FROM `feedmix` WHERE `id` = `$feed_id`;
    END IF;
    
    IF `$id` = 0 THEN
        INSERT INTO `feedinglogs` (
            `logdate`, `shiftid`, `penid`, `feed_source_type`, `feed_id`, `feedtype`, `quantitykg`, `notes`, `addedby`, `dateadded`
        ) VALUES (
            `$logdate`, `$shiftid`, `$penid`, `$feed_source_type`, `$feed_id`, `$feedname`, `$quantitykg`, `$notes`, `$userid`, NOW()
        );
        SET `$id` = LAST_INSERT_ID();
        
        -- Audit Trail for Insert
        SET `$updatedvalues` = JSON_OBJECT(
            'id', `$id`, 
            'logdate', `$logdate`, 
            'shiftid', `$shiftid`, 
            'penid', `$penid`, 
            'feed_source_type', `$feed_source_type`,
            'feed_id', `$feed_id`,
            'feedname', `$feedname`,
            'quantitykg', `$quantitykg`
        );
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Logged feeding session (', `$feed_source_type`, ': ', `$feedname`, ') for Pen ID: ', `$penid`), `$platform`, `$updatedvalues`);
    ELSE
        UPDATE `feedinglogs` SET
            `logdate` = `$logdate`,
            `shiftid` = `$shiftid`,
            `penid` = `$penid`,
            `feed_source_type` = `$feed_source_type`,
            `feed_id` = `$feed_id`,
            `feedtype` = `$feedname`,
            `quantitykg` = `$quantitykg`,
            `notes` = `$notes`
        WHERE `id` = `$id`;
        
        -- Clear existing animal associations for update
        DELETE FROM `feedingloganimals` WHERE `logid` = `$id`;
    END IF;

    -- Process Animals JSON
    IF `$animalsjson` IS NOT NULL AND JSON_TYPE(`$animalsjson`) = 'ARRAY' THEN
        SET `$animal_count` = JSON_LENGTH(`$animalsjson`);
        WHILE `$i` < `$animal_count` DO
            INSERT INTO `feedingloganimals` (`logid`, `animalid`) 
            VALUES (`$id`, JSON_UNQUOTE(JSON_EXTRACT(`$animalsjson`, CONCAT('$[', `$i`, ']'))));
            SET `$i` = `$i` + 1;
        END WHILE;
    END IF;
    
    COMMIT;
    SELECT `$id` AS `logid`;
END$$

-- 3. Procedure to get feeding logs with source type and names
DROP PROCEDURE IF EXISTS `sp_getfeedinglogs`$$
CREATE PROCEDURE `sp_getfeedinglogs`()
BEGIN
    SELECT 
        f.*, 
        s.shiftname, 
        p.penname, 
        'Completed' as status,
        CASE 
            WHEN f.feed_source_type = 'Feed' THEN (SELECT itemname FROM inventoryitems WHERE id = f.feed_id)
            WHEN f.feed_source_type = 'Ration' THEN (SELECT feedname FROM feedmix WHERE id = f.feed_id)
            ELSE f.feedtype 
        END as feed_display_name,
        (SELECT COUNT(*) FROM feedingloganimals WHERE logid = f.id) as animal_count
    FROM feedinglogs f
    LEFT JOIN feedingshifts s ON f.shiftid = s.id
    LEFT JOIN pens p ON f.penid = p.id
    WHERE f.deleted = 0
    ORDER BY f.logdate DESC, f.id DESC;
END$$

-- 4. Procedure to get animals for a specific log
DROP PROCEDURE IF EXISTS `sp_getfeedingloganimals`$$
CREATE PROCEDURE `sp_getfeedingloganimals`(IN `$logid` INT)
BEGIN
    SELECT a.*, b.breedname, p.penname
    FROM feedingloganimals fla
    JOIN animals a ON fla.animalid = a.id
    LEFT JOIN breeds b ON a.breedid = b.id
    LEFT JOIN pens p ON a.penid = p.id
    WHERE fla.logid = `$logid`;
END$$

DELIMITER ;
