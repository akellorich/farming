-- Jukam Dairy Management System - Insurance Companies & Animal Insurance
-- File: migrations/insurance_setup.sql

-- 1. Create Insurance Companies Table
CREATE TABLE IF NOT EXISTS `insurancecompanies` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `registrationno` VARCHAR(50) NOT NULL UNIQUE,
    `companyname` VARCHAR(100) NOT NULL,
    `contacts` VARCHAR(255) DEFAULT NULL,
    `contactperson` VARCHAR(100) DEFAULT NULL,
    `email` VARCHAR(100) DEFAULT NULL,
    `address` TEXT DEFAULT NULL,
    `isactive` TINYINT(1) DEFAULT 1,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `created_by` INT DEFAULT NULL,
    INDEX (`companyname`),
    INDEX (`registrationno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Update Animals Table to include Insurance fields
-- First check if columns already exist (to allow re-running migration safely)
SET @dbname = DATABASE();
SET @tablename = 'animals';

SET @column_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @dbname AND table_name = @tablename AND column_name = 'is_insured');
SET @query = IF(@column_exists = 0, 'ALTER TABLE `animals` ADD COLUMN `is_insured` TINYINT(1) DEFAULT 0', 'SELECT 1');
PREPARE stmt FROM @query; EXECUTE stmt; DEALLOCATE PREPARE stmt;

SET @column_exists = (SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = @dbname AND table_name = @tablename AND column_name = 'insurance_company_id');
SET @query = IF(@column_exists = 0, 'ALTER TABLE `animals` ADD COLUMN `insurance_company_id` INT DEFAULT NULL', 'SELECT 1');
PREPARE stmt FROM @query; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- Add Foreign Key if it doesn't exist
SET @fk_exists = (SELECT COUNT(*) FROM information_schema.key_column_usage WHERE table_schema = @dbname AND table_name = @tablename AND column_name = 'insurance_company_id' AND referenced_table_name = 'insurancecompanies');
SET @query = IF(@fk_exists = 0, 'ALTER TABLE `animals` ADD CONSTRAINT `fk_animal_insurance` FOREIGN KEY (`insurance_company_id`) REFERENCES `insurancecompanies`(`id`) ON DELETE SET NULL', 'SELECT 1');
PREPARE stmt FROM @query; EXECUTE stmt; DEALLOCATE PREPARE stmt;

-- 3. Stored Procedures for Insurance Companies

DELIMITER //

CREATE PROCEDURE `sp_saveinsurancecompany` (
    IN p_id INT,
    IN p_registrationno VARCHAR(50),
    IN p_companyname VARCHAR(100),
    IN p_contacts VARCHAR(255),
    IN p_contactperson VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_address TEXT,
    IN p_userid INT,
    IN p_platform VARCHAR(50)
)
BEGIN
    DECLARE v_action VARCHAR(50);
    
    IF p_id = 0 THEN
        INSERT INTO `insurancecompanies` (`registrationno`, `companyname`, `contacts`, `contactperson`, `email`, `address`, `created_by`)
        VALUES (p_registrationno, p_companyname, p_contacts, p_contactperson, p_email, p_address, p_userid);
        SET p_id = LAST_INSERT_ID();
        SET v_action = 'CREATE INSURANCE COMPANY';
    ELSE
        UPDATE `insurancecompanies` 
        SET `registrationno` = p_registrationno,
            `companyname` = p_companyname,
            `contacts` = p_contacts,
            `contactperson` = p_contactperson,
            `email` = p_email,
            `address` = p_address
        WHERE `id` = p_id;
        SET v_action = 'UPDATE INSURANCE COMPANY';
    END IF;
    
    -- Log to audit trail
    INSERT INTO `audittrail` (`userid`, `activity`, `platform`)
    VALUES (p_userid, CONCAT(v_action, ': ', p_companyname, ' (', p_registrationno, ')'), p_platform);
    
    SELECT p_id AS insuranceid;
END //

CREATE PROCEDURE `sp_getinsurancecompanies` ()
BEGIN
    SELECT * FROM `insurancecompanies` WHERE `isactive` = 1 ORDER BY `companyname` ASC;
END //

CREATE PROCEDURE `sp_deleteinsurancecompany` (
    IN p_id INT,
    IN p_userid INT,
    IN p_platform VARCHAR(50)
)
BEGIN
    DECLARE v_companyname VARCHAR(100);
    SELECT `companyname` INTO v_companyname FROM `insurancecompanies` WHERE `id` = p_id;
    
    UPDATE `insurancecompanies` SET `isactive` = 0 WHERE `id` = p_id;
    
    -- Log to audit trail
    INSERT INTO `audittrail` (`userid`, `activity`, `platform`)
    VALUES (p_userid, CONCAT('DELETE INSURANCE COMPANY: ', v_companyname), p_platform);
END //

-- 4. Update sp_saveanimal to handle insurance fields
DROP PROCEDURE IF EXISTS `sp_saveanimal`;
CREATE PROCEDURE `sp_saveanimal` (
    IN p_id INT,
    IN p_tagid VARCHAR(50),
    IN p_designatedname VARCHAR(100),
    IN p_breedid INT,
    IN p_penid INT,
    IN p_damid INT,
    IN p_birthdate DATE,
    IN p_initialweight DECIMAL(10,2),
    IN p_registrationsource VARCHAR(50),
    IN p_purchaseprice DECIMAL(10,2),
    IN p_status VARCHAR(20),
    IN p_autogen TINYINT,
    IN p_is_insured TINYINT,
    IN p_insurance_company_id INT,
    IN p_userid INT,
    IN p_platform VARCHAR(50)
)
BEGIN
    DECLARE v_action VARCHAR(50);
    
    IF p_id = 0 THEN
        INSERT INTO `animals` (`tagid`, `designatedname`, `breedid`, `penid`, `damid`, `birthdate`, `initialweight`, `registrationsource`, `purchaseprice`, `status`, `is_insured`, `insurance_company_id`, `created_by`)
        VALUES (p_tagid, p_designatedname, p_breedid, p_penid, p_damid, p_birthdate, p_initialweight, p_registrationsource, p_purchaseprice, p_status, p_is_insured, p_insurance_company_id, p_userid);
        SET p_id = LAST_INSERT_ID();
        SET v_action = 'REGISTER ANIMAL';
    ELSE
        UPDATE `animals` 
        SET `tagid` = p_tagid,
            `designatedname` = p_designatedname,
            `breedid` = p_breedid,
            `penid` = p_penid,
            `damid` = p_damid,
            `birthdate` = p_birthdate,
            `initialweight` = p_initialweight,
            `registrationsource` = p_registrationsource,
            `purchaseprice` = p_purchaseprice,
            `status` = p_status,
            `is_insured` = p_is_insured,
            `insurance_company_id` = p_insurance_company_id
        WHERE `id` = p_id;
        SET v_action = 'UPDATE ANIMAL DETAILS';
    END IF;
    
    -- Log activity
    INSERT INTO `audittrail` (`userid`, `activity`, `platform`)
    VALUES (p_userid, CONCAT(v_action, ': ', p_tagid, ' (', p_designatedname, ')'), p_platform);
    
    SELECT p_id AS animalid;
END //

-- 5. Update sp_getanimals to return insurance info
DROP PROCEDURE IF EXISTS `sp_getanimals`;
CREATE PROCEDURE `sp_getanimals` ()
BEGIN
    SELECT a.*, b.breedname, p.penname, ic.companyname AS insurance_company
    FROM `animals` a
    LEFT JOIN `breeds` b ON a.breedid = b.id
    LEFT JOIN `pens` p ON a.penid = p.id
    LEFT JOIN `insurancecompanies` ic ON a.insurance_company_id = ic.id
    WHERE a.isactive = 1
    ORDER BY a.tagid ASC;
END //

DELIMITER ;
