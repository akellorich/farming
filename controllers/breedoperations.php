<?php
    require_once("../models/breed.php");
    $breed = new breed();
    
    if(isset($_GET['getbreeddetails'])){
        $id = $_GET['id'];
        echo $breed->getBreedDetails($id);
    }

    if(isset($_POST['deletebreed'])){
        $id = $_POST['id'];
        $reason = $_POST['reason'];
        echo json_encode($breed->deleteBreed($id, $reason));
    }

    if(isset($_POST['savebreed'])){
        $id = $_POST['id'];
        $breedname = $_POST['breedname'];
        $originid = $_POST['originid'];
        $characteristics = $_POST['characteristics'];
        $isindigenous = $_POST['isindigenous'];
        $avgmilking = $_POST['avgmilking'];
        $icon = $_POST['icon'];
        $response = $breed->saveBreed($id, $breedname, $originid, $characteristics, $isindigenous, $avgmilking, $icon);
        echo json_encode($response);
    }

    if(isset($_GET['getbreeds'])){
        echo $breed->getBreeds();
    }
?>
