function showAlert(type, message, hideheading = 0) {
    let alert = ""
    switch (type) {
        case "warning":
            alert = "<div class='alert alert-warning alert-white rounded mb-2'>"
            alert += "<div class='icon'>"
            alert += "<i class='fal fa-exclamation-triangle'></i>"
            alert += "</div>"
            if (hideheading == 0) {
                alert += "<strong>Warning!</strong><br/>"
            }
            alert += message + "</div> "
            break;
        case "info":
            alert = "<div class='alert alert-info alert-white rounded mb-2'>"
            alert += "<div class='icon'>"
            alert += "<i class='fal fa-info-circle'></i>"
            alert += "</div>"
            if (hideheading == 0) {
                alert += "<strong>Information!</strong><br/>"
            }
            alert += message + "</div> "
            break;
        case "danger":
            alert = "<div class='alert alert-danger alert-white rounded mb-2'>"
            alert += "<div class='icon'>"
            alert += "<i class='fal fa-times-circle'></i>"
            alert += "</div>"
            if (hideheading == 0) {
                alert += "<strong>Danger!</strong><br/>"
            }
            alert += message + "</div> "
            break;
        case "success":
            alert = "<div class='alert alert-success alert-white rounded mb-2'>"
            alert += "<div class='icon'>"
            alert += "<i class='fal fa-check-circle'></i>"
            alert += "</div>"
            if (hideheading == 0) {
                alert += "<strong>Success!</strong><br/>"
            }
            alert += message + "</div> "
            break;
        case "processing":
            alert = "<div class='alert alert-info alert-white rounded mb-2'>"
            alert += "<div class='icon'>"
            alert += "<i class='fal fa-spin fa-spinner'></i>"
            alert += "</div>"
            if (hideheading == 0) {
                alert += "<strong>Processing!</strong><br/>"
            }
            alert += message + "</div> "
            break;
    }

    // Check if we have a global container. If not, create a floating one at the top.
    let container = $("#global-alert-container");
    if (container.length === 0) {
        $("body").prepend('<div id="global-alert-container" style="position: fixed; top: 20px; right: 20px; z-index: 9999; width: 350px;"></div>');
        container = $("#global-alert-container");
    }

    // If hideheading is not 1 (which means it's a global notification call), show it in the container.
    // If it is 1, it's likely being used for inline HTML insertion.
    if (hideheading !== 1) {
        const $alert = $(alert).hide();
        container.append($alert);
        $alert.fadeIn().delay(5000).fadeOut(function() { $(this).remove(); });
    }

    return alert;
}