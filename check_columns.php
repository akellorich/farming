<?php
require_once('models/db.php');
$db = new db();
try {
    $rst = $db->getData("DESCRIBE inventoryitems");
    while($row = $rst->fetch(PDO::FETCH_ASSOC)) {
        print_r($row);
    }
} catch (Exception $e) {
    echo "ERROR: " . $e->getMessage();
}
?>
