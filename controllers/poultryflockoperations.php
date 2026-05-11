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

    case 'savefeeding':
        echo json_encode($flockModel->saveFeeding($_POST));
        break;
    
    case 'getstats':
        echo json_encode($flockModel->getDashboardStats());
        break;
    
    case 'getpopulationtrend':
        echo json_encode($flockModel->getPopulationTrend());
        break;

    case 'getfeedingstats':
        echo json_encode($flockModel->getFeedingDashboardStats());
        break;

    case 'getfeedinghistory':
        $limit = $_GET['limit'] ?? 10;
        echo $flockModel->getFeedingHistory($limit);
        break;

    case 'getinventorystatus':
        echo $flockModel->getInventoryStatus();
        break;

    case 'getfeedingcharts':
        echo json_encode($flockModel->getFeedingChartsData());
        break;

    case 'getcollectionshifts':
        echo $flockModel->getCollectionShifts();
        break;

    case 'getlayerflocks':
        echo $flockModel->getLayerFlocks();
        break;

    case 'saveeggcollection':
        echo json_encode($flockModel->saveEggCollection($_POST));
        break;

    case 'geteggstats':
        echo json_encode($flockModel->getEggCollectionStats());
        break;

    case 'getcollectionlog':
        echo $flockModel->getDailyEggCollectionLog();
        break;

    case 'getweeklyprodchart':
        echo json_encode($flockModel->getWeeklyProductionChartData());
        break;

    default:
        echo json_encode(['status' => 'error', 'message' => 'Invalid flock action']);
        break;
}
