-- ADD AVERAGE MILKING COLUMN TO BREEDS TABLE
ALTER TABLE `breeds` ADD COLUMN `avgmilking` DECIMAL(10,2) DEFAULT 0.00 AFTER `isindigenous`;
ALTER TABLE `breeds` ADD COLUMN `icon` VARCHAR(50) DEFAULT 'stars' AFTER `avgmilking`;

DELIMITER $$

-- UPDATE sp_savebreed to include avgmilking
DROP PROCEDURE IF EXISTS `sp_savebreed`$$
CREATE PROCEDURE `sp_savebreed`(
    IN `$id` INT,
    IN `$breedname` VARCHAR(100),
    IN `$originid` INT,
    IN `$characteristics` TEXT,
    IN `$isindigenous` TINYINT(1),
    IN `$avgmilking` DECIMAL(10,2),
    IN `$icon` VARCHAR(50),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        -- Insert new breed
        INSERT INTO `breeds` (
            `breedname`, 
            `originid`, 
            `characteristics`, 
            `isindigenous`, 
            `avgmilking`,
            `icon`,
            `addedby`, 
            `dateadded`, 
            `deleted`
        )
        VALUES (
            `$breedname`, 
            `$originid`, 
            `$characteristics`, 
            `$isindigenous`, 
            `$avgmilking`,
            `$icon`,
            `$userid`, 
            NOW(), 
            0
        );
        
        SET `$id` = LAST_INSERT_ID();
        
        -- Audit Trail for Insert
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, 
            ',"breedname":"', `$breedname`, 
            '","originid":', IFNULL(`$originid`, 'null'), 
            ',"isindigenous":', `$isindigenous`, 
            ',"avgmilking":', `$avgmilking`,
            '}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, 
            `userid`, 
            `operation`, 
            `narration`, 
            `platform`, 
            `updatedvalues`
        )
        VALUES (
            NOW(), 
            `$userid`, 
            'Insert', 
            CONCAT('Created new breed: ', `$breedname`), 
            `$platform`, 
            `$updatedvalues`
        );
    ELSE
        -- Capture original values for audit trail before update
        SELECT CONCAT(
            '{"id":', `id`, 
            ',"breedname":"', `breedname`, 
            '","originid":', IFNULL(`originid`, 'null'), 
            ',"isindigenous":', `isindigenous`, 
            ',"avgmilking":', `avgmilking`,
            ',"icon":"', IFNULL(`icon`, ''),
            '"}'
        ) INTO `$originalvalues`
        FROM `breeds` 
        WHERE `id` = `$id`;
        
        -- Update existing breed
        UPDATE `breeds` 
        SET `breedname` = `$breedname`, 
            `originid` = `$originid`, 
            `characteristics` = `$characteristics`, 
            `isindigenous` = `$isindigenous`,
            `avgmilking` = `$avgmilking`,
            `icon` = `$icon`
        WHERE `id` = `$id`;
        
        -- Audit Trail for Update
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, 
            ',"breedname":"', `$breedname`, 
            '","originid":', IFNULL(`$originid`, 'null'), 
            ',"isindigenous":', `$isindigenous`, 
            ',"avgmilking":', `$avgmilking`,
            '}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, 
            `userid`, 
            `operation`, 
            `narration`, 
            `platform`, 
            `originalvalues`, 
            `updatedvalues`
        )
        VALUES (
            NOW(), 
            `$userid`, 
            'Update', 
            CONCAT('Updated breed: ', `$breedname`), 
            `$platform`, 
            `$originalvalues`, 
            `$updatedvalues`
        );
    END IF;
    
    COMMIT;
    
    -- Return the ID of the saved breed
    SELECT `$id` AS `breedid`;
END$$

-- UPDATE sp_getbreeds to include calculated metrics
DROP PROCEDURE IF EXISTS `sp_getbreeds`$$
CREATE PROCEDURE `sp_getbreeds`()
BEGIN
    SELECT 
        b.*, 
        c.`countryname`, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`,
        -- Calculate Total Population
        IFNULL(p.`totalcount`, 0) AS `totalcount`,
        -- Calculate Average Actual Milking
        IFNULL(m.`avg_actual_milking`, 0) AS `avg_actual_milking`,
        -- Calculate Efficiency: (Average Actual / Breed Potential) * 100
        CASE 
            WHEN b.`avgmilking` > 0 THEN ROUND((IFNULL(m.`avg_actual_milking`, 0) / b.`avgmilking`) * 100, 0)
            ELSE 0 
        END AS `efficiency`,
        -- Calculate Health Index (Mock calculation based on health logs)
        -- In a real scenario, this would be more complex
        IFNULL(h.`health_score`, 100) AS `health_index`,
        CASE 
            WHEN IFNULL(h.`health_score`, 100) >= 90 THEN 'OPTIMAL'
            WHEN IFNULL(h.`health_score`, 100) >= 70 THEN 'GOOD'
            ELSE 'ATTENTION'
        END AS `health_status`
    FROM `breeds` b
    LEFT JOIN `countries` c ON b.`originid` = c.`id`
    LEFT JOIN `user` u ON b.`addedby` = u.`userid`
    -- Population Join
    LEFT JOIN (
        SELECT `breedid`, COUNT(*) AS `totalcount` 
        FROM `animals` 
        WHERE `deleted` = 0 AND `status` = 'Active'
        GROUP BY `breedid`
    ) p ON b.`id` = p.`breedid`
    -- Milking Join (Last 30 days average)
    LEFT JOIN (
        SELECT a.`breedid`, AVG(mc.`quantitylitres`) AS `avg_actual_milking`
        FROM `milkcollection` mc
        JOIN `animals` a ON mc.`animalid` = a.`id`
        WHERE mc.`deleted` = 0 AND mc.`logdate` >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
        GROUP BY a.`breedid`
    ) m ON b.`id` = m.`breedid`
    -- Health Join (Simplified: 100 - (sick count / total count * 100))
    LEFT JOIN (
        SELECT 
            a.`breedid`, 
            ROUND(100 - (COUNT(DISTINCT hl.`animalid`) / COUNT(DISTINCT a.`id`) * 100), 0) AS `health_score`
        FROM `animals` a
        LEFT JOIN `healthlogs` hl ON a.`id` = hl.`animalid` AND hl.`deleted` = 0 AND hl.`logdate` >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
        WHERE a.`deleted` = 0 AND a.`status` = 'Active'
        GROUP BY a.`breedid`
    ) h ON b.`id` = h.`breedid`
    WHERE b.`deleted` = 0
    ORDER BY b.`breedname`;
END$$

-- UPDATE sp_getbreeddetails to include calculated metrics
DROP PROCEDURE IF EXISTS `sp_getbreeddetails`$$
CREATE PROCEDURE `sp_getbreeddetails`(
    IN `$id` INT
)
BEGIN
    SELECT 
        b.*, 
        c.`countryname`, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`,
        -- Calculate Total Population
        IFNULL(p.`totalcount`, 0) AS `totalcount`,
        -- Calculate Average Actual Milking
        IFNULL(m.`avg_actual_milking`, 0) AS `avg_actual_milking`,
        -- Calculate Efficiency: (Average Actual / Breed Potential) * 100
        CASE 
            WHEN b.`avgmilking` > 0 THEN ROUND((IFNULL(m.`avg_actual_milking`, 0) / b.`avgmilking`) * 100, 0)
            ELSE 0 
        END AS `efficiency`,
        -- Calculate Health Index
        IFNULL(h.`health_score`, 100) AS `health_index`,
        CASE 
            WHEN IFNULL(h.`health_score`, 100) >= 90 THEN 'OPTIMAL'
            WHEN IFNULL(h.`health_score`, 100) >= 70 THEN 'GOOD'
            ELSE 'ATTENTION'
        END AS `health_status`
    FROM `breeds` b
    LEFT JOIN `countries` c ON b.`originid` = c.`id`
    LEFT JOIN `user` u ON b.`addedby` = u.`userid`
    -- Population Join
    LEFT JOIN (
        SELECT `breedid`, COUNT(*) AS `totalcount` 
        FROM `animals` 
        WHERE `deleted` = 0 AND `status` = 'Active'
        GROUP BY `breedid`
    ) p ON b.`id` = p.`breedid`
    -- Milking Join (Last 30 days average)
    LEFT JOIN (
        SELECT a.`breedid`, AVG(mc.`quantitylitres`) AS `avg_actual_milking`
        FROM `milkcollection` mc
        JOIN `animals` a ON mc.`animalid` = a.`id`
        WHERE mc.`deleted` = 0 AND mc.`logdate` >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
        GROUP BY a.`breedid`
    ) m ON b.`id` = m.`breedid`
    -- Health Join
    LEFT JOIN (
        SELECT 
            a.`breedid`, 
            ROUND(100 - (COUNT(DISTINCT hl.`animalid`) / COUNT(DISTINCT a.`id`) * 100), 0) AS `health_score`
        FROM `animals` a
        LEFT JOIN `healthlogs` hl ON a.`id` = hl.`animalid` AND hl.`deleted` = 0 AND hl.`logdate` >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
        WHERE a.`deleted` = 0 AND a.`status` = 'Active'
        GROUP BY a.`breedid`
    ) h ON b.`id` = h.`breedid`
    WHERE b.`id` = `$id` 
    AND b.`deleted` = 0;
END$$

DELIMITER ;
