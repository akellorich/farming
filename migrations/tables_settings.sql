-- JUKAM Dairy Management System - Settings Tables
-- Tables for Company Details, Email Settings, and SMS Settings

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `companydetails`;
DROP TABLE IF EXISTS `emailsettings`;
DROP TABLE IF EXISTS `smssettings`;

SET FOREIGN_KEY_CHECKS = 1;

-- 1. Company Details Table (Single Row)
CREATE TABLE `companydetails` (
    `id` INT PRIMARY KEY DEFAULT 1,
    `companyname` VARCHAR(255) NOT NULL,
    `taxregno` VARCHAR(100),
    `incorporationdate` DATE,
    `emailaddress` VARCHAR(255),
    `physicaladdress` TEXT,
    `postaladdress` VARCHAR(255),
    `mobileno` VARCHAR(50),
    `logopath` VARCHAR(255),
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `lastupdated` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `updatedby` INT NULL,
    CONSTRAINT `fkcompanyaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkcompanyupdatedby` FOREIGN KEY (`updatedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `chk_single_row_company` CHECK (`id` = 1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 2. Email Settings Table (Multiple Roles)
CREATE TABLE `emailsettings` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `role` VARCHAR(100) NOT NULL, -- General, Account Management, Security Updates
    `smtpserver` VARCHAR(255),
    `smtpport` INT,
    `useremail` VARCHAR(255),
    `password` VARCHAR(255),
    `ssltoggle` TINYINT(1) DEFAULT 1,
    `sendmode` VARCHAR(50) DEFAULT 'Queue',
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `lastupdated` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `updatedby` INT NULL,
    CONSTRAINT `fkemailsettingsaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkemailsettingsupdatedby` FOREIGN KEY (`updatedby`) REFERENCES `user`(`userid`),
    UNIQUE KEY `uk_email_role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 3. SMS Settings Table (Multiple Providers with JSON Config)
CREATE TABLE `smssettings` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `providername` VARCHAR(100) NOT NULL, -- AfricasTalking, Talksasa, Uwazii
    `senderid` VARCHAR(11),
    `config` JSON, -- Flexible object for different API fields
    `priorityroute` TINYINT(1) DEFAULT 1,
    `isdefault` TINYINT(1) DEFAULT 0, -- Set to 1 for the active provider
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `lastupdated` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `updatedby` INT NULL,
    CONSTRAINT `fksmssettingsaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fksmssettingsupdatedby` FOREIGN KEY (`updatedby`) REFERENCES `user`(`userid`),
    UNIQUE KEY `uk_sms_provider` (`providername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Seed initial records
INSERT INTO `companydetails` (
    `id`, `companyname`, `taxregno`, `incorporationdate`, `emailaddress`, 
    `physicaladdress`, `postaladdress`, `mobileno`, `logopath`, `addedby`
) VALUES (
    1, 'JUKAM Dairy Limited', 'TRN-88291-JK', '2018-05-12', 'admin@jukamdairy.co.ke', 
    'Plot 45, Green Valley Industrial Estate, Sector 7, Rift Valley District', 
    'P.O. Box 7721, Nakuru Central', '+254 722 000 999', 'images/logo.png', 5
);

INSERT INTO `emailsettings` (
    `role`, `smtpserver`, `smtpport`, `useremail`, `password`, `ssltoggle`, `sendmode`, `addedby`
) VALUES 
('General', 'smtp.office365.com', 587, 'notifications@jukamdairy.com', 'SecurePass123!', 1, 'Queue', 5),
('Account Management', 'smtp.gmail.com', 465, 'accounts@jukamdairy.com', 'AccountPass123!', 1, 'Direct', 5),
('Security Updates', 'smtp.sendgrid.net', 587, 'security@jukamdairy.com', 'SecurityPass123!', 1, 'Queue', 5);

INSERT INTO `smssettings` (
    `providername`, `senderid`, `config`, `priorityroute`, `isdefault`, `addedby`
) VALUES 
('AfricasTalking', 'JUKAM-AT', '{"apikey": "AT-KEY-88291", "username": "jukam_admin"}', 1, 1, 5),
('Talksasa', 'JUKAM-TS', '{"apikey": "TS-KEY-44123", "apisecret": "TS-SECRET-456"}', 1, 0, 5),
('Uwazii', 'JUKAM-UW', '{"token": "UW-TOKEN-77341", "endpoint": "https://api.uwazii.com"}', 0, 0, 5);
