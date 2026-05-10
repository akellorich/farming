<?php
/**
 * Jukam Poultry Management System - Health Tracking Overview
 * File: views/poultry_health.php
 */
$base_path = '../';
$nav_context = 'poultry'; // Forces the poultry-specific sidebar
?>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Tracking | JUKAM Farm</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/bootstrap.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/all.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/style.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/dashboard.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/header.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/navigation.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/alert.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/health.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>plugins/datatables/datatables.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    
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

        /* Tab Navigation Refinements */
        .health-tabs-container {
            display: flex;
            gap: 2.5rem;
            margin-bottom: 2rem;
            border-bottom: 1px solid #e2e8f0;
            width: 100%;
        }

        .health-tab {
            padding: 0.8rem 0.5rem;
            font-size: 0.9rem;
            font-weight: 500;
            color: #64748b;
            cursor: pointer;
            transition: all 0.2s;
            border: none;
            background: transparent;
            border-bottom: 3px solid transparent;
            position: relative;
            bottom: -1px;
        }

        .health-tab.active {
            color: var(--primary);
            font-weight: 700;
            border-bottom-color: var(--primary);
        }

        .health-tab:hover:not(.active) {
            color: var(--primary-dark);
            opacity: 0.8;
        }

        .stats-card-poultry {
            background: white;
            padding: 1.5rem;
            border-radius: 1.25rem;
            border: 1px solid rgba(0,0,0,0.05);
            box-shadow: 0 2px 10px rgba(0,0,0,0.02);
            transition: all 0.3s ease;
        }

        .stats-card-poultry:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.05);
        }

        .font-h2 { font-size: 1.5rem; font-weight: 600; }
        .font-h3 { font-size: 1.125rem; font-weight: 600; }
        .text-xs { font-size: 0.75rem; font-weight: 500; }

        @media (max-width: 768px) {
            .health-tab { font-size: 0.8rem !important; gap: 1.5rem !important; }
            .health-tabs-container { gap: 1.5rem !important; }
            .font-h2 { font-size: 1.25rem !important; }
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
            <!-- Breadcrumbs / Page Actions -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h2 class="font-headline h4 mb-0 font-weight-bold">Health Tracking</h2>
                    <p class="text-muted small mb-0">Monitor flock vitality and medical history</p>
                </div>
                <div class="d-flex gap-2">
                    <button class="btn btn-primary d-flex align-items-center px-4 py-2 rounded-lg font-weight-bold" style="background: var(--primary-dark); border: none; font-size: 13px;" id="btnLogClinical">
                        <span class="material-symbols-outlined mr-2" style="font-size: 18px;">medical_services</span>
                        Log Clinical Event
                    </button>
                </div>
            </div>

            <!-- Tab Navigation -->
            <div class="health-tabs-container mt-0">
                <button class="health-tab active" data-tab="clinical">Clinical Logs</button>
                <button class="health-tab" data-tab="vaccinations">Vaccinations</button>
                <button class="health-tab" data-tab="deworming">Deworming</button>
            </div>

            <!-- Tab Content: Clinical Logs -->
            <div id="tab-clinical" class="tab-pane-content">
                <!-- Stat Cards -->
                <div class="row mb-4 mx-n2">
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                        <div class="stats-card-poultry h-100">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <p class="text-xs text-muted text-uppercase mb-0">Active Treatments</p>
                                <span class="material-symbols-outlined text-primary opacity-50">medical_services</span>
                            </div>
                            <h2 class="font-h2 mb-2">4</h2>
                            <div class="d-flex align-items-center text-muted">
                                <span class="text-xs font-weight-bold">Flocks under care</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                        <div class="stats-card-poultry h-100">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <p class="text-xs text-muted text-uppercase mb-0">Mortality (24h)</p>
                                <span class="material-symbols-outlined text-danger opacity-50">heart_broken</span>
                            </div>
                            <h2 class="font-h2 mb-2">0.5%</h2>
                            <div class="d-flex align-items-center text-success">
                                <span class="material-symbols-outlined text-xs mr-1">trending_down</span>
                                <span class="text-xs font-weight-bold">-0.2% from avg</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                        <div class="stats-card-poultry h-100">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <p class="text-xs text-muted text-uppercase mb-0">Observation Cases</p>
                                <span class="material-symbols-outlined text-warning opacity-50">visibility</span>
                            </div>
                            <h2 class="font-h2 mb-2">2</h2>
                            <div class="d-flex align-items-center text-muted">
                                <span class="text-xs font-weight-bold">Requires monitoring</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                        <div class="stats-card-poultry h-100">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <p class="text-xs text-muted text-uppercase mb-0">Next Vet Visit</p>
                                <span class="material-symbols-outlined text-info opacity-50">calendar_month</span>
                            </div>
                            <h2 class="font-h2 mb-2">12-May</h2>
                            <div class="d-flex align-items-center text-muted">
                                <span class="text-xs font-weight-bold">Routine checkup</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Table Section -->
                <div class="bg-white rounded-xl shadow-sm overflow-hidden mb-4 border" style="border-color: rgba(0,0,0,0.05) !important;">
                    <div class="p-3 p-lg-4 border-bottom d-flex flex-wrap align-items-center justify-content-between">
                        <div class="col-12 col-md-5 px-0 mb-3 mb-md-0">
                            <div class="search-input-wrapper">
                                <span class="material-symbols-outlined" style="font-size: 20px; color: #9aa0a6;">search</span>
                                <input type="text" placeholder="Search clinical history..." class="border-0 bg-transparent ml-2 w-100" style="outline: none; font-size: 13px;">
                            </div>
                        </div>
                        <div class="d-flex align-items-center">
                            <button class="btn btn-outline-light border text-dark d-flex align-items-center px-3 py-2 rounded-lg mr-2" style="font-size: 13px;">
                                <span class="material-symbols-outlined mr-2" style="font-size: 18px;">filter_alt</span>
                                Filters
                            </button>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-poultry mb-0" id="clinicalTable">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Flock ID</th>
                                    <th>Condition</th>
                                    <th>Diagnosis</th>
                                    <th>Treatment</th>
                                    <th>Status</th>
                                    <th class="text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>05-May-2026</td>
                                    <td class="text-dark">FLK-001</td>
                                    <td>Newcastle Disease</td>
                                    <td>Early symptoms</td>
                                    <td>Lasota Booster</td>
                                    <td>
                                        <span class="status-badge status-active">
                                            <span class="dot bg-success"></span>Recovering
                                        </span>
                                    </td>
                                    <td class="text-right">
                                        <button class="btn btn-link text-muted p-0"><span class="material-symbols-outlined">more_vert</span></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Tab Content: Vaccinations -->
            <div id="tab-vaccinations" class="tab-pane-content" style="display: none;">
                <!-- Stat Cards -->
                <div class="row mb-4 mx-n2">
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                        <div class="stats-card-poultry h-100">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <p class="text-xs text-muted text-uppercase mb-0 summary-card-title">Total Vaccinated</p>
                                <span class="material-symbols-outlined text-success opacity-50">shield</span>
                            </div>
                            <h2 class="font-h2 mb-2">94%</h2>
                            <div class="d-flex align-items-center text-success">
                                <span class="text-xs font-weight-bold summary-card-desc">Overall coverage</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                        <div class="stats-card-poultry h-100">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <p class="text-xs text-muted text-uppercase mb-0 summary-card-title">Scheduled (Week)</p>
                                <span class="material-symbols-outlined text-primary opacity-50">event</span>
                            </div>
                            <h2 class="font-h2 mb-2">3</h2>
                            <div class="d-flex align-items-center text-muted">
                                <span class="text-xs font-weight-bold summary-card-desc">Upcoming protocols</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                        <div class="stats-card-poultry h-100">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <p class="text-xs text-muted text-uppercase mb-0 summary-card-title">Overdue</p>
                                <span class="material-symbols-outlined text-danger opacity-50">history</span>
                            </div>
                            <h2 class="font-h2 mb-2">0</h2>
                            <div class="d-flex align-items-center text-success">
                                <span class="text-xs font-weight-bold summary-card-desc">All protocols current</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                        <div class="stats-card-poultry h-100">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <p class="text-xs text-muted text-uppercase mb-0 summary-card-title">Vial Stock</p>
                                <span class="material-symbols-outlined text-warning opacity-50">inventory_2</span>
                            </div>
                            <h2 class="font-h2 mb-2">180</h2>
                            <div class="d-flex align-items-center text-muted">
                                <span class="text-xs font-weight-bold summary-card-desc">Doses available</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Table Section -->
                <div class="bg-white rounded-xl shadow-sm overflow-hidden mb-4 border" style="border-color: rgba(0,0,0,0.05) !important;">
                    <div class="p-3 p-lg-4 border-bottom d-flex flex-wrap align-items-center justify-content-between">
                        <div class="col-12 col-md-5 px-0 mb-3 mb-md-0">
                            <div class="search-input-wrapper">
                                <span class="material-symbols-outlined" style="font-size: 20px; color: #9aa0a6;">search</span>
                                <input type="text" placeholder="Search vaccination history..." class="border-0 bg-transparent ml-2 w-100" style="outline: none; font-size: 13px;">
                            </div>
                        </div>
                        <div class="d-flex align-items-center">
                            <button class="btn btn-outline-light border text-dark d-flex align-items-center px-3 py-2 rounded-lg mr-2" style="font-size: 13px;">
                                <span class="material-symbols-outlined mr-2" style="font-size: 18px;">filter_alt</span>
                                Filters
                            </button>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-poultry mb-0" id="vaccinationTable">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Flock ID</th>
                                    <th>Vaccine</th>
                                    <th>Method</th>
                                    <th>Batch No</th>
                                    <th>Admin By</th>
                                    <th class="text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>01-May-2026</td>
                                    <td class="text-dark">FLK-004</td>
                                    <td>Gumboro</td>
                                    <td>Drinking Water</td>
                                    <td>GM-2026-X1</td>
                                    <td>Dr. Peterson</td>
                                    <td class="text-right">
                                        <button class="btn btn-link text-muted p-0"><span class="material-symbols-outlined">more_vert</span></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Tab Content: Deworming -->
            <div id="tab-deworming" class="tab-pane-content" style="display: none;">
                <!-- Stat Cards -->
                <div class="row mb-4 mx-n2">
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                        <div class="stats-card-poultry h-100">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <p class="text-xs text-muted text-uppercase mb-0 summary-card-title">Herd Coverage</p>
                                <span class="material-symbols-outlined text-success opacity-50">health_and_safety</span>
                            </div>
                            <h2 class="font-h2 mb-2">100%</h2>
                            <div class="d-flex align-items-center text-success">
                                <span class="text-xs font-weight-bold summary-card-desc">Full protection</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                        <div class="stats-card-poultry h-100">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <p class="text-xs text-muted text-uppercase mb-0 summary-card-title">Next Protocol</p>
                                <span class="material-symbols-outlined text-primary opacity-50">event_upcoming</span>
                            </div>
                            <h2 class="font-h2 mb-2">20-May</h2>
                            <div class="d-flex align-items-center text-muted">
                                <span class="text-xs font-weight-bold summary-card-desc">Batch D & E</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                        <div class="stats-card-poultry h-100">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <p class="text-xs text-muted text-uppercase mb-0 summary-card-title">Overdue</p>
                                <span class="material-symbols-outlined text-danger opacity-50">history</span>
                            </div>
                            <h2 class="font-h2 mb-2">0</h2>
                            <div class="d-flex align-items-center text-success">
                                <span class="text-xs font-weight-bold summary-card-desc">No missed dates</span>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0 px-2">
                        <div class="stats-card-poultry h-100">
                            <div class="d-flex justify-content-between align-items-start mb-3">
                                <p class="text-xs text-muted text-uppercase mb-0 summary-card-title">Medicine Stock</p>
                                <span class="material-symbols-outlined text-warning opacity-50">pill</span>
                            </div>
                            <h2 class="font-h2 mb-2">Low</h2>
                            <div class="d-flex align-items-center text-danger">
                                <span class="material-symbols-outlined text-xs mr-1">warning</span>
                                <span class="text-xs font-weight-bold summary-card-desc">Restock required</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Table Section -->
                <div class="bg-white rounded-xl shadow-sm overflow-hidden mb-4 border" style="border-color: rgba(0,0,0,0.05) !important;">
                    <div class="p-3 p-lg-4 border-bottom d-flex flex-wrap align-items-center justify-content-between">
                        <div class="col-12 col-md-5 px-0 mb-3 mb-md-0">
                            <div class="search-input-wrapper">
                                <span class="material-symbols-outlined" style="font-size: 20px; color: #9aa0a6;">search</span>
                                <input type="text" placeholder="Search deworming history..." class="border-0 bg-transparent ml-2 w-100" style="outline: none; font-size: 13px;">
                            </div>
                        </div>
                        <div class="d-flex align-items-center">
                            <button class="btn btn-outline-light border text-dark d-flex align-items-center px-3 py-2 rounded-lg mr-2" style="font-size: 13px;">
                                <span class="material-symbols-outlined mr-2" style="font-size: 18px;">filter_alt</span>
                                Filters
                            </button>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-poultry mb-0" id="dewormingTable">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th>Flock ID</th>
                                    <th>Product</th>
                                    <th>Dosage</th>
                                    <th>Next Due</th>
                                    <th>Admin By</th>
                                    <th class="text-right">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>28-Apr-2026</td>
                                    <td class="text-dark">FLK-007</td>
                                    <td>Piperazine</td>
                                    <td>10g / 10L</td>
                                    <td>28-Jul-2026</td>
                                    <td>James Kamau</td>
                                    <td class="text-right">
                                        <button class="btn btn-link text-muted p-0"><span class="material-symbols-outlined">more_vert</span></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </main>

    <!-- Core Scripts -->
    <script src="<?php echo $base_path; ?>plugins/jquery-3.6.1.js"></script>
    <script src="<?php echo $base_path; ?>plugins/popper.js"></script>
    <script src="<?php echo $base_path; ?>plugins/bootstrap.js"></script>
    <script src="<?php echo $base_path; ?>plugins/datatables/datatables.min.js"></script>
    
    <!-- Modular UI Scripts -->
    <script src="<?php echo $base_path; ?>js/navigation.js"></script>
    <script src="<?php echo $base_path; ?>js/header.js"></script>

    <script>
        $(document).ready(function() {
            // Tab Switching Logic
            $('.health-tab').click(function() {
                const tab = $(this).data('tab');
                
                $('.health-tab').removeClass('active');
                $(this).addClass('active');
                
                $('.tab-pane-content').hide();
                $('#tab-' + tab).fadeIn(200);
                
                // Update Button Label
                if (tab === 'vaccinations') {
                    $('#btnLogClinical').html('<span class="material-symbols-outlined mr-2" style="font-size: 18px;">shield_with_heart</span>Log Vaccination');
                } else if (tab === 'deworming') {
                    $('#btnLogClinical').html('<span class="material-symbols-outlined mr-2" style="font-size: 18px;">pill</span>Log Deworming');
                } else {
                    $('#btnLogClinical').html('<span class="material-symbols-outlined mr-2" style="font-size: 18px;">medical_services</span>Log Clinical Event');
                }
            });

            // Initialize Tables
            const tableConfig = {
                pageLength: 10,
                lengthChange: false,
                info: false,
                dom: 't'
            };

            $('#clinicalTable').DataTable(tableConfig);
            $('#vaccinationTable').DataTable(tableConfig);
            $('#dewormingTable').DataTable(tableConfig);
        });
    </script>

</body>
</html>
