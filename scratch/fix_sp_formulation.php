<?php
require_once('../models/db.php');

class Fixer extends db {
    public function apply() {
        try {
            echo "Starting SP fix...\n";
            
            // Update sp_savepoultryformulation to remove internal transactions
            // This allows PHP to manage the transaction across header and ingredients
            $sql = "
            DROP PROCEDURE IF EXISTS sp_savepoultryformulation;
            CREATE PROCEDURE sp_savepoultryformulation(
                IN \$id INT,
                IN \$formulationname VARCHAR(100),
                IN \$birdtype VARCHAR(50),
                IN \$growthstage VARCHAR(50),
                IN \$userid INT,
                IN \$platform VARCHAR(1000)
            )
            BEGIN
                DECLARE \$originalvalues MEDIUMTEXT DEFAULT '';
                DECLARE \$updatedvalues MEDIUMTEXT DEFAULT '';
                
                -- Transaction removed here to allow PHP-level transaction management
                IF \$id = 0 THEN
                    INSERT INTO poultryformulations (formulationname, birdtype, growthstage, addedby)
                    VALUES (\$formulationname, \$birdtype, \$growthstage, \$userid);
                    SET \$id = LAST_INSERT_ID();
                    SET \$updatedvalues = JSON_OBJECT('id', \$id, 'formulationname', \$formulationname);
                    INSERT INTO audittrail (timestamp, userid, operation, narration, platform, updatedvalues)
                    VALUES (NOW(), \$userid, 'Insert', CONCAT('Created Feed Formulation: ', \$formulationname), \$platform, \$updatedvalues);
                ELSE
                    SELECT JSON_OBJECT('formulationname', formulationname) INTO \$originalvalues 
                    FROM poultryformulations WHERE formulationid = \$id;
                    UPDATE poultryformulations 
                    SET formulationname = \$formulationname, birdtype = \$birdtype, growthstage = \$growthstage
                    WHERE formulationid = \$id;
                    DELETE FROM poultryformulationingredients WHERE formulationid = \$id;
                    SET \$updatedvalues = JSON_OBJECT('id', \$id, 'formulationname', \$formulationname);
                    INSERT INTO audittrail (timestamp, userid, operation, narration, platform, originalvalues, updatedvalues)
                    VALUES (NOW(), \$userid, 'Update', CONCAT('Updated Feed Formulation: ', \$formulationname), \$platform, \$originalvalues, \$updatedvalues);
                END IF;
                -- Transaction removed here
                SELECT \$id as formulationid;
            END;
            ";
            
            $conn = $this->connect();
            $conn->exec($sql);
            echo "sp_savepoultryformulation fixed.\n";
            
            echo "Fix applied successfully.";
        } catch (Exception $e) {
            echo "Error: " . $e->getMessage();
        }
    }
}

$f = new Fixer();
$f->apply();
?>
