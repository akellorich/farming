-- COUNTRY CRUD OPERATIONS FOR JUKAM DAIRY MANAGEMENT SYSTEM

DELIMITER $$

/* Check if country exists */
DROP PROCEDURE IF EXISTS `sp_checkifcountryexists`$$
CREATE PROCEDURE `sp_checkifcountryexists`(
    IN `$id` INT, 
    IN `$countryname` VARCHAR(100)
)
BEGIN
    SELECT * FROM `countries` 
    WHERE `id` <> `$id` 
    AND `countryname` = `$countryname` 
    AND `deleted` = 0;
END$$

/* Get list of countries */
DROP PROCEDURE IF EXISTS `sp_getcountries`$$
CREATE PROCEDURE `sp_getcountries`()
BEGIN
    SELECT 
        c.*, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`
    FROM `countries` c
    LEFT JOIN `user` u ON c.`addedby` = u.`userid`
    WHERE c.`deleted` = 0
    ORDER BY c.`countryname`;
END$$

/* Get country details */
DROP PROCEDURE IF EXISTS `sp_getcountrydetails`$$
CREATE PROCEDURE `sp_getcountrydetails`(
    IN `$id` INT
)
BEGIN
    SELECT 
        c.*, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`
    FROM `countries` c
    LEFT JOIN `user` u ON c.`addedby` = u.`userid`
    WHERE c.`id` = `$id` 
    AND c.`deleted` = 0;
END$$

/* Save country (Insert/Update) with Audit Trail */
DROP PROCEDURE IF EXISTS `sp_savecountry`$$
CREATE PROCEDURE `sp_savecountry`(
    IN `$id` INT,
    IN `$countryname` VARCHAR(100),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        INSERT INTO `countries` (
            `countryname`, `addedby`, `dateadded`, `deleted`
        )
        VALUES (
            `$countryname`, `$userid`, NOW(), 0
        );
        
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, ',"countryname":"', `$countryname`, '"}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`
        )
        VALUES (
            NOW(), `$userid`, 'Insert', CONCAT('Created new country: ', `$countryname`), `$platform`, `$updatedvalues`
        );
    ELSE
        SELECT CONCAT(
            '{"id":', `id`, ',"countryname":"', `countryname`, '"}'
        ) INTO `$originalvalues`
        FROM `countries` WHERE `id` = `$id`;
        
        UPDATE `countries` 
        SET `countryname` = `$countryname`
        WHERE `id` = `$id`;
        
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, ',"countryname":"', `$countryname`, '"}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`
        )
        VALUES (
            NOW(), `$userid`, 'Update', CONCAT('Updated country: ', `$countryname`), `$platform`, `$originalvalues`, `$updatedvalues`
        );
    END IF;
    
    COMMIT;
    SELECT `$id` AS `countryid`;
END$$

/* Soft Delete country */
DROP PROCEDURE IF EXISTS `sp_deletecountry`$$
CREATE PROCEDURE `sp_deletecountry`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$reason` TEXT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$countryname` VARCHAR(100);
    
    START TRANSACTION;
    SELECT `countryname` INTO `$countryname` FROM `countries` WHERE `id` = `$id`;
    
    UPDATE `countries` 
    SET `deleted` = 1, `deletedby` = `$userid`, `datedeleted` = NOW(), `reasondeleted` = `$reason`
    WHERE `id` = `$id`;
    
    INSERT INTO `audittrail` (
        `timestamp`, `userid`, `operation`, `narration`, `platform`
    )
    VALUES (
        NOW(), `$userid`, 'Delete', CONCAT('Soft deleted country: ', IFNULL(`$countryname`, 'Unknown'), '. Reason: ', `$reason`), `$platform`
    );
    
    COMMIT;
END$$

DELIMITER ;

/* =============================================================================
   TESTING PROCEDURES
   ============================================================================= */

-- 1. Check if country exists
-- CALL sp_checkifcountryexists(0, 'Kenya');

-- 2. Get all countries
-- CALL sp_getcountries();

-- 3. Save a new country
-- CALL sp_savecountry(0, 'Tanzania', 5, '{"browser":"Chrome"}');

-- 4. Update country
-- CALL sp_savecountry(1, 'Netherlands (Holland)', 5, '{"browser":"Chrome"}');

-- 5. Delete country
-- CALL sp_deletecountry(5, 5, 'Incorrect entry', '{"browser":"Chrome"}');
