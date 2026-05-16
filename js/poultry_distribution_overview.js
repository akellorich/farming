/**
 * Jukam Poultry Management System - Poultry Distribution Logic
 * File: js/poultry_distribution_overview.js
 */

$(document).ready(function() {
    let trendChart;

    function initTrendChart(seriesData = [], categories = []) {
        const options = {
            series: [{
                name: 'Eggs Disbursed',
                data: seriesData.length ? seriesData : [0, 0, 0, 0, 0, 0, 0]
            }],
            chart: {
                height: 280,
                type: 'area',
                toolbar: { show: false },
                fontFamily: 'Manrope, sans-serif'
            },
            colors: ['#206223'],
            dataLabels: { enabled: false },
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
                categories: categories.length ? categories : ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                axisBorder: { show: false },
                axisTicks: { show: false }
            },
            yaxis: {
                labels: {
                    formatter: function(val) { return val.toLocaleString(); }
                }
            },
            grid: {
                borderColor: 'rgba(0,0,0,0.05)',
                strokeDashArray: 4
            }
        };

        if (trendChart) trendChart.destroy();
        trendChart = new ApexCharts(document.querySelector("#distributionTrendChart"), options);
        trendChart.render();
    }

    function loadStats() {
        $.getJSON("../controllers/poultrydistributionoperations.php?action=getstats", function(stats) {
            if (stats) {
                $("#totalDisbursedToday").text(stats.total_today.toLocaleString());
                $("#activeHubsCount").text(stats.total_points || 0);
                $("#peakHubName").text(stats.peak_hub || "No Data");
                $("#totalMonthlyVolume").text(stats.total_month.toLocaleString());
            }
        });
    }

    function loadTrends() {
        $.getJSON("../controllers/poultrydistributionoperations.php?action=gettrends", function(data) {
            const days = [];
            const dataMap = {};
            for (let i = 6; i >= 0; i--) {
                const date = new Date();
                date.setDate(date.getDate() - i);
                const label = date.toLocaleDateString('en-US', { weekday: 'short' });
                days.push(label);
                dataMap[label] = 0;
            }
            if (data && data.length > 0) {
                data.forEach(item => {
                    if (dataMap.hasOwnProperty(item.day_label)) {
                        dataMap[item.day_label] = parseInt(item.total_quantity);
                    }
                });
            }
            const seriesData = days.map(day => dataMap[day]);
            initTrendChart(seriesData, days);
        });
    }

    function loadMarketShare() {
        $.getJSON("../controllers/poultrydistributionoperations.php?action=getmarketshare", function(data) {
            const list = $("#hubMarketShareList");
            list.empty();
            if (data && data.length > 0) {
                const maxVol = Math.max(...data.map(item => parseInt(item.total_quantity)));
                data.forEach(item => {
                    const vol = parseInt(item.total_quantity);
                    const perc = (vol / maxVol) * 100;
                    const html = `
                        <div class="market-share-item">
                            <div class="market-share-header">
                                <span class="market-share-label">${item.pointname}</span>
                                <span class="market-share-value">${vol.toLocaleString()} Eggs</span>
                            </div>
                            <div class="market-share-bar-bg">
                                <div class="market-share-bar-fill" data-perc="${perc}"></div>
                            </div>
                        </div>
                    `;
                    list.append(html);
                });
                setTimeout(() => {
                    $(".market-share-bar-fill").each(function() {
                        $(this).css("width", $(this).data("perc") + "%");
                    });
                }, 100);
            } else {
                list.html('<div class="text-center py-5 text-muted small">No distribution data</div>');
            }
        });
    }

    function updatePagination(table) {
        const info = table.page.info();
        $('#pageInfo').text('Page ' + (info.page + 1) + ' of ' + info.pages);
        let html = '';
        for (let i = 0; i < info.pages; i++) {
            const activeClass = i === info.page ? 'active' : '';
            html += `<button class="page-btn ${activeClass}" data-page="${i}">${i + 1}</button>`;
        }
        $('#numberButtons').html(html);
    }

    function loadDisbursements() {
        const body = $("#disbursementBody");
        body.html('<tr><td colspan="7" class="text-center py-5"><div class="spinner-border text-success"></div></td></tr>');

        $.getJSON("../controllers/poultrydistributionoperations.php?action=getdisbursements", function(data) {
            body.empty();
            if (data && data.length > 0) {
                data.forEach(item => {
                    body.append(`
                        <tr class="border-bottom">
                            <td></td>
                            <td class="py-3">
                                <div class="font-weight-bold" style="font-size: 13px;">${item.disbursementdate}</div>
                                <div class="text-muted small">${new Date(item.dateadded).toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'})}</div>
                            </td>
                            <td class="py-3">
                                <span class="badge badge-light px-3 py-2" style="color: #206223; font-weight: 600;">${item.pointname}</span>
                            </td>
                            <td class="py-3 font-weight-bold">${parseInt(item.quantity).toLocaleString()} Eggs</td>
                            <td class="py-3">${item.collectorname || "N/A"}</td>
                            <td class="py-3 text-muted small">${item.batchnumber || "-"}</td>
                            <td class="py-3 text-right">
                                <div class="dropdown">
                                    <button class="btn btn-link text-muted p-0" data-toggle="dropdown">
                                        <span class="material-symbols-outlined" style="font-size: 20px;">more_vert</span>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                                        <a class="action-item edit-disbursement" href="javascript:void(0)" data-record='${JSON.stringify(item)}'>
                                            <span class="material-symbols-outlined text-success" style="font-size: 18px;">edit</span> Edit
                                        </a>
                                        <a class="action-item text-danger delete-disbursement" href="javascript:void(0)" data-id="${item.disbursementid}">
                                            <span class="material-symbols-outlined" style="font-size: 18px;">delete</span> Delete
                                        </a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    `);
                });

                if ($.fn.DataTable.isDataTable('#disbursementTable')) {
                    $('#disbursementTable').DataTable().destroy();
                }
                const table = $('#disbursementTable').DataTable({
                    pageLength: 10,
                    order: [[1, 'desc']],
                    dom: 't',
                    responsive: { details: { type: 'column', target: 0 } },
                    columnDefs: [
                        { className: 'dtr-control', orderable: false, targets: 0 },
                        { responsivePriority: 1, targets: [1, 2, 3, 6] }
                    ]
                });
                updatePagination(table);
                $('#numberButtons').on('click', '.page-btn', function() {
                    table.page($(this).data('page')).draw('page');
                    updatePagination(table);
                });
                $('#disburseSearch').on('keyup', function() {
                    table.search(this.value).draw();
                    updatePagination(table);
                });
            } else {
                body.html('<tr><td colspan="7" class="text-center py-5 text-muted">No data found.</td></tr>');
            }
        });
    }

    function loadPointsDropdown(callback) {
        $.getJSON("../controllers/poultrydistributionoperations.php?action=getpoints", function(points) {
            const select = $("#disbursePoint");
            select.html('<option value="" selected disabled>Select Hub</option>');
            if (points) {
                points.forEach(p => select.append(`<option value="${p.pointid}">${p.pointname}</option>`));
            }
            if (callback) callback();
        });
    }

    $("#addDisbursementBtn").on("click", function() {
        loadPointsDropdown();
        $("#disburseId").val(0);
        $("#disbursementForm")[0].reset();
        $("#addDisbursementModal").find("h4").text("New Egg Disbursement");
        $("#addDisbursementModal").modal("show");
    });

    $(document).on("click", ".edit-disbursement", function() {
        const record = $(this).data("record");
        loadPointsDropdown(() => {
            $("#disburseId").val(record.disbursementid);
            $("#disbursePoint").val(record.pointid);
            $("#disburseQuantity").val(record.quantity);
            $("#disburseRef").val(record.batchnumber);
            $("#disburseCollector").val(record.collectorname);
            
            $("#addDisbursementModal").find("h4").text("Edit Egg Disbursement");
            $("#addDisbursementModal").modal("show");
        });
    });

    $("#saveDisbursementBtn").on("click", function() {
        const pointid = $("#disbursePoint").val();
        const quantity = $("#disburseQuantity").val();
        const collector = $("#disburseCollector").val();
        const ref = $("#disburseRef").val();

        if (!pointid || !quantity) return alert("Fill all fields");

        $.post("../controllers/poultrydistributionoperations.php", {
            action: "savedisbursement",
            id: $("#disburseId").val(),
            pointid: pointid,
            quantity: quantity,
            collector: collector,
            batch: ref
        }, function(res) {
            $("#addDisbursementModal").modal("hide");
            loadStats();
            loadDisbursements();
            loadTrends();
            loadMarketShare();
        });
    });

    $(document).on("click", ".delete-disbursement", function() {
        if (!confirm("Delete this record?")) return;
        $.post("../controllers/poultrydistributionoperations.php", {
            action: "deletedisbursement",
            id: $(this).data("id")
        }, function() {
            loadDisbursements();
            loadStats();
        });
    });

    // Initial Load
    loadStats();
    loadDisbursements();
    loadTrends();
    loadMarketShare();
    initTrendChart();
});
