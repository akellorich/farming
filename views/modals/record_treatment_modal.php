<!-- Record Treatment Modal -->
<div id="recordTreatmentModal" class="v-modal-overlay" style="display: none; align-items: center; justify-content: center;">
    <div class="v-modal-content" style="width: 100%; max-width: 800px; height: 90vh; border-radius: 1.5rem; overflow: hidden; display: flex; flex-direction: column;">
        <div class="v-modal-body p-0 d-flex flex-column h-100" style="background: white;">
            <!-- Modal Header -->
            <div class="v-modal-header d-flex justify-content-between align-items-center px-4 py-3" style="border-bottom: 1px solid #f1f5f1; background: #fafafa;">
                <div>
                    <h3 class="mb-1" style="font-size: 1.15rem; color: #1a4d1a; font-weight: 700;">Record Protocol Execution</h3>
                    <p class="text-muted small mb-0" id="record-protocol-name">Logging completed treatment for selected animals</p>
                </div>
                <button class="btn btn-icon hover-bg-stone rounded-circle close-modal-btn">
                    <i class="fal fa-times"></i>
                </button>
            </div>

            <!-- Modal Content (Scrollable) -->
            <div class="flex-grow-1 overflow-auto px-4 py-4">
                <form id="recordTreatmentForm">
                    <input type="hidden" name="scheduleid" id="rt_scheduleid">
                    <input type="hidden" name="action" id="rt_action">

                    <!-- Step 1: Batch Details -->
                    <div class="mb-4">
                        <div class="d-flex align-items-center mb-3">
                            <div class="rounded-circle d-flex align-items-center justify-content-center mr-2" style="width: 24px; height: 24px; background: var(--primary); color: white; font-size: 0.75rem; font-weight: bold;">1</div>
                            <h4 class="mb-0" style="font-size: 0.95rem; font-weight: 600; color: #1a1c19;">Batch Details</h4>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="v-label">Execution Date</label>
                                <div class="v-input-wrapper">
                                    <input type="text" name="execution_date" id="rt_date" class="v-input-field" placeholder="DD-MMM-YYYY" required>
                                    <i class="fal fa-calendar-alt v-input-icon"></i>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="v-label">Administered By</label>
                                <div class="v-input-wrapper">
                                    <select name="administered_by" id="rt_administered_by" class="v-input-field" required>
                                        <!-- Populated via getveterinariansselect -->
                                    </select>
                                    <i class="fal fa-user-md v-input-icon"></i>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="v-label">Product / Brand Name</label>
                                <div class="v-input-wrapper">
                                    <input type="text" name="product_used" id="rt_product" class="v-input-field" placeholder="e.g. Aftovax, Albendazole 10%" required>
                                    <i class="fal fa-vial v-input-icon"></i>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3" id="rt_batch_group">
                                <label class="v-label">Batch / Lot Number</label>
                                <div class="v-input-wrapper">
                                    <input type="text" name="batch_no" id="rt_batch" class="v-input-field" placeholder="e.g. BN-2024-X1">
                                    <i class="fal fa-barcode v-input-icon"></i>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="v-label">Dosage (per animal)</label>
                                <div class="v-input-wrapper">
                                    <input type="text" name="dosage" id="rt_dosage" class="v-input-field" placeholder="e.g. 2ml, 50ml">
                                    <i class="fal fa-syringe v-input-icon"></i>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3" id="rt_method_group" style="display: none;">
                                <label class="v-label">Method</label>
                                <div class="v-input-wrapper">
                                    <select name="method" id="rt_method" class="v-input-field">
                                        <option value="Oral Drench">Oral Drench</option>
                                        <option value="Subcutaneous Injection">Subcutaneous Injection</option>
                                        <option value="Intramuscular Injection">Intramuscular Injection</option>
                                        <option value="Topical">Topical</option>
                                    </select>
                                    <i class="fal fa-hand-holding-magic v-input-icon"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Step 2: Animal Selection -->
                    <div>
                        <div class="d-flex align-items-center mb-3">
                            <div class="rounded-circle d-flex align-items-center justify-content-center mr-2" style="width: 24px; height: 24px; background: var(--primary); color: white; font-size: 0.75rem; font-weight: bold;">2</div>
                            <h4 class="mb-0" style="font-size: 0.95rem; font-weight: 600; color: #1a1c19;">Animal Checklist</h4>
                        </div>
                        <div class="p-3" style="background: #f8faf8; border-radius: 1rem; border: 1px solid #edf2ed;">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <span class="text-muted small font-weight-600">Select animals treated from target pens</span>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="rt_selectAll">
                                    <label class="custom-control-label small font-weight-700" for="rt_selectAll" style="cursor: pointer;">Select All</label>
                                </div>
                            </div>
                            <div id="rt_animal_list" class="row row-cols-2 g-2">
                                <!-- Populated based on schedule pens -->
                                <div class="col text-center py-4 text-muted small italic w-100">Loading animals...</div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mt-4">
                        <label class="v-label">Activity Notes</label>
                        <textarea name="notes" class="v-input-field" rows="2" style="height: auto;" placeholder="Any observations or reactions during treatment..."></textarea>
                    </div>
                </form>
            </div>

            <!-- Modal Footer -->
            <div class="v-modal-footer px-4 py-3 d-flex justify-content-end gap-3" style="border-top: 1px solid #f1f5f1; background: #fafafa;">
                <button class="btn border hover-bg-stone px-4 close-modal-btn" style="border-radius: 0.75rem; height: 48px; font-weight: 600; color: #475569;">Cancel</button>
                <button type="submit" form="recordTreatmentForm" class="btn btn-success px-5 d-flex align-items-center gap-2" style="border-radius: 0.75rem; height: 48px; font-weight: 600; background-color: var(--primary); border: none;">
                    <i class="fal fa-check-circle"></i>
                    <span>Confirm & Log Execution</span>
                </button>
            </div>
        </div>
    </div>
</div>
