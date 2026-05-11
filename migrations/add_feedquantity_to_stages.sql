-- Jukam Poultry Management System - Add Feed Quantity to Flock Stages
-- File: migrations/add_feedquantity_to_stages.sql

ALTER TABLE poultryflockstages ADD COLUMN feedquantity INT DEFAULT 140 AFTER duration;

DELIMITER //

DROP PROCEDURE IF EXISTS sp_savepoultryflockstage //
CREATE PROCEDURE sp_savepoultryflockstage(
    IN $id INT,
    IN $stagename VARCHAR(100),
    IN $birdtype VARCHAR(100),
    IN $duration VARCHAR(100),
    IN $feedquantity INT,
    IN $userid INT,
    IN $platform VARCHAR(1000)
)
BEGIN
    DECLARE $originalvalues MEDIUMTEXT DEFAULT '';
    DECLARE $updatedvalues MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    IF $id = 0 THEN
        INSERT INTO poultryflockstages (stagename, birdtype, duration, feedquantity, addedby)
        VALUES ($stagename, $birdtype, $duration, $feedquantity, $userid);
        SET $id = LAST_INSERT_ID();
        SET $updatedvalues = JSON_OBJECT('id', $id, 'stagename', $stagename, 'feedquantity', $feedquantity);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
        VALUES (NOW(), $userid, 'Insert', CONCAT('Added Flock Stage: ', $stagename), $platform, $updatedvalues);
    ELSE
        SELECT JSON_OBJECT('stagename', stagename, 'feedquantity', feedquantity) INTO $originalvalues 
        FROM poultryflockstages WHERE stageid = $id;
        UPDATE poultryflockstages 
        SET stagename = $stagename, birdtype = $birdtype, duration = $duration, feedquantity = $feedquantity
        WHERE stageid = $id;
        SET $updatedvalues = JSON_OBJECT('id', $id, 'stagename', $stagename, 'feedquantity', $feedquantity);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, originalvalues, updatedvalues)
        VALUES (NOW(), $userid, 'Update', CONCAT('Updated Flock Stage: ', $stagename), $platform, $originalvalues, $updatedvalues);
    END IF;
    COMMIT;
    SELECT $id AS stageid;
END //

DELIMITER ;
