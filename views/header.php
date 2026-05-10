<?php
/**
 * Unified Header Component
 * styling matches Botanical design system
 */
$current_page = basename($_SERVER['PHP_SELF']);
$nav_context = $nav_context ?? 'dairy';

// Page configuration map
$page_config = [
    // Dairy Pages
    'dashboard.php' => ['label' => 'Dashboard', 'icon' => 'speed'],
    'animals.php' => ['label' => 'Animals', 'icon' => 'pets'],
    'production_overview.php' => ['label' => 'Production', 'icon' => 'water_drop'],
    'feeding_overview.php' => ['label' => 'Feeding', 'icon' => 'wheat'],
    'health_records_overview.php' => ['label' => 'Health', 'icon' => 'medical_services'],
    'schedules_overview.php' => ['label' => 'Health', 'icon' => 'medical_services'],
    'inventory_overview.php' => ['label' => 'Inventory', 'icon' => 'inventory_2'],
    'reports_overview.php' => ['label' => 'Reports', 'icon' => 'analytics'],
    'milk_production_report.php' => ['label' => 'Reports', 'icon' => 'analytics'],
    'health_records_report.php' => ['label' => 'Reports', 'icon' => 'analytics'],
    'vaccination_report.php' => ['label' => 'Reports', 'icon' => 'analytics'],
    'deworming_report.php' => ['label' => 'Reports', 'icon' => 'analytics'],
    'animal_health_card.php' => ['label' => 'Reports', 'icon' => 'analytics'],
    'birthing_breeding_report.php' => ['label' => 'Reports', 'icon' => 'analytics'],
    'stock_level_report.php' => ['label' => 'Reports', 'icon' => 'analytics'],
    'herd_feeding_report.php' => ['label' => 'Reports', 'icon' => 'analytics'],
    
    // Poultry Pages
    'flock_overview.php' => ['label' => 'Overview', 'icon' => 'speed'],
    'flocks.php' => ['label' => 'Flock Management', 'icon' => 'layers'],
    'poultry_feeding.php' => ['label' => 'Feeding Records', 'icon' => 'wheat'],
    'egg_collection.php' => ['label' => 'Egg Collection', 'icon' => 'egg'],
    'poultry_health.php' => ['label' => 'Health Tracking', 'icon' => 'medical_services'],
    'poultry_inventory.php' => ['label' => 'Resource Stock', 'icon' => 'inventory_2'],
    'poultry_reports.php' => ['label' => 'Performance Reports', 'icon' => 'analytics'],
    'poultrysettings.php' => ['label' => 'Settings', 'icon' => 'settings'],
    
    // Shared / Admin
    'users_manager.php' => ['label' => 'Users', 'icon' => 'group'],
    'settings.php' => ['label' => 'Settings', 'icon' => 'settings'],
    'finance.php' => ['label' => 'Finance', 'icon' => 'account_balance_wallet']
];

$current_config = $page_config[$current_page] ?? ['label' => 'Farm Management', 'icon' => 'agriculture'];
?>

<header class="top-header bg-white border-bottom d-flex align-items-center justify-content-between px-3 px-md-4 py-2 z-40 shadow-sm transition-all duration-300" style="height: 64px; border-color: rgba(0,0,0,0.05) !important;">
    <div id="alert-container" style="position: fixed; top: 70px; right: 20px; z-index: 2000; width: 300px;"></div>
    
    <div class="d-flex align-items-center flex-grow-1 header-left-container">
        <!-- Sidebar Toggle -->
        <button class="menu-toggle mr-2 mr-md-3" id="sidebarToggle">
            <span class="material-symbols-outlined" style="font-size: 24px;">menu</span>
        </button>

        <!-- Dynamic Page Label -->
        <div class="d-none d-lg-flex align-items-center mr-4" style="color: #065f46;">
            <span class="material-symbols-outlined mr-2" style="font-size: 22px; font-variation-settings: 'FILL' 1;"><?php echo $current_config['icon']; ?></span>
            <span class="font-weight-bold" style="font-size: 16px; letter-spacing: -0.01em;"><?php echo $current_config['label']; ?></span>
        </div>

        <!-- Search Bar -->
        <div class="header-search-container">
            <div class="search-input-wrapper">
                <span class="material-symbols-outlined">search</span>
                <input type="text" placeholder="Search records...">
            </div>
        </div>
    </div>

    <div class="d-flex align-items-center header-right-actions">
        <!-- Theme Toggle -->
        <button class="btn btn-icon-header text-muted rounded-circle" id="themeToggleBtn">
            <span class="material-symbols-outlined" id="themeIcon" style="font-size: 22px;">dark_mode</span>
        </button>

        <!-- Notification System -->
        <div class="dropdown position-relative">
            <button class="btn btn-icon-header text-muted rounded-circle position-relative" id="notificationBtn">
                <span class="material-symbols-outlined" style="font-size: 22px;">notifications</span>
                <span class="position-absolute bg-danger text-white d-flex align-items-center justify-content-center rounded-circle border border-white" style="width: 15px; height: 15px; top: 1px; right: 1px; font-size: 8px; font-weight: 700;">3</span>
            </button>
            
            <!-- Notification Dropdown -->
            <div class="dropdown-menu dropdown-menu-right border-0 shadow-lg rounded-2xl p-0 d-none notification-popup-menu" id="notificationMenu" style="width: 320px; overflow: hidden; right: 0; margin-top: 0;">
                <div class="p-3 border-bottom d-flex justify-content-between align-items-center notification-header">
                    <p class="font-weight-bold mb-0" style="font-size: 14px;">Notifications</p>
                    <span class="badge badge-pill badge-success px-2 py-1" style="font-size: 10px; font-weight: 500;">3 NEW</span>
                </div>
                <div class="notification-list" style="max-height: 360px; overflow-y: auto;">
                    <div class="dropdown-item d-flex align-items-start p-3 border-bottom border-light">
                        <div class="rounded-circle bg-success-light text-success d-flex align-items-center justify-content-center mr-3" style="width: 40px; height: 40px; min-width: 40px;">
                            <span class="material-symbols-outlined" style="font-size: 20px;">water_drop</span>
                        </div>
                        <div class="overflow-hidden flex-grow-1">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <p class="mb-0 font-weight-bold text-dark" style="font-size: 13px;">Production Alert</p>
                                <p class="mb-0 text-muted" style="font-size: 9px; opacity: 0.7;">13:24</p>
                            </div>
                            <p class="mb-0 text-muted text-truncate" style="font-size: 11px;">Target yield achieved for Sector B...</p>
                        </div>
                    </div>
                    <div class="dropdown-item d-flex align-items-start p-3">
                        <div class="rounded-circle bg-warning-light text-warning d-flex align-items-center justify-content-center mr-3" style="width: 40px; height: 40px; min-width: 40px;">
                            <span class="material-symbols-outlined" style="font-size: 20px;">warning</span>
                        </div>
                        <div class="overflow-hidden flex-grow-1">
                            <div class="d-flex justify-content-between align-items-center mb-1">
                                <p class="mb-0 font-weight-bold text-dark" style="font-size: 13px;">Inventory Level</p>
                                <p class="mb-0 text-muted" style="font-size: 9px; opacity: 0.7;">09-May-2026 12:45</p>
                            </div>
                            <p class="mb-0 text-muted text-truncate" style="font-size: 11px;">Feed stock is below critical threshold...</p>
                        </div>
                    </div>
                </div>
                <div class="p-2 bg-light d-flex justify-content-center notification-footer">
                    <button class="btn btn-link btn-sm text-success text-uppercase" style="font-size: 10px; letter-spacing: 0.05em; text-decoration: none; white-space: nowrap; font-weight: 500;">View All</button>
                </div>
            </div>
        </div>

        <!-- Quick Access / Settings -->
        <button class="btn btn-icon-header text-muted rounded-circle">
            <span class="material-symbols-outlined" style="font-size: 22px;">settings</span>
        </button>
    </div>
</header>

<style>
    .bg-success-light { background-color: rgba(220, 252, 231, 0.6) !important; }
    .bg-warning-light { background-color: rgba(255, 193, 7, 0.1) !important; }
    .text-warning { color: #f59e0b !important; }
    
    #notificationMenu.show {
        display: block !important;
        animation: headerSlideDown 0.2s ease-out;
    }

    @keyframes headerSlideDown {
        from { opacity: 0; transform: translateY(-10px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
