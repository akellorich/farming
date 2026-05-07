<?php
require_once("models/db.php");
$db = new db();
$pdo = $db->connect();

$filename = $argv[1] ?? '';
if (!$filename || !file_exists($filename)) {
    die("Usage: php apply_migration.php <filename>\n");
}

$sql = file_get_contents($filename);

// Improved logic to handle DELIMITER $$ and split by blocks
$sql = preg_replace('/DELIMITER\s+\$\$/i', '', $sql);
$sql = preg_replace('/DELIMITER\s+;/i', '', $sql);

$blocks = explode('$$', $sql);

try {
    foreach ($blocks as $block) {
        $block = trim($block);
        if (!$block) continue;
        
        // If the block contains multiple statements (not an SP), split by ;
        if (stripos($block, 'CREATE PROCEDURE') === false && stripos($block, 'CREATE FUNCTION') === false) {
            $stmts = explode(';', $block);
            foreach ($stmts as $stmt) {
                $stmt = trim($stmt);
                if ($stmt) $pdo->exec($stmt);
            }
        } else {
            // It's an SP block, replace any remaining $$ with ; if they were internal (unlikely here but for safety)
            $block = str_replace('$$', ';', $block);
            $pdo->exec($block);
        }
    }
    echo "Migration $filename applied successfully.\n";
} catch (Exception $e) {
    echo "Error applying migration: " . $e->getMessage() . "\n";
    echo "Failed block: " . substr($block, 0, 200) . "...\n";
}
?>
