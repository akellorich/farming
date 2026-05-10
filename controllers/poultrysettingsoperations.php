<?php
/**
 * Jukam Poultry Management System - Poultry Settings Operations Controller
 * File: controllers/poultrysettingsoperations.php
 */

require_once '../models/poultrysettings.php';

$action = $_GET['action'] ?? '';
$poultrySettings = new PoultrySettings();

switch ($action) {
    case 'savebreed':
        echo json_encode($poultrySettings->saveBreed($_POST));
        break;

    case 'savebirdtype':
        echo json_encode($poultrySettings->saveBirdType($_POST));
        break;

    case 'saveflockstage':
        echo json_encode($poultrySettings->saveFlockStage($_POST));
        break;

    case 'savehouse':
        echo json_encode($poultrySettings->saveHouse($_POST));
        break;

    case 'saveinventorycategory':
        echo json_encode($poultrySettings->saveInventoryCategory($_POST));
        break;

    case 'saveinventoryitem':
        echo json_encode($poultrySettings->saveInventoryItem($_POST));
        break;

    case 'savedisease':
        echo json_encode($poultrySettings->saveDisease($_POST));
        break;

    case 'savemortalityreason':
        echo json_encode($poultrySettings->saveMortalityReason($_POST));
        break;

    case 'saveformulation':
        if ($poultrySettings->saveFormulation($_POST)) {
            echo json_encode(['status' => 'success', 'message' => 'Formulation saved successfully']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to save formulation']);
        }
        break;
    
    // --- Retrieval Actions ---
    case 'getbreeds':
        echo $poultrySettings->getBreeds();
        break;

    case 'getbirdtypes':
        echo $poultrySettings->getBirdTypes();
        break;

    case 'getbirdtypevaccinations':
        $id = $_GET['id'] ?? 0;
        echo $poultrySettings->getBirdTypeVaccinations($id);
        break;

    case 'getflockstages':
        echo $poultrySettings->getFlockStages();
        break;

    case 'gethouses':
        echo $poultrySettings->getHouses();
        break;

    case 'getinventorycategories':
        echo $poultrySettings->getInventoryCategories();
        break;

    case 'getinventoryitems':
        echo $poultrySettings->getInventoryItems();
        break;

    case 'getfeeditems':
        echo $poultrySettings->getFeedItems();
        break;

    case 'getdiseases':
        echo $poultrySettings->getDiseases();
        break;

    case 'getdiseasetypes':
        echo $poultrySettings->getDiseaseTypes();
        break;

    case 'getmortalityreasons':
        echo $poultrySettings->getMortalityReasons();
        break;

    case 'getformulations':
        echo $poultrySettings->getFormulations();
        break;

    case 'getformulationingredients':
        $id = $_GET['id'] ?? 0;
        echo $poultrySettings->getFormulationIngredients($id);
        break;

    // --- Delete Actions ---
    case 'deletebreed':
        $id = $_POST['id'] ?? 0;
        $reason = $_POST['reason'] ?? 'Admin deletion';
        if ($poultrySettings->deleteBreed($id, $reason)) {
            echo json_encode(['status' => 'success', 'message' => 'Breed deleted successfully']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to delete breed']);
        }
        break;

    case 'deletebirdtype':
        $id = $_POST['id'] ?? 0;
        $reason = $_POST['reason'] ?? 'Admin deletion';
        if ($poultrySettings->deleteBirdType($id, $reason)) {
            echo json_encode(['status' => 'success', 'message' => 'Bird type deleted successfully']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to delete bird type']);
        }
        break;

    case 'deleteflockstage':
        $id = $_POST['id'] ?? 0;
        $reason = $_POST['reason'] ?? 'Admin deletion';
        if ($poultrySettings->deleteFlockStage($id, $reason)) {
            echo json_encode(['status' => 'success', 'message' => 'Flock stage deleted successfully']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to delete flock stage']);
        }
        break;

    case 'deletehouse':
        $id = $_POST['id'] ?? 0;
        $reason = $_POST['reason'] ?? 'Admin deletion';
        if ($poultrySettings->deleteHouse($id, $reason)) {
            echo json_encode(['status' => 'success', 'message' => 'House deleted successfully']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to delete house']);
        }
        break;

    case 'deleteinventorycategory':
        $id = $_POST['id'] ?? 0;
        $reason = $_POST['reason'] ?? 'Admin deletion';
        if ($poultrySettings->deleteInventoryCategory($id, $reason)) {
            echo json_encode(['status' => 'success', 'message' => 'Category deleted successfully']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to delete category']);
        }
        break;

    case 'deleteinventoryitem':
        $id = $_POST['id'] ?? 0;
        $reason = $_POST['reason'] ?? 'Admin deletion';
        if ($poultrySettings->deleteInventoryItem($id, $reason)) {
            echo json_encode(['status' => 'success', 'message' => 'Inventory item deleted successfully']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to delete item']);
        }
        break;

    case 'deletedisease':
        $id = $_POST['id'] ?? 0;
        $reason = $_POST['reason'] ?? 'Admin deletion';
        if ($poultrySettings->deleteDisease($id, $reason)) {
            echo json_encode(['status' => 'success', 'message' => 'Disease deleted successfully']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to delete disease']);
        }
        break;

    case 'deletemortalityreason':
        $id = $_POST['id'] ?? 0;
        $reason = $_POST['reason'] ?? 'Admin deletion';
        if ($poultrySettings->deleteMortalityReason($id, $reason)) {
            echo json_encode(['status' => 'success', 'message' => 'Mortality reason deleted successfully']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to delete mortality reason']);
        }
        break;

    case 'deleteformulation':
        $id = $_POST['id'] ?? 0;
        $reason = $_POST['reason'] ?? 'Admin deletion';
        if ($poultrySettings->deleteFormulation($id, $reason)) {
            echo json_encode(['status' => 'success', 'message' => 'Formulation deleted successfully']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to delete formulation']);
        }
        break;

    default:
        echo json_encode(['status' => 'error', 'message' => 'Invalid action']);
        break;
}


