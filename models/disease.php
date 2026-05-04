<?php 
require_once('db.php');

class disease extends db {

    public function checkDisease($id, $diseasename) {
        $sql = "CALL sp_checkifdiseaseexists({$id}, '{$diseasename}')";
        $rst = $this->connect()->query($sql);
        return $rst->rowCount() ? true : false;
    }

    public function saveDisease($id, $diseasename, $commonsymptoms) {
        if ($this->checkDisease($id, $diseasename)) {
            return ["status" => "exists", "message" => "disease name exists"];
        } else {
            $sql = "CALL sp_savedisease({$id}, '{$diseasename}', '{$commonsymptoms}', {$_SESSION['userid']}, '{$this->platform}')";
            $rst = $this->connect()->query($sql);
            return ["status" => "success", "message" => "disease saved successfully"];
        }
    }

    public function deleteDisease($id, $reason) {
        $sql = "CALL sp_deletedisease({$id}, {$_SESSION['userid']}, '{$reason}', '{$this->platform}')";
        $this->connect()->query($sql);
        return ["status" => "success", "message" => "disease deleted successfully"];
    }

    public function getDiseases() {
        $sql = "CALL sp_getdiseases()";
        return $this->getJSON($sql);
    }

    public function getDiseaseDetails($id) {
        $sql = "CALL sp_getdiseasedetails({$id})";
        return $this->getJSON($sql);
    }
}

?>
