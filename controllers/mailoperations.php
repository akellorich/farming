<?php
    session_start();
    require_once("../models/mail.php");
    
    $mail = new mail();
    $action = $_REQUEST['action'] ?? '';

    if ($action == 'testemail') {
        $role = $_POST['role'] ?? 'General';
        $recipient = $_POST['recipient'] ?? '';
        $subject = $_POST['subject'] ?? '';
        $message = $_POST['message'] ?? '';

        if (empty($recipient) || empty($subject) || empty($message)) {
            echo json_encode(["status" => "error", "message" => "All fields are required."]);
            exit;
        }

        // Check the sendmode for this role
        $db = $mail->connect();
        $stmt = $db->prepare("SELECT `sendmode` FROM `emailsettings` WHERE `role` = ?");
        $stmt->bind_param("s", $role);
        $stmt->execute();
        $config = $stmt->get_result()->fetch_assoc();
        $sendmode = $config['sendmode'] ?? 'Direct';

        if ($sendmode === 'Queue' || $sendmode === 'Both') {
            // Queue it
            $stmt_q = $db->prepare("CALL sp_saveemaillog(?, ?, ?, ?, ?)");
            $stmt_q->bind_param("ssssi", $role, $recipient, $subject, $message, $_SESSION['userid']);
            $stmt_q->execute();
            
            $msg = ($sendmode === 'Both') ? "Email queued and direct send initiated (Both mode)." : "Email added to queue successfully.";
            
            if ($sendmode === 'Direct' || $sendmode === 'Both') {
                $response = $mail->sendEmail($recipient, $subject, $message, $role);
                echo json_encode($response);
            } else {
                echo json_encode(["status" => "success", "message" => $msg]);
            }
        } else {
            // Direct only
            $response = $mail->sendEmail($recipient, $subject, $message, $role);
            echo json_encode($response);
        }
    }
?>
