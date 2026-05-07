-- Setup for recording vaccination and deworming activities based on schedules

-- 1. Ensure vaccinations and deworming tables are aligned with the UI requirements
-- These tables were already defined in tables.sql, but we ensure they have batch tracking

ALTER TABLE `vaccinations` 
ADD COLUMN `notes` TEXT AFTER `administeredby`,
ADD COLUMN `record_type` ENUM('Scheduled', 'Routine', 'Emergency') DEFAULT 'Scheduled' AFTER `notes`;

ALTER TABLE `deworming`
ADD COLUMN `notes` TEXT AFTER `administeredby`,
ADD COLUMN `record_type` ENUM('Scheduled', 'Routine', 'Emergency') DEFAULT 'Scheduled' AFTER `notes`;

DELIMITER $$

-- 2. SP to save multiple vaccination records (Batch Recording)
DROP PROCEDURE IF EXISTS `sp_recordbulkvaccination`$$
CREATE PROCEDURE `sp_recordbulkvaccination`(
    IN `$scheduleid` INT,
    IN `$animalids` JSON, -- Array of animal IDs
    IN `$vaccinationdate` DATE,
    IN `$productused` VARCHAR(100),
    IN `$batchno` VARCHAR(50),
    IN `$dosage` VARCHAR(50),
    IN `$administeredby` VARCHAR(100),
    IN `$notes` TEXT,
    IN `$userid` INT
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE `$animalid` INT;
    DECLARE `$count` INT;
    
    SET `$count` = JSON_LENGTH(`$animalids`);
    
    WHILE i < `$count` DO
        SET `$animalid` = JSON_EXTRACT(`$animalids`, CONCAT('$[', i, ']'));
        
        INSERT INTO `vaccinations` (
            `animalid`, `scheduleid`, `vaccinationdate`, `productused`, `batchno`, `dosage`, `administeredby`, `notes`, `record_type`, `addedby`
        ) VALUES (
            `$animalid`, `$scheduleid`, `$vaccinationdate`, `$productused`, `$batchno`, `$dosage`, `$administeredby`, `$notes`, 'Scheduled', `$userid`
        );
        
        SET i = i + 1;
    END WHILE;
END$$

-- 3. SP to save multiple deworming records (Batch Recording)
DROP PROCEDURE IF EXISTS `sp_recordbulkdeworming`$$
CREATE PROCEDURE `sp_recordbulkdeworming`(
    IN `$scheduleid` INT,
    IN `$animalids` JSON,
    IN `$dewormingdate` DATE,
    IN `$productused` VARCHAR(100),
    IN `$dosage` VARCHAR(50),
    IN `$method` VARCHAR(50),
    IN `$administeredby` VARCHAR(100),
    IN `$notes` TEXT,
    IN `$userid` INT
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE `$animalid` INT;
    DECLARE `$count` INT;
    
    SET `$count` = JSON_LENGTH(`$animalids`);
    
    WHILE i < `$count` DO
        SET `$animalid` = JSON_EXTRACT(`$animalids`, CONCAT('$[', i, ']'));
        
        INSERT INTO `deworming` (
            `animalid`, `scheduleid`, `dewormingdate`, `productused`, `dosage`, `method`, `administeredby`, `notes`, `record_type`, `addedby`
        ) VALUES (
            `$animalid`, `$scheduleid`, `$dewormingdate`, `$productused`, `$dosage`, `$method`, `$administeredby`, `$notes`, 'Scheduled', `$userid`
        );
        
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;
