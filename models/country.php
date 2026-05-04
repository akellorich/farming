<?php 
require_once('db.php');

class country extends db {

    public function checkCountry($id, $countryname) {
        $sql = "CALL sp_checkifcountryexists({$id}, '{$countryname}')";
        $rst = $this->connect()->query($sql);
        return $rst->rowCount() ? true : false;
    }

    public function saveCountry($id, $countryname) {
        if ($this->checkCountry($id, $countryname)) {
            return ["status" => "exists", "message" => "country name exists"];
        } else {
            $sql = "CALL sp_savecountry({$id}, '{$countryname}', {$_SESSION['userid']}, '{$this->platform}')";
            $rst = $this->connect()->query($sql);
            return ["status" => "success", "message" => "country saved successfully"];
        }
    }

    public function deleteCountry($id, $reason) {
        $sql = "CALL sp_deletecountry({$id}, {$_SESSION['userid']}, '{$reason}', '{$this->platform}')";
        $this->connect()->query($sql);
        return ["status" => "success", "message" => "country deleted successfully"];
    }

    public function getCountries() {
        $sql = "CALL sp_getcountries()";
        return $this->getJSON($sql);
    }

    public function getCountryDetails($id) {
        $sql = "CALL sp_getcountrydetails({$id})";
        return $this->getJSON($sql);
    }
}

?>
