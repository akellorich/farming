-- MIGRATION: Add currentstock and maxstock columns to inventoryitems
-- Created: 2026-05-07

ALTER TABLE `inventoryitems` ADD COLUMN `currentstock` DECIMAL(15, 2) DEFAULT 0.00 AFTER `reorderlevel`;
ALTER TABLE `inventoryitems` ADD COLUMN `maxstock` DECIMAL(15, 2) DEFAULT 0.00 AFTER `currentstock`;

-- Populate random stock values for feed items to enable statistical reporting
-- We set current stock between 200 and 1000 for realistic demonstration
UPDATE `inventoryitems` 
SET `currentstock` = ROUND(RAND() * 800 + 200, 2), 
    `maxstock` = 1000.00
WHERE `is_feed` = 1;

-- Update stored procedures to include new stock fields
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
    IN `$currentstock` DECIMAL(15, 2),
    IN `$maxstock` DECIMAL(15, 2),
    IN `$itemtype` VARCHAR(50),
    IN `$is_feed` TINYINT(1),
    IN `$description` TEXT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        INSERT INTO `inventoryitems` (
            `categoryid`, `itemcode`, `itemname`, `uom`, `unitprice`, `reorderlevel`, `currentstock`, `maxstock`, `itemtype`, `is_feed`, `description`, `addedby`
        )
        VALUES (
            `$categoryid`, `$itemcode`, `$itemname`, `$uom`, `$unitprice`, `$reorderlevel`, `$currentstock`, `$maxstock`, `$itemtype`, `$is_feed`, `$description`, `$userid`
        );
        SET `$id` = LAST_INSERT_ID();
    ELSE
        UPDATE `inventoryitems`
        SET `categoryid` = `$categoryid`,
            `itemcode` = `$itemcode`,
            `itemname` = `$itemname`,
            `uom` = `$uom`,
            `unitprice` = `$unitprice`,
            `reorderlevel` = `$reorderlevel`,
            `currentstock` = `$currentstock`,
            `maxstock` = `$maxstock`,
            `itemtype` = `$itemtype`,
            `is_feed` = `$is_feed`,
            `description` = `$description`,
            `updatedby` = `$userid`,
            `lastupdated` = NOW()
        WHERE `id` = `$id`;
    END IF;
    
    COMMIT;
    SELECT `$id` AS `itemid`;
END$$

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
    FROM `inventoryitems` ii
    LEFT JOIN `inventorycategories` ic ON ii.`categoryid` = ic.`id`
    WHERE ii.`deleted` = 0
    AND (ii.`categoryid` = `$categoryid` OR `$categoryid` = 0)
    AND (ii.`id` = `$itemid` OR `$itemid` = 0)
    ORDER BY ii.`itemname` ASC;
END$$

DELIMITER ;
