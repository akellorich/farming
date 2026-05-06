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
    const $pageInfo = $('#pageInfo');
    const $numberButtons = $('#numberButtons');
    const $prevPageBtn = $('#prevPage');
    const $nextPageBtn = $('#nextPage');
    
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

    const table = $healthDataTable.DataTable({
        "pageLength": 5,
        "paging": true,
        "info": false,
        "searching": true,
        "lengthChange": false,
        "responsive": true,
        "autoWidth": false,
        "dom": 'rt',
        "columnDefs": [
            { "responsivePriority": 1, "targets": [0, -1] }, // Animal ID and Action always visible
            { "responsivePriority": 2, "targets": 3 },      // Condition secondary
            { "responsivePriority": 3, "targets": [1, 2, 4, 5] }
        ],
        "language": {
            "paginate": {
                "previous": "",
                "next": ""
            }
        }
    });

    function updatePagination() {
        const info = table.page.info();
        $pageInfo.text('Page ' + (info.page + 1) + ' of ' + info.pages);
        
        let html = '';
        for (let i = 0; i < info.pages; i++) {
            const activeClass = i === info.page ? 'active' : '';
            html += `<button class="page-btn ${activeClass}" data-page="${i}">${i + 1}</button>`;
        }
        $numberButtons.html(html);
        
        $prevPageBtn.prop('disabled', info.page === 0);
        $nextPageBtn.prop('disabled', info.page >= info.pages - 1);
    }

    $('#customPagination').on('click', '.page-btn', function() {
        table.page($(this).data('page')).draw('page');
        updatePagination();
    });

    $prevPageBtn.on('click', function() {
        table.page('previous').draw('page');
        updatePagination();
    });

    $nextPageBtn.on('click', function() {
        table.page('next').draw('page');
        updatePagination();
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

    updatePagination();

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

    $btnLogHealthCheck.on('click', function(e) {
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
    $('#btnRecordVaccination').on('click', function() {
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
        
        $.getJSON("../controllers/treatmentoperations.php", { action: 'getanimalsbyschedule', scheduleid: 0, type: 'vaccination' }, (data) => {
            renderAnimalChecklist($('#rv_animal_list'), data, 'rv');
        });
        
        $modal.fadeIn().css('display', 'flex');
        $('.main-content, .sidebar, .top-header').addClass('modal-blur');
    });

    // --- Recording Deworming Logic ---
    $('#btnRecordDeworming').on('click', function() {
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
        
        if (isScheduled) {
            $.getJSON("../controllers/treatmentoperations.php", { action: 'getschedules', type: isVac ? 'vaccination' : 'deworming' }, (data) => {
                let html = '<option value="">Choose from schedules...</option>';
                data.forEach(s => {
                    html += `<option value="${s.id}">${s.title} (${s.scheduledate})</option>`;
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

    $(document).on('change', '#rv_scheduleid, #rd_scheduleid', function() {
        const isVac = $(this).attr('id') === 'rv_scheduleid';
        const prefix = isVac ? 'rv' : 'rd';
        const sid = $(this).val();
        if (sid) {
            $.getJSON("../controllers/treatmentoperations.php", { action: 'getanimalsbyschedule', scheduleid: sid, type: isVac ? 'vaccination' : 'deworming' }, (data) => {
                renderAnimalChecklist($(`#${prefix}_animal_list`), data, prefix);
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

