<!-- Add New Flock Modal (Bootstrap 4 High-Fidelity) -->
<div class="modal fade" id="addFlockModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content rounded-2xl border-0 shadow-lg overflow-hidden">
            
            <!-- Modal Header -->
            <div class="modal-header px-4 py-4 border-bottom-0 align-items-center">
                <div>
                    <h2 class="modal-title mb-1" style="font-weight: 600; font-size: 1.25rem; color: #206223;">Register New Flock</h2>
                    <p class="text-muted mb-0" style="font-size: 12px;">Enter flock details to initialize production tracking</p>
                </div>
                <button type="button" class="btn btn-link text-muted p-2 modal-close-btn" data-dismiss="modal">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body px-4 py-2 custom-scrollbar" style="max-height: 70vh; overflow-y: auto;">
                <form id="addFlockForm" novalidate>
                    <!-- Top Section: Core Details -->
                    <div id="flockFormNotification"></div>
                    <div class="form-row mb-2">
                        <div class="form-group col-md-6">
                            <label class="font-weight-bold text-muted mb-1" style="font-size: 11px; letter-spacing: 0.05em;">Flock ID</label>
                            <div class="position-relative">
                                <input id="flock_id_input" class="form-control rounded-xl border-secondary-light px-3" style="height: 40px; font-size: 13px;" placeholder="e.g. FL-2024-001" type="text" name="flock_id" required/>
                                <button type="button" class="btn-auto-toggle active position-absolute" id="flockIdAutoToggle" title="Auto-generate ID" style="right: 6px; top: 50%; transform: translateY(-50%); z-index: 10;">
                                    <span class="material-symbols-outlined" style="font-size: 16px;">auto_awesome</span>
                                </button>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="font-weight-bold text-muted mb-1" style="font-size: 11px; letter-spacing: 0.05em;">Flock Name</label>
                            <input class="form-control rounded-xl border-secondary-light px-3" style="height: 40px; font-size: 13px;" placeholder="e.g. Q1 Layers Batch" type="text" name="flock_name" required/>
                        </div>
                    </div>

                    <!-- Middle Section: Bird Details -->
                    <div class="form-row mb-2">
                        <div class="form-group col-md-6">
                            <label class="font-weight-bold text-muted mb-1" style="font-size: 11px; letter-spacing: 0.05em;">Bird Type</label>
                            <div class="position-relative">
                                <select id="flock_bird_type" class="form-control rounded-xl border-secondary-light px-3 custom-select-premium" style="height: 40px; font-size: 13px;" name="bird_type" required>
                                    <option value="" disabled selected>Select type...</option>
                                </select>
                                <span class="material-symbols-outlined position-absolute text-muted" style="right: 12px; top: 50%; transform: translateY(-50%); pointer-events: none; font-size: 20px;">expand_more</span>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="font-weight-bold text-muted mb-1" style="font-size: 11px; letter-spacing: 0.05em;">Flock Stage</label>
                            <div class="position-relative">
                                <select id="flock_stage" class="form-control rounded-xl border-secondary-light px-3 custom-select-premium" style="height: 40px; font-size: 13px;" name="flock_stage" required>
                                    <option value="" disabled selected>Select stage...</option>
                                </select>
                                <span class="material-symbols-outlined position-absolute text-muted" style="right: 12px; top: 50%; transform: translateY(-50%); pointer-events: none; font-size: 20px;">expand_more</span>
                            </div>
                        </div>
                    </div>

                    <!-- Middle Section: Origin & Arrival -->
                    <div class="form-row mb-2">
                        <div class="form-group col-md-6">
                            <label class="font-weight-bold text-muted mb-1" style="font-size: 11px; letter-spacing: 0.05em;">Breed</label>
                            <div class="position-relative">
                                <select id="flock_breed" class="form-control rounded-xl border-secondary-light px-3 custom-select-premium" style="height: 40px; font-size: 13px;" name="breed" required>
                                    <option value="" disabled selected>Select breed...</option>
                                </select>
                                <span class="material-symbols-outlined position-absolute text-muted" style="right: 12px; top: 50%; transform: translateY(-50%); pointer-events: none; font-size: 20px;">expand_more</span>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="font-weight-bold text-muted mb-1" style="font-size: 11px; letter-spacing: 0.05em;">Source</label>
                            <div class="position-relative">
                                <select class="form-control rounded-xl border-secondary-light px-3 custom-select-premium" style="height: 40px; font-size: 13px;" name="source">
                                    <option value="supplier">Supplier</option>
                                    <option value="hatchery">Hatchery</option>
                                </select>
                                <span class="material-symbols-outlined position-absolute text-muted" style="right: 12px; top: 50%; transform: translateY(-50%); pointer-events: none; font-size: 20px;">expand_more</span>
                            </div>
                        </div>
                    </div>

                    <!-- Logistic Section -->
                    <div class="form-row mb-2">
                        <div class="form-group col-md-6">
                            <label class="font-weight-bold text-muted mb-1" style="font-size: 11px; letter-spacing: 0.05em;">Arrival Date</label>
                            <div class="position-relative">
                                <input id="arrivalDatePicker" class="form-control rounded-xl border-secondary-light px-3 bg-white" style="height: 40px; font-size: 13px; cursor: pointer;" type="text" name="arrival_date" placeholder="Select Date..." readonly required/>
                                <span class="material-symbols-outlined position-absolute text-muted" style="right: 12px; top: 50%; transform: translateY(-50%); pointer-events: none; font-size: 18px;">calendar_today</span>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="font-weight-bold text-muted mb-1" style="font-size: 11px; letter-spacing: 0.05em;">Initial Bird Count</label>
                            <div class="position-relative">
                                <input class="form-control rounded-xl border-secondary-light px-3" style="height: 40px; font-size: 13px;" placeholder="0" type="number" name="initial_count" required/>
                                <span class="position-absolute font-weight-bold text-muted" style="right: 12px; top: 50%; transform: translateY(-50%); font-size: 10px;">UNITS</span>
                            </div>
                        </div>
                    </div>

                    <!-- Location & Schedule Section -->
                    <div class="form-row mb-2 align-items-end">
                        <div class="form-group col-md-6">
                            <label class="font-weight-bold text-muted mb-1" style="font-size: 11px; letter-spacing: 0.05em;">Assigned House/Pen</label>
                            <div class="position-relative">
                                <select id="flock_house_id" class="form-control rounded-xl border-secondary-light px-3 custom-select-premium" style="height: 40px; font-size: 13px;" name="house_id" required>
                                    <option value="" disabled selected>Select house...</option>
                                </select>
                                <span class="material-symbols-outlined position-absolute text-muted" style="right: 12px; top: 50%; transform: translateY(-50%); pointer-events: none; font-size: 20px;">location_on</span>
                            </div>
                        </div>
                        <div class="form-group col-md-6 pb-1">
                            <div class="d-flex align-items-center justify-content-between px-3 rounded-xl border-secondary-light" style="height: 40px; background: #f9fafb; border: 1px solid rgba(0,0,0,0.08);">
                                <div class="custom-control custom-switch vax-custom-switch">
                                    <input type="checkbox" class="custom-control-input" id="generateVaxSchedule" name="generate_vax_schedule" checked>
                                    <label class="custom-control-label font-weight-bold text-muted" for="generateVaxSchedule" style="font-size: 11px; cursor: pointer;">Generate Schedule</label>
                                </div>
                                <button type="button" id="previewVaxBtn" class="btn btn-link p-0 text-success disabled" style="opacity: 0.5; pointer-events: none;" title="Preview Schedule">
                                    <span class="material-symbols-outlined" style="font-size: 20px;">description</span>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Notes Section -->
                    <div class="form-group mb-4">
                        <label class="font-weight-bold text-muted mb-1" style="font-size: 11px; letter-spacing: 0.05em;">Notes & Special Requirements</label>
                        <textarea class="form-control rounded-xl border-secondary-light p-3" style="font-size: 13px; resize: none;" placeholder="Add specific details..." rows="3" name="notes"></textarea>
                    </div>
                </form>
            </div>

            <!-- Modal Footer -->
            <div class="modal-footer px-4 py-4 border-top-0 bg-light-soft justify-content-end">
                <button type="button" class="btn btn-outline-secondary rounded-xl px-4 py-2 mr-2 modal-close-btn" data-dismiss="modal" style="font-size: 13px; font-weight: 500;">Cancel</button>
                <button type="submit" form="addFlockForm" class="btn btn-success rounded-xl px-5 py-2 shadow" style="font-size: 13px; font-weight: 500; background-color: #206223; border-color: #206223;">Save Flock</button>
            </div>
        </div>
    </div>
</div>

<!-- Vaccination Schedule Preview Modal -->
<div class="modal fade" id="vaxPreviewModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-2xl border-0 shadow-lg">
            <div class="modal-header px-4 py-3 border-bottom-0">
                <h5 class="modal-title font-weight-bold" style="color: #206223;">Vaccination Schedule Preview</h5>
                <button type="button" class="btn btn-link text-muted p-2" data-dismiss="modal">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>
            <div class="modal-body px-4 py-0 custom-scrollbar" style="max-height: 400px; overflow-y: auto;">
                <div id="vaxPreviewContent">
                    <!-- Dynamic Content -->
                </div>
            </div>
            <div class="modal-footer border-top-0 px-4 py-3 justify-content-center">
                <button type="button" class="btn btn-outline-secondary rounded-xl px-5 py-2" data-dismiss="modal">Close Preview</button>
            </div>
        </div>
    </div>
</div>

<style>
    .modal-content { border-radius: 1.25rem !important; }
    .bg-light-soft { background-color: #fbfbfb; }
    .border-secondary-light { border-color: rgba(0,0,0,0.08) !important; }
    .custom-select-premium { -webkit-appearance: none; -moz-appearance: none; appearance: none; }
    
    .btn-auto-toggle {
        transition: all 0.2s ease;
        background: #f3f4f6;
        color: #6b7280;
        border: none;
        border-radius: 8px;
        width: 28px;
        height: 28px;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
    }
    .btn-auto-toggle.active {
        background: #206223;
        color: white;
        box-shadow: 0 2px 4px rgba(32, 98, 35, 0.2);
    }
    .btn-auto-toggle:hover {
        transform: translateY(-50%) scale(1.05) !important;
    }

    .animate-slide-up {
        animation: slideUp 0.4s cubic-bezier(0.16, 1, 0.3, 1);
    }
    
    @keyframes slideUp {
        from { opacity: 0; transform: translateY(30px) scale(0.98); }
        to { opacity: 1; transform: translateY(0) scale(1); }
    }
    
    #addFlockModal.show .modal-dialog {
        animation: slideUp 0.4s cubic-bezier(0.16, 1, 0.3, 1);
    }

    .vax-preview-item {
        transition: all 0.2s ease;
        border-radius: 12px;
        margin-bottom: 8px;
    }
    .vax-preview-item:hover {
        background-color: #f8faf8 !important;
        transform: translateX(4px);
    }

    /* Vaccination Toggle Styling */
    .vax-custom-switch {
        display: flex;
        align-items: center;
        padding-left: 2.75rem;
    }
    .vax-custom-switch .custom-control-input {
        left: 0;
    }
    .vax-custom-switch .custom-control-label {
        line-height: 1.25rem;
        padding-top: 0;
        margin-bottom: 0;
    }
    .vax-custom-switch .custom-control-input:checked ~ .custom-control-label::before {
        background-color: #2e7d32 !important;
        border-color: #2e7d32 !important;
    }
    .vax-custom-switch .custom-control-input:not(:checked) ~ .custom-control-label::before {
        background-color: #9ca3af !important;
        border-color: #9ca3af !important;
    }
    .vax-custom-switch .custom-control-label::before {
        height: 1.25rem;
        width: 2.25rem;
        border-radius: 1rem;
        transition: background-color 0.2s ease, border-color 0.2s ease;
        left: -2.75rem;
        top: 0;
    }
    .vax-custom-switch .custom-control-label::after {
        width: calc(1.25rem - 4px);
        height: calc(1.25rem - 4px);
        background-color: #fff;
        border-radius: 50%;
        top: 2px;
        left: calc(-2.75rem + 2px);
    }
    .vax-custom-switch .custom-control-input:checked ~ .custom-control-label::after {
        transform: translateX(1rem);
    }
</style>

<script>
    $(document).ready(function() {
        // Populate Dropdowns from Database
        if (typeof getpoultrybirdtypes === 'function') {
            getpoultrybirdtypes($('#flock_bird_type'));
        }
        if (typeof getpoultryflockstages === 'function') {
            getpoultryflockstages($('#flock_stage'));
        }
        if (typeof getpoultrybreeds === 'function') {
            getpoultrybreeds($('#flock_breed'));
        }
        if (typeof getpoultryhouses === 'function') {
            getpoultryhouses($('#flock_house_id'));
        }

        // Auto-generate Toggle
        $('#flockIdAutoToggle').on('click', function() {
            $(this).toggleClass('active');
            const isAuto = $(this).hasClass('active');
            const $input = $('#flock_id_input');
            
            if (isAuto) {
                $input.val('[AUTO]').prop('readonly', true).css({ 'background-color': '#f3f4f6', 'color': '#6b7280' });
            } else {
                $input.val('').prop('readonly', false).css({ 'background-color': '#ffffff', 'color': '#1f2937' }).focus();
            }
        });

        // Toggle Vaccination Schedule Preview Link
        function togglePreviewBtn() {
            const birdTypeId = $('#flock_bird_type').val();
            const arrivalDate = $('#arrivalDatePicker').val();
            const $previewBtn = $('#previewVaxBtn');
            
            if (birdTypeId && arrivalDate) {
                $previewBtn.removeClass('disabled').css({ 'opacity': '1', 'pointer-events': 'auto' });
            } else {
                $previewBtn.addClass('disabled').css({ 'opacity': '0.5', 'pointer-events': 'none' });
            }
        }

        $('#flock_bird_type, #arrivalDatePicker').on('change', togglePreviewBtn);

        // Preview Vaccination Schedule
        $('#previewVaxBtn').on('click', function() {
            const birdTypeId = $('#flock_bird_type').val();
            const arrivalDateStr = $('#arrivalDatePicker').val();
            
            if (!birdTypeId || !arrivalDateStr) return;
            
            $('#vaxPreviewContent').html('<div class="text-center py-4"><div class="spinner-border text-success" role="status"></div><p class="mt-2 text-muted small">Loading protocol...</p></div>');
            
            // Hide main modal and show preview
            $('#addFlockModal').modal('hide');
            $('#vaxPreviewModal').modal('show');

            $.ajax({
                url: base_path + 'controllers/poultrysettingsoperations.php?action=getbirdtypevaccinations&id=' + birdTypeId,
                type: 'GET',
                success: function(response) {
                    try {
                        const protocols = JSON.parse(response);
                        let html = '';
                        
                        if (protocols && protocols.length > 0) {
                            html = '<div class="list-group list-group-flush mb-3">';
                            
                            // Parse arrival date
                            const parts = arrivalDateStr.split('-');
                            const months = { 'Jan': 0, 'Feb': 1, 'Mar': 2, 'Apr': 3, 'May': 4, 'Jun': 5, 'Jul': 6, 'Aug': 7, 'Sep': 8, 'Oct': 9, 'Nov': 10, 'Dec': 11 };
                            const arrivalDate = new Date(parts[2], months[parts[1]], parts[0]);

                            protocols.forEach((p, index) => {
                                const vaxDate = new Date(arrivalDate);
                                vaxDate.setDate(arrivalDate.getDate() + parseInt(p.minage));
                                const dateStr = vaxDate.toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' });
                                
                                // Day range label
                                const dayLabel = p.maxage && p.maxage > p.minage ? `Day ${p.minage} to Day ${p.maxage}` : `Day ${p.minage}`;
                                
                                html += `
                                    <div class="list-group-item px-3 py-3 border-secondary-light vax-preview-item" style="border: 1px solid transparent;">
                                        <div class="d-flex justify-content-between align-items-center mb-1">
                                            <span class="badge badge-success px-2 py-1 rounded" style="font-size: 10px; background-color: #e8f5e9; color: #2e7d32; border: none;">${dayLabel}</span>
                                            <span class="text-muted small">${dateStr}</span>
                                        </div>
                                        <div class="mb-1" style="font-size: 13px; color: #1a1c19; font-weight: 500;">${p.diseasename}</div>
                                        <div class="text-muted" style="font-size: 11px;">${p.narration || 'Standard vaccination dose'}</div>
                                    </div>
                                `;
                            });
                            html += '</div>';
                        } else {
                            html = `
                                <div class="text-center py-5">
                                    <span class="material-symbols-outlined text-muted mb-2" style="font-size: 48px; opacity: 0.3;">event_busy</span>
                                    <p class="text-muted small">No vaccination protocol defined for this bird type.</p>
                                </div>
                            `;
                        }
                        $('#vaxPreviewContent').html(html);
                    } catch (e) {
                        $('#vaxPreviewContent').html('<div class="alert alert-danger small m-3">Error loading protocol data.</div>');
                    }
                },
                error: function() {
                    $('#vaxPreviewContent').html('<div class="alert alert-danger small m-3">Connection error.</div>');
                }
            });
        });

        // Restore main modal when preview is closed
        $('#vaxPreviewModal').on('hidden.bs.modal', function () {
            $('#addFlockModal').modal('show');
        });

        // Form Validation & Submission
        $('#addFlockForm').on('submit', function(e) {
            e.preventDefault();
            const notification = $('#flockFormNotification');
            notification.empty();

            const validationRules = [
                { name: 'flock_id', label: 'Flock ID', selector: '#flock_id_input' },
                { name: 'flock_name', label: 'Flock Name', selector: 'input[name="flock_name"]' },
                { name: 'bird_type', label: 'Bird Type', selector: '#flock_bird_type' },
                { name: 'flock_stage', label: 'Flock Stage', selector: '#flock_stage' },
                { name: 'breed', label: 'Breed', selector: '#flock_breed' },
                { name: 'arrival_date', label: 'Arrival Date', selector: '#arrivalDatePicker' },
                { name: 'initial_count', label: 'Initial Bird Count', selector: 'input[name="initial_count"]' },
                { name: 'house_id', label: 'House/Pen', selector: '#flock_house_id' }
            ];

            for (let rule of validationRules) {
                const $field = $(rule.selector);
                const value = $field.val();
                
                if (!value || (typeof value === 'string' && value.trim() === "") || value === null) {
                    if (typeof showAlert === 'function') {
                        notification.html(showAlert("info", `Please provide a valid <b>${rule.label}</b> before saving.`, 1));
                    }
                    $field.focus();
                    
                    // Animate notification
                    notification.hide().fadeIn(300);
                    return false;
                }
            }

            // AJAX Submission
            const $form = $(this);
            const formData = $form.serialize();
            const $submitBtn = $form.closest('.modal-content').find('button[type="submit"]');
            
            $submitBtn.prop('disabled', true).html('<span class="spinner-border spinner-border-sm mr-2"></span>Saving...');

            $.ajax({
                url: base_path + 'controllers/poultryflockoperations.php?action=saveflock',
                type: 'POST',
                data: formData,
                success: function(response) {
                    $submitBtn.prop('disabled', false).text('Save Flock');
                    try {
                        const res = JSON.parse(response);
                        if (res.status === 'success') {
                            if (typeof showAlert === 'function') {
                                notification.html(showAlert("success", res.message, 1));
                            }
                            
                            // Clear fields for new entry
                            $form[0].reset();
                            
                            // Restore Auto-ID if it was active
                            if ($('#flockIdAutoToggle').hasClass('active')) {
                                $('#flock_id_input').val('[AUTO]').prop('readonly', true).css({ 'background-color': '#f3f4f6', 'color': '#6b7280' });
                            }

                            // Trigger refresh if overview exists
                            if (typeof fetchFlocks === 'function') {
                                fetchFlocks();
                            }

                            // Close modal after delay
                            setTimeout(() => {
                                $('#addFlockModal').modal('hide');
                                notification.empty();
                            }, 2000);
                        } else {
                            if (typeof showAlert === 'function') {
                                notification.html(showAlert("danger", res.message, 1));
                            }
                        }
                    } catch (e) {
                        console.error("Parse Error:", e, response);
                        if (typeof showAlert === 'function') {
                            notification.html(showAlert("danger", "An unexpected error occurred while saving the flock.", 1));
                        }
                    }
                },
                error: function(xhr, status, error) {
                    $submitBtn.prop('disabled', false).text('Save Flock');
                    if (typeof showAlert === 'function') {
                        notification.html(showAlert("danger", `Server Error: ${error}`, 1));
                    }
                }
            });
        });

        // Clear notification on any input change
        $('#addFlockForm input, #addFlockForm select, #addFlockForm textarea').on('input change', function() {
            $('#flockFormNotification').fadeOut(200, function() {
                $(this).empty().show();
            });
        });

        // Initialize state
        if ($('#flockIdAutoToggle').hasClass('active')) {
            $('#flock_id_input').val('[AUTO]').prop('readonly', true).css({ 'background-color': '#f3f4f6', 'color': '#6b7280' });
        }

        // Initialize Flatpickr if not already done
        if (typeof flatpickr !== 'undefined') {
            flatpickr("#arrivalDatePicker", {
                dateFormat: "d-M-Y",
                maxDate: "today",
                disableMobile: "true",
                onChange: function() {
                    togglePreviewBtn();
                }
            });
        }
        
        // Initial state for preview button
        togglePreviewBtn();
    });
</script>
