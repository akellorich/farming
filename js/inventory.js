$(document).ready(function() {
    // Initialize DataTable
    if ($('#inventoryDataTable').length) {
        const table = $('#inventoryDataTable').DataTable({
            responsive: true,
            pageLength: 5,
            scrollX: false,
            dom: 't<"d-flex justify-content-between align-items-center p-3 border-top"ip>', 
            ajax: {
                url: "../controllers/inventoryoperations.php",
                data: { action: 'getitems' },
                dataSrc: ""
            },
            columns: [
                { 
                    data: "itemcode",
                    render: function(data) {
                        return `<span class="font-weight-bold" style="color: #059669; letter-spacing: 0.02rem;">${data}</span>`;
                    }
                },
                { 
                    data: "itemname",
                    render: function(data) {
                        return `<span class="font-weight-bold" style="color: #0f172a;">${data}</span>`;
                    }
                },
                { data: "categoryname", className: "text-muted" },
                { data: "uom", className: "text-muted" },
                { 
                    data: "unitprice",
                    render: function(data) {
                        return `<span class="text-muted">KES ${parseFloat(data).toLocaleString()}</span>`;
                    }
                },
                { 
                    data: "current_stock",
                    render: function(data) {
                        const val = parseFloat(data);
                        let color = "#059669"; // Green
                        if (val <= 10) color = "#d97706"; // Orange/Low
                        if (val <= 0) color = "#dc2626"; // Red/Out
                        return `<span class="font-weight-bold" style="color: ${color};">${val}</span>`;
                    }
                },
                { 
                    data: null,
                    render: function(data) {
                        const total = parseFloat(data.unitprice) * parseFloat(data.current_stock);
                        return `<span class="text-muted">KES ${total.toLocaleString()}</span>`;
                    }
                },
                {
                    data: null,
                    orderable: false,
                    className: "text-end align-middle",
                    render: function(data) {
                        return `
                            <div class="d-flex justify-content-end">
                                <div class="position-relative">
                                    <button class="btn btn-icon-only rounded-circle" onclick="toggleActionMenu(event, this)">
                                        <span class="material-symbols-outlined" style="font-size: 1.2rem; color: #64748b;">more_vert</span>
                                    </button>
                                    <div class="actions-dropdown botanical-shadow-sm">
                                        <a href="#" onclick="editItem(${data.id})">
                                            <span class="material-symbols-outlined">edit</span> 
                                            <span>Edit Item</span>
                                        </a>
                                        <a href="#" onclick="reorderStock(${data.id})">
                                            <span class="material-symbols-outlined">shopping_cart</span> 
                                            <span>Reorder Stock</span>
                                        </a>
                                        <div class="dropdown-divider"></div>
                                        <a href="#" onclick="viewStatement(${data.id})">
                                            <span class="material-symbols-outlined">description</span> 
                                            <span>View Statement</span>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        `;
                    }
                }
            ],


            columnDefs: [
                { responsivePriority: 1, targets: 0, className: 'dtr-control' }, // SKU / ID
                { responsivePriority: 1, targets: 7 }, // Actions
                { responsivePriority: 2, targets: 1 }, // Name
                { responsivePriority: 3, targets: 5 }, // Stock Qty
                { responsivePriority: 4, targets: 6 }  // Stock Value
            ],
            language: {
                info: "Page _PAGE_ of _PAGES_",
                infoEmpty: "Page 0 of 0",
                infoFiltered: "",
                paginate: {
                    previous: '<span class="material-symbols-outlined" style="font-size: 1.1rem;">chevron_left</span>',
                    next: '<span class="material-symbols-outlined" style="font-size: 1.1rem;">chevron_right</span>'
                }
            },
            drawCallback: function() {
                // Ensure the info text matches our botanical style
                $('.dataTables_info').addClass('text-muted mb-0').css({
                    'font-size': '0.85rem',
                    'font-weight': '600'
                });
            }

        });


        // External Search Integration
        $('#inventorySearch').on('keyup', function() {
            table.search(this.value).draw();
        });

        // Add Category Modal Toggle
        $('#addNewItemBtn').on('click', function() {
            $('#addCategoryModal').fadeIn(300);
        });

        // Add Inventory Item Modal Toggle
        $('#addAssetBtn').on('click', function() {
            // Reset Form for New Entry
            $('#itemId').val(0);
            $('#addItemForm')[0].reset();
            $('#autoGenerateCode').prop('checked', true).trigger('change');
            $('#itemTypeToggle').prop('checked', false).trigger('change');
            $('#isFeedToggle').prop('checked', false);
            
            // Restore Text
            $('.sidebar-headline').text('New Inventory Item');
            $('.sidebar-subtext').text('Provision new assets to your stock. Track reorder levels and pricing for efficient management.');
            $('#addItemForm button[type="submit"]').text('Save Item');

            getinventorycategorieslist($('#itemCategory'), 'choose');
            $('#addInventoryItemModal').fadeIn(300);
        });

        // Category Icon Preview Logic
        $('#categoryIcon').on('change', function() {
            const iconName = $(this).val();
            $('#categoryIconPreview').text(iconName);
        });

        // Close functions are globally accessible via window
        window.closeAddCategoryModal = function() {
            $('#addCategoryModal').fadeOut(200);
        };

        window.closeAddItemModal = function() {
            $('#addInventoryItemModal').fadeOut(200);
        };

        // Toggle Labels Update
        window.updateTypeLabels = function() {
            const isChecked = $('#itemTypeToggle').is(':checked');
            if (isChecked) {
                $('#typeIngredientLabel').css('color', 'var(--on-surface-variant)');
                $('#typeProductLabel').css('color', 'var(--primary)');
            } else {
                $('#typeIngredientLabel').css('color', 'var(--primary)');
                $('#typeProductLabel').css('color', 'var(--on-surface-variant)');
            }
        };

        // Custom Icon Dropdown Logic
        window.toggleCustomIconDropdown = function(event) {
            if (event) event.stopPropagation();
            $('#customIconOptions').toggleClass('show');
        };

        window.selectCustomIcon = function(value, name) {
            $('#categoryIcon').val(value);
            $('#categoryIconPreview').text(value);
            $('#selectedIconName').text(name);
            
            // Update active state in list
            $('.icon-option').removeClass('active');
            $(`.icon-option[data-value="${value}"]`).addClass('active');
            
            // Close dropdown
            $('#customIconOptions').removeClass('show');
        };

        // Close dropdown when clicking outside
        $(document).on('click', function(event) {
            if (!$(event.target).closest('.custom-icon-select-wrapper').length) {
                $('#customIconOptions').removeClass('show');
            }
        });

        // Save Category Logic
        $('#addCategoryForm').on('submit', function(e) {
            e.preventDefault();
            const notifications = $('#categoryModalAlert');
            notifications.empty();

            const data = {
                id: $('#categoryId').val() || 0,
                categorycode: $('#catCode').val().trim(),
                categoryname: $('#catName').val().trim(),
                categoryicon: $('#categoryIcon').val(),
                itemprefix: $('#itemPrefix').val().trim(),
                startingnumber: $('#startingNum').val(),
                padzeros: $('#padZeros').is(':checked') ? 1 : 0,
                action: 'savecategory'
            };

            // Validation
            if (data.categorycode === "") {
                notifications.html(showAlert("info", "Category Code is required.", 1));
                $("#catCode").focus();
                return;
            }
            if (data.categoryname === "") {
                notifications.html(showAlert("info", "Category Name is required.", 1));
                $("#catName").focus();
                return;
            }
            if (data.itemprefix === "") {
                notifications.html(showAlert("info", "Item Prefix is required.", 1));
                $("#itemPrefix").focus();
                return;
            }
            if (data.startingnumber === "" || data.startingnumber < 0) {
                notifications.html(showAlert("info", "Valid Starting Number is required.", 1));
                $("#startingNum").focus();
                return;
            }

            // Disable button during submission
            const submitBtn = $(this).find('button[type="submit"]');
            const originalText = submitBtn.text();
            submitBtn.prop('disabled', true).text('Saving...');

            $.ajax({
                url: "../controllers/inventoryoperations.php",
                type: "POST",
                data: data,
                success: function(response) {
                    try {
                        const res = JSON.parse(response);
                        if (res.status === 'success') {
                            notifications.html(showAlert("success", res.message, 1));
                            
                            // Reset form and UI
                            $('#addCategoryForm')[0].reset();
                            $('#categoryId').val(0);
                            selectCustomIcon('inventory_2', 'Inventory (General)');
                        } else {
                            notifications.html(showAlert("danger", res.message, 1));
                        }
                    } catch (e) {
                        notifications.html(showAlert("danger", "Invalid server response format.", 1));
                        console.error(response);
                    }
                },
                error: function() {
                    notifications.html(showAlert("danger", "Connection error. Please try again.", 1));
                },
                complete: function() {
                    submitBtn.prop('disabled', false).text(originalText);
                }
            });
        });

        // Auto-generate code toggle logic
        window.toggleCodeGeneration = function() {
            const isAuto = $('#autoGenerateCode').is(':checked');
            const $itemCodeInput = $('#itemCode');
            const $badge = $('#autoGenBadge');

            if (isAuto) {
                $itemCodeInput.attr('readonly', true).css('opacity', '0.7');
                $badge.css({
                    'background': '#206223',
                    'color': 'white'
                });
            } else {
                $itemCodeInput.attr('readonly', false).css('opacity', '1').focus();
                $badge.css({
                    'background': '#e2e8f0',
                    'color': '#64748b'
                });
            }
        };

        // Save Item Logic
        $('#addItemForm').on('submit', function(e) {
            e.preventDefault();
            const notifications = $('#itemModalAlert');
            notifications.empty();

            const categoryId = $('#itemCategory').val();
            const itemName = $('#itemName').val().trim();
            const itemCode = $('#itemCode').val().trim();
            const unitPrice = $('#itemPrice').val();
            const reorderLevel = $('#itemReorder').val();
            const uom = $('#itemUom').val();
            const itemType = $('#itemTypeToggle').is(':checked') ? 'Product' : 'Ingredient';
            const isFeed = $('#isFeedToggle').is(':checked') ? 1 : 0;
            const description = $('#itemDescription').val().trim();

            // Sequential Validation
            if (!categoryId || categoryId == 0) {
                notifications.html(showAlert("info", "Please select an item category.", 1));
                $('#itemCategory').focus();
                return;
            }
            if (itemName === "") {
                notifications.html(showAlert("info", "Item Name is required.", 1));
                $('#itemName').focus();
                return;
            }
            if (itemCode === "" && !$('#autoGenerateCode').is(':checked')) {
                notifications.html(showAlert("info", "Item Code is required when Auto-gen is OFF.", 1));
                $('#itemCode').focus();
                return;
            }
            if (unitPrice === "" || unitPrice < 0) {
                notifications.html(showAlert("info", "A valid Unit Price is required.", 1));
                $('#itemPrice').focus();
                return;
            }
            if (reorderLevel === "" || reorderLevel < 0) {
                notifications.html(showAlert("info", "A valid Reorder Level is required.", 1));
                $('#itemReorder').focus();
                return;
            }

            const data = {
                id: $('#itemId').val() || 0,
                categoryid: categoryId,
                itemcode: itemCode,
                itemname: itemName,
                uom: uom,
                unitprice: unitPrice,
                reorderlevel: reorderLevel,
                itemtype: itemType,
                is_feed: isFeed,
                description: description,
                action: 'saveitem'
            };

            const submitBtn = $(this).find('button[type="submit"]');
            const originalText = submitBtn.text();
            submitBtn.prop('disabled', true).text('Provisioning...');

            $.ajax({
                url: "../controllers/inventoryoperations.php",
                type: "POST",
                data: data,
                success: function(response) {
                    try {
                        const res = JSON.parse(response);
                        if (res.status === 'success') {
                            notifications.html(showAlert("success", res.message, 1));
                            $('#addItemForm')[0].reset();
                            toggleCodeGeneration();
                            if (typeof loadInventoryItems === 'function') loadInventoryItems();
                        } else {
                            notifications.html(showAlert("danger", res.message, 1));
                        }
                    } catch (e) {
                        notifications.html(showAlert("danger", "Invalid server response format.", 1));
                    }
                },
                error: function() {
                    notifications.html(showAlert("danger", "Connection error. Please try again.", 1));
                },
                complete: function() {
                    submitBtn.prop('disabled', false).text(originalText);
                }
            });
        });

        // Filter functionality...
        $('.inventory-filter-btn').on('click', function() {
            // Remove active styles from all buttons
            $('.inventory-filter-btn')
                .removeClass('active bg-white shadow-sm')
                .addClass('text-muted')
                .css({'background-color': 'transparent', 'box-shadow': 'none'});
            
            // Add active styles to clicked button
            $(this)
                .addClass('active bg-white shadow-sm')
                .removeClass('text-muted')
                .css({'background-color': 'white', 'box-shadow': '0 2px 4px rgba(0,0,0,0.05)', 'text-align': 'right'});
            
            const filterValue = $(this).data('filter');
            if (filterValue === 'all') {
                table.search('').draw();
            } else if (filterValue === 'low-stock') {
                // Filter by items that have yellow/warning status or lower counts
                table.columns(2).search('Vials|Units|200').draw(); 
            }
        });

        // Populate Category Filter
        getinventorycategorieslist($('#inventoryCategoryFilter'), 'all');

        // Filter by Category
        $('#inventoryCategoryFilter').on('change', function() {
            const catId = $(this).val();
            if (catId === '0' || catId === '') {
                table.ajax.url("../controllers/inventoryoperations.php?action=getitems").load();
            } else {
                table.ajax.url(`../controllers/inventoryoperations.php?action=getitems&categoryid=${catId}`).load();
            }
        });

        // Load dynamic content
        loadInventoryStats();
        loadCategorySummaries();
    }
});

function loadInventoryStats() {
    $.getJSON("../controllers/inventoryoperations.php", { action: 'getinventorystats' }, function(data) {
        if (data && data.length > 0) {
            const stats = data[0];
            
            // Format Total Value (e.g., 4.28M)
            let totalValue = parseFloat(stats.total_value);
            let formattedValue = totalValue;
            if (totalValue >= 1000000) {
                formattedValue = (totalValue / 1000000).toFixed(2) + 'M';
            } else if (totalValue >= 1000) {
                formattedValue = (totalValue / 1000).toFixed(1) + 'K';
            } else {
                formattedValue = totalValue.toFixed(2);
            }

            $('#totalInventoryValue').text(formattedValue);
            $('#lowStockCount').text(stats.low_stock_count.toString().padStart(2, '0'));
            $('#categoryCount').text(stats.category_count.toString().padStart(2, '0'));
        }
    });
}

function loadCategorySummaries() {
    $.getJSON("../controllers/inventoryoperations.php", { action: 'getcategorysummaries' }, function(data) {
        const grid = $('#categoryGrid');
        grid.empty();

        if (data && data.length > 0) {
            // Filter and sort: top 4 by item count descending
            const topCategories = data
                .sort((a, b) => parseInt(b.item_count) - parseInt(a.item_count))
                .slice(0, 4);

            topCategories.forEach(function(cat, index) {
                // Theme class based on index (1-4)
                const themeClass = `category-theme-${index + 1}`;
                
                const card = `
                    <div class="category-card botanical-shadow-sm ${themeClass}" onclick="filterByCategory(${cat.id})">
                        <div class="category-icon-wrapper">
                            <span class="material-symbols-outlined">${cat.categoryicon || 'inventory_2'}</span>
                        </div>
                        <h6 class="category-name font-weight-bold font-headline mb-1">${cat.categoryname}</h6>
                        <p class="category-count mb-0" style="font-size: 0.75rem;">${cat.item_count} Items</p>
                    </div>
                `;
                grid.append(card);
            });
        } else {
            grid.append('<p class="text-muted p-3">No categories found. Click "Add New Category" to start.</p>');
        }
    });
}


function filterByCategory(categoryId) {
    // This will be implemented to filter the main DataTable
    if ($('#inventoryDataTable').length) {
        const table = $('#inventoryDataTable').DataTable();
        // Assuming category ID or name is in a specific column (e.g., hidden column or part of text)
        // For now, let's just log it or refresh the table with a filter
        console.log("Filtering by category ID:", categoryId);
    }
}

// Custom Action Menu Toggle
function toggleActionMenu(event, button) {
    event.stopPropagation();
    const dropdown = $(button).next('.actions-dropdown');
    
    // Close other open dropdowns
    $('.actions-dropdown').not(dropdown).removeClass('show');
    
    // Toggle current
    dropdown.toggleClass('show');
    
    // Close on outside click
    $(document).one('click', function() {
        $('.actions-dropdown').removeClass('show');
    });
}

function editItem(itemId) {
    $.getJSON("../controllers/inventoryoperations.php", { action: 'getitems', id: itemId }, function(data) {
        if (data && data.length > 0) {
            const item = data[0];
            
            // Populate form
            $('#itemId').val(item.id);
            $('#itemName').val(item.itemname);
            $('#itemCode').val(item.itemcode);
            $('#itemPrice').val(item.unitprice);
            $('#itemReorder').val(item.reorderlevel);
            $('#itemUom').val(item.uom);
            $('#itemDescription').val(item.description);
            
            // Handle Type Toggle
            $('#itemTypeToggle').prop('checked', item.itemtype === 'Product').trigger('change');
            
            // Handle isFeed Toggle
            $('#isFeedToggle').prop('checked', parseInt(item.is_feed) === 1);
            
            // Handle Auto-gen Code (Disable for edits)
            $('#autoGenerateCode').prop('checked', false).trigger('change');
            
            // Set Category
            getinventorycategorieslist($('#itemCategory'), item.categoryid);
            
            // Show Modal
            $('#addInventoryItemModal').fadeIn(300);
            
            // Update UI
            $('.sidebar-headline').text('Edit Inventory Item');
            $('.sidebar-subtext').text('Modify existing asset details and stock parameters.');
            $('#addItemForm button[type="submit"]').text('Update Item');
        }
    });
}

function deleteItem(itemId) {
    if (confirm("Are you sure you want to delete this inventory item?")) {
        $.ajax({
            url: "../controllers/inventoryoperations.php",
            type: "POST",
            data: { action: 'deleteitem', id: itemId },
            success: function(response) {
                try {
                    const res = JSON.parse(response);
                    if (res.status === 'success') {
                        $('#inventoryDataTable').DataTable().ajax.reload();
                        loadInventoryStats();
                        loadCategorySummaries();
                        if (typeof showNotification === 'function') {
                            showNotification("success", res.message);
                        } else {
                            alert(res.message);
                        }
                    } else {
                        alert(res.message);
                    }
                } catch (e) {
                    console.error("Delete Error:", response);
                }
            }
        });
    }
}

