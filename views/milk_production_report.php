<?php
/**
 * Jukam Dairy Management System - Milk Production Report (View/Print)
 * File: views/milk_production_report.php
 */
$base_path = '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Milk Production Report | Jukam Farm</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/navigation.css">
    <link rel="stylesheet" href="../css/reports.css">
    
    <!-- Google Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Work+Sans:wght@300;400;500;600;700&family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">

    <style>
        @media print {
            .no-print, header, aside, .navbar, .btn-link, .report-controls-row { display: none !important; }
            .main-content { margin-left: 0 !important; padding: 0 !important; width: 100% !important; }
            .container-fluid { padding: 0 !important; }
            .report-card { box-shadow: none !important; border: 1px solid #eee !important; }
            body { background: white !important; }
        }
        
        /* Premium Buttons from Design */
        .btn-report-outline {
            border: 1.2px solid #e0e0e0;
            background: white;
            color: #555;
            font-size: 0.75rem; /* Reduced */
            font-weight: 500; /* Removed bold */
            padding: 0.4rem 1.25rem; /* Reduced */
            border-radius: 0.4rem;
            transition: all 0.2s;
        }
        
        .btn-report-outline:hover {
            background: #f8faf8;
            border-color: var(--primary);
            color: var(--primary);
        }
        
        .btn-report-solid {
            background: var(--primary);
            color: white;
            font-size: 0.75rem; /* Reduced */
            font-weight: 500; /* Removed bold */
            padding: 0.4rem 1.25rem; /* Reduced */
            border-radius: 0.4rem;
            border: none;
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            transition: all 0.2s;
        }
        
        .btn-report-solid:hover {
            background: #1a521c;
            transform: translateY(-1px);
        }
        
        .report-header-badge {
            font-size: 0.6rem;
            letter-spacing: 0.12em;
            color: var(--secondary);
            font-weight: 700;
            text-transform: uppercase;
        }
        
        .bento-stat-card {
            background: white;
            border-radius: 1rem;
            padding: 1.1rem 1.25rem; /* Consistently tightened */
            border: 1px solid var(--report-card-border);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        
        .bento-stat-card.primary-border {
            border-left: 3px solid var(--primary);
        }
        
        @media (max-width: 768px) {
            .stat-value { font-size: 1.25rem !important; }
            .btn-report-outline, .btn-report-solid { 
                padding: 0.3rem 0.75rem !important; 
                font-size: 0.7rem !important;
            }
            .report-title-main { font-size: 1.2rem !important; }
            .back-to-filters-link { font-size: 0.7rem !important; }
            .back-to-filters-link .material-symbols-outlined { font-size: 0.9rem !important; margin-right: 0.25rem !important; }
            .mobile-metadata-hide { display: none !important; }
            .report-table-header h5 { font-size: 0.85rem !important; }
            .report-printable-table td { font-size: 0.7rem !important; padding: 0.5rem 0.75rem !important; }
        }
        
        .stat-label {
            font-size: 0.6rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--on-surface-variant);
            margin-bottom: 0.35rem; /* Tightened from 0.75rem */
            font-weight: 600;
        }
        
        .stat-value {
            font-size: 1.75rem; /* Dialed down */
            font-weight: 700; /* Removed 800 */
            color: var(--on-surface);
            font-family: 'Manrope', sans-serif;
        }
        
        .stat-unit {
            font-size: 0.9rem;
            font-weight: 400;
            opacity: 0.6;
        }
        
        .stat-trend {
            margin-top: 0.75rem;
            font-size: 0.7rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }
        
        .trend-up { color: var(--primary); }
        
        .report-table-container {
            background: white;
            border-radius: 1rem;
            border: 1px solid var(--report-card-border);
            overflow: hidden;
            margin-top: 2rem;
        }
        
        .report-table-header {
            padding: 1.25rem 1.5rem;
            background: #fcfcf9;
            border-bottom: 1px solid var(--report-card-border);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .report-printable-table th {
            background: #fafaf7;
            font-size: 0.6rem; /* Dialed down */
            /* Removed uppercase for Title Case */
            letter-spacing: 0.05em;
            color: var(--on-surface-variant);
            padding: 0.75rem 1.5rem; /* Tightened from 1rem */
            border-bottom: 1px solid var(--report-card-border);
            font-weight: 700;
        }
        
        .report-printable-table td {
            padding: 0.6rem 1.5rem; /* Tightened from 1rem */
            font-size: 0.8rem; /* Dialed down */
            border-bottom: 1px solid var(--report-card-border);
            font-weight: 400 !important; /* Removed boldness as requested */
        }
        
        .report-footer {
            margin-top: 4rem;
            padding-top: 2rem;
            border-top: 1px solid var(--report-card-border);
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
        }
        
        .signature-line {
            width: 150px;
            border-bottom: 1px solid #ccc;
            margin-bottom: 0.5rem;
        }
        
        .signature-label {
            font-size: 0.6rem;
            text-transform: uppercase;
            color: var(--on-surface-variant);
        }
        
        .signature-name {
            font-size: 0.75rem;
            font-weight: 600;
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
            
            <!-- Report Controls (No Print) -->
            <div class="no-print report-controls-row d-flex justify-content-between align-items-center mb-4 mt-1"> <!-- Added class for cleaner print hiding -->
                <a href="reports_overview.php" class="btn btn-link p-0 d-flex align-items-center text-decoration-none back-to-filters-link" style="font-size: 0.8rem; color: #444; font-weight: 500;">
                    <span class="material-symbols-outlined mr-2" style="font-size: 1.1rem;">arrow_back</span>
                    Back to Filters
                </a>
                <div class="d-flex align-items-center"> <!-- Standard flex alignment -->
                    <button class="btn-report-outline mr-3" onclick="window.print()"> <!-- Added explicit mr-3 for BS4 compatibility -->
                        Print
                    </button>
                    <div class="dropdown">
                        <button class="btn-report-solid" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Actions
                            <span class="material-symbols-outlined ml-2" style="font-size: 1.1rem;">expand_more</span>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right botanical-shadow border-0 mt-2">
                            <a class="dropdown-item d-flex align-items-center py-2" href="#" style="font-size: 0.75rem; font-weight: 600;">
                                <span class="material-symbols-outlined text-muted mr-3" style="font-size: 1.1rem;">picture_as_pdf</span>
                                Export To Pdf
                            </a>
                            <a class="dropdown-item d-flex align-items-center py-2" href="#" style="font-size: 0.75rem; font-weight: 600;">
                                <span class="material-symbols-outlined text-muted mr-3" style="font-size: 1.1rem;">table_view</span>
                                Export To Excel
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item d-flex align-items-center py-2" href="#" style="font-size: 0.75rem; font-weight: 600;">
                                <span class="material-symbols-outlined text-muted mr-3" style="font-size: 1.1rem;">mail</span>
                                Email Report
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Printable Report Document -->
            <div class="report-document-surface">
                
                <!-- 1. Report Branding Header -->
                <div class="row mb-4 pb-3 border-bottom"> <!-- Reduced mb and pb -->
                    <div class="col-md-8">
                        <span class="report-header-badge d-block mb-1">Official Production Audit</span> <!-- Reduced mb -->
                        <h1 class="font-headline font-weight-bold text-on-surface mb-2 report-title-main" style="font-size: 1.4rem;">Milk Production Report</h1> <!-- Further reduced -->
                        <div class="d-flex align-items-center text-muted" style="font-size: 0.75rem; font-weight: 400;">
                            <span class="material-symbols-outlined mr-2" style="font-size: 0.9rem;">calendar_today</span>
                            <span class="font-weight-medium">October 01 - October 31, 2023</span>
                        </div>
                    </div>
                    <div class="col-md-4 text-md-right mt-4 mt-md-0">
                        <p class="stat-label mb-1">Reporting Entity</p>
                        <h4 class="font-headline font-weight-bold text-primary mb-0" style="font-size: 1.1rem; color: var(--primary) !important;">Jukam Dairy Farm</h4> <!-- Enforced Green -->
                        <p class="text-on-surface-variant mb-0" style="font-size: 0.7rem;">Central Highlands Region</p>
                    </div>
                </div>

                <!-- 2. Summary Bento Grid -->
                <div class="row g-3 mb-3"> <!-- Further reduced mb from 4 to 3 -->
                    <div class="col-6 col-md-3">
                        <div class="bento-stat-card primary-border h-100">
                            <p class="stat-label">Total Yield</p>
                            <div>
                                <h3 class="stat-value mb-0" style="font-size: 1.5rem;">32,450 <span class="stat-unit">L</span></h3> <!-- Reduced size -->
                                <div class="stat-trend trend-up" style="font-size: 0.65rem;">
                                    <span class="material-symbols-outlined" style="font-size: 0.8rem;">trending_up</span>
                                    <span>+4.2% vs prev month</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="bento-stat-card h-100">
                            <p class="stat-label">Avg. Daily Yield</p>
                            <div>
                                <h3 class="stat-value mb-0" style="font-size: 1.5rem;">1,046 <span class="stat-unit">L</span></h3> <!-- Reduced size -->
                                <div class="progress mt-3" style="height: 3px; background: #f0f0f0;">
                                    <div class="progress-bar bg-secondary" role="progressbar" style="width: 75%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-md-3 mt-3 mt-md-0">
                        <div class="bento-stat-card h-100">
                            <p class="stat-label">Avg. Density</p>
                            <div>
                                <h3 class="stat-value mb-0" style="font-size: 1.5rem;">1.030 <span class="stat-unit">kg/L</span></h3> <!-- Reduced size -->
                                <p class="text-muted italic mt-3 mb-0" style="font-size: 0.65rem;">Optimal range: 1.028 - 1.033</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-md-3 mt-3 mt-md-0">
                        <div class="bento-stat-card h-100">
                            <p class="stat-label">Avg. Butterfat</p>
                            <div>
                                <h3 class="stat-value mb-0" style="font-size: 1.5rem;">4.2 <span class="stat-unit">%</span></h3> <!-- Reduced size -->
                                <span class="badge badge-success mt-3" style="font-size: 0.55rem; padding: 0.35rem 0.5rem; background-color: var(--primary);">GRADE A QUALITY</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 3. Detailed Data Table -->
                <div class="report-table-container">
                    <div class="report-table-header">
                        <h5 class="mb-0 font-weight-bold font-headline" style="font-size: 1rem;">Daily Production Details</h5>
                        <span class="stat-label mb-0">Units in Liters (L)</span>
                    </div>
                    <div class="table-responsive">
                        <table class="table report-printable-table mb-0">
                            <thead>
                                <tr>
                                    <th>Date</th>
                                    <th class="d-none d-md-table-cell">Morning</th>
                                    <th class="d-none d-md-table-cell">Midday</th>
                                    <th class="d-none d-md-table-cell">Evening</th>
                                    <th class="text-primary font-weight-bold" style="color: var(--primary) !important;">Total Daily</th>
                                    <th class="d-none d-md-table-cell">Density</th>
                                    <th class="d-none d-md-table-cell">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="font-weight-bold">Oct 01, 2023</td>
                                    <td class="d-none d-md-table-cell">450</td>
                                    <td class="d-none d-md-table-cell">320</td>
                                    <td class="d-none d-md-table-cell">280</td>
                                    <td class="font-weight-bold text-primary" style="color: var(--primary) !important;">1,050</td>
                                    <td class="d-none d-md-table-cell">1.029</td>
                                    <td class="d-none d-md-table-cell"><span class="badge badge-pill badge-primary-subtle" style="background: rgba(32, 98, 35, 0.1); color: var(--primary); font-size: 0.65rem; font-weight: 700;">GRADE A</span></td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold">Oct 02, 2023</td>
                                    <td class="d-none d-md-table-cell">465</td>
                                    <td class="d-none d-md-table-cell">335</td>
                                    <td class="d-none d-md-table-cell">290</td>
                                    <td class="font-weight-bold text-primary" style="color: var(--primary) !important;">1,090</td>
                                    <td class="d-none d-md-table-cell">1.031</td>
                                    <td class="d-none d-md-table-cell"><span class="badge badge-pill badge-primary-subtle" style="background: rgba(32, 98, 35, 0.1); color: var(--primary); font-size: 0.65rem; font-weight: 700;">GRADE A</span></td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold">Oct 03, 2023</td>
                                    <td class="d-none d-md-table-cell">440</td>
                                    <td class="d-none d-md-table-cell">310</td>
                                    <td class="d-none d-md-table-cell">275</td>
                                    <td class="font-weight-bold text-primary" style="color: var(--primary) !important;">1,025</td>
                                    <td class="d-none d-md-table-cell">1.030</td>
                                    <td class="d-none d-md-table-cell"><span class="badge badge-pill badge-warning-subtle" style="background: rgba(121, 89, 0, 0.1); color: #795900; font-size: 0.65rem; font-weight: 700;">GRADE B</span></td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold">Oct 04, 2023</td>
                                    <td class="d-none d-md-table-cell">458</td>
                                    <td class="d-none d-md-table-cell">325</td>
                                    <td class="d-none d-md-table-cell">282</td>
                                    <td class="font-weight-bold text-primary" style="color: var(--primary) !important;">1,065</td>
                                    <td class="d-none d-md-table-cell">1.029</td>
                                    <td class="d-none d-md-table-cell"><span class="badge badge-pill badge-primary-subtle" style="background: rgba(32, 98, 35, 0.1); color: var(--primary); font-size: 0.65rem; font-weight: 700;">GRADE A</span></td>
                                </tr>
                                <tr>
                                    <td class="font-weight-bold">Oct 05, 2023</td>
                                    <td class="d-none d-md-table-cell">470</td>
                                    <td class="d-none d-md-table-cell">340</td>
                                    <td class="d-none d-md-table-cell">305</td>
                                    <td class="font-weight-bold text-primary" style="color: var(--primary) !important;">1,115</td>
                                    <td class="d-none d-md-table-cell">1.032</td>
                                    <td class="d-none d-md-table-cell"><span class="badge badge-pill badge-primary-subtle" style="background: rgba(32, 98, 35, 0.1); color: var(--primary); font-size: 0.65rem; font-weight: 700;">GRADE A</span></td>
                                </tr>
                            </tbody>
                            <tfoot class="bg-surface-container-low/30" style="border-top: 2px solid var(--report-card-border);">
                                <tr class="font-weight-bold" style="font-size: 0.85rem;">
                                    <td class="py-3 px-6">Monthly Totals</td>
                                    <td class="py-3 px-6 d-none d-md-table-cell">14,250</td>
                                    <td class="py-3 px-6 d-none d-md-table-cell">9,820</td>
                                    <td class="py-3 px-6 d-none d-md-table-cell">8,380</td>
                                    <td class="py-3 px-6 text-primary" style="color: var(--primary) !important;">32,450 L</td>
                                    <td class="py-3 px-6 d-none d-md-table-cell">1.030</td>
                                    <td class="py-3 px-6 text-muted font-weight-medium d-none d-md-table-cell">Verified</td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>

                <!-- 4. Footer & Authorization -->
                <div class="report-footer">
                    <div class="mobile-metadata-hide">
                        <p class="stat-label mb-2">Generated Document Metadata</p>
                        <p class="mb-0 text-muted uppercase tracking-widest" style="font-size: 0.6rem;">Generated on Oct 31, 2023 | Page 1 of 5 | Ref: MP-202310-001</p>
                    </div>
                    <div class="d-flex gap-5">
                        <div class="text-right">
                            <p class="stat-label mb-4" style="font-size: 0.55rem;">Verified By</p>
                            <div class="signature-line"></div>
                            <p class="signature-name mb-0">Production Manager</p>
                        </div>
                        <div class="text-right ml-4">
                            <p class="stat-label mb-4" style="font-size: 0.55rem;">Authorized Signature</p>
                            <div class="signature-line"></div>
                            <p class="signature-name mb-0">Quality Control</p>
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
    <script src="../plugins/alert.js"></script>
    <script src="../js/functions.js"></script>
    <script src="../js/header.js"></script>
</body>
</html>
