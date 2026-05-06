<?php
    require_once("../models/animal.php");
    $animal = new animal();
    
    $action = $_GET['action'] ?? $_POST['action'] ?? '';

    if ($action == 'saveanimal') {
        $id = $_POST['id'] ?? 0;
        $tagid = $_POST['tagid'] ?? '';
        $designatedname = $_POST['designatedname'] ?? '';
        $breedid = $_POST['breedid'] ?? null;
        $penid = $_POST['penid'] ?? null;
        $damid = $_POST['damid'] ?? null;
        $birthdate = $_POST['birthdate'] ?? null;
        $initialweight = $_POST['initialweight'] ?? 0.00;
        $registrationsource = $_POST['registrationsource'] ?? 'Born on Farm';
        $purchaseprice = $_POST['purchaseprice'] ?? 0.00;
        $status = $_POST['status'] ?? 'Active';
        $autogen = $_POST['autogen'] ?? 0;

        $response = $animal->saveAnimal($id, $tagid, $designatedname, $breedid, $penid, $damid, $birthdate, $initialweight, $registrationsource, $purchaseprice, $status, $autogen);
        echo json_encode($response);
    }

    if ($action == 'getanimals') {
        echo $animal->getAnimals();
    }

    if ($action == 'getanimaldetails') {
        $id = $_GET['id'];
        echo $animal->getAnimalDetails($id);
    }

    if ($action == 'getanimalsbypen') {
        $penid = $_GET['penid'];
        echo $animal->getAnimalsByPen($penid);
    }

    if ($action == 'deleteanimal') {
        $id = $_POST['id'];
        $reason = $_POST['reason'];
        echo json_encode($animal->deleteAnimal($id, $reason));
    }

    if ($action == 'checkanimal') {
        $id = $_GET['id'] ?? 0;
        $checkfield = $_GET['checkfield'];
        $checkvalue = $_GET['checkvalue'];
        $exists = $animal->checkAnimal($id, $checkfield, $checkvalue);
        echo json_encode(["exists" => $exists]);
    }
?>
