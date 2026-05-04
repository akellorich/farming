-- INVENTORY CATEGORIZATION MODULE SETUP
-- Matches fields in views/inventory_overview.php categorization modal

DELIMITER $$

/* --- Table: inventory_categories --- */
CREATE TABLE IF NOT EXISTS `inventory_categories` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `categorycode` VARCHAR(50) NOT NULL UNIQUE,
    `categoryname` VARCHAR(255) NOT NULL,
    `categoryicon` VARCHAR(100) DEFAULT 'fas fa-box',
    `itemprefix` VARCHAR(50) DEFAULT '',
    `startingnumber` INT DEFAULT 1,
    `padzeros` TINYINT(1) DEFAULT 1,
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updatedby` INT,
    `lastupdated` DATETIME ON UPDATE CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT,
    `datedeleted` DATETIME,
    CONSTRAINT `fkinvcataddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkinvcatupdatedby` FOREIGN KEY (`updatedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkinvcatdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4$$

/* --- Procedure: Save/Update Inventory Category --- */
DROP PROCEDURE IF EXISTS `sp_saveinventorycategory`$$
CREATE PROCEDURE `sp_saveinventorycategory`(
    IN `$id` INT,
    IN `$categorycode` VARCHAR(50),
    IN `$categoryname` VARCHAR(255),
    IN `$categoryicon` VARCHAR(100),
    IN `$itemprefix` VARCHAR(50),
    IN `$startingnumber` INT,
    IN `$padzeros` TINYINT(1),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        INSERT INTO `inventory_categories` (
            `categorycode`, `categoryname`, `categoryicon`, `itemprefix`, `startingnumber`, `padzeros`, `addedby`
        )
        VALUES (
            `$categorycode`, `$categoryname`, `$categoryicon`, `$itemprefix`, `$startingnumber`, `$padzeros`, `$userid`
        );
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = JSON_OBJECT('id', `$id`, 'categorycode', `$categorycode`, 'categoryname', `$categoryname`);
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Created Inventory Category: ', `$categoryname`), `$platform`, `$updatedvalues`);
    ELSE
        SELECT JSON_OBJECT('categorycode', `categorycode`, 'categoryname', `categoryname`) INTO `$originalvalues` 
        FROM `inventory_categories` WHERE `id` = `$id`;
        
        UPDATE `inventory_categories`
        SET `categorycode` = `$categorycode`,
            `categoryname` = `$categoryname`,
            `categoryicon` = `$categoryicon`,
            `itemprefix` = `$itemprefix`,
            `startingnumber` = `$startingnumber`,
            `padzeros` = `$padzeros`,
            `updatedby` = `$userid`,
            `lastupdated` = NOW()
        WHERE `id` = `$id`;
        
        SELECT JSON_OBJECT('categorycode', `categorycode`, 'categoryname', `categoryname`) INTO `$updatedvalues` 
        FROM `inventory_categories` WHERE `id` = `$id`;
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Update', CONCAT('Updated Inventory Category: ', `$categoryname`), `$platform`, `$originalvalues`, `$updatedvalues`);
    END IF;
    
    COMMIT;
    SELECT `$id` AS `categoryid`;
END$$

/* --- Procedure: Get Inventory Categories --- */
DROP PROCEDURE IF EXISTS `sp_getinventorycategories`$$
CREATE PROCEDURE `sp_getinventorycategories`(
    IN `$id` INT
)
BEGIN
    IF `$id` = 0 THEN
        SELECT * FROM `inventory_categories` WHERE `deleted` = 0 ORDER BY `categoryname` ASC;
    ELSE
        SELECT * FROM `inventory_categories` WHERE `id` = `$id` AND `deleted` = 0;
    END IF;
END$$

/* --- Procedure: Delete Inventory Category (Soft Delete) --- */
DROP PROCEDURE IF EXISTS `sp_deleteinventorycategory`$$
CREATE PROCEDURE `sp_deleteinventorycategory`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$categoryname` VARCHAR(255);
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    SELECT `categoryname`, JSON_OBJECT('id', `id`, 'categoryname', `categoryname`) INTO `$categoryname`, `$originalvalues`
    FROM `inventory_categories` WHERE `id` = `$id`;
    
    UPDATE `inventory_categories`
    SET `deleted` = 1,
        `deletedby` = `$userid`,
        `datedeleted` = NOW()
    WHERE `id` = `$id`;
    
    INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`)
    VALUES (NOW(), `$userid`, 'Delete', CONCAT('Deleted Inventory Category: ', `$categoryname`), `$platform`, `$originalvalues`);
    
    COMMIT;
    SELECT 1 AS `success`;
END$$

/* --- Table: inventory_items --- */
CREATE TABLE IF NOT EXISTS `inventory_items` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `categoryid` INT NOT NULL,
    `itemcode` VARCHAR(100) NOT NULL UNIQUE,
    `itemname` VARCHAR(255) NOT NULL,
    `uom` VARCHAR(50),
    `unitprice` DECIMAL(15, 2) DEFAULT 0.00,
    `reorderlevel` DECIMAL(15, 2) DEFAULT 0.00,
    `itemtype` ENUM('Ingredient', 'Product') DEFAULT 'Ingredient',
    `description` TEXT,
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `updatedby` INT,
    `lastupdated` DATETIME ON UPDATE CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT,
    `datedeleted` DATETIME,
    CONSTRAINT `fkinvitemcat` FOREIGN KEY (`categoryid`) REFERENCES `inventory_categories`(`id`),
    CONSTRAINT `fkinvitemaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkinvitemupdatedby` FOREIGN KEY (`updatedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkinvitemdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4$$

/* --- Procedure: Save/Update Inventory Item --- */
DROP PROCEDURE IF EXISTS `sp_saveinventoryitem`$$
CREATE PROCEDURE `sp_saveinventoryitem`(
    IN `$id` INT,
    IN `$categoryid` INT,
    IN `$itemcode` VARCHAR(100),
    IN `$itemname` VARCHAR(255),
    IN `$uom` VARCHAR(50),
    IN `$unitprice` DECIMAL(15, 2),
    IN `$reorderlevel` DECIMAL(15, 2),
    IN `$itemtype` VARCHAR(50),
    IN `$description` TEXT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        INSERT INTO `inventory_items` (
            `categoryid`, `itemcode`, `itemname`, `uom`, `unitprice`, `reorderlevel`, `itemtype`, `description`, `addedby`
        )
        VALUES (
            `$categoryid`, `$itemcode`, `$itemname`, `$uom`, `$unitprice`, `$reorderlevel`, `$itemtype`, `$description`, `$userid`
        );
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = JSON_OBJECT('id', `$id`, 'itemcode', `$itemcode`, 'itemname', `$itemname`);
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Provisioned Inventory Item: ', `$itemname`), `$platform`, `$updatedvalues`);
    ELSE
        SELECT JSON_OBJECT('itemcode', `itemcode`, 'itemname', `itemname`) INTO `$originalvalues` 
        FROM `inventory_items` WHERE `id` = `$id`;
        
        UPDATE `inventory_items`
        SET `categoryid` = `$categoryid`,
            `itemcode` = `$itemcode`,
            `itemname` = `$itemname`,
            `uom` = `$uom`,
            `unitprice` = `$unitprice`,
            `reorderlevel` = `$reorderlevel`,
            `itemtype` = `$itemtype`,
            `description` = `$description`,
            `updatedby` = `$userid`,
            `lastupdated` = NOW()
        WHERE `id` = `$id`;
        
        SELECT JSON_OBJECT('itemcode', `itemcode`, 'itemname', `itemname`) INTO `$updatedvalues` 
        FROM `inventory_items` WHERE `id` = `$id`;
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Update', CONCAT('Updated Inventory Item: ', `$itemname`), `$platform`, `$originalvalues`, `$updatedvalues`);
    END IF;
    
    COMMIT;
    SELECT `$id` AS `itemid`;
END$$

/* --- Procedure: Get Inventory Items --- */
DROP PROCEDURE IF EXISTS `sp_getinventoryitems`$$
CREATE PROCEDURE `sp_getinventoryitems`(
    IN `$categoryid` INT,
    IN `$itemid` INT
)
BEGIN
    SELECT 
        ii.*,
        ic.`categoryname`,
        ic.`categorycode`
    FROM `inventory_items` ii
    LEFT JOIN `inventory_categories` ic ON ii.`categoryid` = ic.`id`
    WHERE ii.`deleted` = 0
    AND (ii.`categoryid` = `$categoryid` OR `$categoryid` = 0)
    AND (ii.`id` = `$itemid` OR `$itemid` = 0)
    ORDER BY ii.`itemname` ASC;
END$$

/* --- Procedure: Delete Inventory Item --- */
DROP PROCEDURE IF EXISTS `sp_deleteinventoryitem`$$
CREATE PROCEDURE `sp_deleteinventoryitem`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$itemname` VARCHAR(255);
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    SELECT `itemname`, JSON_OBJECT('id', `id`, 'itemname', `itemname`) INTO `$itemname`, `$originalvalues`
    FROM `inventory_items` WHERE `id` = `$id`;
    
    UPDATE `inventory_items`
    SET `deleted` = 1,
        `deletedby` = `$userid`,
        `datedeleted` = NOW()
    WHERE `id` = `$id`;
    
    INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`)
    VALUES (NOW(), `$userid`, 'Delete', CONCAT('Deleted Inventory Item: ', `$itemname`), `$platform`, `$originalvalues`);
    
    COMMIT;
    SELECT 1 AS `success`;
END$$

DELIMITER ;
