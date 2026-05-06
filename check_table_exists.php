<?php
require_once('models/db.php');
$db = new db();
try {
    $db->getData("DESCRIBE inventory_items");
    echo "EXISTS";
} catch (Exception $e) {
    echo "DOES NOT EXIST";
}
?>
