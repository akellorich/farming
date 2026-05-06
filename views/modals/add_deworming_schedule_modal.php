<!-- Deworming Schedule Modal -->
<div id="dewormingModal" class="v-modal-overlay" style="display: none; backdrop-filter: blur(12px); background-color: rgba(0, 0, 0, 0.4);">
    <div class="v-modal-wrapper">
        <div class="v-modal-container botanical-shadow-lg">
            
            <!-- Left Sidebar (Botanical Brand) -->
            <div class="v-modal-sidebar d-none d-lg-flex">
                <!-- Decorative Botanical Background -->
                <div class="v-modal-sidebar-bg">
                    <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuDFARTsU3dpTtLaqQZZWEzRoQsVTkW2LZYB78FAfz1SBY2W6OIBOldnQliXBIvhRWjAbBhtqw7NZHEF59yxTxZCQkYUl1-1ybbRJQ-UsMRllbSjF9hXSN-c_-rfVCVw_jGbNz67Djy2XtM6bpN-wPhESOQ01sZzn10eHyURHljP_wLaZ0XVyLJw4ExQIEezXyPQRxcHQBoZy5MpYH9h9bkoD98IbLlQpRDyG9x854G4NFV2ze3uhSAN_Kgj7uDSZBnHHexFESZe113y" alt="Botanical Pattern">
                </div>
                
                <div class="v-modal-sidebar-content">
                    <span class="material-symbols-outlined v-modal-icon">medication</span>
                    <h2 class="v-modal-title">Deworming Schedule</h2>
                    <p class="v-modal-desc">Maintain optimal herd hygiene and parasite control through systematic deworming protocols.</p>
                    
                    <div class="mt-auto">
                        <div class="v-modal-badge">
                            <div class="v-modal-dot"></div>
                            <p class="v-modal-badge-text">Protocol-First Design</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Side (Form) -->
            <div class="v-modal-form-area position-relative">
                <div class="v-modal-header mb-4">
                    <div>
                        <h3 class="font-headline font-weight-bold text-on-surface mb-1" style="font-size: 1.35rem;">Deworming Schedule Details</h3>
                        <p class="text-muted small mb-0">Specify the drug and timing for the parasite control protocol.</p>
                    </div>
                    <button type="button" class="close-modal-btn position-absolute" style="top: 2rem; right: 2rem; border: none; background: transparent; color: #94a3b8; transition: color 0.2s;">
                        <span class="material-symbols-outlined" style="font-size: 1.5rem;">close</span>
                    </button>
                </div>

                <form id="dewormingForm" class="v-modal-form">
                    <input type="hidden" name="id" value="0">
                    <input type="hidden" name="action" value="savedewormingschedule">
                    
                    <div id="deworming-modal-alert" style="display: none;" class="mb-3"></div>
                    <div class="row">
                        <!-- Proposed Drug -->
                        <div class="col-12 mb-4">
                            <label class="font-label text-muted d-block mb-2" style="font-size: 0.725rem !important;">Proposed Drug</label>
                            <div class="v-input-wrapper">
                                <input type="text" class="form-control v-form-control" name="schedulename" placeholder="e.g., Albendazole, Ivermectin">
                                <span class="material-symbols-outlined v-input-icon" style="color: #94a3b8 !important;">medication</span>
                            </div>
                        </div>

                        <!-- Target Pens -->
                        <div class="col-12 mb-4">
                            <label class="font-label text-muted d-block mb-2" style="font-size: 0.725rem !important;">Target Pens</label>
                            <div class="pen-multiselect">
                                <div class="pen-multiselect-trigger penTrigger" id="d_penTrigger">
                                    <span id="d_penDisplay" class="penDisplay">Select Pens</span>
                                    <span class="material-symbols-outlined" style="font-size: 1.2rem; color: #666;">arrow_drop_down</span>
                                </div>
                                <div class="pen-multiselect-menu penMenu" id="d_penMenu">
                                    <div class="pen-search-wrapper">
                                        <input type="text" class="pen-search-input penSearch" id="d_penSearch" placeholder="Search...">
                                    </div>
                                    <div class="pen-list" id="d_pen_list">
                                        <!-- Dynamically populated -->
                                        <div class="text-center py-3 text-muted small">Loading pens...</div>
                                    </div>
                                    <div class="pen-footer">
                                        <div class="d-flex gap-2">
                                            <button type="button" class="pen-footer-btn penSelectAll" id="d_penSelectAll" title="Select All">
                                                <span class="material-symbols-outlined" style="font-size: 1.2rem;">select_all</span>
                                            </button>
                                            <button type="button" class="pen-footer-btn penDeselectAll" id="d_penDeselectAll" title="Clear Selection">
                                                <span class="material-symbols-outlined" style="font-size: 1.2rem;">deselect</span>
                                            </button>
                                        </div>
                                        <button type="button" class="pen-footer-btn penConfirm" id="d_penConfirm" title="Confirm">
                                            <span class="material-symbols-outlined" style="font-size: 1.2rem; color: #4caf50;">check_circle</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Date and Time -->
                        <div class="col-md-6 mb-4">
                            <label class="font-label text-muted d-block mb-2" style="font-size: 0.725rem !important;">Scheduled Date</label>
                            <div class="v-input-wrapper">
                                <input type="text" id="d_datepicker" name="scheduledate" class="form-control v-form-control v_datepicker" placeholder="DD-MMM-YYYY">
                                <span class="material-symbols-outlined v-input-icon" style="color: #94a3b8 !important;">calendar_today</span>
                            </div>
                        </div>

                        <div class="col-md-6 mb-4">
                            <label class="font-label text-muted d-block mb-2" style="font-size: 0.725rem !important;">Scheduled Time</label>
                            <div class="v-input-wrapper">
                                <input type="time" class="form-control v-form-control" name="scheduletime">
                            </div>
                        </div>

                        <!-- Repeat Annually Toggle -->
                        <div class="col-12 mb-4">
                            <div class="d-flex align-items-center justify-content-between repeat-annually-container">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="icon-circle bg-primary-light text-primary" style="width: 32px; height: 32px; border-radius: 50%; display: flex; align-items: center; justify-content: center; background: rgba(32, 98, 35, 0.1);">
                                        <span class="material-symbols-outlined" style="font-size: 1.1rem;">event_repeat</span>
                                    </div>
                                    <div>
                                        <p class="mb-0 font-weight-bold" style="font-size: 0.85rem; color: var(--on-surface);">Repeat Annually</p>
                                        <p class="text-muted mb-0" style="font-size: 0.7rem;">Automate this protocol every year</p>
                                    </div>
                                </div>
                                <label class="switch mb-0">
                                    <input type="checkbox" id="d_repeat_annually" name="repeat_annually">
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>

                        <!-- Notes -->
                        <div class="col-12 mb-4">
                            <label class="font-label text-muted d-block mb-2" style="font-size: 0.725rem !important;">Notes & Instructions</label>
                            <textarea class="form-control v-form-control" name="notes" rows="2" placeholder="Additional details..."></textarea>
                        </div>
                    </div>

                    <!-- Footer Actions -->
                    <div class="v-modal-footer d-flex justify-content-end align-items-center mt-3">
                        <button type="button" class="btn btn-outline-secondary close-modal-btn" style="border-radius: 0.75rem; font-size: 0.85rem; font-weight: 500; border-color: #e2e8f0; color: #64748b; height: 46px; width: 140px;">
                            Cancel
                        </button>
                        <button type="submit" class="btn btn-success v-btn-save shadow-sm ml-4" style="height: 46px; border-radius: 0.75rem; padding-left: 2rem; padding-right: 2rem; font-weight: 500;">
                            Save Schedule
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
