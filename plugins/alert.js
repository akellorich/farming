function showAlert(type,message,hideheading=0){
    let alert=""
    switch (type) {
        case "warning":
            alert="<div class='alert alert-warning alert-white rounded mb-2'>"
            // alert+="<button type='button' data-dismiss='alert' aria-hidden='true' class='close'></button>"
            alert+="<div class='icon'>"
            alert+="<i class='fal fa-exclamation-triangle'></i>"   
            alert+="</div>"
            if(hideheading==0){
                alert+="<strong>Warning!</strong><br/>"
            }
            alert+=message+"</div> "
            break;
        case "info":
            alert="<div class='alert alert-info alert-white rounded mb-2'>"
            // alert+="<button type='button' data-dismiss='alert' aria-hidden='true' class='close'></button>"
            alert+="<div class='icon'>"
            alert+="<i class='fal fa-info-circle'></i>"   
            alert+="</div>"
            if(hideheading==0){
                alert+="<strong>Information!</strong><br/>"
            }
            alert+=message+"</div> "
            break;
        case "danger":
            alert="<div class='alert alert-danger alert-white rounded mb-2'>"
            // alert+="<button type='button' data-dismiss='alert' aria-hidden='true' class='close'></button>"
            alert+="<div class='icon'>"
            alert+="<i class='fal fa-times-circle'></i>"   
            alert+="</div>"
            if(hideheading==0){
                alert+="<strong>Danger!</strong><br/>"
            }
            alert+=message+"</div> "
            break;
        
        case "success":
            alert="<div class='alert alert-success alert-white rounded mb-2'>"
            // alert+="<button type='button' data-dismiss='alert' aria-hidden='true' class='close'></button>"
            alert+="<div class='icon'>"
            alert+="<i class='fal fa-check-circle'></i>"   
            alert+="</div>"
            if(hideheading==0){
                alert+="<strong>Success!</strong><br/>"
            }
            alert+=message+"</div> "
            break;
        case "processing":
                alert="<div class='alert alert-info alert-white rounded mb-2'>"
                // alert+="<button type='button' data-dismiss='alert' aria-hidden='true' class='close'></button>"
                alert+="<div class='icon'>"
                alert+="<i class='fal fa-spin fa-spinner'></i>"   
                alert+="</div>"
                if(hideheading==0){
                    alert+="<strong>Processing!</strong><br/>"
                }
                alert+=message+"</div> "
                break;
    }
    return alert

}