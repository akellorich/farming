<?php
require_once('db.php');

class treatment extends db {

    public function recordBulkVaccination($scheduleid, $diseaseid, $animalids, $date, $product, $batch, $dosage, $vet, $notes) {
        try {
            // Handle both array and pre-stringified JSON
            $animalids_json = is_array($animalids) ? json_encode($animalids) : $animalids;
            
            $product = str_replace("'", "''", $product);
            $batch = str_replace("'", "''", $batch);
            $vet = str_replace("'", "''", $vet);
            $notes = str_replace("'", "''", $notes);
            $date = $this->mySQLDate($date);
            
            $sql = "CALL sp_recordbulkvaccination({$scheduleid}, {$diseaseid}, '{$animalids_json}', '{$date}', '{$product}', '{$batch}', '{$dosage}', '{$vet}', '{$notes}', {$this->userid})";
            $this->connect()->query($sql);
            return ["status" => "success", "message" => "Vaccination records logged successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }

    public function recordBulkDeworming($scheduleid, $animalids, $date, $product, $dosage, $method, $vet, $notes) {
        try {
            // Handle both array and pre-stringified JSON
            $animalids_json = is_array($animalids) ? json_encode($animalids) : $animalids;
            
            $product = str_replace("'", "''", $product);
            $vet = str_replace("'", "''", $vet);
            $notes = str_replace("'", "''", $notes);
            $date = $this->mySQLDate($date);
            
            $sql = "CALL sp_recordbulkdeworming({$scheduleid}, '{$animalids_json}', '{$date}', '{$product}', '{$dosage}', '{$method}', '{$vet}', '{$notes}', {$this->userid})";
            $this->connect()->query($sql);
            return ["status" => "success", "message" => "Deworming records logged successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }

    public function getAnimalsBySchedule($scheduleid, $type) {
        $sql = "CALL sp_getanimalsbyschedule({$scheduleid}, '{$type}')";
        return $this->getJSON($sql);
    }

    public function getActiveSchedules($type) {
        $sql = "CALL sp_getactivehealthschedules('{$type}')";
        return $this->getJSON($sql);
    }

    public function getVaccinationHistory() {
        $sql = "CALL sp_getvaccinationhistory()";
        return $this->getJSON($sql);
    }

    public function getDewormingHistory() {
        $sql = "CALL sp_getdeworminghistory()";
        return $this->getJSON($sql);
    }

    public function getDewormingSummary() {
        $sql = "CALL sp_getdewormingsummary()";
        return $this->getJSON($sql);
    }

    public function getUpcomingDeworming() {
        $sql = "CALL sp_getupcomingdeworming()";
        return $this->getJSON($sql);
    }

    public function getVaccinationSummary() {
        $sql = "CALL sp_getvaccinationsummary()";
        return $this->getJSON($sql);
    }

    public function getUpcomingVaccinations() {
        $sql = "CALL sp_getupcomingvaccinations()";
        return $this->getJSON($sql);
    }

    public function getDistinctVaccines() {
        $sql = "CALL sp_getdistinctvaccines()";
        return $this->getJSON($sql);
    }

    public function getDistinctDewormers() {
        $sql = "CALL sp_getdistinctdewormers()";
        return $this->getJSON($sql);
    }
}
?>
