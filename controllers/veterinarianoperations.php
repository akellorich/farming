<?php
/**
 * Jukam Dairy - Veterinarian Operations Controller
 * File: controllers/veterinarianoperations.php
 */
require_once("../models/veterinarian.php");
$vet = new veterinarian();

if (isset($_POST['saveveterinarian'])) {
    $id = $_POST['id'] ?? 0;
    $regno = $_POST['regno'];
    $vetname = $_POST['vetname'];
    $phone = $_POST['phone'];
    $email = $_POST['email'] ?? '';
    $specialization = $_POST['specialization'] ?? '';
    $status = $_POST['status'] ?? 'Active';
    $autogenerate = $_POST['autogenerate'] ?? 0;

    echo json_encode($vet->saveVeterinarian($id, $regno, $vetname, $phone, $email, $specialization, $status, $autogenerate));
}

if (isset($_POST['deleteveterinarian'])) {
    $id = $_POST['id'];
    $reason = $_POST['reason'] ?? 'None provided';
    echo json_encode($vet->deleteVeterinarian($id, $reason));
}

if (isset($_GET['getveterinarians'])) {
    echo $vet->getVeterinarians();
}
?>
