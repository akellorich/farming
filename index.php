<?php
/**
 * Dairy Management System - Login Screen
 * File: index.php
 */
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Jukam Dairy and Poultry Farm</title>

    <!-- Local Assets -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/all.css"> <!-- FontAwesome -->
    <link rel="stylesheet" href="css/style.css"> <!-- Local Fonts & Styles -->
    <link rel="stylesheet" href="css/alert.css"> <!-- Custom Alert Styles -->
    <link rel="stylesheet" href="css/login.css"> <!-- Page Specific Styles -->
    <link rel="manifest" href="/manifest.json">
    <meta name="theme-color" content="#206223">
    <link rel="apple-touch-icon" href="image/icon-192x192.png">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link rel="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <script>
        if ('serviceWorker' in navigator) {
            window.addEventListener('load', () => {
                navigator.serviceWorker.register('sw.js')
                    .then(reg => console.log('Service Worker registered'))
                    .catch(err => console.log('Service Worker registration failed', err));
            });
        }

        // Install Prompt Logic
        let deferredPrompt;
        window.addEventListener('beforeinstallprompt', (e) => {
            // Prevent Chrome 67 and earlier from automatically showing the prompt
            e.preventDefault();
            // Stash the event so it can be triggered later.
            deferredPrompt = e;

            // Optionally show an install button/banner here
            // For now, we'll wait 2 seconds and then prompt if it's the first time
            setTimeout(() => {
                if (deferredPrompt) {
                    // You could show a custom modal here instead of direct prompt
                    console.log('App is installable');
                }
            }, 2000);
        });
    </script>
</head>

<body>

    <main class="login-container">
        <!-- Left Section -->
        <section class="brand-section">
            <div class="brand-overlay"></div>
            <div class="brand-content">
                <div class="glass-effect d-flex align-items-center">
                    <span class="material-symbols-outlined mr-2"
                        style="font-size: 1.4rem; color: var(--primary);">grass</span>
                    <span class="brand-logo-text mb-0">Jukam Dairy and Poultry Farm</span>
                </div>

                <div class="mb-5" style="max-width: 440px;">
                    <h2 class="tagline-h2">Nurturing Growth, Sustaining Excellence.</h2>
                    <p class="tagline-p" style="font-size: 1rem;">The Modern Agrarian Portal for precision livestock
                        management and supply chain transparency.</p>
                </div>
            </div>
        </section>

        <!-- Right Section -->
        <section class="form-section">
            <div class="asymmetric-shape d-none d-md-block"></div>

            <div class="form-wrapper">
                <div class="form-header text-center">
                    <img src="images/logo.png" alt="Logo">
                    <h1 class="portal-title">Dairy Management Portal</h1>
                    <p class="mb-5">Enter your credentials to manage your herd assets.</p>
                </div>

                <div id="alert-container"></div>

                <form id="loginForm" class="mt-4" novalidate>
                    <!-- Farm Type Toggle -->
                    <div class="farm-type-toggle mb-4">
                        <div class="toggle-wrapper">
                            <input type="radio" name="farm_type" id="typeLivestock" value="livestock" class="d-none" checked>
                            <label for="typeLivestock" class="toggle-item">Livestock</label>
                            
                            <input type="radio" name="farm_type" id="typePoultry" value="poultry" class="d-none">
                            <label for="typePoultry" class="toggle-item">Poultry</label>
                        </div>
                    </div>

                    <div class="form-group mb-4">
                        <label for="email">Email Address</label>
                        <div class="input-group-custom">
                            <input type="email" id="email" name="email" placeholder="manager@jukamdairy.com" required>
                            <span class="material-symbols-outlined icon">mail</span>
                        </div>
                    </div>

                    <div class="form-group mb-4">
                        <label for="password">Password</label>
                        <div class="input-group-custom">
                            <input type="password" id="password" name="password" placeholder="••••••••••••" required>
                            <span class="material-symbols-outlined icon">lock</span>
                            <span class="material-symbols-outlined password-toggle"
                                id="togglePassword">visibility</span>
                        </div>
                    </div>

                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="rememberMe">
                            <label class="custom-control-label text-muted" for="rememberMe"
                                style="text-transform: none; font-size: 0.85rem;">Remember Me</label>
                        </div>
                        <a href="#" class="font-weight-bold" style="color: var(--primary); font-size: 0.85rem;">Forgot
                            Password?</a>
                    </div>

                    <button type="submit" class="btn btn-signin">
                        <span>Sign In</span>
                        <span class="material-symbols-outlined">arrow_forward</span>
                    </button>
                </form>

                <div class="text-center mt-5 pt-3 border-top" style="border-color: rgba(0,0,0,0.05) !important;">
                    <p class="text-muted small font-weight-medium">
                        Don't have an account? <a href="#" class="font-weight-bold"
                            style="color: var(--primary);">Contact Admin</a>
                    </p>
                </div>
            </div>

            <div class="decorative-bottom">
                <span class="material-symbols-outlined text-success">eco</span>
                <span>Sustainable Management Systems</span>
            </div>
        </section>
    </main>

    <!-- Scripts -->
    <script src="plugins/jquery-3.6.1.js"></script>
    <script src="plugins/popper.js"></script>
    <script src="plugins/bootstrap.js"></script>
    <script src="plugins/alert.js"></script>
    <script src="js/functions.js"></script>
    <script src="js/index.js"></script>
    <!-- <script>
$(document).ready(function() {
    // Password visibility toggle
    $('#togglePassword').on('click', function() {
        const passwordInput = $('#password');
        const type = passwordInput.attr('type') === 'password' ? 'text' : 'password';
        passwordInput.attr('type', type);
        $(this).text(type === 'password' ? 'visibility' : 'visibility_off');
    });

    // Form Submission
    $('#loginForm').on('submit', function(e) {
        e.preventDefault();
        
        const email = $('#email').val().trim();
        const password = $('#password').val().trim();
        const alertContainer = $('#alert-container');

        // Clear previous alerts
        alertContainer.empty();

        // Basic Validation
        if (!email || !password) {
            alertContainer.html(showAlert('danger', 'Please provide both email and password.'));
            return;
        }

        // Show Processing
        alertContainer.html(showAlert('processing', 'Authenticating your credentials, please wait...'));

        // Simulate API call
        setTimeout(function() {
            // This is where you'd perform the AJAX request to backend
            // Success or Failure simulation
            alertContainer.html(showAlert('warning', 'Login functionality is being integrated. Check back shortly.'));
        }, 1500);
    });
});
</script> -->

</body>

</html>