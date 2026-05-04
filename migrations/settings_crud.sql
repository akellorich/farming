-- SETTINGS CRUD OPERATIONS FOR JUKAM DAIRY MANAGEMENT SYSTEM

DELIMITER $$

/* Get Company Details */
DROP PROCEDURE IF EXISTS `sp_getcompanydetails`$$
CREATE PROCEDURE `sp_getcompanydetails`()
BEGIN
    SELECT * FROM `companydetails` WHERE `id` = 1;
END$$

/* Get Email Settings by Role */
DROP PROCEDURE IF EXISTS `sp_getemailsettingsbyrole`$$
CREATE PROCEDURE `sp_getemailsettingsbyrole`(
    IN `$role` VARCHAR(100)
)
BEGIN
    SELECT * FROM `emailsettings` WHERE `role` = `$role`;
END$$

/* Get SMS Settings */
DROP PROCEDURE IF EXISTS `sp_getsmssettings`$$
CREATE PROCEDURE `sp_getsmssettings`(
    IN `$id` INT
)
BEGIN
    IF `$id` = 0 THEN
        SELECT * FROM `smssettings` WHERE `isdefault` = 1 AND `deleted` = 0 LIMIT 1;
    ELSE
        SELECT * FROM `smssettings` WHERE `id` = `$id` AND `deleted` = 0;
    END IF;
END$$

/* Get All SMS Providers */
DROP PROCEDURE IF EXISTS `sp_getsmsproviders`$$
CREATE PROCEDURE `sp_getsmsproviders`()
BEGIN
    SELECT `id`, `providername`, `isdefault` FROM `smssettings` WHERE `deleted` = 0;
END$$

/* Save/Update Company Details with Audit Trail */
DROP PROCEDURE IF EXISTS `sp_savecompanydetails`$$
CREATE PROCEDURE `sp_savecompanydetails`(
    IN `$companyname` VARCHAR(255),
    IN `$taxregno` VARCHAR(100),
    IN `$incorporationdate` DATE,
    IN `$emailaddress` VARCHAR(255),
    IN `$physicaladdress` TEXT,
    IN `$postaladdress` VARCHAR(255),
    IN `$mobileno` VARCHAR(50),
    IN `$logopath` VARCHAR(255),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    SELECT JSON_OBJECT(
        'companyname', `companyname`, 'taxregno', `taxregno`, 'emailaddress', `emailaddress`
    ) INTO `$originalvalues` FROM `companydetails` WHERE `id` = 1;
    
    UPDATE `companydetails`
    SET `companyname` = `$companyname`,
        `taxregno` = `$taxregno`,
        `incorporationdate` = `$incorporationdate`,
        `emailaddress` = `$emailaddress`,
        `physicaladdress` = `$physicaladdress`,
        `postaladdress` = `$postaladdress`,
        `mobileno` = `$mobileno`,
        `logopath` = IFNULL(`$logopath`, `logopath`),
        `updatedby` = `$userid`,
        `lastupdated` = NOW()
    WHERE `id` = 1;
    
    SELECT JSON_OBJECT(
        'companyname', `companyname`, 'taxregno', `taxregno`, 'emailaddress', `emailaddress`
    ) INTO `$updatedvalues` FROM `companydetails` WHERE `id` = 1;
    
    INSERT INTO `audittrail` (
        `timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`
    )
    VALUES (
        NOW(), `$userid`, 'Update', 'Updated Company Details', `$platform`, `$originalvalues`, `$updatedvalues`
    );
    
    COMMIT;
END$$

/* Save/Update Email Settings with Audit Trail */
DROP PROCEDURE IF EXISTS `sp_saveemailsettings`$$
CREATE PROCEDURE `sp_saveemailsettings`(
    IN `$id` INT,
    IN `$role` VARCHAR(100),
    IN `$smtpserver` VARCHAR(255),
    IN `$smtpport` INT,
    IN `$useremail` VARCHAR(255),
    IN `$password` VARCHAR(255),
    IN `$ssltoggle` TINYINT(1),
    IN `$sendmode` VARCHAR(50),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        INSERT INTO `emailsettings` (
            `role`, `smtpserver`, `smtpport`, `useremail`, `password`, `ssltoggle`, `sendmode`, `addedby`
        )
        VALUES (
            `$role`, `$smtpserver`, `$smtpport`, `$useremail`, `$password`, `$ssltoggle`, `$sendmode`, `$userid`
        );
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = JSON_OBJECT('id', `$id`, 'role', `$role`, 'useremail', `$useremail`);
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Created Email Settings for role: ', `$role`), `$platform`, `$updatedvalues`);
    ELSE
        SELECT JSON_OBJECT('role', `role`, 'useremail', `useremail`) INTO `$originalvalues` 
        FROM `emailsettings` WHERE `id` = `$id`;
        
        UPDATE `emailsettings`
        SET `role` = `$role`,
            `smtpserver` = `$smtpserver`,
            `smtpport` = `$smtpport`,
            `useremail` = `$useremail`,
            `password` = `$password`,
            `ssltoggle` = `$ssltoggle`,
            `sendmode` = `$sendmode`,
            `updatedby` = `$userid`,
            `lastupdated` = NOW()
        WHERE `id` = `$id`;
        
        SELECT JSON_OBJECT('role', `role`, 'useremail', `useremail`) INTO `$updatedvalues` 
        FROM `emailsettings` WHERE `id` = `$id`;
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Update', CONCAT('Updated Email Settings for role: ', `$role`), `$platform`, `$originalvalues`, `$updatedvalues`);
    END IF;
    
    COMMIT;
END$$

/* Save/Update SMS Settings with Audit Trail */
DROP PROCEDURE IF EXISTS `sp_savesmssettings`$$
CREATE PROCEDURE `sp_savesmssettings`(
    IN `$id` INT,
    IN `$providername` VARCHAR(100),
    IN `$senderid` VARCHAR(11),
    IN `$config` JSON,
    IN `$priorityroute` TINYINT(1),
    IN `$isdefault` TINYINT(1),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    -- If setting this as default, unset all others
    IF `$isdefault` = 1 THEN
        UPDATE `smssettings` SET `isdefault` = 0;
    END IF;
    
    IF `$id` = 0 THEN
        INSERT INTO `smssettings` (
            `providername`, `senderid`, `config`, `priorityroute`, `isdefault`, `addedby`
        )
        VALUES (
            `$providername`, `$senderid`, `$config`, `$priorityroute`, `$isdefault`, `$userid`
        );
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = JSON_OBJECT('id', `$id`, 'provider', `$providername`, 'isdefault', `$isdefault`);
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Created SMS Settings for: ', `$providername`), `$platform`, `$updatedvalues`);
    ELSE
        SELECT JSON_OBJECT('providername', `providername`, 'isdefault', `isdefault`) INTO `$originalvalues` 
        FROM `smssettings` WHERE `id` = `$id`;
        
        UPDATE `smssettings`
        SET `providername` = `$providername`,
            `senderid` = `$senderid`,
            `config` = `$config`,
            `priorityroute` = `$priorityroute`,
            `isdefault` = `$isdefault`,
            `updatedby` = `$userid`,
            `lastupdated` = NOW()
        WHERE `id` = `$id`;
        
        SELECT JSON_OBJECT('providername', `providername`, 'isdefault', `isdefault`) INTO `$updatedvalues` 
        FROM `smssettings` WHERE `id` = `$id`;
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Update', CONCAT('Updated SMS Settings for: ', `$providername`), `$platform`, `$originalvalues`, `$updatedvalues`);
    END IF;
    
    COMMIT;
END$$

DELIMITER ;

/*
-- SAMPLE CALLS FOR TESTING --

-- 1. Get settings individually
CALL sp_getcompanydetails();
CALL sp_getemailsettings();
CALL sp_getsmssettings();

-- 2. Update Company Details
CALL sp_savecompanydetails(
    'JUKAM Dairy Limited', 
    'TRN-88291-JK', 
    '2018-05-12', 
    'admin@jukamdairy.co.ke', 
    'Plot 45, Green Valley Industrial Estate, Sector 7, Rift Valley District', 
    'P.O. Box 7721, Nakuru Central', 
    '+254 722 000 999', 
    'images/logo.png', 
    5, 
    '{"browser": "Chrome"}'
);

-- 3. Update Email Settings (General Role)
CALL sp_saveemailsettings(
    1, 
    'General', 
    'smtp.office365.com', 
    587, 
    'notifications@jukamdairy.com', 
    'SecurePass123!', 
    1, 
    'Queue', 
    5, 
    '{"browser": "Chrome"}'
);

-- 4. Create New Email Role
CALL sp_saveemailsettings(
    0, 
    'Marketing', 
    'smtp.mailchimp.com', 
    587, 
    'marketing@jukamdairy.com', 
    'MktPass456!', 
    1, 
    'Direct', 
    5, 
    '{"browser": "Chrome"}'
);

-- 5. Update SMS Settings (AfricasTalking)
CALL sp_savesmssettings(
    1, 
    'AfricasTalking', 
    'JUKAM-AT', 
    '{"apikey": "AT-KEY-NEW", "username": "jukam_admin"}', 
    1, 
    1, 
    5, 
    '{"browser": "Chrome"}'
);

-- 6. Add New SMS Provider
CALL sp_savesmssettings(
    0, 
    'NewGateway', 
    'NG-SEND', 
    '{"token": "xyz123", "secret": "abc456"}', 
    0, 
    0, 
    5, 
    '{"browser": "Chrome"}'
);

*/
