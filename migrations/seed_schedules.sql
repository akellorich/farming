-- JUKAM Dairy - Seed Vaccination and Deworming Schedules
-- This script truncates existing data and inserts 10 sample entries

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE `vaccinationschedules`;
TRUNCATE TABLE `dewormingschedules`;

-- 1. Seed Vaccination Schedules
-- Assuming disease IDs 1-10 exist. Pen IDs are JSON arrays.
INSERT INTO `vaccinationschedules` (`diseaseid`, `penids`, `scheduledate`, `scheduletime`, `repeat_annually`, `notes`, `addedby`)
VALUES 
(1, '["1", "2"]', DATE_SUB(CURDATE(), INTERVAL 5 DAY), '08:00:00', 1, 'Routine vaccination for FMD.', 1),
(2, '["3"]', DATE_SUB(CURDATE(), INTERVAL 2 DAY), '10:00:00', 0, 'Quarterly Anthrax vaccination.', 1),
(3, '["1", "4", "5"]', CURDATE(), '09:30:00', 1, 'Ongoing Brucellosis screening and vaccination.', 1),
(4, '["2"]', DATE_ADD(CURDATE(), INTERVAL 3 DAY), '11:00:00', 0, 'BVD initial dose for calves.', 1),
(5, '["6"]', DATE_ADD(CURDATE(), INTERVAL 7 DAY), '07:00:00', 1, 'Annual Lumpy Skin Disease prevention.', 1);

-- 2. Seed Deworming Schedules
INSERT INTO `dewormingschedules` (`schedulename`, `penids`, `scheduledate`, `scheduletime`, `repeat_annually`, `notes`, `addedby`)
VALUES 
('Albendazole 10%', '["1", "3"]', DATE_SUB(CURDATE(), INTERVAL 10 DAY), '06:30:00', 0, 'General herd deworming.', 1),
('Ivermectin Injection', '["2", "5"]', DATE_SUB(CURDATE(), INTERVAL 1 DAY), '09:00:00', 1, 'External and internal parasite control.', 1),
('Fenbendazole Oral', '["4"]', CURDATE(), '14:00:00', 0, 'Targeted treatment for Pen 4.', 1),
('Levamisole', '["1", "2", "6"]', DATE_ADD(CURDATE(), INTERVAL 5 DAY), '08:00:00', 0, 'Post-rainy season deworming.', 1),
('Praziquantel', '["3"]', DATE_ADD(CURDATE(), INTERVAL 12 DAY), '10:30:00', 1, 'Routine tapeworm control.', 1);

SET FOREIGN_KEY_CHECKS = 1;
