<?php
/**
 * Jukam Poultry Management System - Poultry Flock Model
 * File: models/poultryflock.php
 */

require_once('db.php');

class PoultryFlock extends db {
    
    public function __construct() {
        parent::__construct();
    }

    public function saveFlock($data) {
        try {
            $id = (int)($data['id'] ?? 0);
            $flockno = str_replace("'", "''", $data['flock_id'] ?? '');
            $flockname = str_replace("'", "''", $data['flock_name'] ?? '');
            $birdtypeid = (int)($data['bird_type'] ?? 0);
            $stageid = (int)($data['flock_stage'] ?? 0);
            $breedid = (int)($data['breed'] ?? 0);
            $source = str_replace("'", "''", $data['source'] ?? 'supplier');
            $arrivaldate = $this->mySQLDate($data['arrival_date'] ?? '');
            $initialcount = (int)($data['initial_count'] ?? 0);
            $houseid = (int)($data['house_id'] ?? 0);
            $notes = str_replace("'", "''", $data['notes'] ?? '');
            $generateVax = isset($data['generate_vax_schedule']) ? 1 : 0;

            $sql = "CALL sp_savepoultryflock(
                {$id}, 
                '{$flockno}', 
                '{$flockname}', 
                {$birdtypeid}, 
                {$stageid}, 
                {$breedid}, 
                '{$source}', 
                '{$arrivaldate}', 
                {$initialcount}, 
                {$houseid}, 
                '{$notes}', 
                {$this->userid}, 
                '{$this->platform}',
                {$generateVax}
            )";

            $rst = $this->getData($sql);
            if ($rst) {
                $res = $rst->fetch(PDO::FETCH_ASSOC);
                return [
                    'status' => 'success', 
                    'message' => 'Flock registered successfully. ID: ' . $res['flockno'],
                    'flockid' => $res['flockid'],
                    'flockno' => $res['flockno']
                ];
            }
            return ['status' => 'error', 'message' => 'Failed to save flock record.'];
        } catch (Exception $e) {
            $msg = $e->getMessage();
            // Handle specific database signals
            if (strpos($msg, 'Duplicate Flock ID') !== false) {
                // Extract the specific message text if possible, or just return as is
                return ['status' => 'error', 'message' => 'Duplicate Flock ID: The provided Flock ID is already in use.'];
            }
            return ['status' => 'error', 'message' => 'System error: ' . $msg];
        }
    }

    public function getFlocks() {
        $sql = "SELECT f.*, bt.typename as birdtype, fs.stagename, fs.feedquantity, b.breedname, h.housename 
                FROM poultryflocks f
                LEFT JOIN poultrybirdtypes bt ON f.birdtypeid = bt.typeid
                LEFT JOIN poultryflockstages fs ON f.stageid = fs.stageid
                LEFT JOIN poultrybreeds b ON f.breedid = b.breedid
                LEFT JOIN poultryhouses h ON f.houseid = h.houseid
                WHERE f.deleted = 0
                ORDER BY f.createdat DESC";
        return $this->getJSON($sql);
    }

    public function saveFeeding($data) {
        try {
            $flockno = str_replace("'", "''", $data['flock_id'] ?? '');
            $feedingdate = $this->mySQLDate($data['feeding_date'] ?? '');
            $category = str_replace("'", "''", $data['category'] ?? 'ready');
            $itemid = (int)($data['item_id'] ?? 0);
            $qty = (float)($data['quantity'] ?? 0);
            $costperkg = (float)($data['cost_per_kg'] ?? 0);

            $sql = "CALL sp_savepoultryfeeding(
                '{$flockno}', 
                '{$feedingdate}', 
                '{$category}', 
                {$itemid}, 
                {$qty}, 
                {$costperkg}, 
                {$this->userid}, 
                '{$this->platform}'
            )";

            $rst = $this->getData($sql);
            if ($rst) {
                return ['status' => 'success', 'message' => 'Feeding log saved successfully.'];
            }
            return ['status' => 'error', 'message' => 'Failed to record feeding.'];
        } catch (Exception $e) {
            return ['status' => 'error', 'message' => 'System error: ' . $e->getMessage()];
        }
    }

    public function getFeedingDashboardStats() {
        try {
            $today = date('Y-m-d');
            $yesterday = date('Y-m-d', strtotime('-1 day'));

            // 1. Consumption & Cost Stats
            $sqlCons = "SELECT 
                            SUM(CASE WHEN feedingdate = '{$today}' THEN quantity ELSE 0 END) as today_qty,
                            SUM(CASE WHEN feedingdate = '{$yesterday}' THEN quantity ELSE 0 END) as yesterday_qty,
                            SUM(CASE WHEN feedingdate = '{$today}' THEN totalcost ELSE 0 END) as today_cost,
                            SUM(CASE WHEN feedingdate = '{$yesterday}' THEN totalcost ELSE 0 END) as yesterday_cost
                        FROM poultry_feeding_logs 
                        WHERE deleted = 0";
            $cons = $this->getData($sqlCons)->fetch(PDO::FETCH_ASSOC);

            // 2. Population Stats
            $sqlBirds = "SELECT SUM(currentcount) as total_birds FROM poultryflocks WHERE status = 'Active' AND deleted = 0";
            $birds = $this->getData($sqlBirds)->fetch(PDO::FETCH_ASSOC);
            $total_birds = (float)($birds['total_birds'] ?? 0);

            // 3. Inventory Stats
            $sqlStock = "SELECT SUM(currentstock) as total_stock, SUM(maxstock) as total_capacity 
                        FROM inventoryitems 
                        WHERE is_feed = 1 AND deleted = 0";
            $stock = $this->getData($sqlStock)->fetch(PDO::FETCH_ASSOC);

            return [
                'status' => 'success',
                'data' => [
                    'today_consumption' => (float)($cons['today_qty'] ?? 0),
                    'yesterday_consumption' => (float)($cons['yesterday_qty'] ?? 0),
                    'today_cost' => (float)($cons['today_cost'] ?? 0),
                    'yesterday_cost' => (float)($cons['yesterday_cost'] ?? 0),
                    'total_birds' => $total_birds,
                    'total_stock' => (float)($stock['total_stock'] ?? 0),
                    'total_capacity' => (float)($stock['total_capacity'] ?? 0)
                ]
            ];
        } catch (Exception $e) {
            return ['status' => 'error', 'message' => $e->getMessage()];
        }
    }

    public function saveMortality($data) {
        try {
            $flockno = str_replace("'", "''", $data['flock_id'] ?? '');
            $mortalitydate = $this->mySQLDate($data['mortality_date'] ?? '');
            $count = (int)($data['mortality_count'] ?? 0);
            $reason = str_replace("'", "''", $data['reason'] ?? '');
            $notes = str_replace("'", "''", $data['notes'] ?? '');

            $sql = "CALL sp_savepoultrymortality(
                '{$flockno}', 
                '{$mortalitydate}', 
                {$count}, 
                '{$reason}', 
                '{$notes}', 
                {$this->userid}, 
                '{$this->platform}'
            )";

            $rst = $this->getData($sql);
            if ($rst) {
                return ['status' => 'success', 'message' => 'Mortality recorded successfully.'];
            }
            return ['status' => 'error', 'message' => 'Failed to record mortality.'];
        } catch (Exception $e) {
            return ['status' => 'error', 'message' => 'System error: ' . $e->getMessage()];
        }
    }
    public function getFeedingHistory($limit = 10) {
        try {
            $sql = "SELECT 
                        f.feedingid,
                        f.feedingdate,
                        fl.flockno,
                        f.feedcategory,
                        CASE 
                            WHEN f.feedcategory = 'ready' THEN i.itemname 
                            ELSE form.formulationname 
                        END as feedname,
                        f.quantity,
                        f.totalcost,
                        fl.currentcount,
                        (f.quantity * 1000 / NULLIF(fl.currentcount, 0)) as g_per_bird
                    FROM poultry_feeding_logs f
                    JOIN poultryflocks fl ON f.flockid = fl.flockid
                    LEFT JOIN poultryinventoryitems i ON f.itemid = i.itemid AND f.feedcategory = 'ready'
                    LEFT JOIN poultryformulations form ON f.itemid = form.formulationid AND f.feedcategory = 'mix'
                    WHERE f.deleted = 0
                    ORDER BY f.feedingdate DESC, f.createdat DESC
                    LIMIT {$limit}";
            
            return $this->getJSON($sql);
        } catch (Exception $e) {
            return json_encode([]);
        }
    }

    public function getInventoryStatus() {
        try {
            $sql = "SELECT itemname, currentstock, reorderlevel, unit 
                    FROM poultryinventoryitems 
                    WHERE isfeed = 1 AND deleted = 0 
                    ORDER BY itemname ASC";
            return $this->getJSON($sql);
        } catch (Exception $e) {
            return json_encode([]);
        }
    }

    public function getFeedingChartsData() {
        try {
            // 1. Last 7 Days Consumption
            $consumption = [];
            $days = [];
            for ($i = 6; $i >= 0; $i--) {
                $date = date('Y-m-d', strtotime("-$i days"));
                $days[] = date('D', strtotime($date));
                
                $sql = "SELECT SUM(quantity) as qty FROM poultry_feeding_logs WHERE feedingdate = '{$date}' AND deleted = 0";
                $res = $this->getData($sql)->fetch(PDO::FETCH_ASSOC);
                $consumption[] = (float)($res['qty'] ?? 0);
            }

            // 2. Last 4 Months Cost
            $costs = [];
            $months = [];
            for ($i = 3; $i >= 0; $i--) {
                $monthStart = date('Y-m-01', strtotime("-$i months"));
                $months[] = date('F', strtotime($monthStart));
                
                $sql = "SELECT SUM(totalcost) as cost FROM poultry_feeding_logs WHERE feedingdate LIKE '" . date('Y-m', strtotime($monthStart)) . "%' AND deleted = 0";
                $res = $this->getData($sql)->fetch(PDO::FETCH_ASSOC);
                $costs[] = (float)($res['cost'] ?? 0);
            }

            return [
                'status' => 'success',
                'data' => [
                    'days' => $days,
                    'consumption' => $consumption,
                    'months' => $months,
                    'costs' => $costs
                ]
            ];
        } catch (Exception $e) {
            return ['status' => 'error', 'message' => $e->getMessage()];
        }
    }

    public function getCollectionShifts() {
        $sql = "CALL sp_getpoultrycollectionshifts()";
        return $this->getJSON($sql);
    }

    public function getLayerFlocks() {
        $sql = "SELECT f.*, bt.typename as birdtype, fs.stagename, b.breedname, h.housename 
                FROM poultryflocks f
                LEFT JOIN poultrybirdtypes bt ON f.birdtypeid = bt.typeid
                LEFT JOIN poultryflockstages fs ON f.stageid = fs.stageid
                LEFT JOIN poultrybreeds b ON f.breedid = b.breedid
                LEFT JOIN poultryhouses h ON f.houseid = h.houseid
                WHERE f.deleted = 0 
                AND (LOWER(fs.stagename) LIKE '%layer%' OR LOWER(bt.typename) LIKE '%layer%')
                ORDER BY f.flockno ASC";
        return $this->getJSON($sql);
    }

    public function saveEggCollection($data) {
        try {
            $flockid = (int)($data['flock_id'] ?? 0);
            $collectiondate = $this->mySQLDate($data['collection_date'] ?? '');
            $shiftid = (int)($data['shift_id'] ?? 0);
            $goodcount = (int)($data['good_eggs'] ?? 0);
            $brokencount = (int)($data['broken_eggs'] ?? 0);
            $narration = str_replace("'", "''", $data['narration'] ?? '');

            $sql = "CALL sp_savepoultryeggcollection(
                {$flockid}, 
                '{$collectiondate}', 
                {$shiftid}, 
                {$goodcount}, 
                {$brokencount}, 
                '{$narration}', 
                {$this->userid}, 
                '{$this->platform}'
            )";

            $rst = $this->getData($sql);
            if ($rst) {
                return ['status' => 'success', 'message' => 'Egg collection recorded successfully.'];
            }
            return ['status' => 'error', 'message' => 'Failed to save collection record.'];
        } catch (Exception $e) {
            return ['status' => 'error', 'message' => $e->getMessage()];
        }
    }

    public function getEggCollectionStats() {
        try {
            $today = date('Y-m-d');
            
            // 1. Today's Totals
            $sql = "SELECT SUM(goodcount) as good, SUM(brokencount) as broken, SUM(goodcount + brokencount) as total 
                    FROM poultry_egg_collection 
                    WHERE collectiondate = '{$today}' AND deleted = 0";
            $res = $this->getData($sql)->fetch(PDO::FETCH_ASSOC);
            $good = (int)($res['good'] ?? 0);
            $broken = (int)($res['broken'] ?? 0);
            $total = (int)($res['total'] ?? 0);

            // 2. Production Rate (Total eggs / Total active layers)
            $sqlLayers = "SELECT SUM(currentcount) as layercount 
                          FROM poultryflocks f
                          LEFT JOIN poultryflockstages fs ON f.stageid = fs.stageid
                          WHERE f.deleted = 0 AND f.status = 'Active' AND fs.stagename LIKE '%Layer%'";
            $resLayers = $this->getData($sqlLayers)->fetch(PDO::FETCH_ASSOC);
            $layerCount = (int)($resLayers['layercount'] ?? 0);
            
            $prodRate = $layerCount > 0 ? ($total / $layerCount) * 100 : 0;

            return [
                'status' => 'success',
                'data' => [
                    'total_collected' => $total,
                    'good_eggs' => $good,
                    'broken_eggs' => $broken,
                    'production_rate' => number_format($prodRate, 1),
                    'broken_percent' => $total > 0 ? number_format(($broken / $total) * 100, 1) : 0,
                    'good_percent' => $total > 0 ? ($good / $total) * 100 : 0
                ]
            ];
        } catch (Exception $e) {
            return ['status' => 'error', 'message' => $e->getMessage()];
        }
    }

    public function getDailyEggCollectionLog() {
        $today = date('Y-m-d');
        $sql = "SELECT ec.*, s.shiftname, DATE_FORMAT(s.shifttime, '%h:%i %p') as shift_time, 
                       CONCAT(u.firstname, ' ', u.lastname) as collector,
                       (ec.goodcount + ec.brokencount) as totalqty
                FROM poultry_egg_collection ec
                LEFT JOIN poultrycollectionshifts s ON ec.shiftid = s.shiftid
                LEFT JOIN user u ON ec.addedby = u.userid
                WHERE ec.collectiondate = '{$today}' AND ec.deleted = 0
                ORDER BY s.shifttime ASC";
        return $this->getJSON($sql);
    }

    public function getWeeklyProductionChartData() {
        try {
            // Use PHP dates to avoid timezone issues with CURDATE()
            $dates = [];
            for ($i = 6; $i >= 0; $i--) {
                $dates[] = date('Y-m-d', strtotime("-{$i} days"));
            }
            $datesList = "'" . implode("','", $dates) . "'";

            // Get total active layers for rate calculation
            $sqlLayers = "SELECT SUM(currentcount) as layercount 
                          FROM poultryflocks f
                          INNER JOIN poultryflockstages fs ON f.stageid = fs.stageid
                          WHERE f.deleted = 0 AND f.status = 'Active' AND fs.stagename LIKE '%Layer%'";
            $resLayers = $this->getData($sqlLayers)->fetch(PDO::FETCH_ASSOC);
            $layerCount = (int)($resLayers['layercount'] ?? 0);

            // Get daily production for these specific dates
            $sql = "SELECT 
                        d.date,
                        DATE_FORMAT(d.date, '%a') as day_name,
                        COALESCE(SUM(ec.goodcount + ec.brokencount), 0) as total_eggs
                    FROM (";
            
            $unions = [];
            foreach($dates as $d) {
                $unions[] = "SELECT '{$d}' as date";
            }
            $sql .= implode(" UNION ALL ", $unions);
            
            $sql .= ") d
                    LEFT JOIN poultry_egg_collection ec ON d.date = ec.collectiondate AND ec.deleted = 0
                    GROUP BY d.date
                    ORDER BY d.date ASC";
            
            $rst = $this->getData($sql);
            $categories = [];
            $rates = [];
            
            while($row = $rst->fetch(PDO::FETCH_ASSOC)) {
                $categories[] = $row['day_name'];
                $total = (int)$row['total_eggs'];
                $rate = $layerCount > 0 ? ($total / $layerCount) * 100 : 0;
                $rates[] = (float)number_format($rate, 1);
            }

            return [
                'status' => 'success',
                'categories' => $categories,
                'rates' => $rates,
                'target' => 92,
                'layer_count' => $layerCount // Return for verification
            ];
        } catch (Exception $e) {
            return ['status' => 'error', 'message' => $e->getMessage()];
        }
    }

    public function getDashboardStats() {
        try {
            // Basic counts and sums
            $sql = "SELECT 
                        COUNT(*) as total_flocks,
                        SUM(CASE WHEN status = 'Active' THEN 1 ELSE 0 END) as active_batches,
                        SUM(currentcount) as total_birds,
                        SUM(initialcount) as sum_initial,
                        SUM(initialcount - currentcount) as sum_mortality
                    FROM poultryflocks 
                    WHERE deleted = 0";
            
            $stats = $this->getData($sql)->fetch(PDO::FETCH_ASSOC);
            
            // Calculate mortality rate
            $mortality_rate = 0;
            if ($stats['sum_initial'] > 0) {
                $mortality_rate = ($stats['sum_mortality'] / $stats['sum_initial']) * 100;
            }

            // Flocks maturing soon (within 14 days of maturity date)
            $sqlSoon = "SELECT COUNT(*) as count 
                        FROM poultryflocks f
                        JOIN poultrybirdtypes bt ON f.birdtypeid = bt.typeid
                        WHERE f.deleted = 0 AND f.status = 'Active'
                        AND DATE_ADD(f.arrivaldate, INTERVAL bt.maturityperiod DAY) <= DATE_ADD(CURDATE(), INTERVAL 14 DAY)
                        AND DATE_ADD(f.arrivaldate, INTERVAL bt.maturityperiod DAY) >= CURDATE()";
            $soon = $this->getData($sqlSoon)->fetch(PDO::FETCH_ASSOC);

            // Flocks that are currently in the 'Layer' stage
            $sqlLayers = "SELECT COUNT(*) as count 
                          FROM poultryflocks f
                          JOIN poultryflockstages fs ON f.stageid = fs.stageid
                          WHERE f.deleted = 0 AND f.status = 'Active' AND fs.stagename = 'Layer'";
            $layers = $this->getData($sqlLayers)->fetch(PDO::FETCH_ASSOC);

            return [
                'status' => 'success',
                'data' => [
                    'total_flocks' => (int)$stats['total_flocks'],
                    'active_batches' => (int)$stats['active_batches'],
                    'total_birds' => (int)$stats['total_birds'],
                    'mortality_rate' => round($mortality_rate, 1),
                    'maturing_soon' => (int)$soon['count'],
                    'total_layers' => (int)$layers['count']
                ]
            ];
        } catch (Exception $e) {
            return ['status' => 'error', 'message' => $e->getMessage()];
        }
    }

    public function getPopulationTrend() {
        try {
            $sql = "SELECT 
                        weeks.w as week_num,
                        DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL (5 - weeks.w)*7 DAY), '%d %M') as week_label,
                        (SELECT COALESCE(SUM(initialcount), 0) FROM poultryflocks WHERE arrivaldate <= DATE_SUB(CURDATE(), INTERVAL (5 - weeks.w)*7 DAY) AND deleted = 0) -
                        (SELECT COALESCE(SUM(count), 0) FROM poultry_mortality WHERE mortalitydate <= DATE_SUB(CURDATE(), INTERVAL (5 - weeks.w)*7 DAY) AND deleted = 0) as population
                    FROM (
                        SELECT 0 as w UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
                    ) weeks
                    ORDER BY weeks.w ASC";
            
            $data = $this->getData($sql)->fetchAll(PDO::FETCH_ASSOC);
            
            $labels = [];
            $values = [];
            foreach ($data as $row) {
                // Return actual date for datetime axis support
                $labels[] = date('Y-m-d', strtotime('-' . (5 - $row['week_num']) * 7 . ' days'));
                $values[] = (int)$row['population'];
            }

            return [
                'status' => 'success',
                'labels' => $labels,
                'values' => $values
            ];
        } catch (Exception $e) {
            return ['status' => 'error', 'message' => $e->getMessage()];
        }
    }
}
