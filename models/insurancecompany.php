<?php
require_once('db.php');

class insurancecompany extends db {

    public function saveInsuranceCompany($id, $registrationno, $companyname, $contacts, $contactperson, $email, $address) {
        $registrationno = str_replace("'", "''", $registrationno);
        $companyname = str_replace("'", "''", $companyname);
        $contacts = str_replace("'", "''", $contacts);
        $contactperson = str_replace("'", "''", $contactperson);
        $email = str_replace("'", "''", $email);
        $address = str_replace("'", "''", $address);

        $sql = "CALL sp_saveinsurancecompany({$id}, '{$registrationno}', '{$companyname}', '{$contacts}', '{$contactperson}', '{$email}', '{$address}', {$this->userid}, '{$this->platform}')";
        
        $rst = $this->getData($sql);
        if ($rst) {
            $rowset = $rst->fetch();
            if ($rowset && array_key_exists("insuranceid", $rowset)) {
                return ["status" => "success", "message" => "Insurance company details saved successfully", "insuranceid" => $rowset['insuranceid']];
            }
        }
        return ["status" => "error", "message" => "Error saving insurance company details"];
    }

    public function getInsuranceCompanies() {
        $sql = "CALL sp_getinsurancecompanies()";
        return $this->getJSON($sql);
    }

    public function deleteInsuranceCompany($id) {
        $sql = "CALL sp_deleteinsurancecompany({$id}, {$this->userid}, '{$this->platform}')";
        $this->getData($sql);
        return ["status" => "success", "message" => "Insurance company record deleted successfully"];
    }
}
?>
