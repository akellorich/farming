-- Update healthlogs table to include narration and status columns
ALTER TABLE `healthlogs` 
ADD COLUMN `narration` TEXT NULL AFTER `treatment`,
ADD COLUMN `status` VARCHAR(50) DEFAULT 'Recovering' AFTER `narration`;
