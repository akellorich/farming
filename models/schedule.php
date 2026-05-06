<?php
require_once('db.php');

class schedule extends db {

    public function saveVaccinationSchedule($id, $diseaseid, $penids, $scheduledate, $scheduletime, $repeat_annually, $notes) {
        try {
            $penids_json = json_encode($penids);
            $notes = str_replace("'", "''", $notes);
            $scheduledate = $this->mySQLDate($scheduledate);
            
            $sql = "CALL sp_savevaccinationschedule({$id}, {$diseaseid}, '{$penids_json}', '{$scheduledate}', '{$scheduletime}', {$repeat_annually}, '{$notes}', {$this->userid})";
            $this->connect()->query($sql);
            return ["status" => "success", "message" => "Vaccination schedule saved successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }

    public function saveDewormingSchedule($id, $schedulename, $penids, $scheduledate, $scheduletime, $repeat_annually, $notes) {
        try {
            $penids_json = json_encode($penids);
            $schedulename = str_replace("'", "''", $schedulename);
            $notes = str_replace("'", "''", $notes);
            $scheduledate = $this->mySQLDate($scheduledate);
            
            $sql = "CALL sp_savedewormingschedule({$id}, '{$schedulename}', '{$penids_json}', '{$scheduledate}', '{$scheduletime}', {$repeat_annually}, '{$notes}', {$this->userid})";
            $this->connect()->query($sql);
            return ["status" => "success", "message" => "Deworming schedule saved successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }

    public function getVaccinationSchedules() {
        $sql = "CALL sp_getvaccinationschedules()";
        return $this->getJSON($sql);
    }

    public function getDewormingSchedules() {
        $sql = "CALL sp_getdewormingschedules()";
        return $this->getJSON($sql);
    }

    public function getVaccinationScheduleDetails($id) {
        $sql = "SELECT * FROM vaccinationschedules WHERE id = {$id}";
        $rst = $this->connect()->query($sql);
        return json_encode($rst->fetch_assoc());
    }

    public function getDewormingScheduleDetails($id) {
        $sql = "SELECT * FROM dewormingschedules WHERE id = {$id}";
        $rst = $this->connect()->query($sql);
        return json_encode($rst->fetch_assoc());
    }

    public function getScheduleStats() {
        $sql = "CALL sp_getschedulestats()";
        $rst = $this->getData($sql);
        return json_encode($rst->fetch(PDO::FETCH_ASSOC));
    }

    public function deleteSchedule($id, $type, $reason = 'Deleted by user') {
        try {
            $reason = str_replace("'", "''", $reason);
            $table = ($type == 'vaccination') ? 'vaccinationschedules' : 'dewormingschedules';
            $sql = "UPDATE `{$table}` SET `deleted` = 1, `deletedby` = {$this->userid}, `datedeleted` = NOW(), `reasondeleted` = '{$reason}' WHERE `id` = {$id}";
            $this->connect()->query($sql);
            return ["status" => "success", "message" => "Schedule deleted successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }
}
?>
