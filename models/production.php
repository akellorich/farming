<?php
require_once('db.php');

class production extends db {
    public function saveMilkCollection($id, $logdate, $scheduleid, $animalid, $quantity, $density, $narration) {
        $sql = "CALL sp_savemilkcollection(
            {$id},
            '{$logdate}',
            {$scheduleid},
            {$animalid},
            {$quantity},
            {$density},
            " . ($narration ? "'{$narration}'" : "NULL") . ",
            {$this->userid},
            '{$this->platform}'
        )";
        $rst = $this->getData($sql);
        $row = $rst->fetch(PDO::FETCH_ASSOC);
        if ($row && isset($row['collectionid'])) {
            return json_encode(["status" => "success", "message" => "Production record saved successfully", "collectionid" => $row['collectionid']]);
        }
        return json_encode(["status" => "error", "message" => "Error saving production record"]);
    }

    public function getMilkCollection($startdate, $enddate, $scheduleid = 0) {
        $sql = "CALL sp_getmilkcollection('{$startdate}', '{$enddate}', {$scheduleid})";
        return $this->getJSON($sql);
    }

    public function getProductionStats($logdate) {
        $sql = "CALL sp_getproductionstats('{$logdate}')";
        return $this->getJSON($sql);
    }

    public function getProductionTrends($enddate) {
        $sql = "CALL sp_getproductiontrends('{$enddate}')";
        return $this->getJSON($sql);
    }

    public function getShifts() {
        $sql = "CALL sp_getmilkingschedules()";
        return $this->getJSON($sql);
    }
}
?>
