function toggleActionMenu(event, btn) {
    event.stopPropagation();
    const dropdown = $(btn).next('.actions-dropdown');
    $('.actions-dropdown').not(dropdown).removeClass('show');
    dropdown.toggleClass('show');
}

$(document).ready(function() {
    let chart;
    let volumeData = [];
    let qualityData = [];
    let trendCategories = [];
    
    const chartElement = document.querySelector("#productionChart");
    if (chartElement) {
        var options = {
            series: [{
                name: 'Volume (L)',
                data: []
            }],
            chart: {
                type: 'area',
                height: 250,
                toolbar: { show: false },
                zoom: { enabled: false },
                fontFamily: 'Plus Jakarta Sans, sans-serif'
            },
            colors: ['#206223'], 
            dataLabels: { 
                enabled: true,
                offsetY: -10,
                style: { fontSize: '9px', colors: ['#206223'] }
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
            markers: { size: 4, colors: ['#206223'], strokeColors: '#fff', strokeWidth: 2 },
            xaxis: {
                categories: [],
                axisBorder: { show: false },
                axisTicks: { show: false },
                labels: { style: { colors: '#64748b', fontSize: '10px', fontWeight: 600 } }
            },
            yaxis: { show: false },
            grid: { borderColor: '#f1f1f1', strokeDashArray: 4 },
            annotations: {
                yaxis: [{
                    y: 1200,
                    borderColor: '#ba1a1a',
                    borderWidth: 1,
                    strokeDashArray: 4,
                    label: {
                        borderColor: '#ba1a1a',
                        style: { color: '#fff', background: '#ba1a1a', fontSize: '9px', fontWeight: 700 },
                        text: 'DAILY TARGET (1.2kL)'
                    }
                }]
            },
            tooltip: { theme: 'light' }
        };

        chart = new ApexCharts(chartElement, options);
        chart.render();

        $('.btn-chart-switcher').on('click', function() {
            $('.btn-chart-switcher').removeClass('active').css({'background': 'transparent', 'color': '#64748b'});
            $(this).addClass('active').css({'background': 'white', 'color': '#000'});
            
            var type = $(this).data('type');
            if(type === 'volume') {
                chart.updateSeries([{ name: 'Volume (L)', data: volumeData }]);
            } else {
                chart.updateSeries([{ name: 'Density (kg/L)', data: qualityData }]);
            }
        });
    }

    function loadMilkingSchedules() {
        $.get('../controllers/settingsoperations.php', { action: 'getmilkingschedules' }, (data) => {
            const schedules = JSON.parse(data);
            let html = '';
            let filterHtml = '<option value="">All Shifts</option>';
            const currentHour = new Date().getHours();
            let closestId = null;
            let minDiff = 24;

            schedules.forEach((sched) => {
                let scheduleHour = 0;
                if (sched.starttime) {
                    scheduleHour = parseInt(sched.starttime.split(':')[0]);
                } else {
                    const parts = sched.schedulename.split(' ');
                    scheduleHour = parseInt(parts[0]);
                    if (parts[1] === 'PM' && scheduleHour < 12) scheduleHour += 12;
                    if (parts[1] === 'AM' && scheduleHour === 12) scheduleHour = 0;
                }

                const diff = Math.abs(currentHour - scheduleHour);
                if (diff < minDiff) {
                    minDiff = diff;
                    closestId = sched.id;
                }

                html += `
                    <label class="schedule-option">
                        <input type="radio" name="milking_time" id="sched_${sched.id}" value="${sched.id}" style="display:none;">
                        <div class="schedule-card" style="padding: 1rem;">${sched.schedulename}</div>
                    </label>`;
                
                filterHtml += `<option value="${sched.schedulename}">${sched.schedulename}</option>`;
            });

            $('#milkingTimeGrid').html(html);
            $('#logShiftFilter').html(filterHtml);
            if (closestId) {
                $(`#sched_${closestId}`).prop('checked', true);
            }
        });
    }

    function loadProductionTrends() {
        $.get('../controllers/productionoperations.php', { 
            action: 'getproductiontrends'
        }, (data) => {
            const trends = JSON.parse(data);
            
            trendCategories = trends.map(t => {
                const date = new Date(t.date);
                const day = date.getDate().toString().padStart(2, '0');
                const month = date.toLocaleString('default', { month: 'short' });
                return `${day} ${month}`;
            });
            
            volumeData = trends.map(t => parseFloat(t.totalyield));
            qualityData = trends.map(t => {
                const val = parseFloat(t.avgdensity);
                return val > 0 ? parseFloat(val.toFixed(3)) : 0;
            });

            const currentType = $('.btn-chart-switcher.active').data('type') || 'volume';
            const activeData = currentType === 'volume' ? volumeData : qualityData;
            const activeName = currentType === 'volume' ? 'Volume (L)' : 'Density (kg/L)';

            if (chart) {
                chart.updateSeries([{
                    name: activeName,
                    data: activeData
                }]);
                chart.updateOptions({
                    xaxis: {
                        categories: trendCategories
                    }
                });
            }
        });
    }

    function loadProductionStats() {
        $.get('../controllers/productionoperations.php', { 
            action: 'getproductionstats'
        }, (data) => {
            const stats = JSON.parse(data)[0];
            
            // Total Yield & Trend
            const totalYield = parseFloat(stats.totalyield) || 0;
            const yesterdayYield = parseFloat(stats.yesterdayyield) || 0;
            $('#totalYieldCard').text(totalYield.toLocaleString() + ' L');

            let trendHtml = '0% from yesterday';
            if (yesterdayYield > 0) {
                const diff = totalYield - yesterdayYield;
                const perc = Math.abs(Math.round((diff / yesterdayYield) * 100));
                const icon = diff >= 0 ? 'trending_up' : 'trending_down';
                trendHtml = `<span class="material-symbols-outlined" style="font-size: 0.8rem; vertical-align: middle;">${icon}</span> ${perc}% from yesterday`;
            } else if (totalYield > 0) {
                trendHtml = `<span class="material-symbols-outlined" style="font-size: 0.8rem; vertical-align: middle;">trending_up</span> 100% from yesterday`;
            }
            $('#totalYieldTrend').html(trendHtml);
            
            // Cows Milked
            $('#cowsMilkedCard').text(stats.cowsmilked);
            const herdPerc = stats.totalherd > 0 ? Math.round((stats.cowsmilked / stats.totalherd) * 100) : 0;
            $('#cowsMilkedPerc').text(herdPerc + '% of total herd');
            
            // Avg Yield
            const avgyield = parseFloat(stats.avgyield) || 0;
            $('#avgYieldCard').text(avgyield.toFixed(1) + ' L');
            const progress = Math.min((avgyield / 30) * 100, 100); 
            $('#avgYieldProgress').css('width', progress + '%');
            $('#avgYieldStatus').text(avgyield > 25 ? 'Optimal' : 'Normal');
            
            // Avg Density
            const avgdensity = parseFloat(stats.avgdensity) || 0;
            $('#avgDensityCard').html(`${avgdensity.toFixed(3)} <small style="font-size: 0.8rem;">kg/L</small>`);
            
            if (avgdensity >= 1.028 && avgdensity <= 1.033) {
                $('#densityGradeTag').html('<span class="material-symbols-outlined" style="font-size: 1rem; font-variation-settings: \'FILL\' 1;">check_circle</span> GRADE A');
            } else if (avgdensity > 0) {
                $('#densityGradeTag').html('<span class="material-symbols-outlined" style="font-size: 1rem; font-variation-settings: \'FILL\' 1;">warning</span> REVIEW');
            } else {
                $('#densityGradeTag').html('<span class="material-symbols-outlined" style="font-size: 1rem; font-variation-settings: \'FILL\' 1;">info</span> NO DATA');
            }
        });
    }

    function loadProductionLogs() {
        $.get('../controllers/productionoperations.php', { 
            action: 'getproduction'
        }, (data) => {
            const logs = JSON.parse(data);
            let rows = '';
            logs.forEach(log => {
                const shiftClass = log.shiftname.toLowerCase().includes('morning') ? 'pill-morning' : 'pill-evening';
                
                // Format time nicely
                const timeParts = log.dateadded.split(' ')[1].split(':');
                const hour = parseInt(timeParts[0]);
                const ampm = hour >= 12 ? 'PM' : 'AM';
                const displayHour = hour % 12 || 12;
                const displayTime = `${displayHour}:${timeParts[1]} ${ampm}`;

                rows += `
                    <tr>
                        <td>
                            <div class="font-weight-bold smaller" style="font-size: 0.825rem;">${formatDate(log.logdate)}</div>
                            <div class="text-muted smaller" style="font-size: 0.65rem;">${displayTime}</div>
                        </td>
                        <td><span class="log-session-pill ${shiftClass}">${log.shiftname}</span></td>
                        <td><span class="font-weight-bold" style="font-size: 0.95rem;">${log.quantitylitres} L</span></td>
                        <td>
                            ${(() => {
                                const qty = parseFloat(log.quantitylitres);
                                let grade = 'Grade C';
                                let gradeClass = 'grade-c';
                                if (qty > 15) { grade = 'Grade A+'; gradeClass = 'grade-a'; }
                                else if (qty > 10) { grade = 'Grade A'; gradeClass = 'grade-a'; }
                                else if (qty > 5) { grade = 'Grade B'; gradeClass = 'grade-b'; }
                                return `<span class="log-grade-pill ${gradeClass}">${grade}</span>`;
                            })()}
                        </td>
                        <td>
                            <div class="d-flex align-items-center">
                                <img src="${log.profilephoto ? '../images/' + log.profilephoto : '../images/blankavatar.jpg'}" class="collector-avatar" data-alt="avatar">
                                <span class="smaller" style="font-weight: 400;">${log.collectorname}</span>
                            </div>
                        </td>
                        <td class="text-right">
                            <div class="actions-container">
                                <button class="btn-action-more" onclick="toggleActionMenu(event, this)">
                                    <span class="material-symbols-outlined">more_vert</span>
                                </button>
                                <div class="actions-dropdown botanical-shadow">
                                    <button class="action-menu-item"><span class="material-symbols-outlined">visibility</span> View Detail</button>
                                </div>
                            </div>
                        </td>
                    </tr>`;
            });
            
            if ($.fn.DataTable.isDataTable('#logDataTable')) {
                $('#logDataTable').DataTable().destroy();
            }
            
            $('#logDataTable tbody').html(rows);
            
            table = $('#logDataTable').DataTable({
                "pageLength": 10,
                "paging": true,
                "info": false,
                "responsive": true,
                "autoWidth": false,
                "order": [[0, "desc"]],
                "dom": 'Bfrt',
                "buttons": [
                    { extend: 'excel', className: 'btn btn-sm btn-light border-0 text-success font-weight-normal mx-1', text: '<span class="material-symbols-outlined" style="font-size:1rem; vertical-align:middle;">download</span> Excel' },
                    { extend: 'print', className: 'btn btn-sm btn-light border-0 text-muted font-weight-normal mx-1', text: '<span class="material-symbols-outlined" style="font-size:1rem; vertical-align:middle;">print</span> Print' }
                ]
            });
            updatePagination();
        });
    }

    // --- DataTable Initialization (Advanced Registry) ---
    let table;
    if ($('#logDataTable').length) {
        table = $('#logDataTable').DataTable({
            "pageLength": 10,
            "paging": true,
            "info": false,
            "responsive": true,
            "autoWidth": false,
            "columnDefs": [
                { "responsivePriority": 1, "targets": 0 }, 
                { "responsivePriority": 2, "targets": -1 },
                { "responsivePriority": 3, "targets": 2 },
                { "orderable": false, "targets": "no-sort" }
            ],
            "dom": 'Bfrt',
            "buttons": [
                { extend: 'excel', className: 'btn btn-sm btn-light border-0 text-success font-weight-normal mx-1', text: '<span class="material-symbols-outlined" style="font-size:1rem; vertical-align:middle;">download</span> Excel' },
                { extend: 'print', className: 'btn btn-sm btn-light border-0 text-muted font-weight-normal mx-1', text: '<span class="material-symbols-outlined" style="font-size:1rem; vertical-align:middle;">print</span> Print' }
            ]
        });

        table.buttons().container().appendTo('#logExportContainer');

        $("#logDateFilter").datepicker({
            dateFormat: "M d, yy",
            onSelect: function(dateText) { table.column(0).search(dateText).draw(); }
        });

        $('#logShiftFilter').on('change', function() { table.column(1).search(this.value).draw(); });
        $('#logSearch').on('keyup', function() { table.search(this.value).draw(); });

        // Custom Export Button Handlers
        $('#customExcelBtn').on('click', function() {
            table.button('.buttons-excel').trigger();
        });
        $('#customPrintBtn').on('click', function() {
            table.button('.buttons-print').trigger();
        });

        function updatePagination() {
            if (!table) return;
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
    }

    loadMilkingSchedules();
    getanimals($('#animal_id'), 'lactating');
    loadProductionLogs();
    loadProductionStats();
    loadProductionTrends();

    // FAB Click
    $('#logYieldFAB').on('click', function() {
        loadMilkingSchedules(); // Refresh closest time selection
        $('#logYieldModal').addClass('show');
        $('body').addClass('modal-open');
    });

    // Close Modal
    $('#closeModal, #discardModal, .modal-backdrop-blur').on('click', function() {
        $('#logYieldModal').removeClass('show');
        $('body').removeClass('modal-open');
    });

    // Save Record Action with Validation
    $('#saveProductionBtn').on('click', function() {
        // Clear previous notifications
        $('#modalNotifications').empty();

        // Validation Logic
        const animalId = $('#animal_id').val();
        const quantity = parseFloat($('#milk_quantity').val());
        const density = parseFloat($('#milk_density').val());
        const scheduleid = $('input[name="milking_time"]:checked').val();
        const narration = $('#milk_narration').val();

        let errorMessage = '';
        let focusField = null;

        if (!scheduleid) {
            errorMessage = 'Please select a milking session.';
        } else if (!animalId) {
            errorMessage = 'Please select an animal from the herd.';
            focusField = $('#animal_id');
        } else if (isNaN(quantity) || quantity <= 0) {
            errorMessage = 'Please enter a valid milking quantity.';
            focusField = $('#milk_quantity');
        } else if (isNaN(density) || density <= 0) {
            errorMessage = 'Please enter a valid milk density.';
            focusField = $('#milk_density');
        }

        if (errorMessage) {
            $('#modalNotifications').html(showAlert('info', errorMessage, 1));
            if (focusField) focusField.focus();
            return;
        }

        // API Call
        $('#modalNotifications').html(showAlert('processing', 'Processing production record...', 1));
        
        $.post('../controllers/productionoperations.php', {
            action: 'saveproduction',
            id: 0,
            animalid: animalId,
            scheduleid: scheduleid,
            quantity: quantity,
            density: density,
            narration: narration
        }, (response) => {
            const res = isJSON(response) ? JSON.parse(response) : response;
            if (res.status === 'success') {
                $('#modalNotifications').html(showAlert('success', 'Production record saved successfully!', 1));
                
                // Clear fields for next entry
                $('#animal_id').val('');
                $('#milk_quantity').val('');
                $('#milk_density').val('1.030');
                $('#milk_narration').val('');
                
                loadProductionLogs();
                loadProductionStats();
                loadProductionTrends();
                
                setTimeout(() => { $('#modalNotifications').empty(); }, 3000);
            } else {
                $('#modalNotifications').html(showAlert('error', res.message || 'Error saving record.', 1));
            }
        });
    });

    // --- Theme Toggle Listener for Chart ---
    $('#themeToggleBtn').on('click', function() {
        const isDark = $('body').hasClass('dark-theme');
        if (chart) {
            chart.updateOptions({
                chart: { theme: { mode: isDark ? 'dark' : 'light' } },
                grid: { borderColor: isDark ? '#30363d' : '#f1f1f1' },
                xaxis: { labels: { style: { colors: isDark ? '#8b949e' : '#64748b' } } }
            });
        }
    });

    $(window).on('click', function() { $('.actions-dropdown').removeClass('show'); });
});
