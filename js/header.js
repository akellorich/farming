$(document).ready(function() {
    // Sidebar Toggle
    $('#sidebarToggle, #mobileMenuBtn').on('click', function() {
        $('.sidebar').toggleClass('mobile-show');
        if($(window).width() > 991.98) {
            $('.sidebar, .main-content, .top-header').toggleClass('collapsed');
        }
    });

    // Close mobile sidebar on link click
    $('.nav-item').on('click', function() {
        if($(window).width() < 992) {
            $('.sidebar').removeClass('mobile-show');
        }
    });

    // Notification Popup Toggle
    $('#notificationBtn').on('click', function(e) {
        e.stopPropagation();
        $('#notificationMenu').toggleClass('show');
        $('.profile-popup-menu').removeClass('show');
    });

    // User Profile Toggle
    $('#userMenuBtn').on('click', function(e) {
        e.stopPropagation();
        $('.profile-popup-menu').toggleClass('show');
        $('#notificationMenu').removeClass('show');
    });

    // Theme Switcher Toggle
    $('#themeToggleBtn').on('click', function() {
        $('body').toggleClass('dark-theme');
        const icon = $('#themeIcon');
        if($('body').hasClass('dark-theme')) {
            icon.text('light_mode');
            showAlert('info', 'Switching to dark theme...');
        } else {
            icon.text('dark_mode');
            showAlert('info', 'Switching to light theme...');
        }
    });

    // Close popups and mobile sidebar on click outside
    $(document).on('click', function(e) {
        // Notifications popup
        if (!$(e.target).closest('#notificationBtn, .notification-popup-menu').length) {
            $('#notificationMenu').removeClass('show');
        }

        // Profile popup
        if (!$(e.target).closest('#userMenuBtn, .profile-popup-menu').length) {
            $('.profile-popup-menu').removeClass('show');
        }

        // Mobile Sidebar
        if ($(window).width() < 992) {
            if (!$(e.target).closest('.sidebar, #mobileMenuBtn').length) {
                $('.sidebar').removeClass('mobile-show');
            }
        }
    });

    // Mock search interaction
    $('.search-input').on('keypress', function(e) {
        if (e.which == 13) {
            const val = $(this).val().trim();
            if(val) {
                showAlert('info', 'Searching records for: ' + val);
                $(this).blur();
            }
        }
    });
});
