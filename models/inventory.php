<?php
require_once('db.php');

class inventory extends db {
    /* --- Category Operations --- */
    
    public function saveCategory($id, $code, $name, $icon, $prefix, $startNum, $padZeros) {
        $sql = "CALL sp_saveinventorycategory(
            {$id},
            '{$code}',
            '{$name}',
            '{$icon}',
            '{$prefix}',
            {$startNum},
            {$padZeros},
            {$this->userid},
            '{$this->platform}'
        )";
        $rst = $this->getData($sql);
        $row = $rst->fetch(PDO::FETCH_ASSOC);
        if ($row && isset($row['categoryid'])) {
            return json_encode(["status" => "success", "message" => "Category saved successfully", "categoryid" => $row['categoryid']]);
        }
        return json_encode(["status" => "error", "message" => "Error saving category"]);
    }

    public function getCategories($id = 0) {
        $sql = "CALL sp_getinventorycategories({$id})";
        return $this->getJSON($sql);
    }

    public function deleteCategory($id) {
        $sql = "CALL sp_deleteinventorycategory({$id}, {$this->userid}, '{$this->platform}')";
        $rst = $this->getData($sql);
        $row = $rst->fetch(PDO::FETCH_ASSOC);
        if ($row && isset($row['success'])) {
            return json_encode(["status" => "success", "message" => "Category deleted successfully"]);
        }
        return json_encode(["status" => "error", "message" => "Error deleting category"]);
    }

    /* --- Item Operations --- */

    public function saveItem($id, $catId, $code, $name, $uom, $price, $reorder, $type, $isFeed, $desc) {
        $sql = "CALL sp_saveinventoryitem(
            {$id},
            {$catId},
            '{$code}',
            '{$name}',
            '{$uom}',
            {$price},
            {$reorder},
            '{$type}',
            {$isFeed},
            " . ($desc ? "'{$desc}'" : "NULL") . ",
            {$this->userid},
            '{$this->platform}'
        )";
        $rst = $this->getData($sql);
        $row = $rst->fetch(PDO::FETCH_ASSOC);
        if ($row && isset($row['itemid'])) {
            return json_encode(["status" => "success", "message" => "Item provisioned successfully", "itemid" => $row['itemid']]);
        }
        return json_encode(["status" => "error", "message" => "Error provisioning item"]);
    }

    public function getItems($catId = 0, $itemId = 0) {
        $sql = "CALL sp_getinventoryitems({$catId}, {$itemId})";
        return $this->getJSON($sql);
    }

    public function deleteItem($id) {
        $sql = "CALL sp_deleteinventoryitem({$id}, {$this->userid}, '{$this->platform}')";
        $rst = $this->getData($sql);
        $row = $rst->fetch(PDO::FETCH_ASSOC);
        if ($row && isset($row['success'])) {
            return json_encode(["status" => "success", "message" => "Item deleted successfully"]);
        }
        return json_encode(["status" => "error", "message" => "Error deleting item"]);
    }

    public function getInventoryStats() {
        $sql = "CALL sp_getinventorystats()";
        return $this->getJSON($sql);
    }

    public function getCategorySummaries() {
        $sql = "CALL sp_getcategorysummaries()";
        return $this->getJSON($sql);
    }
}
?>
