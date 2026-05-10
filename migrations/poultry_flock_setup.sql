-- Jukam Poultry Management System - Flock Management Migration
-- File: migrations/poultry_flock_setup.sql

SET FOREIGN_KEY_CHECKS = 0;

-- 1. Create Poultry Flocks Table
CREATE TABLE IF NOT EXISTS `poultryflocks` (
    `flockid` INT AUTO_INCREMENT PRIMARY KEY,
    `flockno` VARCHAR(50) NOT NULL UNIQUE,
    `flockname` VARCHAR(100) NOT NULL,
    `birdtypeid` INT NOT NULL,
    `stageid` INT NOT NULL,
    `breedid` INT NOT NULL,
    `source` VARCHAR(50) DEFAULT 'supplier',
    `arrivaldate` DATE NOT NULL,
    `initialcount` INT NOT NULL,
    `currentcount` INT NOT NULL,
    `houseid` INT NOT NULL,
    `notes` TEXT,
    `status` VARCHAR(50) DEFAULT 'Active',
    `addedby` INT,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT,
    `datedeleted` DATETIME,
    `reasondeleted` TEXT,
    `createdat` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `fk_flock_birdtype` FOREIGN KEY (`birdtypeid`) REFERENCES `poultrybirdtypes`(`typeid`),
    CONSTRAINT `fk_flock_stage` FOREIGN KEY (`stageid`) REFERENCES `poultryflockstages`(`stageid`),
    CONSTRAINT `fk_flock_breed` FOREIGN KEY (`breedid`) REFERENCES `poultrybreeds`(`breedid`),
    CONSTRAINT `fk_flock_house` FOREIGN KEY (`houseid`) REFERENCES `poultryhouses`(`houseid`),
    CONSTRAINT `fk_flock_addedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 2. Create Flock Vaccination Schedule Table
CREATE TABLE IF NOT EXISTS `poultry_flock_vaccination_schedule` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `flockid` INT NOT NULL,
    `diseaseid` INT NOT NULL,
    `scheduledate` DATE NOT NULL,
    `status` VARCHAR(50) DEFAULT 'Pending',
    `narration` TEXT,
    `addedby` INT,
    `createdat` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    CONSTRAINT `fk_vax_flock` FOREIGN KEY (`flockid`) REFERENCES `poultryflocks`(`flockid`),
    CONSTRAINT `fk_vax_disease` FOREIGN KEY (`diseaseid`) REFERENCES `poultrydiseases`(`diseaseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 3. Initialize Serials for Poultry Flock
INSERT INTO `serials` (`document`, `prefix`, `currentno`, `addedby`) 
VALUES ('Poultry Flock', 'FL-{{year}}-', 1, 5)
ON DUPLICATE KEY UPDATE `prefix` = 'FL-{{year}}-';

DELIMITER $$

-- 4. Function to generate the next Flock ID
DROP FUNCTION IF EXISTS `fn_generateflockid`$$
CREATE FUNCTION `fn_generateflockid`() RETURNS VARCHAR(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    READS SQL DATA
BEGIN
    DECLARE $prefix VARCHAR(50);
    DECLARE $currentno INT;
    DECLARE $year VARCHAR(4);
    DECLARE $final_prefix VARCHAR(50);
    DECLARE $formatted_no VARCHAR(10);

    SELECT `prefix`, `currentno` INTO $prefix, $currentno 
    FROM `serials` WHERE `document` = 'Poultry Flock';
    
    SET $year = YEAR(CURDATE());
    SET $final_prefix = REPLACE($prefix, '{{year}}', $year);
    SET $formatted_no = LPAD($currentno, 3, '0');
    
    RETURN CONCAT($final_prefix, $formatted_no);
END$$

-- 5. Stored Procedure to save flock and generate schedule
DROP PROCEDURE IF EXISTS `sp_savepoultryflock`$$
CREATE PROCEDURE `sp_savepoultryflock`(
    IN `$id` INT,
    IN `$flockno` VARCHAR(50),
    IN `$flockname` VARCHAR(100),
    IN `$birdtypeid` INT,
    IN `$stageid` INT,
    IN `$breedid` INT,
    IN `$source` VARCHAR(50),
    IN `$arrivaldate` DATE,
    IN `$initialcount` INT,
    IN `$houseid` INT,
    IN `$notes` TEXT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000),
    IN `$generate_vax` TINYINT(1)
)
BEGIN
    DECLARE `$generated_flockno` VARCHAR(50);
    DECLARE `$actual_flockid` INT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    IF `$id` = 0 THEN
        -- Check for duplicate Flock ID if manual entry
        IF `$flockno` != '[AUTO]' AND `$flockno` != '' THEN
            IF EXISTS (SELECT 1 FROM `poultryflocks` WHERE `flockno` = `$flockno` AND `deleted` = 0) THEN
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate Flock ID: The provided Flock ID is already in use.';
            END IF;
        END IF;

        -- Handle Auto-ID
        IF `$flockno` = '[AUTO]' OR `$flockno` = '' THEN
            SET `$generated_flockno` = fn_generateflockid();
            -- Update serials
            UPDATE `serials` SET `currentno` = `currentno` + 1 WHERE `document` = 'Poultry Flock';
        ELSE
            SET `$generated_flockno` = `$flockno`;
        END IF;

        INSERT INTO `poultryflocks` (
            `flockno`, `flockname`, `birdtypeid`, `stageid`, `breedid`, 
            `source`, `arrivaldate`, `initialcount`, `currentcount`, `houseid`, `notes`, `addedby`
        ) VALUES (
            `$generated_flockno`, `$flockname`, `$birdtypeid`, `$stageid`, `$breedid`, 
            `$source`, `$arrivaldate`, `$initialcount`, `$initialcount`, `$houseid`, `$notes`, `$userid`
        );
        
        SET `$actual_flockid` = LAST_INSERT_ID();

        -- Create Vaccination Schedule based on bird type protocols (ONLY IF REQUESTED)
        IF `$generate_vax` = 1 THEN
            INSERT INTO `poultry_flock_vaccination_schedule` (`flockid`, `diseaseid`, `scheduledate`, `narration`, `addedby`)
            SELECT 
                `$actual_flockid`, 
                `diseaseid`, 
                DATE_ADD(`$arrivaldate`, INTERVAL `minage` DAY), 
                `narration`, 
                `$userid`
            FROM `poultry_birdtype_vaccinations`
            WHERE `birdtypeid` = `$birdtypeid` AND `deleted` = 0;
        END IF;

        -- Audit Trail
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Registered Poultry Flock: ', `$generated_flockno`), `$platform`, 
                JSON_OBJECT('flockid', `$actual_flockid`, 'flockno', `$generated_flockno`, 'name', `$flockname`));
    ELSE
        -- Update existing flock (optional for now, but good to have)
        UPDATE `poultryflocks` SET 
            `flockname` = `$flockname`,
            `stageid` = `$stageid`,
            `houseid` = `$houseid`,
            `notes` = `$notes`
        WHERE `flockid` = `$id`;
        
        SET `$actual_flockid` = `$id`;
        
        -- Audit Trail
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
        VALUES (NOW(), `$userid`, 'Update', CONCAT('Updated Poultry Flock ID: ', `$id`), `$platform`, 
                JSON_OBJECT('flockid', `$id`, 'name', `$flockname`));
    END IF;

    COMMIT;
    
    SELECT `$actual_flockid` AS flockid, `$generated_flockno` AS flockno;
END$$

DELIMITER ;

SET FOREIGN_KEY_CHECKS = 1;

-- 6. Create Poultry Mortality Table
CREATE TABLE IF NOT EXISTS `poultry_mortality` (
    `mortalityid` INT AUTO_INCREMENT PRIMARY KEY,
    `flockid` INT NOT NULL,
    `mortalitydate` DATE NOT NULL,
    `count` INT NOT NULL,
    `reason` VARCHAR(100),
    `notes` TEXT,
    `addedby` INT,
    `createdat` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    CONSTRAINT `fk_mortality_flock` FOREIGN KEY (`flockid`) REFERENCES `poultryflocks`(`flockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DELIMITER $$

-- 7. Stored Procedure to save mortality and update flock count
DROP PROCEDURE IF EXISTS `sp_savepoultrymortality`$$
CREATE PROCEDURE `sp_savepoultrymortality`(
    IN `$flockno` VARCHAR(50),
    IN `$mortalitydate` DATE,
    IN `$count` INT,
    IN `$reason` VARCHAR(100),
    IN `$notes` TEXT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$actual_flockid` INT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Get actual flock ID from flockno
    SELECT `flockid` INTO `$actual_flockid` FROM `poultryflocks` WHERE `flockno` = `$flockno` AND `deleted` = 0;
    
    IF `$actual_flockid` IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Flock ID: The provided Flock ID does not exist.';
    END IF;

    -- Insert mortality record
    INSERT INTO `poultry_mortality` (
        `flockid`, `mortalitydate`, `count`, `reason`, `notes`, `addedby`
    ) VALUES (
        `$actual_flockid`, `$mortalitydate`, `$count`, `$reason`, `$notes`, `$userid`
    );

    -- Update current count in flock table
    UPDATE `poultryflocks` 
    SET `currentcount` = `currentcount` - `$count` 
    WHERE `flockid` = `$actual_flockid`;

    -- Audit Trail
    INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
    VALUES (NOW(), `$userid`, 'Insert', CONCAT('Recorded Mortality for Flock: ', `$flockno`, ' (Count: ', `$count`, ')'), `$platform`, 
            JSON_OBJECT('flockno', `$flockno`, 'count', `$count`, 'reason', `$reason`));

    COMMIT;
END$$

DELIMITER ;
