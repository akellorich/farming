<?php
/**
 * Jukam Poultry Management System - Feeding Overview
 * File: views/poultry_feeding.php
 */
$base_path = '../';
$nav_context = 'poultry';
?>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feeding Overview | JUKAM Farm</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/bootstrap.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/all.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/dashboard.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/header.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/navigation.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/alert.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1">
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script>
        var base_path = '<?php echo $base_path; ?>';
    </script>
    
    <style>
        /* Poultry Specific Refinements */
        :root {
            --primary: #206223;
            --primary-dark: #003010;
            --emerald-50: #ecfdf5;
            --emerald-100: #d1fae5;
            --emerald-600: #059669;
            --emerald-700: #047857;
            --emerald-800: #065f46;
            --emerald-900: #064e3b;
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

        /* High-Fidelity UI Components */
        .glass-card { 
            background: rgba(255, 255, 255, 0.9); 
            backdrop-filter: blur(12px); 
            border: 1px solid rgba(255, 255, 255, 0.5);
        }

        .soft-botanical-shadow {
            box-shadow: 0px 10px 30px rgba(27, 94, 32, 0.05);
        }

        .rounded-2xl { border-radius: 1rem !important; }
        .rounded-3xl { border-radius: 1.5rem !important; }

        .stats-card-feeding {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .stats-card-feeding:hover {
            transform: translateY(-4px);
            box-shadow: 0px 15px 35px rgba(27, 94, 32, 0.1);
        }

        .bg-primary-gradient {
            background: linear-gradient(135deg, #00450d 0%, #1b5e20 100%);
        }

        .custom-form-input {
            background-color: #ffffff;
            border: 1.5px solid #E5E7EB;
            border-radius: 12px;
            padding: 10px 16px;
            font-size: 14px;
            transition: all 0.2s;
            width: 100%;
        }
        .custom-form-input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(32, 98, 35, 0.05);
            outline: none;
        }

        /* Chart Mockups */
        .chart-bar {
            width: 24px;
            border-radius: 4px 4px 0 0;
            background: var(--emerald-600);
            transition: height 0.3s ease;
        }
        .chart-bar-bg {
            width: 48px;
            height: 100%;
            background: rgba(5, 150, 105, 0.05);
            border-radius: 8px 8px 0 0;
            display: flex;
            align-items: flex-end;
            justify-content: center;
            border-top: 1px solid rgba(5, 150, 105, 0.1);
        }

        .dropdown-item {
            font-size: 12px !important;
            color: #4B5563 !important;
            font-weight: 500;
            padding: 8px 16px !important;
            display: flex;
            align-items: center;
        }

        .dropdown-item .material-symbols-outlined {
            margin-right: 12px;
            font-size: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .dropdown-item:hover {
            background-color: #F3F4F6 !important;
            color: #206223 !important;
        }

        .btn-primary {
            background-color: #206223 !important;
            border-color: #206223 !important;
        }
        .btn-primary:hover, .btn-primary:focus, .btn-primary:active {
            background-color: #1a4f1d !important;
            border-color: #1a4f1d !important;
            box-shadow: 0 0 0 4px rgba(32, 98, 35, 0.1) !important;
        }

        @media (max-width: 768px) {
            .main-content { padding-top: 60px; }
            .stats-card-feeding h3 { font-size: 24px !important; }
            
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

            .modal-header-desc {
                font-size: 11px !important;
            }

            .page-title { font-size: 20px !important; }
            .page-description { font-size: 11px !important; }
            .section-title { font-size: 15px !important; }
            .section-description { font-size: 10px !important; }

            .action-btn-text { font-size: 11px !important; }
            .action-btn-icon { font-size: 16px !important; }
            .summary-card-title { font-size: 9px !important; }
            .stats-card-feeding { padding: 0.75rem !important; }
            .stats-card-feeding h3 { font-size: 20px !important; }
            
            .history-tbody { font-size: 11px !important; }
            .history-tbody td { font-size: 11px !important; }
        }

        /* Modal Blur Effect */
        body.modal-open .main-content,
        body.modal-open .sidebar,
        body.modal-open .top-header {
            filter: blur(5px);
            transition: filter 0.3s ease;
        }
        .modal-backdrop.show {
            opacity: 0.3;
            background-color: #064e3b;
        }
        .modal-content {
            border: none;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }
    </style>
</head>
<body>

    <!-- Modular Navigation (Sidebar) -->
    <?php include 'navigation.php'; ?>

    <main class="main-content">
        
        <!-- Modular Header (Top Bar) -->
        <?php include 'header.php'; ?>

        <div class="container-fluid p-3 p-md-4">
            
            <!-- Page Header -->
            <div class="d-flex flex-row justify-content-between align-items-center mb-4 gap-3">
                <div>
                    <h2 class="font-weight-bold text-dark mb-1 page-title" style="font-size: 24px; letter-spacing: -0.02em;">Feeding Overview</h2>
                    <p class="text-muted small mb-0 page-description">Strategic management of nutrition and feed conversion efficiency.</p>
                </div>
                <div class="d-flex gap-2">
                    <div class="dropdown">
                        <button class="btn bg-white border soft-botanical-shadow rounded-xl px-2 py-2 d-flex align-items-center justify-content-between gap-2 transition-all hover:bg-light" style="min-width: 90px;" data-toggle="dropdown">
                            <div class="d-flex align-items-center gap-1">
                                <span class="material-symbols-outlined text-warning action-btn-icon" style="font-size: 18px; font-variation-settings: 'FILL' 1;">bolt</span>
                                <span class="font-weight-bold small text-dark action-btn-text">Action</span>
                            </div>
                            <span class="material-symbols-outlined text-muted action-btn-icon" style="font-size: 18px;">expand_more</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right border-0 shadow-lg rounded-xl py-2 mt-2" style="min-width: 200px;">
                            <a class="dropdown-item py-2" href="#" data-toggle="modal" data-target="#addFeedModal">
                                <span class="material-symbols-outlined text-success">add_circle</span> Add Feed Entry
                            </a>
                            <a class="dropdown-item py-2" href="#">
                                <span class="material-symbols-outlined text-info">inventory_2</span> Manage Feed Stock
                            </a>
                            <div class="dropdown-divider mx-3"></div>
                            <a class="dropdown-item py-2" href="#">
                                <span class="material-symbols-outlined text-muted">analytics</span> Feed Reports
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Summary Cards Grid -->
            <div class="row mb-4 mx-n2">
                <!-- Feed Consumed Today -->
                <div class="col-6 col-md-3 mb-2 px-2">
                    <div class="stats-card-feeding bg-white p-4 rounded-2xl border-0 soft-botanical-shadow h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="pr-2">
                                <p class="text-muted font-weight-medium mb-0 summary-card-title" style="font-size: 12px; line-height: 1.2;">Feed Consumed</p>
                                <p class="text-muted font-weight-medium mb-0 summary-card-title" style="font-size: 12px;">Today</p>
                            </div>
                            <div class="bg-success-light p-2 rounded-lg" style="background: rgba(32, 98, 35, 0.08);">
                                <span class="material-symbols-outlined text-success" style="font-size: 18px; color: #206223 !important;">scale</span>
                            </div>
                        </div>
                        <div>
                            <h3 class="text-dark mb-1" style="font-size: 32px; letter-spacing: -0.02em; font-weight: 500;">320 <span class="text-success font-weight-bold" style="font-size: 14px; color: #206223 !important;">kg</span></h3>
                            <div class="d-flex align-items-center gap-1">
                                <span class="material-symbols-outlined text-success" style="font-size: 12px;">trending_up</span>
                                <span class="text-success font-weight-bold" style="font-size: 10px;">+2.4% vs yesterday</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Feed per Bird (Primary KPI) -->
                <div class="col-6 col-md-3 mb-2 px-2">
                    <div class="stats-card-feeding bg-primary-gradient p-4 rounded-2xl border-0 shadow-lg h-100 position-relative overflow-hidden">
                        <div class="position-relative z-10">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <span class="text-white-50 font-weight-medium summary-card-title" style="font-size: 12px;">Feed per Bird</span>
                                <span class="badge badge-pill text-white border-0 py-1 px-2" style="font-size: 8px; font-weight: 800; background: rgba(0,0,0,0.2); letter-spacing: 0.05em;">PRIMARY KPI</span>
                            </div>
                            <div class="mt-4 pt-1">
                                <h3 class="text-white mb-2" style="font-size: 32px; letter-spacing: -0.02em; font-weight: 500;">110 <span class="text-white-50 font-weight-bold" style="font-size: 14px;">g</span></h3>
                                <div class="d-flex align-items-center">
                                    <div class="px-2 py-1 rounded-pill d-flex align-items-center" style="background: rgba(255,255,255,0.15);">
                                        <div class="bg-white rounded-circle" style="width: 5px; height: 5px; margin-right: 5px;"></div>
                                        <span class="text-white font-weight-bold" style="font-size: 10px;">Good</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="position-absolute" style="right: 15px; bottom: 15px; opacity: 0.12; transform: scale(1.5);">
                            <span class="material-symbols-outlined text-white" style="font-size: 64px;">analytics</span>
                        </div>
                    </div>
                </div>

                <!-- Total Feed Stock -->
                <div class="col-6 col-md-3 mb-2 px-2">
                    <div class="stats-card-feeding bg-white p-4 rounded-2xl border-0 soft-botanical-shadow h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <span class="text-muted font-weight-medium summary-card-title" style="font-size: 12px;">Total Feed Stock</span>
                            <div class="bg-success-light p-2 rounded-lg" style="background: rgba(32, 98, 35, 0.08);">
                                <span class="material-symbols-outlined text-success" style="font-size: 18px; color: #206223 !important;">assignment_turned_in</span>
                            </div>
                        </div>
                        <div class="mt-4 pt-1">
                            <h3 class="text-dark mb-1" style="font-size: 32px; letter-spacing: -0.02em; font-weight: 500;">4,250 <span class="text-success font-weight-bold" style="font-size: 14px; color: #206223 !important;">kg</span></h3>
                            <div class="mt-3">
                                <div class="progress" style="height: 4px; border-radius: 10px; background: #f1f5f9;">
                                    <div class="progress-bar" style="width: 75%; background-color: #206223 !important;"></div>
                                </div>
                                <p class="text-muted mt-2 mb-0 font-weight-bold" style="font-size: 10px; opacity: 0.8;">75% Capacity Remaining</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Feed Cost Today -->
                <div class="col-6 col-md-3 mb-2 px-2">
                    <div class="stats-card-feeding bg-white p-4 rounded-2xl border-0 soft-botanical-shadow h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <span class="text-muted font-weight-medium summary-card-title" style="font-size: 12px;">Feed Cost Today</span>
                            <div class="bg-warning-light p-2 rounded-lg" style="background: rgba(245, 158, 11, 0.08);">
                                <span class="material-symbols-outlined text-warning" style="font-size: 18px; color: #d97706 !important;">account_balance_wallet</span>
                            </div>
                        </div>
                        <div class="mt-4 pt-1">
                            <h3 class="text-dark mb-1" style="font-size: 32px; letter-spacing: -0.02em; font-weight: 500;"><span class="text-muted font-weight-medium" style="font-size: 14px; color: #94a3b8 !important;">KSh</span> 22,400</h3>
                            <div class="d-flex align-items-center gap-1">
                                <span class="material-symbols-outlined text-danger" style="font-size: 12px;">trending_up</span>
                                <span class="text-danger font-weight-bold" style="font-size: 10px;">+5.1% price shift</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Workspace -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="bg-white rounded-2xl p-4 border-0 soft-botanical-shadow mb-4">
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <div>
                                <h4 class="font-weight-bold text-dark mb-0 section-title" style="font-size: 18px;">Weekly Production Analysis</h4>
                                <p class="text-muted small mb-0 section-description">Overview of output yield vs target targets.</p>
                            </div>
                            <span class="badge badge-pill bg-emerald-50 text-emerald-700 px-3 py-1 font-weight-bold" style="font-size: 10px;">WEEK 42</span>
                        </div>
                        
                        <div id="productionAnalysisChart" style="min-height: 280px;"></div>
                    </div>

                    <!-- History Table -->
                    <div class="bg-white rounded-2xl border-0 soft-botanical-shadow overflow-hidden mb-4">
                        <div class="p-4 border-bottom d-flex justify-content-between align-items-center">
                            <h4 class="mb-0 section-title" style="font-size: 18px; font-weight: 500; color: #064e3b;">Consumption History</h4>
                            <button class="btn btn-link font-weight-bold p-0 d-flex align-items-center gap-2" style="font-size: 13px; text-decoration: none; color: #206223;">
                                <span class="material-symbols-outlined" style="font-size: 18px;">download</span>
                                Export
                            </button>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-borderless mb-0">
                                <thead style="background: #f8fafc;">
                                    <tr>
                                        <th class="px-4 py-3 text-uppercase font-weight-bold text-muted" style="font-size: 10px; letter-spacing: 0.05em;">Date</th>
                                        <th class="py-3 text-uppercase font-weight-bold text-muted" style="font-size: 10px; letter-spacing: 0.05em;">Flock ID</th>
                                        <th class="py-3 text-uppercase font-weight-bold text-muted d-none d-md-table-cell" style="font-size: 10px; letter-spacing: 0.05em;">Type</th>
                                        <th class="py-3 text-uppercase font-weight-bold text-muted text-center" style="font-size: 10px; letter-spacing: 0.05em;">Qty (Kg)</th>
                                        <th class="py-3 text-uppercase font-weight-bold text-muted d-none d-md-table-cell" style="font-size: 10px; letter-spacing: 0.05em;">Cost (Ksh)</th>
                                        <th class="py-3 text-uppercase font-weight-bold text-muted text-center d-none d-md-table-cell" style="font-size: 10px; letter-spacing: 0.05em;">G/Bird</th>
                                        <th class="px-4 py-3 text-right text-uppercase font-weight-bold text-muted" style="font-size: 10px; letter-spacing: 0.05em;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody class="text-dark history-tbody" style="font-size: 13px;">
                                    <!-- Row 1 -->
                                    <tr class="border-bottom hover-bg-emerald-light transition-all">
                                        <td class="px-4 py-4">
                                            <div class="font-weight-bold" style="line-height: 1.2;">Oct 23,<br><span style="font-weight: 500; opacity: 0.8;">2023</span></div>
                                        </td>
                                        <td class="py-4 text-muted">L-203A</td>
                                        <td class="py-4 d-none d-md-table-cell">
                                            <span class="px-2 py-1 rounded" style="background: #ecfdf5; color: #059669; font-size: 9px; font-weight: 800; text-transform: uppercase;">Layers Mash</span>
                                        </td>
                                        <td class="py-4 text-center font-weight-bold" style="font-size: 14px;">315.0</td>
                                        <td class="py-4 d-none d-md-table-cell" style="opacity: 0.8;">22,050</td>
                                        <td class="py-4 text-center text-success font-weight-bold d-none d-md-table-cell" style="font-size: 14px; color: #206223 !important;">109g</td>
                                        <td class="px-4 py-4 text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link p-0 text-dark opacity-60 hover:opacity-100" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined" style="font-size: 20px;">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right border-0 shadow-lg rounded-xl py-2">
                                                    <a class="dropdown-item" href="#" style="font-size: 12px; font-weight: 500;">
                                                        <span class="material-symbols-outlined mr-2" style="font-size: 18px; color: #4B5563;">edit</span> Edit Entry
                                                    </a>
                                                    <a class="dropdown-item text-danger" href="#" style="font-size: 12px; font-weight: 500;">
                                                        <span class="material-symbols-outlined mr-2" style="font-size: 18px; color: #DC2626;">delete</span> Delete Record
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <!-- Row 2 -->
                                    <tr class="border-bottom hover-bg-emerald-light transition-all">
                                        <td class="px-4 py-4">
                                            <div class="font-weight-bold" style="line-height: 1.2;">Oct 22,<br><span style="font-weight: 500; opacity: 0.8;">2023</span></div>
                                        </td>
                                        <td class="py-4 text-muted">L-203A</td>
                                        <td class="py-4 d-none d-md-table-cell">
                                            <span class="px-2 py-1 rounded" style="background: #ecfdf5; color: #059669; font-size: 9px; font-weight: 800; text-transform: uppercase;">Layers Mash</span>
                                        </td>
                                        <td class="py-4 text-center font-weight-bold" style="font-size: 14px;">310.0</td>
                                        <td class="py-4 d-none d-md-table-cell" style="opacity: 0.8;">21,700</td>
                                        <td class="py-4 text-center text-success font-weight-bold d-none d-md-table-cell" style="font-size: 14px; color: #206223 !important;">108g</td>
                                        <td class="px-4 py-4 text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link p-0 text-dark opacity-60 hover:opacity-100" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined" style="font-size: 20px;">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right border-0 shadow-lg rounded-xl py-2">
                                                    <a class="dropdown-item" href="#" style="font-size: 12px; font-weight: 500;">
                                                        <span class="material-symbols-outlined mr-2" style="font-size: 18px; color: #4B5563;">edit</span> Edit Entry
                                                    </a>
                                                    <a class="dropdown-item text-danger" href="#" style="font-size: 12px; font-weight: 500;">
                                                        <span class="material-symbols-outlined mr-2" style="font-size: 18px; color: #DC2626;">delete</span> Delete Record
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <!-- Row 3 -->
                                    <tr class="hover-bg-emerald-light transition-all">
                                        <td class="px-4 py-4">
                                            <div class="font-weight-bold" style="line-height: 1.2;">Oct 21,<br><span style="font-weight: 500; opacity: 0.8;">2023</span></div>
                                        </td>
                                        <td class="py-4 text-muted">L-203A</td>
                                        <td class="py-4 d-none d-md-table-cell">
                                            <span class="px-2 py-1 rounded" style="background: #ecfdf5; color: #059669; font-size: 9px; font-weight: 800; text-transform: uppercase;">Layers Mash</span>
                                        </td>
                                        <td class="py-4 text-center font-weight-bold" style="font-size: 14px;">325.0</td>
                                        <td class="py-4 d-none d-md-table-cell" style="opacity: 0.8;">22,750</td>
                                        <td class="py-4 text-center text-success font-weight-bold d-none d-md-table-cell" style="font-size: 14px; color: #206223 !important;">112g</td>
                                        <td class="px-4 py-4 text-right">
                                            <div class="dropdown">
                                                <button class="btn btn-link p-0 text-dark opacity-60 hover:opacity-100" data-toggle="dropdown">
                                                    <span class="material-symbols-outlined" style="font-size: 20px;">more_vert</span>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-right border-0 shadow-lg rounded-xl py-2">
                                                    <a class="dropdown-item" href="#" style="font-size: 12px; font-weight: 500;">
                                                        <span class="material-symbols-outlined mr-2" style="font-size: 18px; color: #4B5563;">edit</span> Edit Entry
                                                    </a>
                                                    <a class="dropdown-item text-danger" href="#" style="font-size: 12px; font-weight: 500;">
                                                        <span class="material-symbols-outlined mr-2" style="font-size: 18px; color: #DC2626;">delete</span> Delete Record
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="p-4 border-top text-center" style="background: #fff;">
                            <button class="btn btn-link text-uppercase font-weight-bold p-0" style="font-size: 11px; letter-spacing: 0.1em; text-decoration: none; color: #64748b;">Load Previous Records</button>
                        </div>
                    </div>
                </div>

                <!-- Right Column: Sidebar Panels -->
                <div class="col-lg-4">
                    <!-- Stock Inventory -->
                    <div class="bg-white rounded-2xl p-4 border-0 soft-botanical-shadow mb-4">
                        <div class="d-flex justify-content-between align-items-center mb-4 pb-2">
                            <h4 class="text-dark mb-0" style="font-size: 18px; font-weight: 500;">Stock Inventory</h4>
                            <span class="material-symbols-outlined text-muted" style="font-size: 24px; opacity: 0.6;">inventory_2</span>
                        </div>
                        
                        <div class="space-y-4 d-flex flex-column gap-4">
                            <!-- Layers Mash -->
                            <div class="mb-3 pb-2">
                                <div class="d-flex justify-content-between mb-2 align-items-end">
                                    <span class="font-weight-bold text-dark" style="font-size: 14px;">Layers Mash</span>
                                    <span class="text-muted" style="font-size: 14px; opacity: 0.8;">2,800 / 4,000 kg</span>
                                </div>
                                <div class="progress mb-2" style="height: 6px; border-radius: 10px; background: #f1f5f9;">
                                    <div class="progress-bar" style="width: 70%; background-color: #206223 !important;"></div>
                                </div>
                                <p class="text-success font-weight-bold mb-0 text-uppercase" style="font-size: 10px; color: #206223 !important; letter-spacing: 0.02em;">OPTIMAL LEVEL</p>
                            </div>

                            <!-- Growers Mash -->
                            <div class="mb-3 pb-2">
                                <div class="d-flex justify-content-between mb-2 align-items-end">
                                    <span class="font-weight-bold text-dark" style="font-size: 14px;">Growers Mash</span>
                                    <span class="text-muted" style="font-size: 14px; opacity: 0.8;">450 / 2,000 kg</span>
                                </div>
                                <div class="progress mb-2" style="height: 6px; border-radius: 10px; background: #f1f5f9;">
                                    <div class="progress-bar" style="width: 22.5%; background-color: #b91c1c !important;"></div>
                                </div>
                                <div class="d-flex align-items-center gap-1 text-danger">
                                    <span class="material-symbols-outlined" style="font-size: 14px;">warning</span>
                                    <p class="font-weight-bold mb-0 text-uppercase" style="font-size: 10px; letter-spacing: 0.02em;">LOW STOCK ALERT</p>
                                </div>
                            </div>

                            <!-- Kienyeji Mix -->
                            <div class="mb-3">
                                <div class="d-flex justify-content-between mb-2 align-items-end">
                                    <span class="font-weight-bold text-dark" style="font-size: 14px;">Kienyeji Mix</span>
                                    <span class="text-muted" style="font-size: 14px; opacity: 0.8;">1,000 / 1,500 kg</span>
                                </div>
                                <div class="progress mb-2" style="height: 6px; border-radius: 10px; background: #f1f5f9;">
                                    <div class="progress-bar" style="width: 66%; background-color: #206223 !important;"></div>
                                </div>
                                <p class="text-success font-weight-bold mb-0 text-uppercase" style="font-size: 10px; color: #206223 !important; letter-spacing: 0.02em;">OPTIMAL LEVEL</p>
                            </div>
                        </div>
                        
                        <button class="btn btn-block mt-4 rounded-xl font-weight-bold py-2 transition-all hover:bg-emerald-50" style="font-size: 14px; border: 1.5px solid #dcfce7; background: #fff; color: #206223;">
                            Order Feed Supplies
                        </button>
                    </div>

                    <!-- Insights Panel -->
                    <div class="bg-white rounded-2xl p-4 border-0 soft-botanical-shadow">
                        <h4 class="mb-4" style="font-size: 18px; font-weight: 500; color: #064e3b;">Efficiency Insights</h4>
                        <div class="d-flex flex-column gap-4">
                            <!-- Normal Efficiency -->
                            <div class="p-3 rounded-2xl d-flex gap-4 align-items-center mb-2" style="background: #f0fdf4; border: 1px solid #dcfce7;">
                                <div class="bg-white rounded-circle d-flex align-items-center justify-content-center text-success shadow-sm" style="width: 40px; height: 40px; min-width: 40px; margin-right: 8px;">
                                    <span class="material-symbols-outlined" style="font-size: 20px; font-variation-settings: 'FILL' 0;">check_circle</span>
                                </div>
                                <div>
                                    <h5 class="font-weight-bold mb-1" style="font-size: 14px; color: #166534;">Normal Feed Efficiency</h5>
                                    <p class="mb-0" style="font-size: 12px; color: #166534; opacity: 0.8;">FCR is within target range for 24-week layers.</p>
                                </div>
                            </div>
                            <!-- Rising Cost -->
                            <div class="p-3 rounded-2xl d-flex gap-4 align-items-center mb-2" style="background: #fffaf0; border: 1px solid #ffedd5;">
                                <div class="bg-white rounded-circle d-flex align-items-center justify-content-center text-warning shadow-sm" style="width: 40px; height: 40px; min-width: 40px; margin-right: 8px;">
                                    <span class="material-symbols-outlined" style="font-size: 20px; color: #9a3412;">trending_up</span>
                                </div>
                                <div>
                                    <h5 class="font-weight-bold mb-1" style="font-size: 14px; color: #7c2d12;">Rising Feed Cost</h5>
                                    <p class="mb-0" style="font-size: 12px; color: #7c2d12; opacity: 0.8;">Market price for premium mash increased by 4.2% this week.</p>
                                </div>
                            </div>
                            <!-- Critical Stock -->
                            <div class="p-3 rounded-2xl d-flex gap-4 align-items-center" style="background: #fef2f2; border: 1px solid #fee2e2;">
                                <div class="bg-white rounded-circle d-flex align-items-center justify-content-center text-danger shadow-sm" style="width: 40px; height: 40px; min-width: 40px; margin-right: 8px;">
                                    <span class="material-symbols-outlined" style="font-size: 20px; color: #991b1b;">error</span>
                                </div>
                                <div>
                                    <h5 class="font-weight-bold mb-1" style="font-size: 14px; color: #7f1d1d;">Critical Stock Level</h5>
                                    <p class="mb-0" style="font-size: 12px; color: #7f1d1d; opacity: 0.8;">Growers Mash will be depleted in 48 hours at current rates.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Charts Section -->
            <div class="row mt-4">
                <div class="col-md-6 mb-4">
                    <div class="bg-white p-4 rounded-2xl soft-botanical-shadow border-0 h-100">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="font-weight-bold text-dark mb-0 section-title" style="font-size: 18px;">Consumption Trend (7d)</h4>
                        </div>
                        <div id="consumptionChart" style="min-height: 250px;"></div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="bg-white p-4 rounded-2xl soft-botanical-shadow border-0 h-100">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="font-weight-bold text-dark mb-0 section-title" style="font-size: 18px;">Monthly Cost Comparison</h4>
                            <span class="badge badge-pill bg-emerald-50 text-emerald-700 px-2 py-1" style="font-size: 10px; font-weight: 700;">LAST 4 MONTHS</span>
                        </div>
                        <div id="costComparisonChart" style="min-height: 250px;"></div>
                    </div>
                </div>
            </div>
        </div>

    </main>

    <!-- Core Scripts -->
    <script src="<?php echo $base_path; ?>plugins/jquery-3.6.1.js"></script>
    <script src="<?php echo $base_path; ?>plugins/popper.js"></script>
    <script src="<?php echo $base_path; ?>plugins/bootstrap.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    
    <!-- Modular UI Scripts -->
    <script src="<?php echo $base_path; ?>js/navigation.js"></script>
    <script src="<?php echo $base_path; ?>js/header.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Consumption Trend Area Chart
            var options = {
                series: [{
                    name: 'Actual',
                    data: [310, 340, 315, 320, 325, 318, 330]
                }, {
                    name: 'Target',
                    data: [315, 315, 315, 315, 315, 315, 315]
                }],
                chart: {
                    type: 'area',
                    height: 250,
                    toolbar: { show: false },
                    zoom: { enabled: false },
                    fontFamily: 'Manrope, sans-serif'
                },
                colors: ['#206223', '#cbd5e1'],
                dataLabels: { enabled: false },
                stroke: {
                    curve: 'smooth',
                    width: [3, 2],
                    dashArray: [0, 5]
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
                    categories: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                    axisBorder: { show: false },
                    axisTicks: { show: false },
                    title: {
                        text: 'Days of the Week',
                        style: {
                            color: '#94a3b8',
                            fontSize: '10px',
                            fontWeight: 600
                        }
                    },
                    labels: {
                        style: {
                            colors: '#94a3b8',
                            fontSize: '10px',
                            fontWeight: 700
                        }
                    }
                },
                yaxis: {
                    title: {
                        text: 'Feed Quantity (Kg)',
                        style: {
                            color: '#94a3b8',
                            fontSize: '10px',
                            fontWeight: 600
                        }
                    },
                    labels: {
                        style: {
                            colors: '#94a3b8',
                            fontSize: '10px',
                            fontWeight: 700
                        }
                    }
                },
                grid: {
                    borderColor: '#f1f5f9',
                    strokeDashArray: 4,
                    padding: { top: -20, right: 0, bottom: 0, left: 10 }
                },
                legend: { show: false },
                tooltip: {
                    theme: 'light',
                    x: { show: true },
                    y: {
                        formatter: function(val) { return val + " kg" }
                    }
                }
            };

            var chart = new ApexCharts(document.querySelector("#consumptionChart"), options);
            chart.render();

            // Monthly Cost Comparison Inverted Bar Chart
            var costOptions = {
                series: [{
                    name: 'Total Cost',
                    data: [627200, 580400, 540100, 590800]
                }],
                chart: {
                    type: 'bar',
                    height: 250,
                    toolbar: { show: false },
                    fontFamily: 'Manrope, sans-serif'
                },
                plotOptions: {
                    bar: {
                        borderRadius: 6,
                        horizontal: true,
                        barHeight: '50%',
                        distributed: true
                    }
                },
                colors: ['#f59e0b', '#fbbf24', '#fcd34d', '#fbbf24'],
                dataLabels: {
                    enabled: true,
                    formatter: function(val) {
                        return "KSh " + val.toLocaleString();
                    },
                    style: {
                        fontSize: '10px',
                        fontWeight: 700,
                        colors: ['#fff']
                    },
                    offsetX: -10
                },
                xaxis: {
                    categories: ['October', 'September', 'August', 'July'],
                    title: {
                        text: 'Expenditure (KSh)',
                        style: {
                            color: '#94a3b8',
                            fontSize: '10px',
                            fontWeight: 600
                        }
                    },
                    labels: {
                        style: {
                            colors: '#94a3b8',
                            fontSize: '10px',
                            fontWeight: 700
                        },
                        formatter: function(val) {
                            return (val / 1000) + "k";
                        }
                    }
                },
                yaxis: {
                    labels: {
                        style: {
                            colors: '#94a3b8',
                            fontSize: '10px',
                            fontWeight: 700
                        }
                    }
                },
                grid: {
                    borderColor: '#f1f5f9',
                    strokeDashArray: 4,
                    xaxis: { lines: { show: true } },
                    yaxis: { lines: { show: false } },
                    padding: { top: -20, right: 10, bottom: 0, left: 10 }
                },
                legend: { show: false },
                tooltip: {
                    theme: 'light',
                    y: {
                        formatter: function(val) { return "KSh " + val.toLocaleString() }
                    }
                }
            };

            var costChart = new ApexCharts(document.querySelector("#costComparisonChart"), costOptions);
            costChart.render();

            // Weekly Production Analysis Chart
            var prodOptions = {
                series: [{
                    name: 'Production Yield',
                    data: [850, 890, 860, 910, 880, 920, 940]
                }, {
                    name: 'Target Yield',
                    data: [880, 880, 880, 880, 880, 880, 880]
                }],
                chart: {
                    type: 'bar',
                    height: 280,
                    toolbar: { show: false },
                    stacked: false,
                    fontFamily: 'Manrope, sans-serif'
                },
                plotOptions: {
                    bar: {
                        horizontal: false,
                        columnWidth: '45%',
                        borderRadius: 4
                    },
                },
                colors: ['#206223', '#cbd5e1'],
                dataLabels: { enabled: false },
                stroke: {
                    show: true,
                    width: 2,
                    colors: ['transparent']
                },
                xaxis: {
                    categories: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                    axisBorder: { show: false },
                    axisTicks: { show: false },
                    labels: {
                        style: {
                            colors: '#94a3b8',
                            fontSize: '11px',
                            fontWeight: 600
                        }
                    }
                },
                yaxis: {
                    title: {
                        text: 'Units Produced',
                        style: {
                            color: '#94a3b8',
                            fontSize: '11px',
                            fontWeight: 600
                        }
                    },
                    labels: {
                        style: {
                            colors: '#94a3b8',
                            fontSize: '11px',
                            fontWeight: 600
                        }
                    }
                },
                fill: { opacity: 1 },
                tooltip: {
                    theme: 'light',
                    y: {
                        formatter: function (val) {
                            return val + " units"
                        }
                    }
                },
                grid: {
                    borderColor: '#f1f5f9',
                    strokeDashArray: 4,
                    padding: { top: -20, right: 0, bottom: 0, left: 10 }
                },
                legend: {
                    position: 'top',
                    horizontalAlign: 'right',
                    fontSize: '11px',
                    fontFamily: 'Manrope',
                    fontWeight: 600,
                    labels: { colors: '#64748b' },
                    markers: { radius: 12 }
                }
            };

            var prodChart = new ApexCharts(document.querySelector("#productionAnalysisChart"), prodOptions);
            prodChart.render();

            // Initialize Flatpickr
            if (typeof flatpickr !== 'undefined') {
                flatpickr("#feedingDatePicker", {
                    dateFormat: "d-M-Y",
                    maxDate: "today",
                    defaultDate: "today",
                    disableMobile: "true"
                });
            }

            // Real-time Total Cost Calculation
            function calculateTotal() {
                const qty = parseFloat($('#feedingQty').val()) || 0;
                const cost = parseFloat($('#feedingCostPerKg').val()) || 0;
                const total = qty * cost;
                $('#totalCostDisplay').text(total.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 }));
            }

            // Populate Flocks
            function loadFeedingFlocks() {
                $.ajax({
                    url: base_path + 'controllers/poultryflockoperations.php?action=getflocks',
                    type: 'GET',
                    success: function(response) {
                        try {
                            const flocks = JSON.parse(response);
                            let html = '<option value="" disabled selected>Select flock...</option>';
                            flocks.forEach(f => {
                                if (f.status === 'Active') {
                                    html += `<option value="${f.flockno}">${f.flockno} (${f.birdtype} - ${f.stagename})</option>`;
                                }
                            });
                            $('#feeding_flock_id').html(html);
                        } catch (e) {
                            console.error("Flock Load Error:", e);
                        }
                    }
                });
            }

            // Populate Feed Items
            function loadFeedItems(category) {
                const action = category === 'ready' ? 'getfeeditems' : 'getformulations';
                $.ajax({
                    url: base_path + 'controllers/poultrysettingsoperations.php?action=' + action,
                    type: 'GET',
                    success: function(response) {
                        try {
                            const items = JSON.parse(response);
                            let html = `<option value="" disabled selected>Select ${category === 'ready' ? 'ready mix' : 'feed mix'}...</option>`;
                            items.forEach(i => {
                                const id = category === 'ready' ? i.itemid : i.formulationid;
                                const name = category === 'ready' ? i.itemname : i.formulationname;
                                html += `<option value="${id}">${name}</option>`;
                            });
                            $('#feeding_item_id').html(html);
                        } catch (e) {
                            console.error("Feed Load Error:", e);
                        }
                    }
                });
            }

            $(document).on('click', '.feed-type-toggle', function() {
                $('.feed-type-toggle').removeClass('active btn-primary text-white shadow-sm').addClass('text-emerald-800');
                $(this).addClass('active btn-primary text-white shadow-sm').removeClass('text-emerald-800');
                const type = $(this).data('type');
                $('#feed_category').val(type);
                loadFeedItems(type);
            });

            $('#addFeedModal').on('show.bs.modal', function() {
                loadFeedingFlocks();
                loadFeedItems($('#feed_category').val());
            });

            $('#feedingQty').on('input', calculateTotal);
        });
    </script>

    <!-- Add Feed Entry Modal -->
    <div class="modal fade" id="addFeedModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content rounded-3xl overflow-hidden shadow-2xl">
                <div class="modal-header border-0 p-4 pb-2">
                    <div class="w-100">
                        <h5 class="modal-title font-weight-bold text-dark mb-1" style="font-size: 18px;">Log Feed Entry</h5>
                        <p class="text-muted small mb-0 modal-header-desc">Record daily consumption for the active flock.</p>
                    </div>
                    <button type="button" class="close opacity-50 hover:opacity-100 transition-all" data-dismiss="modal" aria-label="Close" style="outline: none; margin-top: -10px;">
                        <span class="material-symbols-outlined">close</span>
                    </button>
                </div>
                <div class="modal-body p-4">
                    <form id="addFeedForm">
                        <div class="row">
                             <div class="col-md-6 mb-4">
                                <label class="text-uppercase font-weight-bold text-muted mb-2" style="font-size: 10px; letter-spacing: 0.05em;">Assigned Flock</label>
                                <select class="custom-form-input" id="feeding_flock_id" required>
                                    <option value="" disabled selected>Loading flocks...</option>
                                </select>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="text-uppercase font-weight-bold text-muted mb-2" style="font-size: 10px; letter-spacing: 0.05em;">Feed Source</label>
                                <div class="d-flex p-1 bg-emerald-50 rounded-xl border" style="border-color: var(--emerald-100) !important;">
                                    <button type="button" class="btn btn-sm flex-fill rounded-lg border-0 feed-type-toggle active btn-primary text-white shadow-sm" data-type="ready" style="font-size: 11px; padding: 6px;">Ready Mix</button>
                                    <button type="button" class="btn btn-sm flex-fill rounded-lg border-0 feed-type-toggle text-emerald-800" data-type="mix" style="font-size: 11px; padding: 6px;">Feed Mix</button>
                                </div>
                                <input type="hidden" id="feed_category" value="ready">
                            </div>
                            <div class="col-12 mb-4">
                                <label class="text-uppercase font-weight-bold text-muted mb-2" style="font-size: 10px; letter-spacing: 0.05em;">Select Feed Item</label>
                                <select class="custom-form-input" id="feeding_item_id" required>
                                    <option value="" disabled selected>Select feed...</option>
                                </select>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="text-uppercase font-weight-bold text-muted mb-2" style="font-size: 10px; letter-spacing: 0.05em;">Log Date</label>
                                <input type="text" id="feedingDatePicker" class="custom-form-input" placeholder="DD-MMM-YYYY" readonly required>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="text-uppercase font-weight-bold text-muted mb-2" style="font-size: 10px; letter-spacing: 0.05em;">Quantity (kg)</label>
                                <div class="position-relative">
                                    <input type="number" id="feedingQty" class="custom-form-input pr-5" placeholder="0.00" step="0.1" required>
                                    <span class="position-absolute text-muted font-weight-bold" style="right: 15px; top: 12px; font-size: 10px;">KG</span>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="text-uppercase font-weight-bold text-muted mb-2" style="font-size: 10px; letter-spacing: 0.05em;">Cost/Kg (KSh)</label>
                                <input type="number" id="feedingCostPerKg" class="custom-form-input bg-light" value="70.00" disabled>
                            </div>
                        </div>
                        
                        <div class="bg-emerald-50 rounded-2xl p-3 mb-4">
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="text-emerald-800 font-weight-bold small text-uppercase" style="letter-spacing: 0.02em;">Estimated Total Cost</span>
                                <h4 class="text-emerald-900 mb-0 font-weight-bold" style="font-size: 18px;">KSh <span id="totalCostDisplay">0.00</span></h4>
                            </div>
                        </div>

                        <div class="d-flex mt-2 justify-content-end">
                            <button type="button" class="btn btn-light rounded-xl px-4 py-2 text-muted border-0 mr-3 transition-all hover:bg-gray-100" style="font-size: 13px; width: 120px;" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary bg-primary-gradient border-0 rounded-xl px-4 py-2 shadow-sm transition-all hover:scale-105 active:scale-95" style="background-color: #206223 !important; font-size: 13px; width: 140px;">Save Record</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
