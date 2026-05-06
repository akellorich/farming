-- FEEDING CRUD OPERATIONS FOR JUKAM DAIRY MANAGEMENT SYSTEM

DELIMITER $$

-- Table for tracking which animals were included in a feeding session
DROP TABLE IF EXISTS `feedingloganimals`$$
CREATE TABLE `feedingloganimals` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `logid` INT NOT NULL,
    `animalid` INT NOT NULL,
    CONSTRAINT `fk_feedinglog_master` FOREIGN KEY (`logid`) REFERENCES `feedinglogs`(`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_feedinglog_animal` FOREIGN KEY (`animalid`) REFERENCES `animals`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci$$

-- Procedure to save master feeding log with animals as JSON
DROP PROCEDURE IF EXISTS `sp_savefeedinglog`$$
CREATE PROCEDURE `sp_savefeedinglog`(
    IN `$id` INT,
    IN `$logdate` DATE,
    IN `$shiftid` INT,
    IN `$penid` INT,
    IN `$feedtype` VARCHAR(100),
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
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        INSERT INTO `feedinglogs` (
            `logdate`, `shiftid`, `penid`, `feedtype`, `quantitykg`, `notes`, `addedby`, `dateadded`
        ) VALUES (
            `$logdate`, `$shiftid`, `$penid`, `$feedtype`, `$quantitykg`, `$notes`, `$userid`, NOW()
        );
        SET `$id` = LAST_INSERT_ID();
        
        -- Audit Trail for Insert
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, 
            ',"logdate":"', `$logdate`, 
            '","shiftid":', IFNULL(`$shiftid`, 'null'), 
            ',"penid":', IFNULL(`$penid`, 'null'), 
            ',"feedtype":"', IFNULL(`$feedtype`, ''), 
            '","quantitykg":', `$quantitykg`, 
            '}'
        );
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Logged feeding session for Pen ID: ', `$penid`), `$platform`, `$updatedvalues`);
    ELSE
        UPDATE `feedinglogs` SET
            `logdate` = `$logdate`,
            `shiftid` = `$shiftid`,
            `penid` = `$penid`,
            `feedtype` = `$feedtype`,
            `quantitykg` = `$quantitykg`,
            `notes` = `$notes`
        WHERE `id` = `$id`;
        
        -- Clear existing animal associations for update
        DELETE FROM `feedingloganimals` WHERE `logid` = `$id`;
    END IF;

    -- Process Animals JSON
    SET `$animal_count` = JSON_LENGTH(`$animalsjson`);
    WHILE `$i` < `$animal_count` DO
        INSERT INTO `feedingloganimals` (`logid`, `animalid`) 
        VALUES (`$id`, JSON_UNQUOTE(JSON_EXTRACT(`$animalsjson`, CONCAT('$[', `$i`, ']'))));
        SET `$i` = `$i` + 1;
    END WHILE;
    
    COMMIT;
    SELECT `$id` AS `logid`;
END$$

-- Procedure to link animal to feeding log
DROP PROCEDURE IF EXISTS `sp_savefeedingloganimal`$$
CREATE PROCEDURE `sp_savefeedingloganimal`(
    IN `$logid` INT,
    IN `$animalid` INT
)
BEGIN
    -- Only insert if not already linked (to prevent duplicates if re-run)
    IF NOT EXISTS (SELECT 1 FROM `feedingloganimals` WHERE `logid` = `$logid` AND `animalid` = `$animalid`) THEN
        INSERT INTO `feedingloganimals` (`logid`, `animalid`) VALUES (`$logid`, `$animalid`);
    END IF;
END$$

DELIMITER ;
