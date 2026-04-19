<?php
/**
 * Jukam Dairy Management System - System Settings
 * File: views/settings.php
 */
$base_path = '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Settings | Jukam Farm</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/navigation.css">
    <link rel="stylesheet" href="../css/jquery-ui.css">
    <link rel="stylesheet" href="../css/alert.css">
    
    <!-- Google Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Work+Sans:wght@300;400;500;600;700&family=Space+Grotesk:wght@300;400;500;600;700&family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary: #206223;
            --primary-container: #3a7b3a;
            --on-primary: #ffffff;
            --on-primary-container: #cbffc2;
            --surface: #fafaf5;
            --surface-container-lowest: #ffffff;
            --surface-container-low: #f4f4ef;
            --surface-container: #eeeee9;
            --surface-container-high: #e8e8e3;
            --on-surface: #1a1c19;
            --on-surface-variant: #40493d;
            --outline-variant: #bfcaba;
            --primary-fixed: #acf4a4;
            --on-primary-fixed: #002203;
            --on-tertiary-fixed-variant: #07521d;
            --background: #fafaf5;
        }

        body {
            background-color: var(--background);
            font-family: 'Work Sans', sans-serif;
            color: var(--on-surface);
        }

        .headline { font-family: 'Manrope', sans-serif; }

        /* Premium Settings UI Components */
        .settings-tabs-wrapper {
            display: flex;
            gap: 2.5rem;
            border-bottom: 1px solid rgba(191, 202, 186, 0.2);
            overflow-x: auto;
            margin-bottom: 1.5rem;
            padding-bottom: 1px;
            scrollbar-width: none;
        }
        .settings-tabs-wrapper::-webkit-scrollbar { display: none; }

        .settings-tab-btn {
            background: none;
            border: none;
            padding-bottom: 1rem;
            color: #57534e;
            font-weight: 500;
            font-size: 0.875rem;
            transition: all 0.3s;
            position: relative;
            white-space: nowrap;
            cursor: pointer;
        }
        .settings-tab-btn:hover { color: var(--primary); }
        .settings-tab-btn.active {
            color: var(--primary);
            font-weight: 700;
        }
        .settings-tab-indicator {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background-color: var(--primary);
            border-radius: 4px 4px 0 0;
        }

        .premium-card {
            background-color: var(--surface-container-lowest);
            border-radius: 1.25rem;
            border: 1px solid rgba(191, 202, 186, 0.15);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.02);
            padding: 2.5rem;
            margin-bottom: 1.5rem;
        }
        .sidebar-card {
            padding: 1.25rem;
            border-radius: 1.25rem;
            border: 1px solid rgba(191, 202, 186, 0.15);
        }

        .form-label-premium {
            font-family: 'Manrope', sans-serif;
            font-size: 10px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--on-surface-variant);
            padding: 0 0.25rem;
            margin-bottom: 0.5rem;
            display: block;
        }
        .form-input-premium {
            width: 100%;
            background-color: var(--surface-container-low);
            border: none;
            border-bottom: 2px solid transparent;
            border-radius: 0.75rem;
            padding: 0.65rem 1rem;
            font-size: 13px;
            color: var(--on-surface);
            transition: all 0.2s;
        }
        .form-input-premium:focus {
            outline: none;
            border-bottom-color: var(--primary);
            box-shadow: none;
        }

        .btn-premium-save {
            background: linear-gradient(to right, var(--primary), var(--primary-container));
            color: var(--on-primary);
            font-weight: 500;
            border-radius: 0.5rem;
            padding: 0.5rem 1.25rem;
            font-size: 0.875rem;
            border: none;
            box-shadow: 0 4px 6px rgba(32, 98, 35, 0.2);
            transition: all 0.2s;
        }
        .btn-premium-save:hover {
            transform: translateY(-1px);
            box-shadow: 0 6px 12px rgba(32, 98, 35, 0.25);
            color: white;
        }
        .btn-premium-discard {
            background: none;
            border: none;
            color: var(--primary);
            font-weight: 500;
            font-size: 0.875rem;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            transition: all 0.2s;
        }
        .btn-premium-discard:hover {
            background-color: rgba(32, 98, 35, 0.05);
        }

        /* Sidebar/Header fixes */
        .sidebar { z-index: 1050 !important; }
        .top-header { z-index: 1000 !important; }
        /* .main-content { margin-top: 64px; } */

        .material-symbols-outlined {
            font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            display: inline-block;
            vertical-align: middle;
        }

        /* jQuery UI overrides */
        .ui-datepicker { 
            font-family: 'Work Sans', sans-serif !important;
            font-size: 13px !important;
            padding: 0 !important;
            border: none !important;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1) !important;
            border-radius: 12px !important;
        }
        .ui-datepicker-header {
            background: var(--surface-container-high) !important;
            border: none !important;
            border-radius: 12px 12px 0 0 !important;
            padding: 8px 0 !important;
        }
        .ui-datepicker-month, .ui-datepicker-year {
            font-size: 11px !important;
            padding: 2px !important;
            border-radius: 4px !important;
            border: 1px solid var(--outline-variant) !important;
            background: white !important;
        }
    </style>
</head>
<body>

    <!-- Modular Sidebar -->
    <?php include 'navigation.php'; ?>

    <!-- Modular Header -->
    <?php include 'header.php'; ?>

    <!-- Main Content Area -->
    <main class="main-content">
        <div class="container-fluid pt-2 pl-md-2 pr-md-5">
            
            <!-- Context Header Section -->
            <header class="mb-4">
                <p class="headline text-uppercase font-weight-bold mb-0" style="font-size: 10px; letter-spacing: 0.2em; color: var(--on-surface-variant); line-height: 1;">Configure</p>
                <h2 class="headline font-weight-extrabold h4 mb-1" style="color: var(--on-surface);">System Settings</h2>
                <p class="text-nowrap" style="color: var(--on-surface-variant); font-size: 12.5px; font-weight: 500;">Configure your dairy management preferences and organizational identity for seamless operations.</p>
            </header>

            <!-- Tabbed Interface -->
            <div class="d-flex flex-column">
                <!-- Navigation Tabs -->
                <div class="settings-tabs-wrapper">
                    <button class="settings-tab-btn active" data-tab="company-details">
                        Company Details
                        <span class="settings-tab-indicator"></span>
                    </button>
                    <button class="settings-tab-btn" data-tab="breeds">Breeds</button>
                    <button class="settings-tab-btn" data-tab="pens">Pens</button>
                    <button class="settings-tab-btn" data-tab="email">Email Settings</button>
                    <button class="settings-tab-btn" data-tab="sms">SMS Settings</button>
                </div>

                <!-- Content Display Areas -->
                <div id="settings-content-wrapper">
                    <!-- Tab 1: Company Details -->
                    <div class="settings-tab-content active" id="tab-company-details">
                        <div class="row pb-5">
                            <!-- Main Form Section (Company Details) -->
                            <div class="col-12 col-lg-8 d-flex flex-column">
                                <div class="premium-card h-100 d-flex flex-column mb-lg-0">
                            <div class="d-flex align-items-center mb-4">
                                <div class="rounded-circle d-flex align-items-center justify-content-center mr-3 shadow-sm" style="width: 48px; height: 48px; background-color: var(--primary-fixed); color: var(--on-primary-fixed);">
                                    <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">edit_document</span>
                                </div>
                                <div class="ml-1">
                                    <h3 class="headline h5 font-weight-bold mb-0">Corporate Identity</h3>
                                    <p class="small text-muted mb-0">Update your official company registration and contact details.</p>
                                </div>
                            </div>

                            <form class="flex-grow-1 d-flex flex-column">
                                <div class="row mb-3">
                                    <div class="col-md-6 mb-3 mb-md-0">
                                        <label class="form-label-premium">Company Name</label>
                                        <input class="form-input-premium" type="text" value="JUKAM Dairy Limited"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label-premium">Tax Registration No.</label>
                                        <input class="form-input-premium" type="text" value="TRN-88291-JK"/>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6 mb-3 mb-md-0">
                                        <label class="form-label-premium">Incorporation Date</label>
                                        <input class="form-input-premium" type="text" id="incorp_date" value="12-May-2018" readonly/>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label-premium">Email Address</label>
                                        <input class="form-input-premium" type="email" value="admin@jukamdairy.co.ke"/>
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <label class="form-label-premium">Physical Address</label>
                                    <textarea class="form-input-premium" rows="2">Plot 45, Green Valley Industrial Estate, Sector 7, Rift Valley District</textarea>
                                </div>

                                <div class="row mb-4">
                                    <div class="col-md-6 mb-3 mb-md-0">
                                        <label class="form-label-premium">Postal Address</label>
                                        <input class="form-input-premium" type="text" value="P.O. Box 7721, Nakuru Central"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label-premium">Mobile Number</label>
                                        <input class="form-input-premium" type="tel" value="+254 722 000 999"/>
                                    </div>
                                </div>

                                <div class="mt-auto pt-3 d-flex align-items-center justify-content-end">
                                    <button class="btn-premium-discard mr-2" type="button">Discard Changes</button>
                                    <button class="btn-premium-save" type="submit">Save Changes</button>
                                </div>
                            </form>

                            
                        </div>

                        
                    </div>

                    <!-- Sidebar Info Cards -->
                    <div class="col-12 col-lg-4 d-flex flex-column mt-4 mt-lg-0">
                        <div class="d-flex flex-column h-100">
                            <!-- Preview Card -->
                            <div class="sidebar-card mb-4" style="background-color: var(--surface-container-low);">
                                <h4 class="headline text-uppercase mb-3" style="font-size: 12px; font-weight: 800; letter-spacing: 0.1em; color: var(--on-surface-variant);">Official Logo</h4>
                                <div class="mx-auto" style="width: 128px;">
                                    <div class="position-relative overflow-hidden bg-white d-flex align-items-center justify-content-center border-2 border-dashed rounded-lg" style="aspect-ratio: 1/1; border-color: rgba(191, 202, 186, 0.4);">
                                        <img alt="Company Logo" class="w-100 h-100" style="object-fit: cover;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuAY1fdtsEH5JFJhaNPx7MSnxi8Pkb26Cbo6OzCHP2Rxd_sq3Z0Jckia_unELLLeItc4hqi7yWmbthGR_1I3-ZM-4M_3_meuGPNtsKHY0dmQMOf9COsriJo-upAEYxxzHndBiKS0QyK6isef7AbFjNJ2bbqt3QeuPN18dDXdevO9drau8bGE1PuxUO0L17HUXwp8GCfUNYdD7lT6BMz7HRaRd3SZ_ar2eX5fF1sKQT7u6RRA4DUChgSK6DAPwqnWzoQdB7zyI6TFW4PP"/>
                                    </div>
                                </div>
                                <p class="text-center mt-3 mb-0 small" style="color: var(--on-surface-variant); font-size: 11px;">PNG, JPG, SVG. Max 5MB.</p>
                            </div>

                            <!-- Location Insight -->
                            <div class="sidebar-card flex-grow-1 d-flex flex-column overflow-hidden" style="background-color: rgba(232, 232, 227, 0.5);">
                                <div class="position-relative" style="z-index: 10;">
                                    <h4 class="headline text-uppercase mb-1" style="font-size: 12px; font-weight: 800; letter-spacing: 0.1em; color: var(--on-surface-variant);">Location</h4>
                                    <p class="font-weight-bold small mb-2" style="color: var(--on-surface);">Central Region Cluster 14</p>
                                    <div class="d-flex align-items-center mb-3">
                                        <span class="material-symbols-outlined mr-2" style="font-size: 14px; color: var(--primary); font-variation-settings: 'FILL' 1;">verified</span>
                                        <span class="font-weight-medium" style="font-size: 10px; color: var(--on-tertiary-fixed-variant);">Verified Office Address</span>
                                    </div>
                                </div>
                                <!-- Interactive Map -->
                                <div class="flex-grow-1 rounded-lg bg-light overflow-hidden position-relative shadow-inner" style="min-h: 300px; border: 1px solid rgba(191, 202, 186, 0.1);">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31918.0695740695!2d36.0500!3d-0.3000!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x18298d9eccd7a4d1%3A0x66c3013d3301073a!2sNakuru!5e0!3m2!1sen!2ske!4v1713537200000!5m2!1sen!2ske" width="100%" height="100%" style="border:0; filter: grayscale(1) contrast(1.2); opacity: 0.8;" allowfullscreen="" loading="lazy"></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Tab 1 -->

                </div>
            </div>
        </div>
    </main>

    <!-- Global Scripts -->
    <script src="../plugins/jquery-3.6.1.js"></script>
    <script src="../plugins/popper.js"></script>
    <script src="../plugins/bootstrap.js"></script>
    <script src="../plugins/jquery-ui.js"></script>
    <script src="../plugins/alert.js"></script>
    <script src="../js/header.js"></script>
    
    <script>
        $(document).ready(function() {
            // Tab switching logic
            $('.settings-tab-btn').on('click', function() {
                var targetTab = $(this).data('tab');
                
                // Update navigation state
                $('.settings-tab-btn').removeClass('active');
                $('.settings-tab-indicator').remove();
                $(this).addClass('active').append('<span class="settings-tab-indicator"></span>');
                
                // Update content visibility
                $('.settings-tab-content').hide();
                $('#tab-' + targetTab).show();
            });
            
            // Sidebar active state fix
            $('.nav-item').removeClass('active');
            $('.nav-item:contains("Settings")').addClass('active');

            // Initialize jQuery UI Datepicker
            $("#incorp_date").datepicker({
                dateFormat: 'dd-M-yy',
                maxDate: 0,
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0"
            });
        });
    </script>
</body>
</html>
