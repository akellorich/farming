DELIMITER $$

/* --- Procedure: Get Inventory Stats --- */
DROP PROCEDURE IF EXISTS `sp_getinventorystats`$$
CREATE PROCEDURE `sp_getinventorystats`()
BEGIN
    SELECT 
        IFNULL(SUM(current_stock * unitprice), 0) AS total_value,
        COUNT(CASE WHEN current_stock <= reorderlevel AND deleted = 0 THEN 1 END) AS low_stock_count,
        (SELECT COUNT(*) FROM inventory_categories WHERE deleted = 0) AS category_count
    FROM inventoryitems
    WHERE deleted = 0;
END$$

/* --- Procedure: Get Category Summaries --- */
DROP PROCEDURE IF EXISTS `sp_getcategorysummaries`$$
CREATE PROCEDURE `sp_getcategorysummaries`()
BEGIN
    SELECT 
        ic.id,
        ic.categoryname,
        ic.categoryicon,
        COUNT(ii.id) as item_count
    FROM inventory_categories ic
    LEFT JOIN inventoryitems ii ON ic.id = ii.categoryid AND ii.deleted = 0
    WHERE ic.deleted = 0
    GROUP BY ic.id, ic.categoryname, ic.categoryicon
    ORDER BY ic.categoryname ASC;
END$$

DELIMITER ;
