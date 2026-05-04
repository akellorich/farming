-- BREED CRUD OPERATIONS FOR JUKAM DAIRY MANAGEMENT SYSTEM

DELIMITER $$

/* Procedure to check if a breed with the same name exists (excluding current ID) */
DROP PROCEDURE IF EXISTS `sp_checkifbreedexists`$$
CREATE PROCEDURE `sp_checkifbreedexists`(
    IN `$id` INT, 
    IN `$breedname` VARCHAR(100)
)
BEGIN
    SELECT * FROM `breeds` 
    WHERE `id` <> `$id` 
    AND `breedname` = `$breedname` 
    AND `deleted` = 0;
END$$

/* Procedure to get a list of all active breeds with their origin country and added by names */
DROP PROCEDURE IF EXISTS `sp_getbreeds`$$
CREATE PROCEDURE `sp_getbreeds`()
BEGIN
    SELECT 
        b.*, 
        c.`countryname`, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`
    FROM `breeds` b
    LEFT JOIN `countries` c ON b.`originid` = c.`id`
    LEFT JOIN `user` u ON b.`addedby` = u.`userid`
    WHERE b.`deleted` = 0
    ORDER BY b.`breedname`;
END$$

/* Procedure to get detailed information for a single breed */
DROP PROCEDURE IF EXISTS `sp_getbreeddetails`$$
CREATE PROCEDURE `sp_getbreeddetails`(
    IN `$id` INT
)
BEGIN
    SELECT 
        b.*, 
        c.`countryname`, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`
    FROM `breeds` b
    LEFT JOIN `countries` c ON b.`originid` = c.`id`
    LEFT JOIN `user` u ON b.`addedby` = u.`userid`
    WHERE b.`id` = `$id` 
    AND b.`deleted` = 0;
END$$

/* Procedure to Save (Insert or Update) a breed with Audit Trail logging */
DROP PROCEDURE IF EXISTS `sp_savebreed`$$
CREATE PROCEDURE `sp_savebreed`(
    IN `$id` INT,
    IN `$breedname` VARCHAR(100),
    IN `$originid` INT,
    IN `$characteristics` TEXT,
    IN `$isindigenous` TINYINT(1),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        -- Insert new breed
        INSERT INTO `breeds` (
            `breedname`, 
            `originid`, 
            `characteristics`, 
            `isindigenous`, 
            `addedby`, 
            `dateadded`, 
            `deleted`
        )
        VALUES (
            `$breedname`, 
            `$originid`, 
            `$characteristics`, 
            `$isindigenous`, 
            `$userid`, 
            NOW(), 
            0
        );
        
        SET `$id` = LAST_INSERT_ID();
        
        -- Audit Trail for Insert
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, 
            ',"breedname":"', `$breedname`, 
            '","originid":', IFNULL(`$originid`, 'null'), 
            ',"isindigenous":', `$isindigenous`, 
            '}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, 
            `userid`, 
            `operation`, 
            `narration`, 
            `platform`, 
            `updatedvalues`
        )
        VALUES (
            NOW(), 
            `$userid`, 
            'Insert', 
            CONCAT('Created new breed: ', `$breedname`), 
            `$platform`, 
            `$updatedvalues`
        );
    ELSE
        -- Capture original values for audit trail before update
        SELECT CONCAT(
            '{"id":', `id`, 
            ',"breedname":"', `breedname`, 
            '","originid":', IFNULL(`originid`, 'null'), 
            ',"isindigenous":', `isindigenous`, 
            '}'
        ) INTO `$originalvalues`
        FROM `breeds` 
        WHERE `id` = `$id`;
        
        -- Update existing breed
        UPDATE `breeds` 
        SET `breedname` = `$breedname`, 
            `originid` = `$originid`, 
            `characteristics` = `$characteristics`, 
            `isindigenous` = `$isindigenous`
        WHERE `id` = `$id`;
        
        -- Audit Trail for Update
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, 
            ',"breedname":"', `$breedname`, 
            '","originid":', IFNULL(`$originid`, 'null'), 
            ',"isindigenous":', `$isindigenous`, 
            '}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, 
            `userid`, 
            `operation`, 
            `narration`, 
            `platform`, 
            `originalvalues`, 
            `updatedvalues`
        )
        VALUES (
            NOW(), 
            `$userid`, 
            'Update', 
            CONCAT('Updated breed: ', `$breedname`), 
            `$platform`, 
            `$originalvalues`, 
            `$updatedvalues`
        );
    END IF;
    
    COMMIT;
    
    -- Return the ID of the saved breed
    SELECT `$id` AS `breedid`;
END$$

/* Procedure to Soft Delete a breed with a reason and Audit Trail logging */
DROP PROCEDURE IF EXISTS `sp_deletebreed`$$
CREATE PROCEDURE `sp_deletebreed`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$reason` TEXT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$breedname` VARCHAR(100);
    
    START TRANSACTION;
    
    -- Get breed name for the audit narration
    SELECT `breedname` INTO `$breedname` FROM `breeds` WHERE `id` = `$id`;
    
    -- Soft delete the record
    UPDATE `breeds` 
    SET `deleted` = 1, 
        `deletedby` = `$userid`, 
        `datedeleted` = NOW(), 
        `reasondeleted` = `$reason`
    WHERE `id` = `$id`;
    
    -- Audit Trail for Delete
    INSERT INTO `audittrail` (
        `timestamp`, 
        `userid`, 
        `operation`, 
        `narration`, 
        `platform`
    )
    VALUES (
        NOW(), 
        `$userid`, 
        'Delete', 
        CONCAT('Soft deleted breed: ', IFNULL(`$breedname`, 'Unknown'), '. Reason: ', `$reason`), 
        `$platform`
    );
    
    COMMIT;
END$$

DELIMITER ;

/* =============================================================================
   TESTING PROCEDURES
   Uncomment the lines below to test each procedure manually.
   ============================================================================= */

-- 1. Check if a breed name exists
-- CALL sp_checkifbreedexists(0, 'Holstein Friesian');

-- 2. Get list of all breeds
-- CALL sp_getbreeds();

-- 3. Save a new breed (Insert)
-- CALL sp_savebreed(0, 'Sahiwal', 4, 'Dual purpose, hardy, resistant to ticks', 0, 5, '{"browser":"Chrome","os":"windows"}');

-- 4. Get details of a specific breed
-- CALL sp_getbreeddetails(1);

-- 5. Update an existing breed
-- CALL sp_savebreed(5, 'Boran (Improved)', 4, 'Excellent heat resistance, high quality beef', 1, 5, '{"browser":"Firefox","os":"windows"}');

-- 6. Soft delete a breed
-- CALL sp_deletebreed(5, 5, 'No longer in production', '{"browser":"Chrome","os":"windows"}');

-- 7. Verify audit trail after tests
-- SELECT * FROM audittrail ORDER BY timestamp DESC LIMIT 5;
