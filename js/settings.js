/**
 * Jukam Dairy Management System - Settings Logic
 * File: js/settings.js
 */

$(document).ready(function() {
    const companyForm = $("#companyForm"),
          emailForm = $("#emailForm"),
          smsForm = $("#smsForm"),
          roleSelector = $("#roleSelector"),
          smsProviderSelector = $("#smsProviderSelector"),
          logoInput = $("#logo"),
          logoPreview = $("#logoPreview"),
          breedOrigin = $("#breedOrigin"),
          breedsBody = $("#breedsBody"),
          pensBody = $("#pensBody");

    // --- Initial Data Load ---
    loadCompanyDetails();
    loadEmailSettings("General"); // Default role
    getsmsproviders(smsProviderSelector); // This will also trigger loadSMSSettings(defaultId)
    loadRecentEmailLogs();
    getbreeds(breedsBody);
    getpens(pensBody);

    // Feed Mix Chart Instance
    let feedMixChart = null;

    // ... (rest of the existing logic remains)
    
    function loadRecentEmailLogs() {
        $.getJSON("../controllers/settingsoperations.php?action=getrecentemaillogs", function(response) {
            const logsBody = $("#emailLogsBody");
            logsBody.empty();
            
            if (response && response.length > 0) {
                response.forEach((log, index) => {
                    let statusClass = "secondary";
                    if (log.status === 'Sent') statusClass = "success";
                    if (log.status === 'Failed') statusClass = "danger";
                    
                    const badgeStyle = `
                        background-color: var(--${statusClass}-light, #f8f9fa); 
                        color: var(--${statusClass}, #6c757d);
                        font-size: 9px;
                        font-weight: 800;
                        padding: 2px 8px;
                        border-radius: 4px;
                        text-transform: uppercase;
                    `;

                    // Handle missing CSS variables for light colors if needed
                    let statusBadge = `<span style="${badgeStyle}">${log.status}</span>`;
                    
                    // Simple overrides if var colors aren't defined in CSS
                    if(log.status === 'Sent') statusBadge = `<span class="badge badge-success-light" style="color: #206223; background: #e7f5e7; border: 1px solid rgba(32,98,35,0.1); font-size: 9px; padding: 3px 8px;">SENT</span>`;
                    if(log.status === 'Failed') statusBadge = `<span class="badge badge-danger-light" style="color: #c62828; background: #ffebee; border: 1px solid rgba(198,40,40,0.1); font-size: 9px; padding: 3px 8px;">FAILED</span>`;
                    if(log.status === 'Pending') statusBadge = `<span class="badge badge-warning-light" style="color: #f9a825; background: #fffde7; border: 1px solid rgba(249,168,37,0.1); font-size: 9px; padding: 3px 8px;">PENDING</span>`;

                    logsBody.append(`
                        <tr class="${log.status === 'Failed' ? 'opacity-75' : ''}">
                            <td class="py-3 font-weight-bold" style="color: var(--on-surface-variant); opacity: 0.5;">0${index + 1}</td>
                            <td class="py-3">
                                <p class="mb-0 font-weight-bold" style="font-size: 13px;">${log.recipient}</p>
                                <p class="mb-0 text-muted" style="font-size: 10px;">At ${log.timeadded}</p>
                            </td>
                            <td class="py-3 text-muted" style="font-size: 12px; max-width: 150px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${log.subject || 'No Subject'}</td>
                            <td class="py-3 font-weight-medium">${log.sender}</td>
                            <td class="py-3">${statusBadge}</td>
                            <td class="py-3 text-muted" style="font-size: 11px;">${log.reason}</td>
                        </tr>
                    `);
                });
            } else {
                logsBody.append('<tr><td colspan="5" class="text-center py-4 text-muted">No recent delivery activity.</td></tr>');
            }
        });
    }

    // Refresh logs every 30 seconds
    setInterval(loadRecentEmailLogs, 30000);

    // --- Company Details Logic ---
    function loadCompanyDetails() {
        $.getJSON("../controllers/settingsoperations.php?action=getcompanydetails", function(response) {
            if (response && response.length > 0) {
                const data = response[0];
                $("#companyname").val(data.companyname);
                $("#taxregno").val(data.taxregno);
                $("#incorporationdate").val(data.incorporationdate);
                $("#emailaddress").val(data.emailaddress);
                $("#physicaladdress").val(data.physicaladdress);
                $("#postaladdress").val(data.postaladdress);
                $("#mobileno").val(data.mobileno);
                if (data.logopath) {
                    logoPreview.attr("src", "../images/" + data.logopath);
                }
            }
        });
    }

    companyForm.on("submit", function(e) {
        e.preventDefault();
        const formData = new FormData(this);
        formData.append("action", "savecompanydetails");

        $.ajax({
            url: "../controllers/settingsoperations.php",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                const res = JSON.parse(response);
                if (res.status === "success") {
                    showAlert("info", res.message);
                    loadCompanyDetails();
                } else {
                    showAlert("info", "Error: " + res.message);
                }
            },
            error: function() {
                showAlert("info", "Server communication error.");
            }
        });
    });

    $("#discardCompanyChanges").on("click", function() {
        loadCompanyDetails();
    });

    // Logo Preview & Auto-Upload (optional, or just use the form submit)
    logoInput.on("change", function() {
        if (this.files && this.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                logoPreview.attr("src", e.target.result);
            }
            reader.readAsDataURL(this.files[0]);
        }
    });

    // --- Email Settings Logic ---
    function loadEmailSettings(role) {
        $.getJSON("../controllers/settingsoperations.php?action=getemailsettings&role=" + role, function(response) {
            if (response && response.length > 0) {
                const data = response[0];
                $("#smtpserver").val(data.smtpserver);
                $("#smtpport").val(data.smtpport);
                $("#smtpuser").val(data.smtpuser);
                $("#smtppassword").val(data.smtppassword);
                $("#smtpusessl").prop("checked", data.smtpusessl == 1);
                $("#emailId").val(data.id);
                $("#emailsendername").val(data.sendername);
                $("#emailsendmode").val(data.sendmode);
                $("#emailRole").val(role);
            } else {
                // Clear fields if no settings for this role
                emailForm[0].reset();
                $("#emailId").val(0);
                $("#emailRole").val(role);
            }
        });
    }

    roleSelector.on("change", function() {
        loadEmailSettings($(this).val());
    });

    emailForm.on("input", "input", function() {
        $("#emailSettingsErrors").fadeOut();
    });

    // Clear test errors on input
    $("#testRecipient, #testSubject, #testMessage").on("input", function() {
        $("#testEmailErrors").fadeOut();
    });

    emailForm.on("submit", function(e) {
        e.preventDefault();
        
        // --- Validation ---
        let isValid = true;
        let errorMessage = "";
        let firstErrorField = null;
        
        const server = $("#smtpserver");
        const port = $("#smtpport");
        const user = $("#smtpuser");
        const pass = $("#smtppassword");
        const sender = $("#emailsendername");
        
        const errDiv = $("#emailSettingsErrors");
        errDiv.hide().html("");
        
        if (!server.val()) { isValid = false; errorMessage = "SMTP Server is required."; firstErrorField = server; }
        else if (!port.val() || port.val() <= 0) { isValid = false; errorMessage = "Valid Port is required."; firstErrorField = port; }
        else if (!user.val()) { isValid = false; errorMessage = "User Email is required."; firstErrorField = user; }
        else if (!pass.val() && $("#emailId").val() == 0) { isValid = false; errorMessage = "Password is required for new configurations."; firstErrorField = pass; }
        else if (!sender.val()) { isValid = false; errorMessage = "Sender Display Name is required."; firstErrorField = sender; }
        
        if (!isValid) {
            errDiv.html(showAlert("info", errorMessage, 1)).fadeIn();
            firstErrorField.focus();
            return;
        }

        const data = $(this).serialize() + "&action=saveemailsettings";
        
        $.post("../controllers/settingsoperations.php", data, function(response) {
            try {
                const res = JSON.parse(response);
                if (res.status === "success") {
                    showAlert("success", res.message);
                    loadEmailSettings(roleSelector.val());
                } else {
                    showAlert("danger", "Error: " + res.message);
                }
            } catch(e) {
                showAlert("danger", "Unexpected server response.");
            }
        });
    });

    // --- Test Email Submission ---
    $("#btnSendTestEmail").on("click", function() {
        const role = $("#testSenderRole").val();
        const recipient = $("#testRecipient");
        const subject = $("#testSubject");
        const message = $("#testMessage");
        const errDiv = $("#testEmailErrors");
        
        errDiv.hide().html("");
        
        // Granular Validation
        if (!recipient.val()) {
            errDiv.html(showAlert("info", "Recipient email address is required.", 1)).fadeIn();
            recipient.focus();
            return;
        }
        if (!subject.val()) {
            errDiv.html(showAlert("info", "Message subject is required.", 1)).fadeIn();
            subject.focus();
            return;
        }
        if (!message.val()) {
            errDiv.html(showAlert("info", "Message body cannot be empty.", 1)).fadeIn();
            message.focus();
            return;
        }
        
        const btn = $(this);
        btn.prop("disabled", true).html('<span class="spinner-border spinner-border-sm mr-2" style="width: 12px; height: 12px;"></span> Sending...');
        
        $.post("../controllers/mailoperations.php", {
            action: "testemail",
            role: role,
            recipient: recipient.val(),
            subject: subject.val(),
            message: message.val()
        }, function(response) {
            btn.prop("disabled", false).html('<span class="material-symbols-outlined mr-2" style="font-size: 16px;">send</span> Send Test Email');
            try {
                const res = JSON.parse(response);
                if (res.status === "success") {
                    errDiv.html(showAlert("success", res.message, 1)).fadeIn();
                    loadRecentEmailLogs();
                } else {
                    errDiv.html(showAlert("danger", "Error: " + res.message, 1)).fadeIn();
                }
            } catch(e) {
                errDiv.html(showAlert("danger", "Unexpected server response.", 1)).fadeIn();
            }
        });
    });

    // --- SMS Settings Logic ---
    function loadSMSSettings(id) {
        $.getJSON("../controllers/settingsoperations.php?action=getsmssettings&id=" + id, function(response) {
            if (response && response.length > 0) {
                const data = response[0];
                $("#senderid").val(data.senderid);
                $("#priorityroute").prop("checked", data.priorityroute == 1);
                
                if (data.config) {
                    const config = isJSON(data.config) ? JSON.parse(data.config) : data.config;
                    $("#apikey").val(config.apikey || '');
                    $("#apiusername").val(config.apiusername || '');
                }
            } else {
                $("#smsForm")[0].reset();
                $("#smsId").val(0);
                $("#smsjson").val("");
                $("#smsprovider").val(provider);
            }
        });
    }

    function loadRecentSMSLogs() {
        $.getJSON("../controllers/settingsoperations.php?action=getrecentsmslogs", function(response) {
            let html = "";
            if (response && response.length > 0) {
                response.forEach(log => {
                    const statusClass = log.status === "Sent" ? "success" : (log.status === "Failed" ? "danger" : "warning");
                    html += `
                        <tr class="border-bottom" style="border-color: rgba(0,0,0,0.02) !important;">
                            <td class="py-3 pl-0 font-weight-bold" style="color: #475569;">${log.recipient}</td>
                            <td class="py-3">${log.senderid}</td>
                            <td class="py-3">
                                <span class="badge badge-pill badge-${statusClass} px-3 py-1" style="font-size: 9px; font-weight: 800; letter-spacing: 0.05em;">${log.status.toUpperCase()}</span>
                            </td>
                            <td class="py-3 text-muted small" style="max-width: 150px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${log.statusreason || '-'}</td>
                        </tr>
                    `;
                });
            } else {
                html = '<tr><td colspan="4" class="text-center py-4 text-muted">No activity recorded yet</td></tr>';
            }
            $("#smsDeliveryLogs").html(html);
        });
    }

    $("#smsProviderSelector").on("change", function() {
        loadSMSSettings($(this).val());
    });

    $("#smsForm").on("submit", function(e) {
        e.preventDefault();
        const senderId = $("#smssenderid");
        const jsonConfig = $("#smsjson");
        const errDiv = $("#smsSettingsErrors");
        
        errDiv.hide().html("");
        
        if (!senderId.val()) {
            errDiv.html(showAlert("info", "Sender ID is required.", 1)).fadeIn();
            senderId.focus();
            return;
        }
        
        try {
            JSON.parse(jsonConfig.val());
        } catch(e) {
            errDiv.html(showAlert("info", "Invalid JSON configuration format.", 1)).fadeIn();
            jsonConfig.focus();
            return;
        }

        const data = $(this).serialize() + "&action=savesmssettings";
        $.post("../controllers/settingsoperations.php", data, function(response) {
            try {
                const res = JSON.parse(response);
                if (res.status === "success") {
                    showAlert("success", res.message);
                    loadSMSSettings($("#smsProviderSelector").val());
                } else {
                    errDiv.html(showAlert("danger", "Error: " + res.message, 1)).fadeIn();
                }
            } catch(e) {
                showAlert("danger", "Unexpected server response.");
            }
        });
    });

    $("#btnSendTestSMS").on("click", function() {
        const recipient = $("#testSMSRecipient");
        const message = $("#testSMSMessage");
        const errDiv = $("#testSMSErrors");
        
        errDiv.hide().html("");
        
        if (!recipient.val()) {
            errDiv.html(showAlert("info", "Recipient phone number is required.", 1)).fadeIn();
            recipient.focus();
            return;
        }
        if (!message.val()) {
            errDiv.html(showAlert("info", "Test message cannot be empty.", 1)).fadeIn();
            message.focus();
            return;
        }

        const btn = $(this);
        btn.prop("disabled", true).html('<span class="spinner-border spinner-border-sm mr-2" style="width: 12px; height: 12px;"></span> Sending...');

        $.post("../models/sms.php", {
            action: "testsms",
            recipient: recipient.val(),
            message: message.val()
        }, function(response) {
            btn.prop("disabled", false).html('<span class="material-symbols-outlined mr-2" style="font-size: 16px;">sms</span> Send Test SMS');
            try {
                const res = JSON.parse(response);
                if (res.status === "success") {
                    errDiv.html(showAlert("success", res.message, 1)).fadeIn();
                    loadRecentSMSLogs();
                } else {
                    errDiv.html(showAlert("danger", "Error: " + res.message, 1)).fadeIn();
                }
            } catch(e) {
                errDiv.html(showAlert("danger", "Unexpected server response.", 1)).fadeIn();
            }
        });
    });

    $("#smssenderid, #smsjson").on("input", function() {
        $("#smsSettingsErrors").fadeOut();
    });

    $("#testSMSRecipient, #testSMSMessage").on("input", function() {
        $("#testSMSErrors").fadeOut();
    });
    
    // --- Breed Management Logic ---
    $("#saveBreedBtn").on("click", function() {
        const name = $("#breedname"),
              origin = $("#breedOrigin"),
              characteristics = $("#characteristics"),
              avgMilking = $("#avgmilking"),
              breedIcon = $("#breedIcon"),
              isIndigenous = $("#isIndigenous"),
              alertContainer = $("#breed-modal-alert");

        alertContainer.empty().hide();

        let isValid = true;
        let errorMessage = "";
        let firstErrorField = null;

        if (!name.val().trim()) {
            isValid = false;
            errorMessage = "Breed name is required.";
            firstErrorField = name;
        } else if (!origin.val()) {
            isValid = false;
            errorMessage = "Origin country is required.";
            firstErrorField = origin;
        }

        if (!isValid) {
            alertContainer.html(showAlert("info", errorMessage, 1)).fadeIn();
            firstErrorField.focus();
            return;
        }

        // Processing state
        const btn = $(this);
        const originalBtnText = btn.html();
        btn.prop("disabled", true).html('<span class="material-symbols-outlined mr-2 fa-spin" style="font-size: 16px;">sync</span>Saving...');

        $.post("../controllers/breedoperations.php", {
            savebreed: true,
            id: 0,
            breedname: name.val().trim(),
            originid: origin.val(),
            characteristics: characteristics.val().trim(),
            isindigenous: isIndigenous.is(":checked") ? 1 : 0,
            avgmilking: avgMilking.val() || 0,
            icon: breedIcon.val()
        }, function(response) {
            btn.prop("disabled", false).html(originalBtnText);
            const res = JSON.parse(response);
            if (res.status === "success") {
                alertContainer.html(showAlert("success", res.message, 1)).fadeIn();
                getbreeds(breedsBody);
                setTimeout(() => {
                    $("#addBreedModal").modal("hide");
                    $("#addBreedForm")[0].reset();
                    $("#iconPreview").text("stars"); // Reset preview
                    alertContainer.hide();
                }, 1500);
            } else {
                alertContainer.html(showAlert("danger", res.message, 1)).fadeIn();
            }
        }).fail(function() {
            btn.prop("disabled", false).html(originalBtnText);
            alertContainer.html(showAlert("danger", "Server error. Please try again.", 1)).fadeIn();
        });
    });

    // Icon Preview Listener
    $("#breedIcon").on("change", function() {
        $("#iconPreview").text($(this).val());
    });

    $("#breedname, #breedOrigin").on("input change", function() {
        $("#breed-modal-alert").fadeOut();
    });

    // Initial loads
    loadEmailSettings("General");
    loadRecentEmailLogs();
    loadSMSSettings("AfricasTalking");
    loadRecentSMSLogs();
    getcountries(breedOrigin, 'choose');

    // --- Facility Pens Logic ---
    $("#savePenBtn").on("click", function() {
        const btn = $(this);
        const alertContainer = $("#pen-modal-alert");
        const penId = $("#penId");
        const name = $("#penName");
        const type = $("#penType");
        const capacity = $("#penCapacity");
        const location = $("#penLocation");

        alertContainer.hide().empty();

        // Validation
        if (!name.val().trim()) {
            alertContainer.html(showAlert("info", "Pen name is required.", 1)).fadeIn();
            name.focus();
            return;
        }
        if (!type.val()) {
            alertContainer.html(showAlert("info", "Please select a pen type.", 1)).fadeIn();
            type.focus();
            return;
        }
        if (!capacity.val() || capacity.val() <= 0) {
            alertContainer.html(showAlert("info", "Please enter a valid capacity.", 1)).fadeIn();
            capacity.focus();
            return;
        }

        const originalBtnText = btn.html();
        btn.prop("disabled", true).html('<span class="spinner-border spinner-border-sm mr-2"></span> Saving...');

        $.post("../controllers/penoperations.php", {
            action: 'savepen',
            id: penId.val(),
            penname: name.val().trim(),
            pentype: type.val(),
            capacity: capacity.val(),
            locationcluster: location.val().trim()
        }, function(response) {
            btn.prop("disabled", false).html(originalBtnText);
            const res = JSON.parse(response);
            if (res.status === "success") {
                alertContainer.html(showAlert("success", res.message, 1)).fadeIn();
                getpens(pensBody);
                setTimeout(() => {
                    $("#addPenModal").modal("hide");
                    $("#addPenForm")[0].reset();
                    penId.val(0);
                    alertContainer.hide();
                }, 1500);
            } else if (res.status === "exists") {
                alertContainer.html(showAlert("info", res.message, 1)).fadeIn();
                name.focus();
            } else {
                alertContainer.html(showAlert("danger", res.message, 1)).fadeIn();
            }
        }).fail(function() {
            btn.prop("disabled", false).html(originalBtnText);
            alertContainer.html(showAlert("danger", "Server error. Please try again.", 1)).fadeIn();
        });
    });

    // Clear alert on input
    $("#penName, #penType, #penCapacity").on("input change", function() {
        $("#pen-modal-alert").fadeOut();
    });

    // Auto-refresh logs every 30 seconds
    setInterval(function() {
        if ($("#tab-email").is(":visible")) loadRecentEmailLogs();
        if ($("#tab-sms").is(":visible")) loadRecentSMSLogs();
    }, 30000);

    // --- Feed Mix Logic ---
    function generateLast14Days() {
        const dates = [];
        const today = new Date();
        for (let i = 13; i >= 0; i--) {
            const d = new Date();
            d.setDate(today.getDate() - i);
            if (i === 0) {
                dates.push('Today');
            } else {
                dates.push(d.getDate().toString());
            }
        }
        return dates;
    }

    function initFeedMixChart() {
        if (feedMixChart) return; // Already initialized

        const options = {
            series: [{
                name: 'Volume (Tons)',
                data: [12, 10, 5, 8, 2, 20, 15, 25, 22, 35, 28, 32, 30, 34] // 14 days of data points
            }],
            chart: {
                type: 'area',
                height: '100%',
                parentHeightOffset: 0,
                toolbar: {
                    show: false
                },
                animations: {
                    enabled: true,
                    easing: 'easeinout',
                    speed: 800,
                }
            },
            xaxis: {
                categories: generateLast14Days(),
                labels: {
                    style: {
                        fontSize: '10px',
                        fontFamily: 'Work Sans, sans-serif',
                        colors: '#40493d'
                    }
                },
                axisBorder: { show: false },
                axisTicks: { show: false }
            },
            grid: {
                padding: {
                    top: -15,
                    bottom: -10,
                    left: 0,
                    right: 0
                }
            },
            yaxis: {
                labels: {
                    style: {
                        fontSize: '10px',
                        fontFamily: 'Work Sans, sans-serif',
                        colors: '#40493d'
                    },
                    formatter: function (val) {
                        return val + "T";
                    }
                }
            },
            dataLabels: {
                enabled: false
            },
            colors: ['#206223'],
            stroke: {
                curve: 'straight',
                width: 2
            },
            fill: {
                type: 'gradient',
                gradient: {
                    shadeIntensity: 1,
                    opacityFrom: 0.2,
                    opacityTo: 0.0,
                    stops: [0, 100]
                }
            },
            tooltip: {
                x: {
                    show: true
                },
                y: {
                    title: {
                        formatter: function (seriesName) {
                            return seriesName;
                        }
                    }
                },
                marker: {
                    show: true
                }
            }
        };

        const chartElement = document.querySelector("#feedMixVolumeChart");
        if (chartElement) {
            feedMixChart = new ApexCharts(chartElement, options);
            feedMixChart.render();
        }
    }

    // Hook into tab switching to render chart when visible
    $('.settings-tab-btn').on('click', function() {
        if ($(this).data('tab') === 'feed-mix') {
            setTimeout(initFeedMixChart, 50); // slight delay to allow display block to apply
        }
    });

    // Populate ingredients when Feed Mix modal opens
    $('#addFeedMixModal').on('show.bs.modal', function() {
        // Only fetch if the first select is empty or only has the disabled option
        const firstSelect = $('.feed-component-select').first();
        if (firstSelect.find('option').length <= 1) {
            getIngredients('.feed-component-select');
        }
        calculateFeedMixTotal();
    });

    // Feed Mix Component Rows Logic
    function calculateFeedMixTotal() {
        let total = 0;
        $('.feed-component-qty').each(function() {
            const val = parseFloat($(this).val());
            if (!isNaN(val)) {
                total += val;
            }
        });
        $('#feedMixTotalWeight').text(total.toFixed(2) + ' KG');
    }

    $('#feedComponentsContainer').on('input', '.feed-component-qty', function() {
        calculateFeedMixTotal();
    });

    $('#addFeedComponentBtn').on('click', function() {
        const container = $('#feedComponentsContainer');
        const firstRow = container.find('.feed-component-row').first();
        const newRow = firstRow.clone();
        
        // Reset values
        newRow.find('input').val('');
        newRow.find('select').prop('selectedIndex', 0);
        
        container.append(newRow);
    });

    $('#feedComponentsContainer').on('click', '.remove-component-btn', function() {
        const rows = $('#feedComponentsContainer .feed-component-row');
        if (rows.length > 1) {
            $(this).closest('.feed-component-row').remove();
        } else {
            // If only one row left, just clear it
            const row = $(this).closest('.feed-component-row');
            row.find('input').val('');
            row.find('select').prop('selectedIndex', 0);
        }
        calculateFeedMixTotal();
    });

    // Auto Feed Code Toggle Logic
    $('#autoFeedCodeBtn').on('click', function() {
        const btn = $(this);
        const input = $('#feedCode');
        
        btn.toggleClass('active-auto');
        
        if (btn.hasClass('active-auto')) {
            // Selected: Green background, white text
            btn.css({
                'background-color': 'var(--primary)',
                'color': 'white'
            });
            // Generate a placeholder code
            const randomNum = Math.floor(1000 + Math.random() * 9000);
            input.val(`JUK-2024-${randomNum}`);
            input.prop('readonly', true);
        } else {
            // Not selected: Gray background, gray text
            btn.css({
                'background-color': '#e3e3de',
                'color': '#40493d'
            });
            input.val('');
            input.prop('readonly', false);
        }
    });

    // Save Feed Mix Formulation
    $('#addFeedMixForm').on('submit', function(e) {
        e.preventDefault();
        
        // Reset previous errors
        $('#feedmix-modal-alert').hide().html('');
        $('.form-control').css('border', 'none');
        $('.feed-component-row').css('background-color', 'transparent');
        
        const feedName = $('#feedName').val();
        const feedCode = $('#feedCode').val();
        const totalWeight = parseFloat($('#feedMixTotalWeight').text());
        const generateCode = $('#autoFeedCodeBtn').hasClass('active-auto') ? 1 : 0;
        
        // Individual Validation
        if (!feedName) {
            $('#feedName').css('border', '1px solid #ef4444').focus();
            $('#feedmix-modal-alert').html(showAlert("info", "Please enter a Feed Name.", 1)).fadeIn();
            $('#addFeedMixModal .overflow-auto').animate({ scrollTop: 0 }, 'slow');
            return;
        }
        
        if (generateCode === 0 && !feedCode) {
            $('#feedCode').css('border', '1px solid #ef4444').focus();
            $('#feedmix-modal-alert').html(showAlert("info", "Please enter a Feed Code or enable Auto-generation.", 1)).fadeIn();
            $('#addFeedMixModal .overflow-auto').animate({ scrollTop: 0 }, 'slow');
            return;
        }
        
        let components = [];
        let selectedIngredients = new Set();
        let rows = $('.feed-component-row');
        
        if (rows.length === 0) {
            $('#feedmix-modal-alert').html(showAlert("info", "Please add at least one component to the formulation.", 1)).fadeIn();
            return;
        }

        let validationError = false;
        rows.each(function() {
            const select = $(this).find('.feed-component-select');
            const qtyInput = $(this).find('.feed-component-qty');
            const itemId = select.val();
            const qty = parseFloat(qtyInput.val());
            
            if (!itemId) {
                $(this).css('background-color', 'rgba(239, 68, 68, 0.05)');
                select.css('border', '1px solid #ef4444').focus();
                $('#feedmix-modal-alert').html(showAlert("info", "Please select an ingredient for all component rows.", 1)).fadeIn();
                validationError = true;
                return false; // break loop
            }
            
            if (isNaN(qty) || qty <= 0) {
                $(this).css('background-color', 'rgba(239, 68, 68, 0.05)');
                qtyInput.css('border', '1px solid #ef4444').focus();
                $('#feedmix-modal-alert').html(showAlert("info", "Please provide a valid weight greater than zero for all components.", 1)).fadeIn();
                validationError = true;
                return false; // break loop
            }

            if (selectedIngredients.has(itemId)) {
                $(this).css('background-color', 'rgba(239, 68, 68, 0.05)');
                select.css('border', '1px solid #ef4444').focus();
                $('#feedmix-modal-alert').html(showAlert("info", "Duplicate ingredient detected. Each ingredient can only be added once.", 1)).fadeIn();
                validationError = true;
                return false; // break loop
            }

            selectedIngredients.add(itemId);
            components.push({
                inventoryitemid: itemId,
                quantity: qty
            });
        });
        
        if (validationError) {
            $('#addFeedMixModal .overflow-auto').animate({ scrollTop: 0 }, 'slow');
            return;
        }
        
        // Show processing state
        $('#feedmix-modal-alert').html(showAlert("processing", "Saving feed formulation, please wait...", 1)).fadeIn();
        const saveBtn = $('#addFeedMixModal .btn-primary');
        saveBtn.prop('disabled', true);

        $.ajax({
            url: '../controllers/feedmixoperations.php',
            type: 'POST',
            data: {
                action: 'savefeedmix',
                feedname: feedName,
                feedcode: feedCode,
                totalweight: totalWeight,
                components: JSON.stringify(components),
                generatecode: generateCode
            },
            success: function(response) {
                saveBtn.prop('disabled', false);
                try {
                    const res = JSON.parse(response);
                    if (res.status === 'success') {
                        $('#feedmix-modal-alert').html(showAlert("success", res.message, 1)).fadeIn();
                        
                        // Clear the form
                        $('#addFeedMixForm')[0].reset();
                        $('.feed-component-row:not(:first)').remove();
                        $('.feed-component-row input').val('');
                        $('.feed-component-row select').prop('selectedIndex', 0);
                        calculateFeedMixTotal();
                        
                        // Reset Auto button
                        $('#autoFeedCodeBtn').removeClass('active-auto').css({
                            'background-color': '#e3e3de',
                            'color': '#40493d'
                        });
                        $('#feedCode').prop('readonly', false);
                        
                        $('#addFeedMixModal .overflow-auto').animate({ scrollTop: 0 }, 'slow');
                        if (typeof initFeedMixChart === 'function') initFeedMixChart();
                    } else {
                        $('#feedmix-modal-alert').html(showAlert("info", "Error: " + res.message, 1)).fadeIn();
                    }
                } catch (e) {
                    $('#feedmix-modal-alert').html(showAlert("info", "Unexpected response from server.", 1)).fadeIn();
                }
            },
            error: function() {
                saveBtn.prop('disabled', false);
                $('#feedmix-modal-alert').html(showAlert("info", "Network error while saving feed mix.", 1)).fadeIn();
            }
        });
    });

    // Trigger submit on save button click
    $('#addFeedMixModal .btn-primary').on('click', function() {
        if ($(this).text().trim() === 'Save Formulation') {
            $('#addFeedMixForm').submit();
        }
    });

    // Remove red highlight when field is focused
    $(document).on('focus', '#addFeedMixModal .form-control, #addFeedMixModal select', function() {
        $(this).css('border', 'none');
        $(this).closest('.feed-component-row').css('background-color', 'transparent');
    });

});
