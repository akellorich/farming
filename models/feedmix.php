<?php
require_once "db.php";

class feedmix extends db {
    public function saveFeedMix($id, $feedcode, $feedname, $mixdate, $totalweight, $generatecode = 0) {
        $sql = "CALL sp_savefeedmix({$id}, '{$feedcode}', '{$feedname}', '{$mixdate}', {$totalweight}, {$this->userid}, '{$this->platform}', {$generatecode})";
        return $this->getData($sql);
    }
    
    public function saveFeedMixDetail($feedmixid, $inventoryitemid, $quantity) {
        $sql = "CALL sp_savefeedmixdetail({$feedmixid}, {$inventoryitemid}, {$quantity})";
        return $this->getData($sql);
    }
    
    public function getFeedMixes($id = 0) {
        $sql = "CALL sp_getfeedmixes({$id})";
        return $this->getJSON($sql);
    }
    
    public function getFeedMixDetails($feedmixid) {
        $sql = "CALL sp_getfeedmixdetails({$feedmixid})";
        return $this->getJSON($sql);
    }
    
    public function deleteFeedMix($id) {
        $sql = "CALL sp_deletefeedmix({$id}, {$this->userid}, '{$this->platform}')";
        $rst = $this->getData($sql);
        $row = $rst->fetch(PDO::FETCH_ASSOC);
        if ($row && isset($row['success'])) {
            return json_encode(["status" => "success", "message" => "Feed mix deleted successfully"]);
        }
        return json_encode(["status" => "error", "message" => "Error deleting feed mix"]);
    }
}
?>
