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
            flex-wrap: nowrap;
            gap: 2.5rem;
            border-bottom: 1px solid rgba(191, 202, 186, 0.2);
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
            margin-bottom: 1.5rem;
            padding-bottom: 1px;
            scrollbar-width: none;
            width: 100%;
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
            flex-shrink: 0;
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
        th.form-label-premium {
            display: table-cell !important;
            color: #475569 !important;
            font-size: 11px !important;
            font-weight: 700 !important;
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

        .botanical-sidebar {
            background: linear-gradient(to bottom, rgba(32, 98, 35, 0.85), rgba(29, 98, 43, 0.95));
            background-size: cover;
            background-position: center;
            position: relative;
        }
        .botanical-sidebar::before {
            content: "";
            position: absolute;
            inset: 0;
            background-image: url('../images/pattern.png');
            opacity: 0.05;
            pointer-events: none;
        }

        .custom-switch .custom-control-label::before {
            background-color: #bfcaba;
            border-color: #bfcaba;
        }
        .custom-switch .custom-control-input:checked ~ .custom-control-label::before {
            background-color: #206223;
            border-color: #206223;
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
        .content-blur {
            filter: blur(8px) saturate(0.6);
            transition: filter 0.3s ease;
            pointer-events: none;
            user-select: none;
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

        /* Agrarian/Botanical Control Groups */
        .setting-control-group {
            background-color: var(--surface-container-low);
            border-radius: 1rem;
            padding: 1rem 1.5rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1rem;
            transition: all 0.2s;
            border: 1px solid transparent;
        }
        .setting-control-group:hover {
            background-color: var(--surface-container);
            border-color: rgba(32, 98, 35, 0.1);
        }
        .premium-select-agro {
            background-color: white;
            border: 1px solid var(--outline-variant);
            color: var(--primary);
            font-weight: 400;
            font-family: 'Manrope', sans-serif;
            font-size: 0.75rem;
            cursor: pointer;
            padding: 0.5rem 2rem 0.5rem 1rem;
            border-radius: 0.75rem;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' height='20' viewBox='0 -960 960 960' width='20' fill='%23206223'%3E%3Cpath d='M480-345 240-585l56-56 184 184 184-184 56 56-240 240Z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 0.75rem center;
        }
        .premium-select-agro:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(32, 98, 35, 0.05);
        }
        .setting-icon-box {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            background-color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            box-shadow: 0 2px 4px rgba(0,0,0,0.02);
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

        @media (max-width: 768px) {
            .settings-tabs-wrapper {
                gap: 1.25rem;
            }
            .setting-control-group {
                flex-wrap: wrap;
                padding: 1rem;
                gap: 0.75rem;
            }
            .setting-control-group > .d-flex {
                width: 100%;
                justify-content: space-between;
            }
            .premium-select-agro {
                width: 100%;
                margin-top: 0.5rem;
            }
            .custom-switch {
                margin-left: auto;
            }
        }

        /* Modal Backdrop Blur */
        .modal-backdrop {
            backdrop-filter: blur(16px) !important;
            -webkit-backdrop-filter: blur(16px) !important;
            background-color: rgba(26, 28, 25, 0.4) !important;
            z-index: 9990 !important;
        }
        .modal-backdrop.show {
            opacity: 1 !important;
        }
        
        .modal {
            z-index: 9995 !important;
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
                    <button class="settings-tab-btn" data-tab="feed-mix">Feed Mix</button>
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

                                    <form class="flex-grow-1 d-flex flex-column" id="companyForm">
                                        <div class="row mb-3">
                                            <div class="col-md-6 mb-3 mb-md-0">
                                                <label class="form-label-premium">Company Name</label>
                                                <input class="form-input-premium" type="text" id="companyname" name="companyname" placeholder="e.g. Jukam Dairy Farm"/>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label-premium">Tax Registration No.</label>
                                                <input class="form-input-premium" type="text" id="taxregno" name="taxregno" placeholder="e.g. TRN-00000-XX"/>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-6 mb-3 mb-md-0">
                                                <label class="form-label-premium">Incorporation Date</label>
                                                <input class="form-input-premium" type="text" id="incorporationdate" name="incorporationdate" readonly/>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label-premium">Email Address</label>
                                                <input class="form-input-premium" type="email" id="emailaddress" name="emailaddress" placeholder="e.g. info@company.com"/>
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label class="form-label-premium">Physical Address</label>
                                            <textarea class="form-input-premium" id="physicaladdress" name="physicaladdress" rows="2" placeholder="Enter the full physical location of your farm or office"></textarea>
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-md-6 mb-3 mb-md-0">
                                                <label class="form-label-premium">Postal Address</label>
                                                <input class="form-input-premium" type="text" id="postaladdress" name="postaladdress" placeholder="e.g. P.O. Box 1234, City"/>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label-premium">Mobile Number</label>
                                                <input class="form-input-premium" type="tel" id="mobileno" name="mobileno" placeholder="e.g. +254 700 000 000"/>
                                            </div>
                                        </div>

                                        <div class="mt-auto pt-3 d-flex align-items-center justify-content-end">
                                            <button class="btn-premium-discard mr-2" type="button" id="discardCompanyChanges">Discard Changes</button>
                                            <button class="btn-premium-save" type="submit" id="saveCompanyChanges">Save Changes</button>
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
                                                <img alt="Company Logo" id="logoPreview" class="w-100 h-100" style="object-fit: cover;" src="images/logo.png"/>
                                                <div class="position-absolute d-flex align-items-center justify-content-center" style="inset: 0; background: rgba(0,0,0,0.2); opacity: 0; transition: opacity 0.3s; cursor: pointer;" onmouseover="this.style.opacity=1" onmouseout="this.style.opacity=0" onclick="$('#logo').click()">
                                                    <span class="material-symbols-outlined text-white" style="font-size: 32px;">photo_camera</span>
                                                </div>
                                            </div>
                                            <input type="file" id="logo" name="logo" style="display: none;" accept="image/*">
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
                        </div>
                    </div>

                    <!-- Tab 2: Breeds -->
                    <div class="settings-tab-content" id="tab-breeds" style="display: none;">
                        <div class="row pb-5">
                            <!-- Sidebar Info Cards -->
                            <div class="col-12 col-lg-3 order-1 order-lg-1 mb-4 mb-lg-0">
                                <div class="sidebar-card mb-4" style="background-color: #f1f5f1; border: none; padding: 1.5rem;">
                                    <h3 class="headline font-weight-bold mb-3" style="color: #064e3b; font-size: 1.1rem;">Genetic Management</h3>
                                    <p class="text-muted leading-relaxed" style="font-size: 0.825rem;">Manage the biological taxonomy of your livestock. Efficiency metrics are calculated based on feed-to-milk conversion ratios.</p>
                                </div>
                                <div class="sidebar-card" style="background-color: #f1f5f1; border: none; padding: 1.5rem;">
                                    <p class="text-uppercase font-weight-bold mb-2" style="font-size: 9px; letter-spacing: 0.1em; color: #1a4d1a;">QUICK STAT</p>
                                    <div class="d-flex align-items-center">
                                        <h2 class="font-weight-black text-success mb-0" style="font-size: 1.85rem; color: #1a4d1a !important;">84%</h2>
                                        <span class="font-weight-bold small ml-2" style="color: #1a4d1a; font-size: 0.85rem;">Avg. Efficiency</span>
                                    </div>
                                </div>
                            </div>

                            <!-- Main Table Section -->
                            <div class="col-12 col-lg-9 order-2 order-lg-2">
                                <div class="premium-card mb-0">
                                    <div class="table-responsive">
                                        <table class="table table-borderless align-middle">
                                            <thead>
                                                <tr style="background-color: transparent;">
                                                    <th class="form-label-premium py-3 pl-0" style="width: 30%;">BREED NAME</th>
                                                    <th class="form-label-premium py-3 text-center" style="width: 15%;">TOTAL COUNT</th>
                                                    <th class="form-label-premium py-3 text-center" style="width: 15%;">AVG. MILKING</th>
                                                    <th class="form-label-premium py-3 text-center" style="width: 20%;">EFFICIENCY</th>
                                                    <th class="form-label-premium py-3 text-center" style="width: 15%;">HEALTH INDEX</th>
                                                    <th class="form-label-premium py-3 pr-0 text-right" style="width: 5%;"></th>
                                                </tr>
                                            </thead>
                                            <tbody id="breedsBody">
                                                <tr>
                                                    <td colspan="6" class="text-center py-5">
                                                        <div class="d-flex flex-column align-items-center">
                                                            <div class="spinner-border text-success mb-3" role="status" style="width: 2rem; height: 2rem;">
                                                                <span class="sr-only">Loading...</span>
                                                            </div>
                                                            <p class="text-muted small mb-0">Synchronizing genetic profiles...</p>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                    <div class="text-center pt-4 pb-2" style="border-top: none;">
                                        <button class="btn-premium-save px-5 py-2" data-toggle="modal" data-target="#addBreedModal" style="background: #1a4d1a; border-radius: 0.5rem; font-weight: 500; font-size: 1rem;">
                                            <span class="material-symbols-outlined mr-2" style="font-size: 20px;">add</span>
                                            Add Breed
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Tab 3: Pens -->
                    <div class="settings-tab-content" id="tab-pens" style="display: none;">
                        <div class="row pb-5">
                            <div class="col-12 col-lg-9">
                                <div class="premium-card">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="d-flex align-items-center">
                                            <div class="rounded-circle d-flex align-items-center justify-content-center mr-3 shadow-sm" style="width: 48px; height: 48px; background-color: var(--primary-fixed); color: var(--on-primary-fixed);">
                                                <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">domain</span>
                                            </div>
                                            <div>
                                                <h3 class="headline h5 font-weight-bold mb-0">Facility Pens</h3>
                                                <p class="small text-muted mb-0">Manage housing capacity and animal pen assignments.</p>
                                            </div>
                                        </div>
                                        <div class="d-flex">
                                            <button class="btn btn-outline-light text-muted btn-sm mr-2" style="border-radius: 8px;"><span class="material-symbols-outlined" style="font-size: 18px;">filter_list</span></button>
                                            <button class="btn btn-outline-light text-muted btn-sm" style="border-radius: 8px;"><span class="material-symbols-outlined" style="font-size: 18px;">download</span></button>
                                        </div>
                                    </div>

                                    <div class="table-responsive">
                                        <table class="table table-borderless align-middle">
                                            <thead>
                                                <tr style="background-color: var(--surface-container-low);">
                                                    <th class="form-label-premium py-3 pl-4">Pen Name</th>
                                                    <th class="form-label-premium py-3">Type</th>
                                                    <th class="form-label-premium py-3">Capacity</th>
                                                    <th class="form-label-premium py-3">Status</th>
                                                    <th class="form-label-premium py-3 pr-4 text-right">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody id="pensBody">
                                                <tr>
                                                    <td colspan="5" class="text-center py-5">
                                                        <div class="d-flex flex-column align-items-center">
                                                            <div class="spinner-border text-success mb-3" role="status" style="width: 2rem; height: 2rem;">
                                                                <span class="sr-only">Loading...</span>
                                                            </div>
                                                            <p class="text-muted small mb-0">Synchronizing facility data...</p>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="d-flex justify-content-center mt-4">
                                        <button class="btn-premium-save px-4 py-2" data-toggle="modal" data-target="#addPenModal">
                                            <span class="material-symbols-outlined mr-2" style="font-size: 18px;">add_circle</span>
                                            Add New Pen
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-lg-3">
                                <div class="sidebar-card mb-4" style="background-color: var(--primary-container); color: white;">
                                    <h4 class="form-label-premium mb-3" style="color: rgba(255,255,255,0.7);">Infrastructure</h4>
                                    <p class="h2 font-weight-bold mb-1" id="totalActivePens">0</p>
                                    <p class="small opacity-75 mb-3">Total Active Pens</p>
                                    <div class="progress mb-2" style="height: 4px; background: rgba(255,255,255,0.2);">
                                        <div class="progress-bar bg-white" id="capacityProgressBar" style="width: 0%;"></div>
                                    </div>
                                    <p class="small mb-0" style="font-size: 10px;" id="totalCapacityUtilizedText">0% Capacity Utilized</p>
                                </div>
                                <div class="sidebar-card bg-white border shadow-sm p-0 overflow-hidden">
                                    <div class="p-3 border-bottom bg-light">
                                        <h4 class="form-label-premium mb-0">Facility Map</h4>
                                    </div>
                                    <div class="position-relative" style="height: 180px;">
                                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuCgriLQ8YYv2Zv51kKib4MeMUERqswpJFMdr_87S5WCPSr9qoVUPYJUiHs1ie4o9yUcIW8oiWfZcKG8pmXSEZgRW0wew962r00kNU0ziQuzYcU-HwXw8fk01aknzVlrRJAgbt5gU8LPI7tNLlLSYs4qVGIlycFdbJLn8lqpm48SWVMLX_WDKF2MxrfaIYJM5554eJpS_h_mCeConUTGXD6C4Soq81HAuE_ZPTPhDoy8Pkws1l0X2OluAFt7MYdnVB8LWar-WeXql88r" class="w-100 h-100" style="object-fit: cover; opacity: 0.6; filter: grayscale(1);">
                                        <div class="position-absolute d-flex align-items-center justify-content-center" style="inset: 0; background: rgba(0,0,0,0.1);">
                                            <button class="btn btn-sm btn-white shadow-sm font-weight-bold" style="font-size: 10px; border-radius: 20px;">VIEW FULL LAYOUT</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Tab 4: Email -->
                    <div class="settings-tab-content" id="tab-email" style="display: none;">
                        <div class="row pb-5">
                            <div class="col-12 col-lg-8">
                                <div class="premium-card">
                                    <div class="d-flex align-items-center mb-4">
                                        <div class="rounded-xl d-flex align-items-center justify-content-center mr-3 shadow-sm" style="width: 48px; height: 48px; background-color: #abf4ac; color: #07521d; border-radius: 12px;">
                                            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">alternate_email</span>
                                        </div>
                                        <div>
                                            <h3 class="headline h5 font-weight-bold mb-0">SMTP Configuration</h3>
                                            <p class="small text-muted mb-0">Set up your outbound mail gateway and authentication settings.</p>
                                        </div>
                                    </div>

                                    <form id="emailForm">
                                        <input type="hidden" name="id" id="emailId" value="0">
                                        <input type="hidden" name="role" id="emailRole" value="General">
                                        <div id="emailSettingsErrors" class="mb-4" style="display: none;"></div>
                                        <div class="row mb-4">
                                            <div class="col-md-6 mb-3 mb-md-0">
                                                <label class="form-label-premium">Sender Display Name</label>
                                                <input class="form-input-premium" type="text" id="emailsendername" name="sendername" placeholder="e.g. {{username}} or Support Team"/>
                                                <p class="small text-muted mt-1 mb-0" style="font-size: 10px;">Use <code class="text-primary">{{username}}</code> to show logged in user's name.</p>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label-premium">Sending Method</label>
                                                <select class="form-input-premium" id="emailsendmode" name="sendmode">
                                                    <option value="Direct">Direct (Immediate)</option>
                                                    <option value="Queue">Queue (Background)</option>
                                                    <option value="Both">Direct and Queue</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="row mb-4">
                                            <div class="col-md-9 mb-3 mb-md-0">
                                                <label class="form-label-premium">SMTP Server Address</label>
                                                <input class="form-input-premium" type="text" id="smtpserver" name="smtpserver" placeholder="e.g. smtp.gmail.com"/>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="form-label-premium">Server Port</label>
                                                <input class="form-input-premium" type="number" id="smtpport" name="smtpport" placeholder="e.g. 465 or 587"/>
                                            </div>
                                        </div>
                                        <div class="row mb-4">
                                            <div class="col-md-6 mb-3 mb-md-0">
                                                <label class="form-label-premium">User Email</label>
                                                <input class="form-input-premium" type="email" id="smtpuser" name="smtpuser" placeholder="e.g. system@yourdomain.com"/>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label-premium">Password</label>
                                                <div class="position-relative">
                                                    <input class="form-input-premium" type="password" id="smtppassword" name="smtppassword" placeholder="Enter SMTP password"/>
                                                    <button type="button" class="btn btn-link position-absolute text-muted toggle-password" style="right: 10px; top: 50%; transform: translateY(-50%);"><span class="material-symbols-outlined" style="font-size: 18px;">visibility</span></button>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="border-top pt-4 mt-2">
                                            <div class="row align-items-center">
                                                <div class="col-md-6 mb-3 mb-md-0">
                                                    <div class="setting-control-group mb-0">
                                                        <div class="d-flex align-items-center">
                                                            <div class="setting-icon-box">
                                                                <span class="material-symbols-outlined text-success" style="font-size: 20px;">verified_user</span>
                                                            </div>
                                                            <div>
                                                                <p class="headline font-weight-bold mb-0" style="font-size: 13px;">SSL/TLS Security</p>
                                                                <p class="text-muted small mb-0">Encrypted communication</p>
                                                            </div>
                                                        </div>
                                                        <div class="custom-control custom-switch">
                                                            <input type="checkbox" class="custom-control-input" id="smtpusessl" name="smtpusessl">
                                                            <label class="custom-control-label" for="smtpusessl"></label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="setting-control-group mb-0">
                                                        <div class="d-flex align-items-center">
                                                            <div class="setting-icon-box">
                                                                <span class="material-symbols-outlined text-success" style="font-size: 20px;">hub</span>
                                                            </div>
                                                            <div>
                                                                <p class="headline font-weight-bold mb-0" style="font-size: 13px;">Mail Role</p>
                                                                <p class="text-muted small mb-0">Operational context</p>
                                                            </div>
                                                        </div>
                                                        <select class="premium-select-agro" id="roleSelector">
                                                            <option value="General">General</option>
                                                            <option value="Account Management">Account Management</option>
                                                            <option value="Security Updates">Security Updates</option>
                                                            <option value="Billing">Billing</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-4 d-flex justify-content-end">
                                                <button class="btn-premium-save px-5 py-2" type="submit" style="font-size: 15px; border-radius: 12px;">
                                                    <span class="material-symbols-outlined mr-2" style="font-size: 20px;">save</span>
                                                    Save Gateway
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="sidebar-card bg-light mt-4">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h4 class="form-label-premium mb-0">Delivery Activity</h4>
                                        <span class="small cursor-pointer" style="color: var(--primary); font-family: 'Manrope', sans-serif; font-weight: 400;">Full Activity Logs</span>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-sm table-borderless mb-0" style="font-size: 13px;">
                                            <thead>
                                                <tr class="text-muted border-bottom">
                                                    <th class="font-weight-bold pb-3">#</th>
                                                    <th class="font-weight-bold pb-3">Recipient</th>
                                                    <th class="font-weight-bold pb-3">Subject</th>
                                                    <th class="font-weight-bold pb-3">Sender</th>
                                                    <th class="font-weight-bold pb-3">Status</th>
                                                    <th class="font-weight-bold pb-3">Reason</th>
                                                </tr>
                                            </thead>
                                            <tbody id="emailLogsBody" class="text-dark">
                                                <!-- Dynamic Content -->
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-12 col-lg-4">
                                <div class="premium-card h-100">
                                    <div class="d-flex align-items-center mb-4">
                                        <div class="p-2 bg-warning-light text-warning rounded-lg mr-3">
                                            <span class="material-symbols-outlined">speed</span>
                                        </div>
                                        <h3 class="headline h6 font-weight-bold mb-0">Delivery Test</h3>
                                    </div>
                                    <p class="small text-muted mb-4">Verify your credentials by sending a sample communication.</p>
                                    <div id="testEmailErrors" class="mb-3" style="display: none;"></div>
                                    <div class="mb-3">
                                        <label class="form-label-premium">Sender Role</label>
                                        <select class="form-input-premium" id="testSenderRole">
                                            <option value="General">General</option>
                                            <option value="Account Management">Account Management</option>
                                            <option value="Security Updates">Security Updates</option>
                                            <option value="Billing">Billing</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label-premium">Recipient</label>
                                        <input class="form-input-premium" type="text" id="testRecipient" placeholder="e.g. recipient@domain.com"/>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label-premium">Subject</label>
                                        <input class="form-input-premium" type="text" id="testSubject" value="System Test - Jukam Farm" placeholder="Enter test subject"/>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label-premium">Message Body</label>
                                        <textarea class="form-input-premium" id="testMessage" rows="3">Diagnostic message confirming SMTP functionality.</textarea>
                                    </div>
                                    <button class="btn btn-dark px-4 py-2 shadow-sm" id="btnSendTestEmail" style="border-radius: 12px; font-weight: 500; font-size: 13px;">
                                        <span class="material-symbols-outlined mr-2" style="font-size: 16px;">send</span>
                                        Send Test Email
                                    </button>
                                    <div class="mt-4 p-3 bg-light rounded-lg border">
                                        <p class="small text-muted mb-0" style="font-size: 10px; line-height: 1.4;">
                                            <span class="material-symbols-outlined text-primary align-middle mr-1" style="font-size: 14px;">info</span>
                                            Ensure your mail provider allows external application access (App Passwords) if MFA is enabled.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Tab 5: SMS -->
                    <div class="settings-tab-content" id="tab-sms" style="display: none;">
                        <div class="row pb-5">
                            <div class="col-12 col-lg-4">
                                <div class="premium-card mb-4">
                                    <div class="d-flex align-items-center mb-4">
                                        <div class="p-2 bg-success-light text-success rounded-lg mr-3" style="background-color: rgba(32, 98, 35, 0.1);">
                                            <span class="material-symbols-outlined">cell_tower</span>
                                        </div>
                                        <h3 class="headline h6 font-weight-bold mb-0">Gateway Details</h3>
                                    </div>
                                    <div id="smsSettingsErrors" class="mb-3" style="display: none;"></div>
                                    <form id="smsForm">
                                        <input type="hidden" name="id" id="smsId" value="0">
                                        <input type="hidden" name="priorityroute" id="smspriorityroute" value="1">
                                        <input type="hidden" name="provider" id="smsprovider" value="AfricasTalking">
                                        <div class="mb-4">
                                            <div class="setting-control-group">
                                                <div class="d-flex align-items-center">
                                                    <div class="setting-icon-box" style="background: rgba(32, 98, 35, 0.05);">
                                                        <span class="material-symbols-outlined text-success" style="font-size: 20px;">router</span>
                                                    </div>
                                                    <div>
                                                        <p class="headline font-weight-bold mb-0" style="font-size: 13px;">Service Provider</p>
                                                        <p class="text-muted small mb-0">Primary SMS gateway</p>
                                                    </div>
                                                </div>
                                                <select class="premium-select-agro" id="smsProviderSelector" style="font-size: 13px;">
                                                    <option value="AfricasTalking">AfricasTalking</option>
                                                    <option value="Talksasa">Talksasa</option>
                                                    <option value="Uwazii">Uwazii</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="mb-4">
                                            <label class="form-label-premium">Sender ID / From</label>
                                            <div class="position-relative">
                                                <input class="form-input-premium pl-5" type="text" id="smssenderid" name="senderid" placeholder="e.g. BRAND-SMS"/>
                                                <span class="material-symbols-outlined position-absolute text-success opacity-50" style="left: 15px; top: 50%; transform: translateY(-50%); font-size: 18px;">badge</span>
                                            </div>
                                            <p class="small text-muted mt-2 mb-0" style="font-size: 10px; opacity: 0.7;">Max 11 characters. Approved sender IDs only.</p>
                                        </div>

                                        <div class="setting-control-group mb-4">
                                            <div class="d-flex align-items-center">
                                                <div class="setting-icon-box" style="background: rgba(255, 193, 7, 0.05);">
                                                    <span class="material-symbols-outlined text-warning" style="font-variation-settings: 'FILL' 1; font-size: 20px;">star</span>
                                                </div>
                                                <div>
                                                    <p class="headline font-weight-bold mb-0" style="font-size: 13px;">Default Gateway</p>
                                                    <p class="text-muted small mb-0">Use for system alerts</p>
                                                </div>
                                            </div>
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="smsisdefault" name="isdefault">
                                                <label class="custom-control-label" for="smsisdefault"></label>
                                            </div>
                                        </div>

                                        <div class="d-flex justify-content-center">
                                            <button class="btn-premium-save px-5 py-2 mt-2" type="submit" style="font-size: 14px; border-radius: 12px; box-shadow: 0 10px 20px rgba(32, 98, 35, 0.15);">
                                                <span class="material-symbols-outlined mr-2" style="font-size: 18px;">check_circle</span>
                                                Save Gateway Settings
                                            </button>
                                        </div>
                                    </form>
                                </div>
                                
                                <div class="premium-card mb-4 overflow-hidden border-0" style="background: linear-gradient(135deg, #1a4d1a 0%, #2d5a27 100%); color: white; box-shadow: 0 15px 35px rgba(26, 77, 26, 0.25);">
                                    <div class="position-relative" style="z-index: 2;">
                                        <div class="d-flex justify-content-between align-items-start mb-4">
                                            <div>
                                                <h4 class="text-uppercase tracking-widest mb-1" style="font-size: 10px; font-weight: 800; opacity: 0.7; color: rgba(255,255,255,0.8);">Account Balance</h4>
                                                <div class="d-flex align-items-end">
                                                    <h2 class="font-weight-black mb-0" style="font-size: 2.2rem; letter-spacing: -1px;">12,482</h2>
                                                    <span class="small ml-2 mb-2 font-weight-bold opacity-75">SMS UNITS</span>
                                                </div>
                                            </div>
                                            <div class="rounded-circle d-flex align-items-center justify-content-center" style="width: 44px; height: 44px; background: rgba(255,255,255,0.15); backdrop-filter: blur(4px);">
                                                <span class="material-symbols-outlined">payments</span>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-center">
                                            <button class="btn btn-white btn-sm px-4 py-2 shadow-sm" style="border-radius: 10px; color: #1a4d1a; font-size: 12px; background: white; border: none; font-weight: 500;">REPLENISH CREDITS</button>
                                        </div>
                                    </div>
                                    <span class="material-symbols-outlined position-absolute" style="font-size: 120px; bottom: -30px; right: -20px; opacity: 0.08; transform: rotate(-15deg);">potted_plant</span>
                                </div>
                            </div>

                            <div class="col-12 col-lg-8">
                                <div class="row">
                                    <div class="col-md-7">
                                        <div class="premium-card p-0 overflow-hidden d-flex flex-column mb-4" style="min-height: 400px;">
                                            <div class="px-4 py-3 bg-light border-bottom d-flex justify-content-between align-items-center">
                                                <div class="d-flex align-items-center">
                                                    <span class="material-symbols-outlined text-success mr-2" style="font-size: 20px;">terminal</span>
                                                    <h4 class="form-label-premium mb-0">API Configuration (JSON)</h4>
                                                </div>
                                                <div class="d-flex">
                                                    <button class="btn btn-link text-muted p-0 mr-3"><span class="material-symbols-outlined" style="font-size: 18px;">content_copy</span></button>
                                                    <button class="btn btn-link text-muted p-0"><span class="material-symbols-outlined" style="font-size: 18px;">refresh</span></button>
                                                </div>
                                            </div>
                                            <div class="bg-dark p-0 flex-grow-1 font-family-monospace" style="background-color: #1e1e1e !important;">
                                                <textarea id="smsjson" name="smsjson" class="form-control h-100 border-0 bg-transparent text-white p-4" style="font-family: 'Space Grotesk', monospace; font-size: 13px; resize: none;" placeholder='{ "apiKey": "...", "username": "..." }'></textarea>
                                            </div>
                                            <div class="px-4 py-3 bg-light border-top d-flex justify-content-end">
                                                <p class="small text-muted mr-auto align-self-center mb-0"><span class="material-symbols-outlined align-middle mr-1" style="font-size: 16px; color: #1a4d1a;">info</span> Provider specific keys</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-5">
                                        <div class="premium-card mb-4 shadow-sm" style="background: #f8fafc; border: 1px solid rgba(0,0,0,0.05);">
                                            <div class="d-flex align-items-center mb-4">
                                                <div class="p-2 bg-white shadow-sm text-success rounded-lg mr-3">
                                                    <span class="material-symbols-outlined">cell_tower</span>
                                                </div>
                                                <h3 class="headline h6 font-weight-bold mb-0">SMS Test</h3>
                                            </div>
                                            <p class="small text-muted mb-4">Validate your gateway by sending a test SMS.</p>
                                            
                                            <div id="testSMSErrors" class="mb-3" style="display: none;"></div>

                                            <div class="mb-3">
                                                <label class="form-label-premium">Recipient Phone</label>
                                                <input class="form-input-premium" type="text" id="testSMSRecipient" placeholder="e.g. +254700000000"/>
                                            </div>
                                            <div class="mb-4">
                                                <label class="form-label-premium">Message Body</label>
                                                <textarea class="form-input-premium" id="testSMSMessage" rows="3" placeholder="Type your test message here..."></textarea>
                                            </div>
                                            <button class="btn btn-success px-4 py-2 shadow-sm" id="btnSendTestSMS" style="border-radius: 12px; font-weight: 500; font-size: 13px; background-color: var(--primary); border-color: var(--primary);">
                                                <span class="material-symbols-outlined mr-2" style="font-size: 16px;">sms</span>
                                                Send Test SMS
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="premium-card">
                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <div class="d-flex align-items-center">
                                            <div class="p-2 bg-success-light text-success rounded-lg mr-3" style="background-color: rgba(32, 98, 35, 0.1);">
                                                <span class="material-symbols-outlined">history</span>
                                            </div>
                                            <h3 class="headline h6 font-weight-bold mb-0">Recent SMS Activity</h3>
                                        </div>
                                        <button class="btn btn-link btn-sm text-success p-0" onclick="loadRecentSMSLogs()">Refresh Activity</button>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-hover border-0">
                                            <thead>
                                                <tr class="text-uppercase tracking-widest text-muted" style="font-size: 10px; font-weight: 700;">
                                                    <th class="border-0 pl-0">Recipient</th>
                                                    <th class="border-0">Sender ID</th>
                                                    <th class="border-0">Status</th>
                                                    <th class="border-0">Reason</th>
                                                </tr>
                                            </thead>
                                            <tbody id="smsDeliveryLogs" style="font-size: 13px; font-family: 'Manrope', sans-serif;">
                                                <tr>
                                                    <td colspan="4" class="text-center py-4 text-muted">No activity recorded yet</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Tab 6: Feed Mix -->
                    <div class="settings-tab-content" id="tab-feed-mix" style="display: none;">
                        <!-- Summary Section -->
                        <div class="row mb-4">
                            <div class="col-md-3 mb-3 mb-md-0">
                                <div class="premium-card p-4 h-100 mb-0" style="border-radius: 12px; box-shadow: 0 8px 30px rgba(0,0,0,0.04); border: 1px solid rgba(191, 202, 186, 0.1);">
                                    <p class="text-uppercase font-weight-bold mb-1" style="color: var(--on-surface-variant); font-size: 10px; letter-spacing: 0.1em;">Total Formulations</p>
                                    <div class="d-flex align-items-baseline">
                                        <span class="font-weight-black" style="font-size: 2.25rem; color: var(--primary); font-family: 'Work Sans', sans-serif;">12</span>
                                        <span class="ml-2 font-weight-bold" style="color: var(--tertiary); font-size: 10px;">+2 this month</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-3 mb-md-0">
                                <div class="premium-card p-4 h-100 mb-0" style="border-radius: 12px; box-shadow: 0 8px 30px rgba(0,0,0,0.04); border: 1px solid rgba(191, 202, 186, 0.1);">
                                    <p class="text-uppercase font-weight-bold mb-1" style="color: var(--on-surface-variant); font-size: 10px; letter-spacing: 0.1em;">Active Batches</p>
                                    <div class="d-flex align-items-baseline">
                                        <span class="font-weight-black" style="font-size: 2.25rem; color: var(--secondary); font-family: 'Work Sans', sans-serif;">4</span>
                                        <span class="ml-2" style="color: var(--on-surface-variant); font-size: 10px;">Currently Mixing</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-3 mb-md-0">
                                <div class="premium-card p-4 h-100 mb-0" style="border-radius: 12px; box-shadow: 0 8px 30px rgba(0,0,0,0.04); border: 1px solid rgba(191, 202, 186, 0.1);">
                                    <p class="text-uppercase font-weight-bold mb-1" style="color: var(--on-surface-variant); font-size: 10px; letter-spacing: 0.1em;">Most Active Ingredient</p>
                                    <div class="d-flex align-items-baseline">
                                        <span class="font-weight-black" style="font-size: 1.5rem; color: var(--primary); font-family: 'Work Sans', sans-serif;">Maize Germ</span>
                                        <span class="ml-2 font-weight-bold" style="color: var(--tertiary); font-size: 10px;">45% usage</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-3 mb-md-0">
                                <div class="premium-card p-4 h-100 mb-0" style="border-radius: 12px; box-shadow: 0 8px 30px rgba(0,0,0,0.04); border: 1px solid rgba(191, 202, 186, 0.1);">
                                    <p class="text-uppercase font-weight-bold mb-1" style="color: var(--on-surface-variant); font-size: 10px; letter-spacing: 0.1em;">Stock Status</p>
                                    <div class="d-flex align-items-baseline">
                                        <span class="font-weight-black" style="font-size: 2.25rem; color: var(--tertiary); font-family: 'Work Sans', sans-serif;">85%</span>
                                        <span class="ml-2 font-weight-bold" style="color: var(--tertiary); font-size: 10px;">Optimal</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Main Data Grid -->
                        <div class="row mb-4">
                            <!-- Formulation List + Action -->
                            <div class="col-md-8 d-flex flex-column mb-4 mb-md-0">
                                <div class="premium-card p-0 overflow-hidden mb-4 border-0" style="border-radius: 12px; box-shadow: 0 8px 30px rgba(0,0,0,0.04); border: 1px solid rgba(191, 202, 186, 0.1) !important;">
                                    <div class="px-4 py-3 border-bottom d-flex justify-content-between align-items-center" style="border-color: var(--surface-container-low) !important;">
                                        <h3 class="font-weight-bold h6 mb-0">Active Formulations</h3>
                                        <span class="font-weight-medium" style="color: var(--on-surface-variant); font-size: 11px;">Updated 2h ago</span>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-hover mb-0 border-0" style="font-size: 13px;">
                                            <thead style="background-color: rgba(244, 244, 239, 0.5);">
                                                <tr>
                                                    <th class="border-0 text-uppercase font-weight-bold py-3 pl-4" style="font-size: 10px; letter-spacing: 0.1em; color: var(--on-surface-variant);">Formulation Name</th>
                                                    <th class="border-0 text-uppercase font-weight-bold py-3" style="font-size: 10px; letter-spacing: 0.1em; color: var(--on-surface-variant);">Primary Ingredient</th>
                                                    <th class="border-0 text-uppercase font-weight-bold py-3" style="font-size: 10px; letter-spacing: 0.1em; color: var(--on-surface-variant);">Base Qty (KG)</th>
                                                    <th class="border-0 text-uppercase font-weight-bold py-3" style="font-size: 10px; letter-spacing: 0.1em; color: var(--on-surface-variant);">Last Mixed</th>
                                                    <th class="border-0 text-uppercase font-weight-bold py-3 pr-4 text-center" style="font-size: 10px; letter-spacing: 0.1em; color: var(--on-surface-variant);">Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr style="background-color: rgba(172, 244, 164, 0.05); cursor: pointer;" class="border-bottom">
                                                    <td class="py-3 pl-4">
                                                        <span class="font-weight-bold d-block" style="color: var(--on-surface);">High Yield Mix A2</span>
                                                        <span style="font-size: 11px; color: var(--on-surface-variant);">Lactating Cows - Tier 1</span>
                                                    </td>
                                                    <td class="py-3 align-middle" style="color: var(--on-surface-variant);">Maize Germ</td>
                                                    <td class="py-3 align-middle font-weight-bold" style="color: var(--on-surface);">500.0</td>
                                                    <td class="py-3 align-middle" style="color: var(--on-surface-variant);">Oct 24, 2023</td>
                                                    <td class="py-3 pr-4 align-middle text-center">
                                                        <span class="badge badge-pill" style="background-color: var(--tertiary-fixed); color: var(--on-tertiary-fixed); padding: 4px 12px; font-weight: 700; font-size: 10px;">Stable</span>
                                                    </td>
                                                </tr>
                                                <tr style="cursor: pointer;" class="border-bottom">
                                                    <td class="py-3 pl-4">
                                                        <span class="font-weight-bold d-block" style="color: var(--on-surface);">Calf Starter</span>
                                                        <span style="font-size: 11px; color: var(--on-surface-variant);">Young Stock 0-3M</span>
                                                    </td>
                                                    <td class="py-3 align-middle" style="color: var(--on-surface-variant);">Soya Meal</td>
                                                    <td class="py-3 align-middle font-weight-bold" style="color: var(--on-surface);">150.0</td>
                                                    <td class="py-3 align-middle" style="color: var(--on-surface-variant);">Oct 22, 2023</td>
                                                    <td class="py-3 pr-4 align-middle text-center">
                                                        <span class="badge badge-pill" style="background-color: var(--tertiary-fixed); color: var(--on-tertiary-fixed); padding: 4px 12px; font-weight: 700; font-size: 10px;">Stable</span>
                                                    </td>
                                                </tr>
                                                <tr style="cursor: pointer;">
                                                    <td class="py-3 pl-4">
                                                        <span class="font-weight-bold d-block" style="color: var(--on-surface);">Dry Cow Ration</span>
                                                        <span style="font-size: 11px; color: var(--on-surface-variant);">Maintenance Phase</span>
                                                    </td>
                                                    <td class="py-3 align-middle" style="color: var(--on-surface-variant);">Wheat Bran</td>
                                                    <td class="py-3 align-middle font-weight-bold" style="color: var(--on-surface);">320.0</td>
                                                    <td class="py-3 align-middle" style="color: var(--on-surface-variant);">Oct 20, 2023</td>
                                                    <td class="py-3 pr-4 align-middle text-center">
                                                        <span class="badge badge-pill" style="background-color: var(--secondary-fixed); color: var(--on-secondary-fixed); padding: 4px 12px; font-weight: 700; font-size: 10px;">Restocking</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <button class="btn btn-premium-save align-self-start py-2 px-4 shadow-sm" data-toggle="modal" data-target="#addFeedMixModal" style="border-radius: 12px; display: flex; align-items: center; gap: 8px;">
                                    <span class="material-symbols-outlined" style="font-size: 20px;">add_circle</span>
                                    Create New Feed Mix
                                </button>
                            </div>

                            <!-- Breakdown & Graph -->
                            <div class="col-md-4 d-flex flex-column">
                                <!-- Ingredient Breakdown -->
                                <div class="premium-card p-4 mb-4" style="border-radius: 12px; box-shadow: 0 8px 30px rgba(0,0,0,0.04); border: 1px solid rgba(191, 202, 186, 0.1);">
                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                        <h3 class="font-weight-bold h6 mb-0">Breakdown: High Yield A2</h3>
                                        <span class="material-symbols-outlined" style="color: var(--primary);">pie_chart</span>
                                    </div>
                                    <div class="d-flex flex-column" style="gap: 16px;">
                                        <div>
                                            <div class="d-flex justify-content-between mb-1">
                                                <span class="font-weight-bold" style="font-size: 11px;">Maize Germ</span>
                                                <span class="font-weight-bold" style="font-size: 11px;">45%</span>
                                            </div>
                                            <div class="progress" style="height: 8px; background-color: var(--surface-container-low); border-radius: 10px;">
                                                <div class="progress-bar" style="width: 45%; background-color: var(--primary); border-radius: 10px;"></div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="d-flex justify-content-between mb-1">
                                                <span class="font-weight-bold" style="font-size: 11px;">Cotton Seed</span>
                                                <span class="font-weight-bold" style="font-size: 11px;">25%</span>
                                            </div>
                                            <div class="progress" style="height: 8px; background-color: var(--surface-container-low); border-radius: 10px;">
                                                <div class="progress-bar" style="width: 25%; background-color: var(--tertiary); border-radius: 10px;"></div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="d-flex justify-content-between mb-1">
                                                <span class="font-weight-bold" style="font-size: 11px;">Soya Meal</span>
                                                <span class="font-weight-bold" style="font-size: 11px;">20%</span>
                                            </div>
                                            <div class="progress" style="height: 8px; background-color: var(--surface-container-low); border-radius: 10px;">
                                                <div class="progress-bar" style="width: 20%; background-color: var(--secondary-container); border-radius: 10px;"></div>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="d-flex justify-content-between mb-1">
                                                <span class="font-weight-bold" style="font-size: 11px;">Premix/Minerals</span>
                                                <span class="font-weight-bold" style="font-size: 11px;">10%</span>
                                            </div>
                                            <div class="progress" style="height: 8px; background-color: var(--surface-container-low); border-radius: 10px;">
                                                <div class="progress-bar" style="width: 10%; background-color: var(--outline); border-radius: 10px;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Production Graph -->
                                <div class="premium-card p-4 flex-grow-1" style="border-radius: 12px; box-shadow: 0 8px 30px rgba(0,0,0,0.04); border: 1px solid rgba(191, 202, 186, 0.1);">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h3 class="font-weight-bold h6 mb-0" style="font-size: 14px;">Volume (Last 14 Days)</h3>
                                        <span class="small" style="color: var(--on-surface-variant); font-size: 11px;">Tons</span>
                                    </div>
                                    <div class="position-relative w-100 mt-2" style="height: 150px;">
                                        <div id="feedMixVolumeChart"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Footer Details/Alerts -->
                        <div class="row">
                            <div class="col-md-3 mb-3 mb-md-0">
                                <div class="d-flex align-items-center p-3" style="background-color: rgba(32, 98, 35, 0.05); border-radius: 8px; border: 1px solid rgba(32, 98, 35, 0.1);">
                                    <div class="d-flex align-items-center justify-content-center p-2 mr-3" style="background-color: var(--primary); color: white; border-radius: 8px;">
                                        <span class="material-symbols-outlined" style="font-size: 20px;">inventory</span>
                                    </div>
                                    <div>
                                        <p class="mb-0" style="font-size: 11px; color: var(--primary);">Critical Reorder</p>
                                        <p class="mb-0" style="font-size: 11px; color: var(--on-surface-variant);">Molasses stock &lt; 15%</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 mb-3 mb-md-0">
                                <div class="d-flex align-items-center p-3" style="background-color: rgba(121, 89, 0, 0.05); border-radius: 8px; border: 1px solid rgba(121, 89, 0, 0.1);">
                                    <div class="d-flex align-items-center justify-content-center p-2 mr-3" style="background-color: var(--secondary); color: white; border-radius: 8px;">
                                        <span class="material-symbols-outlined" style="font-size: 20px;">sync</span>
                                    </div>
                                    <div>
                                        <p class="mb-0" style="font-size: 11px; color: var(--secondary);">In Progress</p>
                                        <p class="mb-0" style="font-size: 11px; color: var(--on-surface-variant);">Batch #402 - 65%</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3 mb-md-0">
                                <div class="d-flex align-items-center justify-content-between p-3" style="background-color: var(--surface-container); border-radius: 8px;">
                                    <div class="d-flex align-items-center">
                                        <div class="d-flex align-items-center justify-content-center p-2 mr-3" style="background-color: var(--on-surface-variant); color: white; border-radius: 8px;">
                                            <span class="material-symbols-outlined" style="font-size: 20px;">history</span>
                                        </div>
                                        <div>
                                            <p class="mb-0" style="font-size: 11px;">Last Log Exported</p>
                                            <p class="mb-0" style="font-size: 11px; color: var(--on-surface-variant);">Oct 24, 2023 - 09:15 AM</p>
                                        </div>
                                    </div>
                                    <button class="btn btn-link p-0 font-weight-bold text-decoration-none" style="font-size: 11px; color: var(--primary);">View All History</button>
                                </div>
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
    <script src="../plugins/jquery-ui.js"></script>
    <script src="../plugins/alert.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="../js/header.js"></script>
    <script src="../js/functions.js"></script>
    <script src="../js/settings.js"></script>
    
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
            $("#incorporationdate").datepicker({
                dateFormat: 'dd-M-yy',
                maxDate: 0,
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0"
            });
            
            // Toggle Password Visibility
            $('.toggle-password').on('click', function() {
                const input = $(this).siblings('input');
                const type = input.attr('type') === 'password' ? 'text' : 'password';
                input.attr('type', type);
                $(this).find('span').text(type === 'password' ? 'visibility' : 'visibility_off');
            });

            // Modal Background Blur Logic
            $('#addBreedModal, #addPenModal').on('show.bs.modal', function () {
                $('.sidebar, .top-header, .main-content').addClass('content-blur');
            });
            
            $('#addBreedModal, #addPenModal').on('hidden.bs.modal', function () {
                $('.sidebar, .top-header, .main-content').removeClass('content-blur');
                $('.modal-alert-container').empty();
            });
        });
    </script>

    <!-- Modals Section -->
    <!-- Add New Breed Modal -->
    <div class="modal fade" id="addBreedModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content border-0 overflow-hidden" style="border-radius: 1.25rem; box-shadow: 0 24px 48px rgba(26,28,25,0.12);">
                <div class="modal-body p-0">
                    <div class="d-flex flex-column flex-md-row" style="min-height: 500px;">
                        <!-- Left Sidebar -->
                        <div class="botanical-sidebar d-none d-md-flex flex-column justify-content-between p-5 text-white" style="width: 33.33%;">
                            <div>
                                <div class="space-y-4">
                                    <h2 class="headline h3 font-weight-bold leading-tight mb-3">Preserving Excellence</h2>
                                    <p class="text-white-50 font-weight-medium leading-relaxed small">Expand your dairy's heritage by documenting new genetic lines within the ecosystem.</p>
                                </div>
                            </div>
                            <div class="d-flex align-items-center mt-5">
                                <div class="rounded-circle d-flex align-items-center justify-content-center mr-3" style="width: 48px; height: 48px; background-color: rgba(255,255,255,0.2); backdrop-filter: blur(8px);">
                                    <span class="material-symbols-outlined text-white">psychiatry</span>
                                </div>
                                <span class="text-uppercase tracking-widest small font-weight-medium opacity-80" style="font-size: 10px;">Heritage Management</span>
                            </div>
                        </div>

                        <!-- Right Area -->
                        <div class="flex-grow-1 bg-white p-5 position-relative">
                            <button type="button" class="close position-absolute" data-dismiss="modal" style="top: 20px; right: 20px; z-index: 10;">
                                <span class="material-symbols-outlined">close</span>
                            </button>
                            
                            <div class="mb-4">
                                <h3 class="headline h5 font-weight-bold text-success tracking-tight mb-1">Add New Breed</h3>
                                <p class="text-muted font-weight-medium small">Fill in the technical profile for the new livestock breed.</p>
                            </div>
                            
                            <div class="modal-alert-container mb-3" id="breed-modal-alert"></div>

                            <form id="addBreedForm" class="mt-4">
                                <div class="form-group mb-4">
                                    <label class="form-label-premium">Breed Name</label>
                                    <input type="text" class="form-control form-input-premium" id="breedname" placeholder="e.g. Holstein Friesian">
                                </div>
                                
                                <div class="form-group mb-4">
                                    <label class="form-label-premium">Origin</label>
                                    <div class="position-relative">
                                        <select class="form-control form-input-premium custom-select-premium" id="breedOrigin" style="padding-left: 3rem; padding-top: 1.2rem; padding-bottom: 1.2rem; height: auto; -webkit-appearance: none; appearance: none;">
                                            <option value="" selected disabled>Select Country</option>
                                            <option value="Kenya">Kenya</option>
                                            <option value="Netherlands">Netherlands</option>
                                            <option value="UK">United Kingdom</option>
                                            <option value="Switzerland">Switzerland</option>
                                            <option value="USA">United States</option>
                                            <option value="South Africa">South Africa</option>
                                            <option value="Other">Other Region</option>
                                        </select>
                                        <span class="material-symbols-outlined position-absolute text-muted" style="right: 15px; top: 50%; transform: translateY(-50%); font-size: 18px; pointer-events: none;">expand_more</span>
                                        <span class="material-symbols-outlined position-absolute text-success opacity-50" style="left: 15px; top: 50%; transform: translateY(-50%); font-size: 18px;">public</span>
                                    </div>
                                </div>
                                <div class="form-group mb-4">
                                    <label class="form-label-premium">Primary Characteristics</label>
                                    <textarea class="form-control form-input-premium" id="characteristics" placeholder="Detail high milk yield, heat resistance..." rows="3" style="resize: none;"></textarea>
                                </div>

                                <div class="form-group mb-4">
                                    <label class="form-label-premium">Breed Identity Icon</label>
                                    <div class="position-relative">
                                        <select class="form-control form-input-premium pl-5" id="breedIcon" style="height: 55px; appearance: none; -webkit-appearance: none; -moz-appearance: none;">
                                            <option value="stars">Stars (Premium)</option>
                                            <option value="bolt">Bolt (Active)</option>
                                            <option value="water_drop">Water Drop (Purity)</option>
                                            <option value="park">Park (Natural)</option>
                                            <option value="pets">Pets (Animal)</option>
                                            <option value="eco">Eco (Organic)</option>
                                            <option value="grass">Grass (Pasture)</option>
                                            <option value="local_florist">Florist (Botanic)</option>
                                            <option value="speed">Speed (Fast Growth)</option>
                                            <option value="monitoring">Monitoring (Productive)</option>
                                        </select>
                                        <span class="material-symbols-outlined position-absolute text-muted" style="right: 15px; top: 50%; transform: translateY(-50%); font-size: 18px; pointer-events: none;">expand_more</span>
                                        <span id="iconPreview" class="material-symbols-outlined position-absolute text-success opacity-50" style="left: 15px; top: 50%; transform: translateY(-50%); font-size: 18px;">stars</span>
                                    </div>
                                </div>

                                <div class="form-group mb-4">
                                    <label class="form-label-premium">Average Milking (Ltrs)</label>
                                    <div class="position-relative">
                                        <input type="number" step="0.01" class="form-control form-input-premium" id="avgmilking" placeholder="e.g. 25.50" style="padding-right: 4rem;">
                                        <span class="position-absolute text-muted font-weight-medium" style="right: 15px; top: 50%; transform: translateY(-50%); font-size: 10px;">LTRS</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center justify-content-between p-3 rounded-lg mb-4" style="background-color: rgba(32, 98, 35, 0.05);">
                                    <div class="d-flex align-items-center">
                                        <span class="material-symbols-outlined text-success mr-3">nature_people</span>
                                        <div>
                                            <p class="headline font-weight-bold mb-0" style="font-size: 14px;">Is Indigenous?</p>
                                            <p class="text-muted small mb-0">Mark if this breed is native to this region.</p>
                                        </div>
                                    </div>
                                    <div class="custom-control custom-switch">
                                        <input type="checkbox" class="custom-control-input" id="isIndigenous">
                                        <label class="custom-control-label" for="isIndigenous"></label>
                                    </div>
                                </div>

                                <div class="d-flex mt-5 pt-3">
                                    <button type="button" id="saveBreedBtn" class="btn flex-grow-1 py-2 text-white font-weight-medium shadow-sm" style="background: linear-gradient(to right, #206223, #3a7b3a); border-radius: 0.5rem; font-size: 14px;">Save Breed</button>
                                    <button type="button" class="btn py-2 px-5 ml-3" data-dismiss="modal" style="background-color: transparent; border: 1px solid rgba(0,0,0,0.1); color: #475569; border-radius: 0.5rem; font-size: 14px; font-weight: 500;">Cancel</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add New Pen Modal -->
    <div class="modal fade" id="addPenModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content border-0 overflow-hidden" style="border-radius: 1.25rem; box-shadow: 0 24px 48px rgba(26,28,25,0.12);">
                <div class="modal-body p-0">
                    <div class="d-flex flex-column flex-md-row" style="min-height: 500px;">
                        <!-- Left Sidebar -->
                        <div class="botanical-sidebar d-none d-md-flex flex-column justify-content-between p-5 text-white" style="width: 33.33%;">
                            <div>
                                <div class="space-y-4">
                                    <h2 class="headline h4 font-weight-bold leading-tight mb-3">Grow Your Herd Efficiency</h2>
                                    <p class="text-white-50 font-weight-medium leading-relaxed small">Define specialized environments that promote livestock health and maximize yield quality.</p>
                                </div>
                            </div>
                            <div class="d-flex align-items-center mt-5">
                                <div class="rounded-circle d-flex align-items-center justify-content-center mr-3 flex-shrink-0" style="width: 48px; height: 48px; background-color: rgba(255,255,255,0.2); backdrop-filter: blur(8px);">
                                    <span class="material-symbols-outlined text-white">potted_plant</span>
                                </div>
                                <span class="text-uppercase tracking-widest small font-weight-medium opacity-80" style="font-size: 10px;">Facility Management</span>
                            </div>
                        </div>

                        <!-- Right Area -->
                        <div class="flex-grow-1 bg-white p-5 position-relative">
                            <button type="button" class="close position-absolute" data-dismiss="modal" style="top: 20px; right: 20px; z-index: 10;">
                                <span class="material-symbols-outlined">close</span>
                            </button>
                            
                            <div class="mb-4">
                                <h3 class="headline h5 font-weight-bold text-success tracking-tight mb-1">Add New Pen</h3>
                                <p class="text-muted font-weight-medium small">Enter the specifications for the new facility housing unit.</p>
                            </div>

                            <div class="modal-alert-container mb-3" id="pen-modal-alert"></div>

                            <form id="addPenForm" class="mt-4">
                                <input type="hidden" id="penId" value="0">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group mb-4">
                                            <label class="form-label-premium">Pen Name</label>
                                            <input type="text" id="penName" class="form-control form-input-premium" placeholder="e.g. North Pasture Wing B" style="padding-top: 1.2rem; padding-bottom: 1.2rem; height: auto;">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group mb-4">
                                            <label class="form-label-premium">Pen Type</label>
                                            <div class="position-relative">
                                                <select class="form-control form-input-premium custom-select-premium" id="penType" style="padding-left: 3rem; padding-top: 1.2rem; padding-bottom: 1.2rem; height: auto; -webkit-appearance: none; appearance: none;">
                                                    <option value="" selected disabled>Select Type</option>
                                                    <option value="Maternity">Maternity</option>
                                                    <option value="Heifer">Heifer</option>
                                                    <option value="Dry Cow">Dry Cow</option>
                                                    <option value="Isolation">Isolation</option>
                                                </select>
                                                <span class="material-symbols-outlined position-absolute text-muted" style="right: 15px; top: 50%; transform: translateY(-50%); font-size: 18px; pointer-events: none;">expand_more</span>
                                                <span class="material-symbols-outlined position-absolute text-success opacity-50" style="left: 15px; top: 50%; transform: translateY(-50%); font-size: 18px;">fence</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group mb-4">
                                            <label class="form-label-premium">Total Capacity</label>
                                            <div class="position-relative">
                                                <input type="number" id="penCapacity" class="form-control form-input-premium" placeholder="50" style="padding-right: 4rem; padding-top: 1.2rem; padding-bottom: 1.2rem; height: auto;">
                                                <span class="position-absolute text-muted font-weight-medium" style="right: 15px; top: 50%; transform: translateY(-50%); font-size: 10px;">COWS</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group mb-4">
                                            <label class="form-label-premium">Location/Cluster</label>
                                            <input type="text" id="penLocation" class="form-control form-input-premium" placeholder="e.g. Sector 4 - Central Hub" style="padding-top: 1.2rem; padding-bottom: 1.2rem; height: auto;">
                                        </div>
                                    </div>
                                </div>

                                <div class="d-flex mt-5 pt-3">
                                    <button type="button" id="savePenBtn" class="btn flex-grow-1 py-2 text-white font-weight-medium shadow-sm" style="background: linear-gradient(to right, #206223, #3a7b3a); border-radius: 0.5rem; font-size: 14px;">Save Pen</button>
                                    <button type="button" class="btn py-2 px-5 ml-3" data-dismiss="modal" style="background-color: transparent; border: 1px solid rgba(0,0,0,0.1); color: #475569; border-radius: 0.5rem; font-size: 14px; font-weight: 500;">Cancel</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Feed Mix Modal -->
    <div class="modal fade" id="addFeedMixModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="addFeedMixModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-centered" style="max-width: 900px;">
            <div class="modal-content overflow-hidden" style="border-radius: 1.25rem; border: none; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);">
                <div class="row no-gutters" style="min-height: 500px;">
                    <!-- Left Sidebar -->
                    <div class="col-md-4 d-none d-md-block position-relative">
                        <img class="position-absolute h-100 w-100" style="object-fit: cover; opacity: 0.9;" src="https://lh3.googleusercontent.com/aida-public/AB6AXuB79zv_NM8CfXn0V3qVTOwdnjhp6GnA5V4pCiqHeko1VX8QW8bu7VT0oTkcjasAGk93GjyzeSsfH8UoNKbfiL0fu9hEV_PVheT8A-4qddNxY45NcmJ18gsGNPwBbAmEVJ09UPl8_s8TD-ke7RYik3UqNRxQNimiaxAr7v0GegyVMPlppl-eG16A1GREycPdWRzkThrGAgk3Fbuc4y3oesMsKA2YV5JRylj6SllPsPzkqLUWz7046U1sKlrGk0cxIw00yh8lgQz9-B_l"/>
                        <div class="position-absolute w-100 h-100" style="background: linear-gradient(to top, rgba(32, 98, 35, 0.9), transparent);"></div>
                        <div class="position-absolute" style="bottom: 2rem; left: 2rem; right: 2rem;">
                            <h2 class="text-white font-weight-bold mb-1" style="font-size: 1.25rem; line-height: 1.2; font-family: 'Manrope', sans-serif;">Formulating the Future</h2>
                            <p class="text-white small font-weight-medium mb-0" style="opacity: 0.8; font-size: 0.75rem;">Precision nutrition for a healthy herd.</p>
                        </div>
                    </div>
                    <!-- Right Side -->
                    <div class="col-md-8 d-flex flex-column bg-white position-relative">
                        <!-- Close Button Top Right -->
                        <button type="button" class="close position-absolute" data-dismiss="modal" aria-label="Close" style="color: var(--outline); padding: 0; margin: 0; top: 1.25rem; right: 1.25rem; z-index: 10; opacity: 0.7;">
                            <span class="material-symbols-outlined" style="font-size: 1.25rem;">close</span>
                        </button>
                        
                        <!-- Modal Header -->
                        <div class="px-4 pt-4 pb-3">
                            <div class="d-flex justify-content-between align-items-start">
                                <div>
                                    <span class="d-block mb-1 font-weight-bold text-uppercase" style="font-size: 0.7rem; letter-spacing: 0.15em; color: var(--secondary);">Production Lab</span>
                                    <h3 class="font-weight-bold mb-0" style="font-size: 1.25rem; color: var(--primary); font-family: 'Manrope', sans-serif;">Mix New Feed</h3>
                                </div>
                            </div>
                        </div>
                        <!-- Form Content -->
                        <div class="px-4 flex-grow-1 overflow-auto pb-4">
                            <div id="feedmix-modal-alert" style="display: none;" class="mb-3"></div>
                            <form id="addFeedMixForm">
                                <div class="row mb-4">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label class="font-weight-bold small d-block mb-2" style="color: var(--on-surface-variant); letter-spacing: 0.05em;">Feed name</label>
                                        <input type="text" class="form-control" id="feedName" placeholder="e.g. High Yield Winter Mix" style="background-color: var(--surface-container-low); border: none; border-radius: 0.5rem; padding: 0.75rem 1rem; font-weight: 500; font-size: 0.875rem; height: auto;">
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="font-weight-bold small d-block mb-2" style="color: var(--on-surface-variant); letter-spacing: 0.05em;">Feed code</label>
                                        <div class="position-relative">
                                            <input type="text" class="form-control w-100" id="feedCode" placeholder="JUK-2024-W1" style="background-color: var(--surface-container-low); border: none; border-radius: 0.5rem; padding: 0.75rem 6rem 0.75rem 1rem; font-weight: 500; font-size: 0.875rem; height: auto;">
                                            <button type="button" id="autoFeedCodeBtn" class="btn d-flex align-items-center justify-content-center position-absolute" style="background-color: #e3e3de; color: #40493d; right: 6px; top: 50%; transform: translateY(-50%); border-radius: 0.35rem; padding: 0.35rem 0.75rem; flex-shrink: 0; height: auto; transition: all 0.2s;">
                                                <span class="material-symbols-outlined mr-1" style="font-size: 14px;">auto_awesome</span>
                                                <span class="text-uppercase" style="font-size: 10px; font-weight: 500; letter-spacing: 0.05em;">Auto</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Components Section -->
                                <div class="mb-3">
                                    <div class="d-flex align-items-center justify-content-between mb-3">
                                        <h4 class="font-weight-bold text-uppercase mb-0" style="font-size: 0.75rem; letter-spacing: 0.15em; color: var(--outline);">Components in Formulation</h4>
                                        <span class="small font-weight-medium" style="color: var(--outline-variant);">Total: <span id="feedMixTotalWeight" class="font-weight-bold" style="color: var(--on-surface);">0.00 KG</span></span>
                                    </div>
                                    
                                    <!-- Dynamic Component Rows -->
                                    <div id="feedComponentsContainer">
                                        <div class="row align-items-center mb-3 feed-component-row">
                                            <div class="col-7 pr-2">
                                                <div class="position-relative">
                                                    <select class="form-control w-100 feed-component-select" style="appearance: none; background-color: var(--surface-container-low); border: none; border-radius: 0.5rem; padding: 0.75rem 2.5rem 0.75rem 1rem; font-weight: 500; color: var(--on-surface); font-size: 0.875rem; height: auto;">
                                                        <option value="" disabled selected>Select Ingredient</option>
                                                    </select>
                                                    <span class="material-symbols-outlined position-absolute" style="right: 12px; top: 50%; transform: translateY(-50%); color: var(--outline); pointer-events: none;">expand_more</span>
                                                </div>
                                            </div>
                                            <div class="col-4 px-2">
                                                <div class="position-relative">
                                                    <input type="number" class="form-control w-100 feed-component-qty" placeholder="0" style="background-color: var(--surface-container-low); border: none; border-radius: 0.5rem; padding: 0.75rem 2.5rem 0.75rem 1rem; font-weight: 500; color: var(--on-surface); font-size: 0.875rem; height: auto;">
                                                    <span class="position-absolute font-weight-bold small" style="right: 16px; top: 50%; transform: translateY(-50%); color: var(--outline);">KG</span>
                                                </div>
                                            </div>
                                            <div class="col-1 pl-2 text-center">
                                                <button type="button" class="btn btn-link p-0 text-danger remove-component-btn" style="opacity: 0.4;">
                                                    <span class="material-symbols-outlined">delete_outline</span>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="pt-2">
                                        <button type="button" id="addFeedComponentBtn" class="btn btn-link p-0 d-flex align-items-center font-weight-bold" style="color: var(--primary); font-size: 0.875rem; text-decoration: none; gap: 8px; box-shadow: none; outline: none;">
                                            <span class="material-symbols-outlined" style="font-size: 1.125rem;">add_circle</span>
                                            Add Another Component
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- Footer Actions -->
                        <div class="px-4 py-3 d-flex align-items-center justify-content-end border-top" style="background-color: rgba(244, 244, 239, 0.5); border-color: rgba(191, 202, 186, 0.2) !important;">
                            <button type="button" class="btn btn-link text-muted font-weight-medium p-0 mr-3" data-dismiss="modal" style="font-size: 0.875rem; text-decoration: none; border: 1px solid var(--outline-variant); border-radius: 0.5rem; padding: 0.5rem 1.5rem !important;">Cancel</button>
                            <button type="button" class="btn btn-primary shadow-sm" style="border-radius: 0.5rem; padding: 0.5rem 1.5rem; background: linear-gradient(to right, var(--primary), var(--primary-container)); border: none; font-size: 0.875rem; font-weight: 500;">Save Formulation</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
