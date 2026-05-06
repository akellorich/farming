<?php
require_once("models/db.php");
$db = new db();
$sql = "SHOW TABLES LIKE 'vaccinationschedules'";
try {
    $rst = $db->connect()->query($sql);
    if ($rst->rowCount() > 0) {
        echo "vaccinationschedules exists\n";
        $rst = $db->connect()->query("DESCRIBE vaccinationschedules");
        while ($row = $rst->fetch(PDO::FETCH_ASSOC)) {
            echo $row['Field'] . " - " . $row['Type'] . "\n";
        }
    } else {
        echo "vaccinationschedules DOES NOT exist\n";
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
?>
