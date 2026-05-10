<?php
require_once('db.php');

class dashboard extends db {
    public function getDashboardStats() {
        // Total Animals
        $sql1 = "SELECT COUNT(*) as total FROM animals WHERE deleted = 0";
        $res1 = $this->getData($sql1)->fetch(PDO::FETCH_ASSOC);
        $total_animals = $res1['total'] ?? 0;

        // Daily Yield (Today's sum)
        $today = date('Y-m-d');
        $sql2 = "SELECT SUM(quantitylitres) as total FROM milkcollection WHERE logdate = '{$today}' AND deleted = 0";
        $res2 = $this->getData($sql2)->fetch(PDO::FETCH_ASSOC);
        $daily_yield = $res2['total'] ?? 0;

        // Stock Alerts (Items below reorder level)
        $sql3 = "SELECT COUNT(*) as total FROM inventoryitems WHERE currentstock <= reorderlevel AND deleted = 0";
        $res3 = $this->getData($sql3)->fetch(PDO::FETCH_ASSOC);
        $stock_alerts = $res3['total'] ?? 0;

        // Health Incidents (Today's count)
        $sql4 = "SELECT COUNT(*) as total FROM healthlogs WHERE logdate = '{$today}' AND deleted = 0";
        $res4 = $this->getData($sql4)->fetch(PDO::FETCH_ASSOC);
        $health_incidents = $res4['total'] ?? 0;

        // Production Trends (Last 7 days)
        $sql5 = "CALL sp_getproductiontrends('{$today}')";
        $res5 = $this->getData($sql5)->fetchAll(PDO::FETCH_ASSOC);
        
        $labels = [];
        $yields = [];
        $densities = [];
        
        foreach ($res5 as $row) {
            $labels[] = date('D', strtotime($row['date'])); // Day name (Mon, Tue, etc)
            $yields[] = (float)$row['totalyield'];
            $densities[] = round((float)$row['avgdensity'], 2);
        }

        // Recent Activity (Last 5 from Audit Trail)
        $sql6 = "SELECT a.*, CONCAT(u.firstname, ' ', u.lastname) as fullname, u.profilephoto 
                 FROM audittrail a 
                 LEFT JOIN user u ON a.userid = u.userid 
                 ORDER BY a.timestamp DESC LIMIT 5";
        $res6 = $this->getData($sql6)->fetchAll(PDO::FETCH_ASSOC);
        
        $activities = [];
        foreach ($res6 as $row) {
            $activities[] = [
                "title" => $row['operation'],
                "narration" => $row['narration'],
                "timestamp" => $row['timestamp'],
                "user" => $row['fullname'],
                "photo" => $row['profilephoto']
            ];
        }

        // Health Surveillance
        // 1. Vaccination Rate: Animals with at least one vaccination record / Total animals
        $sql7 = "SELECT COUNT(DISTINCT animalid) as vaccinated FROM vaccinations WHERE deleted = 0";
        $vaccinated_count = $this->getData($sql7)->fetch(PDO::FETCH_ASSOC)['vaccinated'];
        $vaccination_rate = ($total_animals > 0) ? round(($vaccinated_count / $total_animals) * 100, 1) : 0;

        // 2. Active Quarantines: From healthlogs where status is 'Quarantined'
        $sql8 = "SELECT COUNT(*) as active_quarantines FROM healthlogs WHERE status = 'Quarantined' AND deleted = 0";
        $active_quarantines = $this->getData($sql8)->fetch(PDO::FETCH_ASSOC)['active_quarantines'];

        // Low Stock Inventory
        $sql9 = "SELECT ii.itemname, ii.currentstock, ii.uom, ii.reorderlevel, ic.categoryname, ic.categoryicon
                 FROM inventoryitems ii
                 JOIN inventorycategories ic ON ii.categoryid = ic.id
                 WHERE ii.currentstock <= ii.reorderlevel AND ii.deleted = 0
                 ORDER BY (ii.currentstock / NULLIF(ii.reorderlevel, 0)) ASC
                 LIMIT 5";
        $res9 = $this->getData($sql9)->fetchAll(PDO::FETCH_ASSOC);
        
        $low_stock = [];
        foreach ($res9 as $row) {
            $low_stock[] = [
                "name" => $row['itemname'],
                "category" => $row['categoryname'],
                "icon" => $row['categoryicon'],
                "stock" => $row['currentstock'],
                "uom" => $row['uom'],
                "status" => ($row['currentstock'] <= ($row['reorderlevel'] * 0.5)) ? "CRITICAL LEVEL" : "REORDER SOON"
            ];
        }

        return json_encode([
            "total_animals" => $total_animals,
            "animal_trend" => "+0%",
            "herd_health" => 85,
            "daily_yield" => number_format($daily_yield, 0),
            "yield_goal_perc" => 90,
            "stock_alerts" => str_pad($stock_alerts, 2, '0', STR_PAD_LEFT),
            "health_incidents" => str_pad($health_incidents, 2, '0', STR_PAD_LEFT),
            "vaccination_rate" => $vaccination_rate,
            "active_quarantines" => str_pad($active_quarantines, 2, '0', STR_PAD_LEFT),
            "trends" => [
                "labels" => $labels,
                "yields" => $yields,
                "densities" => $densities
            ],
            "activities" => $activities,
            "low_stock" => $low_stock
        ]);
    }
}
?>
