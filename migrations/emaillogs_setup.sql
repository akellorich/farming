-- Migration: Create emaillogs table and its CRUD procedures
CREATE TABLE IF NOT EXISTS `emaillogs` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `sender` VARCHAR(255) NOT NULL,
    `recipient` VARCHAR(255) NOT NULL,
    `subject` VARCHAR(255),
    `message` TEXT,
    `status` ENUM('Pending', 'Sent', 'Failed') DEFAULT 'Pending',
    `statusreason` TEXT,
    `sentdate` DATETIME NULL,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `addedby` INT,
    CONSTRAINT `fk_emaillogs_user` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

DELIMITER $$

-- Save a new email log entry
DROP PROCEDURE IF EXISTS `sp_saveemaillog`$$
CREATE PROCEDURE `sp_saveemaillog`(
    IN `$sender` VARCHAR(255),
    IN `$recipient` VARCHAR(255),
    IN `$subject` VARCHAR(255),
    IN `$message` TEXT,
    IN `$userid` INT
)
BEGIN
    INSERT INTO `emaillogs` (`sender`, `recipient`, `subject`, `message`, `addedby`)
    VALUES (`$sender`, `$recipient`, `$subject`, `$message`, `$userid`);
END$$

-- Get pending emails for processing
DROP PROCEDURE IF EXISTS `sp_getpendingemails`$$
CREATE PROCEDURE `sp_getpendingemails`()
BEGIN
    SELECT * FROM `emaillogs` WHERE `status` = 'Pending' ORDER BY `dateadded` ASC;
END$$

-- Update email status after processing
DROP PROCEDURE IF EXISTS `sp_updateemailstatus`$$
CREATE PROCEDURE `sp_updateemailstatus`(
    IN `$id` INT,
    IN `$status` ENUM('Sent', 'Failed'),
    IN `$reason` TEXT
)
BEGIN
    UPDATE `emaillogs`
    SET `status` = `$status`,
        `statusreason` = `$reason`,
        `sentdate` = IF(`$status` = 'Sent', NOW(), `sentdate`)
    WHERE `id` = `$id`;
END$$

-- Get recent email logs for settings UI
DROP PROCEDURE IF EXISTS `sp_getrecentemaillogs`$$
CREATE PROCEDURE `sp_getrecentemaillogs`()
BEGIN
    SELECT 
        `id`, 
        `sender`, 
        `recipient`, 
        `status`, 
        IFNULL(`statusreason`, 'Success') as `reason`,
        DATE_FORMAT(`dateadded`, '%H:%i') as `timeadded`
    FROM `emaillogs`
    ORDER BY `dateadded` DESC
    LIMIT 5;
END$$

DELIMITER ;
