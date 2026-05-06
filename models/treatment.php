<?php
require_once('db.php');

class treatment extends db {

    public function recordBulkVaccination($scheduleid, $animalids, $date, $product, $batch, $dosage, $vet, $notes) {
        try {
            // Handle both array and pre-stringified JSON
            $animalids_json = is_array($animalids) ? json_encode($animalids) : $animalids;
            
            $product = str_replace("'", "''", $product);
            $batch = str_replace("'", "''", $batch);
            $vet = str_replace("'", "''", $vet);
            $notes = str_replace("'", "''", $notes);
            $date = $this->mySQLDate($date);
            
            $sql = "CALL sp_record_bulk_vaccination({$scheduleid}, '{$animalids_json}', '{$date}', '{$product}', '{$batch}', '{$dosage}', '{$vet}', '{$notes}', {$this->userid})";
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
            
            $sql = "CALL sp_record_bulk_deworming({$scheduleid}, '{$animalids_json}', '{$date}', '{$product}', '{$dosage}', '{$method}', '{$vet}', '{$notes}', {$this->userid})";
            $this->connect()->query($sql);
            return ["status" => "success", "message" => "Deworming records logged successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }

    public function getAnimalsBySchedule($scheduleid, $type) {
        $sql = "CALL sp_get_animals_by_schedule({$scheduleid}, '{$type}')";
        return $this->getJSON($sql);
    }

    public function getActiveSchedules($type) {
        $sql = "CALL sp_get_active_health_schedules('{$type}')";
        return $this->getJSON($sql);
    }
}
?>
