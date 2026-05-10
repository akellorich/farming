<?php
    require_once("../models/settings.php");
    $settings = new settings();
    
    // --- GET ACTIONS ---
    $action = $_GET['action'] ?? $_POST['action'] ?? '';

    if ($action == 'getcompanydetails') {
        echo $settings->getCompanyDetails();
    }

    if ($action == 'getemailsettings') {
        $role = $_GET['role'] ?? 'General';
        echo $settings->getEmailSettings($role);
    }

    if ($action == 'getsmssettings') {
        $id = $_GET['id'] ?? 0;
        echo $settings->getSMSSettings($id);
    }

    if ($action == 'getrecentemaillogs') {
        echo $settings->getRecentEmailLogs();
    }

    if ($action == 'getrecentsmslogs') {
        echo $settings->getRecentSMSLogs();
    }
    
    if ($action == 'getsmsproviders') {
        echo $settings->getSMSProviders();
    }

    if ($action == 'getmilkingschedules') {
        echo $settings->getMilkingSchedules();
    }

    if ($action == 'getfeedingshifts') {
        echo $settings->getFeedingShifts();
    }

    // --- POST ACTIONS ---
    if ($action == 'savecompanydetails') {
        $companyname = $_POST['companyname'] ?? '';
        $taxregno = $_POST['taxregno'] ?? '';
        $incorporationdate = $_POST['incorporationdate'] ?? '';
        $emailaddress = $_POST['emailaddress'] ?? '';
        $physicaladdress = $_POST['physicaladdress'] ?? '';
        $postaladdress = $_POST['postaladdress'] ?? '';
        $mobileno = $_POST['mobileno'] ?? '';
        
        $logopath = null;
        if (isset($_FILES['logo']) && $_FILES['logo']['error'] == 0) {
            $target_dir = "../images/";
            if (!file_exists($target_dir)) mkdir($target_dir, 0777, true);
            $ext = pathinfo($_FILES["logo"]["name"], PATHINFO_EXTENSION);
            $random_str = substr(str_shuffle("0123456789abcdefghijklmnopqrstuvwxyz"), 0, 8);
            $filename = "logo_" . $random_str . "." . $ext;
            if (move_uploaded_file($_FILES["logo"]["tmp_name"], $target_dir . $filename)) {
                $logopath = $filename; // Just save the filename
            }
        }
        
        $response = $settings->saveCompanyDetails($companyname, $taxregno, $incorporationdate, $emailaddress, $physicaladdress, $postaladdress, $mobileno, $logopath);
        echo json_encode($response);
    }

    if ($action == 'saveemailsettings') {
        $id = $_POST['id'] ?? 0;
        $role = $_POST['role'] ?? 'General';
        $sendername = $_POST['sendername'] ?? '';
        $smtpserver = $_POST['smtpserver'] ?? '';
        $smtpport = $_POST['smtpport'] ?? 0;
        $smtpuser = $_POST['smtpuser'] ?? '';
        $smtppassword = $_POST['smtppassword'] ?? '';
        $smtpusessl = isset($_POST['smtpusessl']) ? 1 : 0;
        $sendmode = $_POST['sendmode'] ?? 'Queue';
        
        $response = $settings->saveEmailSettings($id, $role, $sendername, $smtpserver, $smtpport, $smtpuser, $smtppassword, $smtpusessl, $sendmode);
        echo json_encode($response);
    }

    if ($action == 'savesmssettings') {
        $id = $_POST['id'] ?? 0;
        $provider = $_POST['provider'] ?? '';
        $senderid = $_POST['senderid'] ?? '';
        $smsjson = $_POST['smsjson'] ?? '{}';
        $priorityroute = $_POST['priorityroute'] ?? 1;
        $isdefault = (isset($_POST['isdefault']) && ($_POST['isdefault'] == 'on' || $_POST['isdefault'] == 1)) ? 1 : 0;
        
        $response = $settings->saveSMSSettings($id, $provider, $senderid, $smsjson, $priorityroute, $isdefault);
        echo json_encode($response);
    }
?>
