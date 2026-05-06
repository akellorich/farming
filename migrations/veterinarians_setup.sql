-- VETERINARIANS MANAGEMENT SYSTEM FOR JUKAM DAIRY
-- Create table and CRUD operations

SET FOREIGN_KEY_CHECKS = 0;

-- 1. Table Structure
CREATE TABLE IF NOT EXISTS `veterinarians` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `regno` VARCHAR(50) NOT NULL UNIQUE,
    `vetname` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(20) NOT NULL,
    `email` VARCHAR(100),
    `specialization` VARCHAR(100),
    `status` VARCHAR(20) DEFAULT 'Active',
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT NULL,
    `datedeleted` DATETIME NULL,
    `reasondeleted` TEXT NULL,
    CONSTRAINT `fkvetsaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkvetsdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 2. Seed Data
INSERT INTO `veterinarians` (`regno`, `vetname`, `phone`, `email`, `specialization`, `addedby`) VALUES 
('KVB-2021-001', 'Dr. John Kamau', '0711222333', 'j.kamau@vetcare.co.ke', 'Large Animal Surgery', 5),
('KVB-2022-045', 'Dr. Sarah Wambui', '0722333444', 's.wambui@farmvets.com', 'Bovine Reproduction', 5),
('KVB-2023-012', 'Dr. Michael Okoth', '0733444555', 'm.okoth@dairyhealth.org', 'Nutritional Medicine', 5),
('TECH-101', 'Alex Mwangi (Paravet)', '0744555666', 'a.mwangi@farm.co.ke', 'Routine Care', 5);

-- 3. Update healthlogs table to use veterinarianid
ALTER TABLE `healthlogs` ADD COLUMN `veterinarianid` INT NULL AFTER `status`;
ALTER TABLE `healthlogs` ADD CONSTRAINT `fkhealthvet` FOREIGN KEY (`veterinarianid`) REFERENCES `veterinarians`(`id`);

DELIMITER $$

-- 4. CRUD: Get All Veterinarians
DROP PROCEDURE IF EXISTS `sp_getveterinarians`$$
CREATE PROCEDURE `sp_getveterinarians`()
BEGIN
    SELECT * FROM `veterinarians` WHERE `deleted` = 0 ORDER BY `vetname` ASC;
END$$

-- 5. CRUD: Save Veterinarian (Insert/Update)
DROP PROCEDURE IF EXISTS `sp_saveveterinarian`$$
CREATE PROCEDURE `sp_saveveterinarian`(
    IN `$id` INT,
    IN `$regno` VARCHAR(50),
    IN `$vetname` VARCHAR(100),
    IN `$phone` VARCHAR(20),
    IN `$email` VARCHAR(100),
    IN `$specialization` VARCHAR(100),
    IN `$status` VARCHAR(20),
    IN `$autogenerate` TINYINT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    IF `$id` = 0 THEN
        IF `$autogenerate` = 1 THEN
            SET `$regno` = fn_generatevetregno();
            UPDATE `serials` SET `currentno` = `currentno` + 1 WHERE `document` = 'Veterinarian Registration';
        END IF;
        
        INSERT INTO `veterinarians` (`regno`, `vetname`, `phone`, `email`, `specialization`, `status`, `addedby`)
        VALUES (`$regno`, `$vetname`, `$phone`, `$email`, `$specialization`, `$status`, `$userid`);
        SET `$id` = LAST_INSERT_ID();
    ELSE
        UPDATE `veterinarians` 
        SET `regno` = `$regno`, `vetname` = `$vetname`, `phone` = `$phone`, `email` = `$email`, 
            `specialization` = `$specialization`, `status` = `$status`
        WHERE `id` = `$id`;
    END IF;
    
    SELECT `$id` AS `vetid`, `$regno` AS `regno`;
END$$

-- 6. CRUD: Delete Veterinarian
DROP PROCEDURE IF EXISTS `sp_deleteveterinarian`$$
CREATE PROCEDURE `sp_deleteveterinarian`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$reason` TEXT
)
BEGIN
    UPDATE `veterinarians` 
    SET `deleted` = 1, `deletedby` = `$userid`, `datedeleted` = NOW(), `reasondeleted` = `$reason`
    WHERE `id` = `$id`;
END$$

-- 7. Update health record save procedure to include veterinarianid
DROP PROCEDURE IF EXISTS `sp_savehealthlog`$$
CREATE PROCEDURE `sp_savehealthlog`(
    IN `$id` INT,
    IN `$logdate` DATE,
    IN `$animalid` INT,
    IN `$diseaseid` INT,
    IN `$diagnosis` VARCHAR(255),
    IN `$treatment` TEXT,
    IN `$narration` TEXT,
    IN `$status` VARCHAR(50),
    IN `$veterinarianid` INT,
    IN `$nextfollowup` DATE,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$tagid` VARCHAR(50);
    
    START TRANSACTION;
    
    SELECT `tagid` INTO `$tagid` FROM `animals` WHERE `id` = `$animalid`;
    
    IF `$id` = 0 THEN
        INSERT INTO `healthlogs` (
            `logdate`, `animalid`, `diseaseid`, `diagnosis`, `treatment`, `narration`, `status`, `veterinarianid`, `nextfollowup`, `addedby`, `dateadded`, `deleted`
        )
        VALUES (
            `$logdate`, `$animalid`, `$diseaseid`, `$diagnosis`, `$treatment`, `$narration`, `$status`, `$veterinarianid`, `$nextfollowup`, `$userid`, NOW(), 0
        );
        
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, ',"animalid":', `$animalid`, ',"diseaseid":', IFNULL(`$diseaseid`, 'null'), ',"status":"', `$status`, '"}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`
        )
        VALUES (
            NOW(), `$userid`, 'Insert', CONCAT('Logged health record for animal: ', `$tagid`), `$platform`, `$updatedvalues`
        );
    ELSE
        SELECT CONCAT(
            '{"id":', `id`, ',"animalid":', `animalid`, ',"diseaseid":', IFNULL(`diseaseid`, 'null'), ',"status":"', `status`, '"}'
        ) INTO `$originalvalues`
        FROM `healthlogs` WHERE `id` = `$id`;
        
        UPDATE `healthlogs` 
        SET `logdate` = `$logdate`, 
            `animalid` = `$animalid`, 
            `diseaseid` = `$diseaseid`, 
            `diagnosis` = `$diagnosis`, 
            `treatment` = `$treatment`, 
            `narration` = `$narration`, 
            `status` = `$status`, 
            `veterinarianid` = `$veterinarianid`, 
            `nextfollowup` = `$nextfollowup`
        WHERE `id` = `$id`;
        
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, ',"animalid":', `$animalid`, ',"diseaseid":', IFNULL(`$diseaseid`, 'null'), ',"status":"', `$status`, '"}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`
        )
        VALUES (
            NOW(), `$userid`, 'Update', CONCAT('Updated health record for animal: ', `$tagid`), `$platform`, `$originalvalues`, `$updatedvalues`
        );
    END IF;
    
    COMMIT;
    SELECT `$id` AS `logid`;
END$$

DELIMITER ;

SET FOREIGN_KEY_CHECKS = 1;
