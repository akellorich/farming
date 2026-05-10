$(document).ready(function() {
    // --- IndexedDB Implementation for Remember Me ---
    const DB_NAME = 'FarmAppDB';
    const DB_VERSION = 1;
    const STORE_NAME = 'user_prefs';
    let db;

    // Initialize IndexedDB
    const request = indexedDB.open(DB_NAME, DB_VERSION);

    request.onupgradeneeded = function(e) {
        const db = e.target.result;
        if (!db.objectStoreNames.contains(STORE_NAME)) {
            db.createObjectStore(STORE_NAME);
        }
    };

    request.onsuccess = function(e) {
        db = e.target.result;
        loadRememberedUser();
    };

    request.onerror = function(e) {
        console.error("IndexedDB error:", e.target.error);
    };

    function saveRememberedUser(email, password, remember) {
        if (!db) return;
        const transaction = db.transaction([STORE_NAME], 'readwrite');
        const store = transaction.objectStore(STORE_NAME);
        
        if (remember) {
            store.put({ email, password, remember }, 'remembered_user');
        } else {
            store.delete('remembered_user');
        }
    }

    function loadRememberedUser() {
        if (!db) return;
        const transaction = db.transaction([STORE_NAME], 'readonly');
        const store = transaction.objectStore(STORE_NAME);
        const getRequest = store.get('remembered_user');

        getRequest.onsuccess = function() {
            if (getRequest.result) {
                $('#email').val(getRequest.result.email);
                $('#password').val(getRequest.result.password);
                $('#rememberMe').prop('checked', true);
            }
        };
    }
    // --- End IndexedDB Logic ---

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
        const rememberMe = $('#rememberMe').is(':checked');
        const alertContainer = $('#alert-container');

        // Clear previous alerts
        alertContainer.empty();

        // Basic Validation
        if (!email) {
            alertContainer.html(showAlert('info', 'Please provide your email address.'));
            $('#email').focus();
            return;
        }

        if (!password) {
            alertContainer.html(showAlert('info', 'Please provide your password.'));
            $('#password').focus();
            return;
        }

        // Show Processing
        alertContainer.html(showAlert('processing', 'Authenticating your credentials, please wait...', 1));
        
        $.post(
            "controllers/useroperations.php",
            {
                loginuser: true,
                username: email,
                password
            }
        ).done((data) => {
            if (isJSON(data)) {
                const response = JSON.parse(data);
                if (response.status == "success") {
                    // Save or Clear credentials based on Remember Me checkbox
                    saveRememberedUser(email, password, rememberMe);
                    
                    // Redirect based on farm type selection
                    const farmType = $('input[name="farm_type"]:checked').val();
                    if (farmType === 'poultry') {
                        window.location.href = "views/flock_overview.php";
                    } else {
                        window.location.href = "dashboard.php";
                    }
                } else if (response.status == "invalid") {
                    alertContainer.html(showAlert('danger', 'Invalid username or password'));
                }
            } else {
                alertContainer.html(showAlert('danger', `Sorry an error occurred ${data}`));
            }
        }).fail((response, status, error) => {
            alertContainer.html(showAlert('danger', `Sorry an error occurred ${response.responseText}`));
        });
    });
});