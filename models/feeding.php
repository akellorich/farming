<?php
require_once('db.php');

class feeding extends db {

    public function saveFeedingLog($id, $logdate, $shiftid, $penid, $sourceType, $feedId, $quantitykg, $notes, $animalIds) {
        // Convert date
        $logdate = $this->mySQLDate($logdate);
        
        // Convert animal IDs array to JSON string for the SP
        $animalsjson = json_encode($animalIds);

        // Save Master Record and Animals in one transaction via SP
        $sql = "CALL sp_savefeedinglog({$id}, '{$logdate}', {$shiftid}, {$penid}, '{$sourceType}', {$feedId}, {$quantitykg}, '{$notes}', '{$animalsjson}', {$this->userid}, '{$this->platform}')";
        
        $rst = $this->getData($sql);
        $logid = 0;
        
        if ($rst) {
            $row = $rst->fetch(PDO::FETCH_ASSOC);
            if ($row && isset($row['logid'])) {
                $logid = $row['logid'];
            }
        }

        if ($logid > 0) {
            return ["status" => "success", "message" => "Feeding record saved successfully", "logid" => $logid];
        }

        return ["status" => "error", "message" => "Failed to save feeding record"];
    }

    public function getFeedingLogs() {
        $sql = "CALL sp_getfeedinglogs()";
        return $this->getJSON($sql);
    }

    public function getFeedingLogAnimals($logid) {
        $sql = "CALL sp_getfeedingloganimals({$logid})";
        return $this->getJSON($sql);
    }

    public function getFeedingStats() {
        $sql = "SELECT 
                    (SELECT IFNULL(SUM(quantitykg), 0) FROM feedinglogs WHERE logdate = CURDATE()) as today_consumed,
                    (SELECT IFNULL(SUM(quantitykg), 0) FROM feedinglogs WHERE logdate = DATE_SUB(CURDATE(), INTERVAL 1 DAY)) as yesterday_consumed,
                    (SELECT COUNT(DISTINCT animalid) FROM feedingloganimals fla JOIN feedinglogs fl ON fla.logid = fl.id WHERE fl.logdate = CURDATE()) as animal_fed_count";
        
        $rst = $this->getData($sql);
        if ($rst) {
            $data = $rst->fetch(PDO::FETCH_ASSOC);
            $today = $data['today_consumed'];
            $yesterday = $data['yesterday_consumed'];
            $fed_count = $data['animal_fed_count'];
            
            $trend = 0;
            if ($yesterday > 0) {
                $trend = (($today - $yesterday) / $yesterday) * 100;
            }
            
            $avg = 0;
            if ($fed_count > 0) {
                $avg = $today / $fed_count;
            }
            
            return json_encode([
                "today_consumed" => number_format($today, 0),
                "yesterday_consumed" => number_format($yesterday, 0),
                "animal_fed_count" => $fed_count,
                "trend" => round($trend, 1),
                "avg_ration_per_cow" => number_format($avg, 1)
            ]);
        }
        return json_encode([]);
    }

    public function getWeeklyConsumption() {
        $sql = "SELECT 
                    DATE_FORMAT(logdate, '%a') as day_label,
                    IFNULL(SUM(quantitykg), 0) as total_kg
                FROM feedinglogs 
                WHERE logdate >= DATE_SUB(CURDATE(), INTERVAL 6 DAY)
                AND deleted = 0
                GROUP BY logdate
                ORDER BY logdate ASC";
        
        $rst = $this->getData($sql);
        $data = [];
        if ($rst) {
            $data = $rst->fetchAll(PDO::FETCH_ASSOC);
        }
        return json_encode($data);
    }
}
?>
