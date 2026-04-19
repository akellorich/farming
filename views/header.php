<!-- Header -->
<header class="top-header">
    <div id="alert-container" style="position: fixed; top: 70px; right: 20px; z-index: 2000; width: 300px;"></div>
    <div class="header-left d-flex align-items-center">
        <?php
            $current_page = basename($_SERVER['PHP_SELF']);
            $page_info = [
                'dashboard.php' => ['label' => 'Dashboard', 'icon' => 'fa-tachometer-alt'],
                'animals.php' => ['label' => 'Livestock', 'icon' => 'fa-paw'],
                'production_overview.php' => ['label' => 'Milk Production', 'icon' => 'fa-tint'],
                'feeding_overview.php' => ['label' => 'Feeding', 'icon' => 'fa-wheat'],
                'health_records_overview.php' => ['label' => 'Health Registry', 'icon' => 'fa-medkit'],
                'schedules_overview.php' => ['label' => 'Health Schedules', 'icon' => 'fa-calendar-check'],
                'inventory_overview.php' => ['label' => 'Inventory', 'icon' => 'fa-boxes'],
                'reports_overview.php' => ['label' => 'Reports Manager', 'icon' => 'fa-chart-line'],
                'milk_production_report.php' => ['label' => 'Reports Manager', 'icon' => 'fa-chart-line'],
                'health_records_report.php' => ['label' => 'Reports Manager', 'icon' => 'fa-chart-line'],
                'vaccination_report.php' => ['label' => 'Reports Manager', 'icon' => 'fa-chart-line'],
                'deworming_report.php' => ['label' => 'Reports Manager', 'icon' => 'fa-chart-line'],
                'animal_health_card.php' => ['label' => 'Reports', 'icon' => 'fa-chart-line'],
                'birthing_breeding_report.php' => ['label' => 'Reports Manager', 'icon' => 'fa-chart-line'],
                'stock_level_report.php' => ['label' => 'Reports Manager', 'icon' => 'fa-chart-line'],
                'herd_feeding_report.php' => ['label' => 'Reports Manager', 'icon' => 'fa-chart-line'],
                'finance.php' => ['label' => 'Finance', 'icon' => 'fa-wallet'],
                'users.php' => ['label' => 'Users Manager', 'icon' => 'fa-users'],
                'users_manager.php' => ['label' => 'Users Manager', 'icon' => 'fa-users'],
                'settings.php' => ['label' => 'Settings', 'icon' => 'fa-cog']
            ];
            $current_info = $page_info[$current_page] ?? ['label' => 'Jukam Farm', 'icon' => 'fa-tractor'];
        ?>
        <button class="header-icon-btn d-lg-none mr-2" id="mobileMenuBtn">
            <span class="material-symbols-outlined">menu</span>
        </button>
        <button class="header-icon-btn mr-3 d-none d-lg-flex" id="sidebarToggle">
            <span class="material-symbols-outlined hamburger-icon">menu</span>
        </button>
        <div class="search-wrapper d-none d-lg-flex">
            <div class="d-flex align-items-center" style="color: #065f46; font-size: 1.1rem; gap: 0.5rem;">
                <i class="fal <?php echo $current_info['icon']; ?>"></i>
                <span><?php echo $current_info['label']; ?></span>
            </div>
        </div>
        <div class="search-container ml-4">
            <span class="material-symbols-outlined search-icon">search</span>
            <input type="text" class="search-input" placeholder="Search records...">
        </div>
    </div>
    
    <div class="header-actions">
        <button class="header-icon-btn" id="themeToggleBtn">
            <span class="material-symbols-outlined" id="themeIcon">dark_mode</span>
        </button>
        <div class="position-relative">
            <button class="header-icon-btn" id="notificationBtn">
                <span class="material-symbols-outlined">notifications</span>
                <span class="notification-badge">3</span>
            </button>
            <div class="notification-popup-menu" id="notificationMenu">
                <div class="notification-header">
                    <p class="mb-0">Notifications</p>
                    <span class="badge badge-pill badge-light text-success" style="font-size: 10px; font-weight: 400;">3 NEW</span>
                </div>
                <div class="notification-list">
                    <a href="#" class="notification-item">
                        <div class="notif-icon bg-success-light text-success">
                            <span class="material-symbols-outlined">water_drop</span>
                        </div>
                        <div class="notif-content">
                            <p class="notif-title">Milk Production</p>
                            <p class="notif-desc">Daily yield goal of 8,500L has been successfully achieved today...</p>
                        </div>
                    </a>
                    <a href="#" class="notification-item">
                        <div class="notif-icon bg-warning-light text-warning">
                            <span class="material-symbols-outlined">warning</span>
                        </div>
                        <div class="notif-content">
                            <p class="notif-title">Stock Alert</p>
                            <p class="notif-desc">Protein Supplement A is below critical levels in Silo 1...</p>
                        </div>
                    </a>
                    <a href="#" class="notification-item">
                        <div class="notif-icon bg-error-light text-error">
                            <span class="material-symbols-outlined">emergency</span>
                        </div>
                        <div class="notif-content">
                            <p class="notif-title">Health Incident</p>
                            <p class="notif-desc">Cow #2481 requires urgent veterinary attention in Sick Bay...</p>
                        </div>
                    </a>
                </div>
                <div class="notification-footer">
                    <a href="#" class="text-success small">VIEW ALL NOTIFICATIONS</a>
                </div>
            </div>
        </div>
        <button class="header-icon-btn">
            <span class="material-symbols-outlined">settings</span>
        </button>
    </div>
</header>
