<?php 
require_once('db.php');

class pen extends db {

    public function checkPen($id, $penname) {
        $penname = str_replace("'", "''", $penname);
        $sql = "CALL sp_checkifpenexists({$id}, '{$penname}')";
        $rst = $this->connect()->query($sql);
        return $rst->fetch() ? true : false;
    }

    public function savePen($id, $penname, $pentype, $capacity, $locationcluster) {
        $penname = str_replace("'", "''", $penname);
        $pentype = str_replace("'", "''", $pentype);
        $locationcluster = str_replace("'", "''", $locationcluster);
        $platform = str_replace("'", "''", $this->platform);
        $capacity = empty($capacity) ? 0 : $capacity;
        
        if ($this->checkPen($id, $penname)) {
            return ["status" => "exists", "message" => "Pen name already exists"];
        } else {
            try {
                $sql = "CALL sp_savepen({$id}, '{$penname}', '{$pentype}', {$capacity}, '{$locationcluster}', {$this->userid}, '{$platform}')";
                $this->connect()->query($sql);
                return ["status" => "success", "message" => "Pen saved successfully"];
            } catch (Exception $e) {
                return ["status" => "error", "message" => $e->getMessage()];
            }
        }
    }

    public function getPens() {
        $sql = "CALL sp_getpens()";
        return $this->getJSON($sql);
    }
}
