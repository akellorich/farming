-- MIGRATION: Add is_feed column to inventoryitems
-- Created: 2026-05-05

ALTER TABLE `inventoryitems` ADD COLUMN `is_feed` TINYINT(1) DEFAULT 0 AFTER `itemtype`;

-- Update stored procedure sp_saveinventoryitem
DELIMITER $$

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
    IN `$is_feed` TINYINT(1),
    IN `$description` TEXT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        INSERT INTO `inventoryitems` (
            `categoryid`, `itemcode`, `itemname`, `uom`, `unitprice`, `reorderlevel`, `itemtype`, `is_feed`, `description`, `addedby`
        )
        VALUES (
            `$categoryid`, `$itemcode`, `$itemname`, `$uom`, `$unitprice`, `$reorderlevel`, `$itemtype`, `$is_feed`, `$description`, `$userid`
        );
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = JSON_OBJECT('id', `$id`, 'itemcode', `$itemcode`, 'itemname', `$itemname`, 'is_feed', `$is_feed`);
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Provisioned Inventory Item: ', `$itemname`), `$platform`, `$updatedvalues`);
    ELSE
        SELECT JSON_OBJECT('itemcode', `itemcode`, 'itemname', `itemname`, 'is_feed', `is_feed`) INTO `$originalvalues` 
        FROM `inventoryitems` WHERE `id` = `$id`;
        
        UPDATE `inventoryitems`
        SET `categoryid` = `$categoryid`,
            `itemcode` = `$itemcode`,
            `itemname` = `$itemname`,
            `uom` = `$uom`,
            `unitprice` = `$unitprice`,
            `reorderlevel` = `$reorderlevel`,
            `itemtype` = `$itemtype`,
            `is_feed` = `$is_feed`,
            `description` = `$description`,
            `updatedby` = `$userid`,
            `lastupdated` = NOW()
        WHERE `id` = `$id`;
        
        SELECT JSON_OBJECT('itemcode', `itemcode`, 'itemname', `itemname`, 'is_feed', `is_feed`) INTO `$updatedvalues` 
        FROM `inventoryitems` WHERE `id` = `$id`;
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Update', CONCAT('Updated Inventory Item: ', `$itemname`), `$platform`, `$originalvalues`, `$updatedvalues`);
    END IF;
    
    COMMIT;
    SELECT `$id` AS `itemid`;
END$$

DELIMITER ;

-- Script to randomly assign is_feed values to existing items
UPDATE `inventoryitems` SET `is_feed` = IF(RAND() > 0.5, 1, 0);
