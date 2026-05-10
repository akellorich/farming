<!-- Record Mortality Modal (Bootstrap 4 High-Fidelity) -->
<div class="modal fade" id="recordMortalityModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" style="max-width: 450px;">
        <div class="modal-content rounded-2xl border-0 shadow-lg overflow-hidden">
            
            <!-- Modal Header -->
            <div class="modal-header px-4 py-4 border-bottom-0 align-items-center bg-light-soft">
                <div class="d-flex align-items-center">
                    <div class="bg-danger-light p-2 rounded-lg mr-3">
                        <span class="material-symbols-outlined text-danger" style="font-size: 24px;">heart_broken</span>
                    </div>
                    <div>
                        <h2 class="modal-title mb-0" style="font-weight: 700; font-size: 1.15rem; color: #1a1c1e;">Record Mortality</h2>
                        <p class="text-muted mb-0" style="font-size: 11px;">Logging mortality for <span id="display_flock_id" class="font-weight-bold text-dark">FLK-001</span></p>
                    </div>
                </div>
                <button type="button" class="btn btn-link text-muted p-2 modal-close-btn" data-dismiss="modal">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body px-4 py-4">
                <div id="mortalityFormNotification"></div>
                <form id="recordMortalityForm" novalidate>
                    <input type="hidden" name="flock_id" id="mortality_flock_id">
                    
                    <!-- Date & Count -->
                    <div class="form-row mb-4">
                        <div class="form-group col-md-6">
                            <label class="text-uppercase font-weight-bold text-muted mb-2" style="font-size: 10px; letter-spacing: 0.05em;">Date of Event</label>
                            <div class="position-relative">
                                <input id="mortalityDatePicker" class="form-control rounded-xl border-secondary-light px-3 bg-white" style="height: 48px; font-size: 14px;" type="text" name="mortality_date" readonly required/>
                                <span class="material-symbols-outlined position-absolute text-muted" style="right: 12px; top: 50%; transform: translateY(-50%); pointer-events: none; font-size: 18px;">calendar_today</span>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label class="text-uppercase font-weight-bold text-muted mb-2" style="font-size: 10px; letter-spacing: 0.05em;">Bird Count</label>
                            <div class="position-relative">
                                <input class="form-control rounded-xl border-secondary-light px-3" style="height: 48px; font-size: 14px;" placeholder="0" type="number" name="mortality_count" id="mortality_count" required min="1"/>
                                <span class="position-absolute font-weight-bold text-muted" style="right: 12px; top: 50%; transform: translateY(-50%); font-size: 10px;">BIRDS</span>
                            </div>
                        </div>
                    </div>

                    <!-- Reason -->
                    <div class="form-group mb-4">
                        <label class="text-uppercase font-weight-bold text-muted mb-2" style="font-size: 10px; letter-spacing: 0.05em;">Primary Reason</label>
                        <div class="position-relative">
                            <select class="form-control rounded-xl border-secondary-light px-3 custom-select-premium" style="height: 48px; font-size: 14px;" name="reason" id="mortality_reason" required>
                                <option value="" disabled selected>Select reason...</option>
                                <option value="disease">Disease / Infection</option>
                                <option value="injury">Injury / Trauma</option>
                                <option value="environmental">Environmental (Heat/Cold)</option>
                                <option value="predation">Predation</option>
                                <option value="culling">Management Culling</option>
                                <option value="unknown">Unknown Causes</option>
                            </select>
                            <span class="material-symbols-outlined position-absolute text-muted" style="right: 12px; top: 50%; transform: translateY(-50%); pointer-events: none;">expand_more</span>
                        </div>
                    </div>

                    <!-- Notes -->
                    <div class="form-group mb-0">
                        <label class="text-uppercase font-weight-bold text-muted mb-2" style="font-size: 10px; letter-spacing: 0.05em;">Observations & Notes</label>
                        <textarea class="form-control rounded-xl border-secondary-light p-3" style="font-size: 14px; resize: none;" placeholder="Provide additional context..." rows="3" name="notes"></textarea>
                    </div>
                </form>
            </div>

            <!-- Modal Footer -->
            <div class="modal-footer px-4 py-4 border-top-0 bg-light-soft justify-content-end">
                <button type="button" class="btn btn-outline-secondary rounded-xl px-4 py-2 mr-2" data-dismiss="modal" style="font-size: 13px; font-weight: 500;">Cancel</button>
                <button type="submit" form="recordMortalityForm" id="saveMortalityBtn" class="btn btn-danger rounded-xl px-5 py-2 shadow-sm" style="font-size: 13px; font-weight: 500; background-color: #ba1a1a; border-color: #ba1a1a;">Confirm Record</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#recordMortalityForm').on('submit', function(e) {
            e.preventDefault();
            const notification = $('#mortalityFormNotification');
            notification.empty();

            const validationRules = [
                { name: 'mortality_date', label: 'Date of Event', selector: '#mortalityDatePicker' },
                { name: 'mortality_count', label: 'Bird Count', selector: '#mortality_count' },
                { name: 'reason', label: 'Primary Reason', selector: '#mortality_reason' }
            ];

            for (let rule of validationRules) {
                const $field = $(rule.selector);
                const value = $field.val();
                
                if (!value || (typeof value === 'string' && value.trim() === "") || value === null) {
                    if (typeof showAlert === 'function') {
                        notification.html(showAlert("info", `Please provide a valid <b>${rule.label}</b> before confirming.`, 1));
                    }
                    $field.focus();
                    notification.hide().fadeIn(300);
                    return false;
                }
            }

            // AJAX Submission
            const $form = $(this);
            const formData = $form.serialize();
            const $submitBtn = $('#saveMortalityBtn');
            
            $submitBtn.prop('disabled', true).html('<span class="spinner-border spinner-border-sm mr-2"></span>Processing...');

            $.ajax({
                url: base_path + 'controllers/poultryflockoperations.php?action=savemortality',
                type: 'POST',
                data: formData,
                success: function(response) {
                    $submitBtn.prop('disabled', false).text('Confirm Record');
                    try {
                        const res = JSON.parse(response);
                        if (res.status === 'success') {
                            if (typeof showAlert === 'function') {
                                notification.html(showAlert("success", res.message, 1));
                            }
                            
                            $form[0].reset();

                            // Trigger refresh if overview exists
                            if (typeof fetchFlocks === 'function') {
                                fetchFlocks();
                            }

                            setTimeout(() => {
                                $('#recordMortalityModal').modal('hide');
                                notification.empty();
                            }, 1500);
                        } else {
                            if (typeof showAlert === 'function') {
                                notification.html(showAlert("danger", res.message, 1));
                            }
                        }
                    } catch (e) {
                        if (typeof showAlert === 'function') {
                            notification.html(showAlert("danger", "An unexpected error occurred while saving.", 1));
                        }
                    }
                },
                error: function(xhr, status, error) {
                    $submitBtn.prop('disabled', false).text('Confirm Record');
                    if (typeof showAlert === 'function') {
                        notification.html(showAlert("danger", `Server Error: ${error}`, 1));
                    }
                }
            });
        });

        // Clear notification on input
        $('#recordMortalityForm input, #recordMortalityForm select, #recordMortalityForm textarea').on('input change', function() {
            $('#mortalityFormNotification').fadeOut(200, function() {
                $(this).empty().show();
            });
        });
    });
</script>

<style>
    .bg-danger-light { background-color: rgba(186, 26, 26, 0.1); }
    .bg-light-soft { background-color: #f8f9fa; }
    .rounded-2xl { border-radius: 1rem !important; }
    .border-secondary-light { border-color: #e2e8f0 !important; }
</style>

