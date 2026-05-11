-- Jukam Poultry Management System - Egg Collection Migration
-- File: migrations/poultry_egg_collection_setup.sql

CREATE TABLE IF NOT EXISTS poultry_egg_collection (
    id INT AUTO_INCREMENT PRIMARY KEY,
    flockid INT NOT NULL,
    collectiondate DATE NOT NULL,
    shiftid INT NOT NULL,
    goodcount INT DEFAULT 0,
    brokencount INT DEFAULT 0,
    narration TEXT,
    addedby INT,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted TINYINT(1) DEFAULT 0,
    CONSTRAINT fk_egg_flock FOREIGN KEY (flockid) REFERENCES poultryflocks(flockid),
    CONSTRAINT fk_egg_shift FOREIGN KEY (shiftid) REFERENCES poultrycollectionshifts(shiftid)
);

DELIMITER //
DROP PROCEDURE IF EXISTS sp_savepoultryeggcollection //
CREATE PROCEDURE sp_savepoultryeggcollection(
    IN $flockid INT,
    IN $collectiondate DATE,
    IN $shiftid INT,
    IN $goodcount INT,
    IN $brokencount INT,
    IN $narration TEXT,
    IN $userid INT,
    IN $platform VARCHAR(100)
)
BEGIN
    INSERT INTO poultry_egg_collection (flockid, collectiondate, shiftid, goodcount, brokencount, narration, addedby)
    VALUES ($flockid, $collectiondate, $shiftid, $goodcount, $brokencount, $narration, $userid);
    
    -- Audit Trail
    INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
    VALUES (NOW(), $userid, 'Insert', CONCAT('Recorded Egg Collection: ', $goodcount, ' Good, ', $brokencount, ' Broken'), $platform, 
            JSON_OBJECT('flockid', $flockid, 'date', $collectiondate, 'shiftid', $shiftid));
END //
DELIMITER ;
