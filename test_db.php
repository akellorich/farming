<?php
require_once('models/feeding.php');
$feeding = new feeding();
try {
    echo $feeding->getFeedingLogs();
} catch (Exception $e) {
    echo "ERROR: " . $e->getMessage();
}
?>
