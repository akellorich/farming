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
    getFeedMixes();
    getInsuranceCompanies();

    // --- Leaflet Map Initialization ---
    function initBusinessMap() {
        const mapContainer = document.getElementById('businessMap');
        if (!mapContainer) return;

        // Initialize map centered on Nakuru (based on previous Google Map)
        const nakuruCoords = [-0.3031, 36.0613];
        const map = L.map('businessMap', {
            center: nakuruCoords,
            zoom: 13,
            scrollWheelZoom: false
        });

        // Add premium grayscale tiles (CartoDB Positron)
        L.tileLayer('https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors &copy; <a href="https://carto.com/attributions">CARTO</a>',
            subdomains: 'abcd',
            maxZoom: 20
        }).addTo(map);

        // Add the business pin
        const businessMarker = L.marker(nakuruCoords).addTo(map);
        businessMarker.bindPopup("<b>Jukam Dairy HQ</b><br>Official Business Premises").openPopup();

        // Fix for Leaflet maps in hidden tabs/containers
        setTimeout(() => { map.invalidateSize(); }, 500);
    }

    initBusinessMap();

    // Feed Mix State Management
    let feedMixChart = null;
    let allFeedMixes = [];
    let currentFeedMixPage = 1;
    const feedMixPageSize = 5;

    function loadFeedMixStats() {
        $.getJSON("../controllers/feedmixoperations.php?action=getfeedmixstats", function(response) {
            if (response && response.length > 0) {
                const stats = response[0];
                $("#totalFormulationsCount").text(stats.total_formulations);
                $("#activeBatchesCount").text(stats.active_batches);
                $("#mostUsedIngredientName").text(stats.most_used_ingredient);
                $("#feedStockStatus").text(stats.avg_stock_status + "%");
            }
        });
    }

    function getFeedMixes() {
        loadFeedMixStats(); // Also update stats when reloading list
        const feedMixBody = $("#feedMixBody");
        feedMixBody.html(`
            <tr>
                <td colspan="5" class="text-center py-5">
                    <div class="spinner-border text-success" role="status">
                        <span class="sr-only">Loading...</span>
                    </div>
                </td>
            </tr>
        `);

        $.getJSON("../controllers/feedmixoperations.php?action=getfeedmixes", function(response) {
            allFeedMixes = response || [];
            renderFeedMixTable();
        }).fail(function() {
            feedMixBody.html('<tr><td colspan="5" class="text-center py-4 text-danger">Failed to load formulations</td></tr>');
        });
    }

    function renderFeedMixTable() {
        const feedMixBody = $("#feedMixBody");
        const paginationContainer = $("#feedMixPagination");
        feedMixBody.empty();

        if (allFeedMixes.length === 0) {
            feedMixBody.append('<tr><td colspan="5" class="text-center py-4 text-muted">No formulations found</td></tr>');
            paginationContainer.empty();
            return;
        }

        const startIndex = (currentFeedMixPage - 1) * feedMixPageSize;
        const endIndex = Math.min(startIndex + feedMixPageSize, allFeedMixes.length);
        const paginatedData = allFeedMixes.slice(startIndex, endIndex);

        paginatedData.forEach(mix => {
            feedMixBody.append(`
                <tr class="border-bottom hover-row" data-id="${mix.id}">
                    <td class="py-3 pl-4">
                        <span class="font-weight-bold d-block" style="color: var(--on-surface); font-size: 12px;">${mix.feedname}</span>
                        <span class="d-none d-md-inline text-muted" style="font-size: 10px;">${mix.feedcode}</span>
                    </td>
                    <td class="py-3 align-middle d-none d-md-table-cell text-muted" style="font-size: 12px;">${mix.primary_ingredient || 'Compound'}</td>
                    <td class="py-3 align-middle font-weight-bold" style="color: var(--on-surface); font-size: 12px;">${mix.totalweight} KG</td>
                    <td class="py-3 align-middle d-none d-lg-table-cell text-muted" style="font-size: 11px;">${formatDate(mix.mixdate)}</td>
                    <td class="py-3 pr-4 align-middle text-center">
                        <div class="dropdown">
                            <button class="btn btn-sm btn-light rounded-circle p-1 border-0" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width: 32px; height: 32px; background: #f4f4ef;">
                                <span class="material-symbols-outlined" style="font-size: 18px; color: var(--on-surface-variant);">more_vert</span>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right border-0 shadow-lg py-2" style="border-radius: 12px; min-width: 160px;">
                                <a class="dropdown-item d-flex align-items-center py-2 record-feed-mix" href="#" data-id="${mix.id}" style="gap: 10px;">
                                    <span class="material-symbols-outlined" style="font-size: 18px; color: var(--primary);">blender</span>
                                    <span style="font-size: 13px; font-weight: 500;">Record Batch</span>
                                </a>
                                <a class="dropdown-item d-flex align-items-center py-2 edit-feed-mix" href="#" data-id="${mix.id}" style="gap: 10px;">
                                    <span class="material-symbols-outlined" style="font-size: 18px; color: var(--secondary);">edit_note</span>
                                    <span style="font-size: 13px; font-weight: 500;">Edit Formulation</span>
                                </a>
                                <div class="dropdown-divider mx-2"></div>
                                <a class="dropdown-item d-flex align-items-center py-2 delete-feed-mix" href="#" data-id="${mix.id}" style="gap: 10px; color: var(--error);">
                                    <span class="material-symbols-outlined" style="font-size: 18px;">delete_sweep</span>
                                    <span style="font-size: 13px; font-weight: 500;">Delete</span>
                                </a>
                            </div>
                        </div>
                    </td>
                </tr>
            `);
        });

        renderPagination(allFeedMixes.length, feedMixPageSize, currentFeedMixPage, paginationContainer, function(page) {
            currentFeedMixPage = page;
            renderFeedMixTable();
        });
    }

    function renderFeedMixBreakdown(id, name, totalWeight) {
        const title = $("#feedMixBreakdownTitle");
        const content = $("#feedMixBreakdownContent");
        
        title.text("Breakdown: " + name);
        content.html(`
            <div class="text-center py-5">
                <div class="spinner-border spinner-border-sm text-success" role="status"></div>
            </div>
        `);

        $.getJSON("../controllers/feedmixoperations.php?action=getfeedmixdetails&id=" + id, function(response) {
            content.empty();
            if (response && response.length > 0) {
                const colors = ['var(--primary)', 'var(--secondary)', 'var(--tertiary)', 'var(--secondary-container)', 'var(--primary-fixed)', 'var(--outline)'];
                
                response.forEach((item, index) => {
                    const percentage = totalWeight > 0 ? ((item.quantity / totalWeight) * 100).toFixed(1) : 0;
                    const color = colors[index % colors.length];
                    
                    content.append(`
                        <div>
                            <div class="d-flex justify-content-between mb-1">
                                <span class="font-weight-bold" style="font-size: 11px; color: var(--on-surface);">${item.itemname}</span>
                                <span class="font-weight-bold" style="font-size: 11px; color: var(--on-surface-variant);">${percentage}%</span>
                            </div>
                            <div class="progress" style="height: 6px; background-color: #f4f4ef; border-radius: 10px; overflow: hidden;">
                                <div class="progress-bar" role="progressbar" style="width: ${percentage}%; background-color: ${color}; border-radius: 10px;" aria-valuenow="${percentage}" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="d-flex justify-content-end mt-1">
                                <span style="font-size: 9px; color: var(--on-surface-variant); opacity: 0.7;">${item.quantity} ${item.uom || 'KG'}</span>
                            </div>
                        </div>
                    `);
                });
            } else {
                content.html('<div class="text-center py-4 text-muted small">No composition details found</div>');
            }
        });
    }

    // Row Click Listener for Feed Mix Table
    $(document).on("click", "#feedMixBody tr.hover-row", function(e) {
        // Prevent click if clicking on dropdown or buttons
        if ($(e.target).closest('.dropdown, .dropdown-menu, button').length) return;
        
        const row = $(this);
        const id = row.data("id");
        const name = row.find('td:first span:first').text();
        const weightStr = row.find('td:nth-child(3)').text().replace(' KG', '');
        const totalWeight = parseFloat(weightStr);
        
        // Highlight row
        $("#feedMixBody tr").removeClass("active-row").css("background-color", "transparent");
        row.addClass("active-row").css("background-color", "rgba(32, 98, 35, 0.05)");
        
        renderFeedMixBreakdown(id, name, totalWeight);
    });

    function renderPagination(totalItems, pageSize, currentPage, container, onPageChange) {
        container.empty();
        const totalPages = Math.ceil(totalItems / pageSize);
        if (totalPages <= 1) return;

        const nav = $('<nav aria-label="Page navigation"></nav>');
        const ul = $('<ul class="pagination pagination-sm mb-0" style="gap: 5px;"></ul>');

        // Previous
        const prevLi = $(`<li class="page-item ${currentPage === 1 ? 'disabled' : ''}"><a class="page-link rounded-circle border-0" href="#" style="width: 32px; height: 32px; display: flex; align-items: center; justify-content: center; background: #f4f4ef;"><span class="material-symbols-outlined" style="font-size: 18px;">chevron_left</span></a></li>`);
        prevLi.on('click', function(e) {
            e.preventDefault();
            if (currentPage > 1) onPageChange(currentPage - 1);
        });
        ul.append(prevLi);

        // Pages
        for (let i = 1; i <= totalPages; i++) {
            const li = $(`<li class="page-item ${i === currentPage ? 'active' : ''}"><a class="page-link rounded-circle border-0" href="#" style="width: 32px; height: 32px; display: flex; align-items: center; justify-content: center; ${i === currentPage ? 'background: var(--primary); color: white;' : 'background: #f4f4ef; color: var(--on-surface-variant);'}">${i}</a></li>`);
            li.on('click', function(e) {
                e.preventDefault();
                onPageChange(i);
            });
            ul.append(li);
        }

        // Next
        const nextLi = $(`<li class="page-item ${currentPage === totalPages ? 'disabled' : ''}"><a class="page-link rounded-circle border-0" href="#" style="width: 32px; height: 32px; display: flex; align-items: center; justify-content: center; background: #f4f4ef;"><span class="material-symbols-outlined" style="font-size: 18px;">chevron_right</span></a></li>`);
        nextLi.on('click', function(e) {
            e.preventDefault();
            if (currentPage < totalPages) onPageChange(currentPage + 1);
        });
        ul.append(nextLi);

        nav.append(ul);
        container.append(nav);
    }

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
                $("#incorporationdate").val(data.incorporationdate ? formatDate(data.incorporationdate) : '');
                $("#emailaddress").val(data.emailaddress);
                $("#physicaladdress").val(data.physicaladdress);
                $("#postaladdress").val(data.postaladdress);
                $("#mobileno").val(data.mobileno);
                if (data.logopath) {
                    const fullPath = data.logopath.startsWith('images/') ? "../" + data.logopath : "../images/" + data.logopath;
                    logoPreview.attr("src", fullPath);
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

    // --- Insurance Management Logic ---
    function getInsuranceCompanies() {
        const body = $("#insuranceBody");
        body.html('<tr><td colspan="5" class="text-center py-4"><div class="spinner-border spinner-border-sm text-success"></div></td></tr>');

        $.getJSON("../controllers/insuranceoperations.php?action=getinsurancecompanies", function(response) {
            body.empty();
            if (response && response.length > 0) {
                response.forEach(company => {
                    body.append(`
                        <tr class="border-bottom hover-row">
                            <td class="py-3 pl-0">
                                <span class="font-weight-bold d-block" style="color: var(--on-surface); font-size: 13px;">${company.companyname}</span>
                                <span class="text-muted" style="font-size: 11px;">${company.emailaddress || 'No email registered'}</span>
                            </td>
                            <td class="py-3 text-center text-muted" style="font-size: 12px;">${company.registrationno}</td>
                            <td class="py-3 text-center font-weight-medium" style="font-size: 12px;">${company.contactperson}</td>
                            <td class="py-3 text-center d-none d-lg-table-cell text-muted" style="font-size: 12px;">${company.contacts}</td>
                            <td class="py-3 pr-0 text-right">
                                <div class="dropdown">
                                    <button class="btn btn-sm btn-light rounded-circle p-1 border-0" type="button" data-toggle="dropdown" style="width: 32px; height: 32px; background: #f4f4ef;">
                                        <span class="material-symbols-outlined" style="font-size: 18px; color: var(--on-surface-variant);">more_vert</span>
                                    </button>
                                    <div class="dropdown-menu dropdown-menu-right border-0 shadow-lg py-2" style="border-radius: 12px; min-width: 150px;">
                                        <a class="dropdown-item d-flex align-items-center py-2 edit-insurance" href="#" data-id="${company.id}" style="gap: 10px;">
                                            <span class="material-symbols-outlined" style="font-size: 18px; color: var(--secondary);">edit_note</span>
                                            <span style="font-size: 13px; font-weight: 500;">Edit Provider</span>
                                        </a>
                                        <div class="dropdown-divider mx-2"></div>
                                        <a class="dropdown-item d-flex align-items-center py-2 delete-insurance" href="#" data-id="${company.id}" style="gap: 10px; color: var(--error);">
                                            <span class="material-symbols-outlined" style="font-size: 18px;">delete_sweep</span>
                                            <span style="font-size: 13px; font-weight: 500;">Remove</span>
                                        </a>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    `);
                });
            } else {
                body.html('<tr><td colspan="5" class="text-center py-5 text-muted">No insurance providers registered.</td></tr>');
            }
        }).fail(() => {
            body.html('<tr><td colspan="5" class="text-center py-4 text-danger">Failed to load insurance data.</td></tr>');
        });
    }

    $("#saveInsuranceBtn").on("click", function() {
        const btn = $(this);
        const alertDiv = $("#insurance-modal-alert");
        const id = $("#insuranceId").val();
        const companyName = $("#insCompanyName").val().trim();
        const regNo = $("#insRegNo").val().trim();
        const contactPerson = $("#insContactPerson").val().trim();
        const contacts = $("#insContacts").val().trim();
        const email = $("#insEmail").val().trim();
        const address = $("#insAddress").val().trim();

        alertDiv.hide().empty();

        if (!companyName) {
            alertDiv.html(showAlert("info", "Company Name is required.", 1)).fadeIn();
            $("#insCompanyName").focus();
            return;
        }
        if (!regNo) {
            alertDiv.html(showAlert("info", "Registration Number is required.", 1)).fadeIn();
            $("#insRegNo").focus();
            return;
        }

        const originalBtnText = btn.html();
        btn.prop("disabled", true).html('<span class="spinner-border spinner-border-sm mr-2"></span> Saving...');

        $.ajax({
            url: "../controllers/insuranceoperations.php",
            type: "POST",
            data: {
                action: "saveinsurancecompany",
                id: id,
                registrationno: regNo,
                companyname: companyName,
                contacts: contacts,
                contactperson: contactPerson,
                emailaddress: email,
                physicaladdress: address
            },
            success: function(response) {
                btn.prop("disabled", false).html(originalBtnText);
                try {
                    const res = JSON.parse(response);
                    if (res.status === "success") {
                        showAlert("success", res.message);
                        getInsuranceCompanies();
                        $("#addInsuranceModal").modal("hide");
                        $("#insuranceForm")[0].reset();
                        $("#insuranceId").val(0);
                    } else {
                        alertDiv.html(showAlert("danger", "Error: " + res.message, 1)).fadeIn();
                    }
                } catch(e) {
                    alertDiv.html(showAlert("danger", "Unexpected response from server.", 1)).fadeIn();
                }
            },
            error: function() {
                btn.prop("disabled", false).html(originalBtnText);
                alertDiv.html(showAlert("danger", "Network error. Please try again.", 1)).fadeIn();
            }
        });
    });

    $(document).on("click", ".edit-insurance", function(e) {
        e.preventDefault();
        const id = $(this).data("id");
        
        $.getJSON(`../controllers/insuranceoperations.php?action=getinsurancecompany&id=${id}`, function(response) {
            if (response) {
                $("#insuranceId").val(response.id);
                $("#insCompanyName").val(response.companyname);
                $("#insRegNo").val(response.registrationno);
                $("#insContactPerson").val(response.contactperson);
                $("#insContacts").val(response.contacts);
                $("#insEmail").val(response.emailaddress);
                $("#insAddress").val(response.physicaladdress);
                
                $("#insuranceModalTitle").text("Edit Insurance Provider");
                $("#addInsuranceModal").modal("show");
            }
        });
    });

    $(document).on("click", ".delete-insurance", function(e) {
        e.preventDefault();
        const id = $(this).data("id");
        
        if (confirm("Are you sure you want to remove this insurance provider? This action cannot be undone.")) {
            $.post("../controllers/insuranceoperations.php", { action: "deleteinsurancecompany", id: id }, function(response) {
                try {
                    const res = JSON.parse(response);
                    if (res.status === "success") {
                        showAlert("success", res.message);
                        getInsuranceCompanies();
                    } else {
                        showAlert("danger", "Error: " + res.message);
                    }
                } catch(e) {
                    showAlert("danger", "Unexpected response from server.");
                }
            });
        }
    });

    $("#addInsuranceModal").on("hidden.bs.modal", function() {
        $("#insuranceForm")[0].reset();
        $("#insuranceId").val(0);
        $("#insuranceModalTitle").text("Add Insurance Provider");
        $("#insurance-modal-alert").hide().empty();
    });

});
