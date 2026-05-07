DELIMITER //

DROP PROCEDURE IF EXISTS sp_getanimalsbyschedule //
CREATE PROCEDURE sp_getanimalsbyschedule(
    IN `$scheduleid` INT,
    IN `$type` VARCHAR(20)
)
BEGIN
    IF `$scheduleid` = 0 OR `$scheduleid` IS NULL THEN
        -- Load all active animals
        SELECT a.id, a.tagid, a.designatedname, p.penname 
        FROM animals a 
        JOIN pens p ON a.penid = p.id 
        WHERE a.deleted = 0 
        ORDER BY p.penname, a.tagid;
    ELSE
        -- Load animals by schedule pens
        SET @penids = '';
        IF `$type` = 'vaccination' THEN
            SELECT penids INTO @penids FROM vaccinationschedules WHERE id = `$scheduleid`;
        ELSE
            SELECT penids INTO @penids FROM dewormingschedules WHERE id = `$scheduleid`;
        END IF;

        IF @penids IS NOT NULL AND @penids <> '' AND @penids <> '[]' THEN
            -- Handle both numeric arrays [1, 2] and string arrays ["1", "2"]
            -- We check if the penid exists as a number OR as a quoted string in the JSON array
            SELECT a.id, a.tagid, a.designatedname, p.penname 
            FROM animals a 
            JOIN pens p ON a.penid = p.id 
            WHERE (JSON_CONTAINS(@penids, CAST(a.penid AS CHAR)) OR JSON_CONTAINS(@penids, JSON_QUOTE(CAST(a.penid AS CHAR))))
            AND a.deleted = 0
            ORDER BY p.penname, a.tagid;
        ELSE
            -- Return empty set if no pens
            SELECT a.id, a.tagid, a.designatedname, p.penname FROM animals a LIMIT 0;
        END IF;
    END IF;
END //

DROP PROCEDURE IF EXISTS sp_getactivehealthschedules //
CREATE PROCEDURE sp_getactivehealthschedules(
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
        SELECT s.id, d.diseasename as title, s.scheduledate 
        FROM dewormingschedules s 
        JOIN diseases d ON s.diseaseid = d.id 
        WHERE s.deleted = 0 AND s.status != 'Completed'
        ORDER BY s.scheduledate ASC;
    END IF;
END //

DELIMITER ;
