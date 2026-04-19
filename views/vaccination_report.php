<?php
/**
 * Jukam Dairy Management System - Vaccination Report (View/Print)
 * File: views/vaccination_report.php
 */
$base_path = '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vaccination Report | Jukam Farm</title>
    
    <!-- Global System Assets -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/navigation.css">
    <link rel="stylesheet" href="../css/reports.css">
    
    <!-- DataTables & Responsive -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.4.0/css/responsive.bootstrap4.min.css">
    
    <!-- Google Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Work+Sans:wght@300;400;500;600;700&family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">

    <style>
        .no-caret::after { display: none !important; }
    </style>
</head>
<body class="bg-background">

    <!-- Modular Sidebar -->
    <?php include 'navigation.php'; ?>

    <!-- Modular Header -->
    <?php include 'header.php'; ?>

    <!-- Main Content Area -->
    <main class="main-content">
        <div class="container-fluid pt-1 px-2 px-md-4">
            
            <!-- Report Controls (No Print) -->
            <div class="no-print d-flex justify-content-between align-items-center mb-5 mt-2">
                <a href="reports_overview.php" class="btn btn-link p-0 d-flex align-items-center text-decoration-none" style="font-size: 0.75rem; color: #444; font-weight: 500;">
                    <span class="material-symbols-outlined mr-2" style="font-size: 1rem;">arrow_back</span>
                    Back to Selection
                </a>
                <div class="d-flex align-items-center gap-3">
                    <button class="btn btn-report-action btn-outline-success mr-3" onclick="window.print()">
                        <span class="material-symbols-outlined mr-1">print</span>
                        Print
                    </button>
                    
                    <div class="dropdown">
                        <button class="btn btn-report-action btn-outline-success d-flex align-items-center gap-2" type="button" id="actionMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Actions
                            <span class="material-symbols-outlined" style="font-size: 1.2rem; margin-left: 4px;">expand_more</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right border-0 shadow-sm" aria-labelledby="actionMenuButton" style="border-radius: 0.75rem; padding: 0.5rem;">
                            <a class="dropdown-item d-flex align-items-center py-2" href="#" style="font-size: 0.8rem; font-weight: 600; border-radius: 0.5rem;">
                                <span class="material-symbols-outlined text-success mr-3" style="font-size: 1.25rem;">description</span>
                                Excel Export
                            </a>
                            <a class="dropdown-item d-flex align-items-center py-2" href="#" style="font-size: 0.8rem; font-weight: 600; border-radius: 0.5rem;">
                                <span class="material-symbols-outlined text-danger mr-3" style="font-size: 1.25rem;">picture_as_pdf</span>
                                PDF Document
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item d-flex align-items-center py-2" href="#" style="font-size: 0.8rem; font-weight: 600; border-radius: 0.5rem;">
                                <span class="material-symbols-outlined text-primary mr-3" style="font-size: 1.25rem;">mail</span>
                                Email Report
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Report Surface -->
            <div class="report-document-surface mb-5">
                
                <!-- 1. Report Header Branding -->
                <div class="row mb-3 pb-3 border-bottom align-items-end">
                    <div class="col-md-8">
                        <p class="font-label text-success font-weight-bold uppercase mb-1" style="font-size: 0.75rem; letter-spacing: 0.15em;">Health & Safety Compliance</p>
                        <h1 class="font-headline font-weight-black text-on-surface mb-2" style="font-size: 1.5rem;">Vaccination Report</h1>
                        <div class="d-flex align-items-center text-muted gap-2" style="font-size: 0.85rem;">
                            <span class="material-symbols-outlined" style="font-size: 1rem;">calendar_today</span>
                            <span class="font-weight-medium">October 01 - October 31, 2023</span>
                        </div>
                    </div>
                    <div class="col-md-4 text-md-right mt-4 mt-md-0">
                        <div class="d-inline-block text-left">
                            <h4 class="font-headline font-weight-black text-success mb-1" style="font-size: 1.1rem;">Jukam Dairy Farm</h4>
                            <p class="text-on-surface-variant font-weight-medium mb-0" style="font-size: 0.75rem;">Central Highlands Region | Herd Ref: JKLR-90</p>
                        </div>
                    </div>
                </div>

                <!-- 2. Summary Dashboard Bento Area -->
                <div class="row mb-3">
                    <div class="col-6 col-lg-3 mb-4 mb-lg-0">
                        <div class="report-history-card p-3 h-100 d-flex flex-column justify-content-between" style="border: 1px solid rgba(0,0,0,0.05);">
                            <p class="stat-label mb-3">Herd Coverage</p>
                            <div class="d-flex align-items-center gap-3">
                                <div class="vaccination-rate-container">
                                    <svg class="vaccine-rate-svg w-100 h-100" viewBox="0 0 56 56">
                                        <circle cx="28" cy="28" r="24" fill="none" stroke="#f0f0ed" stroke-width="4"></circle>
                                        <circle cx="28" cy="28" r="24" fill="none" stroke="var(--primary)" stroke-width="4" stroke-dasharray="150.8" stroke-dashoffset="9.1"></circle>
                                    </svg>
                                    <div class="vaccination-rate-text">94%</div>
                                </div>
                                <div class="text-muted font-weight-medium" style="font-size: 0.65rem; line-height: 1.2;">System Target:<br>90% Critical</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 mb-4 mb-lg-0">
                        <div class="report-history-card p-3 h-100" style="border: 1px solid rgba(0,0,0,0.05);">
                            <p class="stat-label mb-3">Monthly Yield</p>
                            <div class="d-flex align-items-end justify-content-between">
                                <div>
                                    <h2 class="font-headline font-weight-black mb-1" style="font-size: 1.5rem;">285</h2>
                                    <div class="text-primary d-flex align-items-center gap-1 font-weight-bold" style="font-size: 0.65rem;">
                                        <span class="material-symbols-outlined" style="font-size: 0.8rem;">trending_up</span>
                                        +12% TREND
                                    </div>
                                </div>
                                <div class="mini-chart-container">
                                    <div class="mini-bar" style="height: 60%;"></div>
                                    <div class="mini-bar" style="height: 45%;"></div>
                                    <div class="mini-bar" style="height: 100%;"></div>
                                    <div class="mini-bar" style="height: 75%;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 mb-4 mb-lg-0">
                        <div class="report-history-card p-3 h-100" style="border: 1px solid rgba(0,0,0,0.05);">
                            <p class="stat-label mb-3">Pending Rosters</p>
                            <h2 class="font-headline font-weight-black mb-1" style="font-size: 1.5rem;">12</h2>
                            <p class="text-muted mb-0 font-weight-medium" style="font-size: 0.6rem;">Scheduled for Next 7 Days</p>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3">
                        <div class="report-history-card p-3 h-100 bg-error-container border-0" style="background: rgba(186, 26, 26, 0.05);">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <p class="stat-label m-0" style="color: var(--error);">Critical Alerts</p>
                                <span class="material-symbols-outlined text-error" style="font-size: 1rem;">warning</span>
                            </div>
                            <h2 class="font-headline font-weight-black text-error mb-1" style="font-size: 1.5rem;">2</h2>
                            <p class="font-weight-bold text-error mb-0" style="font-size: 0.55rem; text-transform: uppercase; opacity: 0.8;">Booster Cycles Due</p>
                        </div>
                    </div>
                </div>

                <!-- 3. Main Data Areas (Split Layout) -->
                <div class="row mx-n2">
                    <!-- Left: Log Table -->
                    <div class="col-lg-8 mb-3 mb-lg-0 px-2">
                        <div class="report-history-card overflow-hidden" style="border: 1px solid rgba(0,0,0,0.05);">
                            <div class="px-4 py-3 bg-light border-bottom d-flex justify-content-between align-items-center">
                                <h5 class="font-headline font-weight-black m-0" style="font-size: 0.9rem; color: var(--on-surface);">Detailed Vaccination Log</h5>
                                <span class="stat-label m-0" style="font-size: 0.55rem;">Inventory Tracked</span>
                            </div>
                            <div class="table-responsive">
                                <table class="table report-log-table mb-0 w-100" id="vaccinationLogTable">
                                    <thead>
                                        <tr>
                                            <th>Date Admin</th>
                                            <th>Animal ID</th>
                                            <th>Type</th>
                                            <th>Batch Code</th>
                                            <th>Provider</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="font-weight-bold">Oct 28, 2023</td>
                                            <td class="font-weight-black text-primary">JK-0422</td>
                                            <td>
                                                <span class="badge" style="background: rgba(32, 98, 35, 0.1); color: var(--primary); font-size: 0.65rem; font-weight: 700;">ANTHRAX</span>
                                            </td>
                                            <td class="text-muted" style="font-size: 0.75rem;">B90221-EX</td>
                                            <td class="font-weight-bold" style="font-size: 0.75rem;">Dr. S. Mwangi</td>
                                        </tr>
                                        <tr>
                                            <td class="font-weight-bold">Oct 27, 2023</td>
                                            <td class="font-weight-black text-primary">JK-0519</td>
                                            <td>
                                                <span class="badge" style="background: rgba(32, 98, 35, 0.1); color: var(--primary); font-size: 0.65rem; font-weight: 700;">BRUCELLOSIS</span>
                                            </td>
                                            <td class="text-muted" style="font-size: 0.75rem;">BR-X044</td>
                                            <td class="font-weight-bold" style="font-size: 0.75rem;">Vet Tech Sarah</td>
                                        </tr>
                                        <tr>
                                            <td class="font-weight-bold">Oct 25, 2023</td>
                                            <td class="font-weight-black text-primary">JK-0112</td>
                                            <td>
                                                <span class="badge" style="background: rgba(121, 89, 0, 0.1); color: var(--secondary); font-size: 0.65rem; font-weight: 700;">FMD BOOSTER</span>
                                            </td>
                                            <td class="text-muted" style="font-size: 0.75rem;">FMD-LITE-9</td>
                                            <td class="font-weight-bold" style="font-size: 0.75rem;">Dr. S. Mwangi</td>
                                        </tr>
                                        <tr>
                                            <td class="font-weight-bold">Oct 24, 2023</td>
                                            <td class="font-weight-black text-primary">JK-0901</td>
                                            <td>
                                                <span class="badge" style="background: rgba(32, 98, 35, 0.1); color: var(--primary); font-size: 0.65rem; font-weight: 700;">BLACKLEG</span>
                                            </td>
                                            <td class="text-muted" style="font-size: 0.75rem;">BL-7701</td>
                                            <td class="font-weight-bold" style="font-size: 0.75rem;">Dr. S. Mwangi</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="px-4 py-3 bg-light border-top">
                                <p class="mb-0 text-muted italic" style="font-size: 0.7rem; font-weight: 500;">Showing sample of total 285 doses administered in reporting month.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Right: Schedule & Inventory -->
                    <div class="col-lg-4 px-2">
                        <div class="report-history-card p-4 mb-4 h-100" style="border: 1px solid rgba(0,0,0,0.05);">
                            <h5 class="font-headline font-weight-black mb-5 d-flex align-items-center gap-2" style="font-size: 1rem;">
                                <span class="material-symbols-outlined text-primary" style="font-variation-settings: 'FILL' 1;">event_upcoming</span>
                                Upcoming Schedule
                            </h5>
                            
                            <div class="schedule-timeline position-relative">
                                <!-- Item 1 -->
                                <div class="schedule-item mb-5">
                                    <div class="schedule-dot">
                                        <div class="schedule-dot-node" style="background-color: var(--secondary);"></div>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-start mb-1">
                                        <h6 class="font-weight-black mb-0 text-on-surface" style="font-size: 0.8rem;">FMD Booster</h6>
                                        <span class="text-error font-weight-bold" style="font-size: 0.55rem; text-transform: uppercase;">Urgent</span>
                                    </div>
                                    <p class="text-muted mb-1" style="font-size: 0.7rem; font-weight: 600;">Pen A-01 (15 Animals)</p>
                                    <p class="text-primary font-weight-black mb-0" style="font-size: 0.7rem;">Due Nov 15, 2023</p>
                                </div>

                                <!-- Item 2 -->
                                <div class="schedule-item mb-5 border-0">
                                    <div class="schedule-dot">
                                        <div class="schedule-dot-node" style="background-color: var(--primary);"></div>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-start mb-1">
                                        <h6 class="font-weight-black mb-0 text-on-surface" style="font-size: 0.8rem;">LSD Initial</h6>
                                        <span class="text-muted font-weight-bold" style="font-size: 0.55rem; text-transform: uppercase;">Routine</span>
                                    </div>
                                    <p class="text-muted mb-1" style="font-size: 0.7rem; font-weight: 600;">Pen C-05 (08 Animals)</p>
                                    <p class="text-primary font-weight-black mb-0" style="font-size: 0.7rem;">Due Nov 22, 2023</p>
                                </div>
                            </div>

                            <div class="stock-alert-box mt-auto">
                                <div class="d-flex align-items-center gap-2 mb-2">
                                    <span class="material-symbols-outlined text-primary" style="font-size: 1.15rem;">inventory_2</span>
                                    <span class="font-weight-black text-primary" style="font-size: 0.75rem;">Stock Attention</span>
                                </div>
                                <p class="mb-0 text-on-surface-variant font-weight-medium" style="font-size: 0.7rem; line-height: 1.5;">
                                    Anthrax vaccine stock low (12 doses remaining). Recommend reordering before Nov 10.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>



            </div>
        </div>
    </main>

    <!-- Global Scripts -->
    <script src="../plugins/jquery-3.6.1.js"></script>
    <script src="../plugins/popper.js"></script>
    <script src="../plugins/bootstrap.js"></script>
    <script src="../js/header.js"></script>
    <script src="../js/navigation.js"></script>
    
    <!-- DataTables JS -->
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.4.0/js/responsive.bootstrap4.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#vaccinationLogTable').DataTable({
                responsive: true,
                paging: false,
                searching: true,
                info: true,
                dom: '<"d-flex justify-content-between align-items-center mb-3 px-4 pt-3"f>t',
                language: {
                    search: "_INPUT_",
                    searchPlaceholder: "Search records..."
                }
            });
        });
    </script>
</body>
</html>
