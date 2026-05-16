<?php
/**
 * Jukam Poultry Management System - Settings Modals
 * File: views/poultry_settings_modals.php
 */
?>

<!-- Common Styles for Settings Modals externalized to css/poultrysettings.css -->

<!-- Modal: Add Breed -->
<div class="modal fade" id="addBreedModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-2xl overflow-hidden">
            <div class="modal-header-premium">
                <div class="d-flex align-items-center">
                    <div class="modal-icon-box">
                        <span class="material-symbols-outlined">layers</span>
                    </div>
                    <div>
                        <h4 class="h5 font-weight-bold mb-0">Add Poultry Breed</h4>
                        <p class="text-muted small mb-0">Define a new genetic profile.</p>
                    </div>
                </div>
                <button type="button" class="btn btn-link text-muted p-0" data-dismiss="modal">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>
            <div class="modal-body-premium">
                <div class="notification-area mb-3"></div>
                <form id="addBreedForm" novalidate>
                    <input type="hidden" name="id" value="0">
                    <div class="form-group mb-4">
                        <label class="form-label-premium">Breed Name</label>
                        <input type="text" class="form-control-premium w-100" placeholder="e.g. ISA Brown" name="breed_name" required>
                    </div>
                    <div class="form-group mb-4">
                        <label class="form-label-premium">Category</label>
                        <select class="form-control-premium w-100" name="category" required>
                            <option value="Layers">Layers</option>
                            <option value="Broilers">Broilers</option>
                            <option value="Kienyeji">Kienyeji</option>
                        </select>
                    </div>
                    <div class="form-group mb-4">
                        <label class="form-label-premium">Status</label>
                        <select class="form-control-premium w-100" name="status">
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                    <div class="form-group mb-0">
                        <label class="form-label-premium">Maturity Period</label>
                        <textarea class="form-control-premium w-100" rows="3" placeholder="e.g. 18-20 Weeks for peak production" name="notes"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer-premium">
                <button type="button" class="btn btn-cancel-premium" data-dismiss="modal">Cancel</button>
                <button type="submit" form="addBreedForm" class="btn btn-add-premium">Save Breed</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal: Add Bird Type -->
<div class="modal fade" id="addBirdTypeModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content rounded-2xl overflow-hidden">
            <div class="modal-header-premium">
                <div class="d-flex align-items-center">
                    <div class="modal-icon-box">
                        <span class="material-symbols-outlined">category</span>
                    </div>
                    <div>
                        <h4 class="h5 font-weight-bold mb-0">Add Bird Type</h4>
                        <p class="text-muted small mb-0">Classify birds by production role.</p>
                    </div>
                </div>
                <button type="button" class="btn btn-link text-muted p-0" data-dismiss="modal">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>
            <div class="modal-body-premium">
                <div class="notification-area mb-3"></div>
                <form id="addBirdTypeForm" novalidate>
                    <input type="hidden" name="id" value="0">
                    <div class="form-row">
                        <div class="form-group col-md-4 mb-4">
                            <label class="form-label-premium">Type Name</label>
                            <input type="text" class="form-control-premium w-100" placeholder="e.g. Dual Purpose" name="type_name" required>
                        </div>
                        <div class="form-group col-md-3 mb-4">
                            <label class="form-label-premium">Maturity (Days)</label>
                            <input type="number" class="form-control-premium w-100" placeholder="130" name="maturity_period" value="130" required min="1">
                        </div>
                        <div class="form-group col-md-5 mb-4">
                            <label class="form-label-premium">Description</label>
                            <input type="text" class="form-control-premium w-100" placeholder="Describe the purpose of this type" name="description">
                        </div>
                    </div>

                    <!-- Vaccination Schedule Section -->
                    <div class="mt-2 pt-3 border-top">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <div>
                                <h5 class="h6 font-weight-bold mb-0">Standard Vaccination Schedule</h5>
                                <p class="text-muted small mb-0">Define age-based protocols (in days)</p>
                            </div>
                            <button type="button" class="btn btn-link p-0 d-flex align-items-center font-weight-bold" id="add-vax-schedule-btn" style="font-size: 13px; text-decoration: none !important; color: #206223;">
                                <span class="material-symbols-outlined mr-1" style="font-size: 18px;">add</span>
                                Add Event
                            </button>
                        </div>
                        
                        <div id="vax-schedule-list-container" class="custom-scrollbar" style="max-height: 300px; overflow-y: auto; padding-right: 5px;">
                            <!-- Dynamic rows will be injected here -->
                            <div class="empty-vax-state text-center py-4 bg-light-soft rounded-xl border-dashed">
                                <span class="material-symbols-outlined text-muted mb-2" style="font-size: 32px;">event_note</span>
                                <p class="text-muted small mb-0">No vaccination events defined yet.</p>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer-premium">
                <button type="button" class="btn btn-cancel-premium" data-dismiss="modal">Cancel</button>
                <button type="submit" form="addBirdTypeForm" class="btn btn-add-premium">Save Type</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal: Add Flock Stage -->
<div class="modal fade" id="addFlockStageModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-2xl overflow-hidden">
            <div class="modal-header-premium">
                <div class="d-flex align-items-center">
                    <div class="modal-icon-box">
                        <span class="material-symbols-outlined">timeline</span>
                    </div>
                    <div>
                        <h4 class="h5 font-weight-bold mb-0">Add Growth Stage</h4>
                        <p class="text-muted small mb-0">Define a new stage in the flock lifecycle.</p>
                    </div>
                </div>
                <button type="button" class="btn btn-link text-muted p-0" data-dismiss="modal">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>
            <div class="modal-body-premium">
                <div class="notification-area mb-3"></div>
                <form id="addFlockStageForm" novalidate>
                    <input type="hidden" name="id" value="0">
                    <div class="form-group mb-4">
                        <label class="form-label-premium">Stage Name</label>
                        <input type="text" class="form-control-premium w-100" placeholder="e.g. Pullet" name="stage_name" required>
                    </div>
                    <div class="form-group mb-4">
                        <label class="form-label-premium">Mapped Bird Type</label>
                        <select class="form-control-premium w-100" name="bird_type" required>
                            <option value="Layers">Layers</option>
                            <option value="Broilers">Broilers</option>
                            <option value="Kienyeji">Kienyeji</option>
                        </select>
                    </div>
                    <div class="form-row mb-0">
                        <div class="form-group col-6 mb-0">
                            <label class="form-label-premium">Duration (Weeks)</label>
                            <input type="text" class="form-control-premium w-100" placeholder="e.g. 8-18 Weeks" name="duration" required>
                        </div>
                        <div class="form-group col-6 mb-0">
                            <label class="form-label-premium">Feed Qty (g)</label>
                            <input type="number" class="form-control-premium w-100" placeholder="140" name="feed_quantity" value="140" required min="1">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer-premium">
                <button type="button" class="btn btn-cancel-premium" data-dismiss="modal">Cancel</button>
                <button type="submit" form="addFlockStageForm" class="btn btn-add-premium">Save Stage</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal: Add House -->
<div class="modal fade" id="addHouseModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-2xl overflow-hidden">
            <div class="modal-header-premium">
                <div class="d-flex align-items-center">
                    <div class="modal-icon-box">
                        <span class="material-symbols-outlined">home</span>
                    </div>
                    <div>
                        <h4 class="h5 font-weight-bold mb-0">Add Poultry House</h4>
                        <p class="text-muted small mb-0">Register a new housing facility.</p>
                    </div>
                </div>
                <button type="button" class="btn btn-link text-muted p-0" data-dismiss="modal">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>
            <div class="modal-body-premium">
                <div class="notification-area mb-3"></div>
                <form id="addHouseForm" novalidate>
                    <input type="hidden" name="id" value="0">
                    <div class="form-group mb-4">
                        <label class="form-label-premium">House Name/ID</label>
                        <input type="text" class="form-control-premium w-100" placeholder="e.g. House E" name="house_name" required>
                    </div>
                    <div class="form-group mb-4">
                        <label class="form-label-premium">Max Capacity (Birds)</label>
                        <input type="number" class="form-control-premium w-100" placeholder="e.g. 1500" name="capacity" required min="1">
                    </div>
                    <div class="form-group mb-0">
                        <label class="form-label-premium">Initial Status</label>
                        <select class="form-control-premium w-100" name="status" required>
                            <option value="Active">Active / Ready</option>
                            <option value="Inactive">Inactive</option>
                            <option value="Under Maintenance">Under Maintenance</option>
                            <option value="Quarantine">Quarantine</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer-premium">
                <button type="button" class="btn btn-cancel-premium" data-dismiss="modal">Cancel</button>
                <button type="submit" form="addHouseForm" class="btn btn-add-premium">Save House</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal: Add Inventory Item / Category -->
<div class="modal fade" id="addItemModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-2xl overflow-hidden">
            <div class="modal-header-premium">
                <div class="d-flex align-items-center">
                    <div class="modal-icon-box">
                        <span class="material-symbols-outlined">inventory_2</span>
                    </div>
                    <div>
                        <h4 class="h5 font-weight-bold mb-0">Poultry Inventory</h4>
                        <p class="text-muted small mb-0">Register categories or individual items.</p>
                    </div>
                </div>
                <button type="button" class="btn btn-link text-muted p-0" data-dismiss="modal">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>
            <!-- Type Switcher -->
            <div class="px-4 pt-3">
                <div class="bg-light p-1 rounded-xl d-flex">
                    <button type="button" class="btn btn-sm flex-grow-1 rounded-lg py-2 border-0 active-toggle-btn inventory-toggle" data-target="section-item" id="toggle-item-btn">Inventory Item</button>
                    <button type="button" class="btn btn-sm flex-grow-1 rounded-lg py-2 border-0 inventory-toggle" data-target="section-category" id="toggle-category-btn">New Category</button>
                </div>
            </div>

            <div class="modal-body-premium pt-3">
                <div class="notification-area mb-3"></div>
                
                <!-- Section: Inventory Item -->
                <div id="section-item" class="inventory-section">
                    <form id="addItemForm" novalidate>
                        <input type="hidden" name="id" value="0">
                        <input type="hidden" name="entry_type" value="item">
                        <div class="form-group mb-4">
                            <label class="form-label-premium">Item Name</label>
                            <input type="text" class="form-control-premium w-100" placeholder="e.g. Layers Mash" name="item_name" required>
                        </div>
                        
                        <div class="form-group mb-4">
                            <label class="form-label-premium">Item Code</label>
                            <div class="input-group-premium">
                                <input type="text" class="form-control-premium w-100 item-code-input" value="[AUTO]" name="item_code" readonly style="background-color: #f3f4f6; color: #6b7280; font-weight: 700; padding-right: 55px;">
                                <button type="button" class="btn-auto-toggle active" id="itemCodeAutoToggle" title="Auto-generate">
                                    <span class="material-symbols-outlined" style="font-size: 18px;">auto_awesome</span>
                                </button>
                            </div>
                        </div>

                        <div class="form-group mb-4">
                            <label class="form-label-premium">Assigned Category</label>
                            <select class="form-control-premium w-100" name="category_id" required>
                                <option value="" disabled selected>Select existing category...</option>
                                <option value="1">Feeds</option>
                                <option value="2">Vaccines</option>
                                <option value="3">Supplements</option>
                            </select>
                        </div>
                        
                        <div class="bg-light-soft p-3 mb-4">
                            <div class="d-flex align-items-center justify-content-between">
                                <div>
                                    <p class="font-weight-bold mb-0" style="font-size: 13px;">Is this a Feed item?</p>
                                    <p class="text-muted small mb-0">Enables consumption tracking & analytics.</p>
                                </div>
                                <div class="custom-control custom-switch">
                                    <input type="checkbox" class="custom-control-input" id="isFeedToggle" name="is_feed">
                                    <label class="custom-control-label" for="isFeedToggle" style="cursor: pointer;"></label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group mb-0">
                            <label class="form-label-premium">Unit of Measure</label>
                            <select class="form-control-premium w-100" name="unit" required>
                                <option value="" disabled selected>Select unit...</option>
                                <option value="kg">Kilogram (kg)</option>
                                <option value="Litre">Litre (L)</option>
                                <option value="ml">Millilitre (ml)</option>
                                <option value="Packet">Packet</option>
                                <option value="Vial">Vial</option>
                                <option value="Piece">Piece / Unit</option>
                                <option value="Bag">Bag</option>
                            </select>
                        </div>
                    </form>
                </div>

                <!-- Section: Inventory Category -->
                <div id="section-category" class="inventory-section" style="display: none;">
                    <form id="addCategoryForm" novalidate>
                        <input type="hidden" name="id" value="0">
                        <input type="hidden" name="entry_type" value="category">
                        <div class="form-row mb-4">
                            <div class="col-md-4">
                                <label class="form-label-premium">Cat. Code</label>
                                <div class="input-group-premium">
                                    <input type="text" class="form-control-premium w-100 cat-code-input" value="[AUTO]" name="cat_code" readonly style="background-color: #f3f4f6; color: #6b7280; font-weight: 700; padding-right: 55px;">
                                    <button type="button" class="btn-auto-toggle active" id="catCodeAutoToggle" title="Auto-generate">
                                        <span class="material-symbols-outlined" style="font-size: 18px;">auto_awesome</span>
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <label class="form-label-premium">Category Name</label>
                                <input type="text" class="form-control-premium w-100" placeholder="e.g. Broiler Starter" name="cat_name" required>
                            </div>
                        </div>
                        
                        <div class="bg-light-soft p-3 mb-4">
                            <p class="text-uppercase font-weight-bold text-muted mb-3" style="font-size: 9px; letter-spacing: 0.1em;">ID Auto-Generation Settings</p>
                            <div class="form-row mb-3">
                                <div class="col-6">
                                    <label class="form-label-premium">Prefix</label>
                                    <input type="text" class="form-control-premium w-100" placeholder="BRM-" name="prefix">
                                </div>
                                <div class="col-6">
                                    <label class="form-label-premium">Current No.</label>
                                    <input type="number" class="form-control-premium w-100" value="1" name="current_no" min="0">
                                </div>
                            </div>
                            <div class="d-flex align-items-center justify-content-between">
                                <div>
                                    <p class="font-weight-bold mb-0" style="font-size: 13px;">Pad Zeros</p>
                                    <p class="text-muted small mb-0">e.g. BRM-001 vs BRM-1</p>
                                </div>
                                <div class="custom-control custom-switch">
                                    <input type="checkbox" class="custom-control-input" id="padZerosToggle" name="pad_zeros" checked>
                                    <label class="custom-control-label" for="padZerosToggle" style="cursor: pointer;"></label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
            <div class="modal-footer-premium">
                <button type="button" class="btn btn-cancel-premium" data-dismiss="modal">Cancel</button>
                <button type="submit" form="addItemForm" class="btn btn-add-premium" id="inventory-submit-btn">Register Item</button>
            </div>
        </div>
    </div>
</div>

<style>
    .active-toggle-btn {
        background: white !important;
        box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        color: var(--primary) !important;
        font-weight: 700 !important;
    }
    .inventory-toggle {
        color: #6b7280;
        font-weight: 500;
        transition: all 0.2s;
    }
    .bg-light-soft { 
        background-color: #f9fafb; 
        border-radius: 16px !important;
        border: 1px solid #f3f4f6 !important;
    }
</style>




<!-- Modal: Add Disease -->
<div class="modal fade" id="addDiseaseModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-2xl overflow-hidden">
            <div class="modal-header-premium">
                <div class="d-flex align-items-center">
                    <div class="modal-icon-box">
                        <span class="material-symbols-outlined">coronavirus</span>
                    </div>
                    <div>
                        <h4 class="h5 font-weight-bold mb-0">Record Disease</h4>
                        <p class="text-muted small mb-0">Add a new disease profile to the registry.</p>
                    </div>
                </div>
                <button type="button" class="btn btn-link text-muted p-0" data-dismiss="modal">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>
            <div class="modal-body-premium">
                <div class="notification-area mb-3"></div>
                <form id="addDiseaseForm" novalidate>
                    <input type="hidden" name="id" value="0">
                    <div class="form-group mb-4">
                        <label class="form-label-premium">Disease Name</label>
                        <input type="text" class="form-control-premium w-100" placeholder="e.g. Coccidiosis" name="disease_name" required>
                    </div>
                    <div class="form-group mb-4">
                        <label class="form-label-premium">Disease Type</label>
                        <select class="form-control-premium w-100" name="type_id" id="disease_type_id" required>
                            <option value="" disabled selected>Loading types...</option>
                        </select>
                    </div>
                    <div class="form-group mb-4">
                        <label class="form-label-premium">Severity Level</label>
                        <select class="form-control-premium w-100" name="severity" required>
                            <option value="Low">Low</option>
                            <option value="Medium">Medium</option>
                            <option value="High">High</option>
                            <option value="Critical">Critical</option>
                        </select>
                    </div>
                    <div class="form-group mb-0">
                        <label class="form-label-premium">Disease Description</label>
                        <textarea class="form-control-premium w-100" rows="3" placeholder="Symptoms, treatment notes, etc." name="description"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer-premium">
                <button type="button" class="btn btn-cancel-premium" data-dismiss="modal">Cancel</button>
                <button type="submit" form="addDiseaseForm" class="btn btn-add-premium">Save Disease</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal: Add Feed Formulation -->
<div class="modal fade" id="addFormulationModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-2xl overflow-hidden">
            <div class="modal-header-premium">
                <div class="d-flex align-items-center">
                    <div class="modal-icon-box">
                        <span class="material-symbols-outlined">science</span>
                    </div>
                    <div>
                        <h4 class="h5 font-weight-bold mb-0">Create Feed Formulation</h4>
                        <p class="text-muted small mb-0">Define a new nutritional recipe.</p>
                    </div>
                </div>
                <button type="button" class="btn btn-link text-muted p-0" data-dismiss="modal">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>
            <div class="modal-body-premium">
                <div class="notification-area mb-3"></div>
                <form id="addFormulationForm" novalidate>
                    <input type="hidden" name="id" value="0">
                    <div class="form-group mb-4">
                        <label class="form-label-premium">Formulation Name</label>
                        <input type="text" class="form-control-premium w-100" placeholder="e.g. Early Layers Mix" name="formulation_name" required>
                    </div>
                    <div class="form-row mb-4">
                        <div class="col-6">
                            <label class="form-label-premium">Target Bird Type</label>
                            <select class="form-control-premium w-100" name="bird_type" required>
                                <option value="Layers">Layers</option>
                                <option value="Broilers">Broilers</option>
                                <option value="Kienyeji">Kienyeji</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <label class="form-label-premium">Growth Stage</label>
                            <select class="form-control-premium w-100" name="growth_stage" required>
                                <option value="Chicks">Chicks</option>
                                <option value="Growers">Growers</option>
                                <option value="Layers">Layers</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group mb-0">
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <label class="form-label-premium mb-0">Formulation Ingredients</label>
                            <button type="button" class="btn btn-link text-primary p-0 d-flex align-items-center font-weight-bold" id="add-ingredient-btn" style="font-size: 13px; text-decoration: none !important;">
                                <span class="material-symbols-outlined mr-1" style="font-size: 18px;">add_circle</span>
                                Add Ingredient
                            </button>
                        </div>
                        
                        <div id="ingredients-list-container">
                            <!-- Initial Ingredient Row -->
                            <div class="ingredient-row bg-light-soft p-3 mb-3 d-flex align-items-center gap-3" style="border-radius: 12px; border: 1px solid #f3f4f6;">
                                <div class="flex-grow-1">
                                    <select class="form-control-premium w-100" name="ingredient_id[]" required>
                                        <option value="" disabled selected>Select Item...</option>
                                        <option value="1">Maize</option>
                                        <option value="2">Soya Bean Meal</option>
                                        <option value="3">Fish Meal</option>
                                        <option value="4">Lime</option>
                                    </select>
                                </div>
                                <div style="width: 100px;">
                                    <input type="number" class="form-control-premium w-100" placeholder="Qty" name="ingredient_qty[]" required step="0.01">
                                </div>
                                <button type="button" class="btn btn-link text-danger p-0 remove-ingredient-btn">
                                    <span class="material-symbols-outlined">delete</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer-premium">
                <button type="button" class="btn btn-cancel-premium" data-dismiss="modal">Cancel</button>
                <button type="submit" form="addFormulationForm" class="btn btn-add-premium">Save Formulation</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal: Add Mortality Reason -->
<div class="modal fade" id="addMortalityReasonModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-2xl overflow-hidden">
            <div class="modal-header-premium">
                <div class="d-flex align-items-center">
                    <div class="modal-icon-box">
                        <span class="material-symbols-outlined">heart_broken</span>
                    </div>
                    <div>
                        <h4 class="h5 font-weight-bold mb-0">Add Mortality Reason</h4>
                        <p class="text-muted small mb-0">Define a new cause for mortality logging.</p>
                    </div>
                </div>
                <button type="button" class="btn btn-link text-muted p-0" data-dismiss="modal">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>
            <div class="modal-body-premium">
                <div class="notification-area mb-3"></div>
                <form id="addMortalityReasonForm" novalidate>
                    <input type="hidden" name="id" value="0">
                    <div class="form-group mb-4">
                        <label class="form-label-premium">Reason Label</label>
                        <input type="text" class="form-control-premium w-100" placeholder="e.g. Predation" name="reason_label" required>
                    </div>
                    <div class="form-group mb-0">
                        <label class="form-label-premium">Description</label>
                        <textarea class="form-control-premium w-100" rows="3" placeholder="Explain the circumstances of this reason" name="description"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer-premium">
                <button type="button" class="btn btn-light rounded-xl px-4" data-dismiss="modal">Cancel</button>
                <button type="submit" form="addMortalityReasonForm" class="btn btn-add-premium">Save Reason</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal: Confirm Deletion -->
<div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-2xl overflow-hidden">
            <div class="modal-header-premium" style="background: #fef2f2;">
                <div class="d-flex align-items-center">
                    <div class="modal-icon-box" style="background: rgba(220, 38, 38, 0.1); color: #dc2626;">
                        <span class="material-symbols-outlined">delete_forever</span>
                    </div>
                    <div>
                        <h4 class="h5 font-weight-bold mb-0 text-danger">Confirm Deletion</h4>
                        <p class="text-muted small mb-0" id="delete-modal-subtitle">This action will archive the record.</p>
                    </div>
                </div>
                <button type="button" class="btn btn-link text-muted p-0" data-dismiss="modal">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>
            <div class="modal-body-premium">
                <div class="notification-area mb-3"></div>
                <input type="hidden" id="delete-record-id">
                <input type="hidden" id="delete-record-tab">
                
                <div class="form-group mb-0">
                    <label class="form-label-premium">Reason for Deletion</label>
                    <textarea class="form-control-premium w-100" id="delete-reason" rows="3" placeholder="Please provide a reason for this deletion (required for audit trail)" required></textarea>
                </div>
            </div>
            <div class="modal-footer-premium">
                <button type="button" class="btn btn-cancel-premium" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-add-premium" id="confirm-delete-btn" style="background: #dc2626;">Confirm Delete</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal: Add Distribution Hub -->
<div class="modal fade" id="addDistributionPointModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content rounded-2xl overflow-hidden">
            <div class="modal-header-premium">
                <div class="d-flex align-items-center">
                    <div class="modal-icon-box">
                        <span class="material-symbols-outlined">hub</span>
                    </div>
                    <div>
                        <h4 class="h5 font-weight-bold mb-0">Add Distribution Hub</h4>
                        <p class="text-muted small mb-0">Register a new delivery point for eggs.</p>
                    </div>
                </div>
                <button type="button" class="btn btn-link text-muted p-0" data-dismiss="modal">
                    <span class="material-symbols-outlined">close</span>
                </button>
            </div>
            <div class="modal-body-premium">
                <div class="notification-area mb-3"></div>
                <form id="addHubForm" novalidate>
                    <input type="hidden" name="id" value="0">
                    <div class="form-group mb-4">
                        <label class="form-label-premium">Hub Name</label>
                        <input type="text" class="form-control-premium w-100" placeholder="e.g. City Market Hub" name="pointname" required>
                    </div>
                    <div class="form-group mb-4">
                        <label class="form-label-premium">Location / Area</label>
                        <input type="text" class="form-control-premium w-100" placeholder="e.g. Nairobi CBD" name="location">
                    </div>
                    <div class="form-row mb-0">
                        <div class="form-group col-md-6 mb-0">
                            <label class="form-label-premium">Contact Person</label>
                            <input type="text" class="form-control-premium w-100" placeholder="Name" name="contactperson">
                        </div>
                        <div class="form-group col-md-6 mb-0">
                            <label class="form-label-premium">Contact Phone</label>
                            <input type="text" class="form-control-premium w-100" placeholder="Phone" name="contactphone">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer-premium">
                <button type="button" class="btn btn-cancel-premium" data-dismiss="modal">Cancel</button>
                <button type="submit" form="addHubForm" class="btn btn-add-premium">Save Hub</button>
            </div>
        </div>
    </div>
</div>
