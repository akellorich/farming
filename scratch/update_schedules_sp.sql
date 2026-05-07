DROP PROCEDURE IF EXISTS sp_getactivehealthschedules;
DELIMITER //
CREATE PROCEDURE sp_getactivehealthschedules(
    IN `$type` VARCHAR(20)
)
BEGIN
    IF `$type` = 'vaccination' THEN
        SELECT s.id, d.diseasename as title, s.scheduledate, s.diseaseid 
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
END //
DELIMITER ;
