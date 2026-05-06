/**
 * Jukam Dairy - Schedules Management Scripting
 * File: js/schedules.js
 */

$(document).ready(function() {
    function loadScheduleStats() {
        $.getJSON("../controllers/scheduleoperations.php", { action: 'getschedulestats' }, (data) => {
            if (data) {
                $('#stat-completed').html(`${data.completed} <small style="font-size: 0.75rem; opacity: 0.8;">Animals</small>`);
                $('#stat-pending').html(`${data.pending} <small style="font-size: 0.75rem; opacity: 0.8;">Upcoming</small>`);
                $('#stat-overdue').html(`${data.overdue} <small style="font-size: 0.75rem; opacity: 0.8;">Scheduled</small>`);
            }
        });
    }

    // Initialize stats
    loadScheduleStats();

    // Initialize DataTable
    const table = $('#schedulesDataTable').DataTable({
        "pageLength": 10,
        "paging": true,
        "info": false,
        "searching": true,
        "lengthChange": false,
        "responsive": true,
        "autoWidth": false,
        "dom": 'rt',
        "ajax": {
            "url": "../controllers/scheduleoperations.php",
            "data": function(d) {
                d.action = $('.view-toggle-btn.active').attr('data-type') === 'vaccination' ? 'getvaccinationschedules' : 'getdewormingschedules';
            },
            "dataSrc": ""
        },
        "columns": [
            { 
                "data": "scheduledate",
                "render": function(data, type, row) {
                    const date = moment(data).format('MMM DD, YYYY');
                    const time = moment(row.scheduletime, 'HH:mm:ss').format('hh:mm A');
                    return `
                        <div class="schedule-date-box">
                            <span class="schedule-date-main">${date}</span>
                            <span class="schedule-date-sub">${time}</span>
                        </div>
                    `;
                }
            },
            { 
                "data": null,
                "render": function(data, type, row) {
                    const protocol = row.diseasename || row.schedulename;
                    return `
                        <div class="protocol-chip">
                            <div class="protocol-dot" style="background-color: var(--primary);"></div>
                            <span class="protocol-name">${protocol}</span>
                        </div>
                    `;
                }
            },
            { 
                "data": "pen_count",
                "render": function(data) {
                    return `<span class="scope-text">${data} Pens Target</span>`;
                }
            },
            { 
                "data": "scheduledate",
                "render": function(data) {
                    const now = moment().startOf('day');
                    const scheduled = moment(data).startOf('day');
                    let statusClass = 'status-badge-pending';
                    let statusText = 'Pending';
                    let icon = 'clock';
                    
                    if (scheduled.isBefore(now)) {
                        statusClass = 'status-badge-expired';
                        statusText = 'Overdue';
                        icon = 'exclamation-circle';
                    } else if (scheduled.isSame(now)) {
                        statusClass = 'status-badge-active';
                        statusText = 'Ongoing';
                        icon = 'spinner-third fa-spin';
                    }
                    
                    return `<span class="status-badge ${statusClass} d-flex align-items-center gap-2"><i class="fal fa-${icon}"></i> ${statusText}</span>`;
                }
            },
            { 
                "data": null,
                "className": "text-right align-middle",
                "orderable": false,
                "render": function(data, type, row) {
                    return `
                        <div class="dropdown">
                            <button class="btn btn-icon hover-bg-stone rounded-circle no-caret" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fal fa-ellipsis-v text-muted"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right shadow-sm border-0 animate slideIn" style="border-radius: 0.75rem; padding: 0.5rem; z-index: 10000;">
                                <a class="dropdown-item view-schedule d-flex align-items-center py-2" href="#" data-id="${row.id}">
                                    <i class="fal fa-eye mr-3 text-muted"></i>
                                    <span style="font-size: 0.85rem; font-weight: 500;">View Details</span>
                                </a>
                                <a class="dropdown-item edit-schedule d-flex align-items-center py-2" href="#" data-id="${row.id}">
                                    <i class="fal fa-edit mr-3 text-muted"></i>
                                    <span style="font-size: 0.85rem; font-weight: 500;">Edit Schedule</span>
                                </a>
                                <a class="dropdown-item record-vaccination d-flex align-items-center py-2" href="#" data-id="${row.id}" data-protocol="${row.diseasename || row.schedulename}">
                                    <i class="fal fa-shield-check mr-3 text-success"></i>
                                    <span style="font-size: 0.85rem; font-weight: 500;">Record Vaccination</span>
                                </a>
                                <a class="dropdown-item record-deworming d-flex align-items-center py-2" href="#" data-id="${row.id}" data-protocol="${row.diseasename || row.schedulename}">
                                    <i class="fal fa-pill mr-3 text-warning"></i>
                                    <span style="font-size: 0.85rem; font-weight: 500;">Record Deworming</span>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item delete-schedule d-flex align-items-center py-2 text-danger" href="#" data-id="${row.id}">
                                    <i class="fal fa-trash-alt mr-3"></i>
                                    <span style="font-size: 0.85rem; font-weight: 500;">Delete Schedule</span>
                                </a>
                            </div>
                        </div>
                    `;
                }
            }
        ],
        "language": {
            "emptyTable": "No scheduled protocols found"
        },
        "drawCallback": function() {
            updatePagination(this.api());
            // Re-initialize dropdowns for dynamic content
            $('[data-toggle="dropdown"]').dropdown();
        }
    });

    // Toggle between Vaccination and Deworming
    $('.view-toggle-btn').on('click', function() {
        $('.view-toggle-btn').removeClass('active');
        $(this).addClass('active');
        
        const type = $(this).attr('data-type');
        const title = type === 'vaccination' ? 'Vaccination Registry' : 'Deworming Registry';
        $('#registryTitle').text(title);
        
        table.ajax.reload();
    });

    // Form Submissions
    $('#vaccinationForm, #dewormingForm').on('submit', function(e) {
        e.preventDefault();
        const $form = $(this);
        const type = $form.attr('id') === 'vaccinationForm' ? 'vaccination' : 'deworming';
        const alertId = type === 'vaccination' ? '#vaccination-modal-alert' : '#deworming-modal-alert';
        const prefix = type === 'vaccination' ? 'v_' : 'd_';
        
        // 1. Validation - Field at a time
        const formData = new FormData(this);
        
        if (type === 'vaccination') {
            if (!$form.find('[name="diseaseid"]').val()) {
                $(alertId).html(showAlert('info', 'Please select a target disease', 1)).fadeIn();
                $form.find('[name="diseaseid"]').focus();
                return;
            }
        } else {
            if (!$form.find('[name="schedulename"]').val().trim()) {
                $(alertId).html(showAlert('info', 'Please enter the proposed drug/task name', 1)).fadeIn();
                $form.find('[name="schedulename"]').focus();
                return;
            }
        }

        // Collect Pen IDs for validation
        const penIds = [];
        $(`#${prefix}pen_list`).find('input[type="checkbox"]:checked').each(function() {
            penIds.push($(this).val());
        });

        if (penIds.length === 0) {
            $(alertId).html(showAlert('info', 'Please select at least one target pen', 1)).fadeIn();
            $(`#${prefix}penTrigger`).click();
            return;
        }

        if (!$form.find('[name="scheduledate"]').val()) {
            $(alertId).html(showAlert('info', 'Please select a scheduled date', 1)).fadeIn();
            $form.find('[name="scheduledate"]').focus();
            return;
        }

        if (!$form.find('[name="scheduletime"]').val()) {
            $(alertId).html(showAlert('info', 'Please select a scheduled time', 1)).fadeIn();
            $form.find('[name="scheduletime"]').focus();
            return;
        }

        // 2. Prepare Data
        penIds.forEach(id => formData.append('penids[]', id));

        // Submit via AJAX
        const isNew = $form.find('[name="id"]').val() == "0";
        const $submitBtn = $form.find('button[type="submit"]');
        const originalBtnText = $submitBtn.text();
        
        $submitBtn.prop('disabled', true).text('Saving...');

        $.ajax({
            url: "../controllers/scheduleoperations.php",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            dataType: "json",
            success: function(response) {
                if (response.status === 'success') {
                    $(alertId).html(showAlert('success', response.message, 1)).fadeIn();
                    
                    if (isNew) {
                        $form[0].reset();
                        $(`#${prefix}pen_list`).find('input[type="checkbox"]').prop('checked', false);
                        updateCurrentPenCount($form.find('.pen-multiselect'));
                        $form.find('input[name="id"]').val("0");
                    }
                    
                    table.ajax.reload();
                    setTimeout(() => $(alertId).fadeOut(), 5000);
                } else {
                    $(alertId).html(showAlert('danger', response.message, 1)).fadeIn();
                }
            },
            error: function(xhr) {
                const errorMsg = xhr.responseJSON ? xhr.responseJSON.message : (xhr.responseText ? xhr.responseText.substring(0, 100) : 'A system error occurred. Please check your connection.');
                $(alertId).html(showAlert('danger', `Error: ${errorMsg}`, 1)).fadeIn();
            },
            complete: function() {
                $submitBtn.prop('disabled', false).text(originalBtnText);
            }
        });
    });

    // Hide alerts when user makes changes
    $(document).on('input change', '.v-modal-form input, .v-modal-form select, .v-modal-form textarea', function() {
        const $form = $(this).closest('form');
        const alertId = $form.attr('id') === 'vaccinationForm' ? '#vaccination-modal-alert' : '#deworming-modal-alert';
        // Only hide if it's an error/info alert (success stays for its timer)
        if ($(alertId).find('.alert-info, .alert-danger').length) {
            $(alertId).fadeOut();
        }
    });

    // Also hide when pen selection changes
    $(document).on('change', '.pen-item input[type="checkbox"]', function() {
        const $form = $(this).closest('.v-modal-overlay').find('form');
        const alertId = $form.attr('id') === 'vaccinationForm' ? '#vaccination-modal-alert' : '#deworming-modal-alert';
        if ($(alertId).find('.alert-info, .alert-danger').length) {
            $(alertId).fadeOut();
        }
    });

    // Custom Search
    $('#schedulesSearch').on('keyup', function() {
        table.search(this.value).draw();
    });

    function updatePagination(api) {
        const info = api.page.info();
        $('#pageInfo').text(`Showing ${info.start + 1} to ${info.end} of ${info.recordsTotal}`);
        
        let html = '';
        const totalPages = info.pages;
        for (let i = 0; i < totalPages; i++) {
            const activeClass = i === info.page ? 'active' : '';
            html += `<button class="page-btn ${activeClass}" data-page="${i}">${i + 1}</button>`;
        }
        $('#numberButtons').html(html);
        
        $('#prevPage').prop('disabled', info.page === 0);
        $('#nextPage').prop('disabled', info.page >= info.pages - 1);
    }

    $('#customPagination').on('click', '.page-btn', function() {
        const page = $(this).data('page');
        if (page !== undefined) { 
            table.page(page).draw('page'); 
        }
    });

    $('#prevPage').on('click', function() { 
        table.page('previous').draw('page'); 
    });

    $('#nextPage').on('click', function() { 
        table.page('next').draw('page'); 
    });

    // Modal Logic
    $('#addNewBtn').on('click', function(e) {
        e.preventDefault();
        const activeType = $('.view-toggle-btn.active').attr('data-type');
        
        if (activeType === 'vaccination') {
            const $modal = $('#vaccinationModal');
            $modal.find('.v-modal-title').text('New Health Schedule');
            $modal.find('.v-modal-header h3').text('Vaccination Schedule Details');
            $modal.find('input[name="id"]').val(0);
            $modal.find('form')[0].reset();
            
            getdiseases($('#v_diseaseid'));
            getpenscheckboxes($('#v_pen_list'));
            $('#v_penDisplay').text('Select Pens');
            
            $modal.css({'display': 'flex', 'z-index': '9999'});
            $('body').addClass('overflow-hidden');
        } else if (activeType === 'deworming') {
            const $modal = $('#dewormingModal');
            $modal.find('.v-modal-title').text('Deworming Schedule');
            $modal.find('.v-modal-header h3').text('Deworming Schedule Details');
            $modal.find('input[name="id"]').val(0);
            $modal.find('form')[0].reset();
            
            getpenscheckboxes($('#d_pen_list'));
            $('#d_penDisplay').text('Select Pens');
            
            $modal.css({'display': 'flex', 'z-index': '9999'});
            $('body').addClass('overflow-hidden');
        }
    });

    $(document).on('click', '.close-modal-btn', function() {
        $('.v-modal-overlay').css('display', 'none');
        $('body').removeClass('overflow-hidden');
    });

    // Edit Schedule logic
    $(document).on('click', '.edit-schedule', function() {
        const id = $(this).data('id');
        const type = $('.view-toggle-btn.active').attr('data-type');
        const action = type === 'vaccination' ? 'getvaccinationscheduledetails' : 'getdewormingscheduledetails';
        const modalId = type === 'vaccination' ? '#vaccinationModal' : '#dewormingModal';
        const $modal = $(modalId);
        
        $.getJSON("../controllers/scheduleoperations.php", { action: action, id: id }, (data) => {
            if (data) {
                const $form = $modal.find('form');
                
                // Update UI for Edit mode
                $modal.find('.v-modal-title').text('Edit Health Protocol');
                $modal.find('.v-modal-header h3').text(type === 'vaccination' ? 'Modify Vaccination' : 'Modify Deworming');
                
                // Populate fields
                $form.find('input[name="id"]').val(data.id);
                
                if (type === 'vaccination') {
                    // Populate diseases then set value
                    $.getJSON("../controllers/diseaseoperations.php", { getdiseases: true }, (diseases) => {
                        let options = '<option value="" disabled>Select disease...</option>';
                        diseases.forEach(d => {
                            const selected = d.id == data.diseaseid ? 'selected' : '';
                            options += `<option value="${d.id}" ${selected}>${d.diseasename}</option>`;
                        });
                        $('#v_diseaseid').html(options);
                    });

                    // Populate pens then set checkboxes
                    $.getJSON("../controllers/penoperations.php", { getpens: true }, (pens) => {
                        let html = '';
                        const penIds = JSON.parse(data.penids || '[]');
                        pens.forEach(pen => {
                            const checked = penIds.includes(pen.id.toString()) || penIds.includes(parseInt(pen.id)) ? 'checked' : '';
                            html += `
                                <label class="pen-item">
                                    <input type="checkbox" value="${pen.id}" ${checked}>
                                    <span>${pen.penname} (${pen.pentype})</span>
                                </label>
                            `;
                        });
                        $('#v_pen_list').html(html);
                        updateCurrentPenCount($('#v_pen_list').closest('.pen-multiselect'));
                    });
                } else {
                    $form.find('input[name="schedulename"]').val(data.schedulename);
                    
                    // Populate pens for deworming
                    $.getJSON("../controllers/penoperations.php", { getpens: true }, (pens) => {
                        let html = '';
                        const penIds = JSON.parse(data.penids || '[]');
                        pens.forEach(pen => {
                            const checked = penIds.includes(pen.id.toString()) || penIds.includes(parseInt(pen.id)) ? 'checked' : '';
                            html += `
                                <label class="pen-item">
                                    <input type="checkbox" value="${pen.id}" ${checked}>
                                    <span>${pen.penname} (${pen.pentype})</span>
                                </label>
                            `;
                        });
                        $('#d_pen_list').html(html);
                        updateCurrentPenCount($('#d_pen_list').closest('.pen-multiselect'));
                    });
                }
                
                $form.find('input[name="scheduledate"]').val(data.scheduledate);
                $form.find('input[name="scheduletime"]').val(data.scheduletime);
                $form.find('input[name="repeat_annually"]').prop('checked', parseInt(data.repeat_annually) === 1);
                $form.find('textarea[name="notes"]').val(data.notes);
                
                $modal.css({'display': 'flex', 'z-index': '9999'});
                $('body').addClass('overflow-hidden');
            }
        });
    });

    // Delete Schedule logic
    $(document).on('click', '.delete-schedule', function() {
        const id = $(this).data('id');
        const type = $('.view-toggle-btn.active').attr('data-type');
        const action = type === 'vaccination' ? 'deletevaccinationschedule' : 'deletedewormingschedule';
        
        if (confirm('Are you sure you want to delete this schedule? This action cannot be undone.')) {
            $.post("../controllers/scheduleoperations.php", { action: action, id: id }, (response) => {
                if (response.status === 'success') {
                    showAlert(response.message, 'success');
                    table.ajax.reload();
                } else {
                    showAlert(response.message, 'error');
                }
            }, 'json');
        }
    });

    // Close on backdrop click (Removed to make modal undismissable per request)
    /*
    $(document).on('click', '.v-modal-overlay', function(e) {
        if (e.target === this || $(e.target).hasClass('v-modal-overlay')) {
            $(this).css('display', 'none');
            $('body').removeClass('overflow-hidden');
        }
    });
    */

    // Universal Pen Multi-select Logic
    $(document).on('click', '.penTrigger', function(e) {
        e.stopPropagation();
        const $menu = $(this).siblings('.penMenu');
        $('.penMenu').not($menu).removeClass('show'); // Close other menus
        $menu.toggleClass('show');
    });

    $(document).on('click', function(e) {
        if (!$(e.target).closest('.pen-multiselect').length) {
            $('.penMenu').removeClass('show');
        }
    });

    $(document).on('change', '.pen-item input[type="checkbox"]', function() {
        const $container = $(this).closest('.pen-multiselect');
        updateCurrentPenCount($container);
    });

    function updateCurrentPenCount($container) {
        const $display = $container.find('.penDisplay');
        const $checkboxes = $container.find('.pen-item input[type="checkbox"]');
        const selectedCount = $checkboxes.filter(':checked').length;
        
        if (selectedCount === 0) {
            $display.text('Select Pens');
        } else if (selectedCount === $checkboxes.length) {
            $display.text('All Pens Selected');
        } else {
            $display.text(`${selectedCount} pens selected`);
        }
    }

    $(document).on('input', '.penSearch', function() {
        const query = $(this).val().toLowerCase();
        $(this).closest('.penMenu').find('.pen-item').each(function() {
            const text = $(this).find('span').text().toLowerCase();
            $(this).toggle(text.includes(query));
        });
    });

    $(document).on('click', '.penSelectAll', function() {
        $(this).closest('.pen-multiselect').find('input[type="checkbox"]').prop('checked', true).trigger('change');
    });

    $(document).on('click', '.penDeselectAll', function() {
        $(this).closest('.pen-multiselect').find('input[type="checkbox"]').prop('checked', false).trigger('change');
    });

    $(document).on('click', '.penConfirm', function() {
        $(this).closest('.penMenu').removeClass('show');
    });

    // Initialize Datepickers
    if ($(".v_datepicker").length) {
        $(".v_datepicker").datepicker({
            dateFormat: "dd-M-yy",
            changeMonth: true,
            changeYear: true,
            minDate: 0
        });
    }

    // Record Vaccination Logic
    $(document).on('click', '.record-vaccination', function() {
        const id = $(this).data('id');
        const protocol = $(this).data('protocol');
        const $modal = $('#recordVaccinationModal');
        const $form = $('#recordVaccinationForm');
        
        $form[0].reset();
        $('#rv_scheduleid').val(id);
        $('#rv-protocol-name').text(`Logging vaccination for: ${protocol}`);
        
        setDatePicker($('#rv_date'), true);
        getveterinariansselect($('#rv_administered_by'));
        
        $.getJSON("../controllers/treatmentoperations.php", { action: 'getanimalsbyschedule', scheduleid: id, type: 'vaccination' }, (data) => {
            let html = '';
            if (data && data.length > 0) {
                data.forEach(animal => {
                    html += `
                        <div class="col">
                            <label class="animal-check-card d-flex align-items-center p-2 mb-2" style="background: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; cursor: pointer; transition: all 0.2s;">
                                <input type="checkbox" name="animalids[]" value="${animal.id}" class="mr-3 rv-animal-cb" checked style="width: 18px; height: 18px; accent-color: #166534;">
                                <div style="flex: 1;">
                                    <div class="font-weight-bold" style="font-size: 0.8rem; color: #1e293b;">${animal.tagid}</div>
                                    <div class="text-muted small">${animal.designatedname || 'Unnamed'}</div>
                                </div>
                                <div class="badge badge-light small px-2" style="font-size: 0.65rem;">${animal.penname}</div>
                            </label>
                        </div>
                    `;
                });
            } else {
                html = '<div class="col-12 text-center py-4 text-muted small">No animals found in target pens</div>';
            }
            $('#rv_animal_list').html(html);
        });
        
        $modal.css({'display': 'flex', 'z-index': '9999'});
        $('body').addClass('overflow-hidden');
    });

    // Record Deworming Logic
    $(document).on('click', '.record-deworming', function() {
        const id = $(this).data('id');
        const protocol = $(this).data('protocol');
        const $modal = $('#recordDewormingModal');
        const $form = $('#recordDewormingForm');
        
        $form[0].reset();
        $('#rd_scheduleid').val(id);
        $('#rd-protocol-name').text(`Logging deworming for: ${protocol}`);
        
        setDatePicker($('#rd_date'), true);
        getveterinariansselect($('#rd_administered_by'));
        
        $.getJSON("../controllers/treatmentoperations.php", { action: 'getanimalsbyschedule', scheduleid: id, type: 'deworming' }, (data) => {
            let html = '';
            if (data && data.length > 0) {
                data.forEach(animal => {
                    html += `
                        <div class="col">
                            <label class="animal-check-card d-flex align-items-center p-2 mb-2" style="background: white; border: 1px solid #e2e8f0; border-radius: 0.75rem; cursor: pointer; transition: all 0.2s;">
                                <input type="checkbox" name="animalids[]" value="${animal.id}" class="mr-3 rd-animal-cb" checked style="width: 18px; height: 18px; accent-color: #d97706;">
                                <div style="flex: 1;">
                                    <div class="font-weight-bold" style="font-size: 0.8rem; color: #1e293b;">${animal.tagid}</div>
                                    <div class="text-muted small">${animal.designatedname || 'Unnamed'}</div>
                                </div>
                                <div class="badge badge-light small px-2" style="font-size: 0.65rem;">${animal.penname}</div>
                            </label>
                        </div>
                    `;
                });
            } else {
                html = '<div class="col-12 text-center py-4 text-muted small">No animals found in target pens</div>';
            }
            $('#rd_animal_list').html(html);
        });
        
        $modal.css({'display': 'flex', 'z-index': '9999'});
        $('body').addClass('overflow-hidden');
    });

    // Select All logic
    $(document).on('change', '#rv_selectAll', function() { $('.rv-animal-cb').prop('checked', this.checked); });
    $(document).on('change', '#rd_selectAll', function() { $('.rd-animal-cb').prop('checked', this.checked); });

    // Form Submission for Vaccination
    $('#recordVaccinationForm').on('submit', function(e) {
        e.preventDefault();
        const $form = $(this);
        const $btn = $form.closest('.v-modal-content').find('button[type="submit"]');
        const originalText = $btn.find('span').text();
        
        if ($('.rv-animal-cb:checked').length === 0) {
            Swal.fire('Selection Required', 'Please select at least one animal.', 'info');
            return;
        }

        $btn.prop('disabled', true).find('span').text('Processing...');
        
        $.post('../controllers/treatmentoperations.php', $form.serialize(), function(response) {
            $btn.prop('disabled', false).find('span').text(originalText);
            if (response.status === 'success') {
                $('#recordVaccinationModal').css('display', 'none');
                $('body').removeClass('overflow-hidden');
                Swal.fire('Success', response.message, 'success');
                loadScheduleStats();
            } else {
                Swal.fire('Error', response.message, 'error');
            }
        }, 'json').fail(() => {
            $btn.prop('disabled', false).find('span').text(originalText);
            Swal.fire('System Error', 'Could not save record.', 'error');
        });
    });

    // Form Submission for Deworming
    $('#recordDewormingForm').on('submit', function(e) {
        e.preventDefault();
        const $form = $(this);
        const $btn = $form.closest('.v-modal-content').find('button[type="submit"]');
        const originalText = $btn.find('span').text();
        
        if ($('.rd-animal-cb:checked').length === 0) {
            Swal.fire('Selection Required', 'Please select at least one animal.', 'info');
            return;
        }

        $btn.prop('disabled', true).find('span').text('Processing...');
        
        $.post('../controllers/treatmentoperations.php', $form.serialize(), function(response) {
            $btn.prop('disabled', false).find('span').text(originalText);
            if (response.status === 'success') {
                $('#recordDewormingModal').css('display', 'none');
                $('body').removeClass('overflow-hidden');
                Swal.fire('Success', response.message, 'success');
                loadScheduleStats();
            } else {
                Swal.fire('Error', response.message, 'error');
            }
        }, 'json').fail(() => {
            $btn.prop('disabled', false).find('span').text(originalText);
            Swal.fire('System Error', 'Could not save record.', 'error');
        });
    });
});
