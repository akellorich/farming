<?php 
require_once('db.php');

class health extends db {

    public function saveHealthLog($id, $logdate, $animalid, $diseaseid, $diagnosis, $treatment, $narration, $status, $veterinarianid, $nextfollowup) {
        $sql = "CALL sp_savehealthlog({$id}, '{$logdate}', {$animalid}, {$diseaseid}, '{$diagnosis}', '{$treatment}', '{$narration}', '{$status}', {$veterinarianid}, " . ($nextfollowup ? "'{$nextfollowup}'" : "NULL") . ", {$_SESSION['userid']}, '{$this->platform}')";
        $rst = $this->connect()->query($sql);
        return ["status" => "success", "message" => "Health record saved successfully"];
    }

    public function deleteHealthLog($id, $reason) {
        $sql = "CALL sp_deletehealthlog({$id}, {$_SESSION['userid']}, '{$reason}', '{$this->platform}')";
        $this->connect()->query($sql);
        return ["status" => "success", "message" => "Health record deleted successfully"];
    }

    public function getHealthLogs() {
        $sql = "CALL sp_gethealthlogs()";
        return $this->getJSON($sql);
    }
}

?>
