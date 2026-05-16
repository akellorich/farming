-- Jukam Farm Management System - Database Reset Script
-- WARNING: This script will truncate all data and reset IDs except for the Users table.
-- It is highly recommended to take a backup before running this script.

SET FOREIGN_KEY_CHECKS = 0;

-- 1. Transactional & Log Tables (Safe to Clear)
TRUNCATE TABLE `audittrail`;
TRUNCATE TABLE `emaillogs`;
TRUNCATE TABLE `smslogs`;
TRUNCATE TABLE `egg_disbursements`;
TRUNCATE TABLE `milkcollection`;
TRUNCATE TABLE `milkdisbursements`;
TRUNCATE TABLE `poultry_egg_collection`;
TRUNCATE TABLE `poultry_feeding_logs`;
TRUNCATE TABLE `poultry_mortality`;
TRUNCATE TABLE `productionlogs`;
TRUNCATE TABLE `feedinglogs`;
TRUNCATE TABLE `feedingloganimals`;
TRUNCATE TABLE `healthlogs`;

-- 2. Inventory & Procurement Tables
TRUNCATE TABLE `inventoryreceiptdetails`;
TRUNCATE TABLE `inventoryreceipts`;
TRUNCATE TABLE `poultryinventoryreceiptitems`;
TRUNCATE TABLE `poultryinventoryreceipts`;
TRUNCATE TABLE `inventoryitems`;
TRUNCATE TABLE `inventorycategories`;
TRUNCATE TABLE `poultryinventoryitems`;
TRUNCATE TABLE `poultryinventorycategories`;

-- 3. Operational Setup Tables
TRUNCATE TABLE `poultry_distribution_points`;
TRUNCATE TABLE `distributionpoints`;
TRUNCATE TABLE `poultryflocks`;
TRUNCATE TABLE `poultryhouses`;
TRUNCATE TABLE `pens`;
TRUNCATE TABLE `poultrybreeds`;
TRUNCATE TABLE `poultrybirdtypes`;
TRUNCATE TABLE `poultryflockstages`;
TRUNCATE TABLE `poultryformulations`;
TRUNCATE TABLE `poultryformulationingredients`;
TRUNCATE TABLE `poultrydiseases`;
TRUNCATE TABLE `poultrymortalityreasons`;
TRUNCATE TABLE `vaccinations`;
TRUNCATE TABLE `vaccinationschedules`;
TRUNCATE TABLE `poultry_flock_vaccination_schedule`;
TRUNCATE TABLE `poultry_birdtype_vaccinations`;

-- 4. Infrastructure & Support Tables
TRUNCATE TABLE `suppliers`;
TRUNCATE TABLE `poultrysuppliers`;
TRUNCATE TABLE `veterinarians`;
TRUNCATE TABLE `insurancecompanies`;
TRUNCATE TABLE `feedingshifts`;
TRUNCATE TABLE `poultrycollectionshifts`;
TRUNCATE TABLE `milkingschedules`;

-- 5. System Configuration Tables (Truncating these will reset roles and permissions)
-- If you want to keep your existing roles and module access, comment out the lines below.
TRUNCATE TABLE `roles`;
TRUNCATE TABLE `roleusers`;
TRUNCATE TABLE `roleprivileges`;
TRUNCATE TABLE `userprivileges`;
-- TRUNCATE TABLE `objects`;
UPDATE `serials` SET `currentno` = 1;
TRUNCATE TABLE `emailsettings`;
TRUNCATE TABLE `smssettings`;

-- 6. User Table - EXCLUDED AS PER REQUEST
-- TRUNCATE TABLE `user`;

SET FOREIGN_KEY_CHECKS = 1;

-- Final check of User table integrity (Optional)
-- Note: If you truncated 'roles' and 'roleusers', existing users will lose their role assignments.
