<?php
require_once('models/db.php');
$db = new db();
try {
    $rst = $db->getData("SHOW CREATE PROCEDURE sp_getinventoryitems");
    $row = $rst->fetch(PDO::FETCH_ASSOC);
    print_r($row['Create Procedure']);
} catch (Exception $e) {
    echo "ERROR: " . $e->getMessage();
}
?>
