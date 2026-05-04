-- Migration: Create smslogs table and its CRUD procedures
DROP TABLE IF EXISTS `smslogs`;
CREATE TABLE IF NOT EXISTS `smslogs` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `senderid` VARCHAR(11) NOT NULL,
    `recipient` VARCHAR(20) NOT NULL,
    `message` TEXT,
    `status` ENUM('Pending', 'Sent', 'Failed') DEFAULT 'Pending',
    `statusreason` TEXT,
    `referenceno` VARCHAR(100) NULL,
    `readstatus` ENUM('Unread', 'Read') DEFAULT 'Unread',
    `dateread` DATETIME NULL,
    `timeadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `timesent` DATETIME NULL,
    `addedby` INT,
    CONSTRAINT `fk_smslogs_user` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DELIMITER $$

-- Save a new SMS log entry
DROP PROCEDURE IF EXISTS `sp_savesmslog`$$
CREATE PROCEDURE `sp_savesmslog`(
    IN `$senderid` VARCHAR(11),
    IN `$recipient` VARCHAR(20),
    IN `$message` TEXT,
    IN `$userid` INT
)
BEGIN
    INSERT INTO `smslogs` (`senderid`, `recipient`, `message`, `addedby`)
    VALUES (`$senderid`, `$recipient`, `$message`, `$userid`);
END$$

-- Update SMS status
DROP PROCEDURE IF EXISTS `sp_updatesmsstatus`$$
CREATE PROCEDURE `sp_updatesmsstatus`(
    IN `$id` INT,
    IN `$status` ENUM('Pending', 'Sent', 'Failed'),
    IN `$reason` TEXT,
    IN `$referenceno` VARCHAR(100)
)
BEGIN
    UPDATE `smslogs`
    SET `status` = `$status`,
        `statusreason` = `$reason`,
        `referenceno` = `$referenceno`,
        `timesent` = IF(`$status` = 'Sent', NOW(), `timesent`)
    WHERE `id` = `$id`;
END$$

-- Update SMS Read Status
DROP PROCEDURE IF EXISTS `sp_updatesmsreadstatus`$$
CREATE PROCEDURE `sp_updatesmsreadstatus`(
    IN `$id` INT,
    IN `$readstatus` ENUM('Unread', 'Read')
)
BEGIN
    UPDATE `smslogs`
    SET `readstatus` = `$readstatus`,
        `dateread` = IF(`$readstatus` = 'Read', NOW(), `dateread`)
    WHERE `id` = `$id`;
END$$

-- Get recent SMS logs for UI
DROP PROCEDURE IF EXISTS `sp_getrecentsmslogs`$$
CREATE PROCEDURE `sp_getrecentsmslogs`()
BEGIN
    SELECT * FROM `smslogs` ORDER BY `id` DESC LIMIT 5;
END$$

DELIMITER ;
