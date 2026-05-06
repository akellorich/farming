<!-- Record Deworming Activity Modal -->
<div id="recordDewormingModal" class="v-modal-overlay" style="display: none; align-items: center; justify-content: center;">
    <div class="v-modal-content" style="width: 100%; max-width: 800px; height: 90vh; border-radius: 1.5rem; overflow: hidden; display: flex; flex-direction: column;">
        <div class="v-modal-body p-0 d-flex flex-column h-100" style="background: white;">
            <!-- Modal Header -->
            <div class="v-modal-header d-flex justify-content-between align-items-center px-4 py-3" style="border-bottom: 1px solid #f1f5f1; background: #fffbeb;">
                <div>
                    <div class="d-flex align-items-center gap-2 mb-1">
                        <span class="material-symbols-outlined text-warning" style="font-variation-settings: 'FILL' 1;">pill</span>
                        <h3 class="mb-0" style="font-size: 1.15rem; color: #92400e; font-weight: 700;">Record Deworming Execution</h3>
                    </div>
                    <p class="text-muted small mb-0" id="rd-protocol-name">Logging completed deworming for selected animals</p>
                </div>
                <button class="btn btn-icon hover-bg-stone rounded-circle close-modal-btn">
                    <i class="fal fa-times"></i>
                </button>
            </div>

            <!-- Modal Content (Scrollable) -->
            <div class="flex-grow-1 overflow-auto px-4 py-4">
                <form id="recordDewormingForm">
                    <input type="hidden" name="scheduleid" id="rd_scheduleid">
                    <input type="hidden" name="action" value="recorddeworming">

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="v-label">Deworming Date</label>
                            <div class="v-input-wrapper">
                                <input type="text" name="execution_date" id="rd_date" class="v-input-field v_datepicker" placeholder="DD-MMM-YYYY" required>
                                <i class="fal fa-calendar-alt v-input-icon"></i>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="v-label">Administered By</label>
                            <div class="v-input-wrapper">
                                <select name="administered_by" id="rd_administered_by" class="v-input-field" required>
                                </select>
                                <i class="fal fa-user-md v-input-icon"></i>
                            </div>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label class="v-label">Dewormer / Product Name</label>
                            <div class="v-input-wrapper">
                                <input type="text" name="product_used" id="rd_product" class="v-input-field" placeholder="e.g. Albendazole 10%, Ivermectin" required>
                                <i class="fal fa-capsules v-input-icon"></i>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="v-label">Method of Administration</label>
                            <div class="v-input-wrapper">
                                <select name="method" id="rd_method" class="v-input-field">
                                    <option value="Oral Drench">Oral Drench</option>
                                    <option value="Subcutaneous Injection">Subcutaneous Injection</option>
                                    <option value="Intramuscular Injection">Intramuscular Injection</option>
                                    <option value="Topical / Pour-on">Topical / Pour-on</option>
                                </select>
                                <i class="fal fa-hand-holding-magic v-input-icon"></i>
                            </div>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="v-label">Dosage (per animal)</label>
                            <div class="v-input-wrapper">
                                <input type="text" name="dosage" id="rd_dosage" class="v-input-field" placeholder="e.g. 50ml">
                                <i class="fal fa-syringe v-input-icon"></i>
                            </div>
                        </div>
                    </div>

                    <div class="mt-4">
                        <div class="p-3" style="background: #fffcf5; border-radius: 1rem; border: 1px solid #fef3c7;">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <span class="font-weight-600" style="font-size: 0.85rem; color: #92400e;">Animal Checklist</span>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="rd_selectAll" checked>
                                    <label class="custom-control-label small font-weight-700" for="rd_selectAll" style="cursor: pointer;">Select All</label>
                                </div>
                            </div>
                            <div id="rd_animal_list" class="row row-cols-2 g-2">
                                <div class="col text-center py-4 text-muted small w-100">Loading animals...</div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="mt-4">
                        <label class="v-label">Deworming Notes</label>
                        <textarea name="notes" class="v-input-field" rows="2" style="height: auto;" placeholder="Any observations during treatment..."></textarea>
                    </div>
                </form>
            </div>

            <!-- Modal Footer -->
            <div class="v-modal-footer px-4 py-3 d-flex justify-content-end gap-3" style="border-top: 1px solid #f1f5f1; background: #fafafa;">
                <button class="btn border hover-bg-stone px-4 close-modal-btn" style="border-radius: 0.75rem; height: 48px; font-weight: 600;">Cancel</button>
                <button type="submit" form="recordDewormingForm" class="btn btn-warning px-5 d-flex align-items-center gap-2" style="border-radius: 0.75rem; height: 48px; font-weight: 600; background-color: #d97706; border: none; color: white;">
                    <i class="fal fa-check-circle"></i>
                    <span>Log Deworming</span>
                </button>
            </div>
        </div>
    </div>
</div>
