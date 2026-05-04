<?php
/**
 * Jukam Dairy Management System - Production Overview (V2 - Design Matching)
 * File: views/production_overview.php
 * Implementation: Direct high-fidelity translation of the provided design.
 */
$base_path = '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Production Overview | Jukam Farm</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/all.css"> <!-- FontAwesome -->
    <link rel="stylesheet" href="../css/style.css"> <!-- Global Styles -->
    <link rel="stylesheet" href="../css/dashboard.css"> <!-- Dashboard Base -->
    <link rel="stylesheet" href="../css/header.css"> <!-- Header Module -->
    <link rel="stylesheet" href="../css/navigation.css"> <!-- Sidebar Module -->
    <link rel="stylesheet" href="../css/production.css"> <!-- Production Page Module (V2) -->
    <link rel="stylesheet" href="../css/animals.css"> <!-- Common UI Patterns -->
    <link rel="stylesheet" href="../css/alert.css"> <!-- Alerts -->

    <!-- jQuery UI CSS -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

    <!-- DataTables via CDN -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.3.3/css/buttons.bootstrap4.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.4.0/css/responsive.bootstrap4.min.css"/>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@300;400;500;600;700;800&family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

    <style>
        .dataTables_filter { display: none; } 
        .dt-buttons { display: none !important; }
        .ui-datepicker { z-index: 2100 !important; }
        .bg-icon-leaf {
            position: absolute;
            right: -20px;
            bottom: -20px;
            font-size: 8rem;
            opacity: 0.1;
            transform: rotate(-15deg);
        }

        #logDataTable {
            font-family: 'Manrope', sans-serif !important;
        }

        .log-session-pill {
            font-size: 0.75rem !important; /* Increased font size */
            padding: 0.35rem 1rem !important;
        }

        .log-grade-pill.grade-a { background-color: #dcfce7; color: #166534; }
        .log-grade-pill.grade-b { background-color: #fefce8; color: #854d0e; }
        .log-grade-pill.grade-c { background-color: #fee2e2; color: #991b1b; }
    </style>
</head>
<body class="bg-background">

    <!-- Modular Sidebar -->
    <?php include 'navigation.php'; ?>

    <!-- Modular Header -->
    <?php include 'header.php'; ?>

    <!-- Modular Modals (Lock/Password) -->
    <?php include 'modals.php'; ?>

    <!-- Main Content Area -->
    <main class="main-content">
        <div class="container-fluid pt-1 px-2">
            <!-- Header Section -->
            <div class="row align-items-center mb-3 mt-2">
                <div class="col">
                    <h2 class="font-headline font-weight-bold text-on-surface" style="font-size: 1.25rem; display: flex; align-items: center; gap: 0.75rem;">
                        <span class="material-symbols-outlined text-success" style="font-variation-settings: 'FILL' 1;">water_drop</span>
                        Production Overview
                    </h2>
                </div>
                <div class="col-auto">
                    <button class="btn btn-register d-flex align-items-center gap-2" id="logYieldFAB" style="background-color: #206223; color: white; border-radius: 0.5rem; padding: 0.6rem 1.5rem; font-weight: 600;">
                        <span class="material-symbols-outlined" style="font-size: 1.2rem;">add</span>
                        Add Log
                    </button>
                </div>
            </div>

            <!-- Header Row: 5 Stat Cards (Added Total Cows Milked) -->
            <div class="prod-header-grid">
                <!-- Total Yield (TODAY) -->
                <div class="prod-stat-card stat-card-dark botanical-shadow">
                    <span class="material-symbols-outlined bg-icon-leaf">eco</span>
                    <div class="d-flex justify-content-between align-items-start">
                        <span class="prod-stats-label font-headline">TOTAL YIELD (TODAY)</span>
                        <span class="material-symbols-outlined text-success" style="font-variation-settings: 'FILL' 1; font-size: 1.25rem;">water_drop</span>
                    </div>
                    <h2 class="prod-stats-value font-headline" id="totalYieldCard">0 L</h2>
                    <div class="trend-pill" id="totalYieldTrend">0% from yesterday</div>
                </div>

                <!-- Total Cows Milked (NEW) -->
                <div class="prod-stat-card botanical-shadow">
                    <div class="d-flex justify-content-between align-items-start">
                         <span class="prod-stats-label font-headline" style="color: #64748b; font-weight: 700;">COWS MILKED</span>
                         <span class="material-symbols-outlined text-success" style="font-variation-settings: 'FILL' 1;">cruelty_free</span>
                    </div>
                    <h2 class="prod-stats-value font-headline" style="color: #1e293b;" id="cowsMilkedCard">0</h2>
                    <div class="text-muted smaller font-weight-bold" style="font-size: 0.65rem;" id="cowsMilkedPerc">0% of total herd</div>
                </div>

                <!-- Avg. Yield Per Cow -->
                <div class="prod-stat-card botanical-shadow">
                    <span class="prod-stats-label font-headline" style="color: #64748b; font-weight: 700;">AVG. YIELD PER COW</span>
                    <h2 class="prod-stats-value font-headline" style="color: #1e293b;" id="avgYieldCard">0 L</h2>
                    <div class="d-flex align-items-center gap-3">
                        <div class="prod-progress-minimal">
                            <div class="prod-progress-minimal-fill" id="avgYieldProgress" style="width: 0%; background-color: #206223;"></div>
                        </div>
                        <span class="text-muted smaller font-weight-bold" style="font-size: 0.6rem;" id="avgYieldStatus">Normal</span>
                    </div>
                </div>

                <!-- Bulk Tank Level (ADDED ICON) -->
                <div class="prod-stat-card botanical-shadow">
                    <div class="d-flex justify-content-between align-items-start">
                        <span class="prod-stats-label font-headline" style="color: #64748b; font-weight: 700;">BULK TANK LEVEL</span>
                        <span class="material-symbols-outlined text-muted" style="font-variation-settings: 'FILL' 1; color: var(--secondary);">storage</span>
                    </div>
                    <h2 class="prod-stats-value font-headline" style="color: #1e293b;">72%</h2>
                    <div class="text-muted smaller font-weight-bold" style="font-size: 0.65rem;">3,600 / 5,000 L</div>
                </div>

                <!-- Average Density -->
                <div class="prod-stat-card stat-card-gold botanical-shadow">
                    <span class="prod-stats-label font-headline" style="font-weight: 700; opacity: 0.6;">AVERAGE DENSITY</span>
                    <h2 class="prod-stats-value font-headline" id="avgDensityCard">0.000 <small style="font-size: 0.8rem;">kg/L</small></h2>
                    <div class="quality-tag" id="densityGradeTag">
                        <span class="material-symbols-outlined" style="font-size: 1rem; font-variation-settings: 'FILL' 1;">check_circle</span>
                        GRADE -
                    </div>
                </div>
            </div>

            <!-- Middle Row: Chart & Alerts -->
            <div class="prod-middle-grid">
                <!-- Production Trends Chart (AREA CHART) -->
                <div class="chart-container-card botanical-shadow">
                    <div class="d-flex justify-content-between align-items-start mb-4">
                        <div>
                            <h5 class="font-headline font-weight-bold mb-1">Production Performance</h5>
                            <p class="text-muted smaller">Volume vs. Target over the last 7 days</p>
                        </div>
                        <div class="btn-group btn-group-toggle-custom" style="background: rgba(0,0,0,0.03); border-radius: 0.5rem; padding: 0.25rem;" id="chartSwitcher">
                            <button class="btn btn-chart-switcher active btn-sm" data-type="volume" style="font-size: 0.65rem; padding: 0.25rem 0.75rem; border-radius: 0.4rem; background: white; border: none; font-weight: 700;">Volume</button>
                            <button class="btn btn-chart-switcher btn-sm" data-type="quality" style="font-size: 0.65rem; padding: 0.25rem 0.75rem; border: none; color: #64748b; font-weight: 700;">Quality</button>
                        </div>
                    </div>
                    <div id="productionChart" style="min-height: 250px;"></div>
                </div>

                <!-- Alerts Column -->
                <div class="alerts-container-card botanical-shadow">
                    <div class="d-flex align-items-center gap-4 mb-4">
                        <span class="material-symbols-outlined text-danger" style="font-variation-settings: 'FILL' 1;">warning</span>
                        <h5 class="font-headline font-weight-bold mb-0">Reduced Yield Alerts</h5>
                    </div>
                    
                    <div class="yield-alert-item botanical-shadow-sm">
                        <div class="alert-info-box">
                            <div class="alert-cow-id">Cow #JK-115</div>
                            <div class="alert-reason">Health check recommended</div>
                        </div>
                        <div class="alert-drop">-15%</div>
                    </div>

                    <div class="yield-alert-item warning botanical-shadow-sm">
                        <div class="alert-info-box">
                            <div class="alert-cow-id">Cow #JK-042</div>
                            <div class="alert-reason">Feeding cycle mismatch</div>
                        </div>
                        <div class="alert-drop" style="color: #a16207;">-10%</div>
                    </div>

                    <div class="yield-alert-item info botanical-shadow-sm">
                        <div class="alert-info-box">
                            <div class="alert-cow-id">Cow #JK-098</div>
                            <div class="alert-reason">Recovering status</div>
                        </div>
                        <div class="alert-drop" style="color: #64748b;">-4%</div>
                    </div>

                    <button class="btn btn-block py-2 mt-3 font-weight-bold" style="background-color: #f8fafc; border-radius: 0.5rem; font-size: 0.65rem; text-transform: uppercase; letter-spacing: 0.05rem;" id="viewAllHealth">
                        View All Health Alerts
                    </button>
                </div>
            </div>

            <!-- Bottom Row: Recent Logs (Advanced DataTable Integration) -->
            <div class="log-table-container botanical-shadow mb-4">
                <div class="d-flex justify-content-between align-items-center mb-2 flex-nowrap gap-3">
                    <h5 class="font-headline font-weight-bold mb-0">Milking Log Registry</h5>
                    
                    <!-- Filters & Actions -->
                    <div class="d-flex align-items-center" style="gap: 0.5rem;">
                         <select class="form-control form-control-sm border-0 bg-light" id="logShiftFilter" style="width: 130px; border-radius: 0.5rem; height: 38px;">
                             <option value="">All Shifts</option>
                             <option value="Morning">Morning</option>
                             <option value="Evening">Evening</option>
                             <option value="Noon">Noon</option>
                         </select>
                         <input type="text" class="form-control form-control-sm border-0 bg-light" id="logDateFilter" placeholder="Select Date" style="width: 130px; border-radius: 0.5rem; height: 38px;">
                         <div class="input-group input-group-sm mr-2" style="width: 200px;">
                             <div class="input-group-prepend">
                                 <span class="input-group-text bg-light border-0" style="border-radius: 2rem 0 0 2rem; padding-left: 1rem;"><span class="material-symbols-outlined" style="font-size: 1.1rem; color: #94a3b8;">search</span></span>
                             </div>
                             <input type="text" class="form-control form-control-sm border-0 bg-light pl-1" id="logSearch" placeholder="Search..." style="border-radius: 0 2rem 2rem 0; height: 38px;">
                         </div>

                         <!-- Custom Export Buttons -->
                         <button class="btn btn-sm border-0 bg-light d-flex align-items-center" id="customExcelBtn" style="border-radius: 0.5rem; height: 38px; padding: 0 1rem; color: #166534; font-weight: 600;">
                             <span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">download</span> Excel
                         </button>
                         <button class="btn btn-sm border-0 bg-light d-flex align-items-center" id="customPrintBtn" style="border-radius: 0.5rem; height: 38px; padding: 0 1rem; color: #64748b; font-weight: 600;">
                             <span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">print</span> Print
                         </button>
                    </div>
                </div>

                <div class="production-data-table-wrapper">
                    <table class="animals-data-table table" id="logDataTable" width="100%">
                        <thead class="bg-light">
                            <tr>
                                <th>Date & Time</th>
                                <th>Shift</th>
                                <th>Volume (L)</th>
                                <th>Grade</th>
                                <th>Collector</th>
                                <th class="text-right no-sort">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                             <?php
                                $records = [
                                    ['Date' => 'Oct 24, 2023', 'Time' => '05:30 AM', 'Shift' => 'Morning', 'Volume' => '642.5 L', 'Temp' => '4.2°C', 'Grade' => 'Grade A+', 'GradeClass' => 'grade-plus', 'Collector' => 'Mark J.', 'Avatar' => 'james_kamau.png'],
                                    ['Date' => 'Oct 23, 2023', 'Time' => '06:15 PM', 'Shift' => 'Evening', 'Volume' => '605.8 L', 'Temp' => '4.5°C', 'Grade' => 'Grade A', 'GradeClass' => '', 'Collector' => 'Sarah K.', 'Avatar' => 'kevin_kamau.png'],
                                    ['Date' => 'Oct 23, 2023', 'Time' => '05:30 AM', 'Shift' => 'Morning', 'Volume' => '628.0 L', 'Temp' => '4.1°C', 'Grade' => 'Grade A+', 'GradeClass' => 'grade-plus', 'Collector' => 'Mark J.', 'Avatar' => 'james_kamau.png'],
                                ];
                                // Expanding to 15 rows
                                for($i=0; $i<12; $i++) { $copy = $records[$i%3]; $records[] = $copy; }

                                foreach ($records as $log):
                                    $shiftClass = strtolower($log['Shift']) == 'morning' ? 'pill-morning' : 'pill-evening';
                            ?>
                            <tr>
                                <td>
                                    <div class="font-weight-bold smaller" style="font-size: 0.825rem;"><?php echo $log['Date']; ?></div>
                                    <div class="text-muted smaller" style="font-size: 0.65rem;"><?php echo $log['Time']; ?></div>
                                </td>
                                <td><span class="log-session-pill <?php echo $shiftClass; ?>"><?php echo $log['Shift']; ?></span></td>
                                <td><span class="font-weight-bold" style="font-size: 0.95rem;"><?php echo $log['Volume']; ?></span></td>
                                <td><span class="log-grade-pill <?php echo strpos($log['Grade'], 'Grade A') !== false ? 'grade-a' : (strpos($log['Grade'], 'Grade B') !== false ? 'grade-b' : 'grade-c'); ?>"><?php echo $log['Grade']; ?></span></td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <img src="../images/blankavatar.jpg" class="collector-avatar" data-alt="avatar">
                                        <span class="smaller" style="font-weight: 400;"><?php echo $log['Collector']; ?></span>
                                    </div>
                                </td>
                                <td class="text-right">
                                     <div class="actions-container">
                                        <button class="btn-action-more" onclick="toggleActionMenu(event, this)">
                                            <span class="material-symbols-outlined">more_vert</span>
                                        </button>
                                        <div class="actions-dropdown botanical-shadow">
                                            <button class="action-menu-item"><span class="material-symbols-outlined">visibility</span> View Detail</button>
                                            <button class="action-menu-item"><span class="material-symbols-outlined">edit</span> Correction</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>

                <div class="pagination-container py-3" id="customPagination">
                    <span class="text-muted small font-weight-medium" style="font-size: 0.85rem;" id="pageInfo">Page 1 of 1</span>
                    <div class="d-flex align-items-center" id="pageBtnGroup">
                        <button class="page-btn boundary-btn mr-3" id="prevPage"><span class="material-symbols-outlined">chevron_left</span></button>
                        <div id="numberButtons" class="d-flex"></div>
                        <button class="page-btn boundary-btn ml-3" id="nextPage"><span class="material-symbols-outlined">chevron_right</span></button>
                    </div>
                </div>
            </div>
        </div>
    </main>


    <!-- New Production Log Modal Overlay -->
    <div class="animal-modal-overlay" id="logYieldModal">
        <div class="modal-backdrop-blur"></div>
        <div class="animal-modal-container" style="max-height: 650px; max-width: 750px; border-radius: 0.5rem;">
            <!-- Left Branding Column -->
            <div class="modal-branding-column" style="width: 240px; padding: 2.5rem 2rem;">
                <div class="modal-branding-bg">
                    <img src="https://images.unsplash.com/photo-1596733430284-f7437764b1a9?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80" style="filter: brightness(0.4) contrast(1.2); object-fit: cover;" data-alt="modern milking parlor station"/>
                    <div class="modal-branding-gradient" style="background: linear-gradient(to top, rgba(32, 98, 35, 0.9) 0%, rgba(32, 98, 35, 0.6) 100%);"></div>
                </div>
                <div class="modal-branding-content">
                    <div class="d-flex align-items-center mb-4" style="gap: 1rem;">
                        <span class="material-symbols-outlined text-white" style="font-variation-settings: 'FILL' 1; font-size: 2.25rem;">water_drop</span>
                        <h2 class="font-headline mb-0" style="font-size: 1.25rem; line-height: 1.2; font-weight: 500;">New Production Log</h2>
                    </div>
                    <p class="font-body text-white-50" style="font-size: 0.75rem; line-height: 1.5; opacity: 0.8;">Record precise daily yields to maintain your herd's performance data.</p>
                </div>
            </div>

            <!-- Right Form Column -->
            <div class="modal-form-column" style="background-color: white;">
                <button class="modal-close-btn" id="closeModal" style="top: 1rem; right: 1rem;">
                    <span class="material-symbols-outlined" style="font-size: 1.25rem;">close</span>
                </button>
                
                <div class="modal-form-scroll" style="padding: 2.5rem 3rem;">
                    <div class="mb-3">
                        <label class="modal-section-label modal-title-label" style="color: #854d0e; font-weight: 500; display: block; margin-bottom: 0.25rem;">Entry Details</label>
                        <p class="text-muted" style="font-size: 0.85rem;">Fill in the required fields for the milking session.</p>
                    </div>

                    <div id="modalNotifications" class="mb-3"></div>

                    <div class="mb-3">
                        <label class="modal-section-label" style="color: #1a1c19; font-weight: 500; margin-bottom: 0.75rem; display: block;">Milking Schedule</label>
                        <div class="schedule-selector-grid" id="milkingTimeGrid">
                            <label class="schedule-option">
                                <input type="radio" name="milking_time" value="3am" checked style="display:none;">
                                <div class="schedule-card" style="padding: 1rem;">3 AM</div>
                            </label>
                            <label class="schedule-option">
                                <input type="radio" name="milking_time" value="11am" style="display:none;">
                                <div class="schedule-card" style="padding: 1rem;">11 AM</div>
                            </label>
                            <label class="schedule-option">
                                <input type="radio" name="milking_time" value="4pm" style="display:none;">
                                <div class="schedule-card" style="padding: 1rem;">4 PM</div>
                            </label>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="modal-section-label" style="color: #1a1c19; font-weight: 500; margin-bottom: 0.5rem; display: block;">Animal Selection</label>
                        <div class="position-relative">
                            <select class="form-control-custom" id="animal_id" style="background-color: #f1f5f1; border: none; font-size: 0.85rem; height: 45px;">
                                <option value="">Select from herd...</option>
                                <option value="JK-001">JK-001 (Daisy)</option>
                                <option value="JK-042">JK-042 (Bella)</option>
                            </select>
                        </div>
                    </div>

                    <div class="row no-gutters mb-3" style="margin: 0 -0.5rem;">
                        <div class="col-6 px-2">
                             <label class="modal-section-label" style="color: #1a1c19; font-weight: 500; margin-bottom: 0.5rem; display: block;">Quantity (Litres)</label>
                             <div class="position-relative">
                                <input type="number" step="0.01" id="milk_quantity" class="form-control-custom" placeholder="0.00" style="background-color: #f1f5f1; border: none; font-size: 0.85rem; padding-right: 2rem; height: 45px;">
                                <span class="position-absolute text-muted" style="top: 50%; right: 1rem; transform: translateY(-50%); font-size: 0.75rem; font-weight: 500; opacity: 0.5;">L</span>
                             </div>
                        </div>
                        <div class="col-6 px-2">
                             <label class="modal-section-label" style="color: #1a1c19; font-weight: 500; margin-bottom: 0.5rem; display: block;">Milk Density (kg/L)</label>
                             <div class="position-relative">
                                <input type="number" step="0.001" id="milk_density" class="form-control-custom" value="1.030" style="background-color: #f1f5f1; border: none; font-size: 0.85rem; padding-right: 2.5rem; height: 45px;">
                                <span class="position-absolute text-muted" style="top: 50%; right: 1rem; transform: translateY(-50%); font-size: 0.7rem; font-weight: 500; opacity: 0.5;">kg/L</span>
                             </div>
                        </div>
                    </div>

                    <div class="mb-2">
                        <label class="modal-section-label" style="color: #1a1c19; font-weight: 500; margin-bottom: 0.75rem; display: block;">Narration</label>
                        <textarea class="form-control-custom" id="milk_narration" rows="2" placeholder="Add any observations or notes..." style="background-color: #f1f5f1; border: none; font-size: 0.85rem; resize: none;"></textarea>
                    </div>
                </div>

                <!-- Footer -->
                <div class="modal-footer-actions border-0 d-flex justify-content-end align-items-center" style="padding: 1.5rem 3rem 2.5rem;">
                    <button class="btn-discard mr-4" id="discardModal">Discard</button>
                    <button class="btn btn-register" id="saveProductionBtn" style="background-color: #206223; color: white; padding: 0.5rem 2.5rem; border-radius: 0.4rem; font-size: 0.9rem; font-weight: 500; box-shadow: 0 4px 12px rgba(32, 98, 35, 0.3);">Save Record</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts Area -->
    <script src="../plugins/jquery-3.6.1.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script> <!-- jQuery UI -->
    <script src="../plugins/popper.js"></script>
    <script src="../plugins/bootstrap.js"></script>
    <script src="../js/navigation.js"></script>
    <script src="../js/header.js"></script>
    <script src="../js/auth.js"></script>
    <script src="../js/functions.js"></script>
    <script src="../plugins/alert.js"></script>

    <!-- DataTables Core & Extensions -->
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.3/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.3/js/buttons.bootstrap4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.3/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.3/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.4.0/js/responsive.bootstrap4.min.js"></script>

    <script src="../js/production_overview.js"></script>
</body>
</html>
