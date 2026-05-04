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
        <div class="container-fluid pt-1 px-4">
            <!-- Header Section -->
            <div class="row align-items-center mb-4 mt-2">
                <div class="col">
                    <h2 class="font-headline font-weight-bold text-on-surface" style="font-size: 1.1rem;">
                        Feeding Overview
                    </h2>
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
                            <h2 class="font-headline font-weight-bold mb-0" style="font-size: 1.5rem; color: #206223;">4,280</h2>
                            <span class="text-muted small">kg</span>
                        </div>
                    </div>
                    <div class="d-flex align-items-center gap-1 text-success font-weight-bold" style="font-size: 0.7rem;">
                        <span class="material-symbols-outlined" style="font-size: 1rem;">trending_up</span>
                        <span>2% vs yesterday</span>
                    </div>
                </div>
                <!-- ... other cards ... -->
                <div class="feeding-stat-card botanical-shadow">
                    <div>
                        <p class="font-headline text-muted font-weight-bold mb-2" style="font-size: 0.65rem; letter-spacing: 0.05rem; text-transform: uppercase;">Avg Ration Per Cow</p>
                        <div class="d-flex align-items-baseline gap-2">
                            <h2 class="font-headline font-weight-bold mb-0 text-on-surface" style="font-size: 1.5rem;">24.5</h2>
                            <span class="text-muted small">kg/day</span>
                        </div>
                    </div>
                    <div class="d-flex align-items-center gap-1 text-secondary font-weight-bold" style="font-size: 0.7rem;">
                        <span class="material-symbols-outlined" style="font-size: 1rem;">remove</span>
                        <span>Stable yield ratio</span>
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
                    <div class="feeding-schedule-card botanical-shadow mb-4">
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
                                            <th>Status</th>
                                            <th class="text-right">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php for($i=0; $i<12; $i++): ?>
                                        <tr>
                                            <td class="text-muted" style="white-space: nowrap; font-size: 0.7rem;">Oct 24, 2023</td>
                                            <td class="font-weight-medium">06:00 AM</td>
                                            <td>Pen 12 (Lactating)</td>
                                            <td>TMR Mix A</td>
                                            <td>850 kg</td>
                                            <td><span class="feeding-status-badge status-completed">Completed</span></td>
                                            <td class="text-right">
                                                <div class="dropdown">
                                                    <button class="btn btn-sm p-0 text-muted" type="button" data-toggle="dropdown">
                                                        <span class="material-symbols-outlined">more_vert</span>
                                                    </button>
                                                    <div class="dropdown-menu dropdown-menu-right shadow-sm border-0" style="font-size: 0.75rem;">
                                                        <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="#"><span class="material-symbols-outlined" style="font-size: 1.1rem;">visibility</span> View Detail</a>
                                                        <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="#"><span class="material-symbols-outlined" style="font-size: 1.1rem;">edit</span> Edit Record</a>
                                                        <a class="dropdown-item d-flex align-items-center gap-2 py-2 text-danger" href="#"><span class="material-symbols-outlined" style="font-size: 1.1rem;">delete</span> Delete</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="#"><span class="material-symbols-outlined" style="font-size: 1.1rem;">summarize</span> Report</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-muted" style="font-size: 0.7rem;">Oct 24, 2023</td>
                                            <td class="font-weight-medium">12:00 PM</td>
                                            <td>Pen 08 (Dry)</td>
                                            <td>Hay / Silage</td>
                                            <td>600 kg</td>
                                            <td><span class="feeding-status-badge status-pending">Pending</span></td>
                                            <td class="text-right">
                                                <div class="dropdown">
                                                    <button class="btn btn-sm p-0 text-muted" type="button" data-toggle="dropdown">
                                                        <span class="material-symbols-outlined">more_vert</span>
                                                    </button>
                                                    <div class="dropdown-menu dropdown-menu-right shadow-sm border-0" style="font-size: 0.75rem;">
                                                        <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="#"><span class="material-symbols-outlined" style="font-size: 1.1rem;">visibility</span> View Detail</a>
                                                        <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="#"><span class="material-symbols-outlined" style="font-size: 1.1rem;">edit</span> Edit Record</a>
                                                        <a class="dropdown-item d-flex align-items-center gap-2 py-2 text-danger" href="#"><span class="material-symbols-outlined" style="font-size: 1.1rem;">delete</span> Delete</a>
                                                        <div class="dropdown-divider"></div>
                                                        <a class="dropdown-item d-flex align-items-center gap-3 py-2" href="#"><span class="material-symbols-outlined" style="font-size: 1.1rem;">summarize</span> Report</a>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <?php endfor; ?>
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
                    <div class="mb-4">
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
                    <div class="chart-container-card botanical-shadow mb-4">
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
                    <div class="chart-container-card botanical-shadow mb-4">
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

    <!-- FAB for New Feeding -->
    <button class="fab botanical-shadow" id="newFeedingFAB" style="background-color: #206223; color: white; z-index: 1060;">
        <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1; font-size: 1.8rem;">add</span>
    </button>

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
                    <!-- Selection Grid -->
                    <div class="row mb-3">
                        <div class="col-6 mb-3">
                            <label class="small text-muted mb-2 d-block" style="letter-spacing: 0.02rem; font-weight: 500;">Target Pen ID</label>
                            <select class="form-control form-control-custom bg-white border" id="modalPenSelect" style="height: 48px; font-size: 0.85rem; border-radius: 6px; border-color: #e2e8f0 !important; width: 100%; font-weight: 400;">
                                <option value="" disabled selected>Choose a Pen...</option>
                                <option value="Pen 12">Pen 12 (Lactating)</option>
                                <option value="Pen 04">Pen 04 (Calves)</option>
                                <option value="Pen 08">Pen 08 (Dry)</option>
                            </select>
                        </div>
                        <div class="col-6 mb-3">
                            <label class="small text-muted mb-2 d-block" style="letter-spacing: 0.02rem; font-weight: 500;">Ration Type</label>
                            <select class="form-control form-control-custom bg-white border" id="modalFeedType" style="height: 48px; font-size: 0.85rem; border-radius: 6px; border-color: #e2e8f0 !important; width: 100%; font-weight: 400;">
                                <option value="" disabled selected>Select Ration Mix...</option>
                                <option>TMR Mix A (Premium)</option>
                                <option>Calf Starter Mix</option>
                                <option>High Yield Silage</option>
                                <option>Mineral Supplement</option>
                            </select>
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

                    <!-- Quantity & Observation -->
                    <div class="row">
                        <div class="col-6 mb-4">
                            <label class="small text-muted mb-2 d-block" style="letter-spacing: 0.02rem; font-weight: 500;">Total Weight</label>
                            <div class="input-group">
                                <input type="number" class="form-control form-control-custom bg-white" placeholder="0.00" style="height: 48px; font-size: 1.1rem; border-radius: 6px 0 0 6px; border: 1px solid #e2e8f0; font-weight: 400;">
                                <div class="input-group-append">
                                    <span class="input-group-text bg-light border-left-0" style="font-size: 0.75rem; font-weight: 500; border-radius: 0 6px 6px 0; border: 1px solid #e2e8f0; color: #64748b;">KG</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label class="small text-muted mb-2 d-block" style="letter-spacing: 0.02rem; font-weight: 500;">Observation Notes</label>
                            <textarea class="form-control form-control-custom bg-white border" rows="2" placeholder="Enter any significant pen observations..." style="font-size: 0.85rem; border-radius: 6px; resize: none; border-color: #e2e8f0 !important; width: 100%; font-weight: 400;"></textarea>
                        </div>
                    </div>
                </div>

                <div class="p-4 bg-white border-top d-flex justify-content-end align-items-center gap-4" style="z-index: 5;">
                    <button class="btn btn-link text-muted" style="font-size: 0.85rem; text-decoration: none; font-weight: 500;" id="cancelFeeding">Cancel</button>
                    <button class="btn btn-success px-5 shadow-sm" style="background-color: #206223; border-radius: 6px; font-size: 0.9rem; height: 48px; font-weight: 500;" id="saveFeedingBtn">Submit Record</button>
                </div>
            </div>
        </div>
    </div>
            </div>
        </div>
    </div>

    <!-- Global Scripts -->
    <script src="../plugins/jquery-3.6.1.js"></script>
    <script src="../plugins/popper.js"></script>
    <script src="../plugins/bootstrap.js"></script>
    <script src="../plugins/alert.js"></script>
    <script src="../js/functions.js"></script>
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
        
        // --- Consumption Chart ---
        const options = {
            series: [{
                name: 'Consumption (kg)',
                data: [3850, 4120, 3950, 4580, 4210, 4850, 4280]
            }],
            chart: {
                type: 'area',
                height: 180,
                toolbar: { show: false },
                sparkline: { enabled: false },
                background: 'transparent',
                theme: { mode: isDark ? 'dark' : 'light' }
            },
            colors: ['#206223'],
            dataLabels: { enabled: false },
            stroke: { curve: 'smooth', width: 2 },
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
                xaxis: { lines: { show: false } },
                yaxis: { lines: { show: false } },
                padding: { top: 0, right: 0, bottom: 0, left: -10 }
            },
            xaxis: {
                categories: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'],
                labels: {
                    style: {
                        colors: isDark ? '#8b949e' : '#94a3b8',
                        fontSize: '10px'
                    }
                },
                axisBorder: { show: false },
                axisTicks: { show: false }
            },
            yaxis: { show: false },
            tooltip: {
                theme: isDark ? 'dark' : 'light',
                x: { show: false }
            }
        };

        const chart = new ApexCharts(document.querySelector("#consumptionAreaChart"), options);
        chart.render();

        // --- DataTables Integration ---
        const table = $('#feedingDataTable').DataTable({
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
            ]
        });

        table.buttons().container().appendTo('#feedingExportContainer');

        function updatePagination() {
            const info = table.page.info();
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

        // --- New Feeding Modal Logic ---
        $('#newFeedingFAB').on('click', function() {
            $('#newFeedingModal').addClass('show');
            $('body').addClass('modal-open');
            $(this).fadeOut(200); // Hide FAB when modal opens
        });

        $('#closeFeedingModal, #dismissFeedingModal, #cancelFeeding, .modal-backdrop-blur').on('click', function() {
            $('#newFeedingModal').removeClass('show');
            $('body').removeClass('modal-open');
            $('#newFeedingFAB').fadeIn(200); // Show FAB when modal closes
        });

        // Pen Selection -> Animal List Simulation (Code & Name)
        const animalData = {
            'Pen 12': [
                { id: 'JK-2481', name: 'Daisy (Jersey)' },
                { id: 'JK-2485', name: 'Bella (Guernsey)' },
                { id: 'JK-2490', name: 'Luna (Holstein)' }
            ],
            'Pen 04': [
                { id: 'CL-0301', name: 'Max (Ayrshire)' },
                { id: 'CL-0305', name: 'Ruby (Jersey)' },
                { id: 'CL-0310', name: 'Cooper (Holstein)' }
            ],
            'Pen 08': [
                { id: 'HF-0120', name: 'Molly (Sahiwal)' },
                { id: 'HF-0125', name: 'Sophie (Brown Swiss)' }
            ]
        };

        $('#modalPenSelect').on('change', function() {
            const pen = $(this).val();
            const animals = animalData[pen] || [];
            let html = '';
            
            if (animals.length > 0) {
                html = '<div class="d-flex flex-column gap-2">';
                    animals.forEach(animal => {
                        html += `
                            <div class="animal-card-wrapper">
                                <div class="animal-card-item">
                                    <div class="d-flex align-items-center">
                                        <div class="mr-3" style="min-width: 60px; border-right: 1px solid #f1f5f1;">
                                            <span class="text-muted" style="font-size: 0.725rem; font-weight: 800; font-family: monospace; color: #206223 !important;">${animal.id}</span>
                                        </div>
                                        <div>
                                            <span style="font-size: 0.825rem; font-weight: 500; color: #1a1c19;">${animal.name.split(' (')[0]}</span>
                                            <span class="text-muted" style="font-size: 0.675rem; font-weight: 400; margin-left: 2px;">(${animal.name.split(' (')[1]}</span>
                                        </div>
                                    </div>
                                    <span class="material-symbols-outlined text-success" style="font-size: 1.25rem; font-variation-settings: 'FILL' 1;">check_circle</span>
                                </div>
                            </div>`;
                    });
                html += '</div>';
            } else {
                html = '<div class="text-center py-4"><span class="material-symbols-outlined text-muted mb-2" style="font-size: 2.5rem; opacity: 0.2;">groups</span><p class="text-muted small italic mb-0">Select a pen to audit animals...</p></div>';
            }
            
            $('#modalAnimalList').html(html);
        });

        $('#saveFeedingBtn').on('click', function() {
            const pen = $('#modalPenSelect').val();
            if (!pen) {
                alert('Please select a pen.');
                return;
            }
            // Simulate Save
            $(this).html('<span class="spinner-border spinner-border-sm mr-2"></span>Saving...');
            setTimeout(() => {
                $('#newFeedingModal').removeClass('show');
                $('body').removeClass('modal-open');
                $('#newFeedingFAB').fadeIn(200);
                $(this).html('Submit Record');
                // Show success alert (assuming showAlert is global)
                if (typeof showAlert === 'function') {
                    showAlert('success', 'Feeding record for ' + pen + ' saved successfully!');
                } else {
                    alert('Feeding record for ' + pen + ' saved successfully!');
                }
            }, 800);
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
    </script>
</body>
</html>
