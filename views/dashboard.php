<?php
/**
 * Dairy Management System - Dashboard
 * File: views/dashboard.php
 */
$base_path = '../';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | JUKAM Dairy</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="<?php echo $base_path; ?>plugins/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/all.css"> <!-- FontAwesome -->
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/style.css"> <!-- Local Fonts & Global Font-Face -->
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/dashboard.css"> <!-- Dashboard specific -->
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/header.css"> <!-- Header specific -->
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/navigation.css"> <!-- Navigation specific -->
    <link rel="stylesheet" href="<?php echo $base_path; ?>css/alert.css"> <!-- Custom Alert Styles -->
    
    <!-- Google Fonts & Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://fonts.googleapis.com/css2?family=Manrope:wght@400;600;700;800&family=Work+Sans:wght@300;400;500;600;700&family=Space+Grotesk:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</head>
<body>

<?php include 'navigation.php'; ?>

<?php include 'header.php'; ?>

<!-- Modular Modals (Lock/Password) -->
<?php include 'modals.php'; ?>

<!-- Main Content -->
<main class="main-content">
    <!-- Hero Summary Section -->
    <div class="row mb-2">
        <div class="col-6 col-lg-3 mb-4">
            <div class="stats-card botanical-shadow">
                <span class="material-symbols-outlined bg-icon" style="color: var(--primary);">cruelty_free</span>
                <p class="stats-label">Total Animals</p>
                <div class="d-flex align-items-end gap-2">
                    <h3 class="stats-value font-headline">1,248</h3>
                    <span class="stats-trend text-success mb-2 ml-2">+12%</span>
                </div>
                <div class="mt-3">
                    <div class="d-flex justify-content-between mb-1" style="font-size: 10px; font-weight: 700; text-transform: uppercase;">
                        <span>Herd Health</span>
                        <span class="text-success">84%</span>
                    </div>
                    <div class="progress-custom">
                        <div class="progress-bar-custom" style="width: 84%; background-color: var(--primary);"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-6 col-lg-3 mb-4">
            <div class="stats-card botanical-shadow">
                <span class="material-symbols-outlined bg-icon" style="color: var(--primary);">water_drop</span>
                <p class="stats-label">Daily Yield</p>
                <div class="d-flex align-items-end gap-2">
                    <h3 class="stats-value font-headline">8,420</h3>
                    <span class="stats-trend text-muted mb-2 ml-2 font-weight-normal">Liters</span>
                </div>
                <div class="mt-3">
                    <div class="d-flex justify-content-between mb-1" style="font-size: 10px; font-weight: 700; text-transform: uppercase;">
                        <span>Daily Goal</span>
                        <span class="text-primary">92%</span>
                    </div>
                    <div class="progress-custom">
                        <div class="progress-bar-custom" style="width: 92%;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-6 col-lg-3 mb-4">
            <div class="stats-card botanical-shadow">
                <span class="material-symbols-outlined bg-icon" style="color: var(--secondary);">warning</span>
                <p class="stats-label">Stock Alerts</p>
                <div class="d-flex align-items-end gap-2">
                    <h3 class="stats-value font-headline" style="color: var(--secondary);">04</h3>
                    <span class="stats-trend text-muted mb-2 ml-2 font-weight-normal">Low items</span>
                </div>
                <div class="mt-3">
                    <div class="d-flex gap-1" style="overflow: visible;">
                        <div class="activity-icon bg-warning text-white border border-white" style="width: 1.5rem; height: 1.5rem; font-size: 10px; margin-right: -8px; position: relative; z-index: 3;"><span class="material-symbols-outlined" style="font-size: 14px;">restaurant</span></div>
                        <div class="activity-icon bg-warning text-white border border-white" style="width: 1.5rem; height: 1.5rem; font-size: 10px; margin-right: -8px; position: relative; z-index: 2;"><span class="material-symbols-outlined" style="font-size: 14px;">medical_services</span></div>
                        <div class="activity-icon bg-light text-muted border border-white stock-badge-count" style="width: 1.5rem; height: 1.5rem; font-size: 8px; font-weight: 800; position: relative; z-index: 1;">+2</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-6 col-lg-3 mb-4">
            <div class="stats-card botanical-shadow">
                <span class="material-symbols-outlined bg-icon" style="color: var(--error);">emergency</span>
                <p class="stats-label">Health Incidents</p>
                <div class="d-flex align-items-end gap-2">
                    <h3 class="stats-value font-headline" style="color: var(--error);">02</h3>
                    <span class="stats-trend text-muted mb-2 ml-2 font-weight-normal">New today</span>
                </div>
                <div class="mt-3">
                    <p class="small text-error font-weight-bold mb-0">
                        <span class="material-symbols-outlined align-middle" style="font-size: 14px;">priority_high</span>
                        Urgent
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Bento Grid -->
    <div class="row">
        <!-- Production Trends Chart -->
        <div class="col-lg-8 mb-4">
            <div class="stats-card botanical-shadow h-100 p-4">
                <div class="d-flex justify-content-between align-items-start mb-4">
                    <div>
                        <h5 class="font-headline font-weight-bold mb-1">Production Trends</h5>
                        <p class="text-muted small">Milk yield comparison across week cycles</p>
                    </div>
                    <div class="btn-group btn-group-toggle-custom">
                        <button class="btn btn-chart-toggle active" data-type="yield">Yield</button>
                        <button class="btn btn-chart-toggle" data-type="quality">Quality</button>
                    </div>
                </div>
                <div id="milkChart" style="min-height: 380px;"></div>
            </div>
        </div>

        <!-- Recent Activity -->
        <div class="col-lg-4 mb-4">
            <div class="stats-card botanical-shadow">
                <h5 class="font-headline font-weight-bold mb-4" style="font-size: 1.1rem;">Recent Activity</h5>
                <div class="d-flex flex-column gap-4">
                    <div class="activity-item">
                        <div class="activity-icon" style="background-color: var(--tertiary-fixed); color: var(--on-tertiary-fixed);">
                            <span class="material-symbols-outlined" style="font-size: 16px;">check_circle</span>
                        </div>
                        <div class="activity-content">
                            <p class="small font-weight-bold">Morning Milking Complete</p>
                            <p class="text-muted" style="font-size: 11px;">Sector B successfully processed 320 cows.</p>
                            <p class="text-muted mt-1" style="font-size: 9px; font-weight: 600; text-transform: uppercase; opacity: 0.6;">2 hours ago</p>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon" style="background-color: #ffdfa0; color: #261a00;">
                            <span class="material-symbols-outlined" style="font-size: 16px;">medication</span>
                        </div>
                        <div class="activity-content">
                            <p class="small font-weight-bold">Health Check Logged</p>
                            <p class="text-muted" style="font-size: 11px;">Cow #2481 scheduled for vet visit.</p>
                            <p class="text-muted mt-1" style="font-size: 9px; font-weight: 600; text-transform: uppercase; opacity: 0.6;">4 hours ago</p>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon" style="background-color: #acf4a4; color: #002203;">
                            <span class="material-symbols-outlined" style="font-size: 16px;">shopping_cart</span>
                        </div>
                        <div class="activity-content">
                            <p class="small font-weight-bold">Inventory Update</p>
                            <p class="text-muted" style="font-size: 11px;">500kg Premium Feed delivered to Silo 1.</p>
                            <p class="text-muted mt-1" style="font-size: 9px; font-weight: 600; text-transform: uppercase; opacity: 0.6;">Yesterday</p>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon" style="background-color: #deede0; color: #132113;">
                            <span class="material-symbols-outlined" style="font-size: 16px;">cleaning_services</span>
                        </div>
                        <div class="activity-content">
                            <p class="small font-weight-bold">Silo Maintenance</p>
                            <p class="text-muted" style="font-size: 11px;">Silo 2 scheduled cleaning completed successfully.</p>
                            <p class="text-muted mt-1" style="font-size: 9px; font-weight: 600; text-transform: uppercase; opacity: 0.6;">Yesterday</p>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon" style="background-color: #ffdad6; color: #ba1a1a;">
                            <span class="material-symbols-outlined" style="font-size: 16px;">emergency</span>
                        </div>
                        <div class="activity-content">
                            <p class="small font-weight-bold">Urgent Vet Call</p>
                            <p class="text-muted" style="font-size: 11px;">Dr. Mwaura attended to emergency in Sick Bay.</p>
                            <p class="text-muted mt-1" style="font-size: 9px; font-weight: 600; text-transform: uppercase; opacity: 0.6;">2 days ago</p>
                        </div>
                    </div>
                </div>
                <button class="btn btn-outline-success w-100 mt-4 font-weight-bold" style="font-size: 10px; text-transform: uppercase;">
                    View All Activity
                </button>
            </div>
        </div>
    </div>

    <!-- Secondary Bento Grid -->
    <div class="row">
        <!-- Low Stock Inventory -->
        <div class="col-lg-6 mb-4">
            <div class="stats-card botanical-shadow p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h5 class="font-headline font-weight-bold mb-0" style="font-size: 1.1rem;">Low Stock Inventory</h5>
                    <span class="material-symbols-outlined text-warning">inventory</span>
                </div>
                <div class="low-stock-list mt-2">
                    <div class="low-stock-item d-flex justify-content-between align-items-center mb-3 p-3">
                        <div class="d-flex align-items-center gap-3">
                            <span class="material-symbols-outlined text-warning" style="font-size: 20px;">grain</span>
                            <div>
                                <p class="small font-weight-bold mb-0">Protein Supplement A</p>
                                <p class="text-muted mb-0" style="font-size: 10px; font-weight: 700; text-transform: uppercase;">Feed Stock</p>
                            </div>
                        </div>
                        <div class="text-right">
                            <p class="small font-weight-bold mb-0 text-error">120 kg</p>
                            <p class="text-muted mb-0" style="font-size: 10px; font-weight: 700; text-transform: uppercase;">Critical Level</p>
                        </div>
                    </div>
                    
                    <div class="low-stock-item d-flex justify-content-between align-items-center mb-3 p-3">
                        <div class="d-flex align-items-center gap-3">
                            <span class="material-symbols-outlined text-warning" style="font-size: 20px;">vaccines</span>
                            <div>
                                <p class="small font-weight-bold mb-0">Antibiotic Vaccine (V2)</p>
                                <p class="text-muted mb-0" style="font-size: 10px; font-weight: 700; text-transform: uppercase;">Medical</p>
                            </div>
                        </div>
                        <div class="text-right">
                            <p class="small font-weight-bold mb-0 text-warning">42 Units</p>
                            <p class="text-muted mb-0" style="font-size: 10px; font-weight: 700; text-transform: uppercase;">Reorder Soon</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Health Surveillance -->
        <div class="col-lg-6 mb-4">
            <div class="stats-card botanical-shadow h-100 p-4">
                <div class="d-flex justify-content-between align-items-start mb-2">
                    <div>
                        <h5 class="font-headline font-weight-bold mb-1" style="font-size: 1.1rem;">Health Surveillance</h5>
                        <p class="text-muted small">Real-time monitoring of herd vitals and scheduled veterinarian inspections.</p>
                    </div>
                </div>
                
                <div class="row mt-4">
                    <div class="col-12 col-md-6 pr-md-2 mb-3 mb-md-0">
                        <div class="health-card-inner p-4 h-100">
                            <h2 class="font-headline font-weight-bold text-success mb-2">98.2%</h2>
                            <p class="text-muted mb-0" style="font-size: 10px; font-weight: 700; text-transform: uppercase;">Vaccination Rate</p>
                        </div>
                    </div>
                    <div class="col-12 col-md-6 pl-md-2">
                        <div class="health-card-inner p-4 h-100">
                            <h2 class="font-headline font-weight-bold text-error mb-2">03</h2>
                            <p class="text-muted mb-0" style="font-size: 10px; font-weight: 700; text-transform: uppercase;">Active Quarantines</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- FAB -->
<button class="fab botanical-shadow">
    <span class="material-symbols-outlined" style="font-size: 2rem;">add</span>
</button>

    <!-- Scripts Area -->
    <script src="<?php echo $base_path; ?>plugins/jquery-3.6.1.js"></script>
    <script src="<?php echo $base_path; ?>plugins/popper.js"></script>
    <script src="<?php echo $base_path; ?>plugins/bootstrap/bootstrap.js"></script>
    <script src="<?php echo $base_path; ?>js/navigation.js"></script>
    <script src="<?php echo $base_path; ?>js/header.js"></script>
    <script src="<?php echo $base_path; ?>js/auth.js"></script>
    <script src="<?php echo $base_path; ?>plugins/alert.js"></script>

    <script>
    $(document).ready(function() {
        // ApexCharts - Production Trend
        var yieldData = [7200, 7800, 7400, 8500, 7900, 7100, 7600];
        var qualityData = [4.2, 4.3, 4.1, 4.5, 4.2, 4.1, 4.3];

        var options = {
            series: [{
                name: 'Milk Yield',
                data: yieldData
            }],
            chart: {
                type: 'area',
                height: 380,
                toolbar: { show: false },
                zoom: { enabled: false },
                fontFamily: 'Plus Jakarta Sans, sans-serif'
            },
            colors: ['#206223'],
            dataLabels: { 
                enabled: true,
                offsetY: -10,
                style: {
                    fontSize: '10px',
                    fontFamily: 'Plus Jakarta Sans',
                    colors: ['#064e3b']
                },
                formatter: function(val) { return val.toLocaleString() + (val < 10 ? '%' : '') }
            },
            stroke: { curve: 'smooth', width: 3 },
            fill: {
                type: 'gradient',
                gradient: {
                    shadeIntensity: 1,
                    opacityFrom: 0.45,
                    opacityTo: 0.05,
                    stops: [20, 100]
                }
            },
            xaxis: {
                categories: [1, 2, 3, 4, 5, 6, 7],
                labels: { 
                    style: { colors: '#64748b', fontSize: '10px', fontWeight: 600 },
                    formatter: function(val) { return 'Day ' + val }
                },
                axisBorder: { show: false },
                axisTicks: { show: false }
            },
            yaxis: {
                labels: { 
                    style: { colors: '#64748b', fontSize: '10px' },
                    formatter: function(val) { return val.toLocaleString() + (val < 10 ? '%' : '') }
                }
            },
            annotations: {
                yaxis: [{
                    y: 8000,
                    borderColor: '#ba1a1a',
                    borderWidth: 1,
                    strokeDashArray: 4,
                    label: {
                        borderColor: '#ba1a1a',
                        style: { color: '#fff', background: '#ba1a1a', fontSize: '9px', fontWeight: 700 },
                        text: 'DAILY TARGET (8kL)'
                    }
                }]
            },
            grid: { borderColor: '#f1f1f1', strokeDashArray: 4 },
            tooltip: { theme: 'light', x: { show: true } }
        };

        var chart = new ApexCharts(document.querySelector("#milkChart"), options);
        chart.render();

        // Chart Toggle Logic
        $('.btn-chart-toggle').on('click', function() {
            $('.btn-chart-toggle').removeClass('active');
            $(this).addClass('active');
            
            var type = $(this).data('type');
            
            if(type === 'yield') {
                chart.updateSeries([{
                    name: 'Milk Yield',
                    data: yieldData
                }]);
                
                chart.updateOptions({
                    annotations: {
                        yaxis: [{
                            y: 8000,
                            borderColor: '#ba1a1a',
                            borderWidth: 1,
                            strokeDashArray: 4,
                            label: {
                                borderColor: '#ba1a1a',
                                style: { color: '#fff', background: '#ba1a1a', fontSize: '9px', fontWeight: 700 },
                                text: 'DAILY TARGET (8kL)'
                            }
                        }]
                    }
                });
            } else {
                chart.updateSeries([{
                    name: 'Milk Quality',
                    data: qualityData
                }]);
                
                chart.updateOptions({
                    annotations: {
                        yaxis: [{
                            y: 4.2,
                            borderColor: '#ba1a1a',
                            borderWidth: 1,
                            strokeDashArray: 4,
                            label: {
                                borderColor: '#ba1a1a',
                                style: { color: '#fff', background: '#ba1a1a', fontSize: '9px', fontWeight: 700 },
                                text: 'QUALITY TARGET (4.2%)'
                            }
                        }]
                    }
                });
            }
        });
    });
    </script>

</body>
</html>
