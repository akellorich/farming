-- Serials Configuration for Veterinarians
INSERT INTO `serials` (`document`, `prefix`, `currentno`, `addedby`) 
VALUES ('Veterinarian Registration', 'VET-', 1, 5)
ON DUPLICATE KEY UPDATE `document` = `document`;

DELIMITER $$

-- Function to generate the next Veterinarian Registration Number
DROP FUNCTION IF EXISTS `fn_generatevetregno`$$
CREATE FUNCTION `fn_generatevetregno`() RETURNS VARCHAR(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    READS SQL DATA
BEGIN
    DECLARE $prefix VARCHAR(50);
    DECLARE $currentno INT;
    DECLARE $formatted_no VARCHAR(50);

    SELECT `prefix`, `currentno` INTO $prefix, $currentno 
    FROM `serials` WHERE `document` = 'Veterinarian Registration';
    
    SET $formatted_no = LPAD($currentno, 3, '0');
    
    RETURN CONCAT($prefix, $formatted_no);
END$$

DELIMITER ;
