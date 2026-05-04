<?php
    require_once("../models/disease.php");
    $disease = new disease();
    
    if(isset($_GET['getdiseasedetails'])){
        $id = $_GET['id'];
        echo $disease->getDiseaseDetails($id);
    }

    if(isset($_POST['deletedisease'])){
        $id = $_POST['id'];
        $reason = $_POST['reason'];
        echo json_encode($disease->deleteDisease($id, $reason));
    }

    if(isset($_POST['savedisease'])){
        $id = $_POST['id'];
        $diseasename = $_POST['diseasename'];
        $commonsymptoms = $_POST['commonsymptoms'];
        $response = $disease->saveDisease($id, $diseasename, $commonsymptoms);
        echo json_encode($response);
    }

    if(isset($_GET['getdiseases'])){
        echo $disease->getDiseases();
    }
?>
