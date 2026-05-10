<?php 
require_once('db.php');

class settings extends db {

    public function getCompanyDetails() {
        $sql = "CALL sp_getcompanydetails()";
        return $this->getJSON($sql);
    }

    public function getEmailSettings($role) {
        $sql = "CALL sp_getemailsettings('{$role}')";
        return $this->getJSON($sql);
    }

    public function getSMSSettings($id) {
        $sql = "CALL sp_getsmssettings({$id})";
        return $this->getJSON($sql);
    }

    public function getSMSProviders() {
        $sql = "CALL sp_getsmsproviders()";
        return $this->getJSON($sql);
    }

    public function saveCompanyDetails($companyname, $taxregno, $incorporationdate, $emailaddress, $physicaladdress, $postaladdress, $mobileno, $logopath) {
        $sql = "CALL sp_savecompanydetails(
            '{$companyname}', 
            '{$taxregno}', 
            '{$incorporationdate}', 
            '{$emailaddress}', 
            '{$physicaladdress}', 
            '{$postaladdress}', 
            '{$mobileno}', 
            " . ($logopath ? "'{$logopath}'" : "NULL") . ", 
            {$_SESSION['userid']}, 
            '{$this->platform}'
        )";
        $this->connect()->query($sql);
        return ["status" => "success", "message" => "company details updated successfully"];
    }

    public function saveEmailSettings($id = 0, $role = 'General', $sendername = '', $smtpserver = '', $smtpport = 587, $useremail = '', $smtppassword = '', $smtpusessl = 1, $sendmode = 'Queue') {
        $sql = "CALL sp_saveemailsettings(
            {$id}, 
            '{$role}', 
            '{$sendername}', 
            '{$smtpserver}', 
            {$smtpport}, 
            '{$useremail}', 
            '{$smtppassword}', 
            {$smtpusessl}, 
            '{$sendmode}', 
            {$_SESSION['userid']}, 
            '{$this->platform}'
        )";
        $this->connect()->query($sql);
        return ["status" => "success", "message" => "email settings updated successfully"];
    }

    public function saveSMSSettings($id = 0, $providername = '', $senderid = '', $config = '{}', $priorityroute = 1, $isdefault = 0) {
        $sql = "CALL sp_savesmssettings(
            {$id}, 
            '{$providername}', 
            '{$senderid}', 
            '{$config}', 
            {$priorityroute}, 
            {$isdefault}, 
            {$_SESSION['userid']}, 
            '{$this->platform}'
        )";
        $this->connect()->query($sql);
        return ["status" => "success", "message" => "sms settings updated successfully"];
    }

    public function getRecentEmailLogs() {
        $sql = "CALL sp_getrecentemaillogs()";
        return $this->getJSON($sql);
    }

    public function getRecentSMSLogs() {
        $sql = "CALL sp_getrecentsmslogs()";
        return $this->getJSON($sql);
    }

    public function getMilkingSchedules() {
        $sql = "SELECT id, schedulename, starttime FROM milkingschedules WHERE deleted = 0";
        return $this->getJSON($sql);
    }

    public function getFeedingShifts() {
        $sql = "SELECT id, shiftname as schedulename, starttime FROM feedingshifts WHERE deleted = 0 ORDER BY starttime ASC";
        return $this->getJSON($sql);
    }
}

?>
