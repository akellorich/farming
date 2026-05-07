-- Stored Procedures for Health Records Module

-- 1. sp_getupcomingfollowups
DROP PROCEDURE IF EXISTS sp_getupcomingfollowups;
DELIMITER //
CREATE PROCEDURE sp_getupcomingfollowups()
BEGIN
    SELECT hl.*, a.tagid, a.designatedname as animalname, d.diseasename 
    FROM healthlogs hl 
    JOIN animals a ON hl.animalid = a.id 
    LEFT JOIN diseases d ON hl.diseaseid = d.id
    WHERE hl.nextfollowup >= CURDATE() AND hl.deleted = 0 
    ORDER BY hl.nextfollowup ASC;
END //
DELIMITER ;

-- 2. sp_gethealthsummary
DROP PROCEDURE IF EXISTS sp_gethealthsummary;
DELIMITER //
CREATE PROCEDURE sp_gethealthsummary()
BEGIN
    SELECT 
        (SELECT COUNT(*) FROM healthlogs WHERE status != 'Completed' AND deleted = 0) as active_treatments,
        (SELECT COUNT(DISTINCT diseaseid) FROM healthlogs WHERE status != 'Completed' AND deleted = 0) as active_conditions,
        (SELECT COUNT(*) FROM healthlogs WHERE status = 'Quarantined' AND deleted = 0) as quarantine_cases,
        (SELECT MIN(nextfollowup) FROM healthlogs WHERE nextfollowup >= CURDATE() AND deleted = 0) as next_vet_visit;
END //
DELIMITER ;

-- 3. sp_getvaccinationsummary
DROP PROCEDURE IF EXISTS sp_getvaccinationsummary;
DELIMITER //
CREATE PROCEDURE sp_getvaccinationsummary()
BEGIN
    SELECT 
        (SELECT COUNT(DISTINCT animalid) * 100 / (SELECT COUNT(*) FROM animals WHERE deleted = 0) FROM vaccinations) as herd_immunity,
        (SELECT COUNT(*) FROM vaccinations WHERE MONTH(vaccinationdate) = MONTH(CURDATE()) AND YEAR(vaccinationdate) = YEAR(CURDATE())) as completed_month,
        (SELECT COUNT(*) FROM vaccinationschedules WHERE scheduledate < CURDATE() AND status = 'Pending') as overdue,
        (SELECT MIN(scheduledate) FROM vaccinationschedules WHERE scheduledate >= CURDATE() AND status = 'Pending') as next_batch;
END //
DELIMITER ;

-- 4. sp_getupcomingvaccinations
DROP PROCEDURE IF EXISTS sp_getupcomingvaccinations;
DELIMITER //
CREATE PROCEDURE sp_getupcomingvaccinations()
BEGIN
    SELECT vs.*, d.diseasename as vaccine_name, 
           (SELECT GROUP_CONCAT(penname SEPARATOR ', ') 
            FROM pens 
            WHERE JSON_CONTAINS(vs.penids, CAST(id AS CHAR), '$') 
               OR JSON_CONTAINS(vs.penids, JSON_QUOTE(CAST(id AS CHAR)), '$')) as penname
    FROM vaccinationschedules vs
    JOIN diseases d ON vs.diseaseid = d.id
    WHERE vs.scheduledate >= CURDATE() AND vs.status = 'Pending'
    ORDER BY vs.scheduledate ASC;
END //
DELIMITER ;

-- 5. sp_getdistinctvaccines
DROP PROCEDURE IF EXISTS sp_getdistinctvaccines;
DELIMITER //
CREATE PROCEDURE sp_getdistinctvaccines()
BEGIN
    SELECT DISTINCT productused as product FROM vaccinations ORDER BY product ASC;
END //
DELIMITER ;

-- 6. sp_getvaccinationhistory
DROP PROCEDURE IF EXISTS sp_getvaccinationhistory;
DELIMITER //
CREATE PROCEDURE sp_getvaccinationhistory()
BEGIN
    SELECT v.*, a.tagid, a.designatedname as animalname, 
           COALESCE(d.diseasename, v.vaccinename) as diseasename
    FROM vaccinations v
    JOIN animals a ON v.animalid = a.id
    LEFT JOIN vaccinationschedules vs ON v.scheduleid = vs.id
    LEFT JOIN diseases d ON (vs.diseaseid = d.id OR v.diseaseid = d.id)
    ORDER BY v.vaccinationdate DESC;
END //
DELIMITER ;

-- 7. sp_getdeworminghistory
DROP PROCEDURE IF EXISTS sp_getdeworminghistory;
DELIMITER //
CREATE PROCEDURE sp_getdeworminghistory()
BEGIN
    SELECT d.*, a.tagid, a.designatedname as animalname 
    FROM deworming d
    JOIN animals a ON d.animalid = a.id
    ORDER BY d.dewormingdate DESC;
END //
DELIMITER ;

-- 9. sp_getdewormingsummary
DROP PROCEDURE IF EXISTS sp_getdewormingsummary;
DELIMITER //
CREATE PROCEDURE sp_getdewormingsummary()
BEGIN
    SELECT 
        (SELECT COUNT(DISTINCT animalid) * 100 / (SELECT COUNT(*) FROM animals WHERE deleted = 0) FROM deworming) as herd_coverage,
        (SELECT COUNT(*) FROM deworming WHERE MONTH(dewormingdate) = MONTH(CURDATE()) AND YEAR(dewormingdate) = YEAR(CURDATE())) as completed_month,
        (SELECT COUNT(*) FROM dewormingschedules WHERE scheduledate < CURDATE() AND status = 'Pending') as overdue,
        (SELECT MIN(scheduledate) FROM dewormingschedules WHERE scheduledate >= CURDATE() AND status = 'Pending') as next_batch;
END //
DELIMITER ;

-- 10. sp_getupcomingdeworming
DROP PROCEDURE IF EXISTS sp_getupcomingdeworming;
DELIMITER //
CREATE PROCEDURE sp_getupcomingdeworming()
BEGIN
    SELECT ds.*, 
           (SELECT GROUP_CONCAT(penname SEPARATOR ', ') 
            FROM pens 
            WHERE JSON_CONTAINS(ds.penids, CAST(id AS CHAR), '$') 
               OR JSON_CONTAINS(ds.penids, JSON_QUOTE(CAST(id AS CHAR)), '$')) as penname
    FROM dewormingschedules ds
    WHERE ds.scheduledate >= CURDATE() AND ds.status = 'Pending'
    ORDER BY ds.scheduledate ASC;
END //
DELIMITER ;

-- 8. sp_recordbulkvaccination
DROP PROCEDURE IF EXISTS sp_recordbulkvaccination;
DELIMITER //
CREATE PROCEDURE sp_recordbulkvaccination(
    IN `$scheduleid` INT,
    IN `$diseaseid` INT,
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
            `animalid`, `scheduleid`, `diseaseid`, `vaccinationdate`, `productused`, `batchno`, `dosage`, `administeredby`, `notes`, `record_type`, `addedby`
        ) VALUES (
            `$animalid`, `$scheduleid`, `$diseaseid`, `$vaccinationdate`, `$productused`, `$batchno`, `$dosage`, `$administeredby`, `$notes`, `$rec_type`, `$userid`
        );
        
        SET i = i + 1;
    END WHILE;

    IF `$scheduleid` > 0 THEN
        UPDATE `vaccinationschedules` SET `status` = 'Completed' WHERE `id` = `$scheduleid`;
    END IF;
END //
DELIMITER ;
