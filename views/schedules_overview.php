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
    
    <!-- External Fonts (Loaded locally via style.css) -->
    
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
                    <p class="schedules-page-desc mb-0" style="margin-left: 44px;">Manage clinical protocols and herd health timelines.</p>
                </div>
                <div class="col-auto">
                    <button class="btn btn-success d-flex align-items-center px-3 shadow-sm" id="addNewBtn" style="background: var(--primary-gradient); border: none; border-radius: 0.5rem; height: 40px; font-weight: 500; font-size: 0.85rem;">
                        <i class="fas fa-plus mr-2" style="font-size: 0.8rem;"></i>
                        <span class="d-none d-sm-inline">Add New Schedule</span>
                        <span class="d-inline d-sm-none">Add New</span>
                    </button>
                </div>
            </div>

            <!-- Fast Stats Row -->
            <div class="row mb-3">
                <div class="col-12">
                    <div class="d-flex gap-4">
                        <div class="stat-card-wide" style="background-color: var(--tertiary-fixed); flex: 1;">
                            <div class="stat-icon-wrapper" style="background-color: var(--on-tertiary-fixed); color: var(--tertiary-fixed);">
                                <i class="fas fa-check-circle"></i>
                            </div>
                            <div>
                                <p class="stat-label" style="color: var(--on-tertiary-fixed-variant);">Completed</p>
                                <p class="stat-value" style="color: var(--on-tertiary-fixed);">142 <small style="font-size: 0.75rem; opacity: 0.8;">Animals</small></p>
                            </div>
                        </div>
                        <div class="stat-card-wide" style="background-color: var(--secondary-fixed); flex: 1;">
                            <div class="stat-icon-wrapper" style="background-color: var(--on-secondary-fixed); color: var(--secondary-fixed);">
                                <i class="fas fa-calendar-alt"></i>
                            </div>
                            <div>
                                <p class="stat-label" style="color: var(--on-secondary-fixed-variant);">Pending</p>
                                <p class="stat-value" style="color: var(--on-secondary-fixed);">28 <small style="font-size: 0.75rem; opacity: 0.8;">Upcoming</small></p>
                            </div>
                        </div>
                        <div class="stat-card-wide" style="background-color: #ffd8d8; flex: 1;">
                            <div class="stat-icon-wrapper" style="background-color: #8c1d1d; color: #ffd8d8;">
                                <i class="fas fa-clock"></i>
                            </div>
                            <div>
                                <p class="stat-label" style="color: #601414;">Overdue</p>
                                <p class="stat-value" style="color: #8c1d1d;">5 <small style="font-size: 0.75rem; opacity: 0.8;">Scheduled</small></p>
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
                    <div class="d-flex gap-2">
                        <button class="btn btn-icon hover-bg-stone rounded-lg p-2" title="Filter Records">
                            <i class="fal fa-filter text-muted" style="font-size: 1rem;"></i>
                        </button>
                        <button class="btn btn-icon hover-bg-stone rounded-lg p-2" title="Export CSV">
                            <i class="fal fa-file-export text-muted" style="font-size: 1rem;"></i>
                        </button>
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
                            <!-- Row 1 -->
                            <tr class="group">
                                <td>
                                    <div class="schedule-date-box">
                                        <span class="schedule-date-main">Oct 28, 2023</span>
                                        <span class="schedule-date-sub">Today • 08:30 AM</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="protocol-chip">
                                        <div class="protocol-dot" style="background-color: var(--primary);"></div>
                                        <span class="font-weight-medium">FMD Vaccination</span>
                                    </div>
                                </td>
                                <td class="font-body text-on-surface-variant" style="font-size: 0.85rem;">42 Heifers</td>
                                <td>
                                    <span class="status-badge" style="background-color: var(--tertiary-fixed); color: var(--on-tertiary-fixed-variant);">
                                        <i class="fas fa-check-circle" style="font-size: 0.8rem;"></i>
                                        Completed
                                    </span>
                                </td>
                                <td class="text-right">
                                    <div class="dropdown">
                                        <button class="btn btn-icon btn-sm hover-bg-stone rounded-lg no-caret border-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 32px; height: 32px;">
                                            <i class="fas fa-ellipsis-v text-muted"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right shadow-sm border-0 rounded-lg p-2" style="min-width: 180px;">
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-eye text-secondary" style="width: 16px;"></i>
                                                <span>View Details</span>
                                            </a>
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-edit text-primary" style="width: 16px;"></i>
                                                <span>Edit Schedule</span>
                                            </a>
                                            <div class="dropdown-divider mx-2"></div>
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded text-danger" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-trash-alt" style="width: 16px;"></i>
                                                <span>Delete</span>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Row 2 -->
                            <tr class="group">
                                <td>
                                    <div class="schedule-date-box">
                                        <span class="schedule-date-main">Nov 02, 2023</span>
                                        <span class="schedule-date-sub">Thursday • 11:15 AM</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="protocol-chip">
                                        <div class="protocol-dot" style="background-color: var(--secondary);"></div>
                                        <span class="font-weight-medium">LSD Booster</span>
                                    </div>
                                </td>
                                <td class="font-body text-on-surface-variant" style="font-size: 0.85rem;">12 Calves</td>
                                <td>
                                    <span class="status-badge" style="background-color: var(--secondary-fixed); color: var(--on-secondary-fixed-variant);">
                                        <i class="fas fa-clock" style="font-size: 0.8rem;"></i>
                                        Upcoming
                                    </span>
                                </td>
                                <td class="text-right">
                                    <div class="dropdown">
                                        <button class="btn btn-icon btn-sm hover-bg-stone rounded-lg no-caret border-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 32px; height: 32px;">
                                            <i class="fas fa-ellipsis-v text-muted"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right shadow-sm border-0 rounded-lg p-2" style="min-width: 180px;">
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-eye text-secondary" style="width: 16px;"></i>
                                                <span>View Details</span>
                                            </a>
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-edit text-primary" style="width: 16px;"></i>
                                                <span>Edit Schedule</span>
                                            </a>
                                            <div class="dropdown-divider mx-2"></div>
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded text-danger" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-trash-alt" style="width: 16px;"></i>
                                                <span>Delete</span>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Row 3 -->
                            <tr class="group">
                                <td>
                                    <div class="schedule-date-box">
                                        <span class="schedule-date-main">Nov 05, 2023</span>
                                        <span class="schedule-date-sub">Sunday • 09:00 AM</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="protocol-chip">
                                        <div class="protocol-dot" style="background-color: var(--error);"></div>
                                        <span class="font-weight-medium">Anthrax Booster</span>
                                    </div>
                                </td>
                                <td class="font-body text-on-surface-variant" style="font-size: 0.85rem;">65 Adults</td>
                                <td>
                                    <span class="status-badge" style="background-color: var(--secondary-fixed); color: var(--on-secondary-fixed-variant);">
                                        <i class="fas fa-clock" style="font-size: 0.8rem;"></i>
                                        Upcoming
                                    </span>
                                </td>
                                <td class="text-right">
                                    <div class="dropdown">
                                        <button class="btn btn-icon btn-sm hover-bg-stone rounded-lg no-caret border-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 32px; height: 32px;">
                                            <i class="fas fa-ellipsis-v text-muted"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right shadow-sm border-0 rounded-lg p-2" style="min-width: 180px;">
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-eye text-secondary" style="width: 16px;"></i>
                                                <span>View Details</span>
                                            </a>
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-edit text-primary" style="width: 16px;"></i>
                                                <span>Edit Schedule</span>
                                            </a>
                                            <div class="dropdown-divider mx-2"></div>
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded text-danger" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-trash-alt" style="width: 16px;"></i>
                                                <span>Delete</span>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Row 4 -->
                            <tr class="group">
                                <td>
                                    <div class="schedule-date-box">
                                        <span class="schedule-date-main">Nov 12, 2023</span>
                                        <span class="schedule-date-sub">Sunday • 08:30 AM</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="protocol-chip">
                                        <div class="protocol-dot" style="background-color: #6366f1;"></div>
                                        <span class="font-weight-medium">Brucellosis Testing</span>
                                    </div>
                                </td>
                                <td class="font-body text-on-surface-variant" style="font-size: 0.85rem;">32 Heifers</td>
                                <td>
                                    <span class="status-badge" style="background-color: var(--secondary-fixed); color: var(--on-secondary-fixed-variant);">
                                        <i class="fas fa-clock" style="font-size: 0.8rem;"></i>
                                        Upcoming
                                    </span>
                                </td>
                                <td class="text-right">
                                    <div class="dropdown">
                                        <button class="btn btn-icon btn-sm hover-bg-stone rounded-lg no-caret border-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 32px; height: 32px;">
                                            <i class="fas fa-ellipsis-v text-muted"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right shadow-sm border-0 rounded-lg p-2" style="min-width: 180px;">
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-eye text-secondary" style="width: 16px;"></i>
                                                <span>View Details</span>
                                            </a>
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-edit text-primary" style="width: 16px;"></i>
                                                <span>Edit Schedule</span>
                                            </a>
                                            <div class="dropdown-divider mx-2"></div>
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded text-danger" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-trash-alt" style="width: 16px;"></i>
                                                <span>Delete</span>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Row 5 -->
                            <tr class="group">
                                <td>
                                    <div class="schedule-date-box">
                                        <span class="schedule-date-main">Nov 18, 2023</span>
                                        <span class="schedule-date-sub">Saturday • 10:00 AM</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="protocol-chip">
                                        <div class="protocol-dot" style="background-color: #f59e0b;"></div>
                                        <span class="font-weight-medium">Quarterly Deworming</span>
                                    </div>
                                </td>
                                <td class="font-body text-on-surface-variant" style="font-size: 0.85rem;">156 Total Herd</td>
                                <td>
                                    <span class="status-badge" style="background-color: var(--secondary-fixed); color: var(--on-secondary-fixed-variant);">
                                        <i class="fas fa-clock" style="font-size: 0.8rem;"></i>
                                        Upcoming
                                    </span>
                                </td>
                                <td class="text-right">
                                    <div class="dropdown">
                                        <button class="btn btn-icon btn-sm hover-bg-stone rounded-lg no-caret border-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 32px; height: 32px;">
                                            <i class="fas fa-ellipsis-v text-muted"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right shadow-sm border-0 rounded-lg p-2" style="min-width: 180px;">
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-eye text-secondary" style="width: 16px;"></i>
                                                <span>View Details</span>
                                            </a>
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-edit text-primary" style="width: 16px;"></i>
                                                <span>Edit Schedule</span>
                                            </a>
                                            <div class="dropdown-divider mx-2"></div>
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded text-danger" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-trash-alt" style="width: 16px;"></i>
                                                <span>Delete</span>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Row 6 -->
                            <tr class="group">
                                <td>
                                    <div class="schedule-date-box">
                                        <span class="schedule-date-main">Nov 25, 2023</span>
                                        <span class="schedule-date-sub">Saturday • 09:00 AM</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="protocol-chip">
                                        <div class="protocol-dot" style="background-color: #10b981;"></div>
                                        <span class="font-weight-medium">FMD Screening</span>
                                    </div>
                                </td>
                                <td class="font-body text-on-surface-variant" style="font-size: 0.85rem;">20 Calves</td>
                                <td>
                                    <span class="status-badge" style="background-color: var(--tertiary-fixed); color: var(--on-tertiary-fixed-variant);">
                                        <i class="fas fa-check-circle" style="font-size: 0.8rem;"></i>
                                        Completed
                                    </span>
                                </td>
                                <td class="text-right">
                                    <div class="dropdown">
                                        <button class="btn btn-icon btn-sm hover-bg-stone rounded-lg no-caret border-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 32px; height: 32px;">
                                            <i class="fas fa-ellipsis-v text-muted"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right shadow-sm border-0 rounded-lg p-2" style="min-width: 180px;">
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-eye text-secondary" style="width: 16px;"></i>
                                                <span>View Details</span>
                                            </a>
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-edit text-primary" style="width: 16px;"></i>
                                                <span>Edit Schedule</span>
                                            </a>
                                            <div class="dropdown-divider mx-2"></div>
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded text-danger" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-trash-alt" style="width: 16px;"></i>
                                                <span>Delete</span>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <!-- Row 7 -->
                            <tr class="group">
                                <td>
                                    <div class="schedule-date-box">
                                        <span class="schedule-date-main">Dec 01, 2023</span>
                                        <span class="schedule-date-sub">Friday • 08:00 AM</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="protocol-chip">
                                        <div class="protocol-dot" style="background-color: #ef4444;"></div>
                                        <span class="font-weight-medium">Lumpy Skin Disease</span>
                                    </div>
                                </td>
                                <td class="font-body text-on-surface-variant" style="font-size: 0.85rem;">45 Adults</td>
                                <td>
                                    <span class="status-badge" style="background-color: var(--secondary-fixed); color: var(--on-secondary-fixed-variant);">
                                        <i class="fas fa-clock" style="font-size: 0.8rem;"></i>
                                        Upcoming
                                    </span>
                                </td>
                                <td class="text-right">
                                    <div class="dropdown">
                                        <button class="btn btn-icon btn-sm hover-bg-stone rounded-lg no-caret border-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 32px; height: 32px;">
                                            <i class="fas fa-ellipsis-v text-muted"></i>
                                        </button>
                                        <div class="dropdown-menu dropdown-menu-right shadow-sm border-0 rounded-lg p-2" style="min-width: 180px;">
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-eye text-secondary" style="width: 16px;"></i>
                                                <span>View Details</span>
                                            </a>
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-edit text-primary" style="width: 16px;"></i>
                                                <span>Edit Schedule</span>
                                            </a>
                                            <div class="dropdown-divider mx-2"></div>
                                            <a class="dropdown-item d-flex align-items-center gap-3 py-2 rounded text-danger" href="#" style="font-size: 0.85rem; font-weight: 500;">
                                                <i class="fas fa-trash-alt" style="width: 16px;"></i>
                                                <span>Delete</span>
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Footer Pagination -->
                <div class="pagination-container" id="customPagination">
                    <span class="text-muted small font-weight-medium" style="font-size: 0.7rem;" id="pageInfo">Showing 1 to 7 of 12</span>
                    <div class="d-flex align-items-center" id="pageBtnGroup">
                        <button class="page-btn boundary-btn mr-2" id="prevPage">
                            <i class="fal fa-chevron-left"></i>
                        </button>
                        <div id="numberButtons" class="d-flex gap-1">
                            <button class="page-btn active">1</button>
                            <button class="page-btn">2</button>
                            <button class="page-btn">3</button>
                        </div>
                        <button class="page-btn boundary-btn ml-2" id="nextPage">
                            <i class="fal fa-chevron-right"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Insights Section -->
            <div class="insights-wrapper d-flex mb-5" style="gap: 3.5rem;">
                <div class="insight-card shadow-sm">
                    <div style="position: relative; z-index: 1;">
                        <h5 class="font-headline font-weight-bold mb-3">Protocol Insight</h5>
                        <p class="mb-0" style="opacity: 0.9; font-size: 0.9rem; line-height: 1.7; max-width: 600px;">
                            Remember to monitor the Jersey herd specifically after the Anthrax booster. 
                            Previous logs indicate a slight drop in milk production 48 hours post-vaccination.
                        </p>
                    </div>
                    <span class="material-symbols-outlined insight-icon-bg">tips_and_updates</span>
                </div>
                
                <div class="priority-card">
                    <h5 class="stat-label mb-4" style="color: var(--secondary);">Next Priority</h5>
                    <div class="d-flex align-items-start gap-3">
                        <div class="priority-icon-wrapper">
                            <span class="material-symbols-outlined text-secondary">inventory</span>
                        </div>
                        <div>
                            <p class="font-weight-bold mb-1" style="font-size: 0.9rem;">Check Valbazen Stock</p>
                            <p class="text-muted mb-0" style="font-size: 0.75rem; line-height: 1.5;">Deworming starts in 5 days. Current inventory shows 12L available.</p>
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
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.4.0/js/responsive.bootstrap4.min.js"></script>
    
    <!-- Custom Scripts -->
    <script src="../js/header.js"></script>
    <script src="../js/navigation.js"></script>
    <script src="../plugins/jquery-ui.js"></script>
    <!-- Vaccination Schedule Modal (Directly in Page) -->
    <div id="vaccinationModal" class="v-modal-overlay" style="display: none;">
        <div class="v-modal-backdrop"></div>
        <div class="v-modal-wrapper">
            <div class="v-modal-container botanical-shadow-lg">
                <button type="button" class="close-modal-btn" aria-label="Close">
                    <span class="material-symbols-outlined">close</span>
                </button>
                <!-- Left Sidebar (Botanical Brand) -->
                <div class="v-modal-sidebar">
                    <div class="v-modal-sidebar-bg">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDFARTsU3dpTtLaqQZZWEzRoQsVTkW2LZYB78FAfz1SBY2W6OIBOldnQliXBIvhRWjAbBhtqw7NZHEF59yxTxZCQkYUl1-1ybbRJQ-UsMRllbSjF9hXSN-c_-rfVCVw_jGbNz67Djy2XtM6bpN-wPhESOQ01sZzn10eHyURHljP_wLaZ0XVyLJw4ExQIEezXyPQRxcHQBoZy5MpYH9h9bkoD98IbLlQpRDyG9x854G4NFV2ze3uhSAN_Kgj7uDSZBnHHexFESZe113y" alt="Botanical">
                    </div>
                    <div class="v-modal-sidebar-content">
                        <span class="material-symbols-outlined v-modal-icon">medical_information</span>
                        <h2 class="v-modal-title" style="font-size: 1.75rem;">New Vaccination Schedule</h2>
                        <p class="v-modal-desc" style="font-size: 0.8rem; line-height: 1.5; opacity: 0.8;">Ensure the vitality of your herd through precise, proactive healthcare planning.</p>
                        <div class="v-modal-badge mt-auto">
                            <span class="v-modal-dot"></span>
                            <span class="v-modal-badge-text">Protocol-First Design</span>
                        </div>
                    </div>
                </div>

                <!-- Right Form Area -->
                <div class="v-modal-form-area text-left">
                    <div class="v-modal-header">
                        <div>
                            <h3 class="font-headline font-weight-bold mb-0" style="font-size: 1.5rem;">Vaccination Details</h3>
                            <p class="text-muted small mb-0">Fill in the parameters for the new health record.</p>
                        </div>
                    </div>

                    <form id="vaccinationForm" class="v-modal-form mt-4">
                        <div class="row">
                            <div class="col-12 mb-4">
                                <label class="font-label text-muted d-block mb-2">Select Disease</label>
                                <div class="v-input-wrapper">
                                    <select class="form-control v-form-control">
                                        <option value="" disabled selected>Select Option</option>
                                        <option>Bovine Viral Diarrhea (BVD)</option>
                                        <option>Foot & Mouth Disease</option>
                                        <option>Brucellosis</option>
                                        <option>Anthrax</option>
                                    </select>
                                </div>
                            </div>
                                                 <div class="col-12 mb-4">
                                <label class="font-label text-muted d-block mb-2">Target Pens</label>
                                <div class="pen-multiselect">
                                    <div class="pen-multiselect-trigger" id="penTrigger">
                                        <span id="penDisplay">Select Pens</span>
                                        <span class="material-symbols-outlined" style="font-size: 1.2rem; color: #666;">arrow_drop_down</span>
                                    </div>
                                    <div class="pen-multiselect-menu" id="penMenu">
                                        <div class="pen-search-wrapper">
                                            <input type="text" class="pen-search-input" id="penSearch" placeholder="Search...">
                                        </div>
                                        <div class="pen-list">
                                            <label class="pen-item">
                                                <input type="checkbox" value="pen01">
                                                <span>Pen A-01 (Lactating Cows)</span>
                                            </label>
                                            <label class="pen-item">
                                                <input type="checkbox" value="pen02">
                                                <span>Pen B-02 (Dry Section)</span>
                                            </label>
                                            <label class="pen-item">
                                                <input type="checkbox" value="pen03">
                                                <span>Pen C-03 (Calving Unit)</span>
                                            </label>
                                            <label class="pen-item">
                                                <input type="checkbox" value="pen04">
                                                <span>Pen D-04 (Heifer Barn)</span>
                                            </label>
                                            <label class="pen-item">
                                                <input type="checkbox" value="pen05">
                                                <span>Pen E-05 (Sick Bay)</span>
                                            </label>
                                        </div>
                                        <div class="pen-footer">
                                            <div class="d-flex gap-2">
                                                <button type="button" class="pen-footer-btn" id="penSelectAll" title="Select All">
                                                    <span class="material-symbols-outlined" style="font-size: 1.2rem;">select_all</span>
                                                </button>
                                                <button type="button" class="pen-footer-btn" id="penDeselectAll" title="Clear Selection">
                                                    <span class="material-symbols-outlined" style="font-size: 1.2rem;">deselect</span>
                                                </button>
                                            </div>
                                            <button type="button" class="pen-footer-btn" id="penConfirm" title="Confirm">
                                                <span class="material-symbols-outlined" style="font-size: 1.2rem; color: #4caf50;">check_circle</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2">Scheduled Date</label>
                                <div class="v-input-wrapper">
                                    <input type="text" id="v_datepicker" class="form-control v-form-control" placeholder="YYYY-MM-DD">
                                    <span class="material-symbols-outlined v-input-icon">calendar_today</span>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2">Scheduled Time</label>
                                <div class="v-input-wrapper">
                                    <input type="time" class="form-control v-form-control">
                                </div>
                            </div>
                            <div class="col-12 mb-4">
                                <label class="font-label text-muted d-block mb-2">Notes & Instructions</label>
                                <textarea class="form-control v-form-control" rows="2" placeholder="Additional details..."></textarea>
                            </div>
                        </div>

                        <div class="v-modal-footer d-flex justify-content-end align-items-center mt-3">
                            <button type="button" class="btn btn-link close-modal-btn text-muted p-0 text-decoration-none mr-4" style="font-size: 0.85rem; font-weight: 500;">Cancel</button>
                            <button type="submit" class="btn btn-success v-btn-save shadow-sm">Save Schedule</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Deworming Schedule Modal -->
    <div id="dewormingModal" class="v-modal-overlay" style="display: none;">
        <div class="v-modal-backdrop"></div>
        <div class="v-modal-wrapper">
            <div class="v-modal-container botanical-shadow-lg">
                <button type="button" class="close-modal-btn" aria-label="Close">
                    <span class="material-symbols-outlined">close</span>
                </button>
                <!-- Left Sidebar (Deworming Brand) -->
                <div class="v-modal-sidebar" style="background: linear-gradient(135deg, #065f46 0%, #064e3b 100%);">
                    <div class="v-modal-sidebar-bg">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDFARTsU3dpTtLaqQZZWEzRoQsVTkW2LZYB78FAfz1SBY2W6OIBOldnQliXBIvhRWjAbBhtqw7NZHEF59yxTxZCQkYUl1-1ybbRJQ-UsMRllbSjF9hXSN-c_-rfVCVw_jGbNz67Djy2XtM6bpN-wPhESOQ01sZzn10eHyURHljP_wLaZ0XVyLJw4ExQIEezXyPQRxcHQBoZy5MpYH9h9bkoD98IbLlQpRDyG9x854G4NFV2ze3uhSAN_Kgj7uDSZBnHHexFESZe113y" alt="Botanical">
                    </div>
                    <div class="v-modal-sidebar-content">
                        <span class="material-symbols-outlined v-modal-icon">pest_control</span>
                        <h2 class="v-modal-title" style="font-size: 1.75rem;">New Deworming Schedule</h2>
                        <p class="v-modal-desc" style="font-size: 0.8rem; line-height: 1.5; opacity: 0.8;">Ensure the vitality of your herd through regular parasite control protocols.</p>
                        <div class="v-modal-badge mt-auto">
                            <span class="v-modal-dot"></span>
                            <span class="v-modal-badge-text">Wellness-First Design</span>
                        </div>
                    </div>
                </div>

                <!-- Right Form Area -->
                <div class="v-modal-form-area text-left">
                    <div class="v-modal-header">
                        <div>
                            <h3 class="font-headline font-weight-bold mb-0" style="font-size: 1.5rem;">Deworming Protocol</h3>
                            <p class="text-muted small mb-0">Specify the parameters for the new deworming cycle.</p>
                        </div>
                    </div>

                    <form id="dewormingForm" class="v-modal-form mt-4">
                        <div class="row">
                            <div class="col-12 mb-4">
                                <label class="font-label text-muted d-block mb-2">Proposed Drug</label>
                                <div class="v-input-wrapper">
                                    <input type="text" class="form-control v-form-control" placeholder="e.g., Albendazole, Ivermectin">
                                    <span class="material-symbols-outlined v-input-icon">medication</span>
                                </div>
                            </div>
                            <div class="col-12 mb-4">
                                <label class="font-label text-muted d-block mb-2">Target Pens</label>
                                <div class="pen-multiselect">
                                    <div class="pen-multiselect-trigger penTrigger">
                                        <span class="penDisplay">Select Pens</span>
                                        <span class="material-symbols-outlined" style="font-size: 1.2rem; color: #666;">arrow_drop_down</span>
                                    </div>
                                    <div class="pen-multiselect-menu penMenu">
                                        <div class="pen-search-wrapper">
                                            <input type="text" class="pen-search-input penSearch" placeholder="Search...">
                                        </div>
                                        <div class="pen-list">
                                            <label class="pen-item">
                                                <input type="checkbox" value="pen01">
                                                <span>Pen A-01 (Lactating Cows)</span>
                                            </label>
                                            <label class="pen-item">
                                                <input type="checkbox" value="pen02">
                                                <span>Pen B-02 (Dry Section)</span>
                                            </label>
                                            <label class="pen-item">
                                                <input type="checkbox" value="pen03">
                                                <span>Pen C-03 (Calving Unit)</span>
                                            </label>
                                            <label class="pen-item">
                                                <input type="checkbox" value="pen04">
                                                <span>Pen D-04 (Heifer Barn)</span>
                                            </label>
                                            <label class="pen-item">
                                                <input type="checkbox" value="pen05">
                                                <span>Pen E-05 (Sick Bay)</span>
                                            </label>
                                        </div>
                                        <div class="pen-footer">
                                            <div class="d-flex gap-2">
                                                <button type="button" class="pen-footer-btn penSelectAll" title="Select All">
                                                    <span class="material-symbols-outlined" style="font-size: 1.2rem;">select_all</span>
                                                </button>
                                                <button type="button" class="pen-footer-btn penDeselectAll" title="Clear Selection">
                                                    <span class="material-symbols-outlined" style="font-size: 1.2rem;">deselect</span>
                                                </button>
                                            </div>
                                            <button type="button" class="pen-footer-btn penConfirm" title="Confirm">
                                                <span class="material-symbols-outlined" style="font-size: 1.2rem; color: #4caf50;">check_circle</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2">Scheduled Date</label>
                                <div class="v-input-wrapper">
                                    <input type="text" class="form-control v-form-control v_datepicker" placeholder="YYYY-MM-DD">
                                    <span class="material-symbols-outlined v-input-icon">calendar_today</span>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label class="font-label text-muted d-block mb-2">Scheduled Time</label>
                                <div class="v-input-wrapper">
                                    <input type="time" class="form-control v-form-control">
                                </div>
                            </div>
                            <div class="col-12 mb-4">
                                <label class="font-label text-muted d-block mb-2">Notes & Instructions</label>
                                <textarea class="form-control v-form-control" rows="2" placeholder="Additional details..."></textarea>
                            </div>
                        </div>

                        <div class="v-modal-footer d-flex justify-content-end align-items-center mt-3">
                            <button type="button" class="btn btn-link close-modal-btn text-muted p-0 text-decoration-none mr-4" style="font-size: 0.85rem; font-weight: 500;">Cancel</button>
                            <button type="submit" class="btn btn-success v-btn-save shadow-sm">Save Schedule</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="../js/schedules.js"></script>

    <?php include 'modals.php'; ?>
</body>
</html>
