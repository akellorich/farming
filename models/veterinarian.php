<?php
/**
 * Jukam Dairy - Veterinarian Model
 * File: models/veterinarian.php
 */
require_once('db.php');

class veterinarian extends db {

    public function getVeterinarians() {
        $sql = "CALL sp_getveterinarians()";
        return $this->getJSON($sql);
    }

    public function saveVeterinarian($id, $regno, $vetname, $phone, $email, $specialization, $status, $autogenerate = 0) {
        $id = (int)$id;
        $regno = $this->sanitize($regno);
        $vetname = $this->sanitize($vetname);
        $phone = $this->sanitize($phone);
        $email = $this->sanitize($email);
        $specialization = $this->sanitize($specialization);
        $status = $this->sanitize($status);
        $autogenerate = (int)$autogenerate;
        $userid = (int)$_SESSION['userid'];
        $platform = $this->platform;

        $sql = "CALL sp_saveveterinarian($id, '$regno', '$vetname', '$phone', '$email', '$specialization', '$status', $autogenerate, $userid, '$platform')";
        $rst = $this->connect()->query($sql);
        if ($rst && $row = $rst->fetch_assoc()) {
            return ["status" => "success", "message" => "Veterinarian details saved successfully", "vetid" => $row['vetid'], "regno" => $row['regno']];
        } else {
            return ["status" => "error", "message" => "Failed to save veterinarian details"];
        }
    }

    public function deleteVeterinarian($id, $reason) {
        $id = (int)$id;
        $reason = $this->sanitize($reason);
        $userid = (int)$_SESSION['userid'];

        $sql = "CALL sp_deleteveterinarian($id, $userid, '$reason')";
        $rst = $this->connect()->query($sql);
        if ($rst) {
            return ["status" => "success", "message" => "Veterinarian deleted successfully"];
        } else {
            return ["status" => "error", "message" => "Failed to delete veterinarian"];
        }
    }

    private function sanitize($str) {
        return $str == '' ? '' : str_replace("'", "''", trim($str));
    }
}
?>
