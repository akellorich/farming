$(document).ready(function() {
    // Initialize DataTable
    if ($('#inventoryDataTable').length) {
        const table = $('#inventoryDataTable').DataTable({
            responsive: true,
            pageLength: 5,
            scrollX: false,
            dom: 't<"d-flex justify-content-between align-items-center p-3 border-top"ip>', 
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
                    'font-size': '0.75rem',
                    'font-weight': '500'
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
            $('#addInventoryItemModal').fadeIn(300);
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

        // Auto-generate code toggle logic
        window.toggleCodeGeneration = function() {
            const isAuto = $('#autoGenerateCode').is(':checked');
            const $itemCodeInput = $('input[placeholder="JKM-INV-001"]');
            if (isAuto) {
                $itemCodeInput.attr('readonly', true).css('opacity', '0.7');
            } else {
                $itemCodeInput.attr('readonly', false).css('opacity', '1');
            }
        };

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
                .css({'background-color': 'white', 'box-shadow': '0 2px 4px rgba(0,0,0,0.05)'});
            
            const filterValue = $(this).data('filter');
            if (filterValue === 'all') {
                table.search('').draw();
            } else if (filterValue === 'low-stock') {
                // Filter by items that have yellow/warning status or lower counts
                table.columns(2).search('Vials|Units|200').draw(); 
            }
        });
    }
});

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
