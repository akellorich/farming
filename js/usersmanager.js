$(document).ready(() => {
    // get roles
    const rolefield = $("#userrole"),
        notifications = $("#notifications")
    getroles()

    function getroles() {
        $.getJSON(
            "../controllers/useroperations.php",
            {
                getroles: true
            }
        ).done((data) => {
            let results = `<option disabled selected>Choose Role</option>`
            data.forEach((role) => {
                results += `<option value='${role.roleid}'>${role.rolename}</option>`
            })
            rolefield.html(results)
        }).fail((response, status, error) => {
            notifications.html(showAlert("danger", `Sorry an error occured ${data}`))
        })
    }

    const table = $('#usersTable').DataTable({
        "pageLength": 5,
        "lengthChange": false,
        "searching": true,
        "info": false,
        "paging": true,
        "ordering": true,
        "order": [[0, "asc"]],
        "responsive": true,
        "columnDefs": [
            { "responsivePriority": 1, "targets": -1 }, // Action button is MAX priority
            { "responsivePriority": 2, "targets": 0 },  // User is high priority
            { "responsivePriority": 10, "targets": 1 }, // Role
            { "responsivePriority": 11, "targets": 2 }, // Status
            { "responsivePriority": 12, "targets": 3 }, // Last Login
            { "orderable": false, "targets": "no-sort" }
        ],
        "dom": 't', // Only show the table, we handle search and pagination manually
        "language": {
            "search": "",
            "searchPlaceholder": "Search employees..."
        }
    })

    // Map search input
    $('#staffSearch').on('keyup', function () {
        table.search(this.value).draw()
        updatePagination()
    })

    function updatePagination() {
        const info = table.page.info()
        $('#pageInfo').text('Page ' + (info.page + 1) + ' of ' + (info.pages || 1))

        let html = ''
        for (let i = 0; i < info.pages; i++) {
            const activeClass = i === info.page ? 'active' : ''
            html += `<button class="page-btn ${activeClass}" data-page="${i}">${i + 1}</button>`
        }
        $('#numberButtons').html(html)

        $('#prevPage').prop('disabled', info.page === 0).toggleClass('disabled', info.page === 0)
        $('#nextPage').prop('disabled', info.page >= info.pages - 1 || info.pages === 0).toggleClass('disabled', info.page >= info.pages - 1 || info.pages === 0)
    }

    $('#customPagination').on('click', '.page-btn:not(.boundary-btn)', function () {
        const page = $(this).data('page')
        if (page !== undefined) {
            table.page(page).draw('page')
            updatePagination()
        }
    })

    $('#prevPage').on('click', function () {
        table.page('previous').draw('page')
        updatePagination()
    })

    $('#nextPage').on('click', function () {
        table.page('next').draw('page')
        updatePagination()
    })

    // Initial pagination update
    updatePagination()

    // Save User Logic
    $(".btn-modal-save").on("click", function () {
        const fullname = $("#fullname").val().trim(),
            username = $("#username").val().trim(),
            email = $("#email").val().trim(),
            mobile = $("#mobile").val().trim(),
            userrole = $("#userrole").val(),
            accesslevel = $("#accesslevel").val(),
            notificationsArea = $("#notificationsarea")
        let errors = ""

        // Validation: Empty Fields check with specific info and focus
        if (fullname === "") { notificationsArea.html(showAlert("info", "Full Name is required.")); $("#fullname").focus(); return; }
        if (username === "") { notificationsArea.html(showAlert("info", "Username is required.")); $("#username").focus(); return; }
        if (email === "") { notificationsArea.html(showAlert("info", "Email Address is required.")); $("#email").focus(); return; }
        if (mobile === "") { notificationsArea.html(showAlert("info", "Mobile Number is required.")); $("#mobile").focus(); return; }
        if (!userrole) { notificationsArea.html(showAlert("info", "Please select a Role.")); $("#userrole").focus(); return; }
        if (!accesslevel) { notificationsArea.html(showAlert("info", "Please select an Access Level.")); $("#accesslevel").focus(); return; }

        // Split name into 3 parts
        const nameParts = fullname.split(/\s+/);
        const firstname = nameParts[0] || "",
            middlename = nameParts[1] || "",
            lastname = nameParts.slice(2).join(" ") || "";

        // First and Middle names are required
        if (middlename === "") {
            notificationsArea.html(showAlert("info", "Please provide at least a First and Middle name (separated by space)."));
            $("#fullname").focus();
            return;
        }

        // Field format validation
        if (!validatefielddata(email, 'email')) {
            notificationsArea.html(showAlert("info", "Please provide a valid email address."));
            $("#email").focus();
            return;
        }

        if (!validatefielddata(mobile, 'mobile')) {
            notificationsArea.html(showAlert("info", "Please provide a valid mobile number (10-12 digits."));
            $("#mobile").focus();
            return;
        }

        // Prepare FormData for Multipart Submission (includes photo)
        const formData = new FormData();
        formData.append("saveuser", true);
        formData.append("userid", 0);
        formData.append("firstname", firstname);
        formData.append("middlename", middlename);
        formData.append("lastname", lastname);
        formData.append("username", username);
        formData.append("email", email);
        formData.append("mobile", mobile);
        formData.append("roleid", userrole);
        formData.append("accesslevel", accesslevel);

        // Append Photo if selected
        const photoFile = $('#userPhoto')[0].files[0];
        if (photoFile) {
            formData.append("profilephoto", photoFile);
        }

        // AJAX Submission using FormData
        $.ajax({
            url: "../controllers/useroperations.php",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                if (isJSON(data)) {
                    data = JSON.parse(data)
                    if (data.status == "success") {
                        notificationsArea.html(showAlert("success", `The user has been saved successfully`));
                    } else if (data.status == "exists") {
                        if (data.category == "username") {
                            errors = `Username already in use`
                        } else if (data.category == "mobile") {
                            errors = `Mobile number already in use`
                        } else if (data.category == "email") {
                            errors = `Email address already in use`
                        }
                        notificationsArea.html(showAlert("info", errors));
                    }
                } else {
                    notificationsArea.html(showAlert("danger", `Sorry an error occured ${data}`));
                }
            },
            error: function () {
                notificationsArea.html(showAlert("danger", "Sorry, a binary transmission error occurred."));
            }
        });
    });

    // Profile Photo Preview Logic
    $('#userPhoto').on('change', function (e) {
        const file = e.target.files[0]
        if (file) {
            const reader = new FileReader()
            reader.onload = function (e) {
                $('#photoPreview').attr('src', e.target.result)
            }
            reader.readAsDataURL(file)
        }
    })
})