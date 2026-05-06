<?php
require_once("models/db.php");
$db = new db();
$pdo = $db->connect();
$rst = $pdo->query("SELECT VERSION()");
echo $rst->fetchColumn();
?>
