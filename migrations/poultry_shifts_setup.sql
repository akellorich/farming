-- Jukam Poultry Management System - Collection Shifts Migration
-- File: migrations/poultry_shifts_setup.sql

CREATE TABLE IF NOT EXISTS poultrycollectionshifts (
    shiftid INT PRIMARY KEY AUTO_INCREMENT,
    shiftname VARCHAR(50) NOT NULL,
    shifttime TIME NOT NULL,
    addedby INT,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Seed Data
INSERT INTO poultrycollectionshifts (shiftname, shifttime, addedby)
VALUES 
('Morning', '06:00:00', 1),
('Midday', '10:00:00', 1),
('Evening', '16:00:00', 1);

-- Stored Procedure to retrieve shifts and identify the closest one
DELIMITER //
DROP PROCEDURE IF EXISTS sp_getpoultrycollectionshifts //
CREATE PROCEDURE sp_getpoultrycollectionshifts()
BEGIN
    DECLARE $now TIME DEFAULT CURTIME();
    
    SELECT 
        shiftid, 
        shiftname, 
        shifttime,
        DATE_FORMAT(shifttime, '%h:%i %p') as formatted_time,
        (CASE 
            WHEN shiftid = (
                SELECT shiftid 
                FROM poultrycollectionshifts 
                ORDER BY ABS(TIMEDIFF(shifttime, $now)) ASC 
                LIMIT 1
            ) THEN 1 
            ELSE 0 
        END) as is_default
    FROM poultrycollectionshifts
    ORDER BY shifttime ASC;
END //
DELIMITER ;
