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

    <!-- Modular Modals (Lock/Password) -->
    <?php include 'modals.php'; ?>

    <!-- Main Content Area -->
    <main class="main-content">
        <div class="container-fluid pt-1 px-2">
            <!-- Header Section -->
            <div class="row align-items-center mb-3">
                <div class="col-md-7">
                    <span class="stats-label text-muted mb-1 d-block font-headline" style="letter-spacing: 0.15rem; font-size: 0.6rem;">Management Dashboard</span>
                    <h2 class="font-headline font-weight-bold text-on-surface" style="font-size: 1.5rem;">Animals Overview</h2>
                </div>
                <div class="col-md-5 d-flex justify-content-md-end">
                    <button class="btn btn-add-animal botanical-shadow" id="addAnimalBtn">
                        <span class="material-symbols-outlined">add</span>
                        <span>Add New Animal</span>
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
                        <span class="stats-value font-headline" style="font-size: 1.5rem;">30</span>
                        <span class="ml-2 font-headline" style="font-size: 10px; color: var(--primary); font-weight: 700;">+12 this month</span>
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
                        <span class="stats-value font-headline" style="font-size: 1.5rem;">18</span>
                        <span class="ml-2 text-muted font-headline" style="font-size: 10px; font-weight: 600;">60% of herd</span>
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
                        <span class="stats-value font-headline" style="font-size: 1.5rem;">8</span>
                        <span class="ml-2 text-muted font-headline" style="font-size: 10px; font-weight: 600;">2 near term</span>
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
                        <span class="stats-value font-headline" style="font-size: 1.5rem;">4</span>
                        <span class="ml-2 font-headline" style="font-size: 10px; color: var(--secondary); font-weight: 700;">Action critical</span>
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
                        <span class="stats-value font-headline" style="font-size: 1.5rem;">0</span>
                        <span class="ml-2 text-muted font-headline" style="font-size: 10px; font-weight: 600;">Stable herd</span>
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
                        <tbody>
                            <?php
                            $animals = [
                                ['ID' => 'JK-001', 'Name' => 'Daisy', 'Breed' => 'Holstein', 'Status' => 'Lactating', 'Yield' => '32.4 L', 'Bars' => [40,60,80,100]],
                                ['ID' => 'JK-042', 'Name' => 'Bella', 'Breed' => 'Jersey', 'Status' => 'Dry', 'Yield' => 'N/A', 'Bars' => []],
                                ['ID' => 'JK-115', 'Name' => 'Luna', 'Breed' => 'Brown Swiss', 'Status' => 'Pregnant', 'Yield' => '28.1 L', 'Bars' => [80,60,40,30]],
                                ['ID' => 'JK-204', 'Name' => 'Molly', 'Breed' => 'Holstein', 'Status' => 'Lactating', 'Yield' => '35.9 L', 'Bars' => [30,50,90,100]],
                                ['ID' => 'JK-305', 'Name' => 'Nala', 'Breed' => 'Ayrshire', 'Status' => 'Lactating', 'Yield' => '31.2 L', 'Bars' => [40,50,70,90]],
                                ['ID' => 'JK-412', 'Name' => 'Penny', 'Breed' => 'Guernsey', 'Status' => 'Dry', 'Yield' => 'N/A', 'Bars' => []],
                                ['ID' => 'JK-518', 'Name' => 'Rosie', 'Breed' => 'Holstein', 'Status' => 'Pregnant', 'Yield' => '26.5 L', 'Bars' => [60,50,40,20]],
                                ['ID' => 'JK-622', 'Name' => 'Sadie', 'Breed' => 'Jersey', 'Status' => 'Lactating', 'Yield' => '34.0 L', 'Bars' => [30,60,85,100]],
                                ['ID' => 'JK-701', 'Name' => 'Willow', 'Breed' => 'Brown Swiss', 'Status' => 'Lactating', 'Yield' => '33.7 L', 'Bars' => [50,70,90,95]],
                                ['ID' => 'JK-804', 'Name' => 'Zara', 'Breed' => 'Holstein', 'Status' => 'Dry', 'Yield' => 'N/A', 'Bars' => []],
                                ['ID' => 'JK-912', 'Name' => 'Clover', 'Breed' => 'Ayrshire', 'Status' => 'Pregnant', 'Yield' => '27.2 L', 'Bars' => [40,60,70,80]],
                                ['ID' => 'JK-101', 'Name' => 'Daffodil', 'Breed' => 'Holstein', 'Status' => 'Lactating', 'Yield' => '30.5 L', 'Bars' => [20,40,60,80]],
                            ];
                            for($i=0; $i<18; $i++) { $copy = $animals[$i%12]; $copy['ID'] .= '-'.($i+1); $animals[] = $copy; }

                            foreach ($animals as $animal):
                                $statusClass = 'status-' . strtolower($animal['Status']);
                            ?>
                            <tr>
                                <td><span class="font-headline" style="color: var(--primary); font-weight: 700;"><?php echo $animal['ID']; ?></span></td>
                                <td><span class="font-weight-medium"><?php echo $animal['Name']; ?></span></td>
                                <td class="text-muted"><?php echo $animal['Breed']; ?></td>
                                <td><span class="status-pill <?php echo $statusClass; ?>"><?php echo $animal['Status']; ?></span></td>
                                <td>
                                    <div class="d-flex align-items-center gap-2 yield-container">
                                        <span class="mr-2" style="width: 40px; font-weight: 400;"><?php echo $animal['Yield']; ?></span>
                                        <?php if (!empty($animal['Bars'])): ?>
                                        <div class="yield-bars" style="width: 2rem; height: 0.6rem;">
                                            <?php foreach ($animal['Bars'] as $h): ?>
                                            <div class="yield-bar" style="height: <?php echo $h; ?>%; opacity: <?php echo $h/100; ?>;"></div>
                                            <?php endforeach; ?>
                                        </div>
                                        <?php endif; ?>
                                    </div>
                                </td>
                                <td class="text-right">
                                    <div class="actions-container">
                                        <button class="btn-action-more" onclick="toggleActionMenu(event, this)">
                                            <span class="material-symbols-outlined">more_vert</span>
                                        </button>
                                        <div class="actions-dropdown botanical-shadow">
                                            <button class="action-menu-item" onclick="triggerAction('edit', '<?php echo $animal['ID']; ?>')"><span class="material-symbols-outlined">edit</span> Edit</button>
                                            <button class="action-menu-item" onclick="triggerAction('production', '<?php echo $animal['ID']; ?>')"><span class="material-symbols-outlined">trending_up</span> Production</button>
                                            <button class="action-menu-item" onclick="triggerAction('health', '<?php echo $animal['ID']; ?>')"><span class="material-symbols-outlined">medical_services</span> Health</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <?php endforeach; ?>
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
                <button class="modal-close-btn" id="closeModal">
                    <span class="material-symbols-outlined">close</span>
                </button>
                
                <div class="modal-form-scroll">
                    <div class="form-section modal-first-section mb-4">
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
                            <select class="form-control-custom">
                                <option>Holstein Friesian</option>
                                <option>Jersey</option>
                                <option>Guernsey</option>
                                <option>Ayrshire</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="modal-section-label">Animal Code</label>
                            <input type="text" class="form-control-custom" placeholder="e.g., JK-2024-001">
                        </div>
                    </div>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label class="modal-section-label">Pen</label>
                            <select class="form-control-custom">
                                <option>Pen 01 (Lactating)</option>
                                <option>Pen 02 (High Yielders)</option>
                                <option>Pen 03 (Dry/Pregnant)</option>
                                <option>Pen 04 (Calves/Heifers)</option>
                                <option>Quarantine Area</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="modal-section-label">Production Status</label>
                            <select class="form-control-custom">
                                <option>High</option>
                                <option>Medium</option>
                                <option>Low</option>
                                <option>N/A (Dry/Young)</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="modal-section-label">Designated Name</label>
                        <input type="text" class="form-control-custom" placeholder="e.g., Daisy">
                    </div>

                    <div class="form-group">
                        <label class="modal-section-label">Mother</label>
                        <select class="form-control-custom">
                            <option value="">&lt;None&gt;</option>
                            <option>JK-2021-042 (Bella)</option>
                            <option>JK-2022-015 (Luna)</option>
                        </select>
                    </div>

                    <div class="form-grid-2">
                        <div class="form-group">
                            <label class="modal-section-label">Birth Date</label>
                            <input type="text" class="form-control-custom" id="birthDatePicker" placeholder="Select Date">
                        </div>
                        <div class="form-group">
                            <label class="modal-section-label">Initial Weight</label>
                            <input type="number" class="form-control-custom" placeholder="0.00">
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
                            <input type="number" class="form-control-custom" placeholder="0.00">
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
        // jQuery UI DatePicker Initialization
        $("#birthDatePicker").datepicker({
            dateFormat: "dd-M-yy",
            changeMonth: true,
            changeYear: true,
            yearRange: "-20:+0"
        });

        const table = $('#animalsDataTable').DataTable({
            "pageLength": 10,
            "paging": true,
            "info": false,
            "responsive": true,
            "columnDefs": [
                { "responsivePriority": 1, "targets": 0 }, // ID is high priority
                { "responsivePriority": 2, "targets": -1 }, // Actions is high priority (must show)
                { "responsivePriority": 10001, "targets": 4 }, // Yield can hide if needed
                { "orderable": false, "targets": "no-sort" }
            ],
            "dom": 'Bfrt',
            "buttons": [
                { extend: 'excel', className: 'btn btn-sm btn-light border-0 text-success font-weight-normal mx-1', text: '<span class="material-symbols-outlined" style="font-size:1rem; vertical-align:middle;">download</span> Excel' },
                { extend: 'print', className: 'btn btn-sm btn-light border-0 text-muted font-weight-normal mx-1', text: '<span class="material-symbols-outlined" style="font-size:1rem; vertical-align:middle;">print</span> Print' }
            ]
        });

        table.buttons().container().appendTo('#exportButtonsContainer');

        $('#breedFilter').on('change', function() { table.column(2).search(this.value).draw(); });
        $('#statusFilter').on('change', function() { table.column(3).search(this.value).draw(); });
        $('#customSearch').on('keyup', function() { table.search(this.value).draw(); });

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

        updatePagination();
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
            showAlert('success', 'Animal Registered Successfully into the Herd!');
            modal.removeClass('show');
            $('body').removeClass('modal-open');
        });
    });
    </script>
</body>
</html>
