<?php
/**
 * Jukam Poultry Management System - Egg Collection
 * File: views/egg_collection.php
 */
$base_path = '../';
$nav_context = 'poultry'; // Set context for sidebar
?>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Egg Collection | JUKAM Farm</title>
    
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
    
    <!-- ApexCharts -->
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

        body { font-family: 'Manrope', sans-serif; background-color: #F9FBF9; color: #1f2937; }
        
        .main-content { 
            margin-left: 256px; 
            padding-top: 64px; 
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1); 
            min-height: 100vh; 
        }
        
        body.sidebar-collapsed .main-content { margin-left: 80px; }
        
        @media (max-width: 991.98px) {
            .main-content { margin-left: 0 !important; }
        }

        /* Standardized Header Components from Design System */
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

        /* Dashboard Specific Refinements */
        .soft-botanical-shadow { box-shadow: 0px 10px 30px rgba(27, 94, 32, 0.05); }
        
        .bg-success-light { background-color: rgba(32, 98, 35, 0.08) !important; }
        .bg-warning-light { background-color: rgba(245, 158, 11, 0.08) !important; }
        .bg-danger-light { background-color: rgba(186, 26, 26, 0.08) !important; }
        .bg-info-light { background-color: rgba(14, 165, 233, 0.08) !important; }
        
        .bg-danger-xlight { background-color: rgba(186, 26, 26, 0.03) !important; }
        .bg-warning-xlight { background-color: rgba(245, 158, 11, 0.03) !important; }
        
        .border-left-danger { border-left: 4px solid #ba1a1a !important; }
        .border-left-secondary { border-left: 4px solid #4a654e !important; }
        
        .rounded-xl { border-radius: 1rem !important; }
        .rounded-2xl { border-radius: 1.25rem !important; }
        
        .x-small { font-size: 11px !important; }
        .xx-small { font-size: 9px !important; }
        
        .group:hover .group-hover-visible { opacity: 1 !important; transform: translateX(-50%) translateY(-5px); }
        .group-hover-visible { 
            transition: all 0.2s ease; 
            pointer-events: none;
            z-index: 100;
        }

        .table-poultry thead th {
            background: #F9FAFB !important;
            color: #6B7280;
            font-size: 9px !important;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            font-weight: 700;
            border: none !important;
        }

        .table-poultry tbody td {
            font-size: 13px !important;
            vertical-align: middle;
        }

        .table-poultry thead th,
        .table-poultry tbody td {
            padding-left: 12px !important;
            padding-right: 12px !important;
        }

        .table-poultry thead th:last-child,
        .table-poultry tbody td:last-child {
            padding-right: 16px !important;
            width: 60px;
            text-align: right;
        }

        .status-col {
            width: 100px;
        }

        .action-btn {
            width: 32px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            color: #6B7280;
            transition: all 0.2s;
            background: #F9FAFB;
            border: 1px solid #F3F4F6;
        }
        
        .action-btn:hover {
            background: #F3F4F6;
            color: #206223;
        }

        .btn-add-table {
            background: rgba(32, 98, 35, 0.05);
            color: #206223;
            padding: 10px 24px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1.5px solid rgba(32, 98, 35, 0.15);
            box-shadow: none;
            transition: all 0.2s;
            gap: 8px;
        }

        .btn-add-table:hover {
            transform: translateY(-1px);
            background: rgba(32, 98, 35, 0.1);
            border-color: rgba(32, 98, 35, 0.3);
            color: #206223;
            text-decoration: none;
        }

        .btn-botanical-light {
            background: rgba(32, 98, 35, 0.05);
            color: #206223 !important;
            border: 1.5px solid rgba(32, 98, 35, 0.15) !important;
            transition: all 0.2s;
        }

        .btn-botanical-light:hover {
            background: rgba(32, 98, 35, 0.1) !important;
            border-color: rgba(32, 98, 35, 0.3) !important;
            color: #164319 !important;
        }

        .dropdown-item {
            font-size: 12px !important;
            color: #4B5563 !important;
            font-weight: 500;
            padding: 10px 16px !important;
            display: flex;
            align-items: center;
        }

        .dropdown-item .material-symbols-outlined {
            margin-right: 12px;
            font-size: 18px;
        }

        .dropdown-item:hover {
            background-color: #F3F4F6 !important;
            color: #206223 !important;
        }
        /* Modal Custom Styles */
        .modal-poultry .modal-content {
            border-radius: 24px;
            border: none;
            overflow: hidden;
            box-shadow: 0 20px 50px rgba(0,0,0,0.15);
        }

        .modal-branded-sidebar {
            background: linear-gradient(rgba(32, 98, 35, 0.7), rgba(32, 98, 35, 0.7)), url('https://lh3.googleusercontent.com/aida-public/AB6AXuDGY3OCCeOQuMVusjRuSccpi8Xs2jA8uZPETsgGHDJSFyxCE8pB4Cn0OHmRtHuH1V9BOWyLiO-fIGWv2tx6-vrxhmhDEGSyymrjDrlIwSJGtgOEWHH8Z0IOwTggol2g5OmG3LLpL59T5wpHoArNNqEykL3kavrvzL0NU_gghf16hupuuFyNWcdyKppSgjROai6T5vZsNjVM6quWRuvBFutbyUDEIJ60Ghh3hxta8H6PdWjU-Z3wypR6iCi1x4qX6tFkZCymf6WIHETg');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            min-height: 100%;
        }

        .modal-blur-target {
            transition: filter 0.3s ease;
        }

        .modal-open .modal-blur-target {
            filter: blur(8px) saturate(120%);
        }

        .custom-form-input {
            background-color: #FCFAF7;
            border: 1.5px solid #E5E7EB;
            border-radius: 12px;
            padding: 12px 16px;
            font-size: 15px;
            transition: all 0.2s;
            width: 100%;
        }

        .custom-form-input:focus {
            border-color: #206223;
            box-shadow: 0 0 0 4px rgba(32, 98, 35, 0.1);
            outline: none;
            background-color: white;
        }

        .shift-radio-group {
            display: flex;
            gap: 16px;
        }

        .shift-radio-group .shift-option {
            cursor: pointer;
            flex: 1;
        }

        .shift-radio-group input[type="radio"] {
            display: none;
        }

        .shift-card {
            border: 1.5px solid #E5E7EB;
            border-radius: 12px;
            padding: 15px;
            text-align: center;
            transition: all 0.2s;
            background: white;
        }

        .shift-radio-group input[type="radio"]:checked + .shift-card {
            border-color: #206223;
            background: rgba(32, 98, 35, 0.05);
            color: #206223;
        }

        .btn-save-record {
            background: #206223;
            color: white;
            padding: 12px 24px;
            border-radius: 12px;
            font-weight: 500;
            border: none;
            transition: all 0.2s;
            font-size: 14px;
            width: auto;
            min-width: 160px;
        }

        .btn-save-record:hover {
            background: #164319;
            transform: translateY(-2px);
            color: white;
        }

        .btn-cancel-modal {
            background: transparent;
            color: #6B7280;
            padding: 12px 24px;
            border-radius: 12px;
            font-weight: 500;
            border: 1.5px solid #E5E7EB;
            transition: all 0.2s;
            font-size: 14px;
            width: auto;
            min-width: 120px;
        }

        .btn-cancel-modal:hover {
            background: #F9FAFB;
            border-color: #D1D5DB;
            color: #374151;
            text-decoration: none;
        }
        @media (max-width: 768px) {
            .main-content { margin-left: 0; padding-top: 60px; }
            body.sidebar-collapsed .main-content { margin-left: 0; }
            
            .stats-card-poultry h3 { font-size: 20px !important; }
            .stats-card-poultry p { font-size: 11px !important; }
            h4 { font-size: 16px !important; }
            .text-muted { font-size: 12px !important; }
            
            .chart-header {
                flex-direction: column;
                align-items: flex-start !important;
                gap: 15px !important;
            }
            
            .chart-legend-container {
                width: 100%;
                justify-content: flex-start !important;
                gap: 20px !important;
            }

            .menu-toggle {
                width: 40px !important;
                height: 40px !important;
                border-radius: 50% !important;
                display: flex !important;
                align-items: center !important;
                justify-content: center !important;
                flex-shrink: 0 !important;
                padding: 0 !important;
            }

            .modal-poultry .close span {
                font-size: 28px !important;
            }

            .modal-poultry label {
                font-size: 10px !important;
            }

            .custom-form-input {
                font-size: 13px !important;
                padding: 10px 12px !important;
            }

            .shift-card {
                padding: 10px !important;
            }

            .shift-card .text-uppercase {
                font-size: 8px !important;
            }

            .shift-card .font-weight-bold {
                font-size: 13px !important;
            }

            .btn-save-record, .btn-cancel-modal {
                padding: 10px 16px !important;
                font-size: 13px !important;
                min-width: 100px !important;
            }

            .btn-save-record span {
                font-size: 16px !important;
            }
        }
    </style>
</head>
<div id="page-wrapper" class="modal-blur-target">
    <!-- Modular Navigation (Sidebar) -->
    <?php include 'navigation.php'; ?>

    <main class="main-content">
        
        <!-- Modular Header (Top Bar) -->
        <?php include 'header.php'; ?>

        <div class="container-fluid p-3 p-md-4">
            
            <!-- Summary Bento Grid -->
            <div class="row mb-4 mx-n2">
                <!-- Total Collected -->
                <div class="col-6 col-md-3 mb-2 px-2">
                    <div class="stats-card-poultry rounded-2xl h-100 p-4 shadow-sm border-0 bg-white">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div class="rounded-xl d-flex align-items-center justify-content-center bg-success-light" style="width: 48px; height: 48px;">
                                <span class="material-symbols-outlined text-success" style="font-size: 24px;">inventory_2</span>
                            </div>
                            <span class="badge badge-pill bg-success-light text-success px-2 py-1" style="font-size: 10px; font-weight: 700;">Live</span>
                        </div>
                        <p class="text-muted mb-1 font-weight-medium" style="font-size: 13px;">Total Eggs Collected</p>
                        <h3 id="total_collected_count" class="font-weight-bold text-dark mb-1" style="font-size: 32px; letter-spacing: -0.03em;">0</h3>
                        <p class="text-muted mb-0" style="font-size: 10px; opacity: 0.7;">Today's collection status</p>
                    </div>
                </div>
                <!-- Production Rate -->
                <div class="col-6 col-md-3 mb-2 px-2">
                    <div class="stats-card-poultry rounded-2xl h-100 p-4 shadow-sm border-0 bg-white">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div class="rounded-xl d-flex align-items-center justify-content-center bg-success-light" style="width: 48px; height: 48px;">
                                <span class="material-symbols-outlined text-success" style="font-size: 24px;">trending_up</span>
                            </div>
                        </div>
                        <p class="text-muted mb-1 font-weight-medium" style="font-size: 13px;">Production Rate</p>
                        <h3 id="production_rate_display" class="font-weight-bold text-dark mb-1" style="font-size: 32px; letter-spacing: -0.03em;">0<span class="small font-weight-normal" style="font-size: 20px;">%</span></h3>
                        <p class="text-success font-weight-bold mb-0" style="font-size: 10px;">Daily efficiency index</p>
                    </div>
                </div>
                <!-- Good Eggs -->
                <div class="col-6 col-md-3 mb-2 px-2">
                    <div class="stats-card-poultry rounded-2xl h-100 p-4 shadow-sm border-0 bg-white position-relative overflow-hidden">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div class="rounded-xl d-flex align-items-center justify-content-center bg-success-light" style="width: 48px; height: 48px;">
                                <span class="material-symbols-outlined text-success" style="font-size: 24px;">check_circle</span>
                            </div>
                        </div>
                        <p class="text-muted mb-1 font-weight-medium" style="font-size: 13px;">Good Eggs</p>
                        <h3 id="good_eggs_display" class="font-weight-bold text-dark mb-2" style="font-size: 32px; letter-spacing: -0.03em;">0</h3>
                        <div class="w-100 bg-light rounded-pill mb-3" style="height: 8px; overflow: hidden;">
                            <div id="good_eggs_progress" class="h-100" style="width: 0%; background: #00450d !important; transition: width 0.5s ease;"></div>
                        </div>
                        <p class="text-muted mb-0" style="font-size: 10px; opacity: 0.7;">High quality yield</p>
                    </div>
                </div>
                <!-- Broken Eggs -->
                <div class="col-6 col-md-3 mb-2 px-2">
                    <div class="stats-card-poultry rounded-2xl h-100 p-4 shadow-sm border-0 bg-white">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div class="rounded-xl d-flex align-items-center justify-content-center bg-danger-light" style="width: 48px; height: 48px;">
                                <span class="material-symbols-outlined text-danger" style="font-size: 24px;">broken_image</span>
                            </div>
                            <span id="broken_alert_badge" class="badge badge-pill bg-danger-light text-danger px-2 py-1 d-none" style="font-size: 10px; font-weight: 700;">Alert</span>
                        </div>
                        <p class="text-muted mb-1 font-weight-medium" style="font-size: 13px;">Broken Eggs</p>
                        <h3 id="broken_eggs_display" class="font-weight-bold text-danger mb-1" style="font-size: 32px; letter-spacing: -0.03em;">0</h3>
                        <p id="broken_percent_text" class="text-danger mb-0" style="font-size: 10px; opacity: 0.8;">0% of daily total</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-8 mb-4">
                    <div class="bg-white rounded-2xl soft-botanical-shadow border overflow-hidden position-relative">
                        <div class="p-4 border-bottom d-flex justify-content-between align-items-center">
                            <h4 class="font-weight-bold text-dark mb-0" style="font-size: 18px;">Daily Collection Log</h4>
                            <button class="btn btn-link text-success p-0 font-weight-bold d-flex align-items-center gap-1" style="font-size: 12px;">
                                View Archive <span class="material-symbols-outlined" style="font-size: 14px;">arrow_forward</span>
                            </button>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="bg-light">
                                    <tr>
                                        <th class="border-0 py-3 px-4" style="font-size: 11px; letter-spacing: 0.05em; width: 220px;">TIME (SHIFT)</th>
                                        <th class="border-0 py-3 text-center" style="font-size: 11px; letter-spacing: 0.05em; width: 100px;">QTY</th>
                                        <th class="border-0 py-3 text-center" style="font-size: 11px; letter-spacing: 0.05em; width: 100px;">BROKEN</th>
                                        <th class="border-0 py-3 d-none d-md-table-cell" style="font-size: 11px; letter-spacing: 0.05em;">COLLECTOR</th>
                                        <th class="border-0 py-3 text-center d-none d-md-table-cell" style="font-size: 11px; letter-spacing: 0.05em; width: 120px;">STATUS</th>
                                        <th class="border-0 py-3 text-right px-4" style="font-size: 11px; letter-spacing: 0.05em; width: 80px;">ACTIONS</th>
                                    </tr>
                                </thead>
                                <tbody id="dailyCollectionLogTable" style="font-size: 13px;">
                                    <!-- Populated via AJAX -->
                                </tbody>
                            </table>
                        </div>
                        <div class="p-4 d-flex justify-content-center border-top bg-light-faint">
                            <button class="btn btn-botanical-light d-flex align-items-center gap-2 px-4 py-2 rounded-xl" data-toggle="modal" data-target="#logCollectionModal">
                                <span class="material-symbols-outlined" style="font-size: 20px;">add</span>
                                <span class="font-weight-bold small">Add Collection</span>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Production Alerts -->
                <div class="col-lg-4">
                    <div class="bg-white p-4 rounded-2xl soft-botanical-shadow border">
                        <h4 class="font-weight-bold text-dark mb-4" style="font-size: 18px;">Production Alerts</h4>
                        <div class="d-flex flex-column gap-3">
                            <!-- Alert 1 -->
                            <div class="p-3 rounded-xl border-left-danger bg-danger-xlight d-flex gap-3 mb-3">
                                <span class="material-symbols-outlined text-danger" style="font-size: 20px;">warning</span>
                                <div>
                                    <p class="font-weight-bold text-danger small mb-1">Sudden yield drop in Sector B</p>
                                    <p class="text-muted x-small mb-1">Daily collection is 12% below expected trend for Section B-4.</p>
                                    <p class="text-muted xx-small mb-0 mt-1">12 minutes ago</p>
                                </div>
                            </div>
                            <!-- Alert 2 -->
                            <div class="p-3 rounded-xl border-left-secondary bg-warning-xlight d-flex gap-3">
                                <span class="material-symbols-outlined text-warning" style="font-size: 20px;">analytics</span>
                                <div>
                                    <p class="font-weight-bold text-dark small mb-1">Breakage above 2% threshold</p>
                                    <p class="text-muted x-small mb-1">Broken egg count in Mid-Shift exceeded the quality target.</p>
                                    <p class="text-muted xx-small mb-0 mt-1">2 hours ago</p>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-botanical-light btn-block mt-4 rounded-xl font-weight-bold small py-2">
                            Dismiss All
                        </button>
                    </div>
                </div>
            </div>

            <!-- Trends Section -->
            <div class="row mt-4">
                <div class="col-12">
                    <div class="bg-white p-3 p-md-4 rounded-2xl soft-botanical-shadow border">
                        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center mb-4 gap-3">
                            <div class="mb-3 mb-md-0">
                                <h4 class="font-weight-bold text-dark mb-1" style="font-size: 18px;">Weekly Production Rate vs Target</h4>
                                <p class="text-muted small mb-0">Comparative analysis of daily yields against performance benchmarks.</p>
                            </div>
                            <div class="d-flex flex-wrap align-items-center gap-3 gap-md-5 chart-legend-container">
                                <div class="d-flex align-items-center gap-2">
                                    <span class="rounded-circle bg-success" style="width: 10px; height: 10px;"></span>
                                    <span class="text-muted x-small font-weight-bold">Actual Rate</span>
                                </div>
                                <div class="d-flex align-items-center gap-2">
                                    <span class="rounded-circle bg-danger" style="width: 10px; height: 10px;"></span>
                                    <span class="text-muted x-small font-weight-bold">Target (92%)</span>
                                </div>
                                <select class="form-control form-control-sm bg-light border-0 rounded-lg px-3 font-weight-bold text-success" style="width: auto;">
                                    <option>Last 7 Days</option>
                                    <option>Last 30 Days</option>
                                </select>
                            </div>
                        </div>
                        <!-- ApexCharts Implementation -->
                        <div id="productionChart" style="min-height: 300px;"></div>
                    </div>
                </div>
            </div>

        </div>

    </main>
</div>

<!-- Log Egg Collection Modal -->
<div class="modal fade modal-poultry" id="logCollectionModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content border-0">
            <div class="row no-gutters h-100">
                <!-- Left Branded Sidebar -->
                <div class="col-lg-4 d-none d-lg-block">
                    <div class="modal-branded-sidebar">
                        <div>
                            <div class="d-flex align-items-center gap-2 mb-4">
                                <span class="material-symbols-outlined text-white" style="font-size: 32px; font-variation-settings: 'FILL' 1;">egg</span>
                                <span class="font-weight-bold tracking-tight" style="font-size: 20px;">Record Production</span>
                            </div>
                            <p class="opacity-80" style="max-width: 240px; font-size: 15px;">Ensuring precise data tracking for the Emerald Valley Barn 4 operations.</p>
                        </div>
                        <div class="mt-auto">
                            <div class="p-4 bg-white-10 rounded-xl" style="background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); border: 1px solid rgba(255,255,255,0.2);">
                                <p class="text-uppercase tracking-widest font-weight-bold mb-2" style="font-size: 10px; color: rgba(255,255,255,0.7);">Active Station</p>
                                <p class="font-weight-bold h5 mb-1">Barn Cluster 04</p>
                                <p class="small opacity-70 mb-0">Section A • Layers Division</p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Right Form Column -->
                <div class="col-lg-8 bg-white">
                    <div class="p-4 p-md-4 position-relative h-100">
                        <button type="button" class="close position-absolute" data-dismiss="modal" aria-label="Close" style="top: 30px; right: 30px; z-index: 10;">
                            <span class="material-symbols-outlined text-muted">close</span>
                        </button>
                        
                        <div class="mx-auto" style="max-width: 680px;">
                            <header class="mb-5">
                                <h3 class="font-weight-bold text-dark mb-2" style="font-size: 20px;">Daily Egg Collection</h3>
                                <p class="text-muted small">Fill in the collection details for the current shift.</p>
                            </header>

                            <form id="eggCollectionForm">
                                <div id="collectionNotification" class="mb-3"></div>
                                <div class="form-row mb-3">
                                    <div class="col-md-6 mb-3 mb-md-0">
                                        <label class="text-uppercase font-weight-bold text-muted mb-2" style="font-size: 11px; letter-spacing: 0.05em;">Collection Date</label>
                                        <div class="position-relative">
                                            <span class="material-symbols-outlined position-absolute text-muted" style="right: 12px; top: 50%; transform: translateY(-50%); font-size: 18px;">calendar_today</span>
                                            <input type="text" id="collection_date" class="custom-form-input pr-5" value="<?php echo date('d-M-Y'); ?>" readonly>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="text-uppercase font-weight-bold text-muted mb-2" style="font-size: 11px; letter-spacing: 0.05em;">Flock Selection</label>
                                        <select id="collection_flock_id" class="custom-form-input appearance-none flock-select">
                                            <option value="" disabled selected>Loading flocks...</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="text-uppercase font-weight-bold text-muted mb-2" style="font-size: 11px; letter-spacing: 0.05em;">Shift Selection</label>
                                    <div class="d-flex gap-3 shift-radio-group shift-container">
                                        <div class="text-center w-100 py-3 text-muted">
                                            <div class="spinner-border spinner-border-sm mr-2"></div> Loading shifts...
                                        </div>
                                    </div>
                                </div>

                                <div class="form-row mb-3">
                                    <div class="col-md-6 mb-3 mb-md-0">
                                        <label class="text-uppercase font-weight-bold text-muted mb-2 d-flex align-items-center gap-2" style="font-size: 11px; letter-spacing: 0.05em;">
                                            Good Eggs <span class="material-symbols-outlined text-success" style="font-size: 14px;">check_circle</span>
                                        </label>
                                        <input type="number" id="good_eggs" class="custom-form-input text-dark font-weight-bold" style="font-size: 18px;" placeholder="0">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="text-uppercase font-weight-bold text-muted mb-2 d-flex align-items-center gap-2" style="font-size: 11px; letter-spacing: 0.05em;">
                                            Broken/Bad Eggs <span class="material-symbols-outlined text-danger" style="font-size: 14px;">report</span>
                                        </label>
                                        <input type="number" id="broken_eggs" class="custom-form-input text-dark font-weight-bold" style="font-size: 18px;" placeholder="0">
                                    </div>
                                </div>

                                <div class="mb-5">
                                    <label class="text-uppercase font-weight-bold text-muted mb-2" style="font-size: 11px; letter-spacing: 0.05em;">Narration/Notes</label>
                                    <textarea id="narration" class="custom-form-input" rows="3" style="resize: none;" placeholder="Optional notes regarding shell quality or barn conditions..."></textarea>
                                </div>

                                <div class="d-flex align-items-center justify-content-end mt-4">
                                    <button type="button" class="btn btn-cancel-modal mr-3" data-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-save-record d-flex align-items-center justify-content-center">
                                        <span class="material-symbols-outlined mr-2" style="font-size: 18px; font-variation-settings: 'FILL' 1;">save</span>
                                        Save Record
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <!-- Core Scripts -->
    <script src="<?php echo $base_path; ?>plugins/jquery-3.6.1.js"></script>
    <script src="<?php echo $base_path; ?>plugins/popper.js"></script>
    <script src="<?php echo $base_path; ?>plugins/bootstrap.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    
    <!-- Modular UI Scripts -->
    <script src="<?php echo $base_path; ?>js/navigation.js"></script>
    <script src="<?php echo $base_path; ?>js/header.js"></script>
    <script src="<?php echo $base_path; ?>plugins/alert/alert.js"></script>

    <script>
    $(document).ready(function() {
        loadCollectionShifts();
        loadLayerFlocks();
        loadEggStats();
        loadCollectionLog();

        function loadCollectionLog() {
            const $tbody = $('#dailyCollectionLogTable');
            $.ajax({
                url: base_path + 'controllers/poultryflockoperations.php?action=getcollectionlog',
                type: 'GET',
                success: function(response) {
                    try {
                        const logs = JSON.parse(response);
                        let html = '';
                        if (logs.length === 0) {
                            html = '<tr><td colspan="6" class="text-center py-5 text-muted">No collection records for today</td></tr>';
                        } else {
                            logs.forEach(l => {
                                html += `
                                    <tr>
                                        <td class="align-middle py-3 px-4">
                                            <div class="font-weight-bold text-dark mb-0">${l.shift_time} (${l.shiftname})</div>
                                        </td>
                                        <td class="align-middle text-center text-muted font-weight-medium">${parseInt(l.totalqty).toLocaleString()}</td>
                                        <td class="align-middle text-center text-danger font-weight-bold">${parseInt(l.brokencount).toLocaleString()}</td>
                                        <td class="align-middle d-none d-md-table-cell">
                                            <div class="text-muted">${l.collector}</div>
                                        </td>
                                        <td class="align-middle text-center d-none d-md-table-cell">
                                            <span class="badge badge-pill bg-success-light text-success px-3 py-1" style="font-size: 10px; font-weight: 600;">Verified</span>
                                        </td>
                                        <td class="align-middle text-right py-3 px-4">
                                            <button class="btn btn-icon-round border-0 bg-transparent">
                                                <span class="material-symbols-outlined text-muted" style="font-size: 18px;">more_vert</span>
                                            </button>
                                        </td>
                                    </tr>`;
                            });
                        }
                        $tbody.html(html);
                    } catch (e) {
                        $tbody.html('<tr><td colspan="6" class="text-center py-5 text-danger">Error loading logs</td></tr>');
                    }
                }
            });
        }

        function loadEggStats() {
            $.ajax({
                url: base_path + 'controllers/poultryflockoperations.php?action=geteggstats',
                type: 'GET',
                success: function(response) {
                    try {
                        const res = JSON.parse(response);
                        if (res.status === 'success') {
                            const d = res.data;
                            $('#total_collected_count').text(d.total_collected.toLocaleString());
                            $('#production_rate_display').html(`${d.production_rate}<span class="small font-weight-normal" style="font-size: 20px;">%</span>`);
                            $('#good_eggs_display').text(d.good_eggs.toLocaleString());
                            $('#broken_eggs_display').text(d.broken_eggs.toLocaleString());
                            $('#good_eggs_progress').css('width', d.good_percent + '%');
                            $('#broken_percent_text').text(`${d.broken_percent}% of daily total`);
                            
                            // Show alert if breakage > 2%
                            if (parseFloat(d.broken_percent) > 2) {
                                $('#broken_alert_badge').removeClass('d-none');
                            } else {
                                $('#broken_alert_badge').addClass('d-none');
                            }
                        }
                    } catch (e) {
                        console.error("Stats Load Error:", e);
                    }
                }
            });
        }

        function loadLayerFlocks() {
            const $select = $('#collection_flock_id');
            $.ajax({
                url: base_path + 'controllers/poultryflockoperations.php?action=getlayerflocks',
                type: 'GET',
                success: function(response) {
                    try {
                        const flocks = JSON.parse(response);
                        let html = '';
                        if (flocks.length === 0) {
                            html = '<option value="" disabled selected>No layer flocks found...</option>';
                        } else {
                            html = '<option value="" disabled selected>Select production flock...</option>';
                            flocks.forEach(f => {
                                html += `<option value="${f.flockid}">${f.flockno} (${f.breedname} - ${f.stagename})</option>`;
                            });
                        }
                        $select.html(html);
                    } catch (e) {
                        $select.html('<option value="" disabled>Error loading flocks</option>');
                    }
                }
            });
        }

        function loadCollectionShifts() {
            const $container = $('.shift-container');
            $.ajax({
                url: base_path + 'controllers/poultryflockoperations.php?action=getcollectionshifts',
                type: 'GET',
                success: function(response) {
                    try {
                        const shifts = JSON.parse(response);
                        let html = '';
                        shifts.forEach(s => {
                            html += `
                                <label class="shift-option">
                                    <input type="radio" name="shift" value="${s.shiftid}" ${s.is_default == 1 ? 'checked' : ''}>
                                    <div class="shift-card">
                                        <div class="text-uppercase font-weight-bold opacity-60 mb-1" style="font-size: 9px;">${s.shiftname}</div>
                                        <div class="font-weight-bold" style="font-size: 16px;">${s.formatted_time}</div>
                                    </div>
                                </label>`;
                        });
                        $container.html(html);
                    } catch (e) {
                        $container.html('<div class="text-center w-100 py-3 text-danger small">Error loading shifts</div>');
                    }
                }
            });
        }

        function showNotification(message, type = 'info') {
            const $notif = $('#collectionNotification');
            $notif.html(showAlert(type, message, 1)).fadeIn();
        }

        $('#eggCollectionForm').on('submit', function(e) {
            e.preventDefault();
            const $btn = $(this).find('button[type="submit"]');
            const $notif = $('#collectionNotification');
            
            // 1. Validate Date
            const date = $('#collection_date').val();
            if (!date) {
                showNotification("Please select a collection date.");
                $('#collection_date').focus();
                return;
            }

            // 2. Validate Flock
            const flockId = $('#collection_flock_id').val();
            if (!flockId) {
                showNotification("Please select a production flock.");
                $('#collection_flock_id').focus();
                return;
            }

            // 3. Validate Shift
            const shiftId = $('input[name="shift"]:checked').val();
            if (!shiftId) {
                showNotification("Please select a collection shift.");
                return;
            }

            // 4. Validate Good Eggs
            const goodEggs = $('#good_eggs').val();
            if (goodEggs === '' || parseInt(goodEggs) < 0) {
                showNotification("Please enter a valid count for good eggs (minimum 0).");
                $('#good_eggs').focus();
                return;
            }

            // 5. Validate Broken Eggs
            const brokenEggs = $('#broken_eggs').val();
            if (brokenEggs === '' || parseInt(brokenEggs) < 0) {
                showNotification("Please enter a valid count for broken eggs (minimum 0).");
                $('#broken_eggs').focus();
                return;
            }

            // All valid - Save
            $notif.hide();
            $btn.prop('disabled', true).html('<div class="spinner-border spinner-border-sm mr-2"></div> Saving...');

            $.ajax({
                url: base_path + 'controllers/poultryflockoperations.php?action=saveeggcollection',
                type: 'POST',
                data: {
                    flock_id: flockId,
                    collection_date: date,
                    shift_id: shiftId,
                    good_eggs: goodEggs,
                    broken_eggs: brokenEggs,
                    narration: $('#narration').val()
                },
                success: function(response) {
                    try {
                        const res = JSON.parse(response);
                        if (res.status === 'success') {
                            showNotification(res.message, 'success');
                            
                            // Reset production fields and flock, but keep date and shift
                            $('#good_eggs').val('');
                            $('#broken_eggs').val('');
                            $('#narration').val('');
                            $('#collection_flock_id').val('').trigger('change');
                            
                            // Refresh Stats, Log & Chart
                            loadEggStats();
                            loadCollectionLog();
                            loadWeeklyChart();
                            
                            // Clear notification after 4 seconds
                            setTimeout(() => $notif.fadeOut(), 4000);
                        } else {
                            showNotification(res.message, 'danger');
                        }
                    } catch (e) {
                        showNotification("System error occurred while saving.", 'danger');
                    }
                    $btn.prop('disabled', false).html('<span class="material-symbols-outlined mr-2" style="font-size: 18px; font-variation-settings: \'FILL\' 1;">save</span> Save Record');
                },
                error: function() {
                    showNotification("Network error occurred. Please check your connection.", 'danger');
                    $btn.prop('disabled', false).html('<span class="material-symbols-outlined mr-2" style="font-size: 18px; font-variation-settings: \'FILL\' 1;">save</span> Save Record');
                }
            });
        });

        // Modal Blur Logic
        $('#logCollectionModal').on('show.bs.modal', function() {
            $('body').addClass('modal-open');
        });
        
        $('#logCollectionModal').on('hidden.bs.modal', function() {
            $('body').removeClass('modal-open');
        });

        // Initialize Datepicker
        flatpickr("#collection_date", {
            dateFormat: "d-M-Y",
            maxDate: "today",
            disableMobile: "true",
            defaultDate: "today"
        });

        function loadWeeklyChart() {
            $.ajax({
                url: base_path + 'controllers/poultryflockoperations.php?action=getweeklyprodchart',
                type: 'GET',
                success: function(response) {
                    try {
                        const res = JSON.parse(response);
                        if (res.status === 'success') {
                            renderProductionChart(res.categories, res.rates, res.target);
                        }
                    } catch (e) {
                        console.error("Chart Load Error:", e);
                    }
                }
            });
        }

        let prodChart = null;

        function renderProductionChart(categories, rates, target) {
            const options = {
                series: [{
                    name: 'Actual Rate',
                    data: rates
                }],
                chart: {
                    type: 'area',
                    height: 350,
                    toolbar: { show: false },
                    zoom: { enabled: false },
                    fontFamily: 'Inter, sans-serif'
                },
                colors: ['#206223'],
                dataLabels: { enabled: false },
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
                        stops: [20, 100]
                    }
                },
                xaxis: {
                    categories: categories,
                    axisBorder: { show: false },
                    axisTicks: { show: false },
                    labels: {
                        style: {
                            colors: '#64748b',
                            fontSize: '12px'
                        }
                    }
                },
                yaxis: {
                    min: 0,
                    max: 100,
                    tickAmount: 5,
                    labels: {
                        formatter: (val) => val + "%",
                        style: {
                            colors: '#64748b',
                            fontSize: '12px'
                        }
                    }
                },
                grid: {
                    borderColor: '#f1f5f9',
                    strokeDashArray: 4,
                    padding: { left: 20, right: 20 }
                },
                annotations: {
                    yaxis: [{
                        y: target,
                        borderColor: '#ef4444',
                        label: {
                            borderColor: '#ef4444',
                            style: {
                                color: '#fff',
                                background: '#ef4444',
                                fontSize: '10px',
                                fontWeight: 700
                            },
                            text: `TARGET (${target}%)`
                        }
                    }]
                },
                tooltip: {
                    theme: 'light',
                    y: {
                        formatter: (val) => val + "%"
                    }
                }
            };

            if (prodChart) {
                prodChart.updateOptions(options);
            } else {
                prodChart = new ApexCharts(document.querySelector("#productionChart"), options);
                prodChart.render();
            }
        }

        loadWeeklyChart();
    });
    </script>

</body>
</html>
