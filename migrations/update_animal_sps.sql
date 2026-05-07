USE farm;

DROP PROCEDURE IF EXISTS `sp_saveanimal`;
DELIMITER //
CREATE PROCEDURE `sp_saveanimal` (
    IN `$id` INT,
    IN `$tagid` VARCHAR(50),
    IN `$designatedname` VARCHAR(100),
    IN `$breedid` INT,
    IN `$penid` INT,
    IN `$damid` INT,
    IN `$birthdate` DATE,
    IN `$initialweight` DECIMAL(10,2),
    IN `$registrationsource` VARCHAR(50),
    IN `$purchaseprice` DECIMAL(10,2),
    IN `$status` VARCHAR(20),
    IN `$autogen` TINYINT,
    IN `$is_insured` TINYINT,
    IN `$insurance_company_id` INT,
    IN `$insuranceamount` DECIMAL(15,2),
    IN `$userid` INT,
    IN `$platform` VARCHAR(50)
)
BEGIN
    DECLARE v_action VARCHAR(50);
    
    IF `$id` = 0 THEN
        INSERT INTO `animals` (`tagid`, `designatedname`, `breedid`, `penid`, `damid`, `birthdate`, `initialweight`, `registrationsource`, `purchaseprice`, `status`, `is_insured`, `insurance_company_id`, `insuranceamount`, `created_by`)
        VALUES (`$tagid`, `$designatedname`, `$breedid`, `$penid`, `$damid`, `$birthdate`, `$initialweight`, `$registrationsource`, `$purchaseprice`, `$status`, `$is_insured`, `$insurance_company_id`, `$insuranceamount`, `$userid`);
        SET `$id` = LAST_INSERT_ID();
        SET v_action = 'REGISTER ANIMAL';
    ELSE
        UPDATE `animals` 
        SET `tagid` = `$tagid`,
            `designatedname` = `$designatedname`,
            `breedid` = `$breedid`,
            `penid` = `$penid`,
            `damid` = `$damid`,
            `birthdate` = `$birthdate`,
            `initialweight` = `$initialweight`,
            `registrationsource` = `$registrationsource`,
            `purchaseprice` = `$purchaseprice`,
            `status` = `$status`,
            `is_insured` = `$is_insured`,
            `insurance_company_id` = `$insurance_company_id`,
            `insuranceamount` = `$insuranceamount`
        WHERE `id` = `$id`;
        SET v_action = 'UPDATE ANIMAL DETAILS';
    END IF;
    
    INSERT INTO `audittrail` (`userid`, `activity`, `platform`)
    VALUES (`$userid`, CONCAT(v_action, ': ', `$tagid`, ' (', `$designatedname`, ')'), `$platform`);
    
    SELECT `$id` AS animalid;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS `sp_getanimals`;
DELIMITER //
CREATE PROCEDURE `sp_getanimals`()
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
