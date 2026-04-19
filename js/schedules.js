/**
 * Jukam Dairy - Schedules Management Scripting
 * File: js/schedules.js
 */

$(document).ready(function() {
    // Initialize DataTable
    const table = $('#schedulesDataTable').DataTable({
        "pageLength": 5,
        "paging": true, // Enable API-based paging
        "info": false,
        "searching": true,
        "lengthChange": false,
        "responsive": true,
        "autoWidth": false,
        "dom": 'rt', // Keep default pagination hidden
        "columnDefs": [
            { "responsivePriority": 1, "targets": 0 },   // Date
            { "responsivePriority": 2, "targets": -1 },  // Actions
            { "responsivePriority": 3, "targets": 3 },   // Status
            { "responsivePriority": 4, "targets": 1 },   // Protocol
            { "responsivePriority": 10001, "targets": 2 } // Scope (Hide first)
        ],
        "language": {
            "emptyTable": "No scheduled protocols found"
        }
    });

    // Toggle between Vaccination and Deworming
    $('.view-toggle-btn').on('click', function() {
        $('.view-toggle-btn').removeClass('active');
        $(this).addClass('active');
        
        const type = $(this).text().trim();
        $('#registryTitle').text(`${type} Registry`);
        
        // Mock filter logic
        // table.column(1).search(type).draw();
    });

    // Custom Search
    $('#schedulesSearch').on('keyup', function() {
        table.search(this.value).draw();
    });

    function updatePagination() {
        const info = table.page.info();
        $('#pageInfo').text(`Showing ${info.start + 1} to ${info.end} of ${info.recordsTotal}`);
        
        let html = '';
        const totalPages = info.pages;
        for (let i = 0; i < totalPages; i++) {
            const activeClass = i === info.page ? 'active' : '';
            html += `<button class="page-btn ${activeClass}" data-page="${i}">${i + 1}</button>`;
        }
        $('#numberButtons').html(html);
        
        $('#prevPage').prop('disabled', info.page === 0);
        $('#nextPage').prop('disabled', info.page >= info.pages - 1);
    }

    $('#customPagination').on('click', '.page-btn', function() {
        const page = $(this).data('page');
        if (page !== undefined) { 
            table.page(page).draw('page'); 
            updatePagination(); 
        }
    });

    $('#prevPage').on('click', function() { 
        table.page('previous').draw('page'); 
        updatePagination(); 
    });

    $('#nextPage').on('click', function() { 
        table.page('next').draw('page'); 
        updatePagination(); 
    });

    // Initialize pagination
    updatePagination();

    // Modal Logic
    $('#addNewBtn').on('click', function(e) {
        e.preventDefault();
        const activeType = $('.view-toggle-btn.active').attr('data-type');
        console.log('Active Selection:', activeType);
        
        if (activeType === 'vaccination') {
            $('#vaccinationModal').css({'display': 'flex', 'z-index': '9999'});
            $('body').addClass('overflow-hidden');
        } else if (activeType === 'deworming') {
            $('#dewormingModal').css({'display': 'flex', 'z-index': '9999'});
            $('body').addClass('overflow-hidden');
        }
    });

    $(document).on('click', '.close-modal-btn', function() {
        $('.v-modal-overlay').css('display', 'none');
        $('body').removeClass('overflow-hidden');
    });

    // Close on backdrop click
    $(document).on('click', '.v-modal-overlay', function(e) {
        if (e.target === this || $(e.target).hasClass('v-modal-backdrop')) {
            $(this).css('display', 'none');
            $('body').removeClass('overflow-hidden');
        }
    });

    // Universal Pen Multi-select Logic
    $(document).on('click', '.penTrigger', function(e) {
        e.stopPropagation();
        const $menu = $(this).siblings('.penMenu');
        $('.penMenu').not($menu).removeClass('show'); // Close other menus
        $menu.toggleClass('show');
    });

    $(document).on('click', function(e) {
        if (!$(e.target).closest('.pen-multiselect').length) {
            $('.penMenu').removeClass('show');
        }
    });

    $(document).on('change', '.pen-item input[type="checkbox"]', function() {
        const $container = $(this).closest('.pen-multiselect');
        updateCurrentPenCount($container);
    });

    function updateCurrentPenCount($container) {
        const $display = $container.find('.penDisplay');
        const $checkboxes = $container.find('.pen-item input[type="checkbox"]');
        const selectedCount = $checkboxes.filter(':checked').length;
        
        if (selectedCount === 0) {
            $display.text('Select Pens');
        } else if (selectedCount === $checkboxes.length) {
            $display.text('All Pens Selected');
        } else {
            $display.text(`${selectedCount} pens selected`);
        }
    }

    $(document).on('input', '.penSearch', function() {
        const query = $(this).val().toLowerCase();
        $(this).closest('.penMenu').find('.pen-item').each(function() {
            const text = $(this).find('span').text().toLowerCase();
            $(this).toggle(text.includes(query));
        });
    });

    $(document).on('click', '.penSelectAll', function() {
        $(this).closest('.pen-multiselect').find('input[type="checkbox"]').prop('checked', true).trigger('change');
    });

    $(document).on('click', '.penDeselectAll', function() {
        $(this).closest('.pen-multiselect').find('input[type="checkbox"]').prop('checked', false).trigger('change');
    });

    $(document).on('click', '.penConfirm', function() {
        $(this).closest('.penMenu').removeClass('show');
    });

    // Initialize Datepickers
    if ($(".v_datepicker").length) {
        $(".v_datepicker").datepicker({
            dateFormat: "yy-mm-dd",
            changeMonth: true,
            changeYear: true
        });
    }
});
