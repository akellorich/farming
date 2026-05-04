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
        alertContainer.html(showAlert('processing', 'Authenticating your credentials, please wait...',1));
        $.post(
            "controllers/useroperations.php",
            {
                loginuser:true,
                username:email,
                password
            }
        ).done((data)=>{
            if(isJSON(data)){
                data=JSON.parse(data) 
                if(data.status=="success"){
                    window.location.href="views/dashboard.php"
                }else if(data.status=="invalid"){
                    alertContainer.html(showAlert('danger', 'Invalid username or password'))
                }
            }else{
                alertContainer.html(showAlert('danger', `Sorry an error occured ${data}`))
            }
        }).fail((response,status,error)=>{
            alertContainer.html(showAlert('danger', `Sorry an error occured ${response.responseText}`))
        })
        // Simulate API call
        // setTimeout(function() {
        //     // This is where you'd perform the AJAX request to backend
        //     // Success or Failure simulation
        //     alertContainer.html(showAlert('warning', 'Login functionality is being integrated. Check back shortly.'));
        // }, 1500);
    });
});