<?php
/**
 * Dairy Management System - Dashboard
 * File: dashboard.php
 */
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | JUKAM Dairy</title>
    
    <!-- Local Assets -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/all.css"> <!-- FontAwesome -->
    <link rel="stylesheet" href="css/style.css"> <!-- Local Fonts & Global Font-Face -->
    <link rel="stylesheet" href="css/dashboard.css"> <!-- Dashboard specific -->
    <link rel="stylesheet" href="css/header.css"> <!-- Header specific -->
    <link rel="stylesheet" href="css/navigation.css"> <!-- Navigation specific -->
    <link rel="stylesheet" href="css/alert.css"> <!-- Custom Alert Styles -->
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</head>
<body>

<?php include 'views/navigation.php'; ?>

<?php include 'views/header.php'; ?>

<!-- Modular Modals (Lock/Password) -->
<?php include 'views/modals.php'; ?>

<!-- Main Content -->
<main class="main-content">
    <!-- Hero Summary Section -->
    <div class="row mb-2">
        <div class="col-6 col-md-3 mb-4">
            <div class="stats-card botanical-shadow">
                <span class="material-symbols-outlined bg-icon" style="color: var(--primary);">cruelty_free</span>
                <p class="stats-label">Total Animals</p>
                <div class="d-flex align-items-end gap-2">
                    <h3 class="stats-value font-headline" id="total_animals_val">1,248</h3>
                    <span class="stats-trend text-success mb-2 ml-2" id="animal_trend">+12%</span>
                </div>
                <div class="mt-3">
                    <div class="d-flex justify-content-between mb-1" style="font-size: 10px; font-weight: 500; text-transform: uppercase;">
                        <span>Herd Health</span>
                        <span class="text-success" id="herd_health_perc">84%</span>
                    </div>
                    <div class="progress-custom">
                        <div class="progress-bar-custom" id="herd_health_bar" style="width: 84%; background-color: var(--primary);"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-3 mb-4">
            <div class="stats-card botanical-shadow">
                <span class="material-symbols-outlined bg-icon" style="color: var(--primary);">water_drop</span>
                <p class="stats-label">Daily Yield</p>
                <div class="d-flex align-items-end gap-2">
                    <h3 class="stats-value font-headline" id="daily_yield_val">8,420</h3>
                    <span class="stats-trend text-muted mb-2 ml-2 font-weight-normal">Liters</span>
                </div>
                <div class="mt-3">
                    <div class="d-flex justify-content-between mb-1" style="font-size: 10px; font-weight: 500; text-transform: uppercase;">
                        <span>Daily Goal</span>
                        <span class="text-primary" id="yield_goal_perc">92%</span>
                    </div>
                    <div class="progress-custom">
                        <div class="progress-bar-custom" id="yield_goal_bar" style="width: 92%;"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-3 mb-4">
            <div class="stats-card botanical-shadow">
                <span class="material-symbols-outlined bg-icon" style="color: var(--secondary);">warning</span>
                <p class="stats-label">Stock Alerts</p>
                <div class="d-flex align-items-end gap-2">
                    <h3 class="stats-value font-headline" id="stock_alerts_val" style="color: var(--secondary);">04</h3>
                    <span class="stats-trend text-muted mb-2 ml-2 font-weight-normal">Low items</span>
                </div>
                <div class="mt-3">
                    <div class="d-flex gap-1" style="overflow: visible;">
                        <div class="activity-icon bg-warning text-white border border-white" style="width: 1.5rem; height: 1.5rem; font-size: 10px; margin-right: -8px; position: relative; z-index: 3;"><span class="material-symbols-outlined" style="font-size: 14px;">restaurant</span></div>
                        <div class="activity-icon bg-warning text-white border border-white" style="width: 1.5rem; height: 1.5rem; font-size: 10px; margin-right: -8px; position: relative; z-index: 2;"><span class="material-symbols-outlined" style="font-size: 14px;">medical_services</span></div>
                        <div class="activity-icon bg-light text-muted border border-white stock-badge-count" style="width: 1.5rem; height: 1.5rem; font-size: 8px; font-weight: 500; position: relative; z-index: 1;">+2</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-6 col-md-3 mb-4">
            <div class="stats-card botanical-shadow">
                <span class="material-symbols-outlined bg-icon" style="color: var(--error);">emergency</span>
                <p class="stats-label">Health Incidents</p>
                <div class="d-flex align-items-end gap-2">
                    <h3 class="stats-value font-headline" id="health_incidents_val" style="color: var(--error);">02</h3>
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
        <div class="col-md-8 mb-4">
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
        <div class="col-md-4 mb-4">
            <div class="stats-card botanical-shadow">
                <h5 class="font-headline font-weight-bold mb-4" style="font-size: 1.1rem;">Recent Activity</h5>
                <div class="d-flex flex-column gap-4" id="recent_activity_list">
                    <!-- Dynamic Activity Items -->
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
        <div class="col-md-6 mb-4">
            <div class="stats-card botanical-shadow p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h5 class="font-headline font-weight-bold mb-0" style="font-size: 1.1rem;">Low Stock Inventory</h5>
                    <span class="material-symbols-outlined text-warning">inventory</span>
                </div>
                <div class="low-stock-list mt-2" id="low_stock_list">
                    <!-- Dynamic Low Stock Items -->
                </div>
            </div>
        </div>

        <!-- Health Surveillance -->
        <div class="col-md-6 mb-4">
            <div class="stats-card botanical-shadow h-100 p-4">
                <div class="d-flex justify-content-between align-items-start mb-0 mb-md-2">
                    <div>
                        <h5 class="font-headline font-weight-bold mb-1" style="font-size: 1.1rem;">Health Surveillance</h5>
                        <p class="text-muted small">Real-time monitoring of herd vitals and scheduled veterinarian inspections.</p>
                    </div>
                </div>
                
                <div class="row mt-2 mt-md-4">
                    <div class="col-6 col-md-6 pr-1 pr-md-2 mb-0">
                        <div class="health-card-inner h-100">
                            <h2 class="font-headline text-success mb-2" id="vaccination_rate">0%</h2>
                            <p class="text-muted mb-0" style="font-size: 10px; font-weight: 500; text-transform: uppercase;">Vaccination Rate</p>
                        </div>
                    </div>
                    <div class="col-6 col-md-6 pl-1 pl-md-2">
                        <div class="health-card-inner h-100">
                            <h2 class="font-headline text-error mb-2" id="active_quarantines">00</h2>
                            <p class="text-muted mb-0" style="font-size: 10px; font-weight: 500; text-transform: uppercase;">Active Quarantines</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>


    <!-- Scripts Area -->
    <script src="plugins/jquery-3.6.1.js"></script>
    <script src="plugins/popper.js"></script>
    <script src="plugins/bootstrap.js"></script>
    <script src="js/navigation.js"></script>
    <script src="js/header.js"></script>
    <script src="js/auth.js"></script>
    <script src="plugins/alert.js"></script>

    <script>
    $(document).ready(function() {
        var chart;
        var yieldData = [];
        var qualityData = [];
        var trendLabels = [];

        function timeAgo(date) {
            const seconds = Math.floor((new Date() - new Date(date)) / 1000);
            let interval = Math.floor(seconds / 31536000);
            if (interval > 1) return interval + " years ago";
            interval = Math.floor(seconds / 2592000);
            if (interval > 1) return interval + " months ago";
            interval = Math.floor(seconds / 86400);
            if (interval > 1) return interval + " days ago";
            interval = Math.floor(seconds / 3600);
            if (interval > 1) return interval + " hours ago";
            interval = Math.floor(seconds / 60);
            if (interval > 1) return interval + " minutes ago";
            return Math.floor(seconds) + " seconds ago";
        }

        function loadDashboardStats() {
            $.get('controllers/dashboardoperations.php', { action: 'getstats' }, function(data) {
                try {
                    const stats = JSON.parse(data);
                    
                    // Populate Cards
                    $('#total_animals_val').text(stats.total_animals.toLocaleString());
                    $('#animal_trend').text(stats.animal_trend);
                    $('#herd_health_perc').text(stats.herd_health + '%');
                    $('#herd_health_bar').css('width', stats.herd_health + '%');
                    
                    $('#daily_yield_val').text(stats.daily_yield);
                    $('#yield_goal_perc').text(stats.yield_goal_perc + '%');
                    $('#yield_goal_bar').css('width', stats.yield_goal_perc + '%');
                    
                    $('#stock_alerts_val').text(stats.stock_alerts);
                    $('#health_incidents_val').text(stats.health_incidents);

                    // Health Surveillance
                    if (stats.vaccination_rate !== undefined) {
                        $('#vaccination_rate').text(stats.vaccination_rate + '%');
                    }
                    if (stats.active_quarantines !== undefined) {
                        $('#active_quarantines').text(stats.active_quarantines);
                    }

                    // Update Chart Data
                    if (stats.trends) {
                        yieldData = stats.trends.yields;
                        qualityData = stats.trends.densities;
                        trendLabels = stats.trends.labels;
                        
                        // Initialize or Update Chart
                        if (!chart) {
                            initChart();
                        } else {
                            chart.updateOptions({
                                xaxis: { categories: trendLabels }
                            });
                            // Default to yield view
                            chart.updateSeries([{
                                name: 'Milk Yield',
                                data: yieldData
                            }]);
                        }
                    }

                    // Populate Recent Activity
                    if (stats.activities) {
                        let activityHtml = '';
                        stats.activities.forEach(item => {
                            let icon = 'info';
                            let bgColor = '#deede0';
                            let textColor = '#132113';

                            const op = (item.title || '').toLowerCase();
                            if(op.includes('insert')) { icon = 'add_circle'; bgColor = '#acf4a4'; textColor = '#002203'; }
                            else if(op.includes('update')) { icon = 'edit'; bgColor = '#ffdfa0'; textColor = '#261a00'; }
                            else if(op.includes('delete')) { icon = 'delete'; bgColor = '#ffdad6'; textColor = '#ba1a1a'; }

                            activityHtml += `
                                <div class="activity-item">
                                    <div class="activity-icon" style="background-color: ${bgColor}; color: ${textColor};">
                                        <span class="material-symbols-outlined" style="font-size: 16px;">${icon}</span>
                                    </div>
                                    <div class="activity-content">
                                        <p class="small font-weight-bold">${item.title || 'System Action'}</p>
                                        <p class="text-muted" style="font-size: 11px;">${item.narration || ''}</p>
                                        <p class="text-muted mt-1" style="font-size: 9px; font-weight: 600; text-transform: uppercase; opacity: 0.6;">${timeAgo(item.timestamp)}</p>
                                    </div>
                                </div>
                            `;
                        });
                        $('#recent_activity_list').html(activityHtml);
                    }

                    // Populate Low Stock
                    if (stats.low_stock) {
                        let stockHtml = '';
                        stats.low_stock.forEach(item => {
                            const isCritical = item.status.includes('CRITICAL');
                            const statusColor = isCritical ? 'text-error' : 'text-warning';
                            const badgeClass = isCritical ? 'badge-danger' : 'badge-warning';
                            const iconClass = item.icon || 'inventory_2';
                            
                            stockHtml += `
                                <div class="low-stock-item d-flex justify-content-between align-items-center mb-1 py-2 px-0">
                                    <div class="d-flex align-items-center gap-4">
                                        <span class="material-symbols-outlined text-warning" style="font-size: 24px;">${iconClass}</span>
                                        <div>
                                            <p class="small mb-0" style="font-size: 0.85rem; font-weight: 500;">${item.name}</p>
                                            <p class="text-muted mb-0" style="font-size: 9px; font-weight: 500; text-transform: uppercase; letter-spacing: 0.05em;">${item.category}</p>
                                        </div>
                                    </div>
                                    <div class="text-right d-flex flex-column align-items-end">
                                        <p class="small mb-1 ${statusColor}" style="font-size: 0.85rem; font-weight: 600;">${item.stock} ${item.uom}</p>
                                        <span class="badge badge-pill ${badgeClass}" style="font-size: 7px; font-weight: 600; padding: 0.3rem 0.75rem; text-transform: uppercase;">${item.status}</span>
                                    </div>
                                </div>
                            `;
                        });
                        if(stockHtml === '') {
                            stockHtml = '<p class="text-muted small text-center py-4">All stock levels are healthy.</p>';
                        }
                        $('#low_stock_list').html(stockHtml);
                    }

                } catch(e) {
                    console.error("Error parsing stats data", e, data);
                }
            });
        }

        loadDashboardStats();

        function initChart() {
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
                    formatter: function(val) { return val.toLocaleString() + (val < 10 ? '' : '') }
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
                    categories: trendLabels,
                    labels: { 
                        style: { colors: '#64748b', fontSize: '10px', fontWeight: 600 }
                    },
                    axisBorder: { show: false },
                    axisTicks: { show: false }
                },
                yaxis: {
                    labels: { 
                        style: { colors: '#64748b', fontSize: '10px' },
                        formatter: function(val) { return val.toLocaleString() + (val < 10 ? '' : '') }
                    }
                },
                grid: { borderColor: '#f1f1f1', strokeDashArray: 4 },
                tooltip: { theme: 'light', x: { show: true } }
            };

            const milkChartEl = document.querySelector("#milkChart");
            if (milkChartEl) {
                chart = new ApexCharts(milkChartEl, options);
                chart.render();
            }
        }

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
            } else {
                chart.updateSeries([{
                    name: 'Milk Quality',
                    data: qualityData
                }]);
            }
        });
    });
    </script>

</body>
</html>
