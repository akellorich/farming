-- MIGRATION: Synchronize existing feeding logs with inventory items and feed mixes
-- Created: 2026-05-05

-- 1. Match numeric feedtype strings to Feed Mix IDs
UPDATE `feedinglogs` f 
JOIN `feedmix` m ON f.`feedtype` = CAST(m.`id` AS CHAR)
SET f.`feed_source_type` = 'Ration', 
    f.`feed_id` = m.`id`
WHERE f.`feed_id` IS NULL AND f.`feedtype` REGEXP '^[0-9]+$';

-- 2. Match numeric feedtype strings to Inventory Item IDs (if not already matched)
UPDATE `feedinglogs` f 
JOIN `inventoryitems` i ON f.`feedtype` = CAST(i.`id` AS CHAR)
SET f.`feed_source_type` = 'Feed', 
    f.`feed_id` = i.`id`
WHERE f.`feed_id` IS NULL AND f.`feedtype` REGEXP '^[0-9]+$';

-- 3. Match by exact Inventory Item Name (case-insensitive)
UPDATE `feedinglogs` f 
JOIN `inventoryitems` i ON LOWER(TRIM(f.`feedtype`)) = LOWER(TRIM(i.`itemname`))
SET f.`feed_source_type` = 'Feed', 
    f.`feed_id` = i.`id`
WHERE f.`feed_id` IS NULL;

-- 4. Match by exact Feed Mix Name (case-insensitive)
UPDATE `feedinglogs` f 
JOIN `feedmix` m ON LOWER(TRIM(f.`feedtype`)) = LOWER(TRIM(m.`feedname`))
SET f.`feed_source_type` = 'Ration', 
    f.`feed_id` = m.`id`
WHERE f.`feed_id` IS NULL;

-- 5. Special fuzzy matches for known common terms if applicable
UPDATE `feedinglogs` f 
SET f.`feed_source_type` = 'Feed', 
    f.`feed_id` = (SELECT `id` FROM `inventoryitems` WHERE LOWER(`itemname`) LIKE '%calf starter pellets%' LIMIT 1)
WHERE f.`feed_id` IS NULL AND LOWER(`feedtype`) LIKE '%calf pellet%';

-- 6. Set defaults for anything that didn't match (keep as 'Feed' but maybe link to a generic item or leave ID NULL)
-- We leave them with feed_id NULL for now so they can be manually updated, 
-- but sp_getfeedinglogs will still show the old feedtype string in the ELSE clause.
