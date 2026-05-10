<?php
require_once('../models/db.php');

class DiseaseMigration extends db {
    public function apply() {
        try {
            echo "Starting Disease Enhancement Migration...\n";
            $conn = $this->connect();
            
            // 1. Create poultrydiseasetypes table
            $sql1 = "CREATE TABLE IF NOT EXISTS poultrydiseasetypes (
                typeid INT PRIMARY KEY AUTO_INCREMENT,
                typename VARCHAR(100) NOT NULL,
                description TEXT,
                addedby INT,
                deleted TINYINT(1) DEFAULT 0,
                createdat TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            )";
            $conn->exec($sql1);
            echo "Table poultrydiseasetypes created.\n";

            // 2. Add description and typeid to poultrydiseases if not exists
            // (description already exists from previous migration but let's be sure)
            $conn->exec("ALTER TABLE poultrydiseases ADD COLUMN IF NOT EXISTS description TEXT AFTER diseasename");
            $conn->exec("ALTER TABLE poultrydiseases ADD COLUMN IF NOT EXISTS typeid INT AFTER description");
            echo "Table poultrydiseases updated.\n";

            // 3. Seed initial disease types
            $types = ['Viral', 'Bacterial', 'Parasitic', 'Fungal', 'Nutritional'];
            foreach ($types as $type) {
                $check = $conn->query("SELECT COUNT(*) FROM poultrydiseasetypes WHERE typename = '$type'")->fetchColumn();
                if (!$check) {
                    $conn->exec("INSERT INTO poultrydiseasetypes (typename, addedby) VALUES ('$type', {$this->userid})");
                }
            }
            echo "Initial disease types seeded.\n";

            // 4. Update/Create Stored Procedures
            
            // Save Disease Type
            $conn->exec("DROP PROCEDURE IF EXISTS sp_savepoultrydiseasetype");
            $conn->exec("CREATE PROCEDURE sp_savepoultrydiseasetype(
                IN \$id INT,
                IN \$typename VARCHAR(100),
                IN \$description TEXT,
                IN \$userid INT
            )
            BEGIN
                IF \$id = 0 THEN
                    INSERT INTO poultrydiseasetypes (typename, description, addedby)
                    VALUES (\$typename, \$description, \$userid);
                ELSE
                    UPDATE poultrydiseasetypes SET typename = \$typename, description = \$description WHERE typeid = \$id;
                END IF;
            END");

            // Save Disease (Updated)
            $conn->exec("DROP PROCEDURE IF EXISTS sp_savepoultrydisease");
            $conn->exec("CREATE PROCEDURE sp_savepoultrydisease(
                IN \$id INT,
                IN \$diseasename VARCHAR(100),
                IN \$description TEXT,
                IN \$typeid INT,
                IN \$severity VARCHAR(50),
                IN \$userid INT,
                IN \$platform VARCHAR(1000)
            )
            BEGIN
                DECLARE \$originalvalues MEDIUMTEXT DEFAULT '';
                DECLARE \$updatedvalues MEDIUMTEXT DEFAULT '';
                
                IF \$id = 0 THEN
                    INSERT INTO poultrydiseases (diseasename, description, typeid, severity, addedby)
                    VALUES (\$diseasename, \$description, \$typeid, \$severity, \$userid);
                    SET \$id = LAST_INSERT_ID();
                    SET \$updatedvalues = JSON_OBJECT('id', \$id, 'name', \$diseasename);
                    INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
                    VALUES (NOW(), \$userid, 'Insert', CONCAT('Added Disease: ', \$diseasename), \$platform, \$updatedvalues);
                ELSE
                    SELECT JSON_OBJECT('name', diseasename) INTO \$originalvalues FROM poultrydiseases WHERE diseaseid = \$id;
                    UPDATE poultrydiseases SET diseasename = \$diseasename, description = \$description, typeid = \$typeid, severity = \$severity WHERE diseaseid = \$id;
                    SET \$updatedvalues = JSON_OBJECT('id', \$id, 'name', \$diseasename);
                    INSERT INTO audittrail (timestamp, userid, operation, narration, platform, originalvalues, updatedvalues)
                    VALUES (NOW(), \$userid, 'Update', CONCAT('Updated Disease: ', \$diseasename), \$platform, \$originalvalues, \$updatedvalues);
                END IF;
                SELECT \$id as diseaseid;
            END");

            // Get Diseases (Updated)
            $conn->exec("DROP PROCEDURE IF EXISTS sp_getpoultrydiseases");
            $conn->exec("CREATE PROCEDURE sp_getpoultrydiseases()
            BEGIN
                SELECT d.*, dt.typename as diseasetype 
                FROM poultrydiseases d
                LEFT JOIN poultrydiseasetypes dt ON d.typeid = dt.typeid
                WHERE d.deleted = 0
                ORDER BY d.diseasename ASC;
            END");

            // Get Disease Types
            $conn->exec("DROP PROCEDURE IF EXISTS sp_getpoultrydiseasetypes");
            $conn->exec("CREATE PROCEDURE sp_getpoultrydiseasetypes()
            BEGIN
                SELECT * FROM poultrydiseasetypes WHERE deleted = 0 ORDER BY typename ASC;
            END");

            echo "Migration applied successfully.";
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }
    }
}

$m = new DiseaseMigration();
$m->apply();
?>
