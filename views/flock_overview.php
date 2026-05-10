<?php
/**
 * Jukam Poultry Management System - Flock Management Overview
 * File: views/flock_overview.php
 * Implementation: High-fidelity dashboard for poultry flock tracking.
 */
$base_path = '../';
?>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Poultry Overview | JUKAM Farm</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/bootstrap.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/all.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/style.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/dashboard.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/header.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/navigation.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/alert.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>plugins/datatables/datatables.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    
    <script>
        var base_path = '<?php echo $base_path; ?>';
    </script>
    
    <style>
        /* Poultry Specific Refinements */
        :root {
            --primary: #206223;
            --primary-dark: #003010;
        }

        .stats-card-poultry {
            background: white;
            border-radius: 1.25rem;
            padding: 1.5rem;
            border: 1px solid rgba(0,0,0,0.03);
            box-shadow: 0 2px 12px rgba(0,0,0,0.02);
            transition: all 0.3s ease;
        }
        .stats-card-poultry:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 30px rgba(32, 98, 35, 0.08);
        }

        .alert-poultry {
            border-radius: 1rem;
            padding: 1.25rem;
            width: 100%;
        }
        .alert-red { background-color: #fff5f5; border-left: 4px solid #fecaca; }
        .alert-green { background-color: #f0fdf4; border-left: 4px solid #dcfce7; }

        /* Table Styling */
        .table-poultry thead th {
            background: #F9FAFB;
            border: none;
            color: #6B7280;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            padding: 1rem 1.5rem;
            font-weight: 600;
        }
        .table-poultry tbody td {
            padding: 1rem 1.5rem;
            vertical-align: middle;
            border-top: 1px solid #f3f4f6;
            font-size: 13px;
        }
        .status-badge {
            display: inline-flex;
            align-items: center;
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 11px;
            font-weight: 600;
        }
        .status-active { background: #dcfce7; color: #166534; }
        .status-quarantine { background: #f3f4f6; color: #4b5563; }
        .dot { width: 6px; height: 6px; border-radius: 50%; margin-right: 8px; }

        /* Search Input Styling (Pill Shape) */
        .search-input-wrapper {
            background: #f1f3f4;
            border-radius: 999px;
            padding: 0.6rem 1.25rem;
            display: flex;
            align-items: center;
            border: 1px solid transparent;
            transition: all 0.2s;
            max-width: 380px;
        }
        .search-input-wrapper:focus-within {
            background: white;
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(32, 98, 35, 0.05);
        }
        .search-input-wrapper input {
            background: transparent !important;
            border: none !important;
            font-size: 14px;
            width: 100%;
            margin-left: 0.5rem;
            color: #5f6368;
        }
        .search-input-wrapper input::placeholder { color: #80868b; }
        .search-input-wrapper input:focus { outline: none !important; box-shadow: none !important; }

        /* Action Dropdown Styling */
        .actions-dropdown {
            border: none;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            border-radius: 12px;
            padding: 0.5rem;
            min-width: 160px;
        }
        .action-item {
            display: flex;
            align-items: center;
            padding: 0.6rem 1rem;
            color: #4b5563;
            font-size: 13px;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.2s;
            cursor: pointer;
            text-decoration: none !important;
        }
        .action-item:hover {
            background: #f3f4f6;
            color: var(--primary);
        }
        .action-item span {
            font-size: 18px;
            margin-right: 12px;
        }
        .action-item.text-danger:hover {
            background: #fff1f2;
            color: #e11d48;
        }

        /* Resource Status Card */
        .resource-status-card {
            background: var(--primary-dark);
            color: white;
            border-radius: 1.25rem;
            padding: 1.5rem;
        }
        .progress-poultry {
            height: 8px;
            background: rgba(255,255,255,0.1);
            border-radius: 4px;
            margin-top: 8px;
        }
        .progress-poultry .progress-bar {
            background: white;
            border-radius: 4px;
        }

        /* Typography weight reduction for modern look */
        .font-h2 { font-size: 1.5rem; font-weight: 600; }
        .font-h3 { font-size: 1.125rem; font-weight: 600; }
        .text-body-sm { font-size: 0.8125rem; }
        .text-xs { font-size: 0.75rem; font-weight: 500; }

        /* Flatpickr Modal Fix */
        .flatpickr-calendar { z-index: 2100 !important; }
        /* Premium Pagination Styles */
        .pagination-btn {
            width: 38px;
            height: 38px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 10px;
            border: 1px solid rgba(0,0,0,0.08);
            background: white;
            color: #6B7280;
            font-size: 12px;
            font-weight: 500;
            transition: all 0.2s;
            margin: 0 4px;
            padding: 0;
            cursor: pointer;
        }
        .pagination-btn:hover:not(.disabled) {
            border-color: var(--primary);
            color: var(--primary);
            background: rgba(32, 98, 35, 0.02);
        }
        .pagination-btn.active {
            background: var(--primary) !important;
            border-color: var(--primary) !important;
            color: white !important;
            box-shadow: 0 4px 12px rgba(32, 98, 35, 0.2);
        }
        .pagination-btn.disabled {
            opacity: 0.4;
            cursor: not-allowed;
            background: #f9fafb;
        }

        /* Modal Background Blur */
        body.modal-open .main-content,
        body.modal-open .sidebar {
            filter: blur(5px) grayscale(20%);
            transition: filter 0.3s ease;
        }

        @media (max-width: 768px) {
            .summary-card-title { font-size: 9px !important; }
            .summary-card-desc { font-size: 9px !important; }
            .stats-card-poultry { padding: 0.75rem !important; }
            .stats-card-poultry .font-h2 { font-size: 20px !important; }
        }

        }
    </style>
</head>
<body class="bg-surface">

    <!-- Modular Sidebar -->
    <?php 
    $nav_context = 'poultry';
    include 'navigation.php'; 
    ?>

    <!-- Main Content Shell -->
    <main class="main-content">
        
        <!-- Modular Header -->
        <?php include 'header.php'; ?>

        <!-- Content Area -->
        <div class="container-fluid p-3 p-md-4">
            
            <!-- Alerts Section -->
            <div class="row mb-4">
                <div class="col-md-6 mb-3 mb-md-0">
                    <div class="alert-poultry alert-red d-flex align-items-start">
                        <div class="mr-3 p-2 rounded-lg" style="background: rgba(186, 26, 26, 0.1);">
                            <span class="material-symbols-outlined text-danger" style="font-size: 20px;">warning</span>
                        </div>
                        <div>
                            <p class="text-danger mb-1 font-weight-bold" style="font-size: 14px;">High Mortality in House C</p>
                            <p class="text-danger opacity-75 mb-0" style="font-size: 13px;">A spike of 2.5% mortality recorded in the last 24 hours. Immediate bio-security check required.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="alert-poultry alert-green d-flex align-items-start">
                        <div class="mr-3 p-2 rounded-lg" style="background: rgba(32, 98, 35, 0.1);">
                            <span class="material-symbols-outlined" style="font-size: 20px; color: #166534;">error</span>
                        </div>
                        <div>
                            <p class="mb-1 font-weight-bold" style="font-size: 14px; color: #166534;">Overcrowding Alert</p>
                            <p class="opacity-75 mb-0" style="font-size: 13px; color: #166534;">House B density is exceeding recommended levels. Consider transferring 150 birds to House D.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Summary Cards -->
            <div class="row mb-4 mx-n2">
                <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                    <div class="stats-card-poultry h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <p class="text-xs text-muted text-uppercase mb-0 summary-card-title">Total Flocks</p>
                            <span class="material-symbols-outlined text-muted opacity-50">layers</span>
                        </div>
                        <h2 class="font-h2 mb-2" id="stat_total_flocks">0</h2>
                        <div class="d-flex align-items-center text-success">
                            <span class="material-symbols-outlined text-xs mr-1">trending_up</span>
                            <span class="text-xs font-weight-bold summary-card-desc">Updated just now</span>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                    <div class="stats-card-poultry h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <p class="text-xs text-muted text-uppercase mb-0 summary-card-title">Total Birds</p>
                            <span class="material-symbols-outlined text-muted opacity-50">flight</span>
                        </div>
                        <h2 class="font-h2 mb-2" id="stat_total_birds">0</h2>
                        <div class="d-flex align-items-center text-success">
                            <span class="material-symbols-outlined text-xs mr-1">monitoring</span>
                            <span class="text-xs font-weight-bold summary-card-desc">Live population</span>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                    <div class="stats-card-poultry h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <p class="text-xs text-muted text-uppercase mb-0 summary-card-title">Active Batches</p>
                            <span class="material-symbols-outlined text-muted opacity-50">cycle</span>
                        </div>
                        <h2 class="font-h2 mb-2" id="stat_active_batches">0</h2>
                        <div class="d-flex align-items-center text-muted">
                            <span class="material-symbols-outlined text-xs mr-1">schedule</span>
                            <span class="text-xs font-weight-bold summary-card-desc"><span id="stat_maturing_soon">0</span> maturing &middot; <span id="stat_total_layers">0</span> layers</span>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                    <div class="stats-card-poultry h-100" style="border-bottom: 5px solid var(--primary) !important;">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <p class="text-xs text-muted text-uppercase mb-0 summary-card-title">Mortality Rate</p>
                            <span class="material-symbols-outlined text-danger opacity-50">heart_broken</span>
                        </div>
                        <h2 class="font-h2 mb-2" id="stat_mortality_rate">0%</h2>
                        <div class="d-flex align-items-center text-danger">
                            <span class="material-symbols-outlined text-xs mr-1">monitoring</span>
                            <span class="text-xs font-weight-bold summary-card-desc">System average</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Table Section -->
            <div class="bg-white rounded-xl shadow-sm overflow-hidden mb-4">
                <!-- Toolbar -->
                <div class="p-3 p-lg-4 border-bottom d-flex flex-wrap align-items-center justify-content-between">
                    <div class="col-12 col-md-5 px-0 mb-3 mb-md-0">
                        <div class="search-input-wrapper">
                            <span class="material-symbols-outlined" style="font-size: 20px; color: #9aa0a6;">search</span>
                            <input type="text" placeholder="Search by Flock ID or Breed...">
                        </div>
                    </div>
                    <div class="d-flex align-items-center">
                        <button class="btn btn-outline-light border text-dark d-flex align-items-center px-3 py-2 rounded-lg mr-2" style="font-size: 13px;">
                            <span class="material-symbols-outlined mr-2" style="font-size: 18px;">filter_alt</span>
                            Filters
                        </button>
                        <button class="btn btn-primary d-flex align-items-center px-4 py-2 rounded-lg add-flock-btn" style="background: var(--primary-dark); border: none; font-size: 13px;">
                            <span class="material-symbols-outlined mr-2" style="font-size: 18px;">add</span>
                            Add New Flock
                        </button>
                    </div>
                </div>

                <!-- Table -->
                <div class="table-responsive">
                    <table class="table table-poultry mb-0" id="flockTable">
                        <thead>
                            <tr>
                                <th>Flock ID</th>
                                <th>Type</th>
                                <th class="d-none d-md-table-cell">Breed</th>
                                <th class="d-none d-md-table-cell">Age</th>
                                <th class="text-right d-none d-md-table-cell">Birds</th>
                                <th class="d-none d-md-table-cell">House</th>
                                <th class="d-none d-md-table-cell">Status</th>
                                <th class="text-right">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Row 1 -->
                            <tr>
                                <td class="text-dark">FLK-001</td>
                                <td>Layers</td>
                                <td class="font-weight-bold text-dark d-none d-md-table-cell">ISA Brown</td>
                                <td class="d-none d-md-table-cell">45 days</td>
                                <td class="text-right d-none d-md-table-cell">500</td>
                                <td class="d-none d-md-table-cell">House A</td>
                                <td class="d-none d-md-table-cell">
                                    <span class="status-badge status-active">
                                        <span class="dot bg-success"></span>Active
                                    </span>
                                </td>
                                <td class="text-right">
                                    <div class="dropdown">
                                        <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                            <span class="material-symbols-outlined">more_vert</span>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                            <a class="action-item" href="#">
                                                <span class="material-symbols-outlined">visibility</span> View Details
                                            </a>
                                            <a class="action-item" href="#">
                                                <span class="material-symbols-outlined">edit</span> Edit Flock
                                            </a>
                                            <a class="action-item record-mortality-btn" href="#" data-id="FLK-001">
                                                <span class="material-symbols-outlined">heart_broken</span> Record Mortality
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a class="action-item text-danger" href="#">
                                                <span class="material-symbols-outlined">delete</span> Delete Record
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Row 2 -->
                            <tr>
                                <td class="text-dark">FLK-004</td>
                                <td>Broilers</td>
                                <td class="font-weight-bold text-dark d-none d-md-table-cell">Cobb 500</td>
                                <td class="d-none d-md-table-cell">32 days</td>
                                <td class="text-right d-none d-md-table-cell">1,200</td>
                                <td class="d-none d-md-table-cell">House C</td>
                                <td class="d-none d-md-table-cell">
                                    <span class="status-badge status-active">
                                        <span class="dot bg-success"></span>Active
                                    </span>
                                </td>
                                <td class="text-right">
                                    <div class="dropdown">
                                        <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                            <span class="material-symbols-outlined">more_vert</span>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                            <a class="action-item" href="#">
                                                <span class="material-symbols-outlined">visibility</span> View Details
                                            </a>
                                            <a class="action-item" href="#">
                                                <span class="material-symbols-outlined">edit</span> Edit Flock
                                            </a>
                                            <a class="action-item record-mortality-btn" href="#" data-id="FLK-004">
                                                <span class="material-symbols-outlined">heart_broken</span> Record Mortality
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a class="action-item text-danger" href="#">
                                                <span class="material-symbols-outlined">delete</span> Delete Record
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Row 3 -->
                            <tr>
                                <td class="text-dark">FLK-007</td>
                                <td>Layers</td>
                                <td class="font-weight-bold text-dark d-none d-md-table-cell">Hy-Line Silver</td>
                                <td class="d-none d-md-table-cell">12 days</td>
                                <td class="text-right d-none d-md-table-cell">800</td>
                                <td class="d-none d-md-table-cell">House B</td>
                                <td class="d-none d-md-table-cell">
                                    <span class="status-badge status-quarantine">
                                        <span class="dot bg-secondary"></span>Quarantine
                                    </span>
                                </td>
                                <td class="text-right">
                                    <div class="dropdown">
                                        <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                            <span class="material-symbols-outlined">more_vert</span>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                            <a class="action-item" href="#">
                                                <span class="material-symbols-outlined">visibility</span> View Details
                                            </a>
                                            <a class="action-item" href="#">
                                                <span class="material-symbols-outlined">edit</span> Edit Flock
                                            </a>
                                            <a class="action-item record-mortality-btn" href="#" data-id="FLK-007">
                                                <span class="material-symbols-outlined">heart_broken</span> Record Mortality
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a class="action-item text-danger" href="#">
                                                <span class="material-symbols-outlined">delete</span> Delete Record
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Row 4 -->
                            <tr>
                                <td class="text-dark">FLK-002</td>
                                <td>Kienyeji</td>
                                <td class="font-weight-bold text-dark d-none d-md-table-cell">KARI Improved</td>
                                <td class="d-none d-md-table-cell">88 days</td>
                                <td class="text-right d-none d-md-table-cell">350</td>
                                <td class="d-none d-md-table-cell">House D</td>
                                <td class="d-none d-md-table-cell">
                                    <span class="status-badge status-active">
                                        <span class="dot bg-success"></span>Active
                                    </span>
                                </td>
                                <td class="text-right">
                                    <div class="dropdown">
                                        <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                                            <span class="material-symbols-outlined">more_vert</span>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                            <a class="action-item" href="#">
                                                <span class="material-symbols-outlined">visibility</span> View Details
                                            </a>
                                            <a class="action-item" href="#">
                                                <span class="material-symbols-outlined">edit</span> Edit Flock
                                            </a>
                                            <a class="action-item record-mortality-btn" href="#" data-id="FLK-002">
                                                <span class="material-symbols-outlined">heart_broken</span> Record Mortality
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a class="action-item text-danger" href="#">
                                                <span class="material-symbols-outlined">delete</span> Delete Record
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination -->
                <div class="p-3 border-top d-flex align-items-center justify-content-between bg-light">
                    <p class="mb-0 text-muted" style="font-size: 12px;" id="tableInfo">Showing 1-4 of 12 flocks</p>
                    <div id="paginationControls" class="d-flex align-items-center">
                        <!-- Buttons -->
                    </div>
                </div>
            </div>

            <!-- Bottom Section -->
            <div class="row">
                <!-- Chart -->
                <div class="col-lg-8 mb-4">
                    <div class="bg-white rounded-xl p-4 shadow-sm h-100 overflow-hidden">
                        <h4 class="font-h3 mb-4" style="font-size: 15px;">Population Trend</h4>
                        <div id="populationChart" style="margin-left: -20px; margin-right: -10px; margin-bottom: -20px;"></div>
                    </div>
                </div>
                <!-- Resource Status -->
                <div class="col-lg-4 mb-4">
                    <div class="resource-status-card h-100 d-flex flex-column">
                        <h4 class="text-uppercase mb-2 opacity-50" style="font-size: 11px; letter-spacing: 0.1em;">Resource Status</h4>
                        <h3 class="font-h3 mb-4" style="font-size: 15px;">Bio-Security Level: Optimal</h3>
                        
                        <div class="mb-4">
                            <div class="d-flex justify-content-between text-xs font-weight-bold">
                                <span>FEED STOCK (LAYERS)</span>
                                <span>82%</span>
                            </div>
                            <div class="progress-poultry">
                                <div class="progress-bar" style="width: 82%"></div>
                            </div>
                        </div>

                        <div class="mb-5">
                            <div class="d-flex justify-content-between text-xs font-weight-bold">
                                <span>WATER CONSUMPTION</span>
                                <span>NORMAL</span>
                            </div>
                            <div class="progress-poultry">
                                <div class="progress-bar" style="width: 45%"></div>
                            </div>
                        </div>

                        <button class="btn btn-white btn-block rounded-lg py-2 font-weight-bold mt-auto" style="background: white; color: var(--primary-dark); font-size: 13px;">
                            Run Health Audit
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Core Dependencies -->
    <script src="<?php echo $base_path; ?>plugins/jquery-3.6.1.js"></script>
    <script src="<?php echo $base_path; ?>plugins/popper.js"></script>
    <script src="<?php echo $base_path; ?>plugins/bootstrap.js"></script>
    <script src="<?php echo $base_path; ?>plugins/datatables/datatables.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    
    <!-- Central Logic -->
    <script src="<?php echo $base_path; ?>js/navigation.js"></script>
    <script src="<?php echo $base_path; ?>js/header.js"></script>
    <script src="<?php echo $base_path; ?>js/auth.js"></script>
    <script src="<?php echo $base_path; ?>plugins/alert.js"></script>
    <script src="<?php echo $base_path; ?>js/functions.js"></script>

    <!-- Modals -->
    <?php include 'modals.php'; ?>
    <?php include 'add_flock_modal.php'; ?>
    <?php include 'record_mortality_modal.php'; ?>

    <script>
        $(document).ready(function() {
            // Initialize DataTables
            const flockTable = $('#flockTable').DataTable({
                dom: 'rt',
                pageLength: 4,
                columnDefs: [
                    { targets: [2, 3, 4, 5, 6], className: 'd-none d-md-table-cell' },
                    { targets: [4, 7], className: 'text-right' }
                ],
                drawCallback: function(settings) {
                    const info = this.api().page.info();
                    $('#tableInfo').html(`Showing <span class="font-weight-bold text-dark">${info.start + 1}-${info.end}</span> of <span class="font-weight-bold text-dark">${info.recordsTotal}</span> flocks`);
                    
                    let html = '';
                    // Previous Arrow
                    html += `<button class="pagination-btn prev-page ${info.page === 0 ? 'disabled' : ''}" ${info.page === 0 ? 'disabled' : ''}>
                                <span style="margin-top: -2px;">&lt;</span>
                             </button>`;
                    
                    // Page Numbers
                    for (let i = 0; i < info.pages; i++) {
                        html += `<button class="pagination-btn page-num-btn ${i === info.page ? 'active' : ''}" data-page="${i}">
                                    ${i+1}
                                 </button>`;
                    }
                    
                    // Next Arrow
                    html += `<button class="pagination-btn next-page ${info.page === info.pages - 1 ? 'disabled' : ''}" ${info.page === info.pages - 1 ? 'disabled' : ''}>
                                <span style="margin-top: -2px;">&gt;</span>
                             </button>`;
                    
                    $('#paginationControls').html(html);
                }
            });

            $(document).on('click', '.prev-page:not(.disabled)', function() { flockTable.page('previous').draw('page'); });
            $(document).on('click', '.next-page:not(.disabled)', function() { flockTable.page('next').draw('page'); });
            $(document).on('click', '.page-num-btn', function() { flockTable.page($(this).data('page')).draw('page'); });
            
            let populationChart;

        // Fetch Dashboard Stats
        function fetchStats() {
            $.ajax({
                url: base_path + 'controllers/poultryflockoperations.php?action=getstats',
                type: 'GET',
                success: function(response) {
                    try {
                        const res = JSON.parse(response);
                        if (res.status === 'success') {
                            const data = res.data;
                            $('#stat_total_flocks').text(data.total_flocks);
                            $('#stat_total_birds').text(data.total_birds.toLocaleString());
                            $('#stat_active_batches').text(data.active_batches);
                            $('#stat_maturing_soon').text(data.maturing_soon);
                            $('#stat_total_layers').text(data.total_layers);
                            $('#stat_mortality_rate').text(data.mortality_rate + '%');
                        }
                    } catch (e) {
                        console.error("Stats Error:", e);
                    }
                }
            });
        }

        // Fetch and render flocks
        function fetchFlocks() {
            fetchStats();
            fetchTrend();
            $.ajax({
                    url: base_path + 'controllers/poultryflockoperations.php?action=getflocks',
                    type: 'GET',
                    success: function(response) {
                        try {
                            const flocks = JSON.parse(response);
                            flockTable.clear();
                            
                            flocks.forEach(flock => {
                                const statusBadge = `<span class="badge badge-pill px-3 py-1 text-success" style="background: #e8f5e9; font-size: 10px;">Active</span>`;
                                const actions = `
                                    <div class="dropdown">
                                        <button class="btn btn-link p-0 text-muted" type="button" data-toggle="dropdown">
                                            <span class="material-symbols-outlined" style="font-size: 20px;">more_vert</span>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right shadow-sm border-0 rounded-xl" style="font-size: 13px;">
                                            <a class="dropdown-item py-2 record-mortality-btn" href="#" data-id="${flock.flockno}">
                                                <span class="material-symbols-outlined mr-2" style="font-size: 18px; vertical-align: middle;">remove_circle</span> Record Mortality
                                            </a>
                                            <a class="dropdown-item py-2" href="#">
                                                <span class="material-symbols-outlined mr-2" style="font-size: 18px; vertical-align: middle;">visibility</span> View History
                                            </a>
                                        </div>
                                    </div>
                                `;
                                
                                // Calculate Age in Months, Weeks, Days
                                const formatAge = (dateStr) => {
                                    const arrival = new Date(dateStr);
                                    const today = new Date();
                                    const diffTime = Math.abs(today - arrival);
                                    const totalDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
                                    
                                    const months = Math.floor(totalDays / 30);
                                    const weeks = Math.floor((totalDays % 30) / 7);
                                    const days = (totalDays % 30) % 7;
                                    
                                    let parts = [];
                                    if (months > 0) parts.push(`${months}M`);
                                    if (weeks > 0) parts.push(`${weeks}W`);
                                    if (days > 0 || parts.length === 0) parts.push(`${days}D`);
                                    
                                    return parts.join(' ');
                                };

                                const ageDisplay = `<div>${formatAge(flock.arrivaldate)}</div><div class="text-muted small">${flock.stagename}</div>`;
                                
                                flockTable.row.add([
                                    `<div class="font-weight-bold text-dark">${flock.flockno}</div><div class="text-muted small">${flock.flockname}</div>`,
                                    flock.birdtype,
                                    flock.breedname,
                                    ageDisplay,
                                    `<div class="font-weight-bold text-dark">${flock.currentcount}</div><div class="text-muted small">of ${flock.initialcount}</div>`,
                                    flock.housename,
                                    statusBadge,
                                    actions
                                ]);
                            });
                            
                            flockTable.draw();
                        } catch (e) {
                            console.error("Error parsing flocks:", e, response);
                        }
                    }
                });
            }


            // Make it global for the modal to call
            window.fetchFlocks = fetchFlocks;

            // Population Trend Area Chart
            if (typeof ApexCharts !== 'undefined') {
                var options = {
                    series: [{
                        name: 'Total Birds',
                        data: [0, 0, 0, 0, 0, 0]
                    }],
                    chart: {
                        type: 'area',
                        height: 280,
                        toolbar: { show: false },
                        fontFamily: 'Manrope, sans-serif',
                        sparkline: { enabled: false }
                    },
                    colors: ['#206223'],
                    stroke: {
                        curve: 'smooth',
                        width: 3
                    },
                    fill: {
                        type: 'gradient',
                        gradient: {
                            shadeIntensity: 1,
                            opacityFrom: 0.45,
                            opacityTo: 0.05,
                            stops: [0, 100]
                        }
                    },
                    dataLabels: { enabled: false },
                    xaxis: {
                        type: 'datetime',
                        axisBorder: { show: false },
                        axisTicks: { show: false },
                        labels: { 
                            style: { colors: '#9CA3AF', fontSize: '10px' },
                            format: 'dd MMM'
                        }
                    },
                    yaxis: { 
                        min: 0,
                        forceNiceScale: true,
                        labels: { 
                            style: { colors: '#9CA3AF', fontSize: '10px' },
                            formatter: function(val) { return val.toLocaleString(); }
                        } 
                    },
                    grid: { 
                        borderColor: '#f1f1f1',
                        strokeDashArray: 4,
                        xaxis: { lines: { show: true } },
                        padding: {
                            left: 0,
                            right: 0,
                            bottom: 0
                        }
                    }
                };

                const populationChartEl = document.querySelector("#populationChart");
                if (populationChartEl) {
                    populationChart = new ApexCharts(populationChartEl, options);
                    populationChart.render();
                }
            }

            // Fetch Trend Data
            function fetchTrend() {
                $.ajax({
                    url: base_path + 'controllers/poultryflockoperations.php?action=getpopulationtrend',
                    type: 'GET',
                    success: function(response) {
                        try {
                            const res = JSON.parse(response);
                            if (res.status === 'success' && populationChart) {
                                // Find max value for dynamic scaling
                                const maxVal = Math.max(...res.values);
                                const chartMax = maxVal === 0 ? 100 : Math.ceil((maxVal * 1.2) / 50) * 50;

                                // Map data to {x, y} for datetime axis
                                const seriesData = res.labels.map((label, index) => {
                                    return { x: new Date(label).getTime(), y: res.values[index] };
                                });

                                populationChart.updateOptions({
                                    yaxis: {
                                        min: 0,
                                        max: chartMax,
                                        tickAmount: 6, // Provides 6 intervals (7 labels)
                                        labels: { 
                                            style: { colors: '#9CA3AF', fontSize: '10px' },
                                            formatter: function(val) { return Math.round(val).toLocaleString(); }
                                        }
                                    }
                                });

                                populationChart.updateSeries([{
                                    name: 'Total Birds',
                                    data: seriesData
                                }]);
                            }
                        } catch (e) {
                            console.error("Trend Error:", e);
                        }
                    }
                });
            }

            // Modal Trigger
            $(document).on('click', '.add-flock-btn', function(e) {
                e.preventDefault();
                $('#addFlockModal').modal('show');
            });

            // Mortality Modal Handler
            $(document).on('click', '.record-mortality-btn', function(e) {
                e.preventDefault();
                const flockId = $(this).data('id');
                $('#mortality_flock_id').val(flockId);
                $('#display_flock_id').text(flockId);
                $('#recordMortalityModal').modal('show');
            });

            // Initialize Flatpickr
            if (typeof flatpickr !== 'undefined') {
                flatpickr("#arrivalDatePicker", {
                    dateFormat: "d-M-Y",
                    maxDate: "today",
                    disableMobile: "true"
                });

                flatpickr("#mortalityDatePicker", {
                    dateFormat: "d-M-Y",
                    defaultDate: "today",
                    maxDate: "today",
                    disableMobile: "true"
                });
            }

            // Initial load
            fetchFlocks();
        });
    </script>
</body>
</html>
