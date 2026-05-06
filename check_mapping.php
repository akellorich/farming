<?php
require_once('models/db.php');
$db = new db();
try {
    echo "--- Inventory Items (Feeds) ---\n";
    $rst = $db->getData("SELECT id, itemname FROM inventoryitems WHERE is_feed = 1");
    while($row = $rst->fetch(PDO::FETCH_ASSOC)) {
        echo "ID: {$row['id']} | Name: {$row['itemname']}\n";
    }
    
    echo "\n--- Feed Mixes ---\n";
    $rst = $db->getData("SELECT id, feedname FROM feedmix");
    while($row = $rst->fetch(PDO::FETCH_ASSOC)) {
        echo "ID: {$row['id']} | Name: {$row['feedname']}\n";
    }
} catch (Exception $e) {
    echo "ERROR: " . $e->getMessage();
}
?>
