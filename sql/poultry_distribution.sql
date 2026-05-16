-- Poultry Distribution & Egg Logistics Schema
-- Implementation: Multi-branch, update-safe

-- 1. Distribution Points for Poultry
CREATE TABLE IF NOT EXISTS `poultry_distribution_points` (
    `pointid` INT AUTO_INCREMENT PRIMARY KEY,
    `pointname` VARCHAR(100) NOT NULL,
    `location` VARCHAR(150),
    `contactperson` VARCHAR(100),
    `contactphone` VARCHAR(20),
    `branchid` INT NOT NULL,
    `addedby` INT,
    `dateadded` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 2. Egg Disbursement Logs
CREATE TABLE IF NOT EXISTS `egg_disbursements` (
    `disbursementid` INT AUTO_INCREMENT PRIMARY KEY,
    `pointid` INT NOT NULL,
    `disbursementdate` DATE NOT NULL,
    `quantity` INT NOT NULL DEFAULT 0, -- Number of eggs
    `trays` DECIMAL(10,2) DEFAULT 0, -- Calculated as quantity / 30 (optional)
    `collectorname` VARCHAR(100),
    `narration` TEXT,
    `batchnumber` VARCHAR(50),
    `branchid` INT NOT NULL,
    `addedby` INT,
    `dateadded` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    FOREIGN KEY (`pointid`) REFERENCES `poultry_distribution_points`(`pointid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- CRUD PROCEDURES

DELIMITER //

-- Save/Update Distribution Point
CREATE PROCEDURE `sp_savepoultrydistributionpoint`(
    IN $pointid INT,
    IN $pointname VARCHAR(100),
    IN $location VARCHAR(150),
    IN $contactperson VARCHAR(100),
    IN $contactphone VARCHAR(20),
    IN $branchid INT,
    IN $userid INT
)
BEGIN
    IF $pointid = 0 THEN
        INSERT INTO `poultry_distribution_points` (pointname, location, contactperson, contactphone, branchid, addedby)
        VALUES ($pointname, $location, $contactperson, $contactphone, $branchid, $userid);
    ELSE
        UPDATE `poultry_distribution_points` 
        SET pointname = $pointname, location = $location, contactperson = $contactperson, contactphone = $contactphone
        WHERE pointid = $pointid;
    END IF;
END //

-- Save/Update Egg Disbursement
CREATE PROCEDURE `sp_saveeggdisbursement`(
    IN $disbursementid INT,
    IN $pointid INT,
    IN $disbursementdate DATE,
    IN $quantity INT,
    IN $collectorname VARCHAR(100),
    IN $narration TEXT,
    IN $batchnumber VARCHAR(50),
    IN $branchid INT,
    IN $userid INT
)
BEGIN
    IF $disbursementid = 0 THEN
        INSERT INTO `egg_disbursements` (pointid, disbursementdate, quantity, trays, collectorname, narration, batchnumber, branchid, addedby)
        VALUES ($pointid, $disbursementdate, $quantity, $quantity / 30, $collectorname, $narration, $batchnumber, $branchid, $userid);
    ELSE
        UPDATE `egg_disbursements` 
        SET pointid = $pointid, disbursementdate = $disbursementdate, quantity = $quantity, trays = $quantity / 30, 
            collectorname = $collectorname, narration = $narration, batchnumber = $batchnumber
        WHERE disbursementid = $disbursementid;
    END IF;
END //

-- Get Distribution Stats
CREATE PROCEDURE `sp_getpoultrydistributionstats`(IN $branchid INT)
BEGIN
    DECLARE $total_today INT;
    DECLARE $total_month INT;
    DECLARE $peak_hub VARCHAR(100);
    DECLARE $peak_vol INT;

    SELECT IFNULL(SUM(quantity), 0) INTO $total_today 
    FROM `egg_disbursements` 
    WHERE branchid = $branchid AND deleted = 0 AND disbursementdate = CURRENT_DATE;

    SELECT IFNULL(SUM(quantity), 0) INTO $total_month 
    FROM `egg_disbursements` 
    WHERE branchid = $branchid AND deleted = 0 AND MONTH(disbursementdate) = MONTH(CURRENT_DATE) AND YEAR(disbursementdate) = YEAR(CURRENT_DATE);

    SELECT p.pointname, SUM(e.quantity) INTO $peak_hub, $peak_vol
    FROM `egg_disbursements` e
    JOIN `poultry_distribution_points` p ON e.pointid = p.pointid
    WHERE e.branchid = $branchid AND e.deleted = 0 AND MONTH(e.disbursementdate) = MONTH(CURRENT_DATE)
    GROUP BY p.pointid
    ORDER BY SUM(e.quantity) DESC LIMIT 1;

    SELECT $total_today AS total_today, $total_month AS total_month, IFNULL($peak_hub, 'N/A') AS peak_hub, IFNULL($peak_vol, 0) AS peak_vol;
END //

-- Get Distribution Trends (Last 7 Days)
CREATE PROCEDURE `sp_getpoultrydistributiontrends`(IN $branchid INT)
BEGIN
    SELECT 
        DATE_FORMAT(disbursementdate, '%a') as day_label,
        SUM(quantity) as total_quantity
    FROM `egg_disbursements`
    WHERE branchid = $branchid AND deleted = 0 
    AND disbursementdate >= DATE_SUB(CURRENT_DATE, INTERVAL 6 DAY)
    GROUP BY disbursementdate
    ORDER BY disbursementdate ASC;
END //

-- Hub Market Share
CREATE PROCEDURE `sp_getpoultryhubmarketshare`(IN $branchid INT)
BEGIN
    SELECT 
        p.pointname,
        SUM(e.quantity) as total_quantity
    FROM `egg_disbursements` e
    JOIN `poultry_distribution_points` p ON e.pointid = p.pointid
    WHERE e.branchid = $branchid AND e.deleted = 0
    GROUP BY p.pointid
    ORDER BY total_quantity DESC;
END //

DELIMITER ;

-- SEED DATA
-- Populate default distribution hubs for testing/initialization
INSERT IGNORE INTO `poultry_distribution_points` (pointid, pointname, location, contactperson, contactphone, branchid, addedby) VALUES
(1, 'Central City Market', 'Nairobi CBD, Main Square', 'Alice Wanjiku', '0722100200', 1, 1),
(2, 'Western Distribution Hub', 'Kisumu, Lakeside Industrial', 'Brian Otieno', '0733400500', 1, 1),
(3, 'Coast Regional Depot', 'Mombasa, Nyali Heights', 'Chantal Mwaka', '0711900800', 1, 1),
(4, 'Rift Valley Logistics', 'Nakuru, Gate House', 'David Kiprop', '0700123456', 1, 1),
(5, 'Eastern Retail Center', 'Machakos, Market St.', 'Esther Mutua', '0788665544', 1, 1);

-- Sample Egg Disbursements (Last 7 Days)
INSERT IGNORE INTO `egg_disbursements` (pointid, disbursementdate, quantity, trays, collectorname, narration, batchnumber, branchid, addedby) VALUES
(1, DATE_SUB(CURRENT_DATE, INTERVAL 6 DAY), 1200, 40.00, 'John Doe', 'Weekly delivery', 'B-001', 1, 1),
(2, DATE_SUB(CURRENT_DATE, INTERVAL 5 DAY), 900, 30.00, 'Jane Smith', 'Hospital supply', 'B-002', 1, 1),
(3, DATE_SUB(CURRENT_DATE, INTERVAL 4 DAY), 1500, 50.00, 'Mike Ross', 'Hotel contract', 'B-003', 1, 1),
(4, DATE_SUB(CURRENT_DATE, INTERVAL 3 DAY), 2100, 70.00, 'Harvey Specter', 'Bulk order', 'B-004', 1, 1),
(5, DATE_SUB(CURRENT_DATE, INTERVAL 2 DAY), 600, 20.00, 'Donna Paulsen', 'Small retail', 'B-005', 1, 1),
(1, DATE_SUB(CURRENT_DATE, INTERVAL 1 DAY), 1800, 60.00, 'Louis Litt', 'Supermarket restock', 'B-006', 1, 1),
(3, CURRENT_DATE, 3000, 100.00, 'Jessica Pearson', 'Corporate event', 'B-007', 1, 1);
