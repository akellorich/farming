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
        $sql = "SELECT f.*, bt.typename as birdtype, fs.stagename, b.breedname, h.housename 
                FROM poultryflocks f
                LEFT JOIN poultrybirdtypes bt ON f.birdtypeid = bt.typeid
                LEFT JOIN poultryflockstages fs ON f.stageid = fs.stageid
                LEFT JOIN poultrybreeds b ON f.breedid = b.breedid
                LEFT JOIN poultryhouses h ON f.houseid = h.houseid
                WHERE f.deleted = 0
                ORDER BY f.createdat DESC";
        return $this->getJSON($sql);
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
