-- PRODUCTION CRUD OPERATIONS FOR JUKAM DAIRY MANAGEMENT SYSTEM

DELIMITER $$

/* Save Milk Collection Record */
DROP PROCEDURE IF EXISTS `sp_savemilkcollection`$$
CREATE PROCEDURE `sp_savemilkcollection`(
    IN `$id` INT,
    IN `$logdate` DATE,
    IN `$scheduleid` INT,
    IN `$animalid` INT,
    IN `$quantitylitres` DECIMAL(10, 2),
    IN `$milkdensity` DECIMAL(5, 4),
    IN `$narration` TEXT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        INSERT INTO `milkcollection` (
            `logdate`, `scheduleid`, `animalid`, `quantitylitres`, `milkdensity`, `narration`, `addedby`
        )
        VALUES (
            `$logdate`, `$scheduleid`, `$animalid`, `$quantitylitres`, `$milkdensity`, `$narration`, `$userid`
        );
        SET `$id` = LAST_INSERT_ID();
    ELSE
        UPDATE `milkcollection`
        SET `logdate` = `$logdate`,
            `scheduleid` = `$scheduleid`,
            `animalid` = `$animalid`,
            `quantitylitres` = `$quantitylitres`,
            `milkdensity` = `$milkdensity`,
            `narration` = `$narration`,
            `updatedby` = `$userid`,
            `lastupdated` = NOW()
        WHERE `id` = `$id`;
    END IF;
    
    COMMIT;
    SELECT `$id` AS `collectionid`;
END$$

/* Get Milk Collection Records */
DROP PROCEDURE IF EXISTS `sp_getmilkcollection`$$
CREATE PROCEDURE `sp_getmilkcollection`(
    IN `$startdate` DATE,
    IN `$enddate` DATE,
    IN `$scheduleid` INT
)
BEGIN
    SELECT 
        mc.*,
        a.`tagid`,
        a.`designatedname`,
        ms.`schedulename` AS `shiftname`,
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `collectorname`,
        u.`profilephoto`
    FROM `milkcollection` mc
    LEFT JOIN `animals` a ON mc.`animalid` = a.`id`
    LEFT JOIN `milkingschedules` ms ON mc.`scheduleid` = ms.`id`
    LEFT JOIN `user` u ON mc.`addedby` = u.`userid`
    WHERE mc.`deleted` = 0
    AND mc.`logdate` BETWEEN `$startdate` AND `$enddate`
    AND (mc.`scheduleid` = `$scheduleid` OR `$scheduleid` = 0)
    ORDER BY mc.`logdate` DESC, mc.`dateadded` DESC;
END$$

/* Get Production Stats for Summary Cards */
DROP PROCEDURE IF EXISTS `sp_getproductionstats`$$
CREATE PROCEDURE `sp_getproductionstats`(
    IN `$logdate` DATE
)
BEGIN
    DECLARE `$yesterday` DATE;
    SET `$yesterday` = DATE_SUB(`$logdate`, INTERVAL 1 DAY);

    SELECT 
        COALESCE(SUM(CASE WHEN `logdate` = `$logdate` THEN `quantitylitres` ELSE 0 END), 0) AS `totalyield`,
        COALESCE(SUM(CASE WHEN `logdate` = `$yesterday` THEN `quantitylitres` ELSE 0 END), 0) AS `yesterdayyield`,
        COUNT(DISTINCT CASE WHEN `logdate` = `$logdate` THEN `animalid` ELSE NULL END) AS `cowsmilked`,
        COALESCE(AVG(CASE WHEN `logdate` = `$logdate` THEN `quantitylitres` ELSE NULL END), 0) AS `avgyield`,
        COALESCE(AVG(CASE WHEN `logdate` = `$logdate` THEN `milkdensity` ELSE NULL END), 0) AS `avgdensity`,
        (SELECT COUNT(*) FROM `animals` WHERE `status` = 'Lactating' AND `deleted` = 0) AS `totalherd`
    FROM `milkcollection`
    WHERE `deleted` = 0 AND (`logdate` = `$logdate` OR `logdate` = `$yesterday`);
END$$

/* Get Daily Production for Chart (Last 7 Days) */
DROP PROCEDURE IF EXISTS `sp_getproductiontrends`$$
CREATE PROCEDURE `sp_getproductiontrends`(
    IN `$enddate` DATE
)
BEGIN
    SELECT 
        d.`date`,
        COALESCE(SUM(mc.`quantitylitres`), 0) AS `totalyield`,
        COALESCE(AVG(mc.`milkdensity`), 0) AS `avgdensity`
    FROM (
        SELECT `$enddate` AS `date` UNION ALL
        SELECT DATE_SUB(`$enddate`, INTERVAL 1 DAY) UNION ALL
        SELECT DATE_SUB(`$enddate`, INTERVAL 2 DAY) UNION ALL
        SELECT DATE_SUB(`$enddate`, INTERVAL 3 DAY) UNION ALL
        SELECT DATE_SUB(`$enddate`, INTERVAL 4 DAY) UNION ALL
        SELECT DATE_SUB(`$enddate`, INTERVAL 5 DAY) UNION ALL
        SELECT DATE_SUB(`$enddate`, INTERVAL 6 DAY)
    ) d
    LEFT JOIN `milkcollection` mc ON d.`date` = mc.`logdate` AND mc.`deleted` = 0
    GROUP BY d.`date`
    ORDER BY d.`date` ASC;
END$$

/* Get All Milking Schedules */
DROP PROCEDURE IF EXISTS `sp_getmilkingschedules`$$
CREATE PROCEDURE `sp_getmilkingschedules`()
BEGIN
    SELECT `id`, `schedulename`, `starttime` FROM `milkingschedules` WHERE `deleted` = 0 ORDER BY `starttime` ASC;
END$$

DELIMITER ;
