/* 
 * Jukam Poultry Management System - Poultry Settings Logic
 * File: js/poultrysettings.js
 */

$(document).ready(function() {
    // Tab Switching Logic
    $('.settings-tab-btn').on('click', function() {
        const tabId = $(this).data('tab');
        
        // Update Buttons
        $('.settings-tab-btn').removeClass('active');
        $(this).addClass('active');
        
        // Move indicator
        $('.settings-tab-indicator').remove();
        $(this).append('<span class="settings-tab-indicator"></span>');
        
        // Show/Hide Content
        $('.settings-tab-content').hide();
        $('#tab-' + tabId).fadeIn(300);

        // Fetch Data for the selected tab
        fetchTabData(tabId);
    });

    // Initial Fetch
    fetchTabData('breeds');
    fetchTabData('diseases'); // Ensure diseases are cached for vax schedule rows
    loadInventoryCategories();
    loadDiseaseTypes();

    $('#addHubBtn').on('click', function() {
        const $modal = $('#addDistributionPointModal');
        const $form = $('#addHubForm');
        $modal.find('h4').text('Add Distribution Hub');
        $form[0].reset();
        $form.find('[name="id"]').val(0);
        $modal.find('.notification-area').empty();
        $modal.modal('show');
    });

    function loadInventoryCategories() {
        $.ajax({
            url: '../controllers/poultrysettingsoperations.php?action=getinventorycategories',
            type: 'GET',
            success: function(response) {
                try {
                    const categories = JSON.parse(response);
                    const $select = $('select[name="category_id"]');
                    $select.empty().append('<option value="" disabled selected>Select existing category...</option>');
                    
                    categories.forEach(cat => {
                        $select.append(`<option value="${cat.categoryid}">${cat.categoryname}</option>`);
                    });

                    // Render Summary Cards if on inventory tab
                    renderCategoryCards(categories);
                } catch (e) {
                    console.error("Error loading categories:", e);
                }
            }
        });
    }

    function loadDiseaseTypes() {
        $.ajax({
            url: '../controllers/poultrysettingsoperations.php?action=getdiseasetypes',
            type: 'GET',
            success: function(response) {
                try {
                    const types = JSON.parse(response);
                    const $select = $('#disease_type_id');
                    $select.empty().append('<option value="" disabled selected>Select disease type...</option>');
                    
                    types.forEach(t => {
                        $select.append(`<option value="${t.typeid}">${t.typename}</option>`);
                    });
                } catch (e) {
                    console.error("Error loading disease types:", e);
                }
            }
        });
    }

    let allInventoryItems = []; 
    let tabDataCache = {};

    function renderCategoryCards(categories) {
        const $container = $('#category-cards-container');
        $container.empty();

        const themes = [
            { bg: '#ecfdf5', icon: '#10b981', color: 'emerald', glyph: 'nutrition' },
            { bg: '#eff6ff', icon: '#3b82f6', color: 'blue', glyph: 'vaccines' },
            { bg: '#fef2f2', icon: '#ef4444', color: 'red', glyph: 'medication' },
            { bg: '#fff7ed', icon: '#f97316', color: 'orange', glyph: 'inventory_2' },
            { bg: '#faf5ff', icon: '#a855f7', color: 'purple', glyph: 'category' }
        ];

        const totalItems = categories.reduce((sum, cat) => sum + parseInt(cat.itemcount || 0), 0);
        const allCard = `
            <div class="col-6 col-md-2 mb-3">
                <div class="category-card active-filter" data-category="all" style="cursor: pointer; border-width: 2px; border-color: var(--primary);">
                    <div class="category-icon-box" style="background: #f3f4f6; color: #374151;">
                        <span class="material-symbols-outlined">inventory_2</span>
                    </div>
                    <div>
                        <div class="category-count">${totalItems}</div>
                        <div class="category-label">All Items</div>
                    </div>
                </div>
            </div>
        `;
        $container.append(allCard);

        categories.forEach((cat, index) => {
            const theme = themes[index % themes.length];
            let icon = theme.glyph;
            
            if (cat.categoryname.toLowerCase().includes('feed')) icon = 'nutrition';
            else if (cat.categoryname.toLowerCase().includes('vaccine')) icon = 'vaccines';
            else if (cat.categoryname.toLowerCase().includes('supp')) icon = 'medication';

            const card = `
                <div class="col-6 col-md-2 mb-3">
                    <div class="category-card" data-category="${cat.categoryname}" style="cursor: pointer;">
                        <div class="category-icon-box" style="background: ${theme.bg}; color: ${theme.icon};">
                            <span class="material-symbols-outlined">${icon}</span>
                        </div>
                        <div>
                            <div class="category-count">${cat.itemcount || 0}</div>
                            <div class="category-label text-truncate" style="max-width: 80px;">${cat.categoryname}</div>
                        </div>
                    </div>
                </div>
            `;
            $container.append(card);
        });

        $('.category-card').on('click', function() {
            const category = $(this).data('category');
            
            $('.category-card').removeClass('active-filter').css({
                'border-color': 'var(--outline-variant)',
                'border-width': '1px'
            });
            $(this).addClass('active-filter').css({
                'border-color': 'var(--primary)',
                'border-width': '2px'
            });

            if (category === 'all') {
                renderTable('inventory', allInventoryItems, $('#tab-inventory').find('tbody'), $('#tab-inventory').find('.premium-card'));
            } else {
                const filtered = allInventoryItems.filter(item => item.categoryname === category);
                renderTable('inventory', filtered, $('#tab-inventory').find('tbody'), $('#tab-inventory').find('.premium-card'));
            }
        });
    }

    function fetchTabData(tab) {
        let action = '';
        switch(tab) {
            case 'breeds': action = 'getbreeds'; break;
            case 'bird-type': action = 'getbirdtypes'; break;
            case 'flock-stage': action = 'getflockstages'; break;
            case 'houses': action = 'gethouses'; break;
            case 'inventory': action = 'getinventoryitems'; break;
            case 'formulation': action = 'getformulations'; break;
            case 'diseases': action = 'getdiseases'; break;
            case 'mortality': action = 'getmortalityreasons'; break;
            case 'distribution-points': 
                fetchDistributionHubs();
                return;
        }

        if (!action) return;

        const $tbody = $('#tab-' + tab).find('tbody');
        const $card = $('#tab-' + tab).find('.premium-card');

        $.ajax({
            url: '../controllers/poultrysettingsoperations.php?action=' + action,
            type: 'GET',
            success: function(response) {
                try {
                    const data = typeof response === 'string' ? JSON.parse(response) : response;
                    tabDataCache[tab] = data; 
                    if (tab === 'inventory') allInventoryItems = data; 
                    renderTable(tab, data, $tbody, $card);
                } catch (e) {
                    console.error("Parse Error for " + tab + ":", e, response);
                }
            }
        });
    }

    function fetchDistributionHubs() {
        const $tbody = $('#tab-distribution-points').find('tbody');
        const $card = $('#tab-distribution-points').find('.premium-card');

        $.ajax({
            url: '../controllers/poultrydistributionoperations.php?action=getpoints',
            type: 'GET',
            success: function(response) {
                try {
                    const data = typeof response === 'string' ? JSON.parse(response) : response;
                    tabDataCache['distribution-points'] = data;
                    renderTable('distribution-points', data, $tbody, $card);
                } catch (e) {
                    console.error("Parse Error for distribution-points:", e, response);
                }
            }
        });
    }

    function renderTable(tab, data, $tbody, $card) {
        $tbody.empty();
        
        if (!data || data.length === 0) {
            let icon = 'folder_open';
            let message = 'No records found in this section.';
            
            if (tab === 'inventory') icon = 'inventory_2';
            else if (tab === 'formulation') icon = 'science';
            else if (tab === 'diseases') icon = 'coronavirus';

            $card.find('.empty-state').remove();
            $tbody.closest('.table-responsive').hide();
            
            $card.append(`
                <div class="empty-state">
                    <span class="material-symbols-outlined">${icon}</span>
                    <p class="mb-0">${message}</p>
                </div>
            `);
            return;
        }

        $card.find('.empty-state').remove();
        $tbody.closest('.table-responsive').show();

        data.forEach(item => {
            let row = '';
            if (tab === 'breeds') {
                const status = item.status || 'Active';
                const badgeClass = status === 'Active' ? 'badge-success' : 'badge-danger';
                row = `
                    <tr>
                        <td class="font-weight-bold">${item.breedname}</td>
                        <td>${item.category}</td>
                        <td><span class="badge ${badgeClass} px-3 py-2 rounded-pill">${status}</span></td>
                        <td>${item.notes || '-'}</td>
                        <td class="text-right">${getActionMenu(item.breedid, 'breeds')}</td>
                    </tr>
                `;
            } else if (tab === 'bird-type') {
                row = `
                    <tr>
                        <td class="font-weight-bold">${item.typename}</td>
                        <td>${item.description || '-'}</td>
                        <td class="font-weight-bold text-success">${item.maturityperiod || 130} Days</td>
                        <td class="text-right">${getActionMenu(item.typeid, 'bird-type')}</td>
                    </tr>
                `;
            } else if (tab === 'flock-stage') {
                row = `
                    <tr>
                        <td class="font-weight-bold">${item.stagename}</td>
                        <td>${item.birdtype}</td>
                        <td>${item.duration}</td>
                        <td class="font-weight-bold text-success">${item.feedquantity || 140}g</td>
                        <td class="text-right">${getActionMenu(item.stageid, 'flock-stage')}</td>
                    </tr>
                `;
            } else if (tab === 'houses') {
                const statusClass = item.status === 'Active' ? 'badge-success' : 'badge-warning';
                row = `
                    <tr>
                        <td class="font-weight-bold">${item.housename}</td>
                        <td>${item.capacity || '0'}</td>
                        <td>${item.currentstock || '0'}</td>
                        <td><span class="badge ${statusClass} px-3 py-2 rounded-pill">${item.status}</span></td>
                        <td class="text-right">${getActionMenu(item.houseid, 'houses')}</td>
                    </tr>
                `;
            } else if (tab === 'inventory') {
                const typeBadge = item.isfeed == 1 ? '<span class="badge badge-info px-2 py-1 rounded-pill ml-2" style="font-size: 10px;">Feed</span>' : '';
                row = `
                    <tr>
                        <td class="font-weight-bold">${item.itemname} ${typeBadge}</td>
                        <td><code class="text-primary font-weight-bold">${item.itemcode}</code></td>
                        <td>${item.categoryname || 'Uncategorized'}</td>
                        <td>${item.unit}</td>
                        <td class="text-right">${getActionMenu(item.itemid, 'inventory')}</td>
                    </tr>
                `;
            } else if (tab === 'diseases') {
                const badgeClass = item.severity === 'Critical' ? 'badge-danger' : (item.severity === 'High' ? 'badge-warning' : 'badge-info');
                row = `
                    <tr>
                        <td class="font-weight-bold">${item.diseasename}</td>
                        <td>${item.diseasetype || 'General'}</td>
                        <td><span class="badge ${badgeClass} px-3 py-2 rounded-pill">${item.severity}</span></td>
                        <td class="text-muted small">${item.description || '-'}</td>
                        <td class="text-right">${getActionMenu(item.diseaseid, 'diseases')}</td>
                    </tr>
                `;
            } else if (tab === 'mortality') {
                row = `
                    <tr>
                        <td class="font-weight-bold">${item.reasonlabel}</td>
                        <td>${item.description || '-'}</td>
                        <td class="text-right">${getActionMenu(item.reasonid, 'mortality')}</td>
                    </tr>
                `;
            } else if (tab === 'formulation') {
                row = `
                    <tr>
                        <td class="font-weight-bold">${item.formulationname}</td>
                        <td>${item.birdtype} - ${item.growthstage}</td>
                        <td>Recipe Defined</td>
                        <td class="text-right">${getActionMenu(item.formulationid, 'formulation')}</td>
                    </tr>
                `;
            } else if (tab === 'distribution-points') {
                row = `
                    <tr>
                        <td class="font-weight-bold">${item.pointname}</td>
                        <td>${item.location || '-'}</td>
                        <td>${item.contactperson || '-'}</td>
                        <td>${item.contactphone || '-'}</td>
                        <td class="text-right">${getActionMenu(item.pointid, 'distribution-points')}</td>
                    </tr>
                `;
            }
            $tbody.append(row);
        });

        // Initialize DataTable with Responsiveness
        const tableIdMap = {
            'breeds': '#breedsTable',
            'bird-type': '#birdTypeTable',
            'flock-stage': '#flockStageTable',
            'houses': '#housesTable',
            'inventory': '#inventoryTable',
            'formulation': '#formulationTable',
            'diseases': '#diseasesTable',
            'mortality': '#mortalityTable',
            'distribution-points': '#distributionPointsTable'
        };

        const targetSelector = tableIdMap[tab];
        if (targetSelector && $.fn.DataTable) {
            if ($.fn.DataTable.isDataTable(targetSelector)) {
                $(targetSelector).DataTable().destroy();
            }

            $(targetSelector).DataTable({
                responsive: true,
                dom: 'rtip',
                pageLength: 10,
                columnDefs: [
                    { responsivePriority: 1, targets: 0 }, // Primary Name
                    { responsivePriority: 1, targets: -1 }, // Actions (High priority for mobile)
                    { responsivePriority: 2, targets: 1 }, // Secondary Category/Type
                    { responsivePriority: 10, targets: '_all' } // All others lower priority
                ],
                language: {
                    search: "_INPUT_",
                    searchPlaceholder: "Search records...",
                    info: "Page _PAGE_ of _PAGES_",
                    paginate: {
                        next: '<span class="material-symbols-outlined" style="font-size: 18px;">chevron_right</span>',
                        previous: '<span class="material-symbols-outlined" style="font-size: 18px;">chevron_left</span>'
                    }
                }
            });
        }
    }

    function getActionMenu(id, tab) {
        return `
            <div class="dropdown">
                <button class="btn btn-link text-muted p-0" type="button" data-toggle="dropdown">
                    <span class="material-symbols-outlined">more_vert</span>
                </button>
                <div class="dropdown-menu dropdown-menu-right actions-dropdown">
                    <a class="action-item" href="javascript:void(0)" onclick="editRecord(${id}, '${tab}')">
                        <span class="material-symbols-outlined">edit</span> Edit
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="action-item text-danger" href="javascript:void(0)" onclick="deleteRecord(${id}, '${tab}')">
                        <span class="material-symbols-outlined">delete</span> Delete
                    </a>
                </div>
            </div>
        `;
    }

    // Global Action Functions
    $('.btn-add-premium').on('click', function() {
        const target = $(this).data('target');
        const $modal = $(target);
        
        // Reset all forms within this modal
        $modal.find('form').each(function() {
            this.reset();
            $(this).find('input[type="hidden"][name="id"]').val(0);
        });

        // Clear notifications
        $modal.find('.notification-area').empty();

        // Restore default titles
        let title = '';
        if (target === '#addBreedModal') title = 'Add Poultry Breed';
        else if (target === '#addBirdTypeModal') title = 'Add Bird Type';
        else if (target === '#addFlockStageModal') title = 'Add Growth Stage';
        else if (target === '#addHouseModal') title = 'Add Poultry House';
        else if (target === '#addItemModal') title = 'Poultry Inventory';
        else if (target === '#addDiseaseModal') title = 'Record Disease';
        else if (target === '#addMortalityReasonModal') title = 'Add Mortality Reason';
        else if (target === '#addFormulationModal') title = 'Create Formulation';

        if (title) $modal.find('h4').text(title);

        // Special case for inventory auto-toggle
        $modal.find('.item-code-input, .cat-code-input').val('[AUTO]').prop('readonly', true).css({ 'background-color': '#f3f4f6', 'color': '#6b7280' });
        
        // Clear vaccination schedule container in bird type modal
        if (target === '#addBirdTypeModal') {
            $('#vax-schedule-list-container').empty().append(`
                <div class="empty-vax-state text-center py-4 bg-light-soft rounded-xl border-dashed">
                    <span class="material-symbols-outlined text-muted mb-2" style="font-size: 32px;">event_note</span>
                    <p class="text-muted small mb-0">No vaccination events defined yet.</p>
                </div>
            `);
        }
    });

    window.editRecord = function(id, tab) {
        const data = tabDataCache[tab];
        if (!data) return;

        const record = data.find(r => (r.breedid || r.typeid || r.stageid || r.houseid || r.itemid || r.categoryid || r.diseaseid || r.reasonid || r.formulationid || r.pointid) == id);
        if (!record) return;

        let $modal, $form;

        switch(tab) {
            case 'breeds':
                $modal = $('#addBreedModal'); $form = $('#addBreedForm');
                $modal.find('h4').text('Edit Poultry Breed');
                $form.find('[name="id"]').val(record.breedid);
                $form.find('[name="breed_name"]').val(record.breedname);
                $form.find('[name="category"]').val(record.category);
                $form.find('[name="status"]').val(record.status);
                $form.find('[name="notes"]').val(record.notes);
                break;
            case 'bird-type':
                $modal = $('#addBirdTypeModal'); $form = $('#addBirdTypeForm');
                $modal.find('h4').text('Edit Bird Type');
                $form.find('[name="id"]').val(record.typeid);
                $form.find('[name="type_name"]').val(record.typename);
                $form.find('[name="maturity_period"]').val(record.maturityperiod || 130);
                $form.find('[name="description"]').val(record.description);
                
                // Load Vaccination Schedule
                const $container = $('#vax-schedule-list-container');
                $container.empty().append('<div class="text-center py-3"><div class="spinner-border spinner-border-sm text-primary"></div></div>');
                
                $.ajax({
                    url: '../controllers/poultrysettingsoperations.php?action=getbirdtypevaccinations&id=' + record.typeid,
                    type: 'GET',
                    success: function(response) {
                        $container.empty();
                        try {
                            const schedule = JSON.parse(response);
                            if (schedule && schedule.length > 0) {
                                schedule.forEach(event => {
                                    addVaxScheduleRow(event);
                                });
                            } else {
                                $container.append(`
                                    <div class="empty-vax-state text-center py-4 bg-light-soft rounded-xl border-dashed">
                                        <span class="material-symbols-outlined text-muted mb-2" style="font-size: 32px;">event_note</span>
                                        <p class="text-muted small mb-0">No vaccination events defined yet.</p>
                                    </div>
                                `);
                            }
                        } catch (e) {
                            console.error("Error loading schedule:", e);
                        }
                    }
                });
                break;
            case 'flock-stage':
                $modal = $('#addFlockStageModal'); $form = $('#addFlockStageForm');
                $modal.find('h4').text('Edit Growth Stage');
                $form.find('[name="id"]').val(record.stageid);
                $form.find('[name="stage_name"]').val(record.stagename);
                $form.find('[name="bird_type"]').val(record.birdtype);
                $form.find('[name="duration"]').val(record.duration);
                $form.find('[name="feed_quantity"]').val(record.feedquantity || 140);
                break;
            case 'houses':
                $modal = $('#addHouseModal'); $form = $('#addHouseForm');
                $modal.find('h4').text('Edit Poultry House');
                $form.find('[name="id"]').val(record.houseid);
                $form.find('[name="house_name"]').val(record.housename);
                $form.find('[name="capacity"]').val(record.capacity);
                $form.find('[name="status"]').val(record.status);
                break;
            case 'inventory':
                $modal = $('#addItemModal'); $form = $('#addItemForm');
                $modal.find('h4').text('Edit Inventory Item');
                $form.find('[name="id"]').val(record.itemid);
                $form.find('[name="item_name"]').val(record.itemname);
                $form.find('[name="item_code"]').val(record.itemcode).prop('readonly', true);
                $form.find('[name="category_id"]').val(record.categoryid);
                $form.find('[name="unit"]').val(record.unit);
                $form.find('[name="is_feed"]').prop('checked', record.isfeed == 1);
                $('#toggle-category-btn').hide();
                break;
            case 'diseases':
                $modal = $('#addDiseaseModal'); $form = $('#addDiseaseForm');
                $modal.find('h4').text('Edit Disease Profile');
                $form.find('[name="id"]').val(record.diseaseid);
                $form.find('[name="disease_name"]').val(record.diseasename);
                $form.find('[name="type_id"]').val(record.typeid);
                $form.find('[name="severity"]').val(record.severity);
                $form.find('[name="description"]').val(record.description);
                break;
            case 'mortality':
                $modal = $('#addMortalityReasonModal'); $form = $('#addMortalityReasonForm');
                $modal.find('h4').text('Edit Mortality Reason');
                $form.find('[name="id"]').val(record.reasonid);
                $form.find('[name="reason_label"]').val(record.reasonlabel);
                $form.find('[name="description"]').val(record.description);
                break;
            case 'distribution-points':
                $modal = $('#addDistributionPointModal'); $form = $('#addHubForm');
                $modal.find('h4').text('Edit Distribution Hub');
                $form.find('[name="id"]').val(record.pointid);
                $form.find('[name="pointname"]').val(record.pointname);
                $form.find('[name="location"]').val(record.location);
                $form.find('[name="contactperson"]').val(record.contactperson);
                $form.find('[name="contactphone"]').val(record.contactphone);
                break;
        }

        if ($modal) {
            $modal.find('.notification-area').empty();
            $modal.modal('show');
        }
    };

    window.deleteRecord = function(id, tab) {
        // Show confirmation modal instead of standard confirm()
        $('#delete-record-id').val(id);
        $('#delete-record-tab').val(tab);
        $('#delete-reason').val('');
        $('#deleteConfirmModal').find('.notification-area').empty();
        
        const record = tabDataCache[tab].find(r => (r.breedid || r.typeid || r.stageid || r.houseid || r.itemid || r.categoryid || r.diseaseid || r.reasonid || r.formulationid || r.pointid) == id);
        const name = record ? (record.breedname || record.typename || record.stagename || record.housename || record.itemname || record.diseasename || record.reasonlabel || record.formulationname || record.pointname) : 'this record';
        
        $('#delete-modal-subtitle').html(`Confirm deletion of <strong>${name}</strong>`);
        $('#deleteConfirmModal').modal('show');
    };

    $(document).on('click', '#confirm-delete-btn', function() {
        const id = $('#delete-record-id').val();
        const tab = $('#delete-record-tab').val();
        const reason = $('#delete-reason').val();
        const $notifArea = $('#deleteConfirmModal').find('.notification-area');

        if (!reason.trim()) {
            if (typeof showAlert === 'function') $notifArea.html(showAlert('info', 'Please provide a reason for deletion.'));
            $('#delete-reason').focus();
            return;
        }

        let action = '';
        switch(tab) {
            case 'breeds': action = 'deletebreed'; break;
            case 'bird-type': action = 'deletebirdtype'; break;
            case 'flock-stage': action = 'deleteflockstage'; break;
            case 'houses': action = 'deletehouse'; break;
            case 'inventory': action = 'deleteinventoryitem'; break;
            case 'diseases': action = 'deletedisease'; break;
            case 'mortality': action = 'deletemortalityreason'; break;
            case 'formulation': action = 'deleteformulation'; break;
            case 'distribution-points': action = 'deletepoint'; break;
        }

        if (!action) return;

        $.ajax({
            url: '../controllers/poultrysettingsoperations.php?action=' + action,
            type: 'POST',
            data: { id: id, reason: reason },
            success: function(response) {
                try {
                    const res = JSON.parse(response);
                    if (res.status === 'success') {
                        $('#deleteConfirmModal').modal('hide');
                        
                        // Show message above the table
                        const $tableAlert = $('#tab-' + tab).find('.table-alert-area');
                        if (typeof showAlert === 'function') {
                            $tableAlert.html(showAlert('success', res.message));
                            
                            // Auto-hide after 5 seconds
                            setTimeout(() => {
                                $tableAlert.fadeOut(500, function() {
                                    $(this).empty().show();
                                });
                            }, 5000);
                        }
                        
                        fetchTabData(tab);
                    } else {
                        if (typeof showAlert === 'function') $notifArea.html(showAlert('danger', res.message));
                    }
                } catch (e) {
                    console.error("Delete Error:", e);
                }
            }
        });
    });

    // Row Management Events
    $(document).on('click', '.remove-ingredient-btn', function() {
        if ($('.ingredient-row').length > 1) $(this).closest('.ingredient-row').remove();
    });

    $(document).on('click', '#add-ingredient-btn', function() {
        const newRow = `
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
        `;
        $('#ingredients-list-container').append(newRow);
    });

    // Inventory Modal Toggle Logic
    $(document).on('click', '.inventory-toggle', function() {
        const target = $(this).data('target');
        $('.inventory-toggle').removeClass('active-toggle-btn');
        $(this).addClass('active-toggle-btn');
        $('.inventory-section').hide();
        $('#' + target).show();
        
        if (target === 'section-category') {
            $('#inventory-submit-btn').attr('form', 'addCategoryForm').text('Create Category');
        } else {
            $('#inventory-submit-btn').attr('form', 'addItemForm').text('Register Item');
        }
    });

    // Vaccination Schedule Management
    function addVaxScheduleRow(data = null) {
        const $container = $('#vax-schedule-list-container');
        $container.find('.empty-vax-state').remove();

        const diseases = tabDataCache['diseases'] || [];
        let diseaseOptions = '<option value="" disabled selected>Select Disease...</option>';
        diseases.forEach(d => {
            const selected = data && data.diseaseid == d.diseaseid ? 'selected' : '';
            diseaseOptions += `<option value="${d.diseaseid}" ${selected}>${d.diseasename}</option>`;
        });

        const row = `
            <div class="vax-row bg-light-soft p-2 mb-2" style="border-radius: 10px; border: 1px solid #f3f4f6;">
                <div class="form-row align-items-end">
                    <div class="col-md-2">
                        <label class="form-label-premium mb-1" style="font-size: 9px; opacity: 0.8;">Min Age</label>
                        <input type="number" class="form-control-premium w-100" style="font-size: 11px; height: 32px; padding: 0 8px;" name="vax_min_age[]" value="${data ? data.minage : ''}" required min="0" placeholder="Day">
                    </div>
                    <div class="col-md-2">
                        <label class="form-label-premium mb-1" style="font-size: 9px; opacity: 0.8;">Max Age</label>
                        <input type="number" class="form-control-premium w-100" style="font-size: 11px; height: 32px; padding: 0 8px;" name="vax_max_age[]" value="${data ? data.maxage : ''}" required min="0" placeholder="Day">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label-premium mb-1" style="font-size: 9px; opacity: 0.8;">Disease</label>
                        <select class="form-control-premium w-100" style="font-size: 11px; height: 32px; padding: 0 8px;" name="vax_disease_id[]" required>
                            ${diseaseOptions}
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label-premium mb-1" style="font-size: 9px; opacity: 0.8;">Narration/Note</label>
                        <input type="text" class="form-control-premium w-100" style="font-size: 11px; height: 32px; padding: 0 8px;" name="vax_narration[]" value="${data ? (data.narration || '') : ''}" placeholder="e.g. 1st Dose">
                    </div>
                    <div class="col-md-1 text-right">
                        <button type="button" class="btn btn-link text-danger p-0 remove-vax-btn" style="opacity: 0.4; transition: opacity 0.2s;">
                            <span class="material-symbols-outlined" style="font-size: 20px;">delete</span>
                        </button>
                    </div>
                </div>
            </div>
        `;
        $container.append(row);
    }

    $(document).on('click', '#add-vax-schedule-btn', function() {
        addVaxScheduleRow();
    });

    $(document).on('click', '.remove-vax-btn', function() {
        $(this).closest('.vax-row').remove();
        if ($('#vax-schedule-list-container .vax-row').length === 0) {
            $('#vax-schedule-list-container').append(`
                <div class="empty-vax-state text-center py-4 bg-light-soft rounded-xl border-dashed">
                    <span class="material-symbols-outlined text-muted mb-2" style="font-size: 32px;">event_note</span>
                    <p class="text-muted small mb-0">No vaccination events defined yet.</p>
                </div>
            `);
        }
    });

    // Auto-generate Toggle
    $(document).on('click', '#itemCodeAutoToggle, #catCodeAutoToggle', function() {
        $(this).toggleClass('active');
        const isAuto = $(this).hasClass('active');
        const $input = $(this).closest('.input-group-premium').find('input');
        
        if (isAuto) {
            $input.val('[AUTO]').prop('readonly', true).css({ 'background-color': '#f3f4f6', 'color': '#6b7280' });
        } else {
            $input.val('').prop('readonly', false).css({ 'background-color': '#ffffff', 'color': '#1f2937' }).focus();
        }
    });

    // Clear notifications on input
    $(document).on('input change', '.modal-body-premium input, .modal-body-premium select, .modal-body-premium textarea', function() {
        $(this).closest('.modal-body-premium').find('.notification-area').empty();
    });

    // Form Submission
    $(document).on('submit', 'form', function(e) {
        e.preventDefault();
        const $form = $(this);
        const formId = $form.attr('id');
        if (!formId || (!formId.startsWith('add') && formId !== 'addItemForm')) return;
        
        // Handle Hub Button specially since it might not be inside a modal in some contexts, 
        // but here it follows the pattern.

        let isValid = true;
        const $modal = $form.closest('.modal');
        const $notifArea = $modal.find('.notification-area');

        $form.find('[required]').each(function() {
            if (!$(this).val()) {
                const label = $(this).closest('.form-group, .col-md-4, .col-md-8, .col-6, .flex-grow-1').find('label').text() || 'This field';
                if (typeof showAlert === 'function') {
                    $notifArea.html(showAlert('info', label + ' is required'));
                }
                $(this).focus();
                isValid = false;
                return false;
            }
        });
        
        if (!isValid) return;

        let action = '';
        if (formId === 'addBreedForm') action = 'savebreed';
        else if (formId === 'addBirdTypeForm') action = 'savebirdtype';
        else if (formId === 'addFlockStageForm') action = 'saveflockstage';
        else if (formId === 'addHouseForm') action = 'savehouse';
        else if (formId === 'addItemForm') action = 'saveinventoryitem';
        else if (formId === 'addCategoryForm') action = 'saveinventorycategory';
        else if (formId === 'addDiseaseForm') action = 'savedisease';
        else if (formId === 'addMortalityReasonForm') action = 'savemortalityreason';
        else if (formId === 'addFormulationForm') action = 'saveformulation';
        else if (formId === 'addHubForm') action = 'savepoint';

        if (!action) return;

        let controllerUrl = '../controllers/poultrysettingsoperations.php?action=' + action;
        if (formId === 'addHubForm') controllerUrl = '../controllers/poultrydistributionoperations.php?action=' + action;

        const formData = new FormData(this);
        $.ajax({
            url: controllerUrl,
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                try {
                    const res = JSON.parse(response);
                    if (res.status === 'success') {
                        if (typeof showAlert === 'function') $notifArea.html(showAlert('success', res.message));
                        fetchTabData($('.settings-tab-btn.active').data('tab'));
                        if (typeof loadInventoryCategories === 'function') loadInventoryCategories();

                        // Auto-close modal after 1.5 seconds so they can see success message
                        setTimeout(() => {
                            $modal.modal('hide');
                            // Small delay to allow modal hide animation before reset
                            setTimeout(() => {
                                $form[0].reset();
                                $form.find('input[type="hidden"][name="id"]').val(0);
                                $form.find('.item-code-input, .cat-code-input').val('[AUTO]').prop('readonly', true).css({ 'background-color': '#f3f4f6', 'color': '#6b7280' });
                                $form.find('.btn-auto-toggle').addClass('active');
                            }, 300);
                        }, 1500);
                    } else {
                        if (typeof showAlert === 'function') $notifArea.html(showAlert('danger', res.message));
                        if (res.field) $form.find('[name="' + res.field + '"]').focus();
                    }
                } catch (e) {
                    console.error("Submission Error:", e, response);
                }
            },
            error: function(xhr, status, error) {
                if (typeof showAlert === 'function') $notifArea.html(showAlert('danger', 'System error: ' + error));
            }
        });
    });

    // Tabs Horizontal Scrolling
    $('#tabs-scroll-left').on('click', function() {
        $('.settings-tabs-wrapper').animate({ scrollLeft: '-=200' }, 300);
    });

    $('#tabs-scroll-right').on('click', function() {
        $('.settings-tabs-wrapper').animate({ scrollLeft: '+=200' }, 300);
    });
});
