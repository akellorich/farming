<?php
require_once('models/db.php');
$db = new db();
try {
    $rst = $db->getData("SELECT id, feedtype FROM feedinglogs WHERE feed_id IS NULL LIMIT 20");
    while($row = $rst->fetch(PDO::FETCH_ASSOC)) {
        echo "ID: {$row['id']} | FeedType: {$row['feedtype']}\n";
    }
} catch (Exception $e) {
    echo "ERROR: " . $e->getMessage();
}
?>
