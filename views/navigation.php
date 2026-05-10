<!-- Unified Sidebar Navigation -->
<aside class="sidebar border-right bg-light d-flex flex-column p-3 transition-all duration-300" style="border-color: rgba(0,0,0,0.05) !important;">
    <!-- Brand Logo -->
    <div class="sidebar-logo">
        <img src="<?php echo $base_path ?? ''; ?>images/logo.png" alt="Logo" class="brand-logo-img">
        <h1 class="font-headline">Jukam Farm</h1>
    </div>

    <!-- Navigation Menu -->
    <nav class="flex-grow-1">
        <?php 
            $current_page = basename($_SERVER['PHP_SELF']); 
            $nav_context = $nav_context ?? 'dairy'; // Default to dairy if not set
            
            function isActive($page, $current) {
                if (is_array($page)) {
                    return in_array($current, $page) ? 'bg-success-light text-success font-weight-bold' : 'text-muted hover-bg-light';
                }
                return $page == $current ? 'bg-success-light text-success font-weight-bold' : 'text-muted hover-bg-light';
            }

            function getIconSettings($page, $current) {
                if (is_array($page)) {
                    return in_array($current, $page) ? "font-variation-settings: 'FILL' 1;" : "";
                }
                return $page == $current ? "font-variation-settings: 'FILL' 1;" : "";
            }
        ?>
        
        <div class="nav flex-column">
            <?php if ($nav_context === 'poultry'): ?>
                <!-- Poultry Navigation Items -->
                <a href="flock_overview.php" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive('flock_overview.php', $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings('flock_overview.php', $current_page); ?>">speed</span>
                    <span>Overview</span>
                </a>
                <a href="#" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive('flocks.php', $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings('flocks.php', $current_page); ?>">layers</span>
                    <span>Flock Management</span>
                </a>
                <a href="poultry_feeding.php" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive('poultry_feeding.php', $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings('poultry_feeding.php', $current_page); ?>">wheat</span>
                    <span>Feeding Records</span>
                </a>
                <a href="egg_collection.php" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive('egg_collection.php', $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings('egg_collection.php', $current_page); ?>">egg</span>
                    <span>Egg Collection</span>
                </a>
                <a href="poultry_health.php" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive('poultry_health.php', $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings('poultry_health.php', $current_page); ?>">medical_services</span>
                    <span>Health Tracking</span>
                </a>
                <a href="#" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive('poultry_inventory.php', $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings('poultry_inventory.php', $current_page); ?>">inventory_2</span>
                    <span>Resource Stock</span>
                </a>
                <a href="#" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive('poultry_reports.php', $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings('poultry_reports.php', $current_page); ?>">analytics</span>
                    <span>Performance Reports</span>
                </a>
            <?php else: ?>
                <!-- Dairy Navigation Items (Default) -->
                <a href="<?php echo ($base_path ?? '') . 'dashboard.php'; ?>" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive('dashboard.php', $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings('dashboard.php', $current_page); ?>">speed</span>
                    <span>Dashboard</span>
                </a>
                <a href="<?php echo ($base_path ?? '') . 'views/animals.php'; ?>" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive('animals.php', $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings('animals.php', $current_page); ?>">pets</span>
                    <span>Animals</span>
                </a>
                <a href="<?php echo ($base_path ?? '') . 'views/production_overview.php'; ?>" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive('production_overview.php', $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings('production_overview.php', $current_page); ?>">water_drop</span>
                    <span>Production</span>
                </a>
                <a href="<?php echo ($base_path ?? '') . 'views/feeding_overview.php'; ?>" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive('feeding_overview.php', $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings('feeding_overview.php', $current_page); ?>">wheat</span>
                    <span>Feeding</span>
                </a>
                <a href="<?php echo ($base_path ?? '') . 'views/health_records_overview.php'; ?>" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive(['health_records_overview.php', 'schedules_overview.php'], $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings(['health_records_overview.php', 'schedules_overview.php'], $current_page); ?>">medical_services</span>
                    <span>Health</span>
                </a>
                <a href="<?php echo ($base_path ?? '') . 'views/inventory_overview.php'; ?>" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive('inventory_overview.php', $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings('inventory_overview.php', $current_page); ?>">inventory_2</span>
                    <span>Inventory</span>
                </a>
                <a href="<?php echo ($base_path ?? '') . 'views/reports_overview.php'; ?>" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive(['reports_overview.php', 'milk_production_report.php', 'health_records_report.php', 'vaccination_report.php', 'deworming_report.php', 'animal_health_card.php', 'birthing_breeding_report.php', 'stock_level_report.php', 'herd_feeding_report.php'], $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings('reports_overview.php', $current_page); ?>">analytics</span>
                    <span>Reports</span>
                </a>
                <a href="#" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive('finance.php', $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings('finance.php', $current_page); ?>">account_balance_wallet</span>
                    <span>Finance</span>
                </a>
            <?php endif; ?>

            <!-- Common Divider Items -->
            <div class="pt-3 mt-3 border-top border-light">
                <a href="<?php echo ($base_path ?? '') . 'views/users_manager.php'; ?>" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive('users_manager.php', $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings('users_manager.php', $current_page); ?>">group</span>
                    <span>Users</span>
                </a>
                <?php 
                    $settings_page = ($nav_context === 'poultry') ? 'poultrysettings.php' : 'settings.php';
                ?>
                <a href="<?php echo ($base_path ?? '') . 'views/' . $settings_page; ?>" class="nav-link d-flex align-items-center mb-1 rounded-xl px-4 py-3 transition-all <?php echo isActive($settings_page, $current_page); ?>" style="font-size: 14px;">
                    <span class="material-symbols-outlined mr-3" style="font-size: 22px; <?php echo getIconSettings($settings_page, $current_page); ?>">settings</span>
                    <span>Settings</span>
                </a>
            </div>
        </div>
    </nav>

    <!-- Profile Card -->
    <div class="mt-auto position-relative">
        <button class="user-profile-btn botanical-shadow d-flex align-items-center" id="userMenuBtn">
            <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuBKv6UhRkhViIP3Lc_sEtl_CrVj20_Rf1BVquxC5jY17a2K3bUbRCUoNIP6gt5kWuyqv7CA4j0MmsqDjnx_bwqY4iAa8tH0ZT-qcICKUBIuADOUAG8jK3McNhfJC6s1VVgPNkqnVnVfjL8Efeb_Rd2k6UPjJlhyz1ThZIxNSnZ_OWAUcFyiVeSmymtJ_qUch5Gks0MYdRgSte-J5S6OMx4s1-y471x7fh91ekDaeAY1Sh9Z5rShfmOKPVlIbLJi8_Lb4dGazC0_5D_I" alt="User" class="user-avatar">
            <div class="user-info">
                <p class="font-headline font-weight-bold small mb-0">James Kamau</p>
                <p class="font-headline text-muted mb-0" style="font-size: 8px; text-transform: uppercase;">General Manager</p>
            </div>
            <span class="material-symbols-outlined user-chevron ml-auto">expand_less</span>
        </button>

        <!-- Profile Popup Menu -->
        <div class="profile-popup-menu botanical-shadow">
            <div>
                <a href="#" class="profile-item">
                    <span class="material-symbols-outlined">account_circle</span>
                    <span>Profile</span>
                </a>
                <a href="#" class="profile-item" id="changePasswordMenuBtn">
                    <span class="material-symbols-outlined">lock_reset</span>
                    <span>Change password</span>
                </a>
                <a href="#" class="profile-item" id="lockSessionBtn">
                    <span class="material-symbols-outlined">lock</span>
                    <span>Lock Session</span>
                </a>
                <hr class="my-1 mx-2">
                <a href="<?php echo ($base_path ?? '') . 'index.php'; ?>" class="profile-item text-danger" id="logoutBtn">
                    <span class="material-symbols-outlined">logout</span>
                    <span>Log out</span>
                </a>
            </div>
        </div>
    </div>
</aside>

<!-- Global User Menu Logic & Modals -->
<?php include_once 'modals.php'; ?>

<script>
    /**
     * Jukam Dairy - Global User Menu Initializer
     * This script ensures that the user profile popup and its operations (Lock, Password, Logout)
     * are functional across all pages by dynamically loading dependencies if they are missing.
     */
    (function() {
        var checkDependencies = setInterval(function() {
            if (typeof jQuery !== 'undefined') {
                clearInterval(checkDependencies);
                
                var basePath = '<?php echo $base_path ?? ""; ?>';
                
                // Ensure navigation.js is loaded for the popup toggle
                if (!window.jukamNavigationLoaded && !$('script[src*="navigation.js"]').length) {
                    $.getScript(basePath + 'js/navigation.js');
                }
                
                // Ensure auth.js is loaded for session locking and password changes
                if (!window.jukamAuthLoaded && !$('script[src*="auth.js"]').length) {
                    $.getScript(basePath + 'js/auth.js');
                }
            }
        }, 100);
    })();
</script>

<style>
    .bg-success-light { background-color: rgba(220, 252, 231, 0.6) !important; color: #065f46 !important; }
    .hover-bg-light:hover { background-color: rgba(0,0,0,0.03); color: #065f46 !important; }
    .user-profile-card:hover { background: rgba(228, 234, 223, 1) !important; }
    .truncate { white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
    
    .profile-popup-menu.show {
        display: block !important;
    }

    @media (max-width: 991.98px) {
        .sidebar {
            transform: translateX(-100%);
            width: 280px !important;
        }
        .sidebar.mobile-show {
            transform: translateX(0);
            visibility: visible !important;
            z-index: 9999 !important;
            box-shadow: 20px 0 50px rgba(0,0,0,0.2);
        }
    }
</style>
