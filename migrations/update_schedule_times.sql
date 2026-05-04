-- Add starttime column to milking and feeding schedules for automatic selection logic
ALTER TABLE `milkingschedules` ADD COLUMN `starttime` TIME DEFAULT '00:00:00' AFTER `schedulename`;
ALTER TABLE `feedingshifts` ADD COLUMN `starttime` TIME DEFAULT '00:00:00' AFTER `shiftname`;

-- Populate with standard values based on existing names
UPDATE `milkingschedules` SET `starttime` = '03:00:00' WHERE `schedulename` = '3 AM';
UPDATE `milkingschedules` SET `starttime` = '11:00:00' WHERE `schedulename` = '11 AM';
UPDATE `milkingschedules` SET `starttime` = '16:00:00' WHERE `schedulename` = '4 PM';

UPDATE `feedingshifts` SET `starttime` = '03:00:00' WHERE `shiftname` = '3 AM';
UPDATE `feedingshifts` SET `starttime` = '11:00:00' WHERE `shiftname` = '11 AM';
UPDATE `feedingshifts` SET `starttime` = '16:00:00' WHERE `shiftname` = '4 PM';
