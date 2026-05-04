-- ANIMAL CRUD OPERATIONS FOR JUKAM DAIRY MANAGEMENT SYSTEM

DELIMITER $$

/* Procedure to check specific animal details for duplicates (tagid, designatedname) */
DROP PROCEDURE IF EXISTS `sp_checkanimaldetails`$$
CREATE PROCEDURE `sp_checkanimaldetails`(
    IN `$id` INT,
    IN `$checkfield` VARCHAR(50),
    IN `$checkvalue` VARCHAR(100)
)
BEGIN
    IF `$checkfield` = 'tagid' THEN
        SELECT * FROM `animals` 
        WHERE `id` <> `$id` AND `tagid` = `$checkvalue` AND `deleted` = 0;
    ELSEIF `$checkfield` = 'designatedname' THEN
        SELECT * FROM `animals` 
        WHERE `id` <> `$id` AND `designatedname` = `$checkvalue` AND `designatedname` <> '' AND `deleted` = 0;
    END IF;
END$$

/* Procedure to get a list of all active animals with breed and pen names */
DROP PROCEDURE IF EXISTS `sp_getanimals`$$
CREATE PROCEDURE `sp_getanimals`()
BEGIN
    SELECT 
        a.*, 
        b.`breedname`, 
        p.`penname`,
        m.`designatedname` AS `mothername`,
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`,
        COALESCE((SELECT SUM(`quantitylitres`) FROM `milkcollection` WHERE `animalid` = a.`id` AND `logdate` = CURDATE() AND `deleted` = 0), 0) AS `yield`
    FROM `animals` a
    LEFT JOIN `breeds` b ON a.`breedid` = b.`id`
    LEFT JOIN `pens` p ON a.`penid` = p.`id`
    LEFT JOIN `animals` m ON a.`damid` = m.`id`
    LEFT JOIN `user` u ON a.`addedby` = u.`userid`
    WHERE a.`deleted` = 0
    ORDER BY a.`tagid`;
END$$

/* Procedure to get detailed information for a single animal */
DROP PROCEDURE IF EXISTS `sp_getanimaldetails`$$
CREATE PROCEDURE `sp_getanimaldetails`(
    IN `$id` INT
)
BEGIN
    SELECT 
        a.*, 
        b.`breedname`, 
        p.`penname`,
        m.`designatedname` AS `mothername`,
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`
    FROM `animals` a
    LEFT JOIN `breeds` b ON a.`breedid` = b.`id`
    LEFT JOIN `pens` p ON a.`penid` = p.`id`
    LEFT JOIN `animals` m ON a.`damid` = m.`id`
    LEFT JOIN `user` u ON a.`addedby` = u.`userid`
    WHERE a.`id` = `$id` 
    AND a.`deleted` = 0;
END$$

/* Procedure to Save (Insert or Update) an animal with Audit Trail logging */
DROP PROCEDURE IF EXISTS `sp_saveanimal`$$
CREATE PROCEDURE `sp_saveanimal`(
    IN `$id` INT,
    IN `$tagid` VARCHAR(50),
    IN `$designatedname` VARCHAR(100),
    IN `$breedid` INT,
    IN `$penid` INT,
    IN `$damid` INT,
    IN `$birthdate` DATE,
    IN `$initialweight` DECIMAL(10, 2),
    IN `$registrationsource` VARCHAR(50),
    IN `$purchaseprice` DECIMAL(15, 2),
    IN `$status` VARCHAR(50),
    IN `$autogen` TINYINT(1),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        -- Auto-generate Tag ID if requested
        IF `$autogen` = 1 THEN
            SET `$tagid` = fn_generateanimaltag();
            -- Increment the serial number
            UPDATE `serials` SET `currentno` = `currentno` + 1 WHERE `document` = 'Animal Tag';
        END IF;

        -- Insert new animal
        INSERT INTO `animals` (
            `tagid`, 
            `designatedname`, 
            `breedid`, 
            `penid`, 
            `damid`, 
            `birthdate`, 
            `initialweight`, 
            `registrationsource`, 
            `purchaseprice`, 
            `status`, 
            `addedby`, 
            `dateadded`, 
            `deleted`
        )
        VALUES (
            `$tagid`, 
            `$designatedname`, 
            `$breedid`, 
            `$penid`, 
            `$damid`, 
            `$birthdate`, 
            `$initialweight`, 
            `$registrationsource`, 
            `$purchaseprice`, 
            `$status`, 
            `$userid`, 
            NOW(), 
            0
        );
        
        SET `$id` = LAST_INSERT_ID();
        
        -- Audit Trail for Insert
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, 
            ',"tagid":"', `$tagid`, 
            '","designatedname":"', IFNULL(`$designatedname`, ''), 
            '","breedid":', IFNULL(`$breedid`, 'null'), 
            ',"penid":', IFNULL(`$penid`, 'null'), 
            ',"status":"', `$status`, 
            '"}'
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
            CONCAT('Registered new animal: ', `$tagid`, ' (', IFNULL(`$designatedname`, 'Unnamed'), ')'), 
            `$platform`, 
            `$updatedvalues`
        );
    ELSE
        -- Capture original values for audit trail before update
        SELECT CONCAT(
            '{"id":', `id`, 
            ',"tagid":"', `tagid`, 
            '","designatedname":"', IFNULL(`designatedname`, ''), 
            '","breedid":', IFNULL(`breedid`, 'null'), 
            ',"penid":', IFNULL(`penid`, 'null'), 
            ',"status":"', `status`, 
            '"}'
        ) INTO `$originalvalues`
        FROM `animals` 
        WHERE `id` = `$id`;
        
        -- Update existing animal
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
            `status` = `$status`
        WHERE `id` = `$id`;
        
        -- Audit Trail for Update
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, 
            ',"tagid":"', `$tagid`, 
            '","designatedname":"', IFNULL(`$designatedname`, ''), 
            '","breedid":', IFNULL(`$breedid`, 'null'), 
            ',"penid":', IFNULL(`$penid`, 'null'), 
            ',"status":"', `$status`, 
            '"}'
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
            CONCAT('Updated animal details: ', `$tagid`), 
            `$platform`, 
            `$originalvalues`, 
            `$updatedvalues`
        );
    END IF;
    
    COMMIT;
    
    -- Return the ID of the saved animal
    SELECT `$id` AS `animalid`;
END$$

/* Procedure to Soft Delete an animal with a reason and Audit Trail logging */
DROP PROCEDURE IF EXISTS `sp_deleteanimal`$$
CREATE PROCEDURE `sp_deleteanimal`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$reason` TEXT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$tagid` VARCHAR(50);
    
    START TRANSACTION;
    
    -- Get tagid for the audit narration
    SELECT `tagid` INTO `$tagid` FROM `animals` WHERE `id` = `$id`;
    
    -- Soft delete the record
    UPDATE `animals` 
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
        CONCAT('Soft deleted animal: ', IFNULL(`$tagid`, 'Unknown'), '. Reason: ', `$reason`), 
        `$platform`
    );
    
    COMMIT;
END$$

DELIMITER ;
