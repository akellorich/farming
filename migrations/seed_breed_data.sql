-- SEED RANDOM DATA FOR EXISTING BREEDS
-- avgmilking: random decimal between 15.00 and 35.00
-- icon: random pick from the list

UPDATE `breeds` 
SET 
    `avgmilking` = ROUND(15 + (RAND() * 20), 2),
    `icon` = ELT(FLOOR(1 + (RAND() * 10)), 
        'stars', 
        'bolt', 
        'water_drop', 
        'park', 
        'pets', 
        'eco', 
        'grass', 
        'local_florist', 
        'speed', 
        'monitoring'
    )
WHERE `deleted` = 0;

-- Optionally, specific updates for well-known breeds if they exist
UPDATE `breeds` SET `avgmilking` = 30.50, `icon` = 'stars' WHERE `breedname` LIKE '%Holstein%' AND `deleted` = 0;
UPDATE `breeds` SET `avgmilking` = 22.00, `icon` = 'bolt' WHERE `breedname` LIKE '%Jersey%' AND `deleted` = 0;
UPDATE `breeds` SET `avgmilking` = 25.00, `icon` = 'water_drop' WHERE `breedname` LIKE '%Brown Swiss%' AND `deleted` = 0;
UPDATE `breeds` SET `avgmilking` = 20.00, `icon` = 'park' WHERE `breedname` LIKE '%Guernsey%' AND `deleted` = 0;
