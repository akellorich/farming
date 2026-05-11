-- Jukam Poultry Management System - Inventory Expansion
-- File: migrations/poultry_inventory_expansion.sql

-- 1. Alter poultryinventoryitems to include stock levels
ALTER TABLE poultryinventoryitems 
ADD COLUMN currentstock DECIMAL(15, 2) DEFAULT 0.00 AFTER isfeed,
ADD COLUMN reorderlevel DECIMAL(15, 2) DEFAULT 0.00 AFTER currentstock;

-- 2. Create poultrysuppliers table
CREATE TABLE IF NOT EXISTS poultrysuppliers (
    supplierid INT PRIMARY KEY AUTO_INCREMENT,
    regno VARCHAR(50) NOT NULL UNIQUE,
    suppliername VARCHAR(150) NOT NULL,
    contactperson VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    location TEXT,
    creditlimit DECIMAL(15, 2) DEFAULT 0.00,
    status VARCHAR(20) DEFAULT 'Active',
    addedby INT,
    deleted TINYINT(1) DEFAULT 0,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Function to generate supplier regno
DELIMITER //
DROP FUNCTION IF EXISTS fn_generate_poultry_supplier_regno //
CREATE FUNCTION fn_generate_poultry_supplier_regno() RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE $newno INT;
    DECLARE $prefix VARCHAR(10) DEFAULT 'SUP-';
    DECLARE $year VARCHAR(4);
    SET $year = YEAR(CURDATE());
    
    SELECT IFNULL(MAX(CAST(SUBSTRING(regno, 10) AS UNSIGNED)), 0) + 1 INTO $newno 
    FROM poultrysuppliers 
    WHERE regno LIKE CONCAT($prefix, $year, '-%');
    
    RETURN CONCAT($prefix, $year, '-', LPAD($newno, 3, '0'));
END //
DELIMITER ;

-- 4. Create poultryinventoryreceipts table
CREATE TABLE IF NOT EXISTS poultryinventoryreceipts (
    receiptid INT PRIMARY KEY AUTO_INCREMENT,
    supplierid INT NOT NULL,
    lpono VARCHAR(50),
    datereceived DATE NOT NULL,
    inspectedby VARCHAR(100),
    notes TEXT,
    totalamount DECIMAL(15, 2) DEFAULT 0.00,
    addedby INT,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted TINYINT(1) DEFAULT 0,
    FOREIGN KEY (supplierid) REFERENCES poultrysuppliers(supplierid)
);

-- 5. Create poultryinventoryreceiptitems table
CREATE TABLE IF NOT EXISTS poultryinventoryreceiptitems (
    id INT PRIMARY KEY AUTO_INCREMENT,
    receiptid INT NOT NULL,
    itemid INT NOT NULL,
    quantity DECIMAL(15, 2) NOT NULL,
    unitprice DECIMAL(15, 2) NOT NULL,
    totalprice DECIMAL(15, 2) AS (quantity * unitprice) STORED,
    FOREIGN KEY (receiptid) REFERENCES poultryinventoryreceipts(receiptid) ON DELETE CASCADE,
    FOREIGN KEY (itemid) REFERENCES poultryinventoryitems(itemid)
);

-- 6. Seed Suppliers
INSERT INTO poultrysuppliers (regno, suppliername, contactperson, phone, email, location, creditlimit, addedby)
VALUES 
(fn_generate_poultry_supplier_regno(), 'Vitamech Feeds Ltd', 'John Mutua', '0711223344', 'sales@vitamech.co.ke', 'Industrial Area, Nairobi', 500000, 1),
(fn_generate_poultry_supplier_regno(), 'Ungama Miller', 'Sarah Wanjiku', '0722334455', 'info@ungama.com', 'Thika Road', 250000, 1),
(fn_generate_poultry_supplier_regno(), 'Agro-Chemicals Co', 'David Koech', '0733445566', 'support@agrochem.ke', 'Nakuru Town', 100000, 1);

-- 7. Update sp_savepoultryinventoryitem to handle reorderlevel
DELIMITER //
DROP PROCEDURE IF EXISTS sp_savepoultryinventoryitem //
CREATE PROCEDURE sp_savepoultryinventoryitem(
    IN $id INT,
    IN $itemname VARCHAR(100),
    IN $itemcode VARCHAR(50),
    IN $categoryid INT,
    IN $unit VARCHAR(50),
    IN $isfeed TINYINT,
    IN $reorderlevel DECIMAL(15,2),
    IN $userid INT,
    IN $platform VARCHAR(1000)
)
BEGIN
    DECLARE $originalvalues MEDIUMTEXT DEFAULT '';
    DECLARE $updatedvalues MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    IF $id = 0 THEN
        INSERT INTO poultryinventoryitems (itemname, itemcode, categoryid, unit, isfeed, reorderlevel, addedby)
        VALUES ($itemname, $itemcode, $categoryid, $unit, $isfeed, $reorderlevel, $userid);
        SET $id = LAST_INSERT_ID();
        SET $updatedvalues = JSON_OBJECT('id', $id, 'itemname', $itemname, 'reorderlevel', $reorderlevel);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
        VALUES (NOW(), $userid, 'Insert', CONCAT('Provisioned Inventory Item: ', $itemname), $platform, $updatedvalues);
    ELSE
        SELECT JSON_OBJECT('itemname', itemname, 'reorderlevel', reorderlevel) INTO $originalvalues 
        FROM poultryinventoryitems WHERE itemid = $id;
        UPDATE poultryinventoryitems 
        SET itemname = $itemname, itemcode = $itemcode, categoryid = $categoryid, unit = $unit, isfeed = $isfeed, reorderlevel = $reorderlevel
        WHERE itemid = $id;
        SET $updatedvalues = JSON_OBJECT('id', $id, 'itemname', $itemname, 'reorderlevel', $reorderlevel);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, originalvalues, updatedvalues)
        VALUES (NOW(), $userid, 'Update', CONCAT('Updated Inventory Item: ', $itemname), $platform, $originalvalues, $updatedvalues);
    END IF;
    COMMIT;
    SELECT $id AS itemid;
END //
DELIMITER ;

-- 8. Add some dummy stock for demonstration
UPDATE poultryinventoryitems SET currentstock = 2800, reorderlevel = 4000 WHERE itemname LIKE '%Layer%Mash%';
UPDATE poultryinventoryitems SET currentstock = 450, reorderlevel = 2000 WHERE itemname LIKE '%Grower%Mash%';
UPDATE poultryinventoryitems SET currentstock = 1000, reorderlevel = 1500 WHERE itemname LIKE '%Kienyeji%Mash%';
