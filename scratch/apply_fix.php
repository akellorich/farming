<?php
require_once('../models/db.php');

class Fixer extends db {
    public function apply() {
        try {
            echo "Starting fix...\n";
            
            // 1. Add capacity column if not exists
            $this->getData("ALTER TABLE poultryhouses ADD COLUMN IF NOT EXISTS capacity INT DEFAULT 0 AFTER housename");
            echo "Table altered (capacity added).\n";
            
            // 2. Update sp_savepoultryhouse
            $sql = "
            DROP PROCEDURE IF EXISTS sp_savepoultryhouse;
            CREATE PROCEDURE sp_savepoultryhouse(
                IN \$id INT,
                IN \$housename VARCHAR(100),
                IN \$capacity INT,
                IN \$description TEXT,
                IN \$status VARCHAR(50),
                IN \$userid INT,
                IN \$platform VARCHAR(1000)
            )
            BEGIN
                DECLARE \$originalvalues MEDIUMTEXT DEFAULT '';
                DECLARE \$updatedvalues MEDIUMTEXT DEFAULT '';
                
                START TRANSACTION;
                IF \$id = 0 THEN
                    INSERT INTO poultryhouses (housename, capacity, description, status, addedby)
                    VALUES (\$housename, \$capacity, \$description, \$status, \$userid);
                    SET \$id = LAST_INSERT_ID();
                    SET \$updatedvalues = JSON_OBJECT('id', \$id, 'housename', \$housename, 'capacity', \$capacity);
                    INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
                    VALUES (NOW(), \$userid, 'Insert', CONCAT('Registered Poultry House: ', \$housename), \$platform, \$updatedvalues);
                ELSE
                    SELECT JSON_OBJECT('housename', housename, 'capacity', capacity) INTO \$originalvalues 
                    FROM poultryhouses WHERE houseid = \$id;
                    UPDATE poultryhouses 
                    SET housename = \$housename, capacity = \$capacity, description = \$description, status = \$status
                    WHERE houseid = \$id;
                    SET \$updatedvalues = JSON_OBJECT('id', \$id, 'housename', \$housename, 'capacity', \$capacity);
                    INSERT INTO audittrail (timestamp, userid, operation, narration, platform, originalvalues, updatedvalues)
                    VALUES (NOW(), \$userid, 'Update', CONCAT('Updated Poultry House: ', \$housename), \$platform, \$originalvalues, \$updatedvalues);
                END IF;
                COMMIT;
                SELECT \$id AS houseid;
            END;
            ";
            
            $conn = $this->connect();
            $conn->exec($sql);
            echo "Stored Procedure updated.\n";
            
            echo "Fix applied successfully.";
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }
    }
}

$f = new Fixer();
$f->apply();
?>
