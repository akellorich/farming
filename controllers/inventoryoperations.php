<?php
require_once("../models/inventory.php");
$inventory = new inventory();

$action = $_GET['action'] ?? $_POST['action'] ?? '';

/* --- Category Actions --- */

if ($action == 'savecategory') {
    $id = $_POST['id'] ?? 0;
    $code = $_POST['categorycode'] ?? '';
    $name = $_POST['categoryname'] ?? '';
    $icon = $_POST['categoryicon'] ?? 'fas fa-box';
    $prefix = $_POST['itemprefix'] ?? '';
    $startNum = $_POST['startingnumber'] ?? 1;
    $padZeros = isset($_POST['padzeros']) ? 1 : 0;

    echo $inventory->saveCategory($id, $code, $name, $icon, $prefix, $startNum, $padZeros);
}

if ($action == 'getcategories') {
    $id = $_GET['id'] ?? 0;
    echo $inventory->getCategories($id);
}

if ($action == 'deletecategory') {
    $id = $_POST['id'] ?? 0;
    echo $inventory->deleteCategory($id);
}

/* --- Item Actions --- */

if ($action == 'saveitem') {
    $id = $_POST['id'] ?? 0;
    $catId = $_POST['categoryid'] ?? 0;
    $code = $_POST['itemcode'] ?? '';
    $name = $_POST['itemname'] ?? '';
    $uom = $_POST['uom'] ?? '';
    $price = $_POST['unitprice'] ?? 0;
    $reorder = $_POST['reorderlevel'] ?? 0;
    $type = $_POST['itemtype'] ?? 'Ingredient';
    $desc = $_POST['description'] ?? '';

    echo $inventory->saveItem($id, $catId, $code, $name, $uom, $price, $reorder, $type, $desc);
}

if ($action == 'getitems') {
    $catId = $_GET['categoryid'] ?? 0;
    $itemId = $_GET['id'] ?? 0;
    echo $inventory->getItems($catId, $itemId);
}

if ($action == 'deleteitem') {
    $id = $_POST['id'] ?? 0;
    echo $inventory->deleteItem($id);
}

if ($action == 'getinventorystats') {
    echo $inventory->getInventoryStats();
}

if ($action == 'getcategorysummaries') {
    echo $inventory->getCategorySummaries();
}
?>
