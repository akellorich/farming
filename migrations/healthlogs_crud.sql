-- HEALTH LOGS CRUD OPERATIONS FOR JUKAM DAIRY MANAGEMENT SYSTEM

DELIMITER $$

/* Get all health logs */
DROP PROCEDURE IF EXISTS `sp_gethealthlogs`$$
CREATE PROCEDURE `sp_gethealthlogs`()
BEGIN
    SELECT 
        hl.*, 
        a.`tagid`, 
        a.`designatedname` AS `animalname`,
        d.`diseasename`,
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`
    FROM `healthlogs` hl
    LEFT JOIN `animals` a ON hl.`animalid` = a.`id`
    LEFT JOIN `diseases` d ON hl.`diseaseid` = d.`id`
    LEFT JOIN `user` u ON hl.`addedby` = u.`userid`
    WHERE hl.`deleted` = 0
    ORDER BY hl.`logdate` DESC;
END$$

/* Save health log (Insert/Update) with Audit Trail */
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
    IN `$veterinarian` VARCHAR(100),
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
            `logdate`, `animalid`, `diseaseid`, `diagnosis`, `treatment`, `narration`, `status`, `veterinarian`, `nextfollowup`, `addedby`, `dateadded`, `deleted`
        )
        VALUES (
            `$logdate`, `$animalid`, `$diseaseid`, `$diagnosis`, `$treatment`, `$narration`, `$status`, `$veterinarian`, `$nextfollowup`, `$userid`, NOW(), 0
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
            `veterinarian` = `$veterinarian`, 
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

/* Soft Delete health log */
DROP PROCEDURE IF EXISTS `sp_deletehealthlog`$$
CREATE PROCEDURE `sp_deletehealthlog`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$reason` TEXT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$tagid` VARCHAR(50);
    
    START TRANSACTION;
    SELECT a.`tagid` INTO `$tagid` FROM `healthlogs` hl JOIN `animals` a ON hl.`animalid` = a.`id` WHERE hl.`id` = `$id`;
    
    UPDATE `healthlogs` 
    SET `deleted` = 1, `deletedby` = `$userid`, `datedeleted` = NOW(), `reasondeleted` = `$reason`
    WHERE `id` = `$id`;
    
    INSERT INTO `audittrail` (
        `timestamp`, `userid`, `operation`, `narration`, `platform`
    )
    VALUES (
        NOW(), `$userid`, 'Delete', CONCAT('Soft deleted health record for animal: ', IFNULL(`$tagid`, 'Unknown'), '. Reason: ', `$reason`), `$platform`
    );
    
    COMMIT;
END$$

DELIMITER ;
