<?php
require_once("../models/feeding.php");
$feeding = new feeding();

$action = $_GET['action'] ?? $_POST['action'] ?? '';

if ($action == 'savefeedingrecord') {
    $id = $_POST['id'] ?? 0;
    $logdate = $_POST['logdate'] ?? date('Y-m-d');
    $shiftid = $_POST['shiftid'] ?? null;
    $penid = $_POST['penid'] ?? null;
    $sourceType = $_POST['feed_source_type'] ?? 'Feed';
    $feedId = $_POST['feed_id'] ?? null;
    $quantitykg = $_POST['quantitykg'] ?? 0;
    $notes = $_POST['notes'] ?? '';
    
    // Animal IDs sent as a JSON string or array
    $animalIdsStr = $_POST['animalids'] ?? '[]';
    $animalIds = json_decode($animalIdsStr, true);
    if (!is_array($animalIds)) {
        $animalIds = [];
    }

    if (empty($shiftid) || empty($penid) || empty($feedId) || $quantitykg <= 0) {
        echo json_encode(["status" => "error", "message" => "All mandatory fields must be filled correctly."]);
        exit;
    }

    $response = $feeding->saveFeedingLog($id, $logdate, $shiftid, $penid, $sourceType, $feedId, $quantitykg, $notes, $animalIds);
    echo json_encode($response);
}

if ($action == 'getfeedinglogs') {
    echo $feeding->getFeedingLogs();
}

if ($action == 'getfeedingloganimals') {
    $logid = $_GET['logid'] ?? 0;
    echo $feeding->getFeedingLogAnimals($logid);
}

if ($action == 'getfeedingstats') {
    echo $feeding->getFeedingStats();
}
if ($action == 'getweeklyconsumption') {
    echo $feeding->getWeeklyConsumption();
}
?>
