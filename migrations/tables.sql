-- JUKAM Dairy Management System - Schema & Seed Setup
-- This script creates the tables and populates initial seed data.

SET FOREIGN_KEY_CHECKS = 0;

-- Dropping tables in order of dependency
DROP TABLE IF EXISTS `deworming`;
DROP TABLE IF EXISTS `vaccinations`;
DROP TABLE IF EXISTS `dewormingschedules`;
DROP TABLE IF EXISTS `vaccinationschedules`;
DROP TABLE IF EXISTS `healthlogs`;
DROP TABLE IF EXISTS `diseases`;
DROP TABLE IF EXISTS `milkcollection`;
DROP TABLE IF EXISTS `feedinglogs`;
DROP TABLE IF EXISTS `animals`;
DROP TABLE IF EXISTS `pens`;
DROP TABLE IF EXISTS `breeds`;
DROP TABLE IF EXISTS `countries`;
DROP TABLE IF EXISTS `milkingschedules`;
DROP TABLE IF EXISTS `feedingshifts`;

SET FOREIGN_KEY_CHECKS = 1;

-- 1. Feeding Shifts Lookup Table
CREATE TABLE `feedingshifts` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `shiftname` VARCHAR(50) NOT NULL,
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT NULL,
    `datedeleted` DATETIME NULL,
    `reasondeleted` TEXT NULL,
    CONSTRAINT `fkfeedingshiftsaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkfeedingshiftsdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `feedingshifts` (`shiftname`, `addedby`) VALUES ('3 AM', 5), ('11 AM', 5), ('4 PM', 5);

-- 2. Milking Schedules Lookup Table
CREATE TABLE `milkingschedules` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `schedulename` VARCHAR(50) NOT NULL,
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT NULL,
    `datedeleted` DATETIME NULL,
    `reasondeleted` TEXT NULL,
    CONSTRAINT `fkmilkingschedulesaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkmilkingschedulesdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `milkingschedules` (`schedulename`, `addedby`) VALUES ('3 AM', 5), ('11 AM', 5), ('4 PM', 5);

-- 3. Countries Lookup Table
CREATE TABLE `countries` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `countryname` VARCHAR(100) NOT NULL,
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT NULL,
    `datedeleted` DATETIME NULL,
    `reasondeleted` TEXT NULL,
    CONSTRAINT `fkcountriesaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkcountriesdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `countries` (`countryname`, `addedby`) VALUES ('Netherlands', 5), ('Channel Islands', 5), ('Scotland', 5), ('Kenya', 5), ('Ethiopia', 5);

-- 4. Diseases Lookup Table
CREATE TABLE `diseases` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `diseasename` VARCHAR(100) NOT NULL,
    `commonsymptoms` TEXT,
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT NULL,
    `datedeleted` DATETIME NULL,
    `reasondeleted` TEXT NULL,
    CONSTRAINT `fkdiseasesaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkdiseasesdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `diseases` (`diseasename`, `commonsymptoms`, `addedby`) VALUES 
('Mastitis', 'Swollen udder, clots in milk, fever', 5),
('Foot and Mouth Disease', 'Blisters on mouth and feet, lameness, drooling', 5),
('East Coast Fever', 'Swollen lymph nodes, high fever, difficulty breathing', 5),
('Milk Fever', 'Inability to stand after calving, cold extremities', 5),
('Bloat', 'Distended left side of abdomen, respiratory distress', 5),
('Lumpy Skin Disease', 'Nodules on skin, fever, nasal discharge', 5),
('Anthrax', 'Sudden death, bleeding from orifices', 5),
('Brucellosis', 'Late-term abortion, retained placenta, infertility', 5);

-- 5. Vaccination Schedules Lookup Table
CREATE TABLE `vaccinationschedules` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `vaccinename` VARCHAR(100) NOT NULL,
    `diseaseid` INT NULL,
    `targetage` VARCHAR(50), 
    `frequency` VARCHAR(50), 
    `description` TEXT,
    CONSTRAINT `fkvaccinationschedulename` FOREIGN KEY (`diseaseid`) REFERENCES `diseases`(`id`),
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT NULL,
    `datedeleted` DATETIME NULL,
    `reasondeleted` TEXT NULL,
    CONSTRAINT `fkvaccinationschedulesaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkvaccinationschedulesdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `vaccinationschedules` (`vaccinename`, `diseaseid`, `targetage`, `frequency`, `description`, `addedby`) VALUES 
('FMD', 2, '6 Months', 'Every 6 Months', 'Foot and Mouth Disease vaccination', 5),
('Anthrax/BQ', 7, '3 Months', 'Annually', 'Anthrax and Blackquarter combined', 5),
('LSD Vaccine', 6, '6 Months', 'Annually', 'Lumpy Skin Disease protection', 5),
('Brucella S19', 8, '3-8 Months', 'Once (Heifers)', 'Bovine Brucellosis vaccination', 5);

-- 6. Deworming Schedules Lookup Table
CREATE TABLE `dewormingschedules` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `schedulename` VARCHAR(100) NOT NULL,
    `frequency` VARCHAR(50), 
    `recommendedproduct` VARCHAR(100),
    `description` TEXT,
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT NULL,
    `datedeleted` DATETIME NULL,
    `reasondeleted` TEXT NULL,
    CONSTRAINT `fkdewormingschedulesaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkdewormingschedulesdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `dewormingschedules` (`schedulename`, `frequency`, `recommendedproduct`, `description`, `addedby`) VALUES 
('Calf Deworming', 'Monthly', 'Albendazole', 'First 6 months of life', 5),
('Adult Routine', 'Quarterly', 'Ivermectin / Levamisole', 'Routine internal parasite control', 5),
('Pre-Calving', 'Once', 'Fenbendazole', 'Administered 2 weeks before expected calving', 5);

-- 7. Breeds Table
CREATE TABLE `breeds` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `breedname` VARCHAR(100) NOT NULL,
    `originid` INT,
    `characteristics` TEXT,
    `isindigenous` TINYINT(1) DEFAULT 0,
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT NULL,
    `datedeleted` DATETIME NULL,
    `reasondeleted` TEXT NULL,
    CONSTRAINT `fkbreedsorigin` FOREIGN KEY (`originid`) REFERENCES `countries`(`id`),
    CONSTRAINT `fkbreedsaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkbreedsdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `breeds` (`breedname`, `originid`, `characteristics`, `isindigenous`, `addedby`) VALUES 
('Holstein Friesian', 1, 'High milk production, black and white markings', 0, 5),
('Jersey', 2, 'High butterfat content, small size, heat tolerant', 0, 5),
('Guernsey', 2, 'Yellow-gold milk, efficient converters of forage', 0, 5),
('Ayrshire', 3, 'Hardy, good foraging ability, efficient milkers', 0, 5),
('Boran', 4, 'Excellent heat resistance, tick tolerant, indigenous meat/dairy', 1, 5);

-- 8. Pens Table
CREATE TABLE `pens` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `penname` VARCHAR(100) NOT NULL,
    `pentype` VARCHAR(50) NOT NULL,
    `capacity` INT NOT NULL,
    `locationcluster` VARCHAR(255),
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT NULL,
    `datedeleted` DATETIME NULL,
    `reasondeleted` TEXT NULL,
    CONSTRAINT `fkpensaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkpensdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `pens` (`penname`, `pentype`, `capacity`, `locationcluster`, `addedby`) VALUES 
('Maternity Wing A', 'Maternity', 15, 'North Sector - Block 1', 5),
('Lactation Hub 01', 'Heifer', 40, 'East Sector - Block 2', 5),
('Calf Nursery', 'Nursery', 20, 'Central Sector - Block A', 5),
('Isolation Unit', 'Isolation', 5, 'West Sector - Restricted', 5),
('Dry Cow Block B', 'Dry Cow', 30, 'South Sector - Block 3', 5);

-- 9. Animals Table
CREATE TABLE `animals` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `tagid` VARCHAR(50) NOT NULL UNIQUE,
    `designatedname` VARCHAR(100) NULL,
    `breedid` INT,
    `penid` INT,
    `damid` INT NULL, 
    `birthdate` DATE,
    `initialweight` DECIMAL(10, 2),
    `registrationsource` VARCHAR(50) NOT NULL,
    `purchaseprice` DECIMAL(15, 2) DEFAULT 0.00,
    `status` VARCHAR(50) DEFAULT 'Active',
    CONSTRAINT `fkanimalbreed` FOREIGN KEY (`breedid`) REFERENCES `breeds`(`id`),
    CONSTRAINT `fkanimalpen` FOREIGN KEY (`penid`) REFERENCES `pens`(`id`),
    CONSTRAINT `fkanimallineage` FOREIGN KEY (`damid`) REFERENCES `animals`(`id`),
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT NULL,
    `datedeleted` DATETIME NULL,
    `reasondeleted` TEXT NULL,
    CONSTRAINT `fkanimalsaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkanimalsdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `animals` (`tagid`, `designatedname`, `breedid`, `penid`, `damid`, `birthdate`, `initialweight`, `registrationsource`, `purchaseprice`, `status`, `addedby`) VALUES 
('JK-2022-001', 'Daisy', 1, 2, NULL, '2022-03-15', 35.50, 'Born on Farm', 0.00, 'Active', 5),
('JK-2022-002', 'Bella', 2, 2, NULL, '2022-04-10', 32.00, 'Born on Farm', 0.00, 'Active', 5),
('JK-2023-045', 'Luna', 1, 3, 1, '2023-11-20', 38.00, 'Born on Farm', 0.00, 'Active', 5),
('JK-PUR-001', 'Goldie', 3, 2, NULL, '2021-06-05', 450.00, 'External Purchase', 1200.00, 'Active', 5),
('JK-2024-012', 'Molly', 4, 3, 2, '2024-01-05', 30.50, 'Born on Farm', 0.00, 'Active', 5);

-- 10. Feeding Logs Table
CREATE TABLE `feedinglogs` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `logdate` DATE NOT NULL,
    `shiftid` INT,
    `penid` INT,
    `feedtype` VARCHAR(100),
    `quantitykg` DECIMAL(10, 2) NOT NULL,
    `notes` TEXT,
    CONSTRAINT `fkfeedingshift` FOREIGN KEY (`shiftid`) REFERENCES `feedingshifts`(`id`),
    CONSTRAINT `fkfeedingpen` FOREIGN KEY (`penid`) REFERENCES `pens`(`id`),
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT NULL,
    `datedeleted` DATETIME NULL,
    `reasondeleted` TEXT NULL,
    CONSTRAINT `fkfeedinglogsaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkfeedinglogsdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `feedinglogs` (`logdate`, `shiftid`, `penid`, `feedtype`, `quantitykg`, `notes`, `addedby`) VALUES 
(CURDATE(), 1, 2, 'TMR Mixed', 250.50, 'Regular morning feed', 5),
(CURDATE(), 1, 3, 'Calf Pellets', 45.00, 'High protein ration', 5),
(CURDATE(), 2, 2, 'Silage', 150.00, 'Supplementary roughage', 5),
(CURDATE() - INTERVAL 1 DAY, 3, 2, 'Dairy Meal', 80.00, 'Evening concentrate', 5);

-- 11. Milk Collection Table
CREATE TABLE `milkcollection` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `logdate` DATE NOT NULL,
    `scheduleid` INT,
    `animalid` INT,
    `quantitylitres` DECIMAL(10, 2) NOT NULL,
    `milkdensity` DECIMAL(5, 4) DEFAULT 1.0300,
    `narration` TEXT,
    CONSTRAINT `fkmilkcollectionschedule` FOREIGN KEY (`scheduleid`) REFERENCES `milkingschedules`(`id`),
    CONSTRAINT `fkmilkcollectionanimal` FOREIGN KEY (`animalid`) REFERENCES `animals`(`id`),
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT NULL,
    `datedeleted` DATETIME NULL,
    `reasondeleted` TEXT NULL,
    CONSTRAINT `fkmilkcollectionaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkmilkcollectiondeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `milkcollection` (`logdate`, `scheduleid`, `animalid`, `quantitylitres`, `milkdensity`, `narration`, `addedby`) VALUES 
(CURDATE(), 1, 1, 12.5, 1.0310, 'Normal morning yield', 5),
(CURDATE(), 1, 2, 9.8, 1.0340, 'High fat content observed', 5),
(CURDATE(), 1, 4, 11.2, 1.0320, 'Consistent producer', 5),
(CURDATE() - INTERVAL 1 DAY, 3, 1, 10.4, 1.0300, 'Evening session', 5);

-- 12. Health Logs Table
CREATE TABLE `healthlogs` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `logdate` DATE NOT NULL,
    `animalid` INT,
    `diseaseid` INT NULL,
    `diagnosis` VARCHAR(255),
    `treatment` TEXT,
    `veterinarian` VARCHAR(100),
    `nextfollowup` DATE NULL,
    CONSTRAINT `fkhealthanimal` FOREIGN KEY (`animalid`) REFERENCES `animals`(`id`),
    CONSTRAINT `fkhealthdisease` FOREIGN KEY (`diseaseid`) REFERENCES `diseases`(`id`),
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT NULL,
    `datedeleted` DATETIME NULL,
    `reasondeleted` TEXT NULL,
    CONSTRAINT `fkhealthlogsaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkhealthlogsdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `healthlogs` (`logdate`, `animalid`, `diseaseid`, `diagnosis`, `treatment`, `veterinarian`, `nextfollowup`, `addedby`) VALUES 
(CURDATE() - INTERVAL 5 DAY, 1, 1, 'Early stage mastitis', 'Antibiotic ointment, frequent stripping', 'Dr. Kamau', CURDATE() + INTERVAL 7 DAY, 5),
(CURDATE() - INTERVAL 2 DAY, 3, NULL, 'Routine Checkup', 'Vitamins administration', 'Dr. Sarah', CURDATE() + INTERVAL 30 DAY, 5),
(CURDATE() - INTERVAL 10 DAY, 2, 5, 'Severe Bloat', 'Trocarization and anti-foaming agent', 'Farm Tech', NULL, 5);

-- 13. Vaccinations Table
CREATE TABLE `vaccinations` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `animalid` INT NOT NULL,
    `scheduleid` INT NULL,
    `vaccinationdate` DATE NOT NULL,
    `vaccinename` VARCHAR(100), -- Optional if scheduleid is provided
    `productused` VARCHAR(100),
    `batchno` VARCHAR(50),
    `dosage` VARCHAR(50),
    `administeredby` VARCHAR(100),
    `nextdue` DATE NULL,
    CONSTRAINT `fkvaccinationanimal` FOREIGN KEY (`animalid`) REFERENCES `animals`(`id`),
    CONSTRAINT `fkvaccinationsched` FOREIGN KEY (`scheduleid`) REFERENCES `vaccinationschedules`(`id`),
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT NULL,
    `datedeleted` DATETIME NULL,
    `reasondeleted` TEXT NULL,
    CONSTRAINT `fkvaccinationsaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkvaccinationsdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `vaccinations` (`animalid`, `scheduleid`, `vaccinationdate`, `productused`, `batchno`, `dosage`, `administeredby`, `nextdue`, `addedby`) VALUES 
(1, 1, CURDATE() - INTERVAL 30 DAY, 'Aftovax', 'BN-4552', '2ml', 'Dr. Kamau', CURDATE() + INTERVAL 180 DAY, 5),
(2, 2, CURDATE() - INTERVAL 15 DAY, 'Blanthrax', 'BN-1022', '2ml', 'Dr. Sarah', CURDATE() + INTERVAL 365 DAY, 5);

-- 14. Deworming Table
CREATE TABLE `deworming` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `animalid` INT NOT NULL,
    `scheduleid` INT NULL,
    `dewormingdate` DATE NOT NULL,
    `productused` VARCHAR(100),
    `dosage` VARCHAR(50),
    `method` VARCHAR(50),
    `administeredby` VARCHAR(100),
    `nextdue` DATE NULL,
    CONSTRAINT `fkdeworminganimal` FOREIGN KEY (`animalid`) REFERENCES `animals`(`id`),
    CONSTRAINT `fkdewormingsched` FOREIGN KEY (`scheduleid`) REFERENCES `dewormingschedules`(`id`),
    `addedby` INT,
    `dateadded` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted` TINYINT(1) DEFAULT 0,
    `deletedby` INT NULL,
    `datedeleted` DATETIME NULL,
    `reasondeleted` TEXT NULL,
    CONSTRAINT `fkdewormingaddedby` FOREIGN KEY (`addedby`) REFERENCES `user`(`userid`),
    CONSTRAINT `fkdewormingdeletedby` FOREIGN KEY (`deletedby`) REFERENCES `user`(`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `deworming` (`animalid`, `scheduleid`, `dewormingdate`, `productused`, `dosage`, `method`, `administeredby`, `nextdue`, `addedby`) VALUES 
(1, 1, CURDATE() - INTERVAL 10 DAY, 'Albendazole 10%', '30ml', 'Oral Drench', 'Farm Tech', CURDATE() + INTERVAL 90 DAY, 5),
(3, 2, CURDATE() - INTERVAL 10 DAY, 'Ivermectin', '5ml', 'Subcutaneous Injection', 'Dr. Kamau', CURDATE() + INTERVAL 90 DAY, 5);
