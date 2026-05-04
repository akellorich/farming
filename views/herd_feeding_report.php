<?php 
/**
 * Jukam Dairy Management System - Herd Feeding Efficiency Report
 */
$base_path = '../'; 
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Herd Feeding Efficiency Report | Jukam Farm</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/all.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/dashboard.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/navigation.css">
    
    <!-- DataTables & Responsive Support -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.4.0/css/responsive.bootstrap4.min.css">
    
    <!-- External Support -->
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Work+Sans:wght@300;400;500;600;700&family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">

<style>
    :root {
        --primary: #206223;
        --surface: #ffffff;
        --on-surface: #1a1c19;
        --border-color: #e1e3de;
        --bg-botanical: #fafaf5;
        --surface-dark: #1a1c19;
    }

    body {
        background-color: var(--background);
        font-family: 'Work Sans', sans-serif;
        color: var(--on-surface);
    }

    .botanical-shadow {
        box-shadow: 0 4px 20px -5px rgba(0, 0, 0, 0.05);
        border: 1px solid var(--border-color);
    }

    .btn-pill {
        background: white;
        border: 1px solid var(--border-color);
        padding: 6px 16px;
        border-radius: 50px;
        font-size: 11px;
        font-weight: 700;
        display: inline-flex;
        align-items: center;
        gap: 8px;
        color: #444743;
        transition: all 0.2s;
        cursor: pointer;
    }

    .btn-pill:hover {
        background: #f8faf5;
        color: var(--primary);
    }

    .summary-card {
        background: white;
        border-radius: 16px;
        padding: 16px;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        position: relative;
    }

    .summary-card.accent-green { border-left: 6px solid #206223; }
    .summary-card.accent-red { border-left: 6px solid #ba1a1a; }

    .metric-value {
        font-family: 'Manrope', sans-serif;
        font-size: 28px;
        font-weight: 600;
        line-height: 1;
    }

    .metric-label {
        font-size: 9px;
        font-weight: 800;
        letter-spacing: 0.15em;
        text-transform: uppercase;
        color: #40493d;
    }

    .custom-table thead th {
        background: #f4f4ef;
        border: none;
        font-size: 10px;
        text-transform: uppercase;
        letter-spacing: 0.1em;
        padding: 10px 15px;
        color: #40493d;
    }

    .custom-table tbody td {
        padding: 8px 15px;
        vertical-align: middle;
        border-top: 1px solid #f1f1eb;
        font-size: 11.5px;
        color: #444743;
    }

    .custom-table td:first-child {
        font-size: 12px;
    }

    /* Toggle Control */
    .toggle-container {
        background: #eeeee9;
        padding: 3px;
        border-radius: 8px;
        display: inline-flex;
        gap: 2px;
    }
    .toggle-btn {
        padding: 4px 12px;
        font-size: 10px;
        font-weight: 500;
        border-radius: 6px;
        cursor: pointer;
        border: none;
        background: transparent;
        color: #94a3b8;
    }
    .toggle-btn.active {
        background: var(--primary);
        color: white;
    }

    /* Action Menu */
    .action-dropdown {
        position: absolute;
        top: 100%;
        right: 0;
        width: 180px;
        background: white;
        border: 1px solid var(--border-color);
        border-radius: 12px;
        box-shadow: 0 10px 30px -5px rgba(0, 0, 0, 0.1);
        z-index: 1000;
        display: none;
    }
    .action-dropdown.show { display: block; }
    .action-item {
        width: 100%;
        padding: 10px 16px;
        display: flex;
        align-items: center;
        gap: 12px;
        font-size: 11px;
        font-weight: 500;
        color: #64748b;
        background: transparent;
        border: none;
        text-align: left;
    }
    .action-item:hover { background: #f8faf5; color: var(--primary); }

    /* Dark Mode Overrides */
    .dark-theme body { background-color: #0d0e0c !important; }
    .dark-theme .summary-card,
    .dark-theme .bg-white,
    .dark-theme .card {
        background-color: var(--surface-dark) !important;
        border-color: #2d3748 !important;
        color: white !important;
    }
    .dark-theme .metric-label { color: #94a3b8 !important; }
    .dark-theme .custom-table thead th { background: #242622; color: #acf4a4; }
    .dark-theme .custom-table tbody td { border-top-color: #242622 !important; color: #94a3b8 !important; }
    .dark-theme .custom-table .text-dark { color: #ffffff !important; }
    .dark-theme .toggle-container { background: #242622; }
    .dark-theme .btn-pill { background: #242622; color: #94a3b8; border-color: #2d3748; }

    /* Mobile Diagnostic Tuning */
    @media (max-width: 575.98px) {
        .metric-value { font-size: 23px !important; }
        .page-header-title { font-size: 17px !important; }
        .page-header-desc { font-size: 11.5px !important; line-height: 1.4; }
        .summary-card { padding: 12px !important; }
        .metric-label { font-size: 8px !important; letter-spacing: 0.1em !important; }
        
        /* Shift Comparison Mobile Optimization */
        .shift-icon-container { width: 42px !important; height: 42px !important; border-radius: 12px !important; margin-bottom: 12px !important; }
        .shift-icon-container span { font-size: 20px !important; }
        .shift-title { font-size: 11px !important; }
        .shift-desc { font-size: 8px !important; margin-bottom: 12px !important; }
        .shift-weight { font-size: 16px !important; margin-bottom: 8px !important; }
        .shift-percentage { font-size: 9px !important; margin-bottom: 12px !important; }
        .shift-dashes { width: 60px !important; gap: 4px !important; }
        .shift-dashes div { height: 4px !important; width: 15px !important; }
        .shift-card-padding { padding: 20px 10px !important; }
    }
</style>
</head>

<body>
    <!-- Partial Files Logic -->
    <?php include 'navigation.php'; ?>
    <?php include 'header.php'; ?>

    <main class="main-content">
        <div class="container-fluid px-md-4">
            <!-- Global Action Toolbar -->
            <div class="d-flex flex-nowrap justify-content-between align-items-center mb-4 no-print" style="width: 100%; position: relative; z-index: 20;">
                <a href="reports_overview.php" class="btn-pill text-decoration-none" style="padding: 6px 10px;">
                    <span class="material-symbols-outlined mr-1" style="font-size: 18px;">arrow_back</span>
                    Back<span class="d-none d-md-inline"> to Reports</span>
                </a>

                <div class="d-flex align-items-center">
                    <button class="btn-pill mr-2" onclick="window.print()">
                        <span class="material-symbols-outlined" style="font-size: 18px;">print</span>
                        Print
                    </button>
                    
                    <div class="position-relative no-print">
                        <button id="actionBtn" class="btn-pill">
                            <span class="material-symbols-outlined" style="font-size: 18px;">settings</span>
                            Actions
                            <span class="material-symbols-outlined" style="font-size: 18px;">expand_more</span>
                        </button>
                        <div id="actionDropdown" class="action-dropdown shadow">
                            <button class="action-item"><span class="material-symbols-outlined">ios_share</span> Export Excel</button>
                            <button class="action-item"><span class="material-symbols-outlined">mail</span> Email Report</button>
                            <div class="dropdown-divider"></div>
                            <button class="action-item text-danger"><span class="material-symbols-outlined">archive</span> Archive Record</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Page Title -->
            <div class="mb-4">
                <p class="metric-label" style="color: #795900;">Feeding Analysis</p>
                <h1 class="font-weight-bold mb-1 page-header-title" style="font-size: 20px;">Herd Feeding Efficiency</h1>
                <p class="text-muted mb-0 page-header-desc" style="font-size: 13px;">Analytical audit of nutritional intake, consumption velocity, and cost-efficiency across cattle categories for real-time nutritional governance.</p>
            </div>

            <!-- Summary Grid -->
            <div class="row no-gutters mb-0 mx-n2">
                <div class="col-6 col-md-4 col-lg px-2 mb-2">
                    <div class="summary-card accent-green botanical-shadow">
                        <div class="d-flex justify-content-between mb-2">
                            <span class="metric-label">Total Consumed</span>
                            <span class="material-symbols-outlined" style="font-size: 20px; color: #206223;">scale</span>
                        </div>
                        <div class="d-flex align-items-baseline" style="gap: 8px;">
                            <span class="metric-value" style="color: #1a1c19;">1,240</span>
                            <span class="small text-muted" style="font-size: 12px; font-weight: 500;">kg</span>
                        </div>
                        <div class="small font-weight-bold d-flex align-items-center" style="font-size: 10px; gap: 4px; margin-top: 10px; color: #206223;">
                            <span class="material-symbols-outlined" style="font-size: 12px;">trending_up</span> 2.4% vs last week
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg px-2 mb-2">
                    <div class="summary-card botanical-shadow">
                        <div class="d-flex justify-content-between mb-2">
                            <span class="metric-label">Avg / Animal</span>
                            <span class="material-symbols-outlined" style="font-size: 20px; color: #206223;">nutrition</span>
                        </div>
                        <div class="d-flex align-items-baseline" style="gap: 8px;">
                            <span class="metric-value" style="color: #1a1c19;">18.5</span>
                            <span class="small text-muted" style="font-size: 12px; font-weight: 500;">kg/d</span>
                        </div>
                        <div class="small text-muted" style="font-size: 10px; margin-top: 10px;">Target: 19.0 kg/d</div>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg px-2 mb-2">
                    <div class="summary-card botanical-shadow">
                        <div class="d-flex justify-content-between mb-2">
                            <span class="metric-label">Silage Stock</span>
                            <span class="material-symbols-outlined" style="font-size: 20px; color: #795900;">inventory</span>
                        </div>
                        <div class="d-flex align-items-baseline" style="gap: 8px;">
                            <span class="metric-value" style="color: #1a1c19;">42</span>
                            <span class="small text-muted" style="font-size: 12px; font-weight: 500;">tons</span>
                        </div>
                        <div class="progress" style="height: 6px; margin-top: 10px; background-color: #f4f4ef;">
                            <div class="progress-bar" role="progressbar" style="width: 65%; background-color: #795900;"></div>
                        </div>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg px-2 mb-2">
                    <div class="summary-card botanical-shadow">
                        <div class="d-flex justify-content-between mb-2">
                            <span class="metric-label">Efficiency</span>
                            <span class="material-symbols-outlined" style="font-size: 20px; color: #206223;">electric_bolt</span>
                        </div>
                        <div class="d-flex align-items-baseline" style="gap: 8px;">
                            <span class="metric-value" style="color: #1a1c19;">94.2</span>
                            <span class="small text-muted" style="font-size: 12px; font-weight: 500;">%</span>
                        </div>
                        <div class="small font-weight-bold" style="font-size: 10px; margin-top: 10px; color: #206223;">Optimal range</div>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg px-2 mb-2">
                    <div class="summary-card accent-red botanical-shadow">
                        <div class="d-flex justify-content-between mb-2">
                            <span class="metric-label" style="color: #ba1a1a;">Stock Alerts</span>
                            <span class="material-symbols-outlined" style="font-size: 20px; color: #ba1a1a;">warning</span>
                        </div>
                        <div class="d-flex align-items-baseline" style="gap: 8px;">
                            <span class="metric-value" style="color: #ba1a1a;">02</span>
                            <span class="small text-muted" style="font-size: 12px; font-weight: 500;">items</span>
                        </div>
                        <div class="small font-weight-bold" style="font-size: 10px; margin-top: 10px; color: #ba1a1a;">Cotton Seed, Pellets</div>
                    </div>
                </div>
            </div>

            <!-- Analytical Grid -->
            <div class="row mb-2">
                <div class="col-lg-4 mb-2">
                    <div class="card border-0 rounded-xl botanical-shadow h-100 p-4">
                        <h3 class="metric-label mb-4" style="font-size: 11px; letter-spacing: 0.2em;">Product Distribution</h3>
                        <div id="productDistChart" class="w-100 d-flex justify-content-center mb-4"></div>
                        <div class="row mt-auto px-2">
                            <div class="col-6 d-flex align-items-center mb-2 font-weight-medium text-muted" style="font-size: 10.5px; letter-spacing: 0.02em;"><div class="rounded-circle mr-3" style="width:10px; height:10px; background:#206223; flex-shrink: 0;"></div> Silage</div>
                            <div class="col-6 d-flex align-items-center mb-2 font-weight-medium text-muted" style="font-size: 10.5px; letter-spacing: 0.02em;"><div class="rounded-circle mr-3" style="width:10px; height:10px; background:#795900; flex-shrink: 0;"></div> Maize Germ</div>
                            <div class="col-6 d-flex align-items-center mb-2 font-weight-medium text-muted" style="font-size: 10.5px; letter-spacing: 0.02em;"><div class="rounded-circle mr-3" style="width:10px; height:10px; background:#387b41; flex-shrink: 0;"></div> Cotton Seed</div>
                            <div class="col-6 d-flex align-items-center mb-2 font-weight-medium text-muted" style="font-size: 10.5px; letter-spacing: 0.02em;"><div class="rounded-circle mr-3" style="width:10px; height:10px; background:#fec330; flex-shrink: 0;"></div> Pellets</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 mb-2">
                    <div class="card border-0 rounded-xl botanical-shadow p-4 h-100">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h3 class="metric-label" style="font-size: 11px; letter-spacing: 0.2em;">Herd Category Breakdown</h3>
                            <div class="toggle-container no-print">
                                <button class="toggle-btn active" data-period="daily">Daily</button>
                                <button class="toggle-btn" data-period="weekly">Weekly</button>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table id="herdCategoryTable" class="table table-borderless custom-table w-100">
                                <thead>
                                    <tr>
                                        <th class="rounded-left">Category</th>
                                        <th>Count</th>
                                        <th>Daily Intake (kg)</th>
                                        <th class="d-none d-md-table-cell">Efficiency</th>
                                        <th class="text-right rounded-right d-none d-md-table-cell">Trend</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php 
                                    $herdData = [
                                        ['High Yielders', 42, 24.5, 'OPTIMAL', 'trending_up', '#206223'],
                                        ['Medium Yielders', 68, 18.2, 'OPTIMAL', 'horizontal_rule', '#718096'],
                                        ['Low Yielders', 24, 14.0, 'REVIEW', 'trending_down', '#ba1a1a'],
                                        ['Heifers', 35, 12.5, 'OPTIMAL', 'trending_up', '#206223'],
                                        ['Calves', 18, 6.2, 'OPTIMAL', 'horizontal_rule', '#718096']
                                    ];
                                    foreach($herdData as $row): ?>
                                    <tr>
                                        <td class="font-weight-bold text-success"><?php echo $row[0]; ?></td>
                                        <td class="font-weight-bold text-muted"><?php echo $row[1]; ?></td>
                                        <td class="font-weight-bold text-dark"><?php echo $row[2]; ?></td>
                                        <td class="d-none d-md-table-cell"><span class="badge badge-pill badge-<?php echo $row[3]=='OPTIMAL'?'success':'warning'; ?> px-3 py-1 text-uppercase" style="font-size: 8px;"><?php echo $row[3]; ?></span></td>
                                        <td class="text-right text-muted d-none d-md-table-cell"><span class="material-symbols-outlined" style="font-size: 18px; color:<?php echo $row[5]; ?>;"><?php echo $row[4]; ?></span></td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Shift Schedule Comparison -->
            <div class="card border-0 rounded-xl botanical-shadow shift-card-padding p-5 mb-4 position-relative">
                <div class="d-flex align-items-center mb-5" style="gap: 16px;">
                    <h3 class="metric-label mb-0" style="font-size: 11px; letter-spacing: 0.2em;">Shift Schedule Comparison</h3>
                    <div class="border-top flex-grow-1" style="border-color: #f1f1eb !important;"></div>
                </div>
                <div class="row text-center no-gutters">
                    <div class="col-4 px-1">
                        <div class="mx-auto d-flex align-items-center justify-content-center mb-4 shift-icon-container" style="width:72px; height:72px; background:#acf4a4; color:#002203; border-radius: 20px;">
                            <span class="material-symbols-outlined" style="font-size: 32px;">wb_twilight</span>
                        </div>
                        <h4 class="font-weight-bold mb-1 text-dark shift-title" style="font-size: 20px;">03:00 AM Shift</h4>
                        <p class="small text-muted mb-4 text-uppercase shift-desc" style="letter-spacing: 1px; font-size: 10px;">Early Morning Boost</p>
                        <div class="mb-2 shift-weight" style="font-size: 28px; font-weight: 600; color: #206223;">450kg</div>
                        <p class="small text-muted mb-4 opacity-75 shift-percentage" style="font-size: 11px;">36.3% of Daily Total</p>
                        <div class="d-flex mx-auto justify-content-center shift-dashes" style="width: 120px; gap: 8px;">
                            <div class="rounded-pill" style="height: 6px; width: 30px; background: #206223;"></div>
                            <div class="rounded-pill" style="height: 6px; width: 30px; background: #206223;"></div>
                            <div class="rounded-pill" style="height: 6px; width: 30px; background: #acf4a4;"></div>
                        </div>
                    </div>
                    <div class="col-4 px-1">
                        <div class="mx-auto d-flex align-items-center justify-content-center mb-4 shift-icon-container" style="width:72px; height:72px; background:#ffdfa0; color:#261a00; border-radius: 20px;">
                            <span class="material-symbols-outlined" style="font-size: 32px;">sunny</span>
                        </div>
                        <h4 class="font-weight-bold mb-1 text-dark shift-title" style="font-size: 20px;">11:00 AM Shift</h4>
                        <p class="small text-muted mb-4 text-uppercase shift-desc" style="letter-spacing: 1px; font-size: 10px;">Midday Maintenance</p>
                        <div class="mb-2 shift-weight" style="font-size: 28px; font-weight: 600; color: #795900;">380kg</div>
                        <p class="small text-muted mb-4 opacity-75 shift-percentage" style="font-size: 11px;">30.6% of Daily Total</p>
                        <div class="d-flex mx-auto justify-content-center shift-dashes" style="width: 120px; gap: 8px;">
                            <div class="rounded-pill" style="height: 6px; width: 30px; background: #795900;"></div>
                            <div class="rounded-pill" style="height: 6px; width: 30px; background: #795900;"></div>
                            <div class="rounded-pill" style="height: 6px; width: 30px; background: #795900;"></div>
                        </div>
                    </div>
                    <div class="col-4 px-1">
                        <div class="mx-auto d-flex align-items-center justify-content-center mb-4 shift-icon-container" style="width:72px; height:72px; background:#acf4a4; color:#002107; border-radius: 20px;">
                            <span class="material-symbols-outlined" style="font-size: 32px;">nights_stay</span>
                        </div>
                        <h4 class="font-weight-bold mb-1 text-dark shift-title" style="font-size: 20px;">04:00 PM Shift</h4>
                        <p class="small text-muted mb-4 text-uppercase shift-desc" style="letter-spacing: 1px; font-size: 10px;">Evening Ration</p>
                        <div class="mb-2 shift-weight" style="font-size: 28px; font-weight: 600; color: #206223;">410kg</div>
                        <p class="small text-muted mb-4 opacity-75 shift-percentage" style="font-size: 11px;">33.1% of Daily Total</p>
                        <div class="d-flex mx-auto justify-content-center shift-dashes" style="width: 120px; gap: 8px;">
                            <div class="rounded-pill" style="height: 6px; width: 30px; background: #206223;"></div>
                            <div class="rounded-pill" style="height: 6px; width: 30px; background: #206223;"></div>
                            <div class="rounded-pill" style="height: 6px; width: 30px; background: #acf4a4;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="../plugins/jquery-3.6.1.js"></script>
    <script src="../plugins/popper.js"></script>
    <script src="../plugins/bootstrap.js"></script>
    <script src="../plugins/alert.js"></script>
    <script src="../js/functions.js"></script>
    
    <!-- DataTables & Responsive CDNs -->
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.4.0/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.4.0/js/responsive.bootstrap4.min.js"></script>
    
    <script src="../js/header.js"></script>
    
    <script>
        $(document).ready(function() {
            // Initialize DataTable
            $('#herdCategoryTable').DataTable({
                paging: false,
                searching: false,
                info: false,
                responsive: true,
                autoWidth: false
            });

            // Action Dropdown Toggle
            $('#actionBtn').on('click', function(e) {
                e.stopPropagation();
                $('#actionDropdown').toggleClass('show');
            });

            $(document).on('click', function() {
                $('#actionDropdown').removeClass('show');
            });

            // Toggle Buttons logic
            $('.toggle-btn').click(function() {
                $('.toggle-btn').removeClass('active');
                $(this).addClass('active');
            });
            
            // ApexCharts Initialization
            const isDark = $('body').hasClass('dark-theme');
            var options = {
                series: [45, 20, 20, 15],
                chart: { type: 'donut', height: 250, background: 'transparent' },
                labels: ['Silage', 'Maize Germ', 'Cotton Seed', 'Pellets'],
                colors: ['#206223', '#795900', '#387b41', '#fec330'],
                dataLabels: { enabled: false },
                legend: { show: false },
                plotOptions: {
                    pie: {
                        donut: {
                            size: '72%',
                            labels: {
                                show: true,
                                name: { fontSize: '11px', color: isDark ? '#94a3b8' : '#40493d' },
                                value: { fontSize: '18px', fontWeight: 700, color: isDark ? '#ffffff' : '#1a1c19' },
                                total: { show: true, label: 'Feed Mix', color: isDark ? '#94a3b8' : '#40493d' }
                            }
                        }
                    }
                },
                theme: { mode: isDark ? 'dark' : 'light' }
            };
            new ApexCharts(document.querySelector("#productDistChart"), options).render();
        });
    </script>
</body>
</html>
