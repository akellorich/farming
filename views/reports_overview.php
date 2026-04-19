<?php
/**
 * Jukam Dairy Management System - Report Generation
 * File: views/reports_overview.php
 */
$base_path = '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Generation | Jukam Farm</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/navigation.css">
    <link rel="stylesheet" href="../css/reports.css">
    <link rel="stylesheet" href="../css/alert.css">
    
    <!-- DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.4.0/css/responsive.bootstrap4.min.css"/>
    
    <!-- Google Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@300;400;500;600;700&family=Space+Grotesk:wght@300;400;500;600;700&family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">
    
    <!-- jQuery UI CSS -->
    <link rel="stylesheet" href="../css/jquery-ui.css">
</head>
<body class="bg-background">

    <!-- Modular Sidebar -->
    <?php include 'navigation.php'; ?>

    <!-- Modular Header -->
    <?php include 'header.php'; ?>

    <!-- Main Content Area -->
    <main class="main-content">
        <div class="container-fluid pt-1 px-2 px-md-4">
            
            <!-- Context Header Section -->
            <div class="row align-items-end mb-4 mt-2">
                <div class="col">
                    <span class="text-xs tracking-[0.2rem] font-bold font-label d-block mb-1 context-title" style="font-size: 0.75rem; color: #795900; text-transform: none;">Analytics Engine</span>
                    <h2 class="font-headline font-weight-bold text-on-surface mb-0 report-page-title">
                        Report Generation
                    </h2>
                </div>
            </div>

            <!-- Strategic Layout Grid -->
            <!-- We use a custom CSS Grid to handle reordering and eliminate vertical gaps -->
            <div class="reports-strategic-grid">
                
                <!-- 1. Report Selection (Order 1) -->
                <div class="grid-area selection-area mb-2 mb-xl-0">
                    <div class="report-section-header d-flex align-items-center mb-2 mb-xl-4">
                        <span class="material-symbols-outlined mr-2 text-primary" style="font-variation-settings: 'FILL' 1;">grid_view</span>
                        <h6 class="mb-0 font-weight-bold section-label-caps">1. Report Selection</h6>
                    </div>

                    <div class="report-selection-grid mb-1 mb-xl-3">
                        <!-- Production -->
                        <button class="report-type-card active-selection">
                            <span class="material-symbols-outlined report-icon">water_drop</span>
                            <div class="report-card-text">
                                <h5 class="report-name mb-1">Production</h5>
                                <p class="report-desc mb-0">Daily, Weekly, Monthly yields</p>
                            </div>
                            <div class="selection-check">
                                <span class="material-symbols-outlined text-primary" style="font-variation-settings: 'FILL' 1;">check_circle</span>
                            </div>
                        </button>

                        <!-- Health Records -->
                        <button class="report-type-card">
                            <span class="material-symbols-outlined report-icon">monitor_heart</span>
                            <div class="report-card-text">
                                <h5 class="report-name mb-1">Health Records</h5>
                                <p class="report-desc mb-0">General clinical observations</p>
                            </div>
                        </button>

                        <!-- Vaccination -->
                        <button class="report-type-card">
                            <span class="material-symbols-outlined report-icon">vaccines</span>
                            <div class="report-card-text">
                                <h5 class="report-name mb-1">Vaccination</h5>
                                <p class="report-desc mb-0">Upcoming and historical logs</p>
                            </div>
                        </button>

                        <!-- Deworming -->
                        <button class="report-type-card">
                            <span class="material-symbols-outlined report-icon">medication</span>
                            <div class="report-card-text">
                                <h5 class="report-name mb-1">Deworming</h5>
                                <p class="report-desc mb-0">Treatment cycles and schedules</p>
                            </div>
                        </button>

                        <!-- Animal Health Card -->
                        <button class="report-type-card">
                            <span class="material-symbols-outlined report-icon">badge</span>
                            <div class="report-card-text">
                                <h5 class="report-name mb-1">Animal Health Card</h5>
                                <p class="report-desc mb-0">Individual profile statistics</p>
                            </div>
                        </button>

                        <!-- Birthing Details -->
                        <button class="report-type-card">
                            <span class="material-symbols-outlined report-icon">child_care</span>
                            <div class="report-card-text">
                                <h5 class="report-name mb-1">Birthing Details</h5>
                                <p class="report-desc mb-0">Calving records and progeny</p>
                            </div>
                        </button>

                        <!-- Inventory Stock -->
                        <button class="report-type-card">
                            <span class="material-symbols-outlined report-icon">inventory_2</span>
                            <div class="report-card-text">
                                <h5 class="report-name mb-1">Stock Levels</h5>
                                <p class="report-desc mb-0">Tracking raw materials and commercial meals</p>
                            </div>
                        </button>

                        <!-- Efficiency -->
                        <button class="report-type-card">
                            <span class="material-symbols-outlined report-icon">analytics</span>
                            <div class="report-card-text">
                                <h5 class="report-name mb-1">Feeding Efficiency</h5>
                                <p class="report-desc mb-0">Analyzing feed consumption vs yield</p>
                            </div>
                        </button>

                        <!-- Herd Growth -->
                        <button class="report-type-card">
                            <span class="material-symbols-outlined report-icon">trending_up</span>
                            <div class="report-card-text">
                                <h5 class="report-name mb-1">Herd Growth</h5>
                                <p class="report-desc mb-0">Tracking calf development and herd expansion</p>
                            </div>
                        </button>
                    </div>
                </div>

                <!-- 2. Configuration (Order 2) -->
                <div class="grid-area config-area mb-2 mb-xl-0">
                    <div class="report-config-card botanical-shadow-sm p-4 mb-xl-4">
                        <div class="d-flex align-items-center mb-2 mb-xl-4">
                            <span class="material-symbols-outlined mr-2 text-primary">settings_suggest</span>
                            <h6 class="mb-0 font-weight-bold section-label-caps">2. Configuration</h6>
                        </div>

                        <form id="generateReportForm">
                            <!-- Date Range -->
                            <div class="form-section mb-4">
                                <label class="config-section-label">Reporting Period</label>
                                <div class="row g-2">
                                    <div class="col-6">
                                        <span class="input-tiny-label">From</span>
                                        <input type="text" id="reportDateFrom" class="form-control config-input" placeholder="Select date" readonly>
                                    </div>
                                    <div class="col-6">
                                        <span class="input-tiny-label">To</span>
                                        <input type="text" id="reportDateTo" class="form-control config-input" placeholder="Select date" readonly>
                                    </div>
                                </div>
                            </div>

                            <!-- Scope -->
                            <div class="form-section mb-4">
                                <label class="config-section-label">Scope (Animal / Pen)</label>
                                <select class="form-control config-input">
                                    <option>All Animals (Full Herd)</option>
                                    <option>North Wing - Pen A</option>
                                    <option>South Wing - Pen B</option>
                                    <option>Maternity Ward</option>
                                    <option>Individual: Cow #1204 (Bessie)</option>
                                </select>
                            </div>

                            <!-- Format Selection -->
                            <div class="form-section mb-5">
                                <label class="config-section-label">Output Format</label>
                                <div class="row g-1">
                                    <div class="col-3 px-1">
                                        <input type="radio" name="reportFormat" id="fmtPdf" class="d-none fmt-radio" checked>
                                        <label for="fmtPdf" class="fmt-selector-card">
                                            <span class="material-symbols-outlined">picture_as_pdf</span>
                                            <span>PDF</span>
                                        </label>
                                    </div>
                                    <div class="col-3 px-1">
                                        <input type="radio" name="reportFormat" id="fmtExcel" class="d-none fmt-radio">
                                        <label for="fmtExcel" class="fmt-selector-card">
                                            <span class="material-symbols-outlined">table_view</span>
                                            <span>EXCEL</span>
                                        </label>
                                    </div>
                                    <div class="col-3 px-1">
                                        <input type="radio" name="reportFormat" id="fmtCsv" class="d-none fmt-radio">
                                        <label for="fmtCsv" class="fmt-selector-card">
                                            <span class="material-symbols-outlined">csv</span>
                                            <span>CSV</span>
                                        </label>
                                    </div>
                                    <div class="col-3 px-1">
                                        <input type="radio" name="reportFormat" id="fmtEmail" class="d-none fmt-radio">
                                        <label for="fmtEmail" class="fmt-selector-card">
                                            <span class="material-symbols-outlined">mail</span>
                                            <span>EMAIL</span>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <!-- Generate Button -->
                            <button type="submit" class="btn btn-primary btn-block btn-generate-report" id="btnGenerateReport">
                                <span class="material-symbols-outlined">data_exploration</span>
                                GENERATE REPORT
                            </button>
                            <p class="text-center text-muted mt-3 mb-0" style="font-size: 0.7rem;">Reports are generated securely and stored for 30 days.</p>
                        </form>
                    </div>

                    <!-- Automation Insight (Desktop Only) -->
                    <div class="automation-insight-card p-4 d-none d-xl-block">
                        <div class="insight-icon-bg mb-4">
                            <span class="material-symbols-outlined">tips_and_updates</span>
                        </div>
                        <h5 class="insight-title mb-2">Automate Tasks</h5>
                        <p class="insight-desc mb-4">Schedule reports to be sent automatically to your email every Monday morning.</p>
                        <button class="btn btn-outline-light btn-sm btn-automation text-uppercase">Configure Automations</button>
                        <span class="material-symbols-outlined bg-watermark">agriculture</span>
                    </div>
                </div>

                <!-- 3. Recently Generated (Order 3) -->
                <div class="grid-area history-area mb-4">
                    <div class="report-history-card botanical-shadow-sm p-4">
                        <div class="d-flex justify-content-between align-items-center mb-2 mb-xl-4">
                            <div class="d-flex align-items-center">
                                <span class="material-symbols-outlined mr-2 text-primary">history</span>
                                <h6 class="mb-0 font-weight-bold section-label-caps">Recently Generated</h6>
                            </div>
                            <button class="btn btn-link font-weight-bold text-decoration-none p-0 clear-history-btn" style="font-size: 0.8rem; color: var(--primary) !important;">Clear History</button>
                        </div>
                        
                        <div class="table-responsive">
                            <table class="table report-history-table w-100" id="recentlyGeneratedTable">
                                <thead>
                                    <tr>
                                        <th>Report Name</th>
                                        <th class="d-none d-md-table-cell">Date Created</th>
                                        <th class="d-none d-md-table-cell">Format</th>
                                        <th>Status</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="font-weight-bold text-on-surface">Monthly_Milk_Yield_Sept</td>
                                        <td class="text-muted d-none d-md-table-cell">Oct 20, 2023</td>
                                        <td class="d-none d-md-table-cell"><span class="badge-format pdf">PDF</span></td>
                                        <td><span class="badge-status complete">Complete</span></td>
                                        <td class="text-right">
                                            <button class="btn-action-icon btn-priority-action"><span class="material-symbols-outlined">download</span></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold text-on-surface">Herd_Health_Summary</td>
                                        <td class="text-muted d-none d-md-table-cell">Oct 23, 2023</td>
                                        <td class="d-none d-md-table-cell"><span class="badge-format xlsx">XLSX</span></td>
                                        <td><span class="badge-status processing">Processing</span></td>
                                        <td class="text-right">
                                            <span class="material-symbols-outlined text-muted spin-icon">sync</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold text-on-surface">Vaccination_Audit_Q3</td>
                                        <td class="text-muted d-none d-md-table-cell">Oct 15, 2023</td>
                                        <td class="d-none d-md-table-cell"><span class="badge-format pdf">PDF</span></td>
                                        <td><span class="badge-status complete">Complete</span></td>
                                        <td class="text-right">
                                            <button class="btn-action-icon btn-priority-action"><span class="material-symbols-outlined">download</span></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold text-on-surface">Inventory_Stock_Levels_Oct</td>
                                        <td class="text-muted d-none d-md-table-cell">Oct 25, 2023</td>
                                        <td class="d-none d-md-table-cell"><span class="badge-format csv">CSV</span></td>
                                        <td><span class="badge-status complete">Complete</span></td>
                                        <td class="text-right">
                                            <button class="btn-action-icon btn-priority-action"><span class="material-symbols-outlined">download</span></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold text-on-surface">Feeding_Efficiency_Report</td>
                                        <td class="text-muted d-none d-md-table-cell">Oct 24, 2023</td>
                                        <td class="d-none d-md-table-cell"><span class="badge-format pdf">PDF</span></td>
                                        <td><span class="badge-status failed">Failed</span></td>
                                        <td class="text-right">
                                            <button class="btn-action-icon text-muted"><span class="material-symbols-outlined">refresh</span></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold text-on-surface">Herd_Growth_Analysis_2023</td>
                                        <td class="text-muted d-none d-md-table-cell">Oct 26, 2023</td>
                                        <td class="d-none d-md-table-cell"><span class="badge-format xlsx">XLSX</span></td>
                                        <td><span class="badge-status processing">Processing</span></td>
                                        <td class="text-right">
                                            <span class="material-symbols-outlined text-muted spin-icon">sync</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="font-weight-bold text-on-surface">Daily_Production_Log_Week43</td>
                                        <td class="text-muted d-none d-md-table-cell">Oct 27, 2023</td>
                                        <td class="d-none d-md-table-cell"><span class="badge-format pdf">PDF</span></td>
                                        <td><span class="badge-status complete">Complete</span></td>
                                        <td class="text-right">
                                            <button class="btn-action-icon btn-priority-action"><span class="material-symbols-outlined">download</span></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- 4. Automation Insight on Mobile (Order 4) -->
                <div class="grid-area automation-mobile-area d-xl-none mb-4">
                    <div class="automation-insight-card p-4">
                        <div class="insight-icon-bg mb-4">
                            <span class="material-symbols-outlined">tips_and_updates</span>
                        </div>
                        <h5 class="insight-title mb-2">Automate Tasks</h5>
                        <p class="insight-desc mb-4">Schedule reports to be sent automatically to your email every Monday morning.</p>
                        <button class="btn btn-outline-light btn-sm btn-automation text-uppercase">Configure Automations</button>
                        <span class="material-symbols-outlined bg-watermark">agriculture</span>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- Page Modals -->
    <?php include 'report_modals.php'; ?>

    <!-- Global Scripts -->
    <script src="../plugins/jquery-3.6.1.js"></script>
    <script src="../plugins/jquery-ui.js"></script>
    <script src="../plugins/popper.js"></script>
    <script src="../plugins/bootstrap.js"></script>
    
    <!-- DataTables JS -->
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
    
    <script src="../js/header.js"></script>
    
    <!-- Page Specific Logic -->
    <script>
        $(document).ready(function() {
            // Initialize DataTable
            var table = $('#recentlyGeneratedTable').DataTable({
                "responsive": true,
                "dom": '<"d-flex justify-content-between align-items-center mb-3"f>t<"d-flex justify-content-between align-items-center mt-3"ip>',
                "language": {
                    "search": "",
                    "searchPlaceholder": "Search reports...",
                    "info": "Page _PAGE_ of _PAGES_",
                    "infoEmpty": "Page 0 of 0",
                    "infoFiltered": "",
                    "paginate": {
                        "previous": "<span class='material-symbols-outlined'>chevron_left</span>",
                        "next": "<span class='material-symbols-outlined'>chevron_right</span>"
                    }
                },
                "pageLength": 5,
                "ordering": true,
                "info": true,
                "autoWidth": false
            });

            // Report Card Selection Tracking
            let currentReportType = 'Production';

            $('.report-type-card').click(function() {
                $('.report-type-card').removeClass('active-selection');
                $(this).addClass('active-selection');
                $('.selection-check').remove();
                $(this).append('<div class="selection-check"><span class="material-symbols-outlined text-primary" style="font-variation-settings: \'FILL\' 1;">check_circle</span></div>');
                
                // Update local tracking
                currentReportType = $(this).find('.report-name').text();
            });

            // Orchestrated Report Generation
            $('#btnGenerateReport').click(function(e) {
                e.preventDefault();
                
                // Get format from radio buttons
                const formatId = $('input[name="reportFormat"]:checked').attr('id');
                let format = 'pdf'; // Default
                if (formatId === 'fmtExcel') format = 'excel';
                else if (formatId === 'fmtCsv') format = 'csv';
                else if (formatId === 'fmtEmail') format = 'email';

                const fromDate = $('#reportDateFrom').val();
                const toDate = $('#reportDateTo').val();

                if(!fromDate || !toDate) {
                    alert("Please select a valid date range first.");
                    return;
                }

                const reportName = currentReportType.toLowerCase();
                
                if (reportName.includes('production')) {
                    if (format === 'email') {
                        $('#emailReportModal').modal('show');
                    } else {
                        window.location.href = `milk_production_report.php?from=${fromDate}&to=${toDate}&format=${format}`;
                    }
                } else if (reportName.includes('animal health card')) {
                    if (format === 'email') {
                        $('#emailReportModal').modal('show');
                    } else {
                        window.location.href = `animal_health_card.php?from=${fromDate}&to=${toDate}&format=${format}`;
                    }
                } else if (reportName.includes('health')) {
                    if (format === 'email') {
                        $('#emailReportModal').modal('show');
                    } else {
                        window.location.href = `health_records_report.php?from=${fromDate}&to=${toDate}&format=${format}`;
                    }
                } else if (reportName.includes('vaccination')) {
                    if (format === 'email') {
                        $('#emailReportModal').modal('show');
                    } else {
                        window.location.href = `vaccination_report.php?from=${fromDate}&to=${toDate}&format=${format}`;
                    }
                } else if (reportName.includes('deworming')) {
                    if (format === 'email') {
                        $('#emailReportModal').modal('show');
                    } else {
                        window.location.href = `deworming_report.php?from=${fromDate}&to=${toDate}&format=${format}`;
                    }
                } else if (reportName.includes('birthing')) {
                    if (format === 'email') {
                        $('#emailReportModal').modal('show');
                    } else {
                        window.location.href = `birthing_breeding_report.php?from=${fromDate}&to=${toDate}&format=${format}`;
                    }
                } else if (reportName.toLowerCase().includes('stock')) {
                    if (format === 'email') {
                        $('#emailReportModal').modal('show');
                    } else {
                        window.location.href = `stock_level_report.php?from=${fromDate}&to=${toDate}&format=${format}`;
                    }
                } else if (reportName.toLowerCase().includes('feeding efficiency')) {
                    if (format === 'email') {
                        $('#emailReportModal').modal('show');
                    } else {
                        window.location.href = `herd_feeding_report.php?from=${fromDate}&to=${toDate}&format=${format}`;
                    }
                } else {
                    alert('Generation logic for "' + currentReportType + '" is currently being architected.');
                }
            });

            // Email Sending Simulation
            $('#sendEmailBtn').click(function() {
                $(this).prop('disabled', true).html('<span class="material-symbols-outlined spin-icon">sync</span> Dispatching...');
                
                setTimeout(() => {
                    $('#emailReportModal').modal('hide');
                    $(this).prop('disabled', false).html('<span class="material-symbols-outlined">send</span> Send Report');
                    alert("Report successfully dispatched to the selected recipient.");
                }, 1500);
            });

            // jQuery UI Datepickers
            $("#reportDateFrom, #reportDateTo").datepicker({
                dateFormat: "dd-M-yy",
                maxDate: 0,
                changeMonth: true,
                changeYear: true,
                showAnim: "fadeIn"
            });
        });
    </script>
</body>
</html>
