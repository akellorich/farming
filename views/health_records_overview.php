<?php
/**
 * Jukam Dairy Management System - Health Records Overview
 * File: views/health_records_overview.php
 */
$base_path = '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Records Overview | Jukam Farm</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/navigation.css">
    <link rel="stylesheet" href="../css/health.css">
    <link rel="stylesheet" href="../css/schedules.css">
    <link rel="stylesheet" href="../css/alert.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    
    <!-- DataTables Advanced Styles -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.4.0/css/responsive.bootstrap4.min.css"/>

    <style>
        .dt-buttons { gap: 0.75rem !important; display: flex; }
        .dt-button {
            padding: 0.45rem 1rem !important;
            border-radius: 0.4rem !important;
            font-size: 0.65rem !important;
            font-weight: 600 !important;
            border: 1px solid rgba(0,0,0,0.08) !important;
            background-color: white !important;
            color: var(--on-surface-variant) !important;
            transition: all 0.2s !important;
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            gap: 4px !important;
        }
        .pulse-indicator {
            width: 8px;
            height: 8px;
            background-color: var(--primary);
            border-radius: 50%;
            display: inline-block;
            margin-right: 6px;
            animation: pulse-green 2s infinite;
        }
        @keyframes pulse-green {
            0% { box-shadow: 0 0 0 0 rgba(32, 98, 35, 0.4); }
            70% { box-shadow: 0 0 0 10px rgba(32, 98, 35, 0); }
            100% { box-shadow: 0 0 0 0 rgba(32, 98, 35, 0); }
        }
        
        /* Dropdown Alignment Fix */
        .dropdown-menu-right {
            right: 0 !important;
            left: auto !important;
            transform: none !important;
            top: 100% !important;
            margin-top: 0.5rem !important;
        }
        .col-auto .dropdown {
            position: relative;
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
        <div class="container-fluid pt-1 px-4">
            <!-- Header Section -->
            <div class="row align-items-end mb-4 mt-2">
                <div class="col">
                    <h2 class="font-headline font-weight-bold text-on-surface mb-1 health-page-title">
                        Health Records
                    </h2>
                    <p class="text-muted mb-0 health-page-desc">Livestock wellness and clinical history for JUKAM Dairy</p>
                </div>
                <div class="col-auto">
                    <div class="dropdown">
                        <button class="btn btn-success d-flex align-items-center gap-2 px-4 shadow-sm dropdown-toggle no-caret" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background-color: #206223; border-radius: 0.5rem; font-size: 0.85rem; height: 42px; font-weight: 600;">
                            <span>Action</span>
                            <span class="material-symbols-outlined ml-2" style="font-size: 1.1rem; margin-top: 1px;">expand_more</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right botanical-shadow border-0" style="border-radius: 0.75rem; padding: 0.65rem; font-size: 0.85rem; min-width: 220px;">
                            <a class="dropdown-item d-flex align-items-center mb-1 py-2 px-3 rounded" href="javascript:void(0)" style="gap: 1rem;" id="btnLogHealthCheck">
                                <span class="material-symbols-outlined text-primary" style="font-size: 1.2rem;">medical_services</span> 
                                <span class="font-weight-medium">Log Health Check</span>
                            </a>
                            <a class="dropdown-item d-flex align-items-center mb-1 py-2 px-3 rounded" href="javascript:void(0)" style="gap: 1rem;" id="btnRecordVaccination">
                                <span class="material-symbols-outlined text-success" style="font-size: 1.2rem; font-variation-settings: 'FILL' 1;">shield_with_heart</span> 
                                <span class="font-weight-medium">Record Vaccination</span>
                            </a>
                            <a class="dropdown-item d-flex align-items-center mb-1 py-2 px-3 rounded" href="javascript:void(0)" style="gap: 1rem;" id="btnRecordDeworming">
                                <span class="material-symbols-outlined text-warning" style="font-size: 1.2rem; font-variation-settings: 'FILL' 1;">pill</span> 
                                <span class="font-weight-medium">Record Deworming</span>
                            </a>
                            <a class="dropdown-item d-flex align-items-center mb-1 py-2 px-3 rounded" href="schedules_overview.php" style="gap: 1rem;">
                                <span class="material-symbols-outlined text-success" style="font-size: 1.2rem;">event_available</span> 
                                <span class="font-weight-medium">Manage Schedule</span>
                            </a>
                            <div class="dropdown-divider my-2"></div>
                            <a class="dropdown-item d-flex align-items-center py-2 px-3 rounded" href="#" style="gap: 1rem;">
                                <span class="material-symbols-outlined text-warning" style="font-size: 1.2rem;">history</span> 
                                <span class="font-weight-medium">Veterinary Log</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Health Summary Grid -->
            <div class="health-header-grid">
                <div class="health-stat-card botanical-shadow">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <span class="material-symbols-outlined text-primary p-2 rounded-lg" style="background-color: rgba(32, 98, 35, 0.1);">medical_services</span>
                        <span class="text-muted font-weight-bold" style="font-size: 0.6rem; letter-spacing: 0.05rem; text-transform: uppercase;">Clinical</span>
                    </div>
                    <div>
                        <p class="text-muted mb-1" style="font-size: 0.75rem;">Active Treatments</p>
                        <h3 class="font-headline font-weight-bold mb-0" style="font-size: 1.5rem;">12 <small class="text-muted" style="font-size: 0.8rem;">animals</small></h3>
                    </div>
                </div>
                
                <div class="health-stat-card botanical-shadow">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <span class="material-symbols-outlined text-warning p-2 rounded-lg" style="background-color: rgba(255, 193, 7, 0.1);">vaccines</span>
                        <span class="text-muted font-weight-bold" style="font-size: 0.6rem; letter-spacing: 0.05rem; text-transform: uppercase;">Prevention</span>
                    </div>
                    <div>
                        <p class="text-muted mb-1" style="font-size: 0.75rem;">Vaccination Coverage</p>
                        <h3 class="font-headline font-weight-bold mb-0" style="font-size: 1.5rem;">98.2%</h3>
                    </div>
                </div>

                <div class="health-stat-card botanical-shadow">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <span class="material-symbols-outlined text-danger p-2 rounded-lg" style="background-color: rgba(186, 26, 26, 0.1);">emergency_home</span>
                        <span class="text-muted font-weight-bold" style="font-size: 0.6rem; letter-spacing: 0.05rem; text-transform: uppercase;">Quarantine</span>
                    </div>
                    <div>
                        <p class="text-muted mb-1" style="font-size: 0.75rem;">Quarantine Cases</p>
                        <h3 class="font-headline font-weight-bold mb-0" style="font-size: 1.5rem;">03 <small class="text-muted" style="font-size: 0.8rem;">animals</small></h3>
                    </div>
                </div>

                <div class="health-stat-card botanical-shadow">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <span class="material-symbols-outlined text-success p-2 rounded-lg" style="background-color: rgba(32, 98, 35, 0.1);">event</span>
                        <span class="text-muted font-weight-bold" style="font-size: 0.6rem; letter-spacing: 0.05rem; text-transform: uppercase;">Logistics</span>
                    </div>
                    <div>
                        <p class="text-muted mb-1" style="font-size: 0.75rem;">Next Vet Visit</p>
                        <h3 class="font-headline font-weight-bold mb-0" style="font-size: 1.35rem; color: #206223;">Oct 28, 2023</h3>
                    </div>
                </div>
            </div>

            <!-- Content Layout -->
            <div class="row">
                <!-- Left Column: Incidents Table -->
                <div class="col-lg-8">
                    <div class="health-table-card botanical-shadow mb-4">
                        <div class="d-flex justify-content-between align-items-center p-4 border-bottom">
                            <h5 class="font-headline font-weight-bold mb-0" style="font-size: 0.85rem;">Recent Health Incidents</h5>
                        </div>
                        
                        <!-- Table Filters -->
                        <div class="table-controls p-3 border-bottom d-flex flex-wrap align-items-center" style="gap: 1rem; background-color: rgba(244, 244, 239, 0.3);">
                            <div class="filter-label mr-2">
                                <span class="text-muted" style="font-size: 0.75rem; letter-spacing: 0.02rem;">Filter Options</span>
                            </div>
                            <div class="filter-item">
                                <select class="form-control form-control-sm border-0 botanical-shadow-sm px-3" id="animalFilter" style="border-radius: 0.5rem; height: 36px; font-size: 0.75rem; min-width: 130px; background-color: white;">
                                    <option value="">All Animals</option>
                                    <option value="JK-012">JK-012 (Daisy)</option>
                                    <option value="JK-045">JK-045 (Bessie)</option>
                                    <option value="JK-008">JK-008 (Luna)</option>
                                </select>
                            </div>
                            <div class="filter-item">
                                <select class="form-control form-control-sm border-0 botanical-shadow-sm px-3" id="conditionFilter" style="border-radius: 0.5rem; height: 36px; font-size: 0.75rem; min-width: 130px; background-color: white;">
                                    <option value="">All Conditions</option>
                                    <option value="Mastitis">Mastitis</option>
                                    <option value="Lameness">Lameness</option>
                                    <option value="Fever">Fever</option>
                                    <option value="Bloat">Bloat</option>
                                </select>
                            </div>
                            <div class="filter-item">
                                <select class="form-control form-control-sm border-0 botanical-shadow-sm px-3" id="dateRangeFilter" style="border-radius: 0.5rem; height: 36px; font-size: 0.75rem; min-width: 130px; background-color: white;">
                                    <option value="">All Dates</option>
                                    <option value="today">Today</option>
                                    <option value="7days">Past 7 Days</option>
                                    <option value="30days">Past 30 Days</option>
                                </select>
                            </div>
                            <div class="filter-item">
                                <select class="form-control form-control-sm border-0 botanical-shadow-sm px-3" id="statusFilter" style="border-radius: 0.5rem; height: 36px; font-size: 0.75rem; min-width: 130px; background-color: white;">
                                    <option value="">All Statuses</option>
                                    <option value="Recovering">Recovering</option>
                                    <option value="Completed">Completed</option>
                                </select>
                            </div>
                            <div class="filter-item">
                                <button class="btn btn-light d-flex align-items-center justify-content-center botanical-shadow-sm" id="refreshFilters" style="border-radius: 0.5rem; height: 36px; width: 36px; background-color: white; border: none;">
                                    <i class="fa fa-sync-alt text-primary" style="font-size: 0.9rem;"></i>
                                </button>
                            </div>
                            <div class="filter-item ml-md-auto">
                                <div class="position-relative">
                                    <span class="material-symbols-outlined position-absolute text-muted" style="left: 10px; top: 50%; transform: translateY(-50%); font-size: 1.1rem;">search</span>
                                    <input type="text" class="form-control form-control-sm border-0 botanical-shadow-sm" id="healthSearch" placeholder="Search..." style="border-radius: 0.5rem; height: 36px; padding-left: 35px; font-size: 0.75rem; width: 220px; background-color: white;">
                                </div>
                            </div>
                        </div>

                        <div class="p-0">
                            <table class="table health-table mb-0" id="healthDataTable">
                                <thead>
                                    <tr>
                                        <th>Animal ID</th>
                                        <th>Name</th>
                                        <th>Date</th>
                                        <th>Condition</th>
                                        <th>Treatment</th>
                                        <th>Status</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $incidents = [
                                        ['id' => 'JK-012', 'name' => 'Daisy', 'date' => 'Oct 14, 2023', 'cond' => 'Mastitis', 'treat' => 'Antibiotics Course', 'status' => 'Recovering', 'statusClass' => 'recovering'],
                                        ['id' => 'JK-045', 'name' => 'Bessie', 'date' => 'Oct 12, 2023', 'cond' => 'Lameness', 'treat' => 'Hoof Trimming', 'status' => 'Completed', 'statusClass' => 'completed'],
                                        ['id' => 'JK-008', 'name' => 'Luna', 'date' => 'Oct 10, 2023', 'cond' => 'Low Intake', 'treat' => 'Vitamin Boost', 'status' => 'Completed', 'statusClass' => 'completed'],
                                        ['id' => 'JK-021', 'name' => 'Goldie', 'date' => 'Oct 09, 2023', 'cond' => 'Fever', 'treat' => 'Isolation & Fluids', 'status' => 'Recovering', 'statusClass' => 'recovering'],
                                        ['id' => 'JK-099', 'name' => 'Molly', 'date' => 'Oct 05, 2023', 'cond' => 'Post-Natal Check', 'treat' => 'Routine Review', 'status' => 'Completed', 'statusClass' => 'completed'],
                                        ['id' => 'JK-015', 'name' => 'Spot', 'date' => 'Oct 04, 2023', 'cond' => 'Bloat', 'treat' => 'Anti-foaming agent', 'status' => 'Completed', 'statusClass' => 'completed'],
                                        ['id' => 'JK-033', 'name' => 'Ruby', 'date' => 'Oct 03, 2023', 'cond' => 'Foot Rot', 'treat' => 'Foot Bath Course', 'status' => 'Recovering', 'statusClass' => 'recovering'],
                                        ['id' => 'JK-102', 'name' => 'Pearl', 'date' => 'Oct 01, 2023', 'cond' => 'Eye Infection', 'treat' => 'Ointment Application', 'status' => 'Completed', 'statusClass' => 'completed'],
                                        ['id' => 'JK-056', 'name' => 'Snowy', 'date' => 'Sep 28, 2023', 'cond' => 'Low Yield', 'treat' => 'Nutritional Supplement', 'status' => 'Completed', 'statusClass' => 'completed'],
                                        ['id' => 'JK-077', 'name' => 'Shadow', 'date' => 'Sep 25, 2023', 'cond' => 'Dehydration', 'treat' => 'IV Electrolytes', 'status' => 'Recovering', 'statusClass' => 'recovering'],
                                    ];

                                    foreach ($incidents as $inc):
                                    ?>
                                    <tr>
                                        <td class="animal-code-cell"><?php echo $inc['id']; ?></td>
                                        <td><?php echo $inc['name']; ?></td>
                                        <td class="text-muted"><?php echo $inc['date']; ?></td>
                                        <td class="font-weight-medium"><?php echo $inc['cond']; ?></td>
                                        <td class="text-muted"><i><?php echo $inc['treat']; ?></i></td>
                                        <td><span class="health-status-badge status-<?php echo $inc['statusClass']; ?>"><?php echo $inc['status']; ?></span></td>
                                        <td class="text-right">
                                            <div class="actions-container">
                                                <button class="btn-action-more" onclick="toggleActionMenu(event, this)">
                                                    <span class="material-symbols-outlined">more_vert</span>
                                                </button>
                                                <div class="actions-dropdown botanical-shadow">
                                                    <button class="action-menu-item"><span class="material-symbols-outlined">visibility</span> View Record</button>
                                                    <button class="action-menu-item"><span class="material-symbols-outlined">edit</span> Edit Incident</button>
                                                    <div class="dropdown-divider my-1"></div>
                                                    <button class="action-menu-item text-danger"><span class="material-symbols-outlined">delete</span> Delete</button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <!-- Custom Pagination -->
                        <div class="d-flex justify-content-between align-items-center p-4 border-top">
                            <div id="pageInfo" class="text-muted small">Page 1 of 1</div>
                            <div class="custom-pagination d-flex" id="customPagination" style="gap: 0.75rem;">
                                <button class="pagination-arrow" id="prevPage">
                                    <span class="material-symbols-outlined">chevron_left</span>
                                </button>
                                <div id="numberButtons" class="d-flex" style="gap: 0.5rem;"></div>
                                <button class="pagination-arrow" id="nextPage">
                                    <span class="material-symbols-outlined">chevron_right</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Column: Alerts & Upcoming -->
                <div class="col-lg-4">
                    <!-- Critical Alerts Panel -->
                    <div class="alert-panel mb-4">
                        <div class="d-flex align-items-center mb-4" style="gap: 1rem;">
                            <span class="material-symbols-outlined text-danger" style="font-variation-settings: 'FILL' 1;">error</span>
                            <h5 class="font-headline font-weight-bold mb-0" style="font-size: 0.9rem;">Critical Alerts</h5>
                        </div>
                        <div class="alert-item-card botanical-shadow-sm">
                            <p class="text-danger font-weight-bold mb-1" style="font-size: 0.6rem; text-transform: uppercase;">Sudden Yield Drop</p>
                            <p class="font-weight-bold mb-1" style="font-size: 0.75rem;">Cows in Pen 4 (JK-015, JK-016)</p>
                            <p class="text-muted mb-0" style="font-size: 0.65rem;">Multiple animals showing 15% drop in morning yield. Possible environmental stress.</p>
                        </div>
                        <div class="alert-item-card botanical-shadow-sm">
                            <p class="text-warning font-weight-bold mb-1" style="font-size: 0.6rem; text-transform: uppercase; color: #854d0e !important;">Heat Observation</p>
                            <p class="font-weight-bold mb-1" style="font-size: 0.75rem;">Animal JK-022 (Pearl)</p>
                            <p class="text-muted mb-0" style="font-size: 0.65rem;">Activity sensors indicate peak estrus cycle. Schedule insemination.</p>
                        </div>
                    </div>

                    <!-- Upcoming Panel -->
                    <div class="upcoming-card botanical-shadow">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h5 class="font-headline font-weight-bold mb-0" style="font-size: 0.9rem;">Upcoming</h5>
                            <span class="material-symbols-outlined text-muted" style="font-size: 1.1rem;">notifications_active</span>
                        </div>
                        <div class="space-y-4">
                            <!-- Vaccination -->
                            <div class="d-flex align-items-start gap-4 pb-3 border-bottom mb-3">
                                <div class="calendar-date-box date-box-active">
                                    <span class="d-block font-weight-bold" style="font-size: 0.55rem; text-transform: uppercase;">Oct</span>
                                    <span class="d-block font-weight-black" style="font-size: 1.1rem;">19</span>
                                </div>
                                <div class="pl-2">
                                    <p class="font-weight-bold mb-0" style="font-size: 0.75rem;">FMD & LSD Vaccination</p>
                                    <p class="text-muted mb-0" style="font-size: 0.65rem;">Herd B - 42 Animals</p>
                                </div>
                            </div>
                            <!-- Deworming -->
                            <div class="d-flex align-items-start gap-4 pb-3 border-bottom mb-3">
                                <div class="calendar-date-box date-box-muted">
                                    <span class="d-block font-weight-bold" style="font-size: 0.55rem; text-transform: uppercase;">Oct</span>
                                    <span class="d-block font-weight-black" style="font-size: 1.1rem;">22</span>
                                </div>
                                <div class="pl-2">
                                    <p class="font-weight-bold mb-0" style="font-size: 0.75rem;">Deworming Schedule</p>
                                    <p class="text-muted mb-0" style="font-size: 0.65rem;">Calves Group - 18 Animals</p>
                                </div>
                            </div>
                            <!-- Vet Visit -->
                            <div class="d-flex align-items-start gap-4">
                                <div class="calendar-date-box date-box-muted">
                                    <span class="d-block font-weight-bold" style="font-size: 0.55rem; text-transform: uppercase;">Oct</span>
                                    <span class="d-block font-weight-black" style="font-size: 1.1rem;">28</span>
                                </div>
                                <div class="pl-2">
                                    <p class="font-weight-bold mb-0" style="font-size: 0.75rem;">Annual Vet Inspection</p>
                                    <p class="text-muted mb-0" style="font-size: 0.65rem;">Full Site Review - Dr. Miller</p>
                                </div>
                            </div>
                        </div>
                        <button onclick="window.location.href='schedules_overview.php'" class="btn btn-outline-success w-100 my-4 font-weight-bold" style="border-radius: 0.5rem; font-size: 0.85rem; border-color: rgba(32, 98, 35, 0.2); color: #206223;">
                            Manage Schedule
                        </button>
                    </div>
                </div>
            </div>
        </div>

    </main>

    <!-- Log Health Record Modal (Localized to Health Module) -->
    <div id="healthRecordModal" class="modal-overlay">
        <div class="health-modal-container">
            <!-- Left Panel: Visual Branding -->
            <div class="modal-side-panel">
                <button type="button" class="btn-close-modal d-md-none" id="closeHealthModalMobile" style="position: absolute; top: 1rem; right: 1rem; background: rgba(255,255,255,0.2); border: none; width: 32px; height: 32px; border-radius: 50%; display: flex; align-items: center; justify-content: center; z-index: 10; color: white;">
                    <span class="material-symbols-outlined" style="font-size: 1.15rem;">close</span>
                </button>
                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDdrMoDI1Eftc1HPLu4Lyz5Sk0AzP4FnjpJXuvIbgfODkvciccmZLXbh8t9eYl-GH9pBnfZDcUuxM8aRG5wOheOELRl-ANyvsk7jMwEaLi67eRVewE7CC6iXTUFeDT1BZGuSrio7tkKL_xgvsRuQs11XnTUNjxOhzo5Oh6LdqLAqgqDPy8Q7wHnwwwI3slf7jsIlV1nRKJZJB7PKlioyRwgfsUcwQxAzElN-szGDl_BYL7eo5UAtr4fgtvGI1CV1KwyfhTMwSYI4_Jv" alt="Veterinary care" class="modal-side-panel-img">
                <div style="position: relative; z-index: 1;">
                    <div class="d-flex align-items-center mb-2">
                        <span class="material-symbols-outlined mr-2" style="font-size: 1.75rem; font-variation-settings: 'FILL' 1;">medical_services</span>
                        <h2 class="font-headline font-weight-bold mb-0" style="font-size: 1.2rem; line-height: 1.2;">New Health Record</h2>
                    </div>
                    <p style="font-size: 0.75rem; opacity: 0.8; margin-bottom: 0;">Document treatments and monitor herd vitality.</p>
                </div>
            </div>

            <!-- Right Panel: Form Content -->
            <div class="modal-form-area">
                <div class="d-none d-md-flex justify-content-between align-items-start mb-4">
                    <div>
                        <h3 style="font-size: 0.65rem; font-weight: 700; text-transform: uppercase; letter-spacing: 0.15em; color: var(--secondary); margin-bottom: 0.25rem;">Health Log Details</h3>
                        <p class="text-muted" style="font-size: 0.8rem; margin-bottom: 0;">Please provide clinical details for this entry.</p>
                    </div>
                    <button type="button" class="btn-close-modal" id="closeHealthModal" style="background: none; border: none; padding: 0.5rem; border-radius: 50%; display: flex; align-items: center; justify-content: center; transition: background 0.2s; margin-top: -0.75rem;">
                        <span class="material-symbols-outlined text-muted" style="font-size: 1.25rem;">close</span>
                    </button>
                </div>

                <form id="healthLogForm" class="mt-2 mt-md-4">
                    <!-- Notification Section -->
                    <div id="healthModalAlert" class="mb-4" style="display: none;"></div>

                    <!-- Animal Selection -->
                    <div class="mb-4 text-left">
                        <label class="form-label-caps">Select Animal From Herd...</label>
                        <div class="position-relative">
                            <select id="animalid" name="animalid" class="modal-input no-caret" style="appearance: none; -webkit-appearance: none;">
                                <option value="" disabled selected>Choose an animal</option>
                            </select>
                            <span class="material-symbols-outlined text-muted" style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); pointer-events: none; font-size: 1.15rem;">expand_more</span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Disease or Condition -->
                            <div class="mb-4 text-left">
                                <label class="form-label-caps">Disease Or Condition</label>
                                <div class="position-relative">
                                    <select id="diseaseid" name="diseaseid" class="modal-input no-caret" style="appearance: none; -webkit-appearance: none;">
                                        <option value="" disabled selected>Select disease...</option>
                                    </select>
                                    <span class="material-symbols-outlined text-muted" style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); pointer-events: none; font-size: 1.15rem;">expand_more</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Veterinarian -->
                            <div class="mb-4 text-left">
                                <label class="form-label-caps">Attending Veterinarian</label>
                                <div class="position-relative">
                                    <select id="veterinarianid" name="veterinarianid" class="modal-input no-caret" style="appearance: none; -webkit-appearance: none;">
                                        <option value="" disabled selected>Select veterinarian...</option>
                                    </select>
                                    <span class="material-symbols-outlined text-muted" style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); pointer-events: none; font-size: 1.15rem;">expand_more</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <!-- Date -->
                            <div class="mb-4 text-left">
                                <label class="form-label-caps">Check Date</label>
                                <div class="position-relative">
                                    <input type="text" id="logdate" name="logdate" class="modal-input" value="<?php echo date('d-M-Y'); ?>" readonly style="padding-right: 2.5rem;">
                                    <span class="material-symbols-outlined text-muted" style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); pointer-events: none; font-size: 1.15rem;">calendar_today</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <!-- Next Followup -->
                            <div class="mb-4 text-left">
                                <label class="form-label-caps">Next Follow-up Date</label>
                                <div class="position-relative">
                                    <input type="text" id="nextfollowup" name="nextfollowup" class="modal-input v_datepicker" placeholder="Optional followup..." readonly style="padding-right: 2.5rem;">
                                    <span class="material-symbols-outlined text-muted" style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); pointer-events: none; font-size: 1.15rem;">event</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Diagnosis / Narration -->
                    <div class="mb-4 text-left">
                        <label class="form-label-caps">Diagnosis / Disease Narration</label>
                        <input type="text" id="diagnosis" name="diagnosis" class="modal-input" placeholder="e.g., Early stage, chronic, etc.">
                    </div>

                    <!-- Medication Administered -->
                    <div class="mb-4 text-left">
                        <label class="form-label-caps">Medication Administered</label>
                        <input type="text" id="treatment" name="treatment" class="modal-input" placeholder="Enter dosage and medication name...">
                    </div>

                    <!-- Treatment Response / Prognosis -->
                    <div class="mb-4 text-left">
                        <label class="form-label-caps">Treatment Response / Prognosis (Narration)</label>
                        <textarea id="narration" name="narration" class="modal-input" style="height: 80px; resize: none; border-radius: 0.75rem;" placeholder="Describe the current state and expected recovery timeline..."></textarea>
                    </div>

                    <!-- Status Selection Chips -->
                    <div class="mb-5 text-left">
                        <label class="form-label-caps">Status</label>
                        <div class="status-chip-grid">
                            <label class="status-chip mb-0">
                                <input type="radio" name="status" value="Recovering" checked>
                                <div class="status-chip-content">
                                    <span class="material-symbols-outlined" style="font-size: 1rem; font-variation-settings: 'FILL' 1;">sync</span>
                                    Recovering
                                </div>
                                <div class="status-chip-border"></div>
                            </label>
                            <label class="status-chip mb-0">
                                <input type="radio" name="status" value="Completed">
                                <div class="status-chip-content">
                                    <span class="material-symbols-outlined" style="font-size: 1rem;">check_circle</span>
                                    Completed
                                </div>
                                <div class="status-chip-border"></div>
                            </label>
                            <label class="status-chip mb-0">
                                <input type="radio" name="status" value="Quarantined">
                                <div class="status-chip-content">
                                    <span class="material-symbols-outlined" style="font-size: 1rem;">emergency_home</span>
                                    Quarantined
                                </div>
                                <div class="status-chip-border"></div>
                            </label>
                        </div>
                    </div>

                    <!-- Footer Actions -->
                    <div class="pt-4 border-top d-flex gap-3 justify-content-end">
                        <button type="button" class="btn" id="cancelHealthModal" style="border-radius: 0.5rem; font-weight: 500; font-size: 0.75rem; height: 40px; color: #64748b; border: 1px solid #e2e8f0; width: 120px;">Cancel</button>
                        <button type="submit" class="btn btn-success" id="btnSaveHealthRecord" style="border-radius: 0.5rem; font-weight: 400; font-size: 0.75rem; height: 40px; background-color: var(--primary); border: none; box-shadow: 0 4px 12px rgba(32, 98, 35, 0.15); width: 160px; margin-left: 0.75rem;">Save Record</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Global Scripts -->
    <script src="../plugins/jquery-3.6.1.js"></script>
    <script src="../plugins/jquery-ui.js"></script>
    <script src="../plugins/popper.js"></script>
    <script src="../plugins/bootstrap.js"></script>
    <script src="../plugins/alert.js"></script>
    <script src="../js/functions.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.4.0/js/responsive.bootstrap4.min.js"></script>
    <script src="../js/header.js"></script>
    <script src="../js/health.js"></script>

    <?php include 'modals.php'; ?>

    <!-- Record Vaccination Activity Modal -->
    <div id="recordVaccinationModal" class="v-modal-overlay" style="display: none; align-items: center; justify-content: center; backdrop-filter: blur(12px); background-color: rgba(0, 0, 0, 0.4);">
        <div class="v-modal-wrapper">
            <div class="v-modal-container botanical-shadow-lg" style="max-width: 1000px; height: auto; min-height: 600px; background: white; border-radius: 1.5rem; overflow: hidden; display: flex;">
                
                <!-- Left Sidebar (Botanical Brand) -->
                <div class="v-modal-sidebar d-none d-lg-flex" style="width: 300px; background: #166534; color: white; position: relative; padding: 2.5rem 1.25rem; display: flex; flex-direction: column; justify-content: flex-end;">
                    <div class="v-modal-sidebar-bg" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; opacity: 0.25; mix-blend-mode: overlay;">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDFARTsU3dpTtLaqQZZWEzRoQsVTkW2LZYB78FAfz1SBY2W6OIBOldnQliXBIvhRWjAbBhtqw7NZHEF59yxTxZCQkYUl1-1ybbRJQ-UsMRllbSjF9hXSN-c_-rfVCVw_jGbNz67Djy2XtM6bpN-wPhESOQ01sZzn10eHyURHljP_wLaZ0XVyLJw4ExQIEezXyPQRxcHQBoZy5MpYH9h9bkoD98IbLlQpRDyG9x854G4NFV2ze3uhSAN_Kgj7uDSZBnHHexFESZe113y" alt="Botanical Pattern" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                    
                    <div class="v-modal-sidebar-content" style="position: relative; z-index: 1;">
                        <div class="d-flex align-items-center gap-2 mb-2">
                            <span class="material-symbols-outlined" style="font-size: 2rem; font-variation-settings: 'FILL' 1;">shield_with_heart</span>
                            <h2 class="font-headline font-weight-bold mb-0" style="font-size: 1.25rem; line-height: 1.2;">Log Execution</h2>
                        </div>
                        <p class="small mb-0" style="opacity: 0.8; font-size: 0.8rem;">Ensure the vitality of your herd through precise, proactive healthcare documentation.</p>
                        
                        <div class="mt-4">
                            <div class="v-modal-badge" style="background: rgba(255,255,255,0.15); border-radius: 999px; padding: 0.4rem 0.8rem; display: inline-flex; align-items: center; gap: 0.5rem;">
                                <div class="v-modal-dot" style="width: 6px; height: 6px; background: #fbbf24; border-radius: 50%;"></div>
                                <p class="v-modal-badge-text mb-0" style="font-size: 0.65rem; text-transform: uppercase; font-weight: 800; letter-spacing: 0.1em;">Vaccination Protocol</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Side (Form) -->
                <div class="v-modal-form-area position-relative" style="flex: 1; padding: 3rem 2rem; background: #fafafa; overflow-y: auto; max-height: 90vh;">
                    <!-- Close Button -->
                    <button type="button" class="close-modal-btn position-absolute" style="top: 1.5rem; right: 1.5rem; border: none; background: transparent; color: #94a3b8; transition: color 0.2s;">
                        <span class="material-symbols-outlined" style="font-size: 1.5rem;">close</span>
                    </button>

                    <!-- Header -->
                    <div class="mb-4">
                        <h2 class="font-headline font-weight-bold" style="font-size: 1.5rem; color: #166534; margin-bottom: 0.25rem;">Vaccination Execution Log</h2>
                        <p class="text-muted small">Fill in the details for the routine medical administration.</p>
                    </div>

                    <form id="recordVaccinationForm" novalidate>
                        <input type="hidden" name="action" value="recordvaccination">

                        <div id="rv_alert_container" class="mb-4 d-none"></div>

                        <div class="row">
                            <!-- Date and Administered By -->
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2" style="font-size: 0.85rem; font-weight: 500;">Vaccination Date</label>
                                <div class="v-input-wrapper">
                                    <input type="text" name="execution_date" id="rv_date" class="form-control v-form-control v_datepicker" placeholder="DD-MMM-YYYY" required style="background-color: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; padding: 0.85rem 1rem; height: auto;">
                                    <span class="material-symbols-outlined" style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); color: #94a3b8; font-size: 1.2rem;">calendar_today</span>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2" style="font-size: 0.85rem; font-weight: 500;">Administered By</label>
                                <div class="v-input-wrapper">
                                    <select name="administered_by" id="rv_administered_by" class="form-control v-form-control" required style="background-color: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; padding: 0.85rem 1rem; height: auto; appearance: none;">
                                    </select>
                                    <span class="material-symbols-outlined" style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); color: #94a3b8; pointer-events: none;">expand_more</span>
                                </div>
                            </div>

                            <!-- Execution Type and Select Schedule -->
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2" style="font-size: 0.85rem; font-weight: 500;">Execution Type</label>
                                <div class="d-flex p-1" style="background: #f1f5f9; border-radius: 0.75rem; border: 1px solid #e2e8f0;">
                                    <label class="flex-fill mb-0 text-center py-2 rounded-lg cursor-pointer transition-all rv-type-label active" style="font-size: 0.85rem; font-weight: 500; cursor: pointer;">
                                        <input type="radio" name="record_type" value="Routine" checked class="d-none">
                                        <span class="rv-type-text">Routine</span>
                                    </label>
                                    <label class="flex-fill mb-0 text-center py-2 rounded-lg cursor-pointer transition-all rv-type-label" style="font-size: 0.85rem; font-weight: 500; cursor: pointer; color: #64748b;">
                                        <input type="radio" name="record_type" value="Scheduled" class="d-none">
                                        <span class="rv-type-text">Scheduled</span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2" style="font-size: 0.85rem; font-weight: 500;">Select Schedule</label>
                                <div class="v-input-wrapper">
                                    <select name="scheduleid" id="rv_scheduleid" class="form-control v-form-control" style="background-color: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; padding: 0.85rem 1rem; height: auto; appearance: none;" disabled>
                                        <option value="0">Choose from schedules...</option>
                                    </select>
                                    <span class="material-symbols-outlined" style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); color: #94a3b8; pointer-events: none;">expand_more</span>
                                </div>
                            </div>

                            <!-- Vaccine Name and Batch -->
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2" style="font-size: 0.85rem; font-weight: 500;">Vaccine / Product Name</label>
                                <input type="text" name="product_used" id="rv_product" class="form-control v-form-control" placeholder="e.g. Aftovax, LumpyVax" required style="background-color: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; padding: 0.85rem 1rem; height: auto;">
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2" style="font-size: 0.85rem; font-weight: 500;">Batch / Lot Number</label>
                                <input type="text" name="batch_no" id="rv_batch" class="form-control v-form-control" placeholder="e.g. BN-2024-X1" style="background-color: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; padding: 0.85rem 1rem; height: auto;">
                            </div>

                            <!-- Dosage -->
                            <div class="col-12 mb-4">
                                <label class="font-label text-muted d-block mb-2" style="font-size: 0.85rem; font-weight: 500;">Dosage (per animal)</label>
                                <input type="text" name="dosage" id="rv_dosage" class="form-control v-form-control" placeholder="e.g. 2ml" style="background-color: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; padding: 0.85rem 1rem; height: auto;">
                            </div>
                        </div>

                        <!-- Animal Checklist -->
                        <div class="mt-0">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="font-weight-bold" style="font-size: 0.75rem; color: #166534; text-transform: uppercase; letter-spacing: 0.05em;">ANIMAL CHECKLIST</span>
                                <div class="custom-control custom-checkbox d-flex align-items-center gap-1">
                                    <input type="checkbox" class="custom-control-input" id="rv_selectAll" checked>
                                    <label class="custom-control-label small font-weight-500 text-muted" for="rv_selectAll" style="cursor: pointer;">Select All</label>
                                </div>
                            </div>
                            <div style="background: #f1f5f9; border-radius: 1rem; border: 1px solid #e2e8f0; padding: 0.75rem;">
                                <div id="rv_animal_list" class="row gx-1 gy-2" style="max-height: 280px; overflow-y: auto; overflow-x: hidden; scrollbar-width: thin;">
                                    <div class="col text-center py-4 text-muted small w-100">Loading animals...</div>
                                </div>
                            </div>
                        </div>

                        <!-- Footer -->
                        <div class="d-flex justify-content-end align-items-center mt-5 gap-4">
                            <button type="button" class="btn btn-outline-secondary close-modal-btn" style="height: 44px; border-radius: 0.75rem; padding-left: 2rem; padding-right: 2rem; font-weight: 600; border: 1px solid #e2e8f0; color: #64748b; background: white; font-size: 0.85rem;">
                                Cancel
                            </button>
                            <button type="submit" class="btn btn-success v-btn-save shadow-sm" style="height: 44px; border-radius: 0.75rem; padding-left: 2.5rem; padding-right: 2.5rem; font-weight: 600; background: #166534; border: none; font-size: 0.85rem; margin-left: 1rem;">
                                Save Vaccination
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Manrope:wght@200..800&display=swap');
        
        #recordVaccinationModal, #recordDewormingModal {
            font-family: 'Manrope', sans-serif !important;
        }

        .rv-type-label.active {
            background: white;
            color: #166534;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        .rv-type-label {
            transition: all 0.2s ease;
        }
        .animal-check-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 0.75rem;
            padding: 0.65rem 0.85rem;
            display: flex;
            align-items: center;
            transition: all 0.2s;
            margin-bottom: 0.5rem; /* Reduced bottom margin */
        }
        .animal-check-card:hover {
            border-color: #166534;
            background: #f0fdf4;
        }
        .animal-check-card .custom-checkbox {
            margin-right: 0.25rem; /* Reduced gap between checkbox and details */
        }
        /* Style for the select all area */
        .custom-control-label.small {
            padding-left: 0.75rem !important; /* Reduced space between checkbox and label */
        }
        /* Reduce font size for form controls */
        #recordVaccinationModal .form-control, 
        #recordDewormingModal .form-control {
            font-size: 0.85rem !important;
        }
        #recordVaccinationModal .rv-type-text,
        #recordDewormingModal .rd-type-text {
            font-size: 0.8rem;
        }
        /* Reduce vertical margins for form groups */
        #recordVaccinationModal .mb-4, 
        #recordDewormingModal .mb-4 {
            margin-bottom: 0.85rem !important; /* Reduced from default mb-4 */
        }
        #recordVaccinationModal .font-label,
        #recordDewormingModal .font-label {
            margin-bottom: 0.25rem !important; /* Reduced label gap */
        }
    </style>

    <!-- Record Deworming Activity Modal -->
    <div id="recordDewormingModal" class="v-modal-overlay" style="display: none; align-items: center; justify-content: center; backdrop-filter: blur(12px); background-color: rgba(0, 0, 0, 0.4);">
        <div class="v-modal-wrapper">
            <div class="v-modal-container botanical-shadow-lg" style="max-width: 1000px; height: auto; min-height: 600px; background: white; border-radius: 1.5rem; overflow: hidden; display: flex;">
                
                <!-- Left Sidebar (Botanical Brand) -->
                <div class="v-modal-sidebar d-none d-lg-flex" style="width: 300px; background: #d97706; color: white; position: relative; padding: 2.5rem 1.25rem; display: flex; flex-direction: column; justify-content: flex-end;">
                    <div class="v-modal-sidebar-bg" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; opacity: 0.25; mix-blend-mode: overlay;">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDFARTsU3dpTtLaqQZZWEzRoQsVTkW2LZYB78FAfz1SBY2W6OIBOldnQliXBIvhRWjAbBhtqw7NZHEF59yxTxZCQkYUl1-1ybbRJQ-UsMRllbSjF9hXSN-c_-rfVCVw_jGbNz67Djy2XtM6bpN-wPhESOQ01sZzn10eHyURHljP_wLaZ0XVyLJw4ExQIEezXyPQRxcHQBoZy5MpYH9h9bkoD98IbLlQpRDyG9x854G4NFV2ze3uhSAN_Kgj7uDSZBnHHexFESZe113y" alt="Botanical Pattern" style="width: 100%; height: 100%; object-fit: cover;">
                    </div>
                    
                    <div class="v-modal-sidebar-content" style="position: relative; z-index: 1;">
                        <div class="d-flex align-items-center gap-2 mb-2">
                            <span class="material-symbols-outlined" style="font-size: 2rem; font-variation-settings: 'FILL' 1;">pill</span>
                            <h2 class="font-headline font-weight-bold mb-0" style="font-size: 1.25rem; line-height: 1.2;">Log Treatment</h2>
                        </div>
                        <p class="small mb-0" style="opacity: 0.8; font-size: 0.8rem;">Track and manage parasite control protocols for a healthy and productive herd.</p>
                        
                        <div class="mt-4">
                            <div class="v-modal-badge" style="background: rgba(255,255,255,0.15); border-radius: 999px; padding: 0.4rem 0.8rem; display: inline-flex; align-items: center; gap: 0.5rem;">
                                <div class="v-modal-dot" style="width: 6px; height: 6px; background: #fef3c7; border-radius: 50%;"></div>
                                <p class="v-modal-badge-text mb-0" style="font-size: 0.65rem; text-transform: uppercase; font-weight: 800; letter-spacing: 0.1em;">Deworming Protocol</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Side (Form) -->
                <div class="v-modal-form-area position-relative" style="flex: 1; padding: 3rem 2rem; background: #fafafa; overflow-y: auto; max-height: 90vh;">
                    <!-- Close Button -->
                    <button type="button" class="close-modal-btn position-absolute" style="top: 1.5rem; right: 1.5rem; border: none; background: transparent; color: #94a3b8; transition: color 0.2s;">
                        <span class="material-symbols-outlined" style="font-size: 1.5rem;">close</span>
                    </button>

                    <!-- Header -->
                    <div class="mb-4">
                        <h2 class="font-headline font-weight-bold" style="font-size: 1.5rem; color: #d97706; margin-bottom: 0.25rem;">Deworming Execution Log</h2>
                        <p class="text-muted small">Fill in the details for the routine medical administration.</p>
                    </div>

                    <form id="recordDewormingForm" novalidate>
                        <input type="hidden" name="action" value="recorddeworming">

                        <div id="rd_alert_container" class="mb-4 d-none"></div>

                        <div class="row">
                            <!-- Date and Administered By -->
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2" style="font-size: 0.85rem; font-weight: 500;">Deworming Date</label>
                                <div class="v-input-wrapper">
                                    <input type="text" name="execution_date" id="rd_date" class="form-control v-form-control v_datepicker" placeholder="DD-MMM-YYYY" required style="background-color: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; padding: 0.85rem 1rem; height: auto;">
                                    <span class="material-symbols-outlined" style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); color: #94a3b8; font-size: 1.2rem;">calendar_today</span>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2" style="font-size: 0.85rem; font-weight: 500;">Administered By</label>
                                <div class="v-input-wrapper">
                                    <select name="administered_by" id="rd_administered_by" class="form-control v-form-control" required style="background-color: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; padding: 0.85rem 1rem; height: auto; appearance: none;">
                                    </select>
                                    <span class="material-symbols-outlined" style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); color: #94a3b8; pointer-events: none;">expand_more</span>
                                </div>
                            </div>

                            <!-- Execution Type and Select Schedule -->
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2" style="font-size: 0.85rem; font-weight: 500;">Execution Type</label>
                                <div class="d-flex p-1" style="background: #f1f5f9; border-radius: 0.75rem; border: 1px solid #e2e8f0;">
                                    <label class="flex-fill mb-0 text-center py-2 rounded-lg cursor-pointer transition-all rd-type-label active" style="font-size: 0.85rem; font-weight: 500; cursor: pointer;">
                                        <input type="radio" name="record_type" value="Routine" checked class="d-none">
                                        <span class="rd-type-text">Routine</span>
                                    </label>
                                    <label class="flex-fill mb-0 text-center py-2 rounded-lg cursor-pointer transition-all rd-type-label" style="font-size: 0.85rem; font-weight: 500; cursor: pointer; color: #64748b;">
                                        <input type="radio" name="record_type" value="Scheduled" class="d-none">
                                        <span class="rd-type-text">Scheduled</span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2" style="font-size: 0.85rem; font-weight: 500;">Select Schedule</label>
                                <div class="v-input-wrapper">
                                    <select name="scheduleid" id="rd_scheduleid" class="form-control v-form-control" style="background-color: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; padding: 0.85rem 1rem; height: auto; appearance: none;" disabled>
                                        <option value="0">Choose from schedules...</option>
                                    </select>
                                    <span class="material-symbols-outlined" style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); color: #94a3b8; pointer-events: none;">expand_more</span>
                                </div>
                            </div>

                            <!-- Product Name and Method -->
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2" style="font-size: 0.85rem; font-weight: 500;">Dewormer / Product Name</label>
                                <input type="text" name="product_used" id="rd_product" class="form-control v-form-control" placeholder="e.g. Albendazole 10%, Ivermectin" required style="background-color: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; padding: 0.85rem 1rem; height: auto;">
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2" style="font-size: 0.85rem; font-weight: 500;">Method of Administration</label>
                                <div class="v-input-wrapper">
                                    <select name="method" id="rd_method" class="form-control v-form-control" style="background-color: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; padding: 0.85rem 1rem; height: auto; appearance: none;">
                                        <option value="Oral Drench">Oral Drench</option>
                                        <option value="Subcutaneous Injection">Subcutaneous Injection</option>
                                        <option value="Intramuscular Injection">Intramuscular Injection</option>
                                        <option value="Topical / Pour-on">Topical / Pour-on</option>
                                    </select>
                                    <span class="material-symbols-outlined" style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); color: #94a3b8; pointer-events: none;">expand_more</span>
                                </div>
                            </div>

                            <!-- Dosage -->
                            <div class="col-12 mb-4">
                                <label class="font-label text-muted d-block mb-2" style="font-size: 0.85rem; font-weight: 500;">Dosage (per animal)</label>
                                <input type="text" name="dosage" id="rd_dosage" class="form-control v-form-control" placeholder="e.g. 50ml" style="background-color: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; padding: 0.85rem 1rem; height: auto;">
                            </div>
                        </div>

                        <!-- Animal Checklist -->
                        <div class="mt-0">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <span class="font-weight-bold" style="font-size: 0.75rem; color: #d97706; text-transform: uppercase; letter-spacing: 0.05em;">ANIMAL CHECKLIST</span>
                                <div class="custom-control custom-checkbox d-flex align-items-center gap-1">
                                    <input type="checkbox" class="custom-control-input" id="rd_selectAll" checked>
                                    <label class="custom-control-label small font-weight-500 text-muted" for="rd_selectAll" style="cursor: pointer;">Select All</label>
                                </div>
                            </div>
                            <div style="background: #fffcf5; border-radius: 1rem; border: 1px solid #fef3c7; padding: 0.75rem;">
                                <div id="rd_animal_list" class="row gx-1 gy-2" style="max-height: 280px; overflow-y: auto; overflow-x: hidden; scrollbar-width: thin;">
                                    <div class="col text-center py-4 text-muted small w-100">Loading animals...</div>
                                </div>
                            </div>
                        </div>

                        <!-- Footer -->
                        <div class="d-flex justify-content-end align-items-center mt-5 gap-4">
                            <button type="button" class="btn btn-outline-secondary close-modal-btn" style="height: 44px; border-radius: 0.75rem; padding-left: 2rem; padding-right: 2rem; font-weight: 600; border: 1px solid #e2e8f0; color: #64748b; background: white; font-size: 0.85rem;">
                                Cancel
                            </button>
                            <button type="submit" class="btn btn-warning v-btn-save shadow-sm text-white" style="height: 44px; border-radius: 0.75rem; padding-left: 2.5rem; padding-right: 2.5rem; font-weight: 600; background: #d97706; border: none; font-size: 0.85rem; margin-left: 1rem;">
                                Save Deworming
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <style>
        .rd-type-label.active {
            background: white;
            color: #d97706;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }
        .rd-type-label {
            transition: all 0.2s ease;
        }
    </style>
</body>
</html>
