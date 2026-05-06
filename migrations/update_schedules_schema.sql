-- JUKAM Dairy - Update Vaccination and Deworming Schedules Schema
-- This script aligns the tables with the high-fidelity UI components

SET FOREIGN_KEY_CHECKS = 0;

-- 1. Update vaccinationschedules table
ALTER TABLE `vaccinationschedules` 
ADD COLUMN `penids` JSON AFTER `diseaseid`,
ADD COLUMN `scheduledate` DATE AFTER `penids`,
ADD COLUMN `scheduletime` TIME AFTER `scheduledate`,
ADD COLUMN `repeat_annually` TINYINT(1) DEFAULT 0 AFTER `scheduletime`,
ADD COLUMN `notes` TEXT AFTER `repeat_annually`,
DROP COLUMN `vaccinename`,
DROP COLUMN `targetage`,
DROP COLUMN `frequency`;

-- 2. Update dewormingschedules table
ALTER TABLE `dewormingschedules`
ADD COLUMN `penids` JSON AFTER `schedulename`,
ADD COLUMN `scheduledate` DATE AFTER `penids`,
ADD COLUMN `scheduletime` TIME AFTER `scheduledate`,
ADD COLUMN `repeat_annually` TINYINT(1) DEFAULT 0 AFTER `scheduletime`,
ADD COLUMN `notes` TEXT AFTER `repeat_annually`,
DROP COLUMN `frequency`,
DROP COLUMN `recommendedproduct`;

SET FOREIGN_KEY_CHECKS = 1;

DELIMITER $$

-- 3. SP for Saving Vaccination Schedule
DROP PROCEDURE IF EXISTS `sp_savevaccinationschedule`$$
CREATE PROCEDURE `sp_savevaccinationschedule`(
    IN `$id` INT,
    IN `$diseaseid` INT,
    IN `$penids` JSON,
    IN `$scheduledate` DATE,
    IN `$scheduletime` TIME,
    IN `$repeat_annually` TINYINT(1),
    IN `$notes` TEXT,
    IN `$userid` INT
)
BEGIN
    IF `$id` = 0 THEN
        INSERT INTO `vaccinationschedules` (`diseaseid`, `penids`, `scheduledate`, `scheduletime`, `repeat_annually`, `notes`, `addedby`)
        VALUES (`$diseaseid`, `$penids`, `$scheduledate`, `$scheduletime`, `$repeat_annually`, `$notes`, `$userid`);
    ELSE
        UPDATE `vaccinationschedules` 
        SET `diseaseid` = `$diseaseid`,
            `penids` = `$penids`,
            `scheduledate` = `$scheduledate`,
            `scheduletime` = `$scheduletime`,
            `repeat_annually` = `$repeat_annually`,
            `notes` = `$notes`
        WHERE `id` = `$id`;
    END IF;
END$$

-- 4. SP for Saving Deworming Schedule
DROP PROCEDURE IF EXISTS `sp_savedewormingschedule`$$
CREATE PROCEDURE `sp_savedewormingschedule`(
    IN `$id` INT,
    IN `$schedulename` VARCHAR(100),
    IN `$penids` JSON,
    IN `$scheduledate` DATE,
    IN `$scheduletime` TIME,
    IN `$repeat_annually` TINYINT(1),
    IN `$notes` TEXT,
    IN `$userid` INT
)
BEGIN
    IF `$id` = 0 THEN
        INSERT INTO `dewormingschedules` (`schedulename`, `penids`, `scheduledate`, `scheduletime`, `repeat_annually`, `notes`, `addedby`)
        VALUES (`$schedulename`, `$penids`, `$scheduledate`, `$scheduletime`, `$repeat_annually`, `$notes`, `$userid`);
    ELSE
        UPDATE `dewormingschedules` 
        SET `schedulename` = `$schedulename`,
            `penids` = `$penids`,
            `scheduledate` = `$scheduledate`,
            `scheduletime` = `$scheduletime`,
            `repeat_annually` = `$repeat_annually`,
            `notes` = `$notes`
        WHERE `id` = `$id`;
    END IF;
END$$

-- 5. SP for Getting Vaccination Schedules
DROP PROCEDURE IF EXISTS `sp_getvaccinationschedules`$$
CREATE PROCEDURE `sp_getvaccinationschedules`()
BEGIN
    SELECT 
        v.*,
        d.diseasename,
        JSON_LENGTH(v.penids) as pen_count
    FROM `vaccinationschedules` v
    JOIN `diseases` d ON v.diseaseid = d.id
    WHERE v.deleted = 0
    ORDER BY v.scheduledate DESC, v.scheduletime DESC;
END$$

-- 6. SP for Getting Deworming Schedules
DROP PROCEDURE IF EXISTS `sp_getdewormingschedules`$$
CREATE PROCEDURE `sp_getdewormingschedules`()
BEGIN
    SELECT 
        d.*,
        JSON_LENGTH(d.penids) as pen_count
    FROM `dewormingschedules` d
    WHERE d.deleted = 0
    ORDER BY d.scheduledate DESC, d.scheduletime DESC;
END$$

-- 7. SP for Getting Schedule Statistics
DROP PROCEDURE IF EXISTS `sp_getschedulestats`$$
CREATE PROCEDURE `sp_getschedulestats`()
BEGIN
    DECLARE `$completed` INT DEFAULT 0;
    DECLARE `$pending` INT DEFAULT 0;
    DECLARE `$overdue` INT DEFAULT 0;
    
    -- Completed: Unique animals treated in the last 30 days
    SELECT COUNT(DISTINCT animalid) INTO `$completed` 
    FROM (
        SELECT animalid FROM vaccinations WHERE deleted = 0 AND vaccinationdate >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY)
        UNION
        SELECT animalid FROM deworming WHERE deleted = 0 AND dewormingdate >= DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY)
    ) as combined;
    
    -- Pending: Unique animals in pens with upcoming schedules
    SELECT COUNT(DISTINCT a.id) INTO `$pending`
    FROM animals a
    WHERE EXISTS (
        SELECT 1 FROM vaccinationschedules vs 
        WHERE vs.deleted = 0 AND vs.scheduledate >= CURRENT_DATE 
        AND JSON_CONTAINS(vs.penids, CAST(a.penid AS CHAR))
    ) OR EXISTS (
        SELECT 1 FROM dewormingschedules ds 
        WHERE ds.deleted = 0 AND ds.scheduledate >= CURRENT_DATE 
        AND JSON_CONTAINS(ds.penids, CAST(a.penid AS CHAR))
    );
    
    -- Overdue: Unique animals in pens with past schedules (not yet completed)
    SELECT COUNT(DISTINCT a.id) INTO `$overdue`
    FROM animals a
    WHERE EXISTS (
        SELECT 1 FROM vaccinationschedules vs 
        WHERE vs.deleted = 0 AND vs.scheduledate < CURRENT_DATE 
        AND JSON_CONTAINS(vs.penids, CAST(a.penid AS CHAR))
    ) OR EXISTS (
        SELECT 1 FROM dewormingschedules ds 
        WHERE ds.deleted = 0 AND ds.scheduledate < CURRENT_DATE 
        AND JSON_CONTAINS(ds.penids, CAST(a.penid AS CHAR))
    );

    SELECT `$completed` as completed, `$pending` as pending, `$overdue` as overdue;
END$$

DELIMITER ;
