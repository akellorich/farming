/*
SQLyog Ultimate v13.1.1 (32 bit)
MySQL - 10.4.32-MariaDB : Database - pos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/* Function  structure for function  `fngeneratecreditnoteno` */

/*!50003 DROP FUNCTION IF EXISTS `fngeneratecreditnoteno` */;
DELIMITER $$


/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spcheckproduct`(`$id` NUMERIC, `$valuetocheck` VARCHAR(50), `$category` VARCHAR(50))
BEGIN
	IF $category='code' THEN
		SELECT * FROM `products` WHERE `productid`<>`$id` AND `itemcode`=$valuetocheck;
	ELSE
		SELECT * FROM `products` WHERE `productid`<>$id AND `itemname`=$valuetocheck;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `spdeleteproduct` */

/*!50003 DROP PROCEDURE IF EXISTS  `spdeleteproduct` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spdeleteproduct`(`$productid` NUMERIC, `$userid` NUMERIC)
BEGIN
	UPDATE `products` SET `deleted`=1, `lastmodifiedon`=NOW(),`lastmodifiedby`=$userid WHERE `productid`=$productid;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `spfilterproductsbyname` */

/*!50003 DROP PROCEDURE IF EXISTS  `spfilterproductsbyname` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spfilterproductsbyname`(`$searchvalue` VARCHAR(50), `$posid` INT)
BEGIN
	IF $posid=0 THEN 
		SELECT p.*, c.`categoryname`, CONCAT(`firstname`,' ',`middlename`,' ',`lastname`)AS addedbyname ,sellingprice-
		IFNULL((SELECT CASE WHEN `percentage`=1 THEN (`value`/100)*`sellingprice`  ELSE `value` END FROM `customerpricematrix` cs
				WHERE cs.`customercategoryid`=2 AND cs.`itemid`=p.`productid`),0) wholesaleprice
		FROM `products` p, `categories` c, `user` u
		WHERE c.`categoryid`=p.`categoryid` AND u.id=p.addedby AND `itemname` LIKE CONCAT( '%',$searchvalue,'%') AND p.deleted=0
		and rawmaterial=0
		ORDER BY `itemname`;
	ELSE
		SELECT p.*, c.`categoryname`, CONCAT(`firstname`,' ',`middlename`,' ',`lastname`)AS addedbyname ,sellingprice-
		IFNULL((SELECT CASE WHEN `percentage`=1 THEN (`value`/100)*`sellingprice`  ELSE `value` END FROM `customerpricematrix` cs
				WHERE cs.`customercategoryid`=2 AND cs.`itemid`=p.`productid`),0) wholesaleprice
		FROM `products` p, `categories` c, `user` u
		WHERE c.`categoryid`=p.`categoryid` AND u.id=p.addedby AND `itemname` LIKE CONCAT( '%',$searchvalue,'%') AND p.deleted=0
		AND c.categoryid IN(SELECT `productcategoryid` FROM`posproductcategories` WHERE `posid`=$posid AND `deleted`=0)
		and rawmaterial=0
		ORDER BY `itemname`;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `spgetproductdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `spgetproductdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetproductdetails`(`$itemcode` VARCHAR(50), `$customerid` NUMERIC, `$storeid` INT)
BEGIN
		IF $storeid=0 THEN
			IF $customerid=0 THEN
				SELECT p.*, `fn_getitemstorebalance`(p.productid ,$storeid)itembalance,0 AS discount  
				FROM `products` p 
				WHERE `itemcode`=$itemcode AND p.deleted=0;
				-- AND `categoryid` IN(SELECT `productcategoryid` FROM `posproductcategories` WHERE `posid`=$storeid AND `deleted`=0);
			ELSE
				SELECT p.*,  `fn_getitemstorebalance`(p.productid ,$storeid)itembalance,
				IFNULL((SELECT CASE WHEN `percentage`=1 THEN (`value`/100)*`sellingprice` ELSE `value` END 
				FROM customercategories r INNER JOIN  customerpricematrix m ON m.`customercategoryid`=r.`id` 
				INNER JOIN `customers` c ON c.`catid`=r.`id` WHERE p.`productid`=m.`itemid` AND c.`customerid`=$customerid)
				,IFNULL((SELECT CASE WHEN percentage=1 THEN (`discount`/100)*`sellingprice` ELSE `discount` END FROM `customerdiscountsettings` cs
				WHERE cs.`customerid`=$customerid AND cs.`productid`=p.`productid` AND IFNULL(`deleted`,0)=0 -- AND DATE_FORMAT(`expirydate`,'%d-%b-%Y')>=DATE_FORMAT(NOW(),'%d-%b-%Y') 
				ORDER BY `expirydate` DESC LIMIT 1),0)) AS discount 
				FROM products p WHERE p.`itemcode`=$itemcode AND p.deleted=0;
				-- and `categoryid` in(select `productcategoryid` from `posproductcategories` where `posid`=$storeid and `deleted`=0);
			END IF;
		ELSE
			IF $customerid=0 THEN
				SELECT p.*, `fn_getitemstorebalance`(p.productid ,$storeid)itembalance,0 AS discount  
				FROM `products` p 
				WHERE `itemcode`=$itemcode AND p.deleted=0
				AND `categoryid` IN(SELECT `productcategoryid` FROM `posproductcategories` WHERE `posid`=$storeid AND `deleted`=0);
			ELSE
				SELECT p.*,  `fn_getitemstorebalance`(p.productid ,$storeid)itembalance,
				IFNULL((SELECT CASE WHEN `percentage`=1 THEN (`value`/100)*`sellingprice` ELSE `value` END 
				FROM customercategories r INNER JOIN  customerpricematrix m ON m.`customercategoryid`=r.`id` 
				INNER JOIN `customers` c ON c.`catid`=r.`id` WHERE p.`productid`=m.`itemid` AND c.`customerid`=$customerid)
				,IFNULL((SELECT CASE WHEN percentage=1 THEN (`discount`/100)*`sellingprice` ELSE `discount` END FROM `customerdiscountsettings` cs
				WHERE cs.`customerid`=$customerid AND cs.`productid`=p.`productid` AND IFNULL(`deleted`,0)=0 -- AND DATE_FORMAT(`expirydate`,'%d-%b-%Y')>=DATE_FORMAT(NOW(),'%d-%b-%Y') 
				ORDER BY `expirydate` DESC LIMIT 1),0)) AS discount 
				FROM products p WHERE p.`itemcode`=$itemcode AND p.deleted=0
				AND `categoryid` IN(SELECT `productcategoryid` FROM `posproductcategories` WHERE `posid`=$storeid AND `deleted`=0);
			END IF;
		END IF;
		
	END */$$
DELIMITER ;

/* Procedure structure for procedure `spsaveproduct` */

/*!50003 DROP PROCEDURE IF EXISTS  `spsaveproduct` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsaveproduct`(`$id` NUMERIC, `$itemcode` VARCHAR(50), `$itemname` VARCHAR(50), `$categoryid` NUMERIC, `$uom` VARCHAR(50), `$buyingprice` DECIMAL(18,2), `$sellingprice` DECIMAL(18,2), `$reorderlevel` NUMERIC, `$userid` NUMERIC, `$refno` VARCHAR(50), `$generateitemcode` BOOL, `$canserialize` BOOL, `$bundleitem` BOOLEAN, `$taxtypeid` INT, `$itemlength` DECIMAL(18,2), `$itemwidth` DECIMAL(18,2), `$itemheight` DECIMAL(18,2), `$allownegativesales` BOOL, `$saleby` VARCHAR(50), `$bundleproduct` INT, `$allowreturnexchange` BOOL)
BEGIN
	DECLARE $generatedid NUMERIC;
	-- SET @taxrate=(select taxrate from `taxtypes` where `id`=$taxtypeid);
	START TRANSACTION;
		
		IF $id=0 THEN 
			-- Check if we are generating item code
			IF $generateitemcode=1 THEN
				-- Generate Item code
				SET $itemcode=(SELECT fngenerateproductcode($categoryid));
				-- Increment Counter
				UPDATE `categories` SET `currentno`=`currentno`+1 WHERE `categoryid`=$categoryid;
			END IF;
			INSERT INTO `products`(`itemcode`,`itemname`,`unitofmeasure`,`buyingprice`,`sellingprice`,`categoryid`,`dateadded`,`addedby`,`deleted`,`reorderlevel`,`serializable`,
				`bundleitem`,`taxtypeid`,`length`,`width`,`height`,`allownegativesales`,`saleby`,`bundledproduct`,`allowreturnexchange`)
			VALUES($itemcode,$itemname,$uom,$buyingprice,$sellingprice,$categoryid,NOW(),$userid,0,$reorderlevel,$canserialize,
				$bundleitem,$taxtypeid,$itemlength,$itemwidth,$itemheight,$allownegativesales,$saleby,$bundleproduct,$allowreturnexchange);
			SET $id=(SELECT MAX(`productid`) FROM `products`);
		ELSE
			UPDATE `products` SET `itemcode`=$itemcode,`itemname`=$itemname,`unitofmeasure`=$uom,`buyingprice`=$buyingprice,`sellingprice`=$sellingprice,
			`categoryid`=$categoryid,`reorderlevel`=$reorderlevel ,`lastmodifiedon`=NOW(),`lastmodifiedby`=$userid , `serializable`=$canserialize, 
			`bundleitem`=$bundleitem,`taxtypeid`=$taxtypeid,`length`=$itemlength,`width`=$itemwidth,`height`=$itemheight,`allownegativesales`=$allownegativesales,
			`saleby`=$saleby,`bundledproduct`=$bundleproduct,`allowreturnexchange`=$allowreturnexchange
			WHERE `productid`=$id;
		END IF;
		-- delete existing price matrix
		DELETE FROM `customerpricematrix` WHERE `itemid`=$id;
		
		-- insert price matrix
		INSERT INTO `customerpricematrix`(`itemid`,`customercategoryid`,`percentage`,`value`)
		SELECT $id,`catid`,`percentage`,`value` FROM `temppricematrix` WHERE `refno`=$refno;
		
		-- delete the temporary price matrix data 
		DELETE FROM `temppricematrix` WHERE `refno`=$refno;
		
	COMMIT;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
