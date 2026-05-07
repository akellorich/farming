<?php
require_once("../models/feedmix.php");
$feedmix = new feedmix();

$action = $_GET['action'] ?? $_POST['action'] ?? '';

if ($action == 'savefeedmix') {
    $id = $_POST['id'] ?? 0;
    $feedcode = $_POST['feedcode'] ?? '';
    $feedname = $_POST['feedname'] ?? '';
    $mixdate = $_POST['mixdate'] ?? date('Y-m-d');
    $totalweight = $_POST['totalweight'] ?? 0;
    $generatecode = $_POST['generatecode'] ?? 0;
    
    // Components sent as a JSON string
    $componentsStr = $_POST['components'] ?? '[]';
    $components = json_decode($componentsStr, true);

    if (empty($feedname) || ($generatecode == 0 && empty($feedcode))) {
        echo json_encode(["status" => "error", "message" => "Feed name is required. Feed code is required if auto-generate is off."]);
        exit;
    }

    $rst = $feedmix->saveFeedMix($id, $feedcode, $feedname, $mixdate, $totalweight, $generatecode);
    $row = $rst->fetch(PDO::FETCH_ASSOC);
    
    if ($row && isset($row['feedmixid'])) {
        $feedmixid = $row['feedmixid'];
        
        // Save details
        if (is_array($components)) {
            foreach ($components as $comp) {
                $itemid = $comp['inventoryitemid'];
                $qty = $comp['quantity'];
                if ($itemid > 0 && $qty > 0) {
                    $feedmix->saveFeedMixDetail($feedmixid, $itemid, $qty);
                }
            }
        }
        echo json_encode(["status" => "success", "message" => "Feed formulation saved successfully", "id" => $feedmixid]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to save feed formulation"]);
    }
}

if ($action == 'getfeedmixes') {
    $id = $_GET['id'] ?? 0;
    echo $feedmix->getFeedMixes($id);
}

if ($action == 'getfeedmixdetails') {
    $feedmixid = $_GET['feedmixid'] ?? 0;
    echo $feedmix->getFeedMixDetails($feedmixid);
}

if ($action == 'getfeedmixstats') {
    echo $feedmix->getFeedMixStats();
}

if ($action == 'savemixedfeed') {
    $feedmixid = $_POST['feedmixid'] ?? 0;
    $batchweight = $_POST['batchweight'] ?? 0;

    if ($feedmixid <= 0 || $batchweight <= 0) {
        echo json_encode(["status" => "error", "message" => "Valid formulation reference and batch weight are required."]);
        exit;
    }

    $rst = $feedmix->recordMixing($feedmixid, $batchweight);
    $row = $rst->fetch(PDO::FETCH_ASSOC);
    
    if ($row && isset($row['mixedfeedid'])) {
        echo json_encode(["status" => "success", "message" => "Feed mixing event recorded successfully", "id" => $row['mixedfeedid']]);
    } else {
        echo json_encode(["status" => "error", "message" => "Failed to record mixing event"]);
    }
}

if ($action == 'deletefeedmix') {
    $id = $_POST['id'] ?? 0;
    echo $feedmix->deleteFeedMix($id);
}
?>
