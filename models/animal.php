<?php 
require_once('db.php');

class animal extends db {

    public function checkAnimal($id, $checkfield, $checkvalue) {
        $checkvalue = str_replace("'", "''", $checkvalue);
        $sql = "CALL sp_checkanimaldetails({$id}, '{$checkfield}', '{$checkvalue}')";
        return $this->getData($sql)->rowCount();
    }

    public function saveAnimal($id, $tagid, $designatedname, $breedid, $penid, $damid, $birthdate, $initialweight, $registrationsource, $purchaseprice, $status, $autogen = 0) {
        if ($autogen == 0 && $this->checkAnimal($id, 'tagid', $tagid)) {
            return ["status" => "exists", "message" => "Animal Tag ID already exists"];
        }
        
        if (!empty($designatedname) && $this->checkAnimal($id, 'designatedname', $designatedname)) {
            return ["status" => "exists", "message" => "Animal Designated Name already exists"];
        }

        // Convert dates to mysql friendly format
        $birthdate = $this->mySQLDate($birthdate);

        // Prepare parameters
        $breedid = empty($breedid) ? 'NULL' : $breedid;
        $penid = empty($penid) ? 'NULL' : $penid;
        $damid = empty($damid) ? 'NULL' : $damid;
        $initialweight = empty($initialweight) ? 0.00 : $initialweight;
        $purchaseprice = empty($purchaseprice) ? 0.00 : $purchaseprice;

        $sql = "CALL sp_saveanimal({$id}, '{$tagid}', '{$designatedname}', {$breedid}, {$penid}, {$damid}, '{$birthdate}', {$initialweight}, '{$registrationsource}', {$purchaseprice}, '{$status}', {$autogen}, {$this->userid}, '{$this->platform}')";

        $rst = $this->getData($sql);
        do {
            $rowset = $rst->fetch(); 
            if ($rowset && array_key_exists("animalid", $rowset)) {
                return ["status" => "success", "message" => "Animal details saved successfully", "animalid" => $rowset['animalid']];
            }
        } while ($rst->nextRowset());
        
        return ["status" => "error", "message" => "Error saving animal details"];
    }

    public function deleteAnimal($id, $reason) {
        $sql = "CALL sp_deleteanimal({$id}, {$this->userid}, '{$reason}', '{$this->platform}')";
        $this->connect()->query($sql);
        return ["status" => "success", "message" => "Animal record deleted successfully"];
    }

    public function getAnimals() {
        $sql = "CALL sp_getanimals()";
        return $this->getJSON($sql);
    }

    public function getAnimalDetails($id) {
        $sql = "CALL sp_getanimaldetails({$id})";
        return $this->getJSON($sql);
    }
}
?>
