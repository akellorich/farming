-- Jukam Poultry Management System - Feeding Management Migration
-- File: migrations/poultry_feeding_setup.sql

SET FOREIGN_KEY_CHECKS = 0;

-- 1. Create Poultry Feeding Table
CREATE TABLE IF NOT EXISTS `poultry_feeding_logs` (
    `feedingid` INT AUTO_INCREMENT PRIMARY KEY,
    `flockid` INT NOT NULL,
    `feedingdate` DATE NOT NULL,
    `feedcategory` VARCHAR(50) NOT NULL, -- 'ready' or 'mix'
    `itemid` INT NOT NULL, -- references either inventoryitem or formulation
    `quantity` DECIMAL(10,2) NOT NULL, -- in kg
    `costperkg` DECIMAL(10,2) NOT NULL,
    `totalcost` DECIMAL(10,2) NOT NULL,
    `addedby` INT,
    `createdat` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    CONSTRAINT `fk_feeding_flock` FOREIGN KEY (`flockid`) REFERENCES `poultryflocks`(`flockid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DELIMITER $$

-- 2. Stored Procedure to save feeding
DROP PROCEDURE IF EXISTS `sp_savepoultryfeeding`$$
CREATE PROCEDURE `sp_savepoultryfeeding`(
    IN `$flockno` VARCHAR(50),
    IN `$feedingdate` DATE,
    IN `$feedcategory` VARCHAR(50),
    IN `$itemid` INT,
    IN `$quantity` DECIMAL(10,2),
    IN `$costperkg` DECIMAL(10,2),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$actual_flockid` INT;
    DECLARE `$totalcost` DECIMAL(10,2);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    -- Get actual flock ID
    SELECT `flockid` INTO `$actual_flockid` FROM `poultryflocks` WHERE `flockno` = `$flockno` AND `deleted` = 0;
    
    IF `$actual_flockid` IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Flock ID: The provided Flock ID does not exist.';
    END IF;

    SET `$totalcost` = `$quantity` * `$costperkg`;

    INSERT INTO `poultry_feeding_logs` (
        `flockid`, `feedingdate`, `feedcategory`, `itemid`, `quantity`, `costperkg`, `totalcost`, `addedby`
    ) VALUES (
        `$actual_flockid`, `$feedingdate`, `$feedcategory`, `$itemid`, `$quantity`, `$costperkg`, `$totalcost`, `$userid`
    );

    -- Audit Trail
    INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
    VALUES (NOW(), `$userid`, 'Insert', CONCAT('Recorded Feeding for Flock: ', `$flockno`, ' (Qty: ', `$quantity`, 'kg)'), `$platform`, 
            JSON_OBJECT('flockno', `$flockno`, 'qty', `$quantity`, 'itemid', `$itemid`, 'totalcost', `$totalcost`));

    COMMIT;
END$$

DELIMITER ;

SET FOREIGN_KEY_CHECKS = 1;
