-- Migration: Add sendername to emailsettings and update SP
ALTER TABLE `emailsettings` ADD COLUMN `sendername` VARCHAR(255) AFTER `role`;

DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_saveemailsettings`$$
CREATE PROCEDURE `sp_saveemailsettings`(
    IN `$id` INT,
    IN `$role` VARCHAR(100),
    IN `$sendername` VARCHAR(255),
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
            `role`, `sendername`, `smtpserver`, `smtpport`, `useremail`, `password`, `ssltoggle`, `sendmode`, `addedby`
        )
        VALUES (
            `$role`, `$sendername`, `$smtpserver`, `$smtpport`, `$useremail`, `$password`, `$ssltoggle`, `$sendmode`, `$userid`
        );
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = JSON_OBJECT('id', `$id`, 'role', `$role`, 'sendername', `$sendername`, 'useremail', `$useremail`);
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Created Email Settings for role: ', `$role`), `$platform`, `$updatedvalues`);
    ELSE
        SELECT JSON_OBJECT('role', `role`, 'sendername', `sendername`, 'useremail', `useremail`) INTO `$originalvalues` 
        FROM `emailsettings` WHERE `id` = `$id`;
        
        UPDATE `emailsettings`
        SET `role` = `$role`,
            `sendername` = `$sendername`,
            `smtpserver` = `$smtpserver`,
            `smtpport` = `$smtpport`,
            `useremail` = `$useremail`,
            `password` = `$password`,
            `ssltoggle` = `$ssltoggle`,
            `sendmode` = `$sendmode`,
            `updatedby` = `$userid`,
            `lastupdated` = NOW()
        WHERE `id` = `$id`;
        
        SELECT JSON_OBJECT('role', `role`, 'sendername', `sendername`, 'useremail', `useremail`) INTO `$updatedvalues` 
        FROM `emailsettings` WHERE `id` = `$id`;
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Update', CONCAT('Updated Email Settings for role: ', `$role`), `$platform`, `$originalvalues`, `$updatedvalues`);
    END IF;
    
    COMMIT;
END$$

DELIMITER ;
