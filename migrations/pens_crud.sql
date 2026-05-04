DELIMITER $$

/* Check if pen exists */
DROP PROCEDURE IF EXISTS `sp_checkifpenexists`$$
CREATE PROCEDURE `sp_checkifpenexists`(
    IN `$id` INT,
    IN `$penname` VARCHAR(100)
)
BEGIN
    SELECT 1 FROM `pens` WHERE `penname` = `$penname` AND `id` <> `$id` AND `deleted` = 0;
END$$

/* Save Pen */
DROP PROCEDURE IF EXISTS `sp_savepen`$$
CREATE PROCEDURE `sp_savepen`(
    IN `$id` INT,
    IN `$penname` VARCHAR(100),
    IN `$pentype` VARCHAR(50),
    IN `$capacity` INT,
    IN `$locationcluster` VARCHAR(255),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    IF `$id` = 0 THEN
        INSERT INTO `pens` (`penname`, `pentype`, `capacity`, `locationcluster`, `addedby`)
        VALUES (`$penname`, `$pentype`, `$capacity`, `$locationcluster`, `$userid`);
    ELSE
        UPDATE `pens` 
        SET `penname` = `$penname`, 
            `pentype` = `$pentype`, 
            `capacity` = `$capacity`, 
            `locationcluster` = `$locationcluster`
        WHERE `id` = `$id`;
    END IF;
END$$

/* Get Pens */
DROP PROCEDURE IF EXISTS `sp_getpens`$$
CREATE PROCEDURE `sp_getpens`()
BEGIN
    SELECT 
        p.*,
        (SELECT COUNT(*) FROM `animals` a WHERE a.`penid` = p.`id` AND a.`deleted` = 0) as current_occupancy
    FROM `pens` p
    WHERE p.`deleted` = 0;
END$$

DELIMITER ;
