/**
 * Jukam Farm - Auth & Security Logic
 * Handles: Session Locking, Change Password, Logout
 */

$(document).ready(function() {
    // Lock Screen Elements
    const lockOverlay = $('#lockScreenOverlay');
    const lockPassInput = $('#lockPasswordInput');
    const lockToggleBtn = $('#lockTogglePassword');
    const unlockBtn = $('#unlockBtn');
    const switchUserBtn = $('#switchUserBtn');
    
    // Password Modal Elements
    const passOverlay = $('#passwordModalOverlay');
    const passForm = $('#changePasswordForm');
    const passCloseBtn = $('#passwordModalClose');
    const passCancelBtn = $('#cancelPassBtn');
    const newPassInput = $('#newPassInput');

    function showLockScreen(immediate = false) {
        if (immediate) {
            lockOverlay.show();
        } else {
            lockOverlay.fadeIn(400);
        }
        $('body').css('overflow', 'hidden');
        localStorage.setItem('jukam_locked', 'true');
        $('.profile-popup-menu').removeClass('show');
    }

    function hideLockScreen() {
        lockOverlay.fadeOut(300, function() {
            lockPassInput.val('');
            $('body').css('overflow', 'auto');
        });
        localStorage.setItem('jukam_locked', 'false');
    }

    // Initial State Check
    if (localStorage.getItem('jukam_locked') === 'true') {
        showLockScreen(true);
    }

    // Lock Trigger
    $(document).on('click', '#lockSessionBtn', function(e) {
        e.preventDefault();
        showLockScreen();
    });

    // Unlock Action
    unlockBtn.on('click', function() {
        // Mock validation: any 4+ chars
        if (lockPassInput.val().length >= 4) {
            hideLockScreen();
        } else {
            lockPassInput.addClass('is-invalid');
            setTimeout(() => lockPassInput.removeClass('is-invalid'), 1000);
        }
    });

    // Logout / Switch User
    $(document).on('click', '#logoutBtn, #switchUserBtn', function(e) {
        // Redirection happens via <a> href for logoutBtn usually, but let's be explicit
        localStorage.setItem('jukam_locked', 'false');
        const href = $(this).attr('href');
        if(href && href !== '#') {
            window.location.href = href;
        } else {
            // Default to index context
            const path = typeof base_path !== 'undefined' ? base_path : '';
            window.location.href = path + 'index.php';
        }
    });

    // Toggle Lock Password Visibility
    lockToggleBtn.on('click', function() {
        const type = lockPassInput.attr('type') === 'password' ? 'text' : 'password';
        lockPassInput.attr('type', type);
        $(this).find('span').text(type === 'password' ? 'visibility' : 'visibility_off');
    });

    // --- Change Password Logic ---

    function showPasswordModal() {
        passOverlay.fadeIn(300);
        $('body').css('overflow', 'hidden');
    }

    function hidePasswordModal() {
        passOverlay.fadeOut(200, function() {
            passForm[0].reset();
            $('.strength-segment').removeClass('active-weak active-fair active-good active-strong');
            $('body').css('overflow', 'auto');
        });
    }

    $(document).on('click', '#changePasswordMenuBtn', function(e) {
        e.preventDefault();
        $('.profile-popup-menu').removeClass('show');
        showPasswordModal();
    });

    passCloseBtn.add(passCancelBtn).on('click', function() {
        hidePasswordModal();
    });

    passOverlay.on('click', function(e) {
        if ($(e.target).is('#passwordModalOverlay')) {
            hidePasswordModal();
        }
    });

    $('.pass-visibility-toggle').on('click', function() {
        const input = $(this).siblings('input');
        const type = input.attr('type') === 'password' ? 'text' : 'password';
        input.attr('type', type);
        $(this).find('span').text(type === 'password' ? 'visibility' : 'visibility_off');
    });

    $('.pass-input').on('input', function() {
        $('#passwordAlertContainer').empty();
    });

    newPassInput.on('input', function() {
        const val = $(this).val();
        let strength = 0;
        if (val.length >= 8) strength++;
        if (/[A-Z]/.test(val)) strength++;
        if (/[0-9]/.test(val)) strength++;
        if (/[^A-Za-z0-9]/.test(val)) strength++;

        const segments = $('.strength-segment');
        segments.removeClass('active-weak active-fair active-good active-strong');

        if (val.length > 0) {
            if (strength <= 1) segments.slice(0, 1).addClass('active-weak');
            else if (strength === 2) segments.slice(0, 2).addClass('active-fair');
            else if (strength === 3) segments.slice(0, 3).addClass('active-good');
            else if (strength >= 4) segments.slice(0, 4).addClass('active-strong');
        }
    });

    passForm.on('submit', function(e) {
        e.preventDefault();
        const current = $('#currentPassInput').val();
        const newPass = $('#newPassInput').val();
        const confirm = $('#confirmPassInput').val();
        const alertContainer = $('#passwordAlertContainer');

        alertContainer.empty();

        if (current === '') {
            alertContainer.html(showAlert('info', 'Current password is required', 1));
            $('#currentPassInput').focus();
            return;
        }
        
        if (current !== '1234') {
            alertContainer.html(showAlert('info', 'Incorrect current password. (Hint: 1234)', 1));
            $('#currentPassInput').focus();
            return;
        }

        if (newPass === '') {
            alertContainer.html(showAlert('info', 'Please enter a new password', 1));
            $('#newPassInput').focus();
            return;
        }

        if (newPass.length < 8) {
            alertContainer.html(showAlert('info', 'New password must be at least 8 characters', 1));
            $('#newPassInput').focus();
            return;
        }

        if (newPass !== confirm) {
            alertContainer.html(showAlert('info', 'Passwords do not match', 1));
            $('#confirmPassInput').focus();
            return;
        }

        alertContainer.html(showAlert('success', 'Password successfully changed!', 1));
        setTimeout(hidePasswordModal, 1500);
    });

    // Global Esc Key Prevention for Lock Screen
    $(document).on('keydown', function(e) {
        if (localStorage.getItem('jukam_locked') === 'true' && e.key === 'Escape') {
            e.preventDefault();
        }
    });
});
