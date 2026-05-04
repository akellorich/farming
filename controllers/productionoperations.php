<?php
require_once("../models/production.php");
$production = new production();

$action = $_GET['action'] ?? $_POST['action'] ?? '';

if ($action == 'saveproduction') {
    $id = $_POST['id'] ?? 0;
    $logdate = $_POST['logdate'] ?? date('Y-m-d');
    $scheduleid = $_POST['scheduleid'] ?? 0;
    $animalid = $_POST['animalid'] ?? 0;
    $quantity = $_POST['quantity'] ?? 0;
    $density = $_POST['density'] ?? 1.030;
    $narration = $_POST['narration'] ?? '';

    $response = $production->saveMilkCollection($id, $logdate, $scheduleid, $animalid, $quantity, $density, $narration);
    echo $response;
}

if ($action == 'getproduction') {
    $startdate = $_GET['startdate'] ?? date('Y-m-d', strtotime('-30 days'));
    $enddate = $_GET['enddate'] ?? date('Y-m-d');
    $scheduleid = $_GET['scheduleid'] ?? 0;

    echo $production->getMilkCollection($startdate, $enddate, $scheduleid);
}

if ($action == 'getproductionstats') {
    $logdate = $_GET['logdate'] ?? date('Y-m-d');
    echo $production->getProductionStats($logdate);
}

if ($action == 'getproductiontrends') {
    $enddate = $_GET['enddate'] ?? date('Y-m-d');
    echo $production->getProductionTrends($enddate);
}

if ($action == 'getshifts') {
    echo $production->getShifts();
}
?>
