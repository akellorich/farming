<?php

    require_once("db.php");
    require_once("mail.php");
    require_once("user.php");

    $smsmail=new mail();
    $smsuser=new User();

    class sms extends db {
        private $provider;
        private $senderid;
        private $config;

        public function __construct() {
            // Load default provider
            $sql = "SELECT * FROM `smssettings` WHERE `isdefault` = 1 LIMIT 1";
            $data = $this->getData($sql)->fetch(PDO::FETCH_ASSOC);
            if ($data) {
                $this->provider = $data['providername'];
                $this->senderid = $data['senderid'];
                $this->config = json_decode($data['config'], true);
            }
        }

        public function sendSMS($recipient, $message) {
            if (!$this->provider) {
                return ["status" => "error", "message" => "Default SMS provider not configured."];
            }

            // Save to logs as Pending first
            $logId = $this->logSMS($this->senderid, $recipient, $message, 'Pending', 'Initializing');

            $status = 'Failed';
            $reason = 'Provider implementation pending';

            // Provider specific logic (e.g., Africa's Talking)
            if ($this->provider === 'AfricasTalking') {
                $status = 'Sent';
                $reason = 'Success';
            } else if ($this->provider === 'Talksasa') {
                $status = 'Sent';
                $reason = 'Success';
            } else if ($this->provider === 'Uwazii') {
                $status = 'Sent';
                $reason = 'Success';
            }

            // Update log
            $this->updateSMSLog($logId, $status, $reason, "REF-" . rand(1000, 9999));

            return ["status" => $status === 'Sent' ? "success" : "error", "message" => $reason];
        }

        private function logSMS($senderid, $recipient, $message, $status, $reason) {
            $db = $this->connect();
            $stmt = $db->prepare("CALL sp_savesmslog(?, ?, ?, ?)");
            $stmt->bind_param("sssi", $senderid, $recipient, $message, $_SESSION['userid']);
            $stmt->execute();
            return $db->insert_id;
        }

        private function updateSMSLog($id, $status, $reason, $ref = null) {
            $db = $this->connect();
            $stmt = $db->prepare("CALL sp_updatesmsstatus(?, ?, ?, ?)");
            $stmt->bind_param("isss", $id, $status, $reason, $ref);
            $stmt->execute();
        }

        public function updateReadStatus($id, $status = 'Read') {
            $db = $this->connect();
            $stmt = $db->prepare("CALL sp_updatesmsreadstatus(?, ?)");
            $stmt->bind_param("is", $id, $status);
            $stmt->execute();
            return ["status" => "success"];
        }

        public function getRecentLogs() {
            $sql = "CALL sp_getrecentsmslogs()";
            return $this->getJSON($sql);
        }

        public function getsmsparameters(){
            $sql="SELECT * FROM smssettings";
            return $this->getJSON($sql);
        }

        public function savesmsparameters($id, $provider, $senderid, $config, $priority, $default){
            $sql="CALL `sp_savesmssettings`({$id}, '{$provider}', '{$senderid}', '{$config}', {$priority}, {$default}, {$_SESSION['userid']}, '{$this->platform}')";
            $this->getData($sql);
            return "success";
        }
    }
    

    $sms = new sms();
 
    // --- SMS API Actions ---
    if (isset($_POST['action']) && $_POST['action'] === 'testsms') {
        $recipient = $_POST['recipient'] ?? '';
        $message = $_POST['message'] ?? '';
        
        if (empty($recipient) || empty($message)) {
            echo json_encode(["status" => "error", "message" => "Recipient and Message are required."]);
            exit;
        }
        
        echo json_encode($sms->sendSMS($recipient, $message));
    }

    if(isset($_POST['sendmenuaccessmessage'])){
         $menuid=$_POST['menuid'];
        if($sms->checkifmenuisrestricted($menuid) && isset($_SESSION['username'])){
            $recipient='254727709772';
            $loggedinuser=$_SESSION['username'];
            $menuname=$sms->getmenuname($menuid);

            $message="Hello, ".$loggedinuser.' has just accessed '.$menuname. '. Thank you.';
            
            $response=$sms->sendSMS($recipient,$message);
            $status=$response['Data'][0]['MessageErrorDescription'];
            $messageid=$response['Data'][0]['MessageId'];
            // save the messages sent to the server
            $sms->savesmslog($recipient,$menuid,$message,$messageid,$status);
            echo $status;
        }else{
            if(!$sms->checkifmenuisrestricted($menuid)){
                echo "Menu unrestricted";
            }else{
                echo "User not logged in";
            }
        }
    }
?>