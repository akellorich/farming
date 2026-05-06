DELIMITER $$

DROP PROCEDURE IF EXISTS `sp_getanimalsbypen`$$

CREATE PROCEDURE `sp_getanimalsbypen`(
    IN `$penid` INT
)
BEGIN
    SELECT 
        a.`id`, 
        a.`tagid`, 
        a.`designatedname`, 
        b.`breedname`
    FROM `animals` a
    LEFT JOIN `breeds` b ON a.`breedid` = b.`id`
    WHERE a.`penid` = `$penid` AND a.`deleted` = 0
    ORDER BY a.`tagid`;
END$$

DELIMITER ;
