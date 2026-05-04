<?php
/**
 * Jukam Dairy Management System - Deworming Report (View/Print)
 * File: views/deworming_report.php
 */
$base_path = '../';

// Simulate GET parameters for reporting period
$from_date = isset($_GET['from']) ? $_GET['from'] : '01-Oct-2023';
$to_date = isset($_GET['to']) ? $_GET['to'] : '31-Oct-2023';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deworming Report | Jukam Farm</title>
    
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
        
        /* Specific enhancements for Deworming Report */
        .badge-product {
            font-size: 0.65rem;
            font-weight: 700;
            padding: 0.35rem 0.65rem;
            border-radius: 4px;
        }
        .badge-valbazen { background: rgba(171, 244, 172, 0.2); color: #07521d; }
        .badge-cydectin { background: rgba(32, 98, 35, 0.1); color: var(--primary); }
        .badge-ivomec { background: rgba(254, 195, 48, 0.1); color: #6f5100; }
        
        .schedule-card-mini {
            background: var(--surface-container-low);
            border-radius: 12px;
            padding: 1rem;
            margin-bottom: 1rem;
            border-left: 4px solid transparent;
            transition: transform 0.2s;
        }
        .schedule-card-mini:hover { transform: scale(1.02); }
        /* Force Botanical Green */
        .text-primary, .text-success { color: var(--primary) !important; }
        .bg-primary, .bg-success { background-color: var(--primary) !important; }
        .btn-primary { 
            background-color: var(--primary) !important; 
            border-color: var(--primary) !important;
            box-shadow: 0 4px 12px rgba(32, 98, 35, 0.2);
        }

        .date-box-mini {
            background: #ffffff;
            border-radius: 8px;
            padding: 0.5rem 0.8rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            text-align: center;
            min-width: 60px;
            margin-right: 1.5rem; /* Increased separation */
            transition: all 0.3s ease;
            border: 1px solid rgba(0,0,0,0.02);
        }
        .schedule-card-mini:hover .date-box-mini {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 8px 16px rgba(32, 98, 35, 0.12);
        }

        /* Pagination Style from feeding_overview */
        .pagination-arrow {
            background: var(--surface-container-low);
            border: none;
            width: 32px;
            height: 32px;
            border-radius: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--on-surface);
            transition: all 0.2s;
        }
        .pagination-arrow:hover:not(:disabled) {
            background: var(--primary);
            color: white;
        }
        .pagination-arrow:disabled {
            opacity: 0.3;
            cursor: not-allowed;
        }
        .page-btn {
            background: transparent;
            border: 1px solid var(--surface-container-low);
            width: 32px;
            height: 32px;
            border-radius: 0.5rem;
            font-size: 0.75rem;
            font-weight: 600;
            color: var(--on-surface);
            transition: all 0.2s;
        }
        .page-btn.active {
            background: var(--primary);
            color: white;
            border-color: var(--primary);
            box-shadow: 0 4px 10px rgba(32, 98, 35, 0.2);
        }
        .page-btn:hover:not(.active) {
            background: var(--surface-container-low);
        }
        
        .dataTables_paginate { display: none !important; }
        .dataTables_info { display: none !important; }
        .progress-micro {
            height: 4px;
            border-radius: 2px;
            background: rgba(0,0,0,0.05);
            margin-top: 0.5rem;
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
        <div class="container-fluid pt-1 px-2 px-md-4">
            
            <!-- Report Controls (No Print) -->
            <div class="no-print d-flex justify-content-between align-items-center mb-3 mt-2">
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
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Report Surface -->
            <div class="report-document-surface mb-5">
                
                <!-- 1. Report Header Branding -->
                <div class="row mb-3 pb-3 border-bottom align-items-end">
                    <div class="col-md-8">
                        <p class="font-label text-success font-weight-bold uppercase mb-1" style="font-size: 0.75rem; letter-spacing: 0.15em;">Treatment & Parasite Control</p>
                        <h1 class="font-headline font-weight-black text-on-surface mb-2" style="font-size: 1.5rem;">Deworming Report</h1>
                        <div class="d-flex align-items-center text-muted gap-2" style="font-size: 0.85rem;">
                            <span class="material-symbols-outlined" style="font-size: 1rem;">calendar_today</span>
                            <span class="font-weight-medium"><?php echo $from_date; ?> - <?php echo $to_date; ?></span>
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
                <div class="row mb-4">
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0">
                        <div class="report-history-card p-3 h-100 d-flex flex-column justify-content-between border-primary-heavy">
                            <p class="stat-label mb-2">Herd Coverage</p>
                            <div class="d-flex align-items-end justify-content-between">
                                <h2 class="font-headline font-weight-black text-primary mb-0" style="font-size: 1.5rem;">94.2%</h2>
                                <span class="material-symbols-outlined text-primary" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                            </div>
                            <div class="progress progress-micro mt-3">
                                <div class="progress-bar bg-primary" role="progressbar" style="width: 94.2%" aria-valuenow="94.2" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0">
                        <div class="report-history-card p-3 h-100 border-tertiary-heavy d-flex flex-column justify-content-between">
                            <p class="stat-label mb-2">Treatments (Month)</p>
                            <div class="d-flex align-items-end justify-content-between">
                                <div>
                                    <h2 class="font-headline font-weight-black mb-0" style="font-size: 1.5rem;">148</h2>
                                    <div class="text-primary d-flex align-items-center gap-1 font-weight-bold" style="font-size: 0.65rem;">
                                        <span class="material-symbols-outlined" style="font-size: 0.8rem;">trending_up</span>
                                        +12% TREND
                                    </div>
                                </div>
                                <p class="text-muted mb-0 font-weight-bold" style="font-size: 0.6rem;">Target: 155</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0">
                        <div class="report-history-card p-3 h-100 border-secondary-heavy d-flex flex-column justify-content-between">
                            <p class="stat-label mb-2">Upcoming Sessions</p>
                            <div class="d-flex align-items-end justify-content-between">
                                <h2 class="font-headline font-weight-black text-secondary mb-0" style="font-size: 1.5rem;">03</h2>
                                <span class="material-symbols-outlined text-secondary" style="font-variation-settings: 'FILL' 0;">event</span>
                            </div>
                            <p class="text-muted mb-0 font-weight-medium" style="font-size: 0.6rem;">Next: Tomorrow, Pen A4</p>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3 mb-3 mb-lg-0">
                        <div class="report-history-card p-4 h-100 shadow-sm border-0 d-flex flex-column justify-content-center" style="background: #ffffff; border-left: 4px solid #ba1a1a !important; border-radius: 8px; position: relative; overflow: hidden;">
                            <p class="mb-3 text-uppercase font-weight-bold" style="color: #64748b; font-size: 0.65rem; letter-spacing: 1px;">Critical Alerts</p>
                            
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h2 class="font-headline font-weight-black mb-2" style="font-size: 2.2rem; color: #ba1a1a; line-height: 1;">07</h2>
                                    <p class="mb-0 font-weight-medium" style="color: #ba1a1a; font-size: 0.65rem;">Animals Overdue > 14 days</p>
                                </div>
                                <span class="material-symbols-outlined" style="font-size: 2.8rem; color: #ba1a1a; opacity: 0.15; font-variation-settings: 'FILL' 1;">warning</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 3. Main Data Areas (Split Layout) -->
                <div class="row mx-n2">
                    <!-- Left: Log Table -->
                    <div class="col-lg-8 mb-4 mb-lg-0 px-2">
                        <div class="report-history-card overflow-hidden" style="border: 1px solid rgba(0,0,0,0.05);">
                            <div class="px-4 py-3 bg-light border-bottom d-flex justify-content-between align-items-center">
                                <h5 class="font-headline font-weight-black m-0" style="font-size: 0.9rem; color: var(--on-surface);">Detailed Deworming Log</h5>
                                <div class="d-flex gap-2">
                                    <button class="btn btn-sm btn-light p-1" style="height: 28px; width: 28px;"><span class="material-symbols-outlined" style="font-size: 1.1rem;">filter_list</span></button>
                                    <button class="btn btn-sm btn-light p-1" style="height: 28px; width: 28px;"><span class="material-symbols-outlined" style="font-size: 1.1rem;">download</span></button>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <table class="table report-log-table mb-0 w-100" id="dewormingLogTable">
                                    <thead>
                                        <tr>
                                            <th>Animal ID</th>
                                            <th>Name</th>
                                            <th>Pen</th>
                                            <th>Date</th>
                                            <th>Product</th>
                                            <th>Dosage</th>
                                            <th>Admin</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="font-weight-bold">#JK-8821</td>
                                            <td class="font-weight-medium">Bessie</td>
                                            <td>Pen A1</td>
                                            <td>Oct 12, 2023</td>
                                            <td><span class="badge-product badge-valbazen">VALBAZEN</span></td>
                                            <td class="font-weight-bold">30ml</td>
                                            <td class="text-muted">M. Abdi</td>
                                        </tr>
                                        <tr>
                                            <td class="font-weight-bold">#JK-9012</td>
                                            <td class="font-weight-medium">Daisy</td>
                                            <td>Pen B4</td>
                                            <td>Oct 12, 2023</td>
                                            <td><span class="badge-product badge-cydectin">CYDECTIN</span></td>
                                            <td class="font-weight-bold">15ml</td>
                                            <td class="text-muted">S. Omondi</td>
                                        </tr>
                                        <tr>
                                            <td class="font-weight-bold">#JK-7723</td>
                                            <td class="font-weight-medium">Luna</td>
                                            <td>Pen A1</td>
                                            <td>Oct 11, 2023</td>
                                            <td><span class="badge-product badge-valbazen">VALBAZEN</span></td>
                                            <td class="font-weight-bold">28ml</td>
                                            <td class="text-muted">M. Abdi</td>
                                        </tr>
                                        <tr>
                                            <td class="font-weight-bold">#JK-9104</td>
                                            <td class="font-weight-medium">Stella</td>
                                            <td>Pen C2</td>
                                            <td>Oct 10, 2023</td>
                                            <td><span class="badge-product badge-ivomec">IVOMEC</span></td>
                                            <td class="font-weight-bold">20ml</td>
                                            <td class="text-muted">S. Omondi</td>
                                        </tr>
                                        <tr>
                                            <td class="font-weight-bold">#JK-8854</td>
                                            <td class="font-weight-medium">Molly</td>
                                            <td>Pen A2</td>
                                            <td>Oct 09, 2023</td>
                                            <td><span class="badge-product badge-cydectin">CYDECTIN</span></td>
                                            <td class="font-weight-bold">15ml</td>
                                            <td class="text-muted">M. Abdi</td>
                                        </tr>
                                        <tr>
                                            <td class="font-weight-bold">#JK-8812</td>
                                            <td class="font-weight-medium">Bella</td>
                                            <td>Pen B1</td>
                                            <td>Oct 08, 2023</td>
                                            <td><span class="badge-product badge-valbazen">VALBAZEN</span></td>
                                            <td class="font-weight-bold">30ml</td>
                                            <td class="text-muted">S. Omondi</td>
                                        </tr>
                                        <tr>
                                            <td class="font-weight-bold">#JK-9055</td>
                                            <td class="font-weight-medium">Lucy</td>
                                            <td>Pen A4</td>
                                            <td>Oct 07, 2023</td>
                                            <td><span class="badge-product badge-cydectin">CYDECTIN</span></td>
                                            <td class="font-weight-bold">15ml</td>
                                            <td class="text-muted">M. Abdi</td>
                                        </tr>
                                        <tr>
                                            <td class="font-weight-bold">#JK-7789</td>
                                            <td class="font-weight-medium">Nala</td>
                                            <td>Pen C1</td>
                                            <td>Oct 06, 2023</td>
                                            <td><span class="badge-product badge-ivomec">IVOMEC</span></td>
                                            <td class="font-weight-bold">25ml</td>
                                            <td class="text-muted">S. Omondi</td>
                                        </tr>
                                        <tr>
                                            <td class="font-weight-bold">#JK-9121</td>
                                            <td class="font-weight-medium">Zoe</td>
                                            <td>Pen B2</td>
                                            <td>Oct 05, 2023</td>
                                            <td><span class="badge-product badge-valbazen">VALBAZEN</span></td>
                                            <td class="font-weight-bold">30ml</td>
                                            <td class="text-muted">M. Abdi</td>
                                        </tr>
                                        <tr>
                                            <td class="font-weight-bold">#JK-8833</td>
                                            <td class="font-weight-medium">Coco</td>
                                            <td>Pen A1</td>
                                            <td>Oct 04, 2023</td>
                                            <td><span class="badge-product badge-cydectin">CYDECTIN</span></td>
                                            <td class="font-weight-bold">15ml</td>
                                            <td class="text-muted">S. Omondi</td>
                                        </tr>
                                        <tr>
                                            <td class="font-weight-bold">#JK-9944</td>
                                            <td class="font-weight-medium">Ruby</td>
                                            <td>Pen C3</td>
                                            <td>Oct 03, 2023</td>
                                            <td><span class="badge-product badge-ivomec">IVOMEC</span></td>
                                            <td class="font-weight-bold">20ml</td>
                                            <td class="text-muted">M. Abdi</td>
                                        </tr>
                                        <tr>
                                            <td class="font-weight-bold">#JK-7654</td>
                                            <td class="font-weight-medium">Heifer-4</td>
                                            <td>Pen B4</td>
                                            <td>Oct 02, 2023</td>
                                            <td><span class="badge-product badge-valbazen">VALBAZEN</span></td>
                                            <td class="font-weight-bold">25ml</td>
                                            <td class="text-muted">S. Omondi</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="px-4 py-3 bg-light border-top d-flex justify-content-between align-items-center">
                                <div id="pageInfo" class="text-muted small italic font-weight-medium" style="font-size: 0.7rem;">Page 1 of 5</div>
                                <div class="custom-pagination d-flex gap-2" id="customPagination">
                                    <button class="pagination-arrow" id="prevPage">
                                        <span class="material-symbols-outlined" style="font-size: 1.2rem;">chevron_left</span>
                                    </button>
                                    <div id="numberButtons" class="d-flex gap-2"></div>
                                    <button class="pagination-arrow" id="nextPage">
                                        <span class="material-symbols-outlined" style="font-size: 1.2rem;">chevron_right</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Right: Schedule & Past Products -->
                    <div class="col-lg-4 px-2">
                        <!-- Upcoming Schedule -->
                        <div class="report-history-card p-4 mb-4 border-0 shadow-sm" style="border: 1px solid rgba(0,0,0,0.05);">
                            <h5 class="font-headline font-weight-black mb-4 d-flex align-items-center" style="font-size: 0.95rem;">
                                <span class="material-symbols-outlined text-primary mr-3" style="font-size: 1.25rem;">event_note</span>
                                Upcoming Schedule
                            </h5>
                            
                            <div class="schedule-list">
                                <!-- Item 1 -->
                                <div class="schedule-card-mini border-primary-heavy d-flex align-items-center">
                                    <div class="date-box-mini">
                                        <div class="text-primary uppercase font-weight-black" style="font-size: 8px;">OCT</div>
                                        <div class="text-primary font-weight-black" style="font-size: 1.25rem; line-height: 1;">15</div>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h6 class="font-weight-black mb-1 text-on-surface" style="font-size: 0.85rem;">Pen B2 - Herd C</h6>
                                        <div class="d-flex flex-column gap-1">
                                            <p class="text-muted mb-0" style="font-size: 0.65rem;">Target: 24 Heifers</p>
                                            <p class="text-primary font-weight-black mb-0" style="font-size: 0.65rem;">Valbazen</p>
                                        </div>
                                    </div>
                                </div>

                                <!-- Item 2 -->
                                <div class="schedule-card-mini border-tertiary-heavy d-flex align-items-center">
                                    <div class="date-box-mini">
                                        <div class="text-success uppercase font-weight-black" style="font-size: 8px;">OCT</div>
                                        <div class="text-success font-weight-black" style="font-size: 1.25rem; line-height: 1;">18</div>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h6 class="font-weight-black mb-1 text-on-surface" style="font-size: 0.85rem;">Isolation Ward</h6>
                                        <div class="d-flex flex-column gap-1">
                                            <p class="text-muted mb-0" style="font-size: 0.65rem;">Target: 04 Animals</p>
                                            <p class="text-success font-weight-black mb-0" style="font-size: 0.65rem;">Cydectin</p>
                                        </div>
                                    </div>
                                </div>

                                <!-- Item 3 -->
                                <div class="schedule-card-mini border-secondary-heavy d-flex align-items-center">
                                    <div class="date-box-mini">
                                        <div class="text-secondary uppercase font-weight-black" style="font-size: 8px;">OCT</div>
                                        <div class="text-secondary font-weight-black" style="font-size: 1.25rem; line-height: 1;">22</div>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h6 class="font-weight-black mb-1 text-on-surface" style="font-size: 0.85rem;">Pen A4 - Maternity</h6>
                                        <div class="d-flex flex-column gap-1">
                                            <p class="text-muted mb-0" style="font-size: 0.65rem;">Target: 12 Cows</p>
                                            <p class="text-secondary font-weight-black mb-0" style="font-size: 0.65rem;">Ivomec</p>
                                        </div>
                                    </div>
                                </div>

                                <!-- Item 4 -->
                                <div class="schedule-card-mini border-primary-heavy d-flex align-items-center">
                                    <div class="date-box-mini">
                                        <div class="text-primary uppercase font-weight-black" style="font-size: 8px;">OCT</div>
                                        <div class="text-primary font-weight-black" style="font-size: 1.25rem; line-height: 1;">25</div>
                                    </div>
                                    <div class="flex-grow-1">
                                        <h6 class="font-weight-black mb-1 text-on-surface" style="font-size: 0.85rem;">General Herd A</h6>
                                        <div class="d-flex flex-column gap-1">
                                            <p class="text-muted mb-0" style="font-size: 0.65rem;">Target: 45 Animals</p>
                                            <p class="text-primary font-weight-black mb-0" style="font-size: 0.65rem;">Valbazen</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <a href="#" class="btn btn-link w-100 text-center text-primary font-weight-bold d-flex align-items-center justify-content-center gap-2" style="font-size: 0.75rem; text-decoration: none;">
                                View Full Calendar
                                <span class="material-symbols-outlined" style="font-size: 1rem;">arrow_forward</span>
                            </a>
                        </div>

                        <!-- Past Products -->
                        <div class="report-history-card p-4 mb-4 border-0 shadow-sm" style="border: 1px solid rgba(0,0,0,0.05);">
                            <h5 class="font-headline font-weight-black mb-4 d-flex align-items-center" style="font-size: 0.95rem;">
                                <span class="material-symbols-outlined text-tertiary mr-3" style="font-size: 1.25rem;">history</span>
                                Past Products Used
                            </h5>

                            <!-- Valbazen Past Entry -->
                            <div class="schedule-card-mini border-tertiary-heavy d-flex align-items-center">
                                <div class="date-box-mini">
                                    <div class="text-success uppercase font-weight-black" style="font-size: 8px;">OCT</div>
                                    <div class="text-success font-weight-black" style="font-size: 1.25rem; line-height: 1;">12</div>
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="font-weight-black mb-1 text-on-surface" style="font-size: 0.85rem;">Valbazen Oral</h6>
                                    <p class="text-muted mb-1" style="font-size: 0.65rem;">Total Treated: 42 Animals</p>
                                    <div class="progress progress-micro">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 42%" aria-valuenow="42" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>

                            <!-- Cydectin Past Entry -->
                            <div class="schedule-card-mini border-primary-heavy d-flex align-items-center">
                                <div class="date-box-mini">
                                    <div class="text-primary uppercase font-weight-black" style="font-size: 8px;">OCT</div>
                                    <div class="text-primary font-weight-black" style="font-size: 1.25rem; line-height: 1;">09</div>
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="font-weight-black mb-1 text-on-surface" style="font-size: 0.85rem;">Cydectin Pour-on</h6>
                                    <p class="text-muted mb-1" style="font-size: 0.65rem;">Total Treated: 35 Animals</p>
                                    <div class="progress progress-micro">
                                        <div class="progress-bar bg-primary" role="progressbar" style="width: 35%" aria-valuenow="35" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>

                            <!-- Ivomec Past Entry -->
                            <div class="schedule-card-mini border-secondary-heavy d-flex align-items-center">
                                <div class="date-box-mini">
                                    <div class="text-secondary uppercase font-weight-black" style="font-size: 8px;">OCT</div>
                                    <div class="text-secondary font-weight-black" style="font-size: 1.25rem; line-height: 1;">05</div>
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="font-weight-black mb-1 text-on-surface" style="font-size: 0.85rem;">Ivomec Injection</h6>
                                    <p class="text-muted mb-1" style="font-size: 0.65rem;">Total Treated: 23 Animals</p>
                                    <div class="progress progress-micro">
                                        <div class="progress-bar bg-secondary" role="progressbar" style="width: 23%" aria-valuenow="23" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>

                            <div class="stock-alert-box p-3 mt-4 rounded-lg" style="background: rgba(32, 98, 35, 0.05); border: 1px solid rgba(32, 98, 35, 0.1);">
                                <div class="d-flex align-items-center gap-2 mb-2">
                                    <span class="material-symbols-outlined text-primary" style="font-size: 1rem; font-variation-settings: 'FILL' 1;">error</span>
                                    <span class="font-weight-black text-primary text-uppercase" style="font-size: 0.65rem; letter-spacing: 0.5px;">Stock Advisory</span>
                                </div>
                                <p class="mb-0 text-on-surface-variant font-weight-medium" style="font-size: 0.7rem; line-height: 1.5;">
                                    Cydectin stock is <span class="font-weight-bold">low (1.5L)</span>. Reorder suggested for next week's session.
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
    <script src="../plugins/alert.js"></script>
    <script src="../js/functions.js"></script>
    
    <!-- DataTables JS -->
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.4.0/js/responsive.bootstrap4.min.js"></script>

    <script>
        $(document).ready(function() {
            const table = $('#dewormingLogTable').DataTable({
                responsive: true,
                paging: true,
                pageLength: 10,
                searching: true,
                info: true,
                dom: '<"d-none"f>t',
                ordering: true,
                drawCallback: function(settings) {
                    updateCustomPagination(settings);
                }
            });

            function updateCustomPagination(settings) {
                const api = new $.fn.dataTable.Api(settings);
                const pageInfo = api.page.info();
                
                $('#pageInfo').text(`Page ${pageInfo.page + 1} of ${pageInfo.pages}`);
                
                $('#prevPage').prop('disabled', pageInfo.page === 0);
                $('#nextPage').prop('disabled', pageInfo.page === pageInfo.pages - 1);
                
                let buttonsHtml = '';
                const startPage = Math.max(0, pageInfo.page - 1);
                const endPage = Math.min(pageInfo.pages, startPage + 3);
                
                for (let i = startPage; i < endPage; i++) {
                    buttonsHtml += `<button class="page-btn ${i === pageInfo.page ? 'active' : ''}" data-page="${i}">${i + 1}</button>`;
                }
                $('#numberButtons').html(buttonsHtml);
            }

            $(document).on('click', '.page-btn', function() {
                table.page($(this).data('page')).draw('page');
            });

            $('#prevPage').on('click', function() {
                table.page('previous').draw('page');
            });

            $('#nextPage').on('click', function() {
                table.page('next').draw('page');
            });
        });
    </script>
</body>
</html>
