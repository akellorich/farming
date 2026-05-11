<?php
/**
 * Jukam Poultry Management System - Poultry Settings Model
 * File: models/poultrysettings.php
 */

require_once('db.php');

class PoultrySettings extends db {
    
    public function __construct() {
        parent::__construct();
    }

    private function isDuplicate($table, $nameField, $nameValue, $idField, $idValue) {
        $nameValue = str_replace("'", "''", $nameValue);
        $sql = "SELECT COUNT(*) as count FROM {$table} WHERE {$nameField} = '{$nameValue}' AND {$idField} != {$idValue} AND deleted = 0";
        $rst = $this->getData($sql);
        if ($rst) {
            $row = $rst->fetch(PDO::FETCH_ASSOC);
            return (int)$row['count'] > 0;
        }
        return false;
    }

    public function saveBreed($data) {
        $id = (int)($data['id'] ?? 0);
        $breedname = str_replace("'", "''", $data['breed_name']);
        
        if ($this->isDuplicate('poultrybreeds', 'breedname', $data['breed_name'], 'breedid', $id)) {
            return ['status' => 'error', 'message' => "A breed with the name '{$data['breed_name']}' already exists.", 'field' => 'breed_name'];
        }

        $category = str_replace("'", "''", $data['category']);
        $notes = str_replace("'", "''", $data['notes']);
        $status = str_replace("'", "''", $data['status'] ?? 'Active');

        $sql = "CALL sp_savepoultrybreed({$id}, '{$breedname}', '{$category}', '{$notes}', '{$status}', {$this->userid}, '{$this->platform}')";
        return $this->getData($sql) ? ['status' => 'success', 'message' => 'Breed saved successfully'] : ['status' => 'error', 'message' => 'Failed to save breed'];
    }

    public function saveBirdType($data) {
        $conn = $this->connect();
        $conn->beginTransaction();
        try {
            $id = (int)($data['id'] ?? 0);
            $typename = str_replace("'", "''", $data['type_name']);
            
            if ($this->isDuplicate('poultrybirdtypes', 'typename', $data['type_name'], 'typeid', $id)) {
                return ['status' => 'error', 'message' => "A bird type with the name '{$data['type_name']}' already exists.", 'field' => 'type_name'];
            }

            $description = str_replace("'", "''", $data['description']);
            $maturityperiod = (int)($data['maturity_period'] ?? 130);

            $sql = "CALL sp_savepoultrybirdtype({$id}, '{$typename}', '{$description}', {$maturityperiod}, {$this->userid}, '{$this->platform}')";
            $rst = $conn->query($sql);
            $row = $rst->fetch(PDO::FETCH_ASSOC);
            $birdTypeId = $row['typeid'];
            $rst->closeCursor();

            // Handle Vaccination Schedule
            $conn->query("DELETE FROM poultry_birdtype_vaccinations WHERE birdtypeid = {$birdTypeId}");
            if (isset($data['vax_disease_id']) && is_array($data['vax_disease_id'])) {
                foreach ($data['vax_disease_id'] as $index => $diseaseId) {
                    $minAge = (int)$data['vax_min_age'][$index];
                    $maxAge = (int)$data['vax_max_age'][$index];
                    $narration = str_replace("'", "''", $data['vax_narration'][$index]);
                    
                    $sqlVax = "INSERT INTO poultry_birdtype_vaccinations (birdtypeid, minage, maxage, diseaseid, narration, addedby) 
                              VALUES ({$birdTypeId}, {$minAge}, {$maxAge}, {$diseaseId}, '{$narration}', {$this->userid})";
                    $conn->query($sqlVax);
                }
            }

            $conn->commit();
            return ['status' => 'success', 'message' => 'Bird type and vaccination schedule saved successfully'];
        } catch (Exception $e) {
            if ($conn->inTransaction()) $conn->rollBack();
            error_log("Save Bird Type Error: " . $e->getMessage());
            return ['status' => 'error', 'message' => 'Failed to save bird type: ' . $e->getMessage()];
        }
    }

    public function saveFlockStage($data) {
        $id = (int)($data['id'] ?? 0);
        $stagename = str_replace("'", "''", $data['stage_name']);
        
        if ($this->isDuplicate('poultryflockstages', 'stagename', $data['stage_name'], 'stageid', $id)) {
            return ['status' => 'error', 'message' => "A flock stage with the name '{$data['stage_name']}' already exists.", 'field' => 'stage_name'];
        }

        $birdtype = str_replace("'", "''", $data['bird_type']);
        $duration = str_replace("'", "''", $data['duration']);
        $feedquantity = (int)($data['feed_quantity'] ?? 140);

        $sql = "CALL sp_savepoultryflockstage({$id}, '{$stagename}', '{$birdtype}', '{$duration}', {$feedquantity}, {$this->userid}, '{$this->platform}')";
        return $this->getData($sql) ? ['status' => 'success', 'message' => 'Flock stage saved successfully'] : ['status' => 'error', 'message' => 'Failed to save flock stage'];
    }

    public function saveHouse($data) {
        $id = (int)($data['id'] ?? 0);
        $housename = str_replace("'", "''", $data['house_name'] ?? '');
        
        if ($this->isDuplicate('poultryhouses', 'housename', $data['house_name'], 'houseid', $id)) {
            return ['status' => 'error', 'message' => "A house with the name '{$data['house_name']}' already exists.", 'field' => 'house_name'];
        }

        $capacity = (int)($data['capacity'] ?? 0);
        $description = str_replace("'", "''", $data['description'] ?? '');
        $status = str_replace("'", "''", $data['status'] ?? 'Active');

        $sql = "CALL sp_savepoultryhouse({$id}, '{$housename}', {$capacity}, '{$description}', '{$status}', {$this->userid}, '{$this->platform}')";
        return $this->getData($sql) ? ['status' => 'success', 'message' => 'House saved successfully'] : ['status' => 'error', 'message' => 'Failed to save house'];
    }

    public function saveInventoryCategory($data) {
        $id = (int)($data['id'] ?? 0);
        $catcode = str_replace("'", "''", $data['cat_code']);
        $catname = str_replace("'", "''", $data['cat_name']);

        if ($this->isDuplicate('poultryinventorycategories', 'categorycode', $data['cat_code'], 'categoryid', $id)) {
            return ['status' => 'error', 'message' => "A category with the code '{$data['cat_code']}' already exists.", 'field' => 'cat_code'];
        }

        if ($this->isDuplicate('poultryinventorycategories', 'categoryname', $data['cat_name'], 'categoryid', $id)) {
            return ['status' => 'error', 'message' => "A category with the name '{$data['cat_name']}' already exists.", 'field' => 'cat_name'];
        }

        $prefix = str_replace("'", "''", $data['prefix']);
        $currentno = (int)$data['current_no'];
        $padzeros = isset($data['pad_zeros']) ? 1 : 0;

        $sql = "CALL sp_savepoultryinventorycategory({$id}, '{$catcode}', '{$catname}', '{$prefix}', {$currentno}, {$padzeros}, {$this->userid}, '{$this->platform}')";
        return $this->getData($sql) ? ['status' => 'success', 'message' => 'Category saved successfully'] : ['status' => 'error', 'message' => 'Failed to save category'];
    }

    public function saveInventoryItem($data) {
        $id = (int)($data['id'] ?? 0);
        $itemname = str_replace("'", "''", $data['item_name']);
        
        if ($this->isDuplicate('poultryinventoryitems', 'itemname', $data['item_name'], 'itemid', $id)) {
            return ['status' => 'error', 'message' => "An item with the name '{$data['item_name']}' already exists.", 'field' => 'item_name'];
        }

        $itemcode = str_replace("'", "''", $data['item_code']);
        $categoryid = (int)$data['category_id'];
        $unit = str_replace("'", "''", $data['unit']);
        $isfeed = isset($data['is_feed']) ? 1 : 0;
        $reorderlevel = (float)($data['reorder_level'] ?? 0);

        $sql = "CALL sp_savepoultryinventoryitem({$id}, '{$itemname}', '{$itemcode}', {$categoryid}, '{$unit}', {$isfeed}, {$reorderlevel}, {$this->userid}, '{$this->platform}')";
        return $this->getData($sql) ? ['status' => 'success', 'message' => 'Inventory item saved successfully'] : ['status' => 'error', 'message' => 'Failed to save item'];
    }

    public function saveDisease($data) {
        $id = (int)($data['id'] ?? 0);
        $diseasename = str_replace("'", "''", $data['disease_name']);

        if ($this->isDuplicate('poultrydiseases', 'diseasename', $data['disease_name'], 'diseaseid', $id)) {
            return ['status' => 'error', 'message' => "A disease with the name '{$data['disease_name']}' already exists.", 'field' => 'disease_name'];
        }

        $description = str_replace("'", "''", $data['description'] ?? '');
        $typeid = (int)($data['type_id'] ?? 0);
        $severity = str_replace("'", "''", $data['severity']);

        $sql = "CALL sp_savepoultrydisease({$id}, '{$diseasename}', '{$description}', {$typeid}, '{$severity}', {$this->userid}, '{$this->platform}')";
        return $this->getData($sql) ? ['status' => 'success', 'message' => 'Disease profile saved successfully'] : ['status' => 'error', 'message' => 'Failed to save disease'];
    }

    public function saveMortalityReason($data) {
        $id = (int)($data['id'] ?? 0);
        $reasonlabel = str_replace("'", "''", $data['reason_label']);

        if ($this->isDuplicate('poultrymortalityreasons', 'reasonlabel', $data['reason_label'], 'reasonid', $id)) {
            return ['status' => 'error', 'message' => "A mortality reason with the label '{$data['reason_label']}' already exists.", 'field' => 'reason_label'];
        }

        $description = str_replace("'", "''", $data['description']);

        $sql = "CALL sp_savepoultrymortalityreason({$id}, '{$reasonlabel}', '{$description}', {$this->userid}, '{$this->platform}')";
        return $this->getData($sql) ? ['status' => 'success', 'message' => 'Mortality reason saved successfully'] : ['status' => 'error', 'message' => 'Failed to save mortality reason'];
    }

    public function saveFormulation($data) {
        $conn = $this->connect();
        $conn->beginTransaction();
        try {
            $id = (int)($data['id'] ?? 0);
            $formulationname = str_replace("'", "''", $data['formulation_name']);
            $birdtype = str_replace("'", "''", $data['bird_type']);
            $growthstage = str_replace("'", "''", $data['growth_stage']);

            $sql = "CALL sp_savepoultryformulation({$id}, '{$formulationname}', '{$birdtype}', '{$growthstage}', {$this->userid}, '{$this->platform}')";
            $rst = $conn->query($sql);
            $row = $rst->fetch(PDO::FETCH_ASSOC);
            $formulationId = $row['formulationid'];
            $rst->closeCursor();

            if (isset($data['ingredient_id']) && is_array($data['ingredient_id'])) {
                foreach ($data['ingredient_id'] as $index => $itemId) {
                    $qty = (float)$data['ingredient_qty'][$index];
                    $sqlIng = "CALL sp_savepoultryformulationingredient({$formulationId}, {$itemId}, {$qty})";
                    $conn->query($sqlIng);
                }
            }

            $conn->commit();
            return true;
        } catch (Exception $e) {
            if ($conn->inTransaction()) {
                $conn->rollBack();
            }
            error_log("Save Formulation Error: " . $e->getMessage());
            return false;
        }
    }

    // --- Retrieval Methods ---

    public function getBreeds() {
        $sql = "CALL sp_getpoultrybreeds()";
        return $this->getJSON($sql);
    }

    public function getBirdTypes() {
        $sql = "CALL sp_getpoultrybirdtypes()";
        return $this->getJSON($sql);
    }

    public function getFlockStages() {
        $sql = "CALL sp_getpoultryflockstages()";
        return $this->getJSON($sql);
    }

    public function getBirdTypeVaccinations($id) {
        $sql = "SELECT v.*, d.diseasename 
                FROM poultry_birdtype_vaccinations v
                LEFT JOIN poultrydiseases d ON v.diseaseid = d.diseaseid
                WHERE v.birdtypeid = {$id} AND v.deleted = 0
                ORDER BY v.minage ASC";
        return $this->getJSON($sql);
    }

    public function getHouses() {
        $sql = "CALL sp_getpoultryhouses()";
        return $this->getJSON($sql);
    }

    public function getInventoryCategories() {
        $sql = "CALL sp_getpoultryinventorycategories()";
        return $this->getJSON($sql);
    }

    public function getInventoryItems() {
        $sql = "CALL sp_getpoultryinventoryitems()";
        return $this->getJSON($sql);
    }

    public function getFeedItems() {
        $sql = "SELECT * FROM poultryinventoryitems WHERE isfeed = 1 AND deleted = 0 ORDER BY itemname ASC";
        return $this->getJSON($sql);
    }

    public function getDiseases() {
        $sql = "CALL sp_getpoultrydiseases()";
        return $this->getJSON($sql);
    }

    public function getDiseaseTypes() {
        $sql = "CALL sp_getpoultrydiseasetypes()";
        return $this->getJSON($sql);
    }

    public function getMortalityReasons() {
        $sql = "CALL sp_getpoultrymortalityreasons()";
        return $this->getJSON($sql);
    }

    public function getFormulations() {
        $sql = "CALL sp_getpoultryformulations()";
        return $this->getJSON($sql);
    }

    public function getFormulationIngredients($id) {
        $sql = "CALL sp_getpoultryformulationingredients({$id})";
        return $this->getJSON($sql);
    }

    // --- Soft Delete Methods ---

    public function deleteBreed($id, $reason) {
        $sql = "CALL sp_deletepoultrybreed({$id}, {$this->userid}, '{$reason}', '{$this->platform}')";
        return $this->getData($sql);
    }

    public function deleteBirdType($id, $reason) {
        $sql = "CALL sp_deletepoultrybirdtype({$id}, {$this->userid}, '{$reason}', '{$this->platform}')";
        return $this->getData($sql);
    }

    public function deleteFlockStage($id, $reason) {
        $sql = "CALL sp_deletepoultryflockstage({$id}, {$this->userid}, '{$reason}', '{$this->platform}')";
        return $this->getData($sql);
    }

    public function deleteHouse($id, $reason) {
        $sql = "CALL sp_deletepoultryhouse({$id}, {$this->userid}, '{$reason}', '{$this->platform}')";
        return $this->getData($sql);
    }

    public function deleteInventoryCategory($id, $reason) {
        $sql = "CALL sp_deletepoultryinventorycategory({$id}, {$this->userid}, '{$reason}', '{$this->platform}')";
        return $this->getData($sql);
    }

    public function deleteInventoryItem($id, $reason) {
        $sql = "CALL sp_deletepoultryinventoryitem({$id}, {$this->userid}, '{$reason}', '{$this->platform}')";
        return $this->getData($sql);
    }

    public function deleteDisease($id, $reason) {
        $sql = "CALL sp_deletepoultrydisease({$id}, {$this->userid}, '{$reason}', '{$this->platform}')";
        return $this->getData($sql);
    }

    public function deleteMortalityReason($id, $reason) {
        $sql = "CALL sp_deletepoultrymortalityreason({$id}, {$this->userid}, '{$reason}', '{$this->platform}')";
        return $this->getData($sql);
    }

    public function deleteFormulation($id, $reason) {
        $sql = "CALL sp_deletepoultryformulation({$id}, {$this->userid}, '{$reason}', '{$this->platform}')";
        return $this->getData($sql);
    }
}
