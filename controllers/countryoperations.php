<?php
    require_once("../models/country.php");
    $country = new country();
    
    if(isset($_GET['getcountrydetails'])){
        $id = $_GET['id'];
        echo $country->getCountryDetails($id);
    }

    if(isset($_POST['deletecountry'])){
        $id = $_POST['id'];
        $reason = $_POST['reason'];
        echo $country->deleteCountry($id, $reason);
    }

    if(isset($_POST['savecountry'])){
        $id = $_POST['id'];
        $countryname = $_POST['countryname'];
        $response = $country->saveCountry($id, $countryname);
        echo json_encode($response);
    }

    if(isset($_GET['getcountries'])){
        echo $country->getCountries();
    }
?>
