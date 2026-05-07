USE farm;

DROP PROCEDURE IF EXISTS `sp_saveinsurancecompany`;
DELIMITER //
CREATE PROCEDURE `sp_saveinsurancecompany`(
    IN `$id` INT,
    IN `$registrationno` VARCHAR(50),
    IN `$companyname` VARCHAR(100),
    IN `$contacts` VARCHAR(255),
    IN `$contactperson` VARCHAR(100),
    IN `$email` VARCHAR(100),
    IN `$address` TEXT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(50)
)
BEGIN
    DECLARE v_action VARCHAR(50);
    
    IF `$id` = 0 THEN
        INSERT INTO `insurancecompanies` (`registrationno`, `companyname`, `contacts`, `contactperson`, `email`, `address`, `created_by`)
        VALUES (`$registrationno`, `$companyname`, `$contacts`, `$contactperson`, `$email`, `$address`, `$userid`);
        SET `$id` = LAST_INSERT_ID();
        SET v_action = 'CREATE INSURANCE COMPANY';
    ELSE
        UPDATE `insurancecompanies` 
        SET `registrationno` = `$registrationno`,
            `companyname` = `$companyname`,
            `contacts` = `$contacts`,
            `contactperson` = `$contactperson`,
            `email` = `$email`,
            `address` = `$address`
        WHERE `id` = `$id`;
        SET v_action = 'UPDATE INSURANCE COMPANY';
    END IF;
    
    INSERT INTO `audittrail` (`userid`, `activity`, `platform`)
    VALUES (`$userid`, CONCAT(v_action, ': ', `$companyname`, ' (', `$registrationno`, ')'), `$platform`);
    
    SELECT `$id` AS insuranceid;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS `sp_deleteinsurancecompany`;
DELIMITER //
CREATE PROCEDURE `sp_deleteinsurancecompany`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(50)
)
BEGIN
    DECLARE v_companyname VARCHAR(100);
    SELECT `companyname` INTO v_companyname FROM `insurancecompanies` WHERE `id` = `$id`;
    
    UPDATE `insurancecompanies` SET `isactive` = 0 WHERE `id` = `$id`;
    
    INSERT INTO `audittrail` (`userid`, `activity`, `platform`)
    VALUES (`$userid`, CONCAT('DELETE INSURANCE COMPANY: ', v_companyname), `$platform`);
END //
DELIMITER ;
