-- DISEASE CRUD OPERATIONS FOR JUKAM DAIRY MANAGEMENT SYSTEM

DELIMITER $$

/* Check if disease exists */
DROP PROCEDURE IF EXISTS `sp_checkifdiseaseexists`$$
CREATE PROCEDURE `sp_checkifdiseaseexists`(
    IN `$id` INT, 
    IN `$diseasename` VARCHAR(100)
)
BEGIN
    SELECT * FROM `diseases` 
    WHERE `id` <> `$id` 
    AND `diseasename` = `$diseasename` 
    AND `deleted` = 0;
END$$

/* Get list of diseases */
DROP PROCEDURE IF EXISTS `sp_getdiseases`$$
CREATE PROCEDURE `sp_getdiseases`()
BEGIN
    SELECT 
        d.*, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`
    FROM `diseases` d
    LEFT JOIN `user` u ON d.`addedby` = u.`userid`
    WHERE d.`deleted` = 0
    ORDER BY d.`diseasename`;
END$$

/* Get disease details */
DROP PROCEDURE IF EXISTS `sp_getdiseasedetails`$$
CREATE PROCEDURE `sp_getdiseasedetails`(
    IN `$id` INT
)
BEGIN
    SELECT 
        d.*, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`
    FROM `diseases` d
    LEFT JOIN `user` u ON d.`addedby` = u.`userid`
    WHERE d.`id` = `$id` 
    AND d.`deleted` = 0;
END$$

/* Save disease (Insert/Update) with Audit Trail */
DROP PROCEDURE IF EXISTS `sp_savedisease`$$
CREATE PROCEDURE `sp_savedisease`(
    IN `$id` INT,
    IN `$diseasename` VARCHAR(100),
    IN `$commonsymptoms` TEXT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        INSERT INTO `diseases` (
            `diseasename`, `commonsymptoms`, `addedby`, `dateadded`, `deleted`
        )
        VALUES (
            `$diseasename`, `$commonsymptoms`, `$userid`, NOW(), 0
        );
        
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, ',"diseasename":"', `$diseasename`, '"}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`
        )
        VALUES (
            NOW(), `$userid`, 'Insert', CONCAT('Created new disease: ', `$diseasename`), `$platform`, `$updatedvalues`
        );
    ELSE
        SELECT CONCAT(
            '{"id":', `id`, ',"diseasename":"', `diseasename`, '"}'
        ) INTO `$originalvalues`
        FROM `diseases` WHERE `id` = `$id`;
        
        UPDATE `diseases` 
        SET `diseasename` = `$diseasename`, 
            `commonsymptoms` = `$commonsymptoms`
        WHERE `id` = `$id`;
        
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, ',"diseasename":"', `$diseasename`, '"}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`
        )
        VALUES (
            NOW(), `$userid`, 'Update', CONCAT('Updated disease: ', `$diseasename`), `$platform`, `$originalvalues`, `$updatedvalues`
        );
    END IF;
    
    COMMIT;
    SELECT `$id` AS `diseaseid`;
END$$

/* Soft Delete disease */
DROP PROCEDURE IF EXISTS `sp_deletedisease`$$
CREATE PROCEDURE `sp_deletedisease`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$reason` TEXT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$diseasename` VARCHAR(100);
    
    START TRANSACTION;
    SELECT `diseasename` INTO `$diseasename` FROM `diseases` WHERE `id` = `$id`;
    
    UPDATE `diseases` 
    SET `deleted` = 1, `deletedby` = `$userid`, `datedeleted` = NOW(), `reasondeleted` = `$reason`
    WHERE `id` = `$id`;
    
    INSERT INTO `audittrail` (
        `timestamp`, `userid`, `operation`, `narration`, `platform`
    )
    VALUES (
        NOW(), `$userid`, 'Delete', CONCAT('Soft deleted disease: ', IFNULL(`$diseasename`, 'Unknown'), '. Reason: ', `$reason`), `$platform`
    );
    
    COMMIT;
END$$

DELIMITER ;

/* =============================================================================
   TESTING PROCEDURES
   ============================================================================= */

-- 1. Check if disease exists
-- CALL sp_checkifdiseaseexists(0, 'Mastitis');

-- 2. Get all diseases
-- CALL sp_getdiseases();

-- 3. Save a new disease
-- CALL sp_savedisease(0, 'Rabies', 'Aggression, excessive salivation, paralysis', 5, '{"browser":"Chrome"}');

-- 4. Update disease
-- CALL sp_savedisease(1, 'Mastitis (Acute)', 'Swollen udder, bloody milk, high fever', 5, '{"browser":"Chrome"}');

-- 5. Delete disease
-- CALL sp_deletedisease(5, 5, 'Duplicate record', '{"browser":"Chrome"}');
