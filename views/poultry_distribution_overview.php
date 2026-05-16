<?php
/**
 * Jukam Poultry Management System - Distribution Overview
 * File: views/poultry_distribution_overview.php
 * Implementation: High-fidelity egg distribution management dashboard.
 */
$base_path = '../';
$nav_context = 'poultry';
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Poultry Distribution | Jukam Farm</title>

    <!-- Local Assets -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/navigation.css">
    <link rel="stylesheet" href="../css/production.css"> 
    <link rel="stylesheet" href="../css/animals.css">
    <link rel="stylesheet" href="../css/alert.css">
    <link rel="stylesheet" href="../css/poultrysettings.css">
    <link rel="icon" type="image/png" href="../image/icon-96x96.png">

    <!-- jQuery UI CSS -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

    <!-- DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.3.3/css/buttons.bootstrap4.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.4.0/css/responsive.bootstrap4.min.css" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300;400;500;600;700;800&family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

    <style>
        .dataTables_filter { display: none; }
        .dt-buttons { display: none !important; }
        .ui-datepicker { z-index: 2100 !important; }
        
        .stat-card-distribution {
            background: linear-gradient(135deg, #206223 0%, #164a19 100%);
            color: white;
        }
        
        .stat-card-hub {
            background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
            color: white;
        }

        .dist-header-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr) !important;
            gap: 0.75rem;
            margin-bottom: 0.75rem;
        }

        @media (max-width: 1200px) {
            .dist-header-grid { grid-template-columns: repeat(2, 1fr) !important; }
        }

        @media (max-width: 600px) {
            .dist-header-grid { grid-template-columns: 1fr !important; }
        }

        .dist-charts-grid {
            display: grid;
            grid-template-columns: 1.6fr 1fr;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        @media (max-width: 1200px) {
            .dist-charts-grid { grid-template-columns: 1fr; }
        }

        #disbursementTable thead th {
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 0.05rem;
            font-weight: 700;
            color: #64748b;
            border-top: none;
            padding: 1rem 0.75rem;
        }

        #disbursementTable tbody td {
            font-size: 0.85rem;
            vertical-align: middle;
            color: #334155;
        }

        .pagination-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1.25rem 1.5rem;
            border-top: 1px solid #f1f5f9;
        }

        .page-btn {
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            border: 1px solid #e2e8f0;
            background: white;
            color: #64748b;
            font-size: 0.85rem;
            font-weight: 600;
            margin: 0 4px;
            transition: all 0.2s;
        }

        .page-btn.active {
            background: #206223;
            color: white;
            border-color: #206223;
        }

        /* Custom Market Share Design */
        .market-share-list { padding: 0.5rem 0; }
        .market-share-item { margin-bottom: 1.5rem; }
        .market-share-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 4px; }
        .market-share-label { font-size: 0.7rem; font-weight: 500; color: #64748b; text-transform: uppercase; letter-spacing: 0.05rem; }
        .market-share-value { font-size: 0.85rem; font-weight: 600; color: #206223; }
        .market-share-bar-bg { height: 8px; background: #f1f5f9; border-radius: 10px; overflow: hidden; }
        .market-share-bar-fill { height: 100%; background: linear-gradient(to right, #206223, #3a7b3a); border-radius: 10px; width: 0%; transition: width 1s cubic-bezier(0.4, 0, 0.2, 1); }

        /* Responsive Expand Control Styling */
        table.dataTable.dtr-inline.collapsed > tbody > tr > td.dtr-control::before,
        table.dataTable.dtr-column > tbody > tr > td.dtr-control::before {
            background-color: #206223 !important;
            border: 2px solid white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            font-family: 'Material Symbols Outlined';
            content: 'add' !important;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 10px;
            width: 18px;
            height: 18px;
            border-radius: 4px;
        }

        table.dataTable.dtr-inline.collapsed > tbody > tr.parent > td.dtr-control::before,
        table.dataTable.dtr-column > tbody > tr.parent > td.dtr-control::before {
            content: 'remove' !important;
            background-color: #64748b !important;
        }

        .actions-dropdown {
            border: 1px solid rgba(0,0,0,0.05);
            box-shadow: 0 10px 40px rgba(0,0,0,0.1) !important;
            border-radius: 12px;
            padding: 0.5rem;
            min-width: 160px;
            z-index: 1000;
        }
    </style>
</head>

<body class="bg-background">

    <!-- Modular Sidebar -->
    <?php include 'navigation.php'; ?>

    <!-- Modular Header -->
    <?php include 'header.php'; ?>

    <!-- Main Content Area -->
    <main class="main-content">
        <div class="container-fluid pt-1 px-2">
            <!-- Header Section -->
            <div class="d-flex align-items-center justify-content-between mb-3 mt-2" style="padding-left: 4px; padding-right: 4px;">
                <div class="d-flex align-items-center">
                    <span class="material-symbols-outlined text-success" style="font-size: 1.1rem; margin-right: 6px;">directions_boat</span>
                    <h2 class="font-headline font-weight-bold text-on-surface mb-0" style="font-size: 0.825rem; white-space: nowrap;">
                        Distribution
                    </h2>
                </div>
                <div class="ml-auto">
                    <button class="btn btn-register d-inline-flex align-items-center justify-content-center" id="addDisbursementBtn" data-validationid="0x1205"
                        style="background-color: #206223; color: white; border-radius: 0.5rem; padding: 0.6rem 1.25rem; font-weight: 500; font-size: 0.85rem; min-width: 160px; height: 42px; border: none; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);">
                        <span class="material-symbols-outlined" style="font-size: 1.1rem; margin-right: 6px;">add</span>
                        <span class="d-none d-sm-inline">New Disbursement</span>
                        <span class="d-inline d-sm-none">Add</span>
                    </button>
                </div>
            </div>

            <!-- Stats Row -->
            <div class="dist-header-grid">
                <div class="prod-stat-card stat-card-distribution botanical-shadow">
                    <div class="d-flex justify-content-between align-items-start">
                        <span class="prod-stats-label font-headline">DISBURSED (TODAY)</span>
                        <span class="material-symbols-outlined text-white-50" style="font-size: 1.25rem;">egg</span>
                    </div>
                    <div class="d-flex align-items-end justify-content-between">
                        <div>
                            <h2 class="prod-stats-value font-headline" id="totalDisbursedToday">0</h2>
                            <div class="trend-pill text-white-50" style="background: rgba(255,255,255,0.1); border: none;">Eggs total</div>
                        </div>
                    </div>
                </div>

                <div class="prod-stat-card botanical-shadow">
                    <div class="d-flex justify-content-between align-items-start">
                        <span class="prod-stats-label font-headline" style="color: #64748b; font-weight: 500;">ACTIVE HUBS</span>
                        <span class="material-symbols-outlined text-success">hub</span>
                    </div>
                    <h2 class="prod-stats-value font-headline" style="color: #1e293b;" id="activeHubsCount">0</h2>
                </div>

                <div class="prod-stat-card botanical-shadow">
                    <div class="d-flex justify-content-between align-items-start">
                        <span class="prod-stats-label font-headline" style="color: #64748b; font-weight: 500;">PEAK HUB</span>
                        <span class="material-symbols-outlined text-warning" style="font-variation-settings: 'FILL' 1;">star</span>
                    </div>
                    <h2 class="prod-stats-value font-headline" style="color: #1e293b; font-size: 1rem;" id="peakHubName">No Data</h2>
                </div>

                <div class="prod-stat-card stat-card-hub botanical-shadow">
                    <div class="d-flex justify-content-between align-items-start">
                        <span class="prod-stats-label font-headline" style="opacity: 0.7;">MONTHLY VOLUME</span>
                        <span class="material-symbols-outlined text-white-50">analytics</span>
                    </div>
                    <h2 class="prod-stats-value font-headline" id="totalMonthlyVolume">0</h2>
                    <div class="smaller opacity-50" style="font-size: 0.65rem;">Eggs this month</div>
                </div>
            </div>

            <!-- Charts Row -->
            <div class="dist-charts-grid">
                <div class="chart-container-card botanical-shadow">
                    <h5 class="font-headline font-weight-bold mb-1 section-header">Egg Distribution Trends</h5>
                    <p class="text-muted section-desc">Quantity across all points (Last 7 Days)</p>
                    <div id="distributionTrendChart" style="min-height: 280px;"></div>
                </div>

                <div class="distribution-container-card botanical-shadow">
                    <h5 class="font-headline font-weight-bold mb-1 section-header">Hub Market Share</h5>
                    <p class="text-muted section-desc mb-4">Quantity distribution per point</p>
                    <div id="hubMarketShareList" class="market-share-list"></div>
                </div>
            </div>

            <!-- Table Row -->
            <div class="log-table-container botanical-shadow mb-4">
                <div class="px-4 pt-4 pb-2 d-flex justify-content-between align-items-center">
                    <h5 class="font-headline font-weight-bold mb-0 section-header">Disbursement Registry</h5>
                    <input type="text" class="form-control form-control-sm bg-light border-0" id="disburseSearch" placeholder="Search point..." style="border-radius: 2rem; width: 250px; padding-left: 15px;">
                </div>

                <div class="production-data-table-wrapper">
                    <table class="table table-hover dt-responsive nowrap" id="disbursementTable" width="100%">
                        <thead class="bg-light">
                            <tr>
                                <th style="width: 30px;"></th>
                                <th>Date & Time</th>
                                <th>Distribution Point</th>
                                <th>Quantity (Eggs)</th>
                                <th>Collector/Driver</th>
                                <th>Batch Ref</th>
                                <th class="text-right">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="disbursementBody"></tbody>
                    </table>
                </div>

                <div class="pagination-container" id="customPagination">
                    <span class="text-muted small font-weight-medium" id="pageInfo">Page 1 of 1</span>
                    <div id="numberButtons" class="d-flex"></div>
                </div>
            </div>
        </div>
    </main>

    <!-- Modal: New Egg Disbursement -->
    <div class="modal fade" id="addDisbursementModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content rounded-2xl overflow-hidden border-0 botanical-shadow">
                <div class="modal-header-premium">
                    <div class="d-flex align-items-center">
                        <div class="modal-icon-box">
                            <span class="material-symbols-outlined">egg</span>
                        </div>
                        <div>
                            <h4 class="h5 font-weight-bold mb-0">New Egg Disbursement</h4>
                            <p class="text-muted small mb-0">Record eggs leaving the farm.</p>
                        </div>
                    </div>
                    <button type="button" class="btn btn-link text-muted p-0" data-dismiss="modal">
                        <span class="material-symbols-outlined">close</span>
                    </button>
                </div>
                <div class="modal-body-premium">
                    <form id="disbursementForm" novalidate>
                        <input type="hidden" id="disburseId" value="0">
                        <div class="form-group mb-4">
                            <label class="form-label-premium">Distribution Point</label>
                            <select id="disbursePoint" class="form-control-premium w-100" required></select>
                        </div>
                        <div class="form-row mb-4">
                            <div class="form-group col-md-6 mb-0">
                                <label class="form-label-premium">Quantity (Eggs)</label>
                                <input type="number" id="disburseQuantity" class="form-control-premium w-100" placeholder="0" required>
                            </div>
                            <div class="form-group col-md-6 mb-0">
                                <label class="form-label-premium">Batch/Reference</label>
                                <input type="text" id="disburseRef" class="form-control-premium w-100" placeholder="Batch #">
                            </div>
                        </div>
                        <div class="form-group mb-0">
                            <label class="form-label-premium">Collector Name</label>
                            <input type="text" id="disburseCollector" class="form-control-premium w-100" placeholder="Name">
                        </div>
                    </form>
                </div>
                <div class="modal-footer-premium">
                    <button type="button" class="btn btn-cancel-premium" data-dismiss="modal">Cancel</button>
                    <button type="button" id="saveDisbursementBtn" class="btn btn-add-premium">Save Log</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="../plugins/jquery-3.6.1.js"></script>
    <script src="../plugins/popper.js"></script>
    <script src="../plugins/bootstrap.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
    <script src="../js/poultry_distribution_overview.js"></script>
</body>
</html>
