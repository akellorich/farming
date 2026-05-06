<?php
require_once('models/db.php');
$db = new db();
try {
    $rst = $db->getData("SHOW TABLES");
    while($row = $rst->fetch(PDO::FETCH_NUM)) {
        echo $row[0] . "\n";
    }
} catch (Exception $e) {
    echo "ERROR: " . $e->getMessage();
}
?>
