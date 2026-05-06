<?php
// schedules_overview.php
$base_path = '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schedules Management - JUKAM Dairy</title>
    
    <!-- Global System Assets -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/navigation.css">
    <link rel="stylesheet" href="../css/alert.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    <link rel="stylesheet" href="../css/schedules.css">
    
    <style>
        .no-caret::after { display: none !important; }
        .font-label { font-size: 0.95rem !important; text-transform: none !important; font-weight: 400 !important; }
        .v-modal-title { font-size: 1.15rem !important; white-space: nowrap !important; }
        .repeat-annually-container { border-radius: 0.75rem !important; }
    </style>
</head>
<body class="bg-background">

    <!-- Modular Sidebar -->
    <?php include 'navigation.php'; ?>

    <!-- Modular Header -->
    <?php include 'header.php'; ?>

    <!-- Main Content Area -->
    <main class="main-content">
        <div class="container-fluid pt-2 px-4">
            
            <!-- Page Header Section -->
            <div class="row align-items-center mb-3 mt-2">
                <div class="col">
                    <div class="d-flex align-items-center gap-3 mb-2 header-section-container">
                        <a href="health_records_overview.php" class="btn-back-circle text-success hover-scale" title="Back to Health Overview">
                            <i class="fas fa-arrow-left" style="font-size: 1.1rem;"></i>
                        </a>
                        <h2 class="font-headline font-weight-bold text-on-surface mb-0 schedules-page-title" style="line-height: 1;">
                            Active Rosters
                        </h2>
                    </div>
                    <p class="text-muted small mb-0 font-body page-description">Manage and track vaccination and deworming protocols for the entire herd.</p>
                </div>
                <div class="col-auto">
                    <button class="btn btn-success shadow-sm d-flex align-items-center gap-2 px-4" id="addNewBtn" style="border-radius: 0.75rem; height: 48px; font-weight: 500; background-color: var(--primary); border: none;">
                        <i class="fal fa-plus mr-1" style="font-size: 1rem;"></i>
                        <span>Create Schedule</span>
                    </button>
                </div>
            </div>

            <!-- Stats Overview Cards -->
            <div class="row mb-4">
                <div class="col-12">
                    <div class="d-flex gap-4">
                        <div class="stat-card-wide" style="background-color: var(--tertiary-fixed); flex: 1;">
                            <div class="stat-icon-wrapper" style="background-color: var(--on-tertiary-fixed); color: var(--tertiary-fixed);">
                                <i class="fas fa-check-double"></i>
                            </div>
                            <div>
                                <p class="stat-label" style="color: var(--on-tertiary-fixed-variant);">Completed</p>
                                <p class="stat-value" id="stat-completed" style="color: var(--on-tertiary-fixed);">0 <small style="font-size: 0.75rem; opacity: 0.8;">Animals</small></p>
                            </div>
                        </div>
                        <div class="stat-card-wide" style="background-color: var(--secondary-fixed); flex: 1;">
                            <div class="stat-icon-wrapper" style="background-color: var(--on-secondary-fixed); color: var(--secondary-fixed);">
                                <i class="fas fa-calendar-alt"></i>
                            </div>
                            <div>
                                <p class="stat-label" style="color: var(--on-secondary-fixed-variant);">Pending</p>
                                <p class="stat-value" id="stat-pending" style="color: var(--on-secondary-fixed);">0 <small style="font-size: 0.75rem; opacity: 0.8;">Upcoming</small></p>
                            </div>
                        </div>
                        <div class="stat-card-wide" style="background-color: #ffd8d8; flex: 1;">
                            <div class="stat-icon-wrapper" style="background-color: #8c1d1d; color: #ffd8d8;">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div>
                                <p class="stat-label" style="color: #601414;">Overdue</p>
                                <p class="stat-value" id="stat-overdue" style="color: #8c1d1d;">0 <small style="font-size: 0.75rem; opacity: 0.8;">Scheduled</small></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Schedule Type Selection Row -->
            <div class="row mb-4 justify-content-center">
                <div class="col-auto">
                    <div class="view-toggle-container shadow-sm p-1">
                        <button class="view-toggle-btn active" data-type="vaccination">
                            <i class="fal fa-syringe mr-2"></i>
                            Vaccination
                        </button>
                        <button class="view-toggle-btn" data-type="deworming">
                            <i class="fal fa-pills mr-2"></i>
                            Deworming
                        </button>
                    </div>
                </div>
            </div>

            <!-- Medical Registry Table Card -->
            <div class="schedules-card mb-5">
                <div class="px-4 py-3 d-flex justify-content-between align-items-center" style="border-bottom: 1px solid var(--surface-container);">
                    <h4 class="font-headline font-weight-bold mb-0" id="registryTitle" style="font-size: 1.15rem; color: var(--on-surface);">Vaccination Registry</h4>
                    <div class="d-flex align-items-center gap-3">
                        <div class="search-wrapper mb-0" style="width: 250px;">
                            <i class="fal fa-search search-icon"></i>
                            <input type="text" id="schedulesSearch" class="form-control search-input" placeholder="Search registry..." style="height: 38px;">
                        </div>
                        <div class="d-flex gap-1 border-left pl-3" style="border-color: var(--surface-container) !important;">
                            <button class="btn btn-icon hover-bg-stone rounded-lg p-2" title="Filter Records">
                                <i class="fal fa-filter text-muted" style="font-size: 1rem;"></i>
                            </button>
                            <button class="btn btn-icon hover-bg-stone rounded-lg p-2" title="Export CSV">
                                <i class="fal fa-file-export text-muted" style="font-size: 1rem;"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table schedules-table mb-0" id="schedulesDataTable">
                        <thead>
                            <tr>
                                <th style="width: 25%;">Date & Time</th>
                                <th style="width: 30%;">Protocol Type</th>
                                <th style="width: 20%;">Scope</th>
                                <th style="width: 15%;">Status</th>
                                <th style="width: 10%;" class="text-right">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Dynamically Populated -->
                        </tbody>
                    </table>
                </div>

                <!-- Custom Pagination Footer -->
                <div class="px-4 py-3 d-flex justify-content-between align-items-center" style="border-top: 1px solid var(--surface-container); background: #fafafa;">
                    <p class="mb-0 text-muted small" id="pageInfo">Showing 0 to 0 of 0</p>
                    <div class="pagination-controls d-flex align-items-center gap-2" id="customPagination">
                        <button class="page-btn boundary-btn" id="prevPage" disabled>
                            <i class="fal fa-chevron-left"></i>
                        </button>
                        <div class="pagination-numbers d-flex gap-1" id="numberButtons">
                            <!-- Dynamic Numbers -->
                        </div>
                        <button class="page-btn boundary-btn" id="nextPage" disabled>
                            <i class="fal fa-chevron-right"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Insights Section -->
            <div class="insights-wrapper d-flex mb-5" style="gap: 3.5rem;">
                <div class="insight-card shadow-sm">
                    <div class="insight-icon-box" style="background: rgba(32, 98, 35, 0.08); color: var(--primary);">
                        <i class="fal fa-shield-check"></i>
                    </div>
                    <div>
                        <p class="insight-label">Herd Immunity</p>
                        <div class="d-flex align-items-baseline gap-2">
                            <h3 class="insight-value mb-0">94.2%</h3>
                            <span class="insight-trend positive">
                                <i class="fas fa-caret-up mr-1"></i>2.1%
                            </span>
                        </div>
                    </div>
                </div>

                <div class="insight-card shadow-sm">
                    <div class="insight-icon-box" style="background: rgba(245, 158, 11, 0.08); color: #f59e0b;">
                        <i class="fal fa-vial"></i>
                    </div>
                    <div>
                        <p class="insight-label">Pending Protocols</p>
                        <div class="d-flex align-items-baseline gap-2">
                            <h3 class="insight-value mb-0">12</h3>
                            <span class="insight-trend neutral">Next 7 days</span>
                        </div>
                    </div>
                </div>

                <div class="insight-card shadow-sm">
                    <div class="insight-icon-box" style="background: rgba(239, 68, 68, 0.08); color: #ef4444;">
                        <i class="fal fa-calendar-exclamation"></i>
                    </div>
                    <div>
                        <p class="insight-label">Delayed Actions</p>
                        <div class="d-flex align-items-baseline gap-2">
                            <h3 class="insight-value mb-0">3</h3>
                            <span class="insight-trend negative">Requires Attention</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Vaccination Schedule Modal -->
    <?php include 'modals/add_vaccination_schedule_modal.php'; ?>

    <!-- Deworming Schedule Modal -->
    <?php include 'modals/add_deworming_schedule_modal.php'; ?>

    <!-- Record Vaccination Modal -->
    <?php include 'modals/record_vaccination_activity_modal.php'; ?>

    <!-- Record Deworming Modal -->
    <?php include 'modals/record_deworming_activity_modal.php'; ?>

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
    <script src="../js/header.js"></script>
    <script src="../js/schedules.js"></script>

    <?php include 'modals.php'; ?>
</body>
</html>
