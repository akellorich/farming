/**
 * Jukam Dairy - Health Records Module Scripting
 * File: js/health.js
 */

function toggleActionMenu(event, btn) {
    event.stopPropagation();
    const dropdown = $(btn).next('.actions-dropdown');
    $('.actions-dropdown').not(dropdown).removeClass('show');
    dropdown.toggleClass('show');
}

$(document).ready(function() {
    // --- UI Elements ---
    const $healthDataTable = $('#healthDataTable');
    
    // --- Filter Elements ---
    const $animalFilter = $('#animalFilter');
    const $conditionFilter = $('#conditionFilter');
    const $statusFilter = $('#statusFilter');
    const $healthSearch = $('#healthSearch');
    const $refreshFiltersBtn = $('#refreshFilters');
    const $dateRangeFilter = $('#dateRangeFilter');
    
    // --- Modal Elements ---
    const $healthRecordModal = $('#healthRecordModal');
    const $healthLogForm = $('#healthLogForm');
    const $healthModalAlert = $('#healthModalAlert');
    const $btnSaveHealthRecord = $('#btnSaveHealthRecord');
    const $btnLogHealthCheck = $('#btnLogHealthCheck');
    const $closeModalBtn = $('#closeHealthModal, #closeHealthModalMobile, #cancelHealthModal');
    
    // --- Form Field Elements ---
    const $animalId = $('#animalid');
    const $diseaseId = $('#diseaseid');
    const $logDate = $('#logdate');
    const $diagnosis = $('#diagnosis');
    const $treatment = $('#treatment');
    const $narration = $('#narration');
    const $veterinarianId = $('#veterinarianid');
    const $nextFollowup = $('#nextfollowup');
    const getStatus = () => $('input[name="status"]:checked').val();

    // --- State Management ---
    let currentTab = 'health';
    let table = null;

    // Initialize DataTable
    function initDataTable(tab, columns) {
        const tableId = tab === 'health' ? '#healthDataTable' : `#${tab}DataTable`;
        const $targetTable = $(tableId);

        if ($.fn.DataTable.isDataTable(tableId)) {
            $targetTable.DataTable().destroy();
        }
        
        $targetTable.find('thead').empty();
        $targetTable.find('tbody').empty();

        const dtColumns = columns.map(col => ({
            title: col.title,
            data: col.data,
            className: col.class || '',
            defaultContent: '',
            render: col.render || null,
            responsivePriority: col.responsivePriority || 10000,
            priority: col.responsivePriority || 10000
        }));
        
        // Add Action column
        dtColumns.push({
            title: 'Action',
            data: null,
            className: 'text-right all',
            orderable: false,
            responsivePriority: 0, // Highest priority for Actions
            priority: 0,
            defaultContent: '',
            render: function(data, type, row) {
                return renderActionMenu(row.id);
            }
        });

        table = $targetTable.DataTable({
            "columns": dtColumns,
            "columnDefs": dtColumns.map((col, index) => ({
                "targets": index,
                "responsivePriority": col.responsivePriority || 10000
            })),
            "pageLength": 5,
            "paging": true,
            "info": false,
            "searching": true,
            "lengthChange": false,
            "responsive": true,
            "autoWidth": false,
            "dom": 'rt',
            "language": {
                "paginate": {
                    "previous": "",
                    "next": ""
                }
            }
        });

        updatePagination();
    }

    function renderActionMenu(id) {
        return `
            <div class="actions-container">
                <button class="btn-action-more" onclick="toggleActionMenu(event, this)">
                    <span class="material-symbols-outlined">more_vert</span>
                </button>
                <div class="actions-dropdown botanical-shadow">
                    <button class="action-menu-item"><span class="material-symbols-outlined">visibility</span> View Record</button>
                    ${currentTab === 'health' ? `<button class="action-menu-item"><span class="material-symbols-outlined">edit</span> Edit Incident</button>` : ''}
                    <div class="dropdown-divider my-1"></div>
                    <button class="action-menu-item text-danger"><span class="material-symbols-outlined">delete</span> Delete</button>
                </div>
            </div>
        `;
    }

    function populateTable(data) {
        table.clear();
        table.rows.add(data);
        table.draw();
        updatePagination();
    }

    function fetchTabData(tab) {
        currentTab = tab;
        const tableId = tab === 'health' ? '#healthDataTable' : `#${tab}DataTable`;
        const $targetTable = $(tableId);

        // Clear existing table if any before showing loader
        if ($.fn.DataTable.isDataTable(tableId)) {
            $targetTable.DataTable().destroy();
        }
        
        $targetTable.find('tbody').html('<tr><td colspan="7" class="text-center py-5"><div class="spinner-border text-primary" role="status"></div></td></tr>');
        $targetTable.find('thead').empty();

        let url = '';
        let action = '';
        let columns = [];

        if (tab === 'health') {
            url = '../controllers/healthoperations.php';
            action = 'gethealthlogs';
            columns = [
                { title: 'Name', data: 'animalname', responsivePriority: 1, class: 'all' },
                { title: 'Date', data: 'logdate', responsivePriority: 2, class: 'all' },
                { title: 'Animal ID', data: 'tagid', class: 'animal-code-cell min-tablet', responsivePriority: 10000 },
                { title: 'Condition', data: 'diseasename', responsivePriority: 4, class: 'min-tablet' },
                { title: 'Treatment', data: 'treatment', responsivePriority: 10000, class: 'min-tablet' },
                { title: 'Status', data: 'status', responsivePriority: 5, class: 'all', render: (data) => `<span class="health-status-badge status-${(data || 'Completed').toLowerCase()}">${data || 'Completed'}</span>` }
            ];
            $('#tabTitle').text('Recent Health Incidents');
        } else if (tab === 'vaccinations') {
            url = '../controllers/treatmentoperations.php';
            action = 'getvaccinationhistory';
            columns = [
                { title: 'Name', data: 'animalname', responsivePriority: 1, class: 'all' },
                { title: 'Date', data: 'vaccinationdate', responsivePriority: 2, class: 'all' },
                { title: 'Animal ID', data: 'tagid', class: 'animal-code-cell min-tablet', responsivePriority: 10000 },
                { title: 'Disease', data: 'diseasename', responsivePriority: 4, class: 'min-tablet' },
                { title: 'Product', data: 'productused', responsivePriority: 10000, class: 'min-tablet' },
                { title: 'Batch', data: 'batchno', responsivePriority: 10000, class: 'min-tablet' },
                { title: 'Status', data: 'status', responsivePriority: 5, class: 'all', render: () => `<span class="health-status-badge status-completed">Completed</span>` }
            ];
            $('#tabTitle').text('Vaccination History');
        } else if (tab === 'deworming') {
            url = '../controllers/treatmentoperations.php';
            action = 'getdeworminghistory';
            columns = [
                { title: 'Name', data: 'animalname', responsivePriority: 1, class: 'all' },
                { title: 'Date', data: 'dewormingdate', responsivePriority: 2, class: 'all' },
                { title: 'Animal ID', data: 'tagid', class: 'animal-code-cell min-tablet', responsivePriority: 10000 },
                { title: 'Product', data: 'productused', responsivePriority: 5, class: 'min-tablet' },
                { title: 'Method', data: 'method', responsivePriority: 10000, class: 'min-tablet' },
                { title: 'Status', data: 'status', responsivePriority: 4, class: 'all', render: () => `<span class="health-status-badge status-completed">Completed</span>` }
            ];
            $('#tabTitle').text('Deworming History');
        }

        initDataTable(tab, columns);

        $.getJSON(url, { action: action }, function(data) {
            populateTable(data);
        });

        fetchUpcomingFollowups();
        fetchHealthSummary();
        
        if (tab === 'vaccinations') {
            fetchVaccinationSummary();
            fetchUpcomingVaccinations();
            const vaccineAnimalFilter = $('#vaccineAnimalFilter');
            getanimals(vaccineAnimalFilter, 'all', 'All Animals');
            fetchVaccineTypes();
        } else if (tab === 'deworming') {
            fetchDewormingSummary();
            fetchUpcomingDeworming();
        }
    }

    function fetchVaccineTypes() {
        $.getJSON('../controllers/treatmentoperations.php', { action: 'getdistinctvaccines' }, function(data) {
            const $filter = $('#vaccineTypeFilter');
            $filter.html('<option value="">All Vaccines</option>');
            if (data && data.length > 0) {
                data.forEach(item => {
                    $filter.append(`<option value="${item.product}">${item.product}</option>`);
                });
            }
        });
    }

    function fetchHealthSummary() {
        $.getJSON('../controllers/healthoperations.php', { action: 'gethealthsummary' }, function(data) {
            if (data && data.length > 0) {
                const summary = data[0];
                $('#activeTreatmentsCount').html(`${summary.active_treatments} <small class="text-muted" style="font-size: 0.8rem;">animals</small>`);
                $('#activeConditionsCount').html(`${String(summary.active_conditions).padStart(2, '0')} <small class="text-muted" style="font-size: 0.8rem;">types</small>`);
                $('#quarantineCasesCount').html(`${String(summary.quarantine_cases).padStart(2, '0')} <small class="text-muted" style="font-size: 0.8rem;">animals</small>`);
                
                if (summary.next_vet_visit) {
                    const date = new Date(summary.next_vet_visit);
                    $('#nextVetVisitDate').text(date.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' }));
                } else {
                    $('#nextVetVisitDate').text('None');
                }
            }
        });
    }

    function fetchVaccinationSummary() {
        $.getJSON('../controllers/treatmentoperations.php', { action: 'getvaccinationsummary' }, function(data) {
            if (data && data.length > 0) {
                const summary = data[0];
                $('#herdImmunityCount').text(`${parseFloat(summary.herd_immunity || 0).toFixed(1)}%`);
                $('#vaccinesCompletedMonth').html(`${summary.completed_month || 0} <small class="text-muted" style="font-size: 0.8rem;">animals</small>`);
                $('#vaccinesOverdueCount').html(`${summary.overdue || 0} <small class="text-muted" style="font-size: 0.8rem;">animals</small>`);
                
                if (summary.next_batch) {
                    const date = new Date(summary.next_batch);
                    $('#nextVaccineBatchDate').text(date.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' }));
                } else {
                    $('#nextVaccineBatchDate').text('None');
                }
            }
        });
    }

    function fetchUpcomingVaccinations() {
        const $container = $('#upcomingVaccinationsContainer');
        $.getJSON('../controllers/treatmentoperations.php', { action: 'getupcomingvaccinations' }, function(data) {
            if (!data || data.length === 0) {
                $container.html('<div class="text-center py-4 text-muted small">No upcoming vaccinations.</div>');
                return;
            }

            let html = '';
            data.forEach(item => {
                const date = new Date(item.scheduledate);
                const day = date.getDate();
                const month = date.toLocaleString('default', { month: 'short' });
                
                html += `
                    <div class="d-flex align-items-start gap-4 pb-3 border-bottom mb-3">
                        <div class="calendar-date-box date-box-active">
                            <span class="d-block" style="font-size: 0.55rem; text-transform: uppercase; font-weight: 500;">${month}</span>
                            <span class="d-block" style="font-size: 1.1rem; font-weight: 600;">${day}</span>
                        </div>
                        <div class="pl-2">
                            <p class="font-weight-bold mb-0" style="font-size: 0.75rem;">${item.vaccine_name}</p>
                            <p class="text-muted mb-0" style="font-size: 0.65rem;">Target: ${item.penname || 'All Pens'}</p>
                            <p class="text-primary mb-0" style="font-size: 0.6rem; font-weight: 600;">Status: Scheduled</p>
                        </div>
                    </div>
                `;
            });
            $container.html(html);
        });
    }

    function fetchDewormingSummary() {
        $.getJSON('../controllers/treatmentoperations.php', { action: 'getdewormingsummary' }, function(data) {
            if (data && data.length > 0) {
                const summary = data[0];
                $('#dewormingCoverageCount').text(`${parseFloat(summary.herd_coverage || 0).toFixed(1)}%`);
                $('#dewormingCompletedMonth').html(`${summary.completed_month || 0} <small class="text-muted" style="font-size: 0.8rem;">animals</small>`);
                $('#dewormingOverdueCount').html(`${summary.overdue || 0} <small class="text-muted" style="font-size: 0.8rem;">animals</small>`);
                
                if (summary.next_batch) {
                    const date = new Date(summary.next_batch);
                    $('#nextDewormingBatchDate').text(date.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' }));
                } else {
                    $('#nextDewormingBatchDate').text('None');
                }
            }
        });
    }

    function fetchUpcomingDeworming() {
        const $container = $('#upcomingDewormingContainer');
        $.getJSON('../controllers/treatmentoperations.php', { action: 'getupcomingdeworming' }, function(data) {
            if (!data || data.length === 0) {
                $container.html('<div class="text-center py-4 text-muted small">No upcoming deworming.</div>');
                return;
            }

            let html = '';
            data.forEach(item => {
                const date = new Date(item.scheduledate);
                const day = date.getDate();
                const month = date.toLocaleString('default', { month: 'short' });
                
                html += `
                    <div class="d-flex align-items-start gap-4 pb-3 border-bottom mb-3">
                        <div class="calendar-date-box date-box-active" style="background: rgba(217, 119, 6, 0.1); color: #d97706;">
                            <span class="d-block" style="font-size: 0.55rem; text-transform: uppercase; font-weight: 500;">${month}</span>
                            <span class="d-block" style="font-size: 1.1rem; font-weight: 600;">${day}</span>
                        </div>
                        <div class="pl-2">
                            <p class="font-weight-bold mb-0" style="font-size: 0.75rem;">${item.schedulename}</p>
                            <p class="text-muted mb-0" style="font-size: 0.65rem;">Target: ${item.penname || 'All Pens'}</p>
                            <p class="text-warning mb-0" style="font-size: 0.6rem; font-weight: 600;">Status: Scheduled</p>
                        </div>
                    </div>
                `;
            });
            $container.html(html);
        });
    }

    function fetchUpcomingFollowups() {
        const $container = $('#upcomingFollowupsContainer');
        $.getJSON('../controllers/healthoperations.php', { action: 'getupcomingfollowups' }, function(data) {
            if (!data || data.length === 0) {
                $container.html('<div class="text-center py-4 text-muted small">No upcoming follow-ups.</div>');
                return;
            }

            let html = '';
            data.forEach(item => {
                const date = new Date(item.nextfollowup);
                const day = date.getDate();
                const month = date.toLocaleString('default', { month: 'short' });
                
                html += `
                    <div class="d-flex align-items-start gap-4 pb-3 border-bottom mb-3">
                        <div class="calendar-date-box date-box-active">
                            <span class="d-block" style="font-size: 0.55rem; text-transform: uppercase; font-weight: 500;">${month}</span>
                            <span class="d-block" style="font-size: 1.1rem; font-weight: 600;">${day}</span>
                        </div>
                        <div class="pl-2">
                            <p class="font-weight-bold mb-0" style="font-size: 0.75rem;">${item.tagid} (${item.animalname})</p>
                            <p class="text-muted mb-0" style="font-size: 0.65rem;">Follow-up: ${item.diseasename || 'Check-up'}</p>
                            <p class="text-primary mb-0" style="font-size: 0.6rem; font-weight: 600;">${item.treatment.substring(0, 40)}${item.treatment.length > 40 ? '...' : ''}</p>
                        </div>
                    </div>
                `;
            });
            $container.html(html);
        });
    }

    function updatePagination() {
        if (!table) return;
        const info = table.page.info();
        const tableId = currentTab === 'health' ? '#healthDataTable' : `#${currentTab}DataTable`;
        const $card = $(tableId).closest('.health-table-card');
        
        $card.find('.page-info-display').text('Page ' + (info.page + 1) + ' of ' + info.pages);
        
        let html = '';
        const currentPage = info.page;
        const totalPages = info.pages;
        const maxVisible = 1; // Number of pages to show before/after current

        if (totalPages <= 5) {
            // Show all pages if total is 5 or less
            for (let i = 0; i < totalPages; i++) {
                const activeClass = i === currentPage ? 'active' : '';
                html += `<button class="page-btn ${activeClass}" data-page="${i}">${i + 1}</button>`;
            }
        } else {
            // Always show first page
            html += `<button class="page-btn ${currentPage === 0 ? 'active' : ''}" data-page="0">1</button>`;

            // Show leading ellipsis if current page is far from start
            if (currentPage > maxVisible + 1) {
                html += `<span class="px-1 text-muted align-self-center small" style="font-size: 0.75rem;">...</span>`;
            }

            // Show pages around current page
            const start = Math.max(1, currentPage - maxVisible);
            const end = Math.min(totalPages - 2, currentPage + maxVisible);

            for (let i = start; i <= end; i++) {
                const activeClass = i === currentPage ? 'active' : '';
                html += `<button class="page-btn ${activeClass}" data-page="${i}">${i + 1}</button>`;
            }

            // Show trailing ellipsis if current page is far from end
            if (currentPage < totalPages - maxVisible - 2) {
                html += `<span class="px-1 text-muted align-self-center small" style="font-size: 0.75rem;">...</span>`;
            }

            // Always show last page
            html += `<button class="page-btn ${currentPage === totalPages - 1 ? 'active' : ''}" data-page="${totalPages - 1}">${totalPages}</button>`;
        }

        $card.find('.number-buttons-container').html(html);
        
        $card.find('.prev-page-btn').prop('disabled', info.page === 0);
        $card.find('.next-page-btn').prop('disabled', info.page >= info.pages - 1);
    }

    $(document).on('click', '.pagination-container .page-btn', function() {
        table.page($(this).data('page')).draw('page');
        updatePagination();
    });

    $(document).on('click', '.prev-page-btn', function() {
        table.page('previous').draw('page');
        updatePagination();
    });

    $(document).on('click', '.next-page-btn', function() {
        table.page('next').draw('page');
        updatePagination();
    });

    // Tab Event Listeners
    $('.health-tab').on('click', function() {
        const tab = $(this).data('tab');
        $('.health-tab').removeClass('active');
        $(this).addClass('active');
        
        // Toggle Content Visibility
        $('.tab-pane-content').hide();
        $(`#tabContent-${tab}`).show();
        
        currentTab = tab;
        fetchTabData(tab);
    });

    // Filter Event Listeners
    $animalFilter.on('change', function() {
        table.column(0).search(this.value).draw();
        updatePagination();
    });

    $conditionFilter.on('change', function() {
        table.column(3).search(this.value).draw();
        updatePagination();
    });

    $statusFilter.on('change', function() {
        table.column(5).search(this.value).draw();
        updatePagination();
    });

    $healthSearch.on('keyup', function() {
        table.search(this.value).draw();
        updatePagination();
    });

    // Reset Filters
    $refreshFiltersBtn.on('click', function() {
        $animalFilter.add($conditionFilter).add($dateRangeFilter).add($statusFilter).val('');
        $healthSearch.val('');
        table.search('').columns().search('').draw();
        updatePagination();
    });

    // Date Range Filtering Logic (Mock)
    $dateRangeFilter.on('change', function() {
        // Mock filter trigger
        table.draw();
        updatePagination();
    });

    // Initial Load
    fetchTabData('health');
    getanimals($animalFilter, 'all', 'all');

    // Close actions dropdown when clicking outside
    $(document).on('click', function(e) {
        if (!$(e.target).closest('.actions-container').length) {
            $('.actions-dropdown').removeClass('show');
        }
    });

    // Modal Handlers
    function openHealthModal() {
        $healthRecordModal.addClass('show');
        $('.main-content, .sidebar, .top-header').addClass('modal-blur');
        
        // Initialize Datepicker
        setDatePicker($logDate, true);
        setDatePicker($nextFollowup, false, true);

        // Load animals, diseases and veterinarians
        getanimals($animalId);
        getdiseases($diseaseId);
        getveterinariansselect($veterinarianId);
    }

    function closeHealthModal() {
        $healthRecordModal.removeClass('show');
        $('.main-content, .sidebar, .top-header').removeClass('modal-blur');
        $healthLogForm[0].reset();
        $healthModalAlert.hide().html('');
    }

    $btnLogHealthCheck.add('#btnOpenClinicalModal').on('click', function(e) {
        e.preventDefault();
        openHealthModal();
    });

    $closeModalBtn.on('click', function() {
        closeHealthModal();
    });

    /* 
    // Close modal when clicking outside (Disabled as per user request to make it undismissable)
    $healthRecordModal.on('click', function(e) {
        if ($(e.target).hasClass('modal-overlay')) {
            closeHealthModal();
        }
    });
    */

    // Form Submission & Validation
    $healthLogForm.on('submit', function(e) {
        e.preventDefault();
        
        $healthModalAlert.hide().html('');

        // Separate field validation
        const animalid = $animalId.val();
        const diseaseid = $diseaseId.val();
        const logdate = $logDate.val();
        const diagnosis = $diagnosis.val().trim();
        const treatment = $treatment.val().trim();
        const narration = $narration.val().trim();
        const status = getStatus();
        const veterinarianid = $veterinarianId.val();
        const nextfollowup = $nextFollowup.val();

        if (!animalid) {
            $healthModalAlert.html(showAlert('info', "Please select an animal from the herd.", 1)).fadeIn();
            $animalId.focus();
            return;
        }
        if (!diseaseid) {
            $healthModalAlert.html(showAlert('info', "Please select a disease or condition.", 1)).fadeIn();
            $diseaseId.focus();
            return;
        }
        if (!veterinarianid) {
            $healthModalAlert.html(showAlert('info', "Please select an attending veterinarian.", 1)).fadeIn();
            $veterinarianId.focus();
            return;
        }
        if (!logdate) {
            $healthModalAlert.html(showAlert('info', "Please provide the check date.", 1)).fadeIn();
            $logDate.focus();
            return;
        }
        if (!diagnosis) {
            $healthModalAlert.html(showAlert('info', "Please provide a diagnosis or disease narration.", 1)).fadeIn();
            $diagnosis.focus();
            return;
        }
        if (!treatment) {
            $healthModalAlert.html(showAlert('info', "Please provide medication details.", 1)).fadeIn();
            $treatment.focus();
            return;
        }
        if (!narration) {
            $healthModalAlert.html(showAlert('info', "Please provide the treatment response/prognosis.", 1)).fadeIn();
            $narration.focus();
            return;
        }

        // If all fields are OK, save to database
        const originalText = $btnSaveHealthRecord.text();
        $btnSaveHealthRecord.prop('disabled', true).text('Saving...');

        $.post('../controllers/healthoperations.php', {
            savehealthlog: true,
            id: 0,
            animalid: animalid,
            diseaseid: diseaseid,
            logdate: logdate,
            diagnosis: diagnosis,
            treatment: treatment,
            narration: narration,
            status: status,
            veterinarianid: veterinarianid,
            nextfollowup: nextfollowup
        }, function(response) {
            $btnSaveHealthRecord.prop('disabled', false).text(originalText);
            try {
                const res = JSON.parse(response);
                if (res.status === 'success') {
                    showAlert('success', res.message);
                    
                    // Clear the fields for the next entry
                    $animalId.val('').trigger('change');
                    $diseaseId.val('').trigger('change');
                    $diagnosis.val('');
                    $treatment.val('');
                    $narration.val('');
                    $nextFollowup.val('');
                    $veterinarianId.val('').trigger('change');
                    
                    // Note: We don't clear logdate as it might be the same for next entry
                } else {
                    $healthModalAlert.html(showAlert('danger', res.message, 1)).fadeIn();
                }
            } catch (err) {
                $healthModalAlert.html(showAlert('danger', 'System error occurred while saving.', 1)).fadeIn();
            }
        });
    });

    // --- Shared Helper for Animal Checklist Rendering ---
    function renderAnimalChecklist($container, animals, prefix) {
        if (!animals || animals.length === 0) {
            $container.html('<div class="col text-center py-4 text-muted small w-100">No animals found for this selection.</div>');
            return;
        }
        
        let html = '';
        animals.forEach(a => {
            const checkId = `${prefix}_chk_${a.id}`;
            html += `
                <div class="col-md-6">
                    <div class="animal-check-card">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input animal-checkbox" id="${checkId}" value="${a.id}" checked>
                            <label class="custom-control-label" for="${checkId}"></label>
                        </div>
                        <div class="flex-grow-1">
                            <div class="font-weight-bold" style="font-size: 0.75rem; color: #1e293b; line-height: 1.1;">${a.tagid}</div>
                            <div class="text-muted small" style="font-size: 0.65rem; line-height: 1.1;">${a.designatedname || 'Unnamed'}</div>
                        </div>
                        <span class="badge badge-pill badge-light text-muted small px-2 py-1" style="background: #f1f5f9; font-weight: 500; font-size: 0.6rem;">${a.penname}</span>
                    </div>
                </div>`;
        });
        $container.html(html);
    }

    // --- Recording Vaccination Logic ---
    $('#btnRecordVaccination, #btnOpenVaccinationModal').on('click', function() {
        const $modal = $('#recordVaccinationModal');
        const $form = $('#recordVaccinationForm');
        $form[0].reset();
        
        // Clear notifications
        $('#rv_alert_container').addClass('d-none').empty();
        $form.find('.is-invalid').removeClass('is-invalid');
        
        // Reset Select All checkbox
        $modal.find('#rv_select_all').prop('checked', true);
        
        // Reset UI
        $('.rv-type-label').removeClass('active').css('color', '#64748b');
        $('.rv-type-label:first').addClass('active').css('color', '#166534');
        $('#rv_scheduleid').prop('disabled', true).html('<option value="0">Choose from schedules...</option>');
        
        setDatePicker($('#rv_date'), true);
        getveterinariansselect($('#rv_administered_by'));
        getdiseases($('#rv_diseaseid'));
        
        $.getJSON("../controllers/treatmentoperations.php", { action: 'getanimalsbyschedule', scheduleid: 0, type: 'vaccination' }, (data) => {
            renderAnimalChecklist($('#rv_animal_list'), data, 'rv');
        });
        
        $modal.fadeIn().css('display', 'flex');
        $('.main-content, .sidebar, .top-header').addClass('modal-blur');
    });

    // --- Recording Deworming Logic ---
    $('#btnRecordDeworming, #btnOpenDewormingModal').on('click', function() {
        const $modal = $('#recordDewormingModal');
        const $form = $('#recordDewormingForm');
        $form[0].reset();
        
        // Clear notifications
        $('#rd_alert_container').addClass('d-none').empty();
        $form.find('.is-invalid').removeClass('is-invalid');

        // Reset Select All checkbox
        $modal.find('#rd_select_all').prop('checked', true);
        
        // Reset UI
        $('.rd-type-label').removeClass('active').css('color', '#64748b');
        $('.rd-type-label:first').addClass('active').css('color', '#d97706');
        $('#rd_scheduleid').prop('disabled', true).html('<option value="0">Choose from schedules...</option>');
        
        setDatePicker($('#rd_date'), true);
        getveterinariansselect($('#rd_administered_by'));
        
        $.getJSON("../controllers/treatmentoperations.php", { action: 'getanimalsbyschedule', scheduleid: 0, type: 'deworming' }, (data) => {
            renderAnimalChecklist($('#rd_animal_list'), data, 'rd');
        });
        
        $modal.fadeIn().css('display', 'flex');
        $('.main-content, .sidebar, .top-header').addClass('modal-blur');
    });

    // --- Unified Logic for Type Toggles & Schedule Selection ---
    $(document).on('change', 'input[name="record_type"]', function() {
        const $form = $(this).closest('form');
        const isVac = $form.attr('id') === 'recordVaccinationForm';
        const prefix = isVac ? 'rv' : 'rd';
        const color = isVac ? '#166534' : '#d97706';
        const type = $(this).val();
        const isScheduled = type === 'Scheduled';
        const $scheduleSelect = $form.find(`select[name="scheduleid"]`);
        const $labels = $form.find(`.${prefix}-type-label`);
        
        $labels.removeClass('active').css('color', '#64748b');
        $(this).closest('label').addClass('active').css('color', color);
        
        $scheduleSelect.prop('disabled', !isScheduled);
        
        if (isVac) {
            $form.find(`#rv_diseaseid`).prop('disabled', isScheduled).val('');
        }
        
        if (isScheduled) {
            $.getJSON("../controllers/treatmentoperations.php", { action: 'getschedules', type: isVac ? 'vaccination' : 'deworming' }, (data) => {
                let html = '<option value="">Choose from schedules...</option>';
                data.forEach(s => {
                    html += `<option value="${s.id}" data-disease="${s.diseaseid || ''}">${s.title} (${s.scheduledate})</option>`;
                });
                $scheduleSelect.html(html);
                // Clear animals list when switched to scheduled, until one is chosen
                $form.find(`#${prefix}_animal_list`).html('<div class="col text-center py-4 text-muted small w-100">Please select a schedule to load animals.</div>');
            });
        } else {
            $scheduleSelect.html('<option value="0">Routine (All Animals)</option>').val(0);
            $.getJSON("../controllers/treatmentoperations.php", { action: 'getanimalsbyschedule', scheduleid: 0, type: isVac ? 'vaccination' : 'deworming' }, (data) => {
                renderAnimalChecklist($form.find(`#${prefix}_animal_list`), data, prefix);
            });
        }
    });

    // --- Handle Schedule Selection to Auto-fill Disease ---
    $('#rv_scheduleid').on('change', function() {
        const diseaseId = $(this).find('option:selected').data('disease');
        if (diseaseId) {
            $('#rv_diseaseid').val(diseaseId).prop('disabled', true);
        } else {
            $('#rv_diseaseid').val('').prop('disabled', false);
        }
        
        const scheduleId = $(this).val();
        if (scheduleId && scheduleId != '0') {
            $.getJSON("../controllers/treatmentoperations.php", { action: 'getanimalsbyschedule', scheduleid: scheduleId, type: 'vaccination' }, (data) => {
                renderAnimalChecklist($('#rv_animal_list'), data, 'rv');
            });
        }
    });

    $(document).on('change', '#rd_scheduleid', function() {
        const sid = $(this).val();
        if (sid) {
            $.getJSON("../controllers/treatmentoperations.php", { action: 'getanimalsbyschedule', scheduleid: sid, type: 'deworming' }, (data) => {
                renderAnimalChecklist($('#rd_animal_list'), data, 'rd');
            });
        }
    });

    // --- Shared Modal & Checklist Handlers ---
    $('.close-modal-btn').on('click', function() {
        $(this).closest('.v-modal-overlay').fadeOut();
        $('.main-content, .sidebar, .top-header').removeClass('modal-blur');
    });

    $(document).on('change', '#rv_selectAll, #rd_selectAll', function() {
        const prefix = $(this).attr('id').split('_')[0];
        $(`#${prefix}_animal_list .animal-checkbox`).prop('checked', $(this).is(':checked'));
    });

    // Form Submission with Validation
    function setupFormSubmission(formId, alertContainerId, prefix) {
        $(`#${formId}`).on('submit', function(e) {
            e.preventDefault();
            const $form = $(this);
            const isVac = formId === 'recordVaccinationForm';
            const $alertContainer = $(`#${alertContainerId}`);
            
            // Clear previous errors
            $form.find('.is-invalid').removeClass('is-invalid');
            $alertContainer.addClass('d-none').empty();

            // Field-level Validation (One at a time)
            const validateField = (id, label) => {
                const $field = $form.find(`#${id}`);
                if (!$field.val() || $field.val() === '0') {
                    // Use showAlert with info as requested
                    const message = `${label} is required.`;
                    const alertHtml = showAlert('info', message, 1);
                    $alertContainer.html(alertHtml).removeClass('d-none');

                    // Focus after showing notification
                    $field.addClass('is-invalid');
                    $field.focus();
                    
                    return false;
                }
                return true;
            };

            // Sequential validations - Stop at first error
            if (!validateField(`${prefix}_date`, isVac ? 'Vaccination Date' : 'Deworming Date')) return;
            if (!validateField(`${prefix}_administered_by`, 'Veterinarian')) return;
            if (!validateField(`${prefix}_product`, 'Product Name')) return;
            
            // Add Batch/Lot and Dosage validation
            if (isVac) {
                if (!validateField(`${prefix}_batch`, 'Batch/Lot Number')) return;
            } else {
                // For deworming, we might have a method field to validate too
                if (!validateField(`${prefix}_method`, 'Administration Method')) return;
            }
            
            if (!validateField(`${prefix}_dosage`, 'Dosage')) return;

            // Execution type check
            const recordType = $form.find('input[name="record_type"]:checked').val();
            if (recordType === 'Scheduled') {
                if (!validateField(`${prefix}_scheduleid`, 'Schedule')) return;
            }

            // Animal selection check
            const animalIds = [];
            $form.find('.animal-checkbox:checked').each(function() {
                animalIds.push($(this).val());
            });

            if (animalIds.length === 0) {
                const alertHtml = showAlert('info', 'Please select at least one animal.', 1);
                $alertContainer.html(alertHtml).removeClass('d-none');
                return;
            }

            // Submit Data
            let formData = $form.serializeArray();
            
            // Force scheduleid to 0 if recordType is Routine
            if (recordType === 'Routine') {
                formData = formData.map(field => {
                    if (field.name === 'scheduleid') {
                        return { name: field.name, value: '0' };
                    }
                    return field;
                });
            }
            
            formData.push({ name: 'animalids', value: JSON.stringify(animalIds) });

            const $submitBtn = $form.find('button[type="submit"]');
            const originalText = $submitBtn.text();
            $submitBtn.prop('disabled', true).html('<span class="spinner-border spinner-border-sm mr-2"></span>Saving...');

            $.post("../controllers/treatmentoperations.php", formData, function(response) {
                if (response.status === 'success') {
                    const successHtml = showAlert('success', response.message, 0);
                    $alertContainer.html(successHtml).removeClass('d-none');

                    // Clear fields but keep modal open
                    $form[0].reset();
                    $form.find('.rv-type-label[data-type="Routine"], .rd-type-label[data-type="Routine"]').click();
                    $form.find(`#${prefix}_animal_list`).empty();
                    
                    // Refresh schedules if we were in scheduled mode
                    if (recordType === 'Scheduled') {
                        $form.find(`input[name="record_type"][value="Routine"]`).prop('checked', true).trigger('change');
                    } else {
                        // Just reload routine animals
                        $.getJSON("../controllers/treatmentoperations.php", { action: 'getanimalsbyschedule', scheduleid: 0, type: isVac ? 'vaccination' : 'deworming' }, (data) => {
                            renderAnimalChecklist($form.find(`#${prefix}_animal_list`), data, prefix);
                        });
                    }

                    // Auto-hide success after 3 seconds
                    setTimeout(() => $alertContainer.fadeOut(() => $alertContainer.addClass('d-none').show()), 3000);
                } else {
                    const errorHtml = showAlert('danger', response.message, 0);
                    $alertContainer.html(errorHtml).removeClass('d-none');
                }
            }, 'json').always(() => {
                $submitBtn.prop('disabled', false).text(originalText);
            });
        });
    }

    setupFormSubmission('recordVaccinationForm', 'rv_alert_container', 'rv');
    setupFormSubmission('recordDewormingForm', 'rd_alert_container', 'rd');

    setupFormSubmission('recordVaccinationForm', 'rv_alert_container', 'rv');
    setupFormSubmission('recordDewormingForm', 'rd_alert_container', 'rd');
});

// CSS for blur effect (can be added to style.css or here dynamically)
$('<style>')
    .prop('type', 'text/css')
    .html(`
        .modal-blur {
            filter: blur(5px);
            transition: filter 0.3s ease;
            pointer-events: none;
        }
    `)
    .appendTo('head');

