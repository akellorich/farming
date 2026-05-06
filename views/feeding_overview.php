<?php
/**
 * Jukam Dairy Management System - Feeding Overview
 * File: views/feeding_overview.php
 * Implementation: High-fidelity transition from design assets.
 */
$base_path = '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feeding Overview | Jukam Farm</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/navigation.css">
    <link rel="stylesheet" href="../css/feeding.css">
    <link rel="stylesheet" href="../css/animals.css">
    <link rel="stylesheet" href="../css/alert.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    
    <!-- DataTables Advanced Styles -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.4.0/css/responsive.bootstrap4.min.css"/>

    <style>
        .progress-bar-container {
            height: 8px;
            background-color: var(--surface-container-high);
            border-radius: 999px;
            overflow: hidden;
            margin-top: 0.5rem;
        }
        .progress-bar-fill {
            height: 100%;
            background-color: var(--tertiary);
            border-radius: 999px;
        }
        .dt-buttons { gap: 0.75rem !important; display: flex; }
        .dt-button {
            padding: 0.45rem 1rem !important;
            border-radius: 0.4rem !important;
            font-size: 0.65rem !important; /* Slightly increased for better balance */
            font-weight: 600 !important;
            text-transform: none !important;
            border: 1px solid rgba(0,0,0,0.08) !important;
            background-color: white !important;
            color: var(--on-surface-variant) !important;
            transition: all 0.2s !important;
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            gap: 4px !important;
        }

        .dt-button span.material-symbols-outlined {
            font-size: 0.95rem !important;
            margin-top: -1px !important; /* Visual nudge for optical centering */
        }

        /* --- DataTables Responsive Customizations (FORCED) --- */
        table.dataTable.dtr-inline.collapsed > tbody > tr > td.dtr-control,
        table.dataTable.dtr-inline.collapsed > tbody > tr > th.dtr-control {
            position: relative !important;
            padding-left: 45px !important; 
            vertical-align: middle !important;
            text-align: left !important;
        }

        table.dataTable.dtr-inline.collapsed > tbody > tr > td.dtr-control:before,
        table.dataTable.dtr-inline.collapsed > tbody > tr > th.dtr-control:before {
            top: 50% !important;
            left: 12px !important; 
            height: 20px !important;
            width: 20px !important;
            margin-top: -10px !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            position: absolute !important;
            color: white !important;
            border: none !important;
            border-radius: 4px !important;
            box-shadow: 0 2px 5px rgba(32, 98, 35, 0.25) !important;
            content: '+' !important;
            background-color: #206223 !important;
            font-weight: 700 !important;
            font-size: 14px !important;
            font-family: inherit !important;
            line-height: normal !important;
            transform: none !important; 
            z-index: 5 !important;
            text-align: center !important;
            text-indent: 0 !important;
        }

        table.dataTable.dtr-inline.collapsed > tbody > tr.parent > td.dtr-control:before,
        table.dataTable.dtr-inline.collapsed > tbody > tr.parent > th.dtr-control:before {
            content: '-' !important;
            background-color: #ba1a1a !important;
        }
        /* Ensure Actions column stays visible and aligned */
        @media (max-width: 768px) {
            .feeding-table td:last-child {
                text-align: right !important;
                padding-right: 1rem !important;
            }
        }
        /* Shift Toggle Styles */
        .shift-toggle-btn {
            border: 1px solid #e2e8f0;
            background: white;
            font-size: 0.725rem;
            font-weight: 500;
            padding: 0.65rem 0.5rem;
            border-radius: 6px;
            transition: all 0.2s;
            color: #64748b;
            text-align: center;
        }
        .shift-toggle-btn:hover {
            background-color: #f8fafc;
        }
        .shift-toggle-btn.active {
            background-color: #f1f5f1 !important;
            color: #206223 !important;
            border-color: #206223 !important;
            font-weight: 700;
        }

        #newFeedingModal .form-control-custom,
        #newFeedingModal .input-group-text {
            padding-top: 0 !important;
            padding-bottom: 0 !important;
            height: 38px !important;
            font-size: 0.775rem !important;
            padding-left: 0.75rem !important;
        }

        #newFeedingModal textarea.form-control-custom {
            padding-top: 0.5rem !important;
            padding-bottom: 0.5rem !important;
            height: auto !important;
        }

        .invalid-feedback-custom {
            display: none;
            width: 100%;
            margin-top: 0.25rem;
            font-size: 0.675rem;
            color: #ef4444;
            font-weight: 500;
        }

        /* jQuery UI Datepicker Overrides */
        .ui-datepicker-month, .ui-datepicker-year {
            font-size: 11.5px !important;
            padding: 3px 4px !important;
            height: auto !important;
            border-radius: 4px !important;
            border: 1px solid #e2e8f0 !important;
            margin: 0 2px !important;
        }

        #cancelFeeding:hover {
            background-color: #f1f5f9 !important;
            color: #0f172a !important;
            border-color: #94a3b8 !important;
        }
    </style>
</head>
<body class="bg-background">

    <!-- Modular Sidebar -->
    <?php include 'navigation.php'; ?>

    <!-- Modular Header -->
    <?php include 'header.php'; ?>

    <!-- Modular Modals -->
    <?php include 'modals.php'; ?>

    <!-- Main Content Area -->
    <main class="main-content">
        <div class="container-fluid pt-1 px-2">
            <!-- Header Section -->
            <div class="row align-items-center mb-2 mt-2">
                <div class="col">
                    <h2 class="font-headline font-weight-bold text-on-surface" style="font-size: 1.1rem;">
                        Feeding Overview
                    </h2>
                </div>
                <div class="col-auto">
                    <button class="btn btn-success d-flex align-items-center px-3" id="openFeedingModalBtn" style="background-color: #206223; border: none; font-size: 0.85rem; height: 38px; border-radius: 6px; font-weight: 500;">
                        <span class="material-symbols-outlined mr-2" style="font-size: 1.2rem;">add</span>
                        Add New Log
                    </button>
                </div>
            </div>

            <!-- Top Summary Bento Grid -->
            <style>
@media (max-width: 576px) {
    .container-fluid.px-4 {
        padding-left: 0.6rem !important;
        padding-right: 0.6rem !important;
    }

    .feeding-header-grid {
        grid-template-columns: repeat(2, 1fr);
        gap: 0.5rem;
    }
    
    .feeding-stat-card {
        padding: 0.75rem;
        min-height: 100px;
    }

    .feeding-stat-card p.font-headline {
        font-size: 0.55rem !important;
    }

    .feeding-stat-card h2.font-headline {
        font-size: 1.1rem !important;
    }

    /* Modal Mobile Density */
    #newFeedingModal .small {
        font-size: 0.65rem !important;
    }

    #newFeedingModal .form-control-custom {
        font-size: 0.75rem !important;
        height: 38px !important;
        padding-left: 0.5rem !important;
    }

    #newFeedingModal .input-group-text {
        font-size: 0.65rem !important;
    }

    #newFeedingModal .p-4 {
        padding: 0.6rem !important;
    }

    #newFeedingModal .btn-success, 
    #newFeedingModal #cancelFeeding {
        font-size: 0.7rem !important;
        height: 32px !important;
        padding: 0 0.75rem !important;
    }

    /* Table Mobile Density */
    .feeding-table thead th {
        font-size: 0.6rem !important;
        text-transform: capitalize !important;
        font-weight: 500 !important;
        letter-spacing: normal !important;
    }

    .feeding-table tbody td {
        font-size: 0.65rem !important;
    }

    .feeding-table tbody td:first-child {
        font-size: 0.7rem !important; /* Date remains larger */
    }

    /* Stack Schedule Header */
    .feeding-schedule-card > .d-flex.justify-content-between {
        flex-direction: column !important;
        align-items: flex-start !important;
        gap: 1rem !important;
        padding: 1.25rem !important;
    }

    #feedingExportContainer {
        width: 100% !important;
        justify-content: flex-start !important;
        display: flex !important;
        flex-direction: row !important; /* Ensure buttons stay side-by-side */
    }

    /* Stack Filter Controls */
    .feeding-schedule-card .p-4.pt-3 > .d-flex.justify-content-between {
        flex-direction: column !important;
        align-items: stretch !important;
        gap: 0.75rem !important;
    }

    .feeding-schedule-card .d-flex.align-items-center.gap-4 {
        flex-direction: column !important;
        align-items: stretch !important;
        gap: 0.85rem !important; /* Increased vertical gap for mobile */
    }

    .feeding-schedule-card select, 
    .feeding-schedule-card .input-group {
        width: 100% !important;
    }

    /* Modal Close Button Adjustment */
    #dismissFeedingModal {
        position: absolute !important;
        top: 10px !important;
        right: 25px !important;
        background: rgba(0,0,0,0.08) !important;
    }
}

/* --- Animal List Row-wise Display (Universal) --- */
#modalAnimalList {
    display: flex !important;
    flex-direction: column !important;
    gap: 0.75rem !important;
    padding: 1rem !important;
}

#modalAnimalList .animal-card-wrapper {
    width: 100% !important;
    display: block !important;
}

.animal-card-item {
    width: 100% !important;
    display: flex !important;
    align-items: center !important;
    justify-content: space-between !important;
    padding: 0.5rem 0.85rem !important; /* Tightened padding */
    background-color: white;
    border-radius: 0.5rem;
    border: 1px solid #e2e8f0;
    box-shadow: 0 1px 2px rgba(0,0,0,0.03);
    border-left: 4px solid #206223 !important;
    transition: all 0.2s ease;
}

.animal-card-item:hover {
    transform: translateX(4px);
    border-color: #206223;
}

/* --- Modal Dark Mode Support --- */
body.dark-theme .animal-modal-container {
    background-color: #0d1117 !important;
    border: 1px solid #30363d;
}

body.dark-theme .animal-modal-container > .d-flex.flex-column {
    background-color: #0d1117 !important;
}

body.dark-theme #newFeedingModal .bg-white,
body.dark-theme #newFeedingModal .border-bottom,
body.dark-theme #newFeedingModal .border-top {
    background-color: #161b22 !important;
    border-color: #30363d !important;
    color: #c9d1d9 !important;
}

body.dark-theme #newFeedingModal .flex-grow-1.overflow-auto {
    background-color: #0d1117 !important;
}

body.dark-theme #newFeedingModal label {
    color: #8b949e !important;
}

body.dark-theme #newFeedingModal .form-control-custom,
body.dark-theme #newFeedingModal .input-group-text {
    background-color: #161b22 !important;
    border-color: #30363d !important;
    color: #c9d1d9 !important;
}

body.dark-theme #modalAnimalList {
    background-color: #0d1117 !important;
    border-color: #30363d !important;
}

body.dark-theme .animal-card-item {
    background-color: #161b22 !important;
    border-color: #30363d !important;
}

body.dark-theme #modalAnimalList .animal-card-item {
    background-color: #161b22 !important;
    border-color: #30363d !important;
}

body.dark-theme #modalAnimalList span {
    color: #c9d1d9 !important;
}

body.dark-theme #newFeedingModal h4 {
    color: #f0f6fc !important;
}

body.dark-theme #newFeedingModal .text-muted {
    color: #8b949e !important;
}

/* --- DataTables & Actions Dark Theme --- */
body.dark-theme .dt-button {
    background-color: #161b22 !important;
    border-color: #30363d !important;
    color: #c9d1d9 !important;
}

body.dark-theme .dt-button:hover {
    background-color: #30363d !important;
    color: #f0f6fc !important;
}

body.dark-theme #penFilter, 
body.dark-theme #feedTypeFilter,
body.dark-theme #feedingSearch,
body.dark-theme .input-group-text {
    background-color: #161b22 !important;
    color: #c9d1d9 !important;
    border: 1px solid #30363d !important;
    font-size: 0.7rem !important;
}

body.dark-theme .dropdown-menu {
    background-color: #161b22 !important;
    border: 1px solid #30363d !important;
    box-shadow: 0 10px 25px rgba(0,0,0,0.5) !important;
}

body.dark-theme .dropdown-item {
    color: #c9d1d9 !important;
    font-size: 0.725rem !important;
}

body.dark-theme .dropdown-item span.material-symbols-outlined {
    margin-right: 0.75rem !important; /* Increased space in the popup menu */
    opacity: 0.8 !important;
}

body.dark-theme .alert-warning {
    background: linear-gradient(135deg, #2c2411, #1e190b) !important;
    border: 1px solid #453b1b !important;
    color: #ffdc7d !important;
}

body.dark-theme .alert-warning .text-muted {
    color: #ffdc7d !important;
    opacity: 0.7;
}

body.dark-theme .alert-warning h3 {
    color: #ffd666 !important;
}

body.dark-theme .stock-alert-item {
    background-color: #1c1c1a !important;
    border-color: #332b12 !important;
}

body.dark-theme .stock-alert-item .text-on-surface {
    color: #f0f6fc !important;
}

body.dark-theme .feeding-table tr:hover {
    background-color: rgba(255,255,255,0.02) !important;
}

</style>
            <div class="feeding-header-grid">
                <div class="feeding-stat-card botanical-shadow">
                    <div>
                        <p class="font-headline text-muted font-weight-bold mb-2" style="font-size: 0.65rem; letter-spacing: 0.05rem; text-transform: uppercase;">Total Consumed (Today)</p>
                        <div class="d-flex align-items-baseline gap-2">
                            <h2 class="font-headline font-weight-bold mb-0" style="font-size: 1.5rem; color: #206223;" id="statTodayConsumed">0</h2>
                            <span class="text-muted small">kg</span>
                        </div>
                    </div>
                    <div class="d-flex align-items-center gap-1 font-weight-bold" style="font-size: 0.7rem;" id="statTrendContainer">
                        <span class="material-symbols-outlined" style="font-size: 1rem;" id="statTrendIcon">remove</span>
                        <span id="statTrendText">0% vs yesterday</span>
                    </div>
                </div>
                <!-- ... other cards ... -->
                <div class="feeding-stat-card botanical-shadow">
                    <div>
                        <p class="font-headline text-muted font-weight-bold mb-2" style="font-size: 0.65rem; letter-spacing: 0.05rem; text-transform: uppercase;">Avg Ration Per Cow</p>
                        <div class="d-flex align-items-baseline gap-2">
                            <h2 class="font-headline font-weight-bold mb-0 text-on-surface" style="font-size: 1.5rem;" id="statAvgRation">0.0</h2>
                            <span class="text-muted small">kg/day</span>
                        </div>
                    </div>
                    <div class="d-flex align-items-center gap-1 text-secondary font-weight-bold" style="font-size: 0.7rem;">
                        <span class="material-symbols-outlined" style="font-size: 1rem;">info</span>
                        <span>Daily feeding density</span>
                    </div>
                </div>

                <div class="feeding-stat-card botanical-shadow">
                    <div>
                        <p class="font-headline text-muted font-weight-bold mb-2" style="font-size: 0.65rem; letter-spacing: 0.05rem; text-transform: uppercase;">Silage Level (Pit A)</p>
                        <div class="d-flex align-items-baseline gap-2">
                            <h2 class="font-headline font-weight-bold mb-0 text-on-surface" style="font-size: 1.5rem;">68</h2>
                            <span class="text-muted small">%</span>
                        </div>
                        <div class="progress-bar-container">
                            <div class="progress-bar-fill" style="width: 68%;"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Content Layout: Main Table & Right Column -->
            <div class="row">
                <!-- Left Column: Feeding Schedule & Ration Composition -->
                <div class="col-lg-8">
                    <!-- Daily Feeding Schedule Card -->
                    <div class="feeding-schedule-card botanical-shadow mb-3">
                        <div class="d-flex justify-content-between align-items-center p-4 border-bottom">
                            <h5 class="font-headline font-weight-bold mb-0" style="font-size: 0.85rem;">Daily Feeding Schedule</h5>
                            <div id="feedingExportContainer" class="d-flex gap-2"></div>
                        </div>
                        <div class="p-4 pt-3">
                            <div class="d-flex align-items-center justify-content-between flex-wrap gap-4 mb-3">
                                <div class="d-flex align-items-center gap-4">
                                    <select class="form-control form-control-sm border-0 bg-light" id="penFilter" style="width: 150px; border-radius: 0.5rem; font-size: 0.7rem;">
                                        <option value="">All Pens</option>
                                        <option value="Pen 12">Pen 12</option>
                                        <option value="Pen 04">Pen 04</option>
                                        <option value="Pen 08">Pen 08</option>
                                    </select>
                                    <select class="form-control form-control-sm border-0 bg-light" id="feedTypeFilter" style="width: 150px; border-radius: 0.5rem; font-size: 0.7rem;">
                                        <option value="">All Feed Types</option>
                                        <option value="TMR Mix A">TMR Mix A</option>
                                        <option value="Calf Starter">Calf Starter</option>
                                        <option value="Hay / Silage">Hay / Silage</option>
                                    </select>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="input-group input-group-sm" style="width: 220px;">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text bg-light border-0" style="border-radius: 2rem 0 0 2rem;"><span class="material-symbols-outlined" style="font-size: 1.1rem; color: #94a3b8;">search</span></span>
                                        </div>
                                        <input type="text" class="form-control form-control-sm border-0 bg-light pl-1" id="feedingSearch" placeholder="Search daily schedule..." style="border-radius: 0 2rem 2rem 0; height: 32px; font-size: 0.7rem;">
                                    </div>
                                </div>
                            </div>

                            <div>
                                <table class="table feeding-table mb-0" id="feedingDataTable">
                                    <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th>Shift Time</th>
                                            <th>Pen ID</th>
                                            <th>Feed Type</th>
                                            <th>Quantity</th>
                                            <th>Animals Fed</th>
                                            <th>Status</th>
                                            <th class="text-right">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Data populated via DataTables AJAX -->
                                    </tbody>
                                </table>
                            </div>
                            <!-- Custom Pagination -->
                            <div class="d-flex justify-content-between align-items-center mt-4">
                                <div id="pageInfo" class="text-muted small">Page 1 of 5</div>
                                <div class="custom-pagination d-flex gap-2" id="customPagination">
                                    <button class="pagination-arrow" id="prevPage">
                                        <span class="material-symbols-outlined">chevron_left</span>
                                    </button>
                                    <div id="numberButtons" class="d-flex gap-2"></div>
                                    <button class="pagination-arrow" id="nextPage">
                                        <span class="material-symbols-outlined">chevron_right</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Ration Composition Section -->
                    <div class="mb-3">
                        <h5 class="font-headline font-weight-bold mb-3" style="font-size: 0.85rem;">Ration Composition: Dairy Meal</h5>
                        <div class="ration-composition-grid">
                            <div class="ration-item-card botanical-shadow-sm">
                                <p class="text-muted small mb-1">Maize Germ</p>
                                <h4 class="font-headline text-primary mb-0" style="color: #206223 !important;">45%</h4>
                            </div>
                            <div class="ration-item-card botanical-shadow-sm">
                                <p class="text-muted small mb-1">Cotton Seed</p>
                                <h4 class="font-headline text-primary mb-0" style="color: #206223 !important;">20%</h4>
                            </div>
                            <div class="ration-item-card botanical-shadow-sm">
                                <p class="text-muted small mb-1">Soya Meal</p>
                                <h4 class="font-headline text-primary mb-0" style="color: #206223 !important;">30%</h4>
                            </div>
                            <div class="ration-item-card botanical-shadow-sm">
                                <p class="text-muted small mb-1">Minerals</p>
                                <h4 class="font-headline text-primary mb-0" style="color: #206223 !important;">5%</h4>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Column: Alerts, Trend & CTA -->
                <div class="col-lg-4">
                    <!-- Low Stock Alerts -->
                    <div class="chart-container-card botanical-shadow mb-3">
                        <div class="d-flex align-items-center mb-4" style="color: #78350f; gap: 0.6rem; margin-left: 0.5rem;">
                            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1; font-size: 1.2rem;">warning</span>
                            <h5 class="font-headline font-weight-bold mb-0" style="font-size: 0.85rem;">Low Stock Alerts</h5>
                        </div>
                        <div class="stock-alert-item bg-error-subtle">
                            <div class="d-flex align-items-center" style="gap: 1.5rem;">
                                <span class="material-symbols-outlined text-danger" style="font-size: 1.75rem; font-variation-settings: 'FILL' 1;">inventory_2</span>
                                <div>
                                    <p class="font-weight-bold mb-0 text-on-surface" style="font-size: 0.8rem;">Calf Pellets</p>
                                    <p class="text-muted mb-0" style="font-size: 0.65rem;">Stock: 450kg</p>
                                </div>
                            </div>
                            <span class="material-symbols-outlined text-muted" style="font-size: 1rem;">chevron_right</span>
                        </div>
                        <div class="stock-alert-item bg-warning-subtle">
                            <div class="d-flex align-items-center" style="gap: 1.5rem;">
                                <span class="material-symbols-outlined" style="font-size: 1.75rem; color: #78350f; font-variation-settings: 'FILL' 1;">inventory_2</span>
                                <div>
                                    <p class="font-weight-bold mb-0 text-on-surface" style="font-size: 0.8rem;">Young Stock Pencils</p>
                                    <p class="text-muted mb-0" style="font-size: 0.65rem;">Stock: 1,200kg</p>
                                </div>
                            </div>
                            <span class="material-symbols-outlined text-muted" style="font-size: 1rem;">chevron_right</span>
                        </div>
                    </div>

                    <!-- 7-Day Consumption -->
                    <div class="chart-container-card botanical-shadow mb-3">
                        <h5 class="font-headline font-weight-bold mb-1" style="font-size: 0.85rem;">7-Day Consumption</h5>
                        <div id="consumptionAreaChart" style="min-height: 180px;"></div>
                    </div>

                    <!-- Promo Card -->
                    <div class="feeding-promo-card">
                        <span class="material-symbols-outlined promo-icon-bg">analytics</span>
                        <div style="position: relative; z-index: 1;">
                            <h4 class="font-headline mb-2" style="font-size: 1.1rem; line-height: 1.2; font-weight: 500;">Optimize Your Herd's Nutrition</h4>
                            <p class="small mb-3" style="opacity: 0.9;">Unlock precision feeding insights with JUKAM Plus tools.</p>
                            <button class="btn btn-light btn-sm px-3" style="font-weight: 500; color: #206223;">Get Started</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>


    <!-- New Feeding Entry Modal -->
    <div class="animal-modal-overlay" id="newFeedingModal">
        <div class="modal-backdrop-blur"></div>
        <div class="animal-modal-container" style="max-width: 900px; border-radius: 0.5rem; overflow: hidden; background: white; display: flex; flex-direction: row; align-items: stretch;">
            <!-- Left Branding Column (Fixed Width & Height) -->
            <div class="modal-branding-column d-none d-md-flex" style="width: 320px; flex-shrink: 0; position: relative; color: white; padding: 3rem 2rem; flex-direction: column; justify-content: flex-end;">
                <div class="modal-branding-bg" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 1;">
                    <img src="https://images.unsplash.com/photo-1546445317-29f4545e9d53?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" style="width: 100%; height: 100%; object-fit: cover;">
                    <div class="modal-branding-gradient" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: linear-gradient(to top, rgba(32, 98, 35, 0.95) 0%, rgba(32, 98, 35, 0.4) 100%);"></div>
                </div>
                <div class="modal-branding-content" style="position: relative; z-index: 2;">
                    <i class="fa-solid fa-wheat-awn mb-3" style="font-size: 2.2rem; color: #fff; display: block;"></i>
                    <h3 class="font-headline mb-2" style="font-size: 1.5rem; font-weight: 600;">Precision Feeding</h3>
                    <p class="small mb-0 opacity-8" style="line-height: 1.4; font-weight: 400;">Manage institutional rations and track daily consumption targets for optimal herd health.</p>
                </div>
            </div>

            <!-- Right Form Column (Fills remaining width) -->
            <div class="d-flex flex-column flex-grow-1" style="min-width: 0;">
                <div class="px-4 py-3 border-bottom d-flex justify-content-between align-items-center bg-white" style="z-index: 5; position: relative;">
                    <div>
                        <h4 class="font-headline mb-2" style="font-size: 1.05rem; font-weight: 700; letter-spacing: -0.01em;">Log Feeding Record</h4>
                        <p class="text-muted mb-0" style="font-size: 0.725rem; opacity: 0.8;">Institutional nutrition audit for dairy & beef herd.</p>
                    </div>
                    <button class="btn btn-light rounded-circle p-1" style="width: 30px; height: 30px; background: rgba(0,0,0,0.06); border: none; position: absolute; top: 12px; right: 30px;" id="dismissFeedingModal">
                        <span class="material-symbols-outlined" style="font-size: 1.15rem;">close</span>
                    </button>
                </div>

                <div class="flex-grow-1 overflow-auto" style="background-color: #fafbf9; padding: 2rem;">
                    <div id="feedingValidationAlertContainer" class="mb-3"></div>
                    <!-- Selection Grid -->
                    <div class="row mb-3">
                        <div class="col-6 mb-3">
                            <label class="small text-muted mb-2 d-block" style="letter-spacing: 0.02rem; font-weight: 500;">Feeding Date</label>
                            <div class="position-relative">
                                <input type="text" class="form-control form-control-custom bg-white border" id="modalFeedingDate" value="<?php echo date('d-M-Y'); ?>" readonly style="border-radius: 6px; border-color: #e2e8f0 !important; font-weight: 400; cursor: pointer; padding-right: 35px;">
                                <span class="material-symbols-outlined" style="position: absolute; right: 12px; top: 50%; transform: translateY(-50%); font-size: 1.1rem; color: #64748b; pointer-events: none;">calendar_month</span>
                            </div>
                            <div class="invalid-feedback-custom" id="error-modalFeedingDate">Please select a date</div>
                        </div>
                        <div class="col-6 mb-3">
                            <label class="small text-muted mb-2 d-block" style="letter-spacing: 0.02rem; font-weight: 500;">Target Pen ID</label>
                            <select class="form-control form-control-custom bg-white border" id="modalPenSelect" style="border-radius: 6px; border-color: #e2e8f0 !important; width: 100%; font-weight: 400;">
                                <option value="" disabled selected>Choose a Pen...</option>
                            </select>
                            <div class="invalid-feedback-custom" id="error-modalPenSelect">Pen is required</div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-12 mb-3">
                            <label class="small text-muted mb-2 d-block" style="letter-spacing: 0.02rem; font-weight: 500;">Feeding Shift</label>
                            <div class="d-flex gap-2" id="modalShiftToggles">
                                <button type="button" class="btn shift-toggle-btn flex-grow-1" data-value="1">3 AM - Early Morning</button>
                                <button type="button" class="btn shift-toggle-btn flex-grow-1" data-value="2">11 AM - Mid Day</button>
                                <button type="button" class="btn shift-toggle-btn flex-grow-1" data-value="3">4 PM - Evening</button>
                                <input type="hidden" id="modalShiftSelect" value="">
                            </div>
                            <div class="invalid-feedback-custom" id="error-modalShiftSelect">Shift is required</div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-4 mb-3">
                            <label class="small text-muted mb-2 d-block" style="letter-spacing: 0.02rem; font-weight: 500;">Source Type</label>
                            <select class="form-control form-control-custom bg-white border" id="modalFeedSourceType" style="border-radius: 6px; border-color: #e2e8f0 !important; width: 100%; font-weight: 400;">
                                <option value="Feed" selected>Complete Feed</option>
                                <option value="Ration">Ration / Mix</option>
                            </select>
                        </div>
                        <div class="col-8 mb-3">
                            <label class="small text-muted mb-2 d-block" style="letter-spacing: 0.02rem; font-weight: 500;" id="modalFeedSelectionLabel">Select Feed</label>
                            <select class="form-control form-control-custom bg-white border" id="modalFeedId" style="border-radius: 6px; border-color: #e2e8f0 !important; width: 100%; font-weight: 400;">
                                <option value="" disabled selected>Loading...</option>
                            </select>
                            <div class="invalid-feedback-custom" id="error-modalFeedId">Feed selection is required</div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-4 mb-3">
                            <label class="small text-muted mb-2 d-block" style="letter-spacing: 0.02rem; font-weight: 500;">Total Weight</label>
                            <div class="input-group">
                                <input type="number" class="form-control form-control-custom bg-white" id="modalFeedingWeight" placeholder="0.00" style="border-radius: 6px 0 0 6px; border: 1px solid #e2e8f0; font-weight: 400;">
                                <div class="input-group-append">
                                    <span class="input-group-text bg-light border-left-0" style="font-weight: 500; border-radius: 0 6px 6px 0; border: 1px solid #e2e8f0; color: #64748b;">KG</span>
                                </div>
                            </div>
                            <div class="invalid-feedback-custom" id="error-modalFeedingWeight">Valid weight is required</div>
                        </div>
                        <div class="col-8 mb-3">
                            <!-- Placeholder for other info if needed -->
                        </div>
                    </div>

                    <!-- Animal Audit Card -->
                    <div class="mb-4">
                        <label class="small text-muted mb-2 d-block" style="letter-spacing: 0.02rem; font-weight: 500;">Animals in Pen</label>
                        <div class="border shadow-sm bg-white" style="min-height: 180px; max-height: 250px; overflow-y: auto; border-radius: 6px; border-color: #e2e8f0 !important;" id="modalAnimalList">
                            <div class="d-flex flex-column align-items-center justify-content-center h-100 py-5 text-center px-4">
                                <span class="material-symbols-outlined text-muted mb-3" style="font-size: 3rem; opacity: 0.2;">groups</span>
                                <p class="text-muted small italic mb-0">Identification ledger will populate once a pen is selected.</p>
                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-12">
                            <label class="small text-muted mb-2 d-block" style="letter-spacing: 0.02rem; font-weight: 500;">Observation Notes</label>
                            <textarea class="form-control form-control-custom bg-white border" id="modalFeedingNotes" rows="3" placeholder="Enter any significant pen observations..." style="font-size: 0.85rem; border-radius: 6px; resize: none; border-color: #e2e8f0 !important; width: 100%; font-weight: 400;"></textarea>
                        </div>
                    </div>
                </div>

                <div class="p-4 bg-white border-top d-flex justify-content-end align-items-center gap-4" style="z-index: 5;">
                    <button class="btn btn-outline-secondary px-4" style="font-size: 0.85rem; border-radius: 6px; font-weight: 500; border-color: #cbd5e1; color: #64748b; height: 48px;" id="cancelFeeding">Cancel</button>
                    <button class="btn btn-success px-5 shadow-sm" style="background-color: #206223; border-radius: 6px; font-size: 0.9rem; height: 48px; font-weight: 500;" id="saveFeedingBtn">Submit Record</button>
                </div>
            </div>
        </div>
    </div>
            </div>
        </div>
    </div>

    <!-- Animals Fed Detail Modal -->
    <div class="animal-modal-overlay" id="animalsFedModal">
        <div class="modal-backdrop-blur"></div>
        <div class="animal-modal-container shadow-lg" style="max-width: 550px; border-radius: 1rem; overflow: hidden; background: white; display: flex; flex-direction: column;">
            <div class="px-4 py-3 border-bottom d-flex justify-content-between align-items-center bg-white">
                <div>
                    <h4 class="font-headline mb-0" style="font-size: 1.05rem; font-weight: 700;">Animals Fed</h4>
                    <p class="text-muted mb-0" style="font-size: 0.725rem;" id="animalsFedModalSubtitle">List of animals in the selected pen.</p>
                </div>
                <button class="btn btn-light rounded-circle p-1" style="width: 32px; height: 32px; background: rgba(0,0,0,0.06); border: none;" id="closeAnimalsFedModal">
                    <span class="material-symbols-outlined" style="font-size: 1.2rem;">close</span>
                </button>
            </div>
            <div class="flex-grow-1 overflow-auto" style="max-height: 400px; background-color: #fafbf9;">
                <div id="animalsFedList" class="p-3">
                    <!-- Animals will be loaded here -->
                </div>
            </div>
            <div class="p-3 bg-white border-top d-flex justify-content-end">
                <button class="btn btn-outline-secondary px-4 py-2" style="font-size: 0.85rem; border-radius: 6px;" id="dismissAnimalsFedModal">Close</button>
            </div>
        </div>
    </div>

    <!-- Global Scripts -->
    <script src="../plugins/jquery-3.6.1.js"></script>
    <script src="../plugins/jquery-ui.js"></script>
    <script src="../plugins/popper.js"></script>
    <script src="../plugins/bootstrap.js"></script>
    <script src="../plugins/alert.js"></script>
    <script src="../js/functions.js?v=<?php echo time(); ?>"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.3/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.3/js/buttons.bootstrap4.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.3/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/2.3.3/js/buttons.print.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.4.0/js/responsive.bootstrap4.min.js"></script>
    <script src="../js/header.js"></script>

    <script>
    $(document).ready(function() {
        const isDark = $('body').hasClass('dark-theme');
        
        // --- Fetch Dashboard Stats ---
        function loadDashboardStats() {
            $.getJSON('../controllers/feedingoperations.php?action=getfeedingstats', function(res) {
                $('#statTodayConsumed').text(res.today_consumed || '0');
                $('#statAvgRation').text(res.avg_ration_per_cow || '0.0');
                
                const trend = parseFloat(res.trend) || 0;
                const trendText = Math.abs(trend) + '% vs yesterday';
                $('#statTrendText').text(trendText);
                
                const trendContainer = $('#statTrendContainer');
                const trendIcon = $('#statTrendIcon');
                
                if (trend > 0) {
                    trendContainer.removeClass('text-danger text-secondary').addClass('text-success');
                    trendIcon.text('trending_up');
                } else if (trend < 0) {
                    trendContainer.removeClass('text-success text-secondary').addClass('text-danger');
                    trendIcon.text('trending_down');
                } else {
                    trendContainer.removeClass('text-success text-danger').addClass('text-secondary');
                    trendIcon.text('horizontal_rule');
                }
            });
        }
        loadDashboardStats();

        // --- Consumption Chart ---
        const chartOptions = {
            series: [{
                name: 'Consumption (kg)',
                data: [] // Will be populated dynamically
            }],
            chart: {
                type: 'area',
                height: 250, // Slightly taller to accommodate axis titles
                toolbar: { show: false },
                background: 'transparent',
                theme: { mode: isDark ? 'dark' : 'light' },
                fontFamily: 'Inter, sans-serif'
            },
            colors: ['#206223'],
            dataLabels: { enabled: false },
            stroke: { curve: 'smooth', width: 3 },
            fill: {
                type: 'gradient',
                gradient: {
                    shadeIntensity: 1,
                    opacityFrom: 0.45,
                    opacityTo: 0.05,
                    stops: [20, 100]
                }
            },
            grid: {
                borderColor: isDark ? '#30363d' : '#f1f1f1',
                padding: { top: 0, right: 0, bottom: 0, left: 10 }
            },
            xaxis: {
                categories: [], // Will be populated dynamically
                title: {
                    text: 'Days of the Week',
                    style: {
                        color: isDark ? '#8b949e' : '#64748b',
                        fontSize: '12px',
                        fontWeight: 600
                    }
                },
                labels: {
                    style: {
                        colors: isDark ? '#8b949e' : '#94a3b8',
                        fontSize: '10px'
                    }
                },
                axisBorder: { show: false },
                axisTicks: { show: false }
            },
            yaxis: { 
                title: {
                    text: 'Quantity (KG)',
                    style: {
                        color: isDark ? '#8b949e' : '#64748b',
                        fontSize: '12px',
                        fontWeight: 600
                    }
                },
                labels: {
                    style: {
                        colors: isDark ? '#8b949e' : '#94a3b8',
                        fontSize: '10px'
                    },
                    formatter: function (value) {
                        return value.toLocaleString() + " kg";
                    }
                }
            },
            tooltip: {
                theme: isDark ? 'dark' : 'light',
                y: {
                    formatter: function (val) {
                        return val.toLocaleString() + " kg";
                    }
                }
            }
        };

        const chart = new ApexCharts(document.querySelector("#consumptionAreaChart"), chartOptions);
        chart.render();

        // --- Fetch Weekly Consumption Data ---
        function loadWeeklyConsumption() {
            $.getJSON('../controllers/feedingoperations.php?action=getweeklyconsumption', function(res) {
                if (res && res.length > 0) {
                    const labels = res.map(item => item.day_label.toUpperCase());
                    const values = res.map(item => parseFloat(item.total_kg));
                    
                    chart.updateOptions({
                        xaxis: { categories: labels },
                        series: [{
                            name: 'Consumption (kg)',
                            data: values
                        }]
                    });
                }
            });
        }
        loadWeeklyConsumption();

        // --- DataTables Integration ---
        const table = $('#feedingDataTable').DataTable({
            "ajax": {
                "url": "../controllers/feedingoperations.php?action=getfeedinglogs",
                "dataSrc": ""
            },
            "columns": [
                { 
                    "data": "logdate",
                    "render": function(data) {
                        // Format date to MMM DD, YYYY if needed, or keep as is
                        return `<span class="text-muted" style="white-space: nowrap; font-size: 0.7rem;">${data}</span>`;
                    }
                },
                { 
                    "data": "shiftname",
                    "render": function(data) {
                        return `<span class="font-weight-medium">${data}</span>`;
                    }
                },
                { "data": "penname" },
                { "data": "feed_display_name" },
                { 
                    "data": "quantitykg",
                    "render": function(data) {
                        return `<strong>${data}</strong> <small class="text-muted">kg</small>`;
                    }
                },
                { 
                    "data": "animal_count",
                    "render": function(data, type, row) {
                        return `<a href="#" class="text-primary font-weight-bold" onclick="showAnimalsFed(${row.id}, '${row.penname}', '${row.logdate}')" style="text-decoration: underline; font-size: 0.75rem;">${data} animals</a>`;
                    }
                },
                { 
                    "data": "status",
                    "render": function(data) {
                        const statusClass = (data || 'Completed').toLowerCase() === 'completed' ? 'status-completed' : 'status-pending';
                        return `<span class="feeding-status-badge ${statusClass}">${data || 'Completed'}</span>`;
                    }
                },
                {
                    "data": "id",
                    "render": function(data) {
                        return `
                            <div class="dropdown">
                                <button class="btn btn-sm p-0 text-muted" type="button" data-toggle="dropdown">
                                    <span class="material-symbols-outlined">more_vert</span>
                                </button>
                                <div class="dropdown-menu dropdown-menu-right shadow-sm border-0" style="font-size: 0.75rem;">
                                    <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="#" onclick="viewDetail(${data})"><span class="material-symbols-outlined" style="font-size: 1.1rem;">visibility</span> View Detail</a>
                                    <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="#" onclick="editRecord(${data})"><span class="material-symbols-outlined" style="font-size: 1.1rem;">edit</span> Edit Record</a>
                                    <a class="dropdown-item d-flex align-items-center gap-2 py-2 text-danger" href="#" onclick="deleteRecord(${data})"><span class="material-symbols-outlined" style="font-size: 1.1rem;">delete</span> Delete</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="#"><span class="material-symbols-outlined" style="font-size: 1.1rem;">summarize</span> Report</a>
                                </div>
                            </div>`;
                    }
                }
            ],
            "pageLength": 6,
            "paging": true,
            "info": false,
            "responsive": true,
            "columnDefs": [
                { "responsivePriority": 1, "targets": 0 }, // Date stays visible
                { "responsivePriority": 1, "targets": -1 }, // Actions stays visible
                { "responsivePriority": 3, "targets": 2 }, // Pen ID 
                { "responsivePriority": 4, "targets": 5 }, // Status
                { "responsivePriority": 100, "targets": [1, 3, 4] }, // Others hide first
                { "orderable": false, "targets": -1 }
            ],
            "dom": 'Brt',
            "buttons": [
                { 
                    extend: 'excel', 
                    className: 'dt-button', 
                    text: '<span class="material-symbols-outlined">download</span> Excel' 
                },
                { 
                    extend: 'print', 
                    className: 'dt-button', 
                    text: '<span class="material-symbols-outlined">print</span> Print' 
                }
            ],
            "drawCallback": function() {
                updatePagination(this.api());
            }
        });

        table.buttons().container().appendTo('#feedingExportContainer');

        function updatePagination(api) {
            const dt = api || table;
            if (!dt) return;
            const info = dt.page.info();
            $('#pageInfo').text('Page ' + (info.page + 1) + ' of ' + info.pages);
            let html = '';
            for (let i = 0; i < info.pages; i++) {
                const activeClass = i === info.page ? 'active' : '';
                html += `<button class="page-btn ${activeClass}" data-page="${i}">${i + 1}</button>`;
            }
            $('#numberButtons').html(html);
            $('#prevPage').prop('disabled', info.page === 0);
            $('#nextPage').prop('disabled', info.page >= info.pages - 1);
        }

        $('#customPagination').on('click', '.page-btn', function() {
            const page = $(this).data('page');
            if (page !== undefined) { table.page(page).draw('page'); updatePagination(); }
        });

        $('#prevPage').on('click', function() { table.page('previous').draw('page'); updatePagination(); });
        $('#nextPage').on('click', function() { table.page('next').draw('page'); updatePagination(); });

        $('#penFilter').on('change', function() { table.column(2).search(this.value).draw(); });
        $('#feedTypeFilter').on('change', function() { table.column(3).search(this.value).draw(); });
        $('#feedingSearch').on('keyup', function() { table.search(this.value).draw(); });

        updatePagination();

        // Populate Pens and Feed Mixes for Modal
        getpensselect($('#modalPenSelect'));
        getinventoryfeedsselect($('#modalFeedId')); // Default to Feed

        // Source Type Change Handler
        $('#modalFeedSourceType').on('change', function() {
            const type = $(this).val();
            const label = $('#modalFeedSelectionLabel');
            const select = $('#modalFeedId');
            
            select.html('<option value="" disabled selected>Loading...</option>');
            
            if (type === 'Feed') {
                label.text('Select Complete Feed');
                getinventoryfeedsselect(select);
            } else {
                label.text('Select Ration / Mix');
                getfeedmixesselect(select);
            }
        });

        // --- New Feeding Modal Logic ---
        $('#openFeedingModalBtn').on('click', function() {
            $('#newFeedingModal').addClass('show');
            $('body').addClass('modal-open');
            
            // Auto-select closest shift
            const now = new Date();
            const hour = now.getHours();
            let closestShift = "1"; // Default 3 AM
            if (hour >= 8 && hour < 14) closestShift = "2"; // 11 AM
            else if (hour >= 14 || hour < 0) closestShift = "3"; // 4 PM
            
            $(`#modalShiftToggles .shift-toggle-btn[data-value="${closestShift}"]`).click();
        });

        $('#closeFeedingModal, #dismissFeedingModal, #cancelFeeding').on('click', function() {
            $('#newFeedingModal').removeClass('show');
            $('body').removeClass('modal-open');
        });

        // Initialize Datepicker
        $('#modalFeedingDate').datepicker({
            dateFormat: 'dd-M-yy',
            changeMonth: true,
            changeYear: true,
            maxDate: 0
        });

        // Shift Toggle Button Handler
        $('.shift-toggle-btn').on('click', function() {
            $('.shift-toggle-btn').removeClass('active');
            $(this).addClass('active');
            $('#modalShiftSelect').val($(this).data('value'));
            
            // Clear shift error
            $('#error-modalShiftSelect').hide();
            if ($('.invalid-feedback-custom:visible').length === 0) {
                $('#feedingValidationAlertContainer').empty();
            }
        });

        // Clear errors on interaction
        $('#newFeedingModal input, #newFeedingModal select').on('input change', function() {
            $(this).css('border-color', '#e2e8f0');
            $(`#error-${$(this).attr('id')}`).hide();
            
            // If no more individual errors, clear the top summary
            if ($('.invalid-feedback-custom:visible').length === 0) {
                $('#feedingValidationAlertContainer').empty();
            }
        });

        $('#modalPenSelect').on('change', function() {
            const penid = $(this).val();
            getAnimalsByPenList(penid, $('#modalAnimalList'));
        });

        $('#saveFeedingBtn').on('click', function() {
            const btn = $(this);
            const date = $('#modalFeedingDate').val();
            const penid = $('#modalPenSelect').val();
            const shiftid = $('#modalShiftSelect').val();
            const sourceType = $('#modalFeedSourceType').val();
            const feedId = $('#modalFeedId').val();
            const weight = $('#modalFeedingWeight').val();
            const notes = $('#modalFeedingNotes').val();
            const alertContainer = $('#feedingValidationAlertContainer');

            // Clear previous errors
            alertContainer.empty();
            $('.form-control').css('border-color', '#e2e8f0');
            $('.invalid-feedback-custom').hide();

            // Validation
            let errors = [];
            if (!date) { 
                errors.push("Please select a feeding date."); 
                $('#modalFeedingDate').css('border-color', '#ef4444');
                $('#error-modalFeedingDate').text("Please select a date").show();
            }
            if (!penid) { 
                errors.push("Please select a target pen."); 
                $('#modalPenSelect').css('border-color', '#ef4444');
                $('#error-modalPenSelect').text("Please select a pen").show();
            }
            if (!shiftid) { 
                errors.push("Please select a feeding shift."); 
                $('#error-modalShiftSelect').text("Please select a shift").show();
            }
            if (!feedId) { 
                errors.push("Please select a feed or ration."); 
                $('#modalFeedId').css('border-color', '#ef4444');
                $('#error-modalFeedId').text("Selection is required").show();
            }
            if (!weight || weight <= 0) { 
                errors.push("Please enter the total weight."); 
                $('#modalFeedingWeight').css('border-color', '#ef4444');
                $('#error-modalFeedingWeight').text("Please enter a valid weight").show();
            }

            if (errors.length > 0) {
                // Use showAlert plugin to get formatted HTML but prevent it from showing in the global container by passing 1
                const detailedMessage = errors.join("<br/>");
                const alertHtml = showAlert('info', detailedMessage, 1);
                alertContainer.html(alertHtml);
                
                // Focus first error
                if (!date) $('#modalFeedingDate').focus();
                else if (!penid) $('#modalPenSelect').focus();
                else if (!feedtype) $('#modalFeedType').focus();
                else if (!weight || weight <= 0) $('#modalFeedingWeight').focus();
                
                // Scroll to top of modal to see the alerts
                $('#newFeedingModal .overflow-auto').animate({ scrollTop: 0 }, 300);
                
                return;
            }

            // Collect Animal IDs
            let animalIds = [];
            $('#modalAnimalList .animal-card-item').each(function() {
                animalIds.push($(this).data('animalid'));
            });

            if (animalIds.length === 0) {
                alertContainer.html('<div class="alert alert-info small py-2 px-3 mb-0" style="border-radius: 6px; border: none; background-color: #eff6ff; color: #1e40af;">Note: No animals found in this pen to associate with this record.</div>');
            }

            // Save via AJAX
            btn.prop('disabled', true).html('<span class="spinner-border spinner-border-sm mr-2"></span>Saving...');
            
            $.post('../controllers/feedingoperations.php', {
                action: 'savefeedingrecord',
                id: 0,
                logdate: date,
                penid: penid,
                shiftid: shiftid,
                feed_source_type: sourceType,
                feed_id: feedId,
                quantitykg: weight,
                notes: notes,
                animalids: JSON.stringify(animalIds)
            }, function(response) {
                btn.prop('disabled', false).html('Submit Record');
                try {
                    const res = JSON.parse(response);
                    if (res.status === 'success') {
                        // Success notification inside modal above feeding date
                        const successHtml = showAlert('info', res.message, 1);
                        alertContainer.html(successHtml);

                        // Clear fields for new entry
                        $('#modalPenSelect').val('').trigger('change');
                        $('#modalFeedId').val('');
                        $('#modalFeedingWeight').val('');
                        $('#modalFeedingNotes').val('');
                        
                        // Clear animal list to default state
                        $('#modalAnimalList').html('<div class="d-flex flex-column align-items-center justify-content-center h-100 py-5 text-center px-4"><span class="material-symbols-outlined text-muted mb-3" style="font-size: 3rem; opacity: 0.2;">groups</span><p class="text-muted small italic mb-0">Identification ledger will populate once a pen is selected.</p></div>');

                        // Scroll to top
                        $('#newFeedingModal .overflow-auto').animate({ scrollTop: 0 }, 300);
                    } else {
                        showAlert('danger', res.message);
                    }
                } catch (e) {
                    console.error(response);
                    showAlert('danger', 'System error: ' + response);
                }
            }).fail(function(jqXHR, textStatus, errorThrown) {
                btn.prop('disabled', false).html('Submit Record');
                showAlert('danger', 'Network error: ' + errorThrown);
            });
        });

        // Theme Toggle Listener
        $('#themeToggleBtn').on('click', function() {
            const dark = $('body').hasClass('dark-theme');
            chart.updateOptions({
                chart: { theme: { mode: dark ? 'dark' : 'light' } },
                grid: { borderColor: dark ? '#30363d' : '#f1f1f1' },
                xaxis: { labels: { style: { colors: dark ? '#8b949e' : '#94a3b8' } } }
            });
        });
    });

    function showAnimalsFed(logId, penName, logDate) {
        $('#animalsFedModalSubtitle').text(`Feeding session for ${penName} on ${logDate}`);
        $('#animalsFedList').html('<div class="text-center py-5"><div class="spinner-border text-success"></div><p class="mt-2 text-muted small">Loading animal registry...</p></div>');
        $('#animalsFedModal').addClass('show');
        $('body').addClass('modal-open');

        $.getJSON('../controllers/feedingoperations.php', { action: 'getfeedingloganimals', logid: logId }, function(data) {
            let html = '';
            if (data && data.length > 0) {
                html = '<div class="d-flex flex-column gap-3">';
                data.forEach(animal => {
                    html += `
                        <div class="animal-card-item shadow-sm border-0 bg-white mb-2" style="border-left: 4px solid #206223 !important; padding: 1rem;">
                            <div class="d-flex justify-content-between align-items-center w-100">
                                <div class="d-flex align-items-center">
                                    <div class="mr-3 p-2 bg-light rounded" style="min-width: 70px; text-align: center;">
                                        <span class="font-weight-bold" style="font-size: 0.8rem; color: #206223;">${animal.tagid}</span>
                                    </div>
                                    <div>
                                        <p class="mb-0 font-weight-bold" style="font-size: 0.9rem; color: #1a1c19;">${animal.designatedname || 'Unnamed'}</p>
                                        <p class="mb-0 text-muted" style="font-size: 0.75rem;">${animal.breedname || 'Cross-breed'}</p>
                                    </div>
                                </div>
                                <span class="material-symbols-outlined text-success">verified</span>
                            </div>
                        </div>`;
                });
                html += '</div>';
            } else {
                html = '<div class="text-center py-5"><span class="material-symbols-outlined text-muted mb-3" style="font-size: 3rem; opacity: 0.2;">sentiment_dissatisfied</span><p class="text-muted">No animal records found for this session.</p></div>';
            }
            $('#animalsFedList').html(html);
        });
    }

    $('#closeAnimalsFedModal, #dismissAnimalsFedModal').on('click', function() {
        $('#animalsFedModal').removeClass('show');
        if (!$('#newFeedingModal').hasClass('show')) {
            $('body').removeClass('modal-open');
        }
    });
    </script>
</body>
</html>
