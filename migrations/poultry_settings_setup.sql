-- Jukam Poultry Management System - Settings Migration (Full CRUD with Soft Delete and Audit Trail)
-- File: migrations/poultry_settings_setup.sql

-- TABLES
CREATE TABLE IF NOT EXISTS poultrybreeds (
    breedid INT PRIMARY KEY AUTO_INCREMENT,
    breedname VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    notes TEXT,
    status VARCHAR(50) DEFAULT 'Active',
    addedby INT,
    deleted TINYINT(1) DEFAULT 0,
    deletedby INT,
    datedeleted DATETIME,
    reasondeleted TEXT,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS poultrybirdtypes (
    typeid INT PRIMARY KEY AUTO_INCREMENT,
    typename VARCHAR(100) NOT NULL,
    description TEXT,
    maturityperiod INT DEFAULT 130,
    addedby INT,
    deleted TINYINT(1) DEFAULT 0,
    deletedby INT,
    datedeleted DATETIME,
    reasondeleted TEXT,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS poultryflockstages (
    stageid INT PRIMARY KEY AUTO_INCREMENT,
    stagename VARCHAR(100) NOT NULL,
    birdtype VARCHAR(100) NOT NULL,
    duration VARCHAR(100),
    addedby INT,
    deleted TINYINT(1) DEFAULT 0,
    deletedby INT,
    datedeleted DATETIME,
    reasondeleted TEXT,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS poultryhouses (
    houseid INT PRIMARY KEY AUTO_INCREMENT,
    housename VARCHAR(100) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'Active',
    addedby INT,
    deleted TINYINT(1) DEFAULT 0,
    deletedby INT,
    datedeleted DATETIME,
    reasondeleted TEXT,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS poultryinventorycategories (
    categoryid INT PRIMARY KEY AUTO_INCREMENT,
    categorycode VARCHAR(50) NOT NULL UNIQUE,
    categoryname VARCHAR(100) NOT NULL,
    prefix VARCHAR(20),
    currentno INT DEFAULT 1,
    padzeros TINYINT(1) DEFAULT 1,
    addedby INT,
    deleted TINYINT(1) DEFAULT 0,
    deletedby INT,
    datedeleted DATETIME,
    reasondeleted TEXT,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS poultryinventoryitems (
    itemid INT PRIMARY KEY AUTO_INCREMENT,
    itemname VARCHAR(100) NOT NULL,
    itemcode VARCHAR(50) NOT NULL UNIQUE,
    categoryid INT,
    unit VARCHAR(50),
    isfeed TINYINT(1) DEFAULT 0,
    addedby INT,
    deleted TINYINT(1) DEFAULT 0,
    deletedby INT,
    datedeleted DATETIME,
    reasondeleted TEXT,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS poultrydiseases (
    diseaseid INT PRIMARY KEY AUTO_INCREMENT,
    diseasename VARCHAR(100) NOT NULL,
    description TEXT,
    severity VARCHAR(50),
    addedby INT,
    deleted TINYINT(1) DEFAULT 0,
    deletedby INT,
    datedeleted DATETIME,
    reasondeleted TEXT,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS poultrymortalityreasons (
    reasonid INT PRIMARY KEY AUTO_INCREMENT,
    reasonlabel VARCHAR(100) NOT NULL,
    description TEXT,
    addedby INT,
    deleted TINYINT(1) DEFAULT 0,
    deletedby INT,
    datedeleted DATETIME,
    reasondeleted TEXT,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS poultryformulations (
    formulationid INT PRIMARY KEY AUTO_INCREMENT,
    formulationname VARCHAR(100) NOT NULL,
    birdtype VARCHAR(50),
    growthstage VARCHAR(50),
    addedby INT,
    deleted TINYINT(1) DEFAULT 0,
    deletedby INT,
    datedeleted DATETIME,
    reasondeleted TEXT,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS poultryformulationingredients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    formulationid INT NOT NULL,
    itemid INT NOT NULL,
    quantity DECIMAL(10,2) NOT NULL,
    createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (formulationid) REFERENCES poultryformulations(formulationid) ON DELETE CASCADE
);

-- STORED PROCEDURES (CRUD with Soft Delete and Audit Trail)

DELIMITER //

-- Breeds CRUD
DROP PROCEDURE IF EXISTS sp_savepoultrybreed //
CREATE PROCEDURE sp_savepoultrybreed(
    IN $id INT,
    IN $breedname VARCHAR(100),
    IN $category VARCHAR(50),
    IN $notes TEXT,
    IN $status VARCHAR(50),
    IN $userid INT,
    IN $platform VARCHAR(1000)
)
BEGIN
    DECLARE $originalvalues MEDIUMTEXT DEFAULT '';
    DECLARE $updatedvalues MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    IF $id = 0 THEN
        INSERT INTO poultrybreeds (breedname, category, notes, status, addedby)
        VALUES ($breedname, $category, $notes, $status, $userid);
        SET $id = LAST_INSERT_ID();
        SET $updatedvalues = JSON_OBJECT('id', $id, 'breedname', $breedname, 'category', $category, 'status', $status);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
        VALUES (NOW(), $userid, 'Insert', CONCAT('Added Poultry Breed: ', $breedname), $platform, $updatedvalues);
    ELSE
        SELECT JSON_OBJECT('breedname', breedname, 'category', category, 'status', status) INTO $originalvalues 
        FROM poultrybreeds WHERE breedid = $id;
        UPDATE poultrybreeds 
        SET breedname = $breedname, category = $category, notes = $notes, status = $status
        WHERE breedid = $id;
        SET $updatedvalues = JSON_OBJECT('id', $id, 'breedname', $breedname, 'category', $category, 'status', $status);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, originalvalues, updatedvalues)
        VALUES (NOW(), $userid, 'Update', CONCAT('Updated Poultry Breed: ', $breedname), $platform, $originalvalues, $updatedvalues);
    END IF;
    COMMIT;
    SELECT $id AS breedid;
END //

DROP PROCEDURE IF EXISTS sp_deletepoultrybreed //
CREATE PROCEDURE sp_deletepoultrybreed(
    IN $id INT,
    IN $userid INT,
    IN $reason TEXT,
    IN $platform VARCHAR(1000)
)
BEGIN
    UPDATE poultrybreeds 
    SET deleted = 1, deletedby = $userid, datedeleted = NOW(), reasondeleted = $reason
    WHERE breedid = $id;
    
    INSERT INTO audittrail (timestamp, userid, operation, narration, platform)
    VALUES (NOW(), $userid, 'Delete', CONCAT('Deleted Poultry Breed ID: ', $id), $platform);
END //

-- Bird Types CRUD
DROP PROCEDURE IF EXISTS sp_savepoultrybirdtype //
CREATE PROCEDURE sp_savepoultrybirdtype(
    IN $id INT,
    IN $typename VARCHAR(100),
    IN $description TEXT,
    IN $maturityperiod INT,
    IN $userid INT,
    IN $platform VARCHAR(1000)
)
BEGIN
    DECLARE $originalvalues MEDIUMTEXT DEFAULT '';
    DECLARE $updatedvalues MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    IF $id = 0 THEN
        INSERT INTO poultrybirdtypes (typename, description, maturityperiod, addedby)
        VALUES ($typename, $description, $maturityperiod, $userid);
        SET $id = LAST_INSERT_ID();
        SET $updatedvalues = JSON_OBJECT('id', $id, 'typename', $typename, 'maturityperiod', $maturityperiod);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
        VALUES (NOW(), $userid, 'Insert', CONCAT('Added Bird Type: ', $typename), $platform, $updatedvalues);
    ELSE
        SELECT JSON_OBJECT('typename', typename, 'maturityperiod', maturityperiod) INTO $originalvalues 
        FROM poultrybirdtypes WHERE typeid = $id;
        UPDATE poultrybirdtypes 
        SET typename = $typename, description = $description, maturityperiod = $maturityperiod
        WHERE typeid = $id;
        SET $updatedvalues = JSON_OBJECT('id', $id, 'typename', $typename, 'maturityperiod', $maturityperiod);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, originalvalues, updatedvalues)
        VALUES (NOW(), $userid, 'Update', CONCAT('Updated Bird Type: ', $typename), $platform, $originalvalues, $updatedvalues);
    END IF;
    COMMIT;
    SELECT $id AS typeid;
END //

DROP PROCEDURE IF EXISTS sp_deletepoultrybirdtype //
CREATE PROCEDURE sp_deletepoultrybirdtype(
    IN $id INT,
    IN $userid INT,
    IN $reason TEXT,
    IN $platform VARCHAR(1000)
)
BEGIN
    UPDATE poultrybirdtypes 
    SET deleted = 1, deletedby = $userid, datedeleted = NOW(), reasondeleted = $reason
    WHERE typeid = $id;
    INSERT INTO audittrail (timestamp, userid, operation, narration, platform)
    VALUES (NOW(), $userid, 'Delete', CONCAT('Deleted Bird Type ID: ', $id), $platform);
END //

-- Flock Stages CRUD
DROP PROCEDURE IF EXISTS sp_savepoultryflockstage //
CREATE PROCEDURE sp_savepoultryflockstage(
    IN $id INT,
    IN $stagename VARCHAR(100),
    IN $birdtype VARCHAR(100),
    IN $duration VARCHAR(100),
    IN $userid INT,
    IN $platform VARCHAR(1000)
)
BEGIN
    DECLARE $originalvalues MEDIUMTEXT DEFAULT '';
    DECLARE $updatedvalues MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    IF $id = 0 THEN
        INSERT INTO poultryflockstages (stagename, birdtype, duration, addedby)
        VALUES ($stagename, $birdtype, $duration, $userid);
        SET $id = LAST_INSERT_ID();
        SET $updatedvalues = JSON_OBJECT('id', $id, 'stagename', $stagename);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
        VALUES (NOW(), $userid, 'Insert', CONCAT('Added Flock Stage: ', $stagename), $platform, $updatedvalues);
    ELSE
        SELECT JSON_OBJECT('stagename', stagename) INTO $originalvalues 
        FROM poultryflockstages WHERE stageid = $id;
        UPDATE poultryflockstages 
        SET stagename = $stagename, birdtype = $birdtype, duration = $duration
        WHERE stageid = $id;
        SET $updatedvalues = JSON_OBJECT('id', $id, 'stagename', $stagename);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, originalvalues, updatedvalues)
        VALUES (NOW(), $userid, 'Update', CONCAT('Updated Flock Stage: ', $stagename), $platform, $originalvalues, $updatedvalues);
    END IF;
    COMMIT;
    SELECT $id AS stageid;
END //

DROP PROCEDURE IF EXISTS sp_deletepoultryflockstage //
CREATE PROCEDURE sp_deletepoultryflockstage(
    IN $id INT,
    IN $userid INT,
    IN $reason TEXT,
    IN $platform VARCHAR(1000)
)
BEGIN
    UPDATE poultryflockstages 
    SET deleted = 1, deletedby = $userid, datedeleted = NOW(), reasondeleted = $reason
    WHERE stageid = $id;
    INSERT INTO audittrail (timestamp, userid, operation, narration, platform)
    VALUES (NOW(), $userid, 'Delete', CONCAT('Deleted Flock Stage ID: ', $id), $platform);
END //

-- Houses CRUD
DROP PROCEDURE IF EXISTS sp_savepoultryhouse //
CREATE PROCEDURE sp_savepoultryhouse(
    IN $id INT,
    IN $housename VARCHAR(100),
    IN $description TEXT,
    IN $status VARCHAR(50),
    IN $userid INT,
    IN $platform VARCHAR(1000)
)
BEGIN
    DECLARE $originalvalues MEDIUMTEXT DEFAULT '';
    DECLARE $updatedvalues MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    IF $id = 0 THEN
        INSERT INTO poultryhouses (housename, description, status, addedby)
        VALUES ($housename, $description, $status, $userid);
        SET $id = LAST_INSERT_ID();
        SET $updatedvalues = JSON_OBJECT('id', $id, 'housename', $housename);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
        VALUES (NOW(), $userid, 'Insert', CONCAT('Registered Poultry House: ', $housename), $platform, $updatedvalues);
    ELSE
        SELECT JSON_OBJECT('housename', housename) INTO $originalvalues 
        FROM poultryhouses WHERE houseid = $id;
        UPDATE poultryhouses 
        SET housename = $housename, description = $description, status = $status
        WHERE houseid = $id;
        SET $updatedvalues = JSON_OBJECT('id', $id, 'housename', $housename);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, originalvalues, updatedvalues)
        VALUES (NOW(), $userid, 'Update', CONCAT('Updated Poultry House: ', $housename), $platform, $originalvalues, $updatedvalues);
    END IF;
    COMMIT;
    SELECT $id AS houseid;
END //

DROP PROCEDURE IF EXISTS sp_deletepoultryhouse //
CREATE PROCEDURE sp_deletepoultryhouse(
    IN $id INT,
    IN $userid INT,
    IN $reason TEXT,
    IN $platform VARCHAR(1000)
)
BEGIN
    UPDATE poultryhouses 
    SET deleted = 1, deletedby = $userid, datedeleted = NOW(), reasondeleted = $reason
    WHERE houseid = $id;
    INSERT INTO audittrail (timestamp, userid, operation, narration, platform)
    VALUES (NOW(), $userid, 'Delete', CONCAT('Deleted Poultry House ID: ', $id), $platform);
END //

-- Inventory Categories CRUD
DROP PROCEDURE IF EXISTS sp_savepoultryinventorycategory //
CREATE PROCEDURE sp_savepoultryinventorycategory(
    IN $id INT,
    IN $categorycode VARCHAR(50),
    IN $categoryname VARCHAR(100),
    IN $prefix VARCHAR(20),
    IN $currentno INT,
    IN $padzeros TINYINT,
    IN $userid INT,
    IN $platform VARCHAR(1000)
)
BEGIN
    DECLARE $originalvalues MEDIUMTEXT DEFAULT '';
    DECLARE $updatedvalues MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    IF $id = 0 THEN
        INSERT INTO poultryinventorycategories (categorycode, categoryname, prefix, currentno, padzeros, addedby)
        VALUES ($categorycode, $categoryname, $prefix, $currentno, $padzeros, $userid);
        SET $id = LAST_INSERT_ID();
        SET $updatedvalues = JSON_OBJECT('id', $id, 'categoryname', $categoryname);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
        VALUES (NOW(), $userid, 'Insert', CONCAT('Created Inventory Category: ', $categoryname), $platform, $updatedvalues);
    ELSE
        SELECT JSON_OBJECT('categoryname', categoryname) INTO $originalvalues 
        FROM poultryinventorycategories WHERE categoryid = $id;
        UPDATE poultryinventorycategories 
        SET categorycode = $categorycode, categoryname = $categoryname, prefix = $prefix, currentno = $currentno, padzeros = $padzeros
        WHERE categoryid = $id;
        SET $updatedvalues = JSON_OBJECT('id', $id, 'categoryname', $categoryname);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, originalvalues, updatedvalues)
        VALUES (NOW(), $userid, 'Update', CONCAT('Updated Inventory Category: ', $categoryname), $platform, $originalvalues, $updatedvalues);
    END IF;
    COMMIT;
    SELECT $id AS categoryid;
END //

DROP PROCEDURE IF EXISTS sp_deletepoultryinventorycategory //
CREATE PROCEDURE sp_deletepoultryinventorycategory(
    IN $id INT,
    IN $userid INT,
    IN $reason TEXT,
    IN $platform VARCHAR(1000)
)
BEGIN
    UPDATE poultryinventorycategories 
    SET deleted = 1, deletedby = $userid, datedeleted = NOW(), reasondeleted = $reason
    WHERE categoryid = $id;
    INSERT INTO audittrail (timestamp, userid, operation, narration, platform)
    VALUES (NOW(), $userid, 'Delete', CONCAT('Deleted Inventory Category ID: ', $id), $platform);
END //

-- Inventory Items CRUD
DROP PROCEDURE IF EXISTS sp_savepoultryinventoryitem //
CREATE PROCEDURE sp_savepoultryinventoryitem(
    IN $id INT,
    IN $itemname VARCHAR(100),
    IN $itemcode VARCHAR(50),
    IN $categoryid INT,
    IN $unit VARCHAR(50),
    IN $isfeed TINYINT,
    IN $userid INT,
    IN $platform VARCHAR(1000)
)
BEGIN
    DECLARE $originalvalues MEDIUMTEXT DEFAULT '';
    DECLARE $updatedvalues MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    IF $id = 0 THEN
        INSERT INTO poultryinventoryitems (itemname, itemcode, categoryid, unit, isfeed, addedby)
        VALUES ($itemname, $itemcode, $categoryid, $unit, $isfeed, $userid);
        SET $id = LAST_INSERT_ID();
        SET $updatedvalues = JSON_OBJECT('id', $id, 'itemname', $itemname);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
        VALUES (NOW(), $userid, 'Insert', CONCAT('Provisioned Inventory Item: ', $itemname), $platform, $updatedvalues);
    ELSE
        SELECT JSON_OBJECT('itemname', itemname) INTO $originalvalues 
        FROM poultryinventoryitems WHERE itemid = $id;
        UPDATE poultryinventoryitems 
        SET itemname = $itemname, itemcode = $itemcode, categoryid = $categoryid, unit = $unit, isfeed = $isfeed
        WHERE itemid = $id;
        SET $updatedvalues = JSON_OBJECT('id', $id, 'itemname', $itemname);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, originalvalues, updatedvalues)
        VALUES (NOW(), $userid, 'Update', CONCAT('Updated Inventory Item: ', $itemname), $platform, $originalvalues, $updatedvalues);
    END IF;
    COMMIT;
    SELECT $id AS itemid;
END //

DROP PROCEDURE IF EXISTS sp_deletepoultryinventoryitem //
CREATE PROCEDURE sp_deletepoultryinventoryitem(
    IN $id INT,
    IN $userid INT,
    IN $reason TEXT,
    IN $platform VARCHAR(1000)
)
BEGIN
    UPDATE poultryinventoryitems 
    SET deleted = 1, deletedby = $userid, datedeleted = NOW(), reasondeleted = $reason
    WHERE itemid = $id;
    INSERT INTO audittrail (timestamp, userid, operation, narration, platform)
    VALUES (NOW(), $userid, 'Delete', CONCAT('Deleted Inventory Item ID: ', $id), $platform);
END //

-- Diseases CRUD
DROP PROCEDURE IF EXISTS sp_savepoultrydisease //
CREATE PROCEDURE sp_savepoultrydisease(
    IN $id INT,
    IN $diseasename VARCHAR(100),
    IN $description TEXT,
    IN $severity VARCHAR(50),
    IN $userid INT,
    IN $platform VARCHAR(1000)
)
BEGIN
    DECLARE $originalvalues MEDIUMTEXT DEFAULT '';
    DECLARE $updatedvalues MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    IF $id = 0 THEN
        INSERT INTO poultrydiseases (diseasename, description, severity, addedby)
        VALUES ($diseasename, $description, $severity, $userid);
        SET $id = LAST_INSERT_ID();
        SET $updatedvalues = JSON_OBJECT('id', $id, 'diseasename', $diseasename);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
        VALUES (NOW(), $userid, 'Insert', CONCAT('Recorded New Disease: ', $diseasename), $platform, $updatedvalues);
    ELSE
        SELECT JSON_OBJECT('diseasename', diseasename) INTO $originalvalues 
        FROM poultrydiseases WHERE diseaseid = $id;
        UPDATE poultrydiseases 
        SET diseasename = $diseasename, description = $description, severity = $severity
        WHERE diseaseid = $id;
        SET $updatedvalues = JSON_OBJECT('id', $id, 'diseasename', $diseasename);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, originalvalues, updatedvalues)
        VALUES (NOW(), $userid, 'Update', CONCAT('Updated Disease: ', $diseasename), $platform, $originalvalues, $updatedvalues);
    END IF;
    COMMIT;
    SELECT $id AS diseaseid;
END //

DROP PROCEDURE IF EXISTS sp_deletepoultrydisease //
CREATE PROCEDURE sp_deletepoultrydisease(
    IN $id INT,
    IN $userid INT,
    IN $reason TEXT,
    IN $platform VARCHAR(1000)
)
BEGIN
    UPDATE poultrydiseases 
    SET deleted = 1, deletedby = $userid, datedeleted = NOW(), reasondeleted = $reason
    WHERE diseaseid = $id;
    INSERT INTO audittrail (timestamp, userid, operation, narration, platform)
    VALUES (NOW(), $userid, 'Delete', CONCAT('Deleted Disease ID: ', $id), $platform);
END //

-- Mortality Reasons CRUD
DROP PROCEDURE IF EXISTS sp_savepoultrymortalityreason //
CREATE PROCEDURE sp_savepoultrymortalityreason(
    IN $id INT,
    IN $reasonlabel VARCHAR(100),
    IN $description TEXT,
    IN $userid INT,
    IN $platform VARCHAR(1000)
)
BEGIN
    DECLARE $originalvalues MEDIUMTEXT DEFAULT '';
    DECLARE $updatedvalues MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    IF $id = 0 THEN
        INSERT INTO poultrymortalityreasons (reasonlabel, description, addedby)
        VALUES ($reasonlabel, $description, $userid);
        SET $id = LAST_INSERT_ID();
        SET $updatedvalues = JSON_OBJECT('id', $id, 'reasonlabel', $reasonlabel);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
        VALUES (NOW(), $userid, 'Insert', CONCAT('Added Mortality Reason: ', $reasonlabel), $platform, $updatedvalues);
    ELSE
        SELECT JSON_OBJECT('reasonlabel', reasonlabel) INTO $originalvalues 
        FROM poultrymortalityreasons WHERE reasonid = $id;
        UPDATE poultrymortalityreasons 
        SET reasonlabel = $reasonlabel, description = $description
        WHERE reasonid = $id;
        SET $updatedvalues = JSON_OBJECT('id', $id, 'reasonlabel', $reasonlabel);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, originalvalues, updatedvalues)
        VALUES (NOW(), $userid, 'Update', CONCAT('Updated Mortality Reason: ', $reasonlabel), $platform, $originalvalues, $updatedvalues);
    END IF;
    COMMIT;
    SELECT $id AS reasonid;
END //

DROP PROCEDURE IF EXISTS sp_deletepoultrymortalityreason //
CREATE PROCEDURE sp_deletepoultrymortalityreason(
    IN $id INT,
    IN $userid INT,
    IN $reason TEXT,
    IN $platform VARCHAR(1000)
)
BEGIN
    UPDATE poultrymortalityreasons 
    SET deleted = 1, deletedby = $userid, datedeleted = NOW(), reasondeleted = $reason
    WHERE reasonid = $id;
    INSERT INTO audittrail (timestamp, userid, operation, narration, platform)
    VALUES (NOW(), $userid, 'Delete', CONCAT('Deleted Mortality Reason ID: ', $id), $platform);
END //

-- Formulations CRUD
DROP PROCEDURE IF EXISTS sp_savepoultryformulation //
CREATE PROCEDURE sp_savepoultryformulation(
    IN $id INT,
    IN $formulationname VARCHAR(100),
    IN $birdtype VARCHAR(50),
    IN $growthstage VARCHAR(50),
    IN $userid INT,
    IN $platform VARCHAR(1000)
)
BEGIN
    DECLARE $originalvalues MEDIUMTEXT DEFAULT '';
    DECLARE $updatedvalues MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    IF $id = 0 THEN
        INSERT INTO poultryformulations (formulationname, birdtype, growthstage, addedby)
        VALUES ($formulationname, $birdtype, $growthstage, $userid);
        SET $id = LAST_INSERT_ID();
        SET $updatedvalues = JSON_OBJECT('id', $id, 'formulationname', $formulationname);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
        VALUES (NOW(), $userid, 'Insert', CONCAT('Created Feed Formulation: ', $formulationname), $platform, $updatedvalues);
    ELSE
        SELECT JSON_OBJECT('formulationname', formulationname) INTO $originalvalues 
        FROM poultryformulations WHERE formulationid = $id;
        UPDATE poultryformulations 
        SET formulationname = $formulationname, birdtype = $birdtype, growthstage = $growthstage
        WHERE formulationid = $id;
        DELETE FROM poultryformulationingredients WHERE formulationid = $id;
        SET $updatedvalues = JSON_OBJECT('id', $id, 'formulationname', $formulationname);
        INSERT INTO audittrail (timestamp, userid, operation, narration, platform, originalvalues, updatedvalues)
        VALUES (NOW(), $userid, 'Update', CONCAT('Updated Feed Formulation: ', $formulationname), $platform, $originalvalues, $updatedvalues);
    END IF;
    COMMIT;
    SELECT $id as formulationid;
END //

DROP PROCEDURE IF EXISTS sp_deletepoultryformulation //
CREATE PROCEDURE sp_deletepoultryformulation(
    IN $id INT,
    IN $userid INT,
    IN $reason TEXT,
    IN $platform VARCHAR(1000)
)
BEGIN
    UPDATE poultryformulations 
    SET deleted = 1, deletedby = $userid, datedeleted = NOW(), reasondeleted = $reason
    WHERE formulationid = $id;
    INSERT INTO audittrail (timestamp, userid, operation, narration, platform)
    VALUES (NOW(), $userid, 'Delete', CONCAT('Deleted Formulation ID: ', $id), $platform);
END //

DROP PROCEDURE IF EXISTS sp_savepoultryformulationingredient //
CREATE PROCEDURE sp_savepoultryformulationingredient(
    IN $formulationid INT,
    IN $itemid INT,
    IN $quantity DECIMAL(10,2)
)
BEGIN
    INSERT INTO poultryformulationingredients (formulationid, itemid, quantity)
    VALUES ($formulationid, $itemid, $quantity);
END //

-- RETRIEVAL PROCEDURES (Filtered by deleted = 0)
DROP PROCEDURE IF EXISTS sp_getpoultrybreeds //
CREATE PROCEDURE sp_getpoultrybreeds()
BEGIN
    SELECT * FROM poultrybreeds WHERE deleted = 0 ORDER BY breedname ASC;
END //

DROP PROCEDURE IF EXISTS sp_getpoultrybirdtypes //
CREATE PROCEDURE sp_getpoultrybirdtypes()
BEGIN
    SELECT * FROM poultrybirdtypes WHERE deleted = 0 ORDER BY typename ASC;
END //

DROP PROCEDURE IF EXISTS sp_getpoultryflockstages //
CREATE PROCEDURE sp_getpoultryflockstages()
BEGIN
    SELECT * FROM poultryflockstages WHERE deleted = 0 ORDER BY stagename ASC;
END //

DROP PROCEDURE IF EXISTS sp_getpoultryhouses //
CREATE PROCEDURE sp_getpoultryhouses()
BEGIN
    SELECT * FROM poultryhouses WHERE deleted = 0 ORDER BY housename ASC;
END //

DROP PROCEDURE IF EXISTS sp_getpoultryinventorycategories //
CREATE PROCEDURE sp_getpoultryinventorycategories()
BEGIN
    SELECT c.*, (SELECT COUNT(*) FROM poultryinventoryitems i WHERE i.categoryid = c.categoryid AND i.deleted = 0) as itemcount
    FROM poultryinventorycategories c
    WHERE c.deleted = 0
    ORDER BY c.categoryname ASC;
END //

DROP PROCEDURE IF EXISTS sp_getpoultryinventoryitems //
CREATE PROCEDURE sp_getpoultryinventoryitems()
BEGIN
    SELECT i.*, c.categoryname 
    FROM poultryinventoryitems i
    LEFT JOIN poultryinventorycategories c ON i.categoryid = c.categoryid
    WHERE i.deleted = 0
    ORDER BY i.itemname ASC;
END //

DROP PROCEDURE IF EXISTS sp_getpoultrydiseases //
CREATE PROCEDURE sp_getpoultrydiseases()
BEGIN
    SELECT * FROM poultrydiseases WHERE deleted = 0 ORDER BY diseasename ASC;
END //

DROP PROCEDURE IF EXISTS sp_getpoultrymortalityreasons //
CREATE PROCEDURE sp_getpoultrymortalityreasons()
BEGIN
    SELECT * FROM poultrymortalityreasons WHERE deleted = 0 ORDER BY reasonlabel ASC;
END //

DROP PROCEDURE IF EXISTS sp_getpoultryformulations //
CREATE PROCEDURE sp_getpoultryformulations()
BEGIN
    SELECT * FROM poultryformulations WHERE deleted = 0 ORDER BY formulationname ASC;
END //

DROP PROCEDURE IF EXISTS sp_getpoultryformulationingredients //
CREATE PROCEDURE sp_getpoultryformulationingredients(IN $formulationid INT)
BEGIN
    SELECT fi.*, i.itemname, i.unit
    FROM poultryformulationingredients fi
    JOIN poultryinventoryitems i ON fi.itemid = i.itemid
    WHERE fi.formulationid = $formulationid;
END //

DELIMITER ;

-- SEED DATA
/*
INSERT INTO poultrybirdtypes (typename, description, addedby) VALUES 
('Layers', 'Birds raised specifically for egg production.', 5),
('Broilers', 'Birds raised specifically for meat production.', 5),
('Kienyeji', 'Indigenous or improved indigenous breeds.', 5);

INSERT INTO poultrybreeds (breedname, category, notes, addedby) VALUES 
('ISA Brown', 'Layers', 'Excellent egg production, friendly temperament.', 5),
('Cobb 500', 'Broilers', 'World''s most efficient broiler.', 5),
('Kuroiler', 'Kienyeji', 'High growth rate and egg production.', 5);

INSERT INTO poultryflockstages (stagename, birdtype, duration, addedby) VALUES 
('Chick', 'Layers', '0 - 8 Weeks', 5),
('Grower', 'Layers', '9 - 18 Weeks', 5),
('Layer', 'Layers', '19+ Weeks', 5);

INSERT INTO poultryhouses (housename, description, status, addedby) VALUES 
('House A', 'Main layer facility', 'Active', 5),
('House B', 'Broiler facility', 'Active', 5),
('Quarantine Pen', 'For new or sick birds', 'Active', 5);

INSERT INTO poultryinventorycategories (categorycode, categoryname, prefix, currentno, padzeros, addedby) VALUES 
('CAT001', 'Feeds', 'FEED-', 100, 1, 5),
('CAT002', 'Vaccines', 'VAC-', 50, 1, 5),
('CAT003', 'Supplements', 'SUPP-', 20, 1, 5);

INSERT INTO poultryinventoryitems (itemname, itemcode, categoryid, unit, isfeed, addedby) VALUES 
('Chick Mash', 'FEED-001', 1, 'Bag', 1, 5),
('Gumboro Vaccine', 'VAC-001', 2, 'Vial', 0, 5),
('Vitamin Premix', 'SUPP-001', 3, 'kg', 0, 5);

INSERT INTO poultrydiseases (diseasename, description, severity, addedby) VALUES 
('Newcastle Disease', 'Highly contagious viral disease.', 'Critical', 5),
('Coccidiosis', 'Parasitic disease of the intestinal tract.', 'High', 5),
('Fowl Pox', 'Slow-spreading viral disease.', 'Medium', 5);

INSERT INTO poultrymortalityreasons (reasonlabel, description, addedby) VALUES 
('Predation', 'Loss due to predators like mongoose or hawks.', 5),
('Disease Outbreak', 'Loss due to identified disease.', 5),
('Heat Stress', 'Loss due to high environmental temperatures.', 5);

INSERT INTO poultryformulations (formulationname, birdtype, growthstage, addedby) VALUES 
('Starter Mix', 'Broilers', 'Chicks', 5),
('Finisher Mix', 'Broilers', 'Growers', 5);

INSERT INTO poultryformulationingredients (formulationid, itemid, quantity) VALUES 
(1, 1, 50.00),
(2, 1, 75.00);
*/

/*
-- SAMPLE SP CALLS

-- Save Breed (Insert)
CALL sp_savepoultrybreed(0, 'White Leghorn', 'Layers', 'High egg production', 5, 'Web Interface');

-- Save Breed (Update)
CALL sp_savepoultrybreed(1, 'ISA Brown Updated', 'Layers', 'Updated notes', 5, 'Web Interface');

-- Delete Breed (Soft Delete)
CALL sp_deletepoultrybreed(3, 5, 'Retired breed from farm', 'Web Interface');

-- Get Breeds
CALL sp_getpoultrybreeds();

-- Save Inventory Item
CALL sp_savepoultryinventoryitem(0, 'Grower Mash', 'FEED-002', 1, 'Bag', 1, 5, 'Web Interface');

-- Get Inventory Items
CALL sp_getpoultryinventoryitems();
*/
