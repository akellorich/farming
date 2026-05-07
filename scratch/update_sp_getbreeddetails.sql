DELIMITER //
CREATE OR REPLACE PROCEDURE sp_getbreeddetails(
    IN `$id` INT
)
BEGIN
    SELECT 
        b.*, 
        c.countryname, 
        CONCAT(u.firstname, ' ', u.lastname) AS addedbyname,
        (SELECT COUNT(*) FROM animals a WHERE a.breedid = b.id AND a.deleted = 0) AS totalcount,
        COALESCE((
            SELECT AVG(mc.quantitylitres) 
            FROM milkcollection mc 
            JOIN animals a ON mc.animalid = a.id 
            WHERE a.breedid = b.id AND mc.deleted = 0
        ), 0) AS avg_actual_milking,
        CASE 
            WHEN b.avgmilking > 0 THEN 
                LEAST(100, ROUND((COALESCE((
                    SELECT AVG(mc.quantitylitres) 
                    FROM milkcollection mc 
                    JOIN animals a ON mc.animalid = a.id 
                    WHERE a.breedid = b.id AND mc.deleted = 0
                ), 0) / b.avgmilking) * 100, 1))
            ELSE 0 
        END AS efficiency,
        CASE 
            WHEN (SELECT COUNT(*) FROM healthlogs hl JOIN animals a ON hl.animalid = a.id WHERE a.breedid = b.id AND hl.status = 'Recovering' AND hl.deleted = 0) > 0 THEN 'GOOD'
            ELSE 'OPTIMAL'
        END AS health_status
    FROM breeds b
    LEFT JOIN countries c ON b.originid = c.id
    LEFT JOIN user u ON b.addedby = u.userid
    WHERE b.id = `$id` AND b.deleted = 0;
END //
DELIMITER ;
