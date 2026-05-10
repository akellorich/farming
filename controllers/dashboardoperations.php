<?php
require_once("../models/dashboard.php");
$dashboard = new dashboard();

$action = $_GET['action'] ?? $_POST['action'] ?? '';

if ($action == 'getstats') {
    echo $dashboard->getDashboardStats();
}
?>
