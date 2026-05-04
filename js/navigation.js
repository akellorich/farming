$(document).ready(function() {
    // Navigation Item Click Handler
    $('.nav-item').on('click', function(e) {
        if ($(this).attr('href') === '#') {
            e.preventDefault();
            $('.nav-item').removeClass('active');
            $(this).addClass('active');
        }
    });

    // Sidebar Close on Mobile Link Click
    $('.nav-item').on('click', function() {
        if($(window).width() < 992) {
            $('.sidebar').removeClass('mobile-show');
        }
    });

    // Profile Popup Toggle
    $('#userMenuBtn').on('click', function(e) {
        e.stopPropagation();
        const popup = $(this).next('.profile-popup-menu');
        $('.profile-popup-menu').not(popup).removeClass('show');
        $('.notification-popup-menu').removeClass('show');
        popup.toggleClass('show');
    });

    // Close Profile Popup on Outside Click
    $(document).on('click', function(e) {
        if (!$(e.target).closest('#userMenuBtn, .profile-popup-menu').length) {
            $('.profile-popup-menu').removeClass('show');
        }
    });

    // Logout Handler
    $('#logoutBtn, #switchUserBtn').on('click', function(e) {
        localStorage.removeItem('jukam_locked');
        // Redirection to index.php happens automatically via href
    });

    // Lock Session Handler
    $('#lockSessionBtn').on('click', function(e) {
        e.preventDefault();
        if (typeof showLockScreen === 'function') {
            showLockScreen();
        }
    });
});
