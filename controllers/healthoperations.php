<?php
    require_once("../models/health.php");
    $health = new health();
    
    $action = $_GET['action'] ?? $_POST['action'] ?? '';
    
    if($action == 'savehealthlog' || isset($_POST['savehealthlog'])){
        $id = $_POST['id'];
        $logdate = date('Y-m-d', strtotime($_POST['logdate']));
        $animalid = $_POST['animalid'];
        $diseaseid = $_POST['diseaseid'] ?: 'NULL';
        $diagnosis = $_POST['diagnosis'];
        $treatment = $_POST['treatment'];
        $narration = $_POST['narration'];
        $status = $_POST['status'];
        $veterinarianid = $_POST['veterinarianid'] ?? 0;
        
        $nextfollowup = $_POST['nextfollowup'] ? date('Y-m-d', strtotime($_POST['nextfollowup'])) : NULL;
        
        $response = $health->saveHealthLog($id, $logdate, $animalid, $diseaseid, $diagnosis, $treatment, $narration, $status, $veterinarianid, $nextfollowup);
        echo json_encode($response);
    }

    if($action == 'deletehealthlog' || isset($_POST['deletehealthlog'])){
        $id = $_POST['id'];
        $reason = $_POST['reason'];
        echo json_encode($health->deleteHealthLog($id, $reason));
    }

    if($action == 'gethealthlogs' || isset($_GET['gethealthlogs'])){
        echo $health->getHealthLogs();
    }

    if($action == 'getupcomingfollowups'){
        echo $health->getUpcomingFollowups();
    }

    if($action == 'gethealthsummary'){
        echo $health->getHealthSummary();
    }
?>
