<!-- Record Vaccination Activity Modal -->
<div id="recordVaccinationModal" class="v-modal-overlay" style="display: none; align-items: center; justify-content: center;">
    <div class="v-modal-content" style="width: 100%; max-width: 800px; height: 90vh; border-radius: 1.5rem; overflow: hidden; display: flex; flex-direction: column;">
        <div class="v-modal-body p-0 d-flex flex-column h-100" style="background: white;">
            <!-- Modal Header -->
            <div class="v-modal-header d-flex justify-content-between align-items-center px-4 py-3" style="border-bottom: 1px solid #f1f5f1; background: #f0fdf4;">
                <div>
                    <div class="d-flex align-items-center gap-2 mb-1">
                        <span class="material-symbols-outlined text-success" style="font-variation-settings: 'FILL' 1;">shield_with_heart</span>
                        <h3 class="mb-0" style="font-size: 1.15rem; color: #166534; font-weight: 700;">Record Vaccination Execution</h3>
                    </div>
                    <p class="text-muted small mb-0" id="rv-protocol-name">Logging completed vaccination for selected animals</p>
                </div>
                <button class="btn btn-icon hover-bg-stone rounded-circle close-modal-btn">
                    <i class="fal fa-times"></i>
                </button>
            </div>

            <!-- Modal Content (Scrollable) -->
            <div class="flex-grow-1 overflow-auto px-4 py-4">
                <form id="recordVaccinationForm">
                    <input type="hidden" name="scheduleid" id="rv_scheduleid">
                    <input type="hidden" name="action" value="recordvaccination">

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="v-label">Vaccination Date</label>
                            <div class="v-input-wrapper">
                                <input type="text" name="execution_date" id="rv_date" class="v-input-field v_datepicker" placeholder="DD-MMM-YYYY" required>
                                <i class="fal fa-calendar-alt v-input-icon"></i>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="v-label">Administered By</label>
                            <div class="v-input-wrapper">
                                <select name="administered_by" id="rv_administered_by" class="v-input-field" required>
                                </select>
                                <i class="fal fa-user-md v-input-icon"></i>
                            </div>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label class="v-label">Vaccine / Product Name</label>
                            <div class="v-input-wrapper">
                                <input type="text" name="product_used" id="rv_product" class="v-input-field" placeholder="e.g. Aftovax, LumpyVax" required>
                                <i class="fal fa-vial v-input-icon"></i>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="v-label">Batch / Lot Number</label>
                            <div class="v-input-wrapper">
                                <input type="text" name="batch_no" id="rv_batch" class="v-input-field" placeholder="e.g. BN-2024-X1">
                                <i class="fal fa-barcode v-input-icon"></i>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="v-label">Dosage (per animal)</label>
                            <div class="v-input-wrapper">
                                <input type="text" name="dosage" id="rv_dosage" class="v-input-field" placeholder="e.g. 2ml">
                                <i class="fal fa-syringe v-input-icon"></i>
                            </div>
                        </div>
                    </div>

                    <div class="mt-4">
                        <div class="p-3" style="background: #f8faf8; border-radius: 1rem; border: 1px solid #edf2ed;">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <span class="font-weight-600" style="font-size: 0.85rem; color: #1a4d1a;">Animal Checklist</span>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="rv_selectAll" checked>
                                    <label class="custom-control-label small font-weight-700" for="rv_selectAll" style="cursor: pointer;">Select All</label>
                                </div>
                            </div>
                            <div id="rv_animal_list" class="row row-cols-2 g-2">
                                <div class="col text-center py-4 text-muted small w-100">Loading animals...</div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mt-4">
                        <label class="v-label">Vaccination Notes</label>
                        <textarea name="notes" class="v-input-field" rows="2" style="height: auto;" placeholder="Any observations during vaccination..."></textarea>
                    </div>
                </form>
            </div>

            <!-- Modal Footer -->
            <div class="v-modal-footer px-4 py-3 d-flex justify-content-end gap-3" style="border-top: 1px solid #f1f5f1; background: #fafafa;">
                <button class="btn border hover-bg-stone px-4 close-modal-btn" style="border-radius: 0.75rem; height: 48px; font-weight: 600;">Cancel</button>
                <button type="submit" form="recordVaccinationForm" class="btn btn-success px-5 d-flex align-items-center gap-2" style="border-radius: 0.75rem; height: 48px; font-weight: 600; background-color: #166534; border: none;">
                    <i class="fal fa-shield-check"></i>
                    <span>Log Vaccination</span>
                </button>
            </div>
        </div>
    </div>
</div>
