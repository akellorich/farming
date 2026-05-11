<?php
/**
 * Jukam Poultry Management System - Page Template
 * File: views/poultry_template.php
 * Use this as a starting point for new poultry production modules.
 */
$base_path = '../';
$nav_context = 'poultry'; // Forces the poultry-specific sidebar
?>
<!DOCTYPE html>
<html class="light" lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Title | JUKAM Farm</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/bootstrap.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/all.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/style.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/dashboard.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/header.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/navigation.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>plugins/alert/alert.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>plugins/datatables/datatables.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    
    <script>
        var base_path = '<?php echo $base_path; ?>';
    </script>
    
    <style>
        /* Poultry Specific Refinements */
        :root {
            --primary: #206223;
            --primary-dark: #003010;
        }

        body { font-family: 'Manrope', sans-serif; background-color: #F9FBF9; color: #1f2937; }
        
        .main-content { 
            margin-left: 256px; 
            padding-top: 64px; 
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1); 
            min-height: 100vh; 
        }
        
        body.sidebar-collapsed .main-content { margin-left: 80px; }
        
        @media (max-width: 991.98px) {
            .main-content { margin-left: 0 !important; }
        }

        /* Standardized Header Components from Design System */
        .search-input-wrapper {
            background: #f1f3f4;
            border-radius: 999px;
            padding: 0.6rem 1.25rem;
            display: flex;
            align-items: center;
            border: 1px solid transparent;
            transition: all 0.2s;
            max-width: 380px;
        }

        @media (max-width: 768px) {
            .main-content { margin-left: 0 !important; padding-top: 60px; }
            body.sidebar-collapsed .main-content { margin-left: 0; }
            
            .menu-toggle {
                width: 40px !important;
                height: 40px !important;
                border-radius: 50% !important;
                display: flex !important;
                align-items: center !important;
                justify-content: center !important;
                flex-shrink: 0 !important;
                padding: 0 !important;
            }

            h2.font-headline { font-size: 1.1rem !important; }
            .stats-card-poultry h3 { font-size: 20px !important; }
            h4 { font-size: 16px !important; }
            .text-muted { font-size: 12px !important; }
        }
        
        /* Placeholder for new components */
        .page-placeholder {
            border: 2px dashed rgba(32, 98, 35, 0.1);
            border-radius: 1.5rem;
            height: 400px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(32, 98, 35, 0.02);
            color: #206223;
            font-weight: 500;
        }
    </style>
</head>
<body>

    <!-- Modular Navigation (Sidebar) -->
    <?php include 'navigation.php'; ?>

    <main class="main-content">
        
        <!-- Modular Header (Top Bar) -->
        <?php include 'header.php'; ?>

        <div class="container-fluid p-3 p-md-4">
            <!-- Breadcrumbs / Page Actions -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h2 class="font-headline h4 mb-0 font-weight-bold">Page Header</h2>
                    <p class="text-muted small mb-0">Brief description of this module</p>
                </div>
                <div class="d-flex gap-2">
                    <!-- Action buttons go here -->
                </div>
            </div>

            <!-- Main Content Area -->
            <div class="row">
                <div class="col-12">
                    <div class="page-placeholder">
                        Start building here...
                    </div>
                </div>
            </div>
        </div>

    </main>

    <!-- Global Scripts -->
    <script src="<?php echo $base_path; ?>plugins/jquery-3.6.1.js"></script>
    <script src="<?php echo $base_path; ?>plugins/jquery-ui.js"></script>
    <script src="<?php echo $base_path; ?>plugins/popper.js"></script>
    <script src="<?php echo $base_path; ?>plugins/bootstrap.js"></script>
    <script src="<?php echo $base_path; ?>plugins/alert/alert.js"></script>
    <script src="<?php echo $base_path; ?>js/functions.js?v=<?php echo time(); ?>"></script>
    
    <!-- Data Visualisation & Tables -->
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.4.0/js/responsive.bootstrap4.min.js"></script>
    
    <!-- UI Plugins -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    
    <!-- Core Application Logic -->
    <script src="<?php echo $base_path; ?>js/navigation.js"></script>
    <script src="<?php echo $base_path; ?>js/header.js"></script>
    <script src="<?php echo $base_path; ?>js/auth.js"></script>

</body>
</html>
