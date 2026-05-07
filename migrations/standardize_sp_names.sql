DELIMITER $$

-- Rename sp_record_bulk_vaccination to sp_recordbulkvaccination
DROP PROCEDURE IF EXISTS `sp_recordbulkvaccination`$$
CREATE PROCEDURE `sp_recordbulkvaccination`(
    IN `$scheduleid` INT,
    IN `$animalids` JSON,
    IN `$vaccinationdate` DATE,
    IN `$productused` VARCHAR(100),
    IN `$batchno` VARCHAR(50),
    IN `$dosage` VARCHAR(50),
    IN `$administeredby` VARCHAR(100),
    IN `$notes` TEXT,
    IN `$userid` INT
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE `$animalid` INT;
    DECLARE `$count` INT;
    DECLARE `$rec_type` VARCHAR(20) DEFAULT 'Scheduled';
    
    SET `$count` = JSON_LENGTH(`$animalids`);
    
    IF `$scheduleid` = 0 THEN
        SET `$rec_type` = 'Routine';
    END IF;
    
    WHILE i < `$count` DO
        SET `$animalid` = JSON_UNQUOTE(JSON_EXTRACT(`$animalids`, CONCAT('$[', i, ']')));
        
        INSERT INTO `vaccinations` (
            `animalid`, `scheduleid`, `vaccinationdate`, `productused`, `batchno`, `dosage`, `administeredby`, `notes`, `record_type`, `addedby`
        ) VALUES (
            `$animalid`, `$scheduleid`, `$vaccinationdate`, `$productused`, `$batchno`, `$dosage`, `$administeredby`, `$notes`, `$rec_type`, `$userid`
        );
        
        SET i = i + 1;
    END WHILE;

    IF `$scheduleid` > 0 THEN
        UPDATE `vaccinationschedules` SET `status` = 'Completed' WHERE `id` = `$scheduleid`;
    END IF;
END$$

-- Rename sp_record_bulk_deworming to sp_recordbulkdeworming
DROP PROCEDURE IF EXISTS `sp_recordbulkdeworming`$$
CREATE PROCEDURE `sp_recordbulkdeworming`(
    IN `$scheduleid` INT,
    IN `$animalids` JSON,
    IN `$dewormingdate` DATE,
    IN `$productused` VARCHAR(100),
    IN `$dosage` VARCHAR(50),
    IN `$method` VARCHAR(50),
    IN `$administeredby` VARCHAR(100),
    IN `$notes` TEXT,
    IN `$userid` INT
)
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE `$animalid` INT;
    DECLARE `$count` INT;
    DECLARE `$rec_type` VARCHAR(20) DEFAULT 'Scheduled';
    
    SET `$count` = JSON_LENGTH(`$animalids`);

    IF `$scheduleid` = 0 THEN
        SET `$rec_type` = 'Routine';
    END IF;
    
    WHILE i < `$count` DO
        SET `$animalid` = JSON_UNQUOTE(JSON_EXTRACT(`$animalids`, CONCAT('$[', i, ']')));
        
        INSERT INTO `deworming` (
            `animalid`, `scheduleid`, `dewormingdate`, `productused`, `dosage`, `method`, `administeredby`, `notes`, `record_type`, `addedby`
        ) VALUES (
            `$animalid`, `$scheduleid`, `$dewormingdate`, `$productused`, `$dosage`, `$method`, `$administeredby`, `$notes`, `$rec_type`, `$userid`
        );
        
        SET i = i + 1;
    END WHILE;

    IF `$scheduleid` > 0 THEN
        UPDATE `dewormingschedules` SET `status` = 'Completed' WHERE `id` = `$scheduleid`;
    END IF;
END$$

-- Rename sp_get_animals_by_schedule to sp_getanimalsbyschedule
DROP PROCEDURE IF EXISTS `sp_getanimalsbyschedule`$$
CREATE PROCEDURE `sp_getanimalsbyschedule`(
    IN `$scheduleid` INT,
    IN `$type` VARCHAR(20)
)
BEGIN
    IF `$scheduleid` = 0 OR `$scheduleid` IS NULL THEN
        SELECT a.id, a.tagid, a.designatedname, p.penname 
        FROM animals a 
        JOIN pens p ON a.penid = p.id 
        WHERE a.deleted = 0 
        ORDER BY p.penname, a.tagid;
    ELSE
        SET @penids = '';
        IF `$type` = 'vaccination' THEN
            SELECT penids INTO @penids FROM vaccinationschedules WHERE id = `$scheduleid`;
        ELSE
            SELECT penids INTO @penids FROM dewormingschedules WHERE id = `$scheduleid`;
        END IF;

        IF @penids IS NOT NULL AND @penids <> '' AND @penids <> '[]' THEN
            SELECT a.id, a.tagid, a.designatedname, p.penname 
            FROM animals a 
            JOIN pens p ON a.penid = p.id 
            WHERE (JSON_CONTAINS(@penids, CAST(a.penid AS CHAR)) OR JSON_CONTAINS(@penids, JSON_QUOTE(CAST(a.penid AS CHAR))))
            AND a.deleted = 0
            ORDER BY p.penname, a.tagid;
        ELSE
            SELECT a.id, a.tagid, a.designatedname, p.penname FROM animals a LIMIT 0;
        END IF;
    END IF;
END$$

-- Rename sp_get_active_health_schedules to sp_getactivehealthschedules
DROP PROCEDURE IF EXISTS `sp_getactivehealthschedules`$$
CREATE PROCEDURE `sp_getactivehealthschedules`(
    IN `$type` VARCHAR(20)
)
BEGIN
    IF `$type` = 'vaccination' THEN
        SELECT s.id, d.diseasename as title, s.scheduledate 
        FROM vaccinationschedules s 
        JOIN diseases d ON s.diseaseid = d.id 
        WHERE s.deleted = 0 AND s.status != 'Completed'
        ORDER BY s.scheduledate ASC;
    ELSE
        SELECT s.id, s.schedulename as title, s.scheduledate 
        FROM dewormingschedules s 
        WHERE s.deleted = 0 AND s.status != 'Completed'
        ORDER BY s.scheduledate ASC;
    END IF;
END$$

-- Rename history SPs
DROP PROCEDURE IF EXISTS `sp_getvaccinationhistory`$$
CREATE PROCEDURE `sp_getvaccinationhistory`()
BEGIN
    SELECT 
        v.id, v.vaccinationdate as date, v.productused as product, v.batchno as batch, v.dosage, v.administeredby as vet, v.record_type,
        a.tagid as animal_code, a.name as animal_name, 'Completed' as status
    FROM vaccinations v
    JOIN animals a ON v.animalid = a.id
    ORDER BY v.vaccinationdate DESC;
END$$

DROP PROCEDURE IF EXISTS `sp_getdeworminghistory`$$
CREATE PROCEDURE `sp_getdeworminghistory`()
BEGIN
    SELECT 
        d.id, d.dewormingdate as date, d.productused as product, d.method, d.dosage, d.administeredby as vet, d.record_type,
        a.tagid as animal_code, a.name as animal_name, 'Completed' as status
    FROM deworming d
    JOIN animals a ON d.animalid = a.id
    ORDER BY d.dewormingdate DESC;
END$$

-- Final Cleanup: Drop old underscore-heavy SPs
DROP PROCEDURE IF EXISTS `sp_record_bulk_vaccination`$$
DROP PROCEDURE IF EXISTS `sp_record_bulk_deworming`$$
DROP PROCEDURE IF EXISTS `sp_get_animals_by_schedule`$$
DROP PROCEDURE IF EXISTS `sp_get_active_health_schedules`$$
DROP PROCEDURE IF EXISTS `sp_get_vaccination_history`$$
DROP PROCEDURE IF EXISTS `sp_get_deworming_history`$$

DELIMITER ;
