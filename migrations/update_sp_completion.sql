DELIMITER $$

-- 2. SP to save multiple vaccination records (Batch Recording) and Mark Schedule Complete
DROP PROCEDURE IF EXISTS `sp_record_bulk_vaccination`$$
CREATE PROCEDURE `sp_record_bulk_vaccination`(
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
    DECLARE `$rec_type` VARCHAR(20) DEFAULT 'Scheduled';
    
    SET `$count` = JSON_LENGTH(`$animalids`);
    
    IF `$scheduleid` = 0 THEN
        SET `$rec_type` = 'Routine';
    END IF;
    
    WHILE i < `$count` DO
        SET `$animalid` = JSON_UNQUOTE(JSON_EXTRACT(`$animalids`, CONCAT('$[', i, ']')));
        
        INSERT INTO `vaccinations` (
            `animalid`, `scheduleid`, `vaccinationdate`, `productused`, `batchno`, `dosage`, `administeredby`, `notes`, `record_type`, `addedby`
        ) VALUES (
            `$animalid`, `$scheduleid`, `$vaccinationdate`, `$productused`, `$batchno`, `$dosage`, `$administeredby`, `$notes`, `$rec_type`, `$userid`
        );
        
        SET i = i + 1;
    END WHILE;

    -- Mark schedule as completed if applicable
    IF `$scheduleid` > 0 THEN
        UPDATE `vaccinationschedules` SET `status` = 'Completed' WHERE `id` = `$scheduleid`;
    END IF;
END$$

-- 3. SP to save multiple deworming records (Batch Recording) and Mark Schedule Complete
DROP PROCEDURE IF EXISTS `sp_record_bulk_deworming`$$
CREATE PROCEDURE `sp_record_bulk_deworming`(
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
    DECLARE `$rec_type` VARCHAR(20) DEFAULT 'Scheduled';
    
    SET `$count` = JSON_LENGTH(`$animalids`);

    IF `$scheduleid` = 0 THEN
        SET `$rec_type` = 'Routine';
    END IF;
    
    WHILE i < `$count` DO
        SET `$animalid` = JSON_UNQUOTE(JSON_EXTRACT(`$animalids`, CONCAT('$[', i, ']')));
        
        INSERT INTO `deworming` (
            `animalid`, `scheduleid`, `dewormingdate`, `productused`, `dosage`, `method`, `administeredby`, `notes`, `record_type`, `addedby`
        ) VALUES (
            `$animalid`, `$scheduleid`, `$dewormingdate`, `$productused`, `$dosage`, `$method`, `$administeredby`, `$notes`, `$rec_type`, `$userid`
        );
        
        SET i = i + 1;
    END WHILE;

    -- Mark schedule as completed if applicable
    IF `$scheduleid` > 0 THEN
        UPDATE `dewormingschedules` SET `status` = 'Completed' WHERE `id` = `$scheduleid`;
    END IF;
END$$

DELIMITER ;
