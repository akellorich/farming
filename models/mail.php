<?php
    require_once("db.php");
    use PHPMailer\PHPMailer\PHPMailer;
    require_once(__DIR__."/../plugins/phpmailer/PHPMailer.php");
    require_once(__DIR__."/../plugins/phpmailer/SMTP.php");
    require_once(__DIR__."/../plugins/phpmailer/Exception.php");

    class mail extends db{
        private $smtpserver;
        private $smtpport;
        private $smtpsecurity;
        private $username;
        private $password;

        function sendEmail($recipient, $subject, $message, $role = 'General', $attachment = '', $stringattachment = '', $filename = '') {
            $mail = new PHPMailer();
            
            // Get configuration for specific role using Stored Procedure
            $sql = "CALL sp_getemailsettingsbyrole('{$role}')";
            $config = $this->getData($sql)->fetch(PDO::FETCH_ASSOC);
            
            if (!$config) {
                return ["status" => "error", "message" => "Configuration for role '{$role}' not found."];
            }

            $mail->isSMTP();
            $mail->Host = $config['smtpserver'];
            $mail->SMTPAuth = true;
            $mail->Username = $config['useremail'];
            $mail->Password = $config['password'];
            $mail->Port = $config['smtpport'];
            $mail->SMTPSecure = $config['ssltoggle'] == 1 ? PHPMailer::ENCRYPTION_STARTTLS : null;

            $senderName = $config['sendername'];
            if ($senderName === '{{username}}') {
                $senderName = trim(($_SESSION['firstname'] ?? '') . ' ' . ($_SESSION['lastname'] ?? ''));
                if (empty($senderName)) $senderName = $_SESSION['username'] ?? 'System';
            }

            $mail->isHTML(true);
            $mail->SetFrom($config['useremail'], $senderName);
            $mail->addAddress($recipient);
            $mail->Subject = $subject;
            $mail->Body = $message;
            
            if ($attachment != "") {
                if (is_array($attachment)) {
                    foreach ($attachment as $attached) {
                        $mail->AddAttachment($attached);
                    }
                } else {
                    $mail->AddAttachment($attachment);
                } 
            }

            if ($stringattachment != "") {
                $mail->addStringAttachment($stringattachment, $filename);
            }

            if ($mail->send()) {
                $this->logEmail($role, $recipient, $subject, $message, 'Sent', 'Success');
                return ["status" => "success", "message" => "Email sent successfully"];
            } else {
                $this->logEmail($role, $recipient, $subject, $message, 'Failed', $mail->ErrorInfo);
                return ["status" => "error", "message" => $mail->ErrorInfo];
            }
        }

        private function logEmail($sender, $recipient, $subject, $message, $status, $reason) {
            $db = $this->connect();
            $stmt = $db->prepare("CALL sp_saveemaillog(?, ?, ?, ?, ?)");
            $stmt->bind_param("ssssi", $sender, $recipient, $subject, $message, $_SESSION['userid']);
            $stmt->execute();
            
            $logId = $db->insert_id;
            if ($status != 'Pending') {
                $stmt_upd = $db->prepare("CALL sp_updateemailstatus(?, ?, ?)");
                $stmt_upd->bind_param("iss", $logId, $status, $reason);
                $stmt_upd->execute();
            }
        }

        function getemailparameters(){
            $sql="CALL sp_getemailconfiguration()";
            return $this->getJSON($sql);
        }

        function saveemailparameters($emailaddress,$emailpassword,$smtpserver,$smtpport,$usessl){
            $sql="CALL `sp_saveemailconfiguration`('{$emailaddress}','{$emailpassword}','{$smtpserver}',{$smtpport},{$usessl})";
            // echo $sql;   
            $this->getData($sql);
           return ["status"=>"success"];
        }

        function queueemail($module,$emailfrom,$emailto,$emailsubject,$emailmessage,$attachment=""){
            $emailfrom=str_replace("'","''",$emailfrom);
            $emailsubject=str_replace("'","''",$emailsubject);
            $emailmessage=str_replace("'","''",$emailmessage);
            $sql="CALL `sp_saveemailschedule`('{$module}','{$emailfrom}','{$emailto}','{$emailsubject}','{$emailmessage}','{$attachment}',{$_SESSION['userid']})";
            // echo $sql;
            $this->getData($sql);
            return ["status"=>"success","message"=>"email added to queue successfully"];
        }
    }
?>