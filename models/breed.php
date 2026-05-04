<?php 
require_once('db.php');

class breed extends db {

    public function checkBreed($id, $breedname) {
        $breedname = str_replace("'", "''", $breedname);
        $sql = "CALL sp_checkifbreedexists({$id}, '{$breedname}')";
        $rst = $this->connect()->query($sql);
        return $rst->fetch() ? true : false;
    }

    public function saveBreed($id, $breedname, $originid, $characteristics, $isindigenous, $avgmilking, $icon) {
        $breedname = str_replace("'", "''", $breedname);
        $characteristics = str_replace("'", "''", $characteristics);
        $platform = str_replace("'", "''", $this->platform);
        $originid = empty($originid) ? 'NULL' : $originid;
        $avgmilking = empty($avgmilking) ? 0.00 : $avgmilking;
        $icon = empty($icon) ? 'stars' : $icon;
        
        if ($this->checkBreed($id, $breedname)) {
            return ["status" => "exists", "message" => "breed name exists"];
        } else {
            try {
                $sql = "CALL sp_savebreed({$id}, '{$breedname}', {$originid}, '{$characteristics}', {$isindigenous}, {$avgmilking}, '{$icon}', {$this->userid}, '{$platform}')";
                $this->connect()->query($sql);
                return ["status" => "success", "message" => "breed saved successfully"];
            } catch (Exception $e) {
                return ["status" => "error", "message" => $e->getMessage()];
            }
        }
    }

    public function deleteBreed($id, $reason) {
        $sql = "CALL sp_deletebreed({$id}, {$_SESSION['userid']}, '{$reason}', '{$this->platform}')";
        $this->connect()->query($sql);
        return ["status" => "success", "message" => "breed deleted successfully"];
    }

    public function getBreeds() {
        $sql = "CALL sp_getbreeds()";
        return $this->getJSON($sql);
    }

    public function getBreedDetails($id) {
        $sql = "CALL sp_getbreeddetails({$id})";
        return $this->getJSON($sql);
    }
}

?>
