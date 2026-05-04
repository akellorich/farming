<?php
/**
 * Dairy Management System - Animals Overview
 * File: views/animals.php
 */
$base_path = '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Animals Overview | Jukam Farm</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/all.css"> <!-- FontAwesome -->
    <link rel="stylesheet" href="../css/style.css"> <!-- Global Styles -->
    <link rel="stylesheet" href="../css/dashboard.css"> <!-- Dashboard Base -->
    <link rel="stylesheet" href="../css/header.css"> <!-- Header Module -->
    <link rel="stylesheet" href="../css/navigation.css"> <!-- Sidebar Module -->
    <link rel="stylesheet" href="../css/animals.css"> <!-- Animals Overview Page Module -->
    <link rel="stylesheet" href="../css/alert.css"> <!-- Alerts -->

    <!-- jQuery UI CSS -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

    <!-- DataTables via CDN -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.3.3/css/buttons.bootstrap4.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.4.0/css/responsive.bootstrap4.min.css"/>
    
    <style>
        .yield-container { white-space: nowrap; }
        .dataTables_filter { display: none; } 
        .dt-buttons { margin-left: 1rem; }
        .ui-datepicker { z-index: 1100 !important; } /* Ensure datepicker is above modal */
        
        /* Ensure table adapts in wrapper */
        table.dataTable.dtr-inline.collapsed > tbody > tr > td.dtr-control::before {
            background-color: var(--primary);
        }
    </style>
</head>
<body class="bg-background">

    <!-- Modular Sidebar -->
    <?php include 'navigation.php'; ?>

    <!-- Modular Header -->
    <?php include 'header.php'; ?>
    <style>
        #alert-container { top: 100px !important; } /* Move down to clear the Add Animal button */
    </style>

    <!-- Modular Modals (Lock/Password) -->
    <?php include 'modals.php'; ?>

    <!-- Main Content Area -->
    <main class="main-content">
        <div class="container-fluid pt-1 px-2">
            <!-- Header Section -->
            <div class="row align-items-center mb-3">
                <div class="col-7">
                    <span class="stats-label text-muted mb-1 d-block font-headline" style="letter-spacing: 0.15rem; font-size: 0.6rem;">Management Dashboard</span>
                    <h2 class="font-headline font-weight-bold text-on-surface" style="font-size: 1.5rem;">Animals Overview</h2>
                </div>
                <div class="col-5 d-flex justify-content-end">
                    <button class="btn btn-add-animal botanical-shadow" id="addAnimalBtn">
                        <span class="material-symbols-outlined">add</span>
                        <span class="d-none d-sm-inline">Add New Animal</span>
                    </button>
                </div>
            </div>

            <!-- Bento Stats -->
            <div class="animals-bento-grid">
                <div class="stats-bento-card botanical-shadow">
                    <div class="d-flex justify-content-between align-items-start">
                        <span class="stats-label font-headline" style="font-weight: 700; font-size: 0.6rem;">Total Herd</span>
                        <div class="stats-icon-box" style="background-color: rgba(172, 244, 164, 0.3); color: var(--primary);">
                            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">groups</span>
                        </div>
                    </div>
                    <div class="d-flex align-items-baseline">
                        <span class="stats-value font-headline" id="total_herd_val" style="font-size: 1.5rem;">0</span>
                        <span class="ml-2 font-headline" id="total_herd_change" style="font-size: 10px; color: var(--primary); font-weight: 700;">+0 this month</span>
                    </div>
                </div>
                <div class="stats-bento-card botanical-shadow">
                    <div class="d-flex justify-content-between align-items-start">
                        <span class="stats-label font-headline" style="font-weight: 700; font-size: 0.6rem;">Lactating</span>
                        <div class="stats-icon-box" style="background-color: rgba(171, 244, 172, 0.3); color: var(--tertiary);">
                            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">water_drop</span>
                        </div>
                    </div>
                    <div class="d-flex align-items-baseline">
                        <span class="stats-value font-headline" id="lactating_val" style="font-size: 1.5rem;">0</span>
                        <span class="ml-2 text-muted font-headline" id="lactating_perc" style="font-size: 10px; font-weight: 600;">0% of herd</span>
                    </div>
                </div>
                <div class="stats-bento-card botanical-shadow">
                    <div class="d-flex justify-content-between align-items-start">
                        <span class="stats-label font-headline" style="font-weight: 700; font-size: 0.6rem;">Pregnant</span>
                        <div class="stats-icon-box" style="background-color: rgba(172, 244, 164, 0.2); color: var(--primary);">
                            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">pets</span>
                        </div>
                    </div>
                    <div class="d-flex align-items-baseline">
                        <span class="stats-value font-headline" id="pregnant_val" style="font-size: 1.5rem;">0</span>
                        <span class="ml-2 text-muted font-headline" id="pregnant_sub" style="font-size: 10px; font-weight: 600;">Active monitoring</span>
                    </div>
                </div>
                <div class="stats-bento-card botanical-shadow">
                    <div class="d-flex justify-content-between align-items-start">
                        <span class="stats-label font-headline" style="font-weight: 700; font-size: 0.6rem;">Dry Cows</span>
                        <div class="stats-icon-box" style="background-color: rgba(255, 223, 160, 0.3); color: var(--secondary);">
                            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">cloud_off</span>
                        </div>
                    </div>
                    <div class="d-flex align-items-baseline">
                        <span class="stats-value font-headline" id="dry_val" style="font-size: 1.5rem;">0</span>
                        <span class="ml-2 font-headline" id="dry_sub" style="font-size: 10px; color: var(--secondary); font-weight: 700;">Maintenance phase</span>
                    </div>
                </div>
                <div class="stats-bento-card botanical-shadow">
                    <div class="d-flex justify-content-between align-items-start">
                        <span class="stats-label font-headline" style="font-weight: 700; font-size: 0.6rem;">Calves/Heifers</span>
                        <div class="stats-icon-box" style="background-color: var(--surface-container-low); color: #64748b;">
                            <span class="material-symbols-outlined" style="font-variation-settings: 'FILL' 1;">child_care</span>
                        </div>
                    </div>
                    <div class="d-flex align-items-baseline">
                        <span class="stats-value font-headline" id="calves_val" style="font-size: 1.5rem;">0</span>
                        <span class="ml-2 text-muted font-headline" style="font-size: 10px; font-weight: 600;">Young stock</span>
                    </div>
                </div>
            </div>

            <!-- Table Card -->
            <div class="animals-table-card botanical-shadow mb-4">
                <div class="table-controls bg-white border-0 py-2 px-3">
                    <div class="d-flex align-items-center flex-wrap gap-2">
                        <select class="form-control form-control-sm border-0 bg-light" id="breedFilter" style="width: 150px; height: 32px; font-size: 0.85rem; border-radius: 0.5rem; padding-left: 10px;">
                            <option value="">All Breeds</option>
                            <option value="Holstein">Holstein</option>
                            <option value="Jersey">Jersey</option>
                            <option value="Ayrshire">Ayrshire</option>
                            <option value="Guernsey">Guernsey</option>
                        </select>
                        <select class="form-control form-control-sm border-0 bg-light ml-2" id="statusFilter" style="width: 150px; height: 32px; font-size: 0.85rem; border-radius: 0.5rem; padding-left: 10px;">
                            <option value="">All Status</option>
                            <option value="Lactating">Lactating</option>
                            <option value="Dry">Dry</option>
                            <option value="Pregnant">Pregnant</option>
                        </select>
                        <div class="ml-auto d-flex align-items-center justify-content-end flex-grow-1">
                            <div id="exportButtonsContainer"></div>
                            <input type="text" class="form-control form-control-sm ml-3" id="customSearch" placeholder="Search ID or Name..." style="width: 220px; height: 32px; border-radius: 2rem; font-size: 0.85rem;">
                        </div>
                    </div>
                </div>

                <div class="animals-data-table-wrapper px-3">
                    <table class="animals-data-table table-responsive-nowrap" id="animalsDataTable" width="100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Breed</th>
                                <th>Status</th>
                                <th>Yield</th>
                                <th class="text-right no-sort">Actions</th>
                            </tr>
                        </thead>
                        <tbody id="animalsTableBody">
                            <!-- Data loaded via AJAX -->
                        </tbody>
                    </table>
                </div>

                <div class="pagination-container py-3" id="customPagination">
                    <span class="text-muted small font-weight-medium" style="font-size: 0.7rem;" id="pageInfo">Page 1 of 1</span>
                    <div class="d-flex align-items-center" id="pageBtnGroup">
                        <button class="page-btn boundary-btn mr-3" id="prevPage"><span class="material-symbols-outlined">chevron_left</span></button>
                        <div id="numberButtons" class="d-flex"></div>
                        <button class="page-btn boundary-btn ml-3" id="nextPage"><span class="material-symbols-outlined">chevron_right</span></button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- ADD NEW ANIMAL MODAL OVERLAY -->
    <div class="animal-modal-overlay" id="addAnimalModal">
        <div class="modal-backdrop-blur"></div>
        <div class="animal-modal-container">
            <!-- Left Branding Column -->
            <div class="modal-branding-column">
                <div class="modal-branding-bg">
                    <img data-alt="lush rolling green hills of a dairy farm at sunrise" src="https://lh3.googleusercontent.com/aida-public/AB6AXuBBxiKwzccGTHkxacjYv-k2FSEQbSEBbA3lNK1ZYkKevXkj1otVjFQShcXYX2kUroUoJn87O7uTHYEaIFWlwOGp6AnGdg1A8mPhAm2a2C_zHJuuaHluQthWjnyU5cYucEh6YOVpocDsKmvskn6pKMPpEdE3XisiH_u_JwSXOx4frwUD-j5-cmVqCL-vnoGBsHSvHz8JlDxW3ce59mSdQlSfjRfTw4MCjdMZKZcuAOoFFkJCDLEkpMOo5zHseTj9_hUN43eN3P1kpZH_"/>
                    <div class="modal-branding-gradient"></div>
                </div>
                <div class="modal-branding-content">
                    <div class="modal-branding-icon-box">
                        <span class="material-symbols-outlined text-white" style="font-variation-settings: 'FILL' 1; font-size: 2rem;">add_circle</span>
                    </div>
                    <h2 class="font-headline font-weight-bold mb-2" style="font-size: 1.75rem;">Add New Animal</h2>
                    <p class="font-body text-white-50 small">Official Herd Registration for Management Tracking.</p>
                </div>
            </div>

            <!-- Right Form Column -->
            <div class="modal-form-column">
                <div class="mobile-modal-header d-md-none px-4 pt-4 pb-2">
                    <h2 class="font-headline font-weight-semibold mb-0" style="font-size: 1.1rem; color: #374151;">Animal Details</h2>
                </div>
                <div class="modal-desktop-header d-none d-md-block px-4 pt-4 pb-3">
                    <h2 class="font-headline font-weight-bold mb-0" style="font-size: 1.25rem; color: #1a1c19;">Animal Details</h2>
                </div>
                <button class="modal-close-btn" id="closeModal">
                    <span class="material-symbols-outlined">close</span>
                </button>
                
                <div class="modal-form-scroll" style="padding-top: 1.5rem;">
                    <!-- Notifications Section -->
                    <div id="animalNotifications" class="mb-2"></div>

                    <div class="form-section modal-first-section mb-3" style="margin-top: 0.5rem;">
                        <label class="modal-section-label">Registration Source</label>
                        <div class="reg-type-grid">
                            <label class="reg-type-option">
                                <input type="radio" name="reg_source" value="farm" checked style="display:none;">
                                <div class="reg-type-card">Born on Farm</div>
                            </label>
                            <label class="reg-type-option">
                                <input type="radio" name="reg_source" value="purchase" style="display:none;">
                                <div class="reg-type-card">External Purchase</div>
                            </label>
                        </div>
                    </div>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label class="modal-section-label">Breed Type</label>
                            <select class="form-control-custom" id="animal_breed">
                                <option value="">Select breed...</option>
                                <option>Holstein Friesian</option>
                                <option>Jersey</option>
                                <option>Guernsey</option>
                                <option>Ayrshire</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="modal-section-label">Animal Code</label>
                            <div class="position-relative">
                                <input type="text" class="form-control-custom" id="animal_code" placeholder="Auto-generated" disabled style="padding-right: 45px;">
                                <button class="btn-toggle-auto-inside active" type="button" id="toggle_auto_gen" title="Toggle Auto-generate">
                                    <span class="material-symbols-outlined">auto_awesome</span>
                                </button>
                            </div>
                            <input type="hidden" id="auto_generate_tag" value="1">
                        </div>
                    </div>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label class="modal-section-label">Pen</label>
                            <select class="form-control-custom" id="animal_pen">
                                <option value="">Select pen...</option>
                                <option>Pen 01 (Lactating)</option>
                                <option>Pen 02 (High Yielders)</option>
                                <option>Pen 03 (Dry/Pregnant)</option>
                                <option>Pen 04 (Calves/Heifers)</option>
                                <option>Quarantine Area</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="modal-section-label">Production Status</label>
                            <select class="form-control-custom" id="animal_status">
                                <option value="">Select status...</option>
                                <option value="Active">Active</option>
                                <option value="Lactating">Lactating</option>
                                <option value="Dry">Dry</option>
                                <option value="Pregnant">Pregnant</option>
                                <option value="Sick">Sick</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label class="modal-section-label">Designated Name</label>
                            <input type="text" class="form-control-custom" id="animal_name" placeholder="e.g., Daisy">
                        </div>
                        <div class="form-group">
                            <label class="modal-section-label">Mother</label>
                            <select class="form-control-custom" id="animal_mother">
                                <option value="">&lt;None&gt;</option>
                                <option>JK-2021-042 (Bella)</option>
                                <option>JK-2022-015 (Luna)</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label class="modal-section-label">Birth Date</label>
                            <input type="text" class="form-control-custom" id="birthDatePicker" placeholder="Select Date">
                        </div>
                        <div class="form-group">
                            <label class="modal-section-label">Initial Weight (KG)</label>
                            <input type="number" step="0.1" class="form-control-custom" id="animal_weight" placeholder="0.0">
                        </div>

                      

                        <!-- <div class="row no-gutters">
                            <div class="col-6 pr-2">
                                
                            </div>
                            <div class="col-6 pl-2">
                                
                            </div>
                        </div> -->
                    </div>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label class="modal-section-label">Purchase Price</label>
                            <input type="number" step="0.01" class="form-control-custom" id="animal_price" placeholder="0.00">
                        </div>
                        <div class="form-group">
                            <label class="modal-section-label">Registration Source</label>
                            <select class="form-control-custom" id="animal_source">
                                <option value="Born on Farm">Born on Farm</option>
                                <option value="Purchased">Purchased</option>
                                <!-- <option value="Donation">Donation</option>
                                <option value="Other">Other</option> -->
                            </select>
                        </div>
                    </div>
                </div>

                <!-- Footer -->
                <div class="modal-footer-actions">
                    <button class="btn-discard" id="discardModal">Discard</button>
                    <button class="btn-register" id="submitModal">Register Animal</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="../plugins/jquery-3.6.1.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script> <!-- jQuery UI -->
    <script src="../plugins/popper.js"></script>
    <script src="../plugins/bootstrap.js"></script>
    <script src="../js/navigation.js"></script>
    <script src="../js/header.js"></script>
    <script src="../js/auth.js"></script>
    <script src="../plugins/alert.js"></script>
    <script src="../js/functions.js"></script>

    <!-- DataTables Core & Extensions -->
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.3/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.3/js/buttons.bootstrap4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.3/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.3/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.4.0/js/responsive.bootstrap4.min.js"></script>

    <script>
    function toggleActionMenu(event, btn) {
        event.stopPropagation();
        const dropdown = $(btn).next('.actions-dropdown');
        $('.actions-dropdown').not(dropdown).removeClass('show');
        dropdown.toggleClass('show');
    }

    function triggerAction(type, id) {
        $('.actions-dropdown').removeClass('show');
        showAlert('info', 'Action ['+type+'] triggered for ' + id);
    }

    $(document).ready(function() {
        // Modal Element Caching
        const breedSelect = $('#animal_breed');
        const penSelect = $('#animal_pen');
        const motherSelect = $('#animal_mother');
        const codeField = $('#animal_code');
        const statusSelect = $('#animal_status');
        const nameField = $('#animal_name');
        const birthDateField = $('#birthDatePicker');
        const weightField = $('#animal_weight');
        const priceField = $('#animal_price');
        const sourceSelect = $('#animal_source');
        const autoGenToggle = $('#auto_generate_tag');

        // Populate Select Fields
        getbreedsselect(breedSelect);
        getpensselect(penSelect);
        getanimals(motherSelect);

        function updatePagination(table) {
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

        // Load Animals Data
        function loadAnimals() {
            $.get('../controllers/animaloperations.php', { action: 'getanimals' }, (data) => {
                const animals = JSON.parse(data);
                
                // Update Summary Stats
                const total = animals.length;
                const lactating = animals.filter(a => a.status.toLowerCase() === 'lactating').length;
                const pregnant = animals.filter(a => a.status.toLowerCase() === 'pregnant').length;
                const dry = animals.filter(a => a.status.toLowerCase() === 'dry').length;
                const calves = animals.filter(a => a.status.toLowerCase() === 'active').length;

                $('#total_herd_val').text(total);
                $('#lactating_val').text(lactating);
                $('#lactating_perc').text(total > 0 ? Math.round((lactating/total)*100) + '% of herd' : '0% of herd');
                $('#pregnant_val').text(pregnant);
                $('#dry_val').text(dry);
                $('#calves_val').text(calves);

                let rows = '';
                animals.forEach(animal => {
                    const statusClass = 'status-' + animal.status.toLowerCase();
                    const dbYield = parseFloat(animal.yield) || 0;
                    let yieldValue = 'N/A';
                    let yieldBars = '';

                    if (dbYield > 0) {
                        yieldValue = dbYield.toFixed(1) + ' L';
                        const heights = [40, 60, 80, 100]; 
                        const classes = ['off', 'off', 'mid', 'high']; // Mockup pattern for JK-001
                        yieldBars = '<div class="yield-bars">';
                        heights.forEach((h, i) => { yieldBars += `<div class="yield-bar ${classes[i]}" style="height: ${h}%;"></div>`; });
                        yieldBars += '</div>';
                    } else if (animal.status.toLowerCase() === 'lactating') {
                        // Fallback to initial graph values if 0 as requested
                        yieldValue = '32.4 L';
                        const heights = [40, 60, 80, 100]; 
                        const classes = ['off', 'off', 'mid', 'high']; 
                        yieldBars = '<div class="yield-bars">';
                        heights.forEach((h, i) => { yieldBars += `<div class="yield-bar ${classes[i]}" style="height: ${h}%;"></div>`; });
                        yieldBars += '</div>';
                    }

                    rows += `
                        <tr>
                            <td><span class="font-headline" style="color: var(--primary); font-weight: 700;">${animal.tagid}</span></td>
                            <td><span class="font-weight-medium">${animal.designatedname}</span></td>
                            <td class="text-muted">${animal.breedname || 'Unknown'}</td>
                            <td><span class="status-pill ${statusClass}">${animal.status}</span></td>
                            <td>
                                <div class="yield-container">
                                    <span class="font-weight-bold" style="font-size: 0.85rem; color: #1e293b;">${yieldValue}</span>
                                    ${yieldBars}
                                </div>
                            </td>
                            <td class="text-right">
                                <div class="dropdown">
                                    <button class="btn btn-sm p-0 text-muted" type="button" onclick="toggleActionMenu(event, this)">
                                        <span class="material-symbols-outlined">more_vert</span>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                        <button class="action-menu-item" onclick="triggerAction('view', '${animal.id}')">
                                            <span class="material-symbols-outlined mr-2">visibility</span> View Profile
                                        </button>
                                        <button class="action-menu-item" onclick="triggerAction('edit', '${animal.id}')">
                                            <span class="material-symbols-outlined mr-2">edit</span> Edit Details
                                        </button>
                                        <button class="action-menu-item" onclick="triggerAction('production', '${animal.id}')">
                                            <span class="material-symbols-outlined mr-2">monitoring</span> Production
                                        </button>
                                        <div class="dropdown-divider"></div>
                                        <button class="action-menu-item text-danger" onclick="triggerAction('delete', '${animal.id}')">
                                            <span class="material-symbols-outlined mr-2">delete</span> Delete
                                        </button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    `;
                });
                
                // Destroy existing DataTable if it exists
                if ($.fn.DataTable.isDataTable('#animalsDataTable')) {
                    $('#animalsDataTable').DataTable().destroy();
                }
                
                $('#animalsTableBody').html(rows);
                
                // Re-initialize DataTable
                const table = $('#animalsDataTable').DataTable({
                    "pageLength": 10,
                    "paging": true,
                    "info": false,
                    "responsive": true,
                    "columnDefs": [
                        { "responsivePriority": 1, "targets": 0 },
                        { "responsivePriority": 2, "targets": -1 },
                        { "orderable": false, "targets": "no-sort" }
                    ],
                    "dom": 'Bfrt',
                    "buttons": [
                        { extend: 'excel', className: 'btn btn-sm btn-light border-0 text-success font-weight-normal mx-1', text: '<span class="material-symbols-outlined" style="font-size:1rem; vertical-align:middle;">download</span> Excel' },
                        { extend: 'print', className: 'btn btn-sm btn-light border-0 text-muted font-weight-normal mx-1', text: '<span class="material-symbols-outlined" style="font-size:1rem; vertical-align:middle;">print</span> Print' }
                    ]
                });
                
                table.buttons().container().appendTo('#exportButtonsContainer');
                updatePagination(table);

                // Re-bind filters
                $('#breedFilter').off('change').on('change', function() { table.column(2).search(this.value).draw(); });
                $('#statusFilter').off('change').on('change', function() { table.column(3).search(this.value).draw(); });
                $('#customSearch').off('keyup').on('keyup', function() { table.search(this.value).draw(); });
                
                // Re-bind pagination buttons
                $('#customPagination').off('click', '.page-btn').on('click', '.page-btn', function() {
                    const page = $(this).data('page');
                    if (page !== undefined) { table.page(page).draw('page'); updatePagination(table); }
                });

                $('#prevPage').off('click').on('click', function() { table.page('previous').draw('page'); updatePagination(table); });
                $('#nextPage').off('click').on('click', function() { table.page('next').draw('page'); updatePagination(table); });
            });
        }

        loadAnimals();

        // Toggle Animal Code input based on Auto-generate button
        $("#toggle_auto_gen").on("click", function() {
            $(this).toggleClass("active");
            const isActive = $(this).hasClass("active");
            
            if (isActive) {
                autoGenToggle.val("1");
                codeField.val("").prop("disabled", true).attr("placeholder", "Auto-generated");
            } else {
                autoGenToggle.val("0");
                codeField.prop("disabled", false).attr("placeholder", "e.g., JK-2024-001").focus();
            }
        });

        // jQuery UI DatePicker Initialization
        $("#birthDatePicker").datepicker({
            dateFormat: "dd-M-yy",
            changeMonth: true,
            changeYear: true,
            yearRange: "-20:+0"
        });

        $(window).on('click', function() { $('.actions-dropdown').removeClass('show'); });

        // Modal Logic
        const modal = $('#addAnimalModal');
        
        $('#addAnimalBtn').on('click', function() {
            modal.addClass('show');
            $('body').addClass('modal-open');
        });

        $('#closeModal, #discardModal, .modal-backdrop-blur').on('click', function() {
            modal.removeClass('show');
            $('body').removeClass('modal-open');
        });

        $('#submitModal').on('click', function() {
            // Clear previous notifications
            $('#animalNotifications').empty();

            // Validation Logic
            const breedid = breedSelect.val();
            const autogen = parseInt(autoGenToggle.val());
            const tagid = codeField.val().trim();
            const penid = penSelect.val();
            const status = statusSelect.val();
            const designatedname = nameField.val().trim();
            const motherid = motherSelect.val();
            const birthDateRaw = birthDateField.val();
            const initialweight = parseFloat(weightField.val());
            const purchaseprice = parseFloat(priceField.val()) || 0.00;
            const registrationsource = sourceSelect.val();

            let errorMessage = '';
            let focusField = null;

            if (!breedid) {
                errorMessage = 'Please select a breed type.';
                focusField = breedSelect;
            } else if (autogen === 0 && !tagid) {
                errorMessage = 'Please provide a unique animal code or select auto-generate.';
                focusField = codeField;
            } else if (!penid) {
                errorMessage = 'Please assign the animal to a pen.';
                focusField = penSelect;
            } else if (!status) {
                errorMessage = 'Please select a production status.';
                focusField = statusSelect;
            } else if (!designatedname) {
                errorMessage = 'Please provide a designated name for the animal.';
                focusField = nameField;
            } else if (!birthDateRaw) {
                errorMessage = 'Please select a valid birth date.';
                focusField = birthDateField;
            } else if (isNaN(initialweight) || initialweight <= 0) {
                errorMessage = 'Please enter a valid initial weight.';
                focusField = weightField;
            }

            if (errorMessage) {
                // Show only in modal div using showAlert helper with hideheading=1 to prevent global side-effect
                $('#animalNotifications').html(showAlert('info', errorMessage, 1));
                
                if (focusField) focusField.focus();
                return;
            }

            // If all valid
            $('#alert-container').html(showAlert('processing', 'Registering animal into the herd...'));

            $.ajax({
                url: '../controllers/animaloperations.php',
                type: 'POST',
                data: {
                    action: 'saveanimal',
                    id: 0,
                    tagid: tagid,
                    designatedname: designatedname,
                    breedid: breedid,
                    penid: penid,
                    damid: motherid,
                    birthdate: birthDateRaw,
                    initialweight: initialweight,
                    registrationsource: registrationsource,
                    purchaseprice: purchaseprice,
                    status: status,
                    autogen: autogen
                },
                success: function(response) {
                    const res = JSON.parse(response);
                    if (res.status === 'success') {
                        $('#alert-container').html(showAlert('success', 'Animal Registered Successfully into the Herd!'));
                        modal.removeClass('show');
                        $('body').removeClass('modal-open');
                        loadAnimals();
                        
                        // Reset form
                        breedSelect.val('');
                        penSelect.val('');
                        statusSelect.val('');
                        motherSelect.val('');
                        sourceSelect.val('Born on Farm');
                        codeField.val('');
                        nameField.val('');
                        birthDateField.val('');
                        weightField.val('');
                        priceField.val('');
                        $('#animalNotifications').empty();
                    } else {
                        $('#alert-container').empty();
                        $('#animalNotifications').html(showAlert('error', res.message, 1));
                    }
                },
                error: function() {
                    $('#alert-container').html(showAlert('error', 'Network error. Please try again.'));
                }
            });
        });
    });
    </script>
</body>
</html>
