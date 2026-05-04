<?php
    // Mail Worker - Processes pending emails from emaillogs
    require_once(__DIR__ . "/../models/mail.php");
    
    $mail = new mail();
    
    echo "[" . date('Y-m-d H:i:s') . "] Starting Mail Worker...\n";

    // 1. Get pending emails
    $db = $mail->connect();
    $sql = "CALL sp_getpendingemails()";
    $result = $db->query($sql);
    
    $pending = [];
    while ($row = $result->fetch_assoc()) {
        $pending[] = $row;
    }
    
    // Clear the result set to allow subsequent queries
    while($db->next_result()) $db->store_result();

    echo "Found " . count($pending) . " pending emails.\n";

    foreach ($pending as $item) {
        echo "Processing ID: " . $item['id'] . " to " . $item['recipient'] . "... ";
        
        // Send the email
        // Note: we use the 'sender' column as the role
        $response = $mail->sendEmail($item['recipient'], $item['subject'], $item['message'], $item['sender']);
        
        if ($response['status'] === 'success') {
            echo "SENT.\n";
        } else {
            echo "FAILED: " . $response['message'] . "\n";
        }
    }

    echo "[" . date('Y-m-d H:i:s') . "] Mail Worker Finished.\n";
?>
