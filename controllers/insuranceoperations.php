<?php
require_once("../models/insurancecompany.php");
$insurance = new insurancecompany();

$action = $_GET['action'] ?? $_POST['action'] ?? '';

if ($action == 'saveinsurancecompany') {
    $id = $_POST['id'] ?? 0;
    $registrationno = $_POST['registrationno'] ?? '';
    $companyname = $_POST['companyname'] ?? '';
    $contacts = $_POST['contacts'] ?? '';
    $contactperson = $_POST['contactperson'] ?? '';
    $email = $_POST['email'] ?? '';
    $address = $_POST['address'] ?? '';

    $response = $insurance->saveInsuranceCompany($id, $registrationno, $companyname, $contacts, $contactperson, $email, $address);
    echo json_encode($response);
}

if ($action == 'getinsurancecompanies') {
    echo $insurance->getInsuranceCompanies();
}

if ($action == 'deleteinsurancecompany') {
    $id = $_POST['id'];
    echo json_encode($insurance->deleteInsuranceCompany($id));
}
?>
