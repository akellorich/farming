-- Jukam Poultry Management System - Poultry Settings SP Test Calls
-- File: migrations/poultry_settings_test_calls.sql

-- ======================================================================
-- 1. POULTRY BIRD TYPES
-- ======================================================================

-- Insert New Bird Type
CALL sp_savepoultrybirdtype(0, 'Ornamental', 'Birds kept for exhibition or as pets.', 5, 'Test Platform');

-- Update Bird Type (Assuming ID 4 from above)
-- CALL sp_savepoultrybirdtype(4, 'Ornamental Poultry', 'Updated description for exhibition birds.', 5, 'Test Platform');

-- Get All Bird Types
CALL sp_getpoultrybirdtypes();

-- Soft Delete Bird Type
-- CALL sp_deletepoultrybirdtype(4, 5, 'No longer tracking ornamental birds', 'Test Platform');


-- ======================================================================
-- 2. POULTRY BREEDS
-- ======================================================================

-- Insert New Breed
CALL sp_savepoultrybreed(0, 'Rhode Island Red', 'Layers', 'Dual-purpose but excellent layers.', 5, 'Test Platform');

-- Update Breed (Assuming ID 4)
-- CALL sp_savepoultrybreed(4, 'Rhode Island Red', 'Dual Purpose', 'Good for both meat and eggs.', 5, 'Test Platform');

-- Get All Breeds
CALL sp_getpoultrybreeds();

-- Soft Delete Breed
-- CALL sp_deletepoultrybreed(4, 5, 'Low productivity', 'Test Platform');


-- ======================================================================
-- 3. POULTRY FLOCK STAGES
-- ======================================================================

-- Insert New Stage
CALL sp_savepoultryflockstage(0, 'Pre-Lay', 'Layers', '16 - 18 Weeks', 5, 'Test Platform');

-- Update Stage
-- CALL sp_savepoultryflockstage(4, 'Pre-Lay High Calcium', 'Layers', '17 - 19 Weeks', 5, 'Test Platform');

-- Get All Stages
CALL sp_getpoultryflockstages();

-- Soft Delete Stage
-- CALL sp_deletepoultryflockstage(4, 5, 'Merged with Layer stage', 'Test Platform');


-- ======================================================================
-- 4. POULTRY HOUSES & PENS
-- ======================================================================

-- Insert New House
CALL sp_savepoultryhouse(0, 'Brooder House 1', 'Specialized house for day-old chicks', 'Active', 5, 'Test Platform');

-- Update House
-- CALL sp_savepoultryhouse(4, 'Brooder House 1', 'Capacity: 2000 chicks', 'Active', 5, 'Test Platform');

-- Get All Houses
CALL sp_getpoultryhouses();

-- Soft Delete House
-- CALL sp_deletepoultryhouse(4, 5, 'Decommissioned facility', 'Test Platform');


-- ======================================================================
-- 5. POULTRY INVENTORY CATEGORIES
-- ======================================================================

-- Insert New Category
CALL sp_savepoultryinventorycategory(0, 'EQU001', 'Equipment', 'EQU-', 1, 1, 5, 'Test Platform');

-- Update Category
-- CALL sp_savepoultryinventorycategory(4, 'EQU001', 'Poultry Equipment', 'P-EQU-', 10, 1, 5, 'Test Platform');

-- Get All Categories
CALL sp_getpoultryinventorycategories();

-- Soft Delete Category
-- CALL sp_deletepoultryinventorycategory(4, 5, 'Obsolete category', 'Test Platform');


-- ======================================================================
-- 6. POULTRY INVENTORY ITEMS
-- ======================================================================

-- Insert New Item
CALL sp_savepoultryinventoryitem(0, 'Automatic Drinker', 'EQU-001', 4, 'Piece', 0, 5, 'Test Platform');

-- Update Item
-- CALL sp_savepoultryinventoryitem(4, 'Nipple Drinker', 'EQU-001', 4, 'Piece', 0, 5, 'Test Platform');

-- Get All Items
CALL sp_getpoultryinventoryitems();

-- Soft Delete Item
-- CALL sp_deletepoultryinventoryitem(4, 5, 'Damaged beyond repair', 'Test Platform');


-- ======================================================================
-- 7. POULTRY DISEASES
-- ======================================================================

-- Insert New Disease
CALL sp_savepoultrydisease(0, 'Marek''s Disease', 'Highly contagious viral cancer.', 'Critical', 5, 'Test Platform');

-- Update Disease
-- CALL sp_savepoultrydisease(4, 'Marek''s Disease', 'Preventable via early vaccination.', 'High', 5, 'Test Platform');

-- Get All Diseases
CALL sp_getpoultrydiseases();

-- Soft Delete Disease
-- CALL sp_deletepoultrydisease(4, 5, 'Error in data entry', 'Test Platform');


-- ======================================================================
-- 8. POULTRY MORTALITY REASONS
-- ======================================================================

-- Insert New Reason
CALL sp_savepoultrymortalityreason(0, 'Cannibalism', 'Loss due to pecking and aggressive behavior.', 5, 'Test Platform');

-- Update Reason
-- CALL sp_savepoultrymortalityreason(4, 'Severe Cannibalism', 'Loss due to aggressive behavior in high density pens.', 5, 'Test Platform');

-- Get All Mortality Reasons
CALL sp_getpoultrymortalityreasons();

-- Soft Delete Mortality Reason
-- CALL sp_deletepoultrymortalityreason(4, 5, 'No longer occurring', 'Test Platform');


-- ======================================================================
-- 9. POULTRY FEED FORMULATIONS
-- ======================================================================

-- Insert New Formulation
-- Note: This returns the last_insert_id for formulationid
CALL sp_savepoultryformulation(0, 'Layer Peak Production Mix', 'Layers', 'Layers', 5, 'Test Platform');

-- Add Ingredients to the above Formulation (Assuming ID 3)
CALL sp_savepoultryformulationingredient(3, 1, 60.00); -- Maize
CALL sp_savepoultryformulationingredient(3, 3, 40.00); -- Vitamin Premix

-- Update Formulation
-- CALL sp_savepoultryformulation(3, 'Layer Peak Production Mix V2', 'Layers', 'Layers', 5, 'Test Platform');

-- Get All Formulations
CALL sp_getpoultryformulations();

-- Get Formulation Ingredients
CALL sp_getpoultryformulationingredients(3);

-- Soft Delete Formulation
-- CALL sp_deletepoultryformulation(3, 5, 'Recipe updated', 'Test Platform');


-- ======================================================================
-- 10. AUDIT TRAIL VERIFICATION
-- ======================================================================

-- Check the audit trail to see all the operations above logged
SELECT * FROM audittrail ORDER BY timestamp DESC LIMIT 20;
