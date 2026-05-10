<?php
require_once('models/db.php');
$db = new db();
$rst = $db->getData("DESCRIBE poultryhouses");
if ($rst) {
    while ($row = $rst->fetch(PDO::FETCH_ASSOC)) {
        print_r($row);
    }
} else {
    echo "Could not describe table.";
}
?>
