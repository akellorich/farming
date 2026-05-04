-- TEST SUITE FOR FEED MIX STORED PROCEDURES

-- 1. Test Saving a New Feed Mix (Manual Code)
-- CALL sp_savefeedmix($id, $feedcode, $feedname, $mixdate, $totalweight, $userid, $platform, $generatecode)
CALL sp_savefeedmix(0, 'TEST-001', 'Test Formulation', CURDATE(), 100.00, 5, 'Web', 0);

-- 2. Test Saving a New Feed Mix (Auto-Generated Code)
CALL sp_savefeedmix(0, '', 'Auto Generated Formulation', CURDATE(), 120.00, 5, 'Web', 1);

-- 3. Test Saving Feed Mix Detail
-- Note: Assuming the ID returned by previous call is 3
CALL sp_savefeedmixdetail(3, 1, 50.00);
CALL sp_savefeedmixdetail(3, 2, 50.00);

-- 4. Test Getting All Feed Mixes
CALL sp_getfeedmixes(0);

-- 5. Test Getting Specific Feed Mix
CALL sp_getfeedmixes(3);

-- 6. Test Getting Feed Mix Details
CALL sp_getfeedmixdetails(3);

-- 7. Test Updating Feed Mix
CALL sp_savefeedmix(3, 'UPDATED-001', 'Updated Formulation Name', CURDATE(), 150.00, 5, 'Web', 0);

-- 8. Test Deleting Feed Mix
CALL sp_deletefeedmix(3, 5, 'Web');

-- 9. Verify Audit Trail
SELECT * FROM audittrail ORDER BY timestamp DESC LIMIT 5;
