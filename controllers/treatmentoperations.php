<?php
require_once("../models/treatment.php");
$treatment = new treatment();

header('Content-Type: application/json');
$action = $_GET['action'] ?? $_POST['action'] ?? '';

if ($action == 'recordvaccination') {
    $record_type = $_POST['record_type'] ?? 'Routine';
    $scheduleid = ($record_type == 'Routine') ? 0 : ($_POST['scheduleid'] ?? 0);
    
    $animalids = $_POST['animalids'] ?? [];
    $date = $_POST['execution_date'];
    $product = $_POST['product_used'];
    $batch = $_POST['batch_no'] ?? '';
    $dosage = $_POST['dosage'] ?? '';
    $vet = $_POST['administered_by'];
    $notes = $_POST['notes'] ?? '';
    
    echo json_encode($treatment->recordBulkVaccination($scheduleid, $animalids, $date, $product, $batch, $dosage, $vet, $notes));
}

if ($action == 'recorddeworming') {
    $record_type = $_POST['record_type'] ?? 'Routine';
    $scheduleid = ($record_type == 'Routine') ? 0 : ($_POST['scheduleid'] ?? 0);
    
    $animalids = $_POST['animalids'] ?? [];
    $date = $_POST['execution_date'];
    $product = $_POST['product_used'];
    $dosage = $_POST['dosage'] ?? '';
    $method = $_POST['method'] ?? '';
    $vet = $_POST['administered_by'];
    $notes = $_POST['notes'] ?? '';
    
    echo json_encode($treatment->recordBulkDeworming($scheduleid, $animalids, $date, $product, $dosage, $method, $vet, $notes));
}

if ($action == 'getschedules') {
    $type = $_GET['type'];
    echo $treatment->getActiveSchedules($type);
}

if ($action == 'getanimalsbyschedule') {
    $scheduleid = $_GET['scheduleid'];
    $type = $_GET['type']; // 'vaccination' or 'deworming'
    echo $treatment->getAnimalsBySchedule($scheduleid, $type);
}
?>
