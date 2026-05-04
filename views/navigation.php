<!-- Sidebar -->
<aside class="sidebar">
    <div class="sidebar-logo">
        <img src="<?php echo $base_path ?? ''; ?>images/logo.png" alt="Logo" class="brand-logo-img">
        <h1 class="font-headline">Jukam Farm</h1>
    </div>

    <nav class="flex-grow-1">
        <a href="<?php echo ($base_path ?? '') . 'dashboard.php'; ?>" class="nav-item <?php echo basename($_SERVER['PHP_SELF']) == 'dashboard.php' ? 'active' : ''; ?>">
            <i class="fal fa-tachometer-alt"></i>
            <span>Dashboard</span>
        </a>
        <a href="<?php echo ($base_path ?? '') . 'views/animals.php'; ?>" class="nav-item <?php echo basename($_SERVER['PHP_SELF']) == 'animals.php' ? 'active' : ''; ?>">
            <i class="fal fa-paw"></i>
            <span>Animals</span>
        </a>
        <a href="<?php echo ($base_path ?? '') . 'views/production_overview.php'; ?>" class="nav-item <?php echo basename($_SERVER['PHP_SELF']) == 'production_overview.php' ? 'active' : ''; ?>">
            <i class="fal fa-tint"></i>
            <span>Production</span>
        </a>
        <a href="<?php echo ($base_path ?? '') . 'views/feeding_overview.php'; ?>" class="nav-item <?php echo basename($_SERVER['PHP_SELF']) == 'feeding_overview.php' ? 'active' : ''; ?>">
            <i class="fal fa-wheat"></i>
            <span>Feeding</span>
        </a>
        <a href="<?php echo ($base_path ?? '') . 'views/health_records_overview.php'; ?>" class="nav-item <?php echo in_array(basename($_SERVER['PHP_SELF']), ['health_records_overview.php', 'schedules_overview.php']) ? 'active' : ''; ?>">
            <i class="fal fa-medkit"></i>
            <span>Health</span>
        </a>
        <a href="<?php echo ($base_path ?? '') . 'views/inventory_overview.php'; ?>" class="nav-item <?php echo basename($_SERVER['PHP_SELF']) == 'inventory_overview.php' ? 'active' : ''; ?>">
            <i class="fal fa-boxes"></i>
            <span>Inventory</span>
        </a>
        <a href="<?php echo ($base_path ?? '') . 'views/reports_overview.php'; ?>" class="nav-item <?php echo in_array(basename($_SERVER['PHP_SELF']), ['reports_overview.php', 'milk_production_report.php', 'health_records_report.php', 'vaccination_report.php', 'deworming_report.php', 'animal_health_card.php', 'birthing_breeding_report.php', 'stock_level_report.php', 'herd_feeding_report.php']) ? 'active' : ''; ?>">
            <i class="fal fa-chart-line"></i>
            <span>Reports</span>
        </a>
        <a href="#" class="nav-item">
            <i class="fal fa-wallet"></i>
            <span>Finance</span>
        </a>
        
        <div class="mt-4 pt-4 border-top">
            <a href="<?php echo ($base_path ?? '') . 'views/users_manager.php'; ?>" class="nav-item <?php echo basename($_SERVER['PHP_SELF']) == 'users_manager.php' ? 'active' : ''; ?>">
                <i class="fal fa-users"></i>
                <span>Users</span>
            </a>
            <a href="<?php echo ($base_path ?? '') . 'views/settings.php'; ?>" class="nav-item <?php echo basename($_SERVER['PHP_SELF']) == 'settings.php' ? 'active' : ''; ?>">
                <i class="fal fa-cog"></i>
                <span>Settings</span>
            </a>
        </div>
    </nav>

    <div class="mt-auto pb-1">
        <div class="position-relative">
            <button class="user-profile-btn botanical-shadow d-flex align-items-center" id="userMenuBtn">
                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuBKv6UhRkhViIP3Lc_sEtl_CrVj20_Rf1BVquxC5jY17a2K3bUbRCUoNIP6gt5kWuyqv7CA4j0MmsqDjnx_bwqY4iAa8tH0ZT-qcICKUBIuADOUAG8jK3McNhfJC6s1VVgPNkqnVnVfjL8Efeb_Rd2k6UPjJlhyz1ThZIxNSnZ_OWAUcFyiVeSmymtJ_qUch5Gks0MYdRgSte-J5S6OMx4s1-y471x7fh91ekDaeAY1Sh9Z5rShfmOKPVlIbLJi8_Lb4dGazC0_5D_I" alt="User" class="user-avatar">
                <div class="user-info">
                    <p class="font-headline font-weight-bold small mb-0">James Kamau</p>
                    <p class="font-headline text-muted mb-0" style="font-size: 8px; text-transform: uppercase;">General Manager</p>
                </div>
                <span class="material-symbols-outlined user-chevron ml-auto">expand_less</span>
            </button>
            <div class="profile-popup-menu botanical-shadow">
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
                    <span>Lock</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href="<?php echo $base_path ?? ''; ?>index.php" class="profile-item text-danger" id="logoutBtn">
                    <span class="material-symbols-outlined">logout</span>
                    <span>Log out</span>
                </a>
            </div>
        </div>
    </div>
</aside>
