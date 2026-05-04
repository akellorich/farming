-- Serials Table for Document Auto-Numbering
CREATE TABLE IF NOT EXISTS `serials` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `document` VARCHAR(100) NOT NULL UNIQUE,
    `prefix` VARCHAR(50) NOT NULL,
    `currentno` INT NOT NULL DEFAULT 1,
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `fkserialsaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Seed Data for Animal Tag
INSERT INTO `serials` (`document`, `prefix`, `currentno`, `addedby`) 
VALUES ('Animal Tag', 'JK-{{year}}-', 1, 5)
ON DUPLICATE KEY UPDATE `document` = `document`;

DELIMITER $$

-- Function to generate the next Animal Tag
DROP FUNCTION IF EXISTS `fn_generateanimaltag`$$
CREATE FUNCTION `fn_generateanimaltag`() RETURNS VARCHAR(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    READS SQL DATA
BEGIN
    DECLARE $prefix VARCHAR(50);
    DECLARE $currentno INT;
    DECLARE $formatted_no VARCHAR(50);
    DECLARE $year VARCHAR(4);
    DECLARE $final_prefix VARCHAR(50);

    SELECT `prefix`, `currentno` INTO $prefix, $currentno 
    FROM `serials` WHERE `document` = 'Animal Tag';
    
    SET $year = YEAR(CURDATE());
    SET $final_prefix = REPLACE($prefix, '{{year}}', $year);

    SET $formatted_no = LPAD($currentno, 5, '0');
    
    RETURN CONCAT($final_prefix, $formatted_no);
END$$

DELIMITER ;
