<?php
/**
 * Jukam Poultry Management System - Poultry Flock Operations Controller
 * File: controllers/poultryflockoperations.php
 */

require_once '../models/poultryflock.php';

$action = $_GET['action'] ?? '';
$flockModel = new PoultryFlock();

switch ($action) {
    case 'saveflock':
        echo json_encode($flockModel->saveFlock($_POST));
        break;

    case 'getflocks':
        echo $flockModel->getFlocks();
        break;

    case 'savemortality':
        echo json_encode($flockModel->saveMortality($_POST));
        break;
    
    case 'getstats':
        echo json_encode($flockModel->getDashboardStats());
        break;
    
    case 'getpopulationtrend':
        echo json_encode($flockModel->getPopulationTrend());
        break;

    default:
        echo json_encode(['status' => 'error', 'message' => 'Invalid flock action']);
        break;
}
