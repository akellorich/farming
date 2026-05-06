<?php
require_once("models/db.php");
$db = new db();
$sql = "SHOW PROCEDURE STATUS WHERE Db = 'farm'";
try {
    $rst = $db->connect()->query($sql);
    while ($row = $rst->fetch(PDO::FETCH_ASSOC)) {
        echo $row['Name'] . "\n";
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
?>
