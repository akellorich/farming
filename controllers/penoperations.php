<?php
    require_once("../models/pen.php");
    $pen = new pen();
    
    header('Content-Type: application/json');
    $action = $_GET['action'] ?? $_POST['action'] ?? '';

    if ($action == 'savepen') {
        $id = $_POST['id'] ?? 0;
        $penname = $_POST['penname'] ?? '';
        $pentype = $_POST['pentype'] ?? '';
        $capacity = $_POST['capacity'] ?? 0;
        $locationcluster = $_POST['locationcluster'] ?? '';
        
        $response = $pen->savePen($id, $penname, $pentype, $capacity, $locationcluster);
        echo json_encode($response);
    }

    if (isset($_GET['getpens']) || $action == 'getpens') {
        echo $pen->getPens();
    }
?>
