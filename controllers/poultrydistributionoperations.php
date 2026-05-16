<?php
/**
 * Jukam Poultry Management System - Poultry Distribution Operations
 * File: controllers/poultrydistributionoperations.php
 */

require_once '../models/user.php';
$user = new User();

$action = $_REQUEST['action'] ?? '';
$userid = $_SESSION['userid'] ?? 0;

if ($action) {
    switch ($action) {
        // GET Actions (Data Retrieval)
        case 'getpoints':
            echo json_encode($user->getPoultryDistributionPoints());
            break;
        case 'getpoint':
            $id = $_GET['id'] ?? 0;
            echo json_encode($user->getPoultryDistributionPoint($id));
            break;
        case 'getdisbursements':
            echo json_encode($user->getEggDisbursements());
            break;
        case 'getstats':
            echo json_encode($user->getPoultryDistributionStats());
            break;
        case 'gettrends':
            echo json_encode($user->getPoultryDistributionTrends());
            break;
        case 'getmarketshare':
            echo json_encode($user->getPoultryHubMarketShare());
            break;

        // POST Actions (Data Persistence)
        case 'savepoint':
            $id = $_POST['id'] ?? 0;
            $name = $_POST['pointname'] ?? '';
            $location = $_POST['location'] ?? '';
            $contactperson = $_POST['contactperson'] ?? '';
            $contactphone = $_POST['contactphone'] ?? '';
            echo json_encode($user->savePoultryDistributionPoint($id, $name, $location, $contactperson, $contactphone, $userid));
            break;
        case 'savedisbursement':
            $id = $_POST['id'] ?? 0;
            $pointid = $_POST['pointid'] ?? 0;
            $quantity = $_POST['quantity'] ?? 0;
            $collector = $_POST['collector'] ?? '';
            $batch = $_POST['batch'] ?? '';
            $narration = $_POST['narration'] ?? '';
            echo json_encode($user->saveEggDisbursement($id, $pointid, $quantity, $collector, $batch, $narration, $userid));
            break;
        case 'deletepoint':
            $id = $_POST['id'] ?? 0;
            echo json_encode($user->deletePoultryDistributionPoint($id, $userid));
            break;
        case 'deletedisbursement':
            $id = $_POST['id'] ?? 0;
            echo json_encode($user->deleteEggDisbursement($id, $userid));
            break;
    }
}
