/**
 * Jukam Dairy - Health Records Module Scripting
 * File: js/health.js
 */

function toggleActionMenu(event, btn) {
    event.stopPropagation();
    const dropdown = $(btn).next('.actions-dropdown');
    $('.actions-dropdown').not(dropdown).removeClass('show');
    dropdown.toggleClass('show');
}

$(document).ready(function() {
    const table = $('#healthDataTable').DataTable({
        "pageLength": 5,
        "paging": true,
        "info": false,
        "searching": true,
        "lengthChange": false,
        "responsive": true,
        "autoWidth": false,
        "dom": 'rt',
        "columnDefs": [
            { "responsivePriority": 1, "targets": [0, -1] }, // Animal ID and Action always visible
            { "responsivePriority": 2, "targets": 3 },      // Condition secondary
            { "responsivePriority": 3, "targets": [1, 2, 4, 5] }
        ],
        "language": {
            "paginate": {
                "previous": "",
                "next": ""
            }
        }
    });

    function updatePagination() {
        const info = table.page.info();
        $('#pageInfo').text('Page ' + (info.page + 1) + ' of ' + info.pages);
        
        let html = '';
        for (let i = 0; i < info.pages; i++) {
            const activeClass = i === info.page ? 'active' : '';
            html += `<button class="page-btn ${activeClass}" data-page="${i}">${i + 1}</button>`;
        }
        $('#numberButtons').html(html);
        
        $('#prevPage').prop('disabled', info.page === 0);
        $('#nextPage').prop('disabled', info.page >= info.pages - 1);
    }

    $('#customPagination').on('click', '.page-btn', function() {
        table.page($(this).data('page')).draw('page');
        updatePagination();
    });

    $('#prevPage').on('click', function() {
        table.page('previous').draw('page');
        updatePagination();
    });

    $('#nextPage').on('click', function() {
        table.page('next').draw('page');
        updatePagination();
    });

    // Filter Event Listeners
    $('#animalFilter').on('change', function() {
        table.column(0).search(this.value).draw();
        updatePagination();
    });

    $('#conditionFilter').on('change', function() {
        table.column(3).search(this.value).draw();
        updatePagination();
    });

    $('#statusFilter').on('change', function() {
        table.column(5).search(this.value).draw();
        updatePagination();
    });

    $('#healthSearch').on('keyup', function() {
        table.search(this.value).draw();
        updatePagination();
    });

    // Reset Filters
    $('#refreshFilters').on('click', function() {
        $('#animalFilter, #conditionFilter, #dateRangeFilter, #statusFilter').val('');
        $('#healthSearch').val('');
        table.search('').columns().search('').draw();
        updatePagination();
    });

    // Date Range Filtering Logic (Mock)
    $('#dateRangeFilter').on('change', function() {
        // Mock filter trigger
        table.draw();
        updatePagination();
    });

    updatePagination();

    // Close actions dropdown when clicking outside
    $(document).on('click', function(e) {
        if (!$(e.target).closest('.actions-container').length) {
            $('.actions-dropdown').removeClass('show');
        }
    });

    // Modal Handlers
    $('#closeHealthModal, #closeHealthModalMobile, #cancelHealthModal').on('click', function() {
        $('#healthRecordModal').removeClass('show');
    });

    // Close modal when clicking outside
    $('#healthRecordModal').on('click', function(e) {
        if ($(e.target).hasClass('modal-overlay')) {
            $(this).removeClass('show');
        }
    });

    // Success Toast Emulation for Demo
    $('#healthLogForm').on('submit', function(e) {
        e.preventDefault();
        $('#healthRecordModal').removeClass('show');
        // Optional: show a toast here if available in dash
    });
});
