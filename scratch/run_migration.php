<?php
require_once("models/db.php");
$db = new db();
$pdo = $db->connect();

try {
    // 2. Create Stored Procedures (Using HEREDOC with single quotes to avoid interpolation)
    // Updated to use JSON_LENGTH for MariaDB 10.4 compatibility
    
    $sp1 = "DROP PROCEDURE IF EXISTS `sp_savevaccinationschedule`;";
    $sp2 = <<<'SQL'
CREATE PROCEDURE `sp_savevaccinationschedule`(
    IN `$id` INT,
    IN `$diseaseid` INT,
    IN `$penids` JSON,
    IN `$scheduledate` DATE,
    IN `$scheduletime` TIME,
    IN `$repeat_annually` TINYINT(1),
    IN `$notes` TEXT,
    IN `$userid` INT
)
BEGIN
    IF `$id` = 0 THEN
        INSERT INTO `vaccinationschedules` (`diseaseid`, `penids`, `scheduledate`, `scheduletime`, `repeat_annually`, `notes`, `addedby`)
        VALUES (`$diseaseid`, `$penids`, `$scheduledate`, `$scheduletime`, `$repeat_annually`, `$notes`, `$userid`);
    ELSE
        UPDATE `vaccinationschedules` 
        SET `diseaseid` = `$diseaseid`,
            `penids` = `$penids`,
            `scheduledate` = `$scheduledate`,
            `scheduletime` = `$scheduletime`,
            `repeat_annually` = `$repeat_annually`,
            `notes` = `$notes`
        WHERE `id` = `$id`;
    END IF;
END;
SQL;

    $sp3 = "DROP PROCEDURE IF EXISTS `sp_savedewormingschedule`;";
    $sp4 = <<<'SQL'
CREATE PROCEDURE `sp_savedewormingschedule`(
    IN `$id` INT,
    IN `$schedulename` VARCHAR(100),
    IN `$penids` JSON,
    IN `$scheduledate` DATE,
    IN `$scheduletime` TIME,
    IN `$repeat_annually` TINYINT(1),
    IN `$notes` TEXT,
    IN `$userid` INT
)
BEGIN
    IF `$id` = 0 THEN
        INSERT INTO `dewormingschedules` (`schedulename`, `penids`, `scheduledate`, `scheduletime`, `repeat_annually`, `notes`, `addedby`)
        VALUES (`$schedulename`, `$penids`, `$scheduledate`, `$scheduletime`, `$repeat_annually`, `$notes`, `$userid`);
    ELSE
        UPDATE `dewormingschedules` 
        SET `schedulename` = `$schedulename`,
            `penids` = `$penids`,
            `scheduledate` = `$scheduledate`,
            `scheduletime` = `$scheduletime`,
            `repeat_annually` = `$repeat_annually`,
            `notes` = `$notes`
        WHERE `id` = `$id`;
    END IF;
END;
SQL;

    $sp5 = "DROP PROCEDURE IF EXISTS `sp_getvaccinationschedules`;";
    $sp6 = <<<'SQL'
CREATE PROCEDURE `sp_getvaccinationschedules`()
BEGIN
    SELECT 
        v.*,
        d.diseasename,
        JSON_LENGTH(v.penids) as pen_count
    FROM `vaccinationschedules` v
    JOIN `diseases` d ON v.diseaseid = d.id
    WHERE v.deleted = 0
    ORDER BY v.scheduledate DESC, v.scheduletime DESC;
END;
SQL;

    $sp7 = "DROP PROCEDURE IF EXISTS `sp_getdewormingschedules`;";
    $sp8 = <<<'SQL'
CREATE PROCEDURE `sp_getdewormingschedules`()
BEGIN
    SELECT 
        d.*,
        JSON_LENGTH(d.penids) as pen_count
    FROM `dewormingschedules` d
    WHERE d.deleted = 0
    ORDER BY d.scheduledate DESC, d.scheduletime DESC;
END;
SQL;

    $pdo->exec($sp1); $pdo->exec($sp2);
    $pdo->exec($sp3); $pdo->exec($sp4);
    $pdo->exec($sp5); $pdo->exec($sp6);
    $pdo->exec($sp7); $pdo->exec($sp8);
    
    echo "Stored procedures created successfully with JSON_LENGTH compatibility.\n";

} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
?>
