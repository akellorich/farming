USE `farm`;
/*
SQLyog Ultimate v13.1.1 (32 bit)
MySQL - 10.4.32-MariaDB : Database - farm
*********************************************************************


/*!40101 SET NAMES utf8 ;

/*!40101 SET SQL_MODE='';

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 ;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 ;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' ;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 ;
CREATE DATABASE /*!32312 IF NOT EXISTS`farm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci ;

USE `farm`;

/* Function  structure for function  `fn_generateanimaltag` 

 DROP FUNCTION IF EXISTS `fn_generateanimaltag` ;
DELIMITER $$

 CREATE DEFINER=`root`@`localhost` FUNCTION `fngenerateanimaltag`() RETURNS varchar(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    READS SQL DATA
BEGIN
    DECLARE $prefix VARCHAR(50);
    DECLARE $currentno INT;
    DECLARE $formatted_no VARCHAR(50);
    DECLARE $year VARCHAR(4);
    DECLARE $final_prefix VARCHAR(50);

    SELECT `prefix`, `currentno` INTO $prefix, $currentno 
    FROM `serials` WHERE `document` = 'Animal Tag';
    
    SET $year = YEAR(CURDATE());
    SET $final_prefix = REPLACE($prefix, '{{year}}', $year);

    SET $formatted_no = LPAD($currentno, 5, '0');
    
    RETURN CONCAT($final_prefix, $formatted_no);
END $$
DELIMITER ;

/* Function  structure for function  `fngeneratesupplierno` 

 DROP FUNCTION IF EXISTS `fngeneratesupplierno` ;
DELIMITER $$

 CREATE DEFINER=`root`@`localhost` FUNCTION `fngeneratesupplierno`() RETURNS varchar(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci
    READS SQL DATA
BEGIN
    DECLARE $prefix VARCHAR(50);
    DECLARE $currentno INT;
    DECLARE $formatted_no VARCHAR(50);
    DECLARE $year VARCHAR(4);
    DECLARE $final_prefix VARCHAR(50);

    SELECT `prefix`, `currentno` INTO $prefix, $currentno 
    FROM `serials` WHERE `document` = 'Supplier';
    
    SET $year = YEAR(CURDATE());
    SET $final_prefix = REPLACE($prefix, '{{year}}', $year);

    SET $formatted_no = LPAD($currentno, 4, '0');
    
    RETURN CONCAT($final_prefix, $formatted_no);
END $$
DELIMITER ;

/* Procedure structure for procedure `spcheckifbreedexists` 

 DROP PROCEDURE IF EXISTS  `spcheckifbreedexists` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spcheckifbreedexists`(
    IN `$id` INT, 
    IN `$breedname` VARCHAR(100)
)
BEGIN
    SELECT * FROM `breeds` 
    WHERE `id` <> `$id` 
    AND `breedname` = `$breedname` 
    AND `deleted` = 0;
END $$
DELIMITER ;

/* Procedure structure for procedure `spdeletebreed` 

 DROP PROCEDURE IF EXISTS  `spdeletebreed` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spdeletebreed`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$reason` TEXT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$breedname` VARCHAR(100);
    
    START TRANSACTION;
    
    -- Get breed name for the audit narration
    SELECT `breedname` INTO `$breedname` FROM `breeds` WHERE `id` = `$id`;
    
    -- Soft delete the record
    UPDATE `breeds` 
    SET `deleted` = 1, 
        `deletedby` = `$userid`, 
        `datedeleted` = NOW(), 
        `reasondeleted` = `$reason`
    WHERE `id` = `$id`;
    
    -- Audit Trail for Delete
    INSERT INTO `audittrail` (
        `timestamp`, 
        `userid`, 
        `operation`, 
        `narration`, 
        `platform`
    )
    VALUES (
        NOW(), 
        `$userid`, 
        'Delete', 
        CONCAT('Soft deleted breed: ', IFNULL(`$breedname`, 'Unknown'), '. Reason: ', `$reason`), 
        `$platform`
    );
    
    COMMIT;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetbreeddetails` 

 DROP PROCEDURE IF EXISTS  `spgetbreeddetails` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetbreeddetails`(
    IN `$id` INT
)
BEGIN
    SELECT 
        b.*, 
        c.`countryname`, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`
    FROM `breeds` b
    LEFT JOIN `countries` c ON b.`originid` = c.`id`
    LEFT JOIN `user` u ON b.`addedby` = u.`userid`
    WHERE b.`id` = `$id` 
    AND b.`deleted` = 0;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetbreeds` 

 DROP PROCEDURE IF EXISTS  `spgetbreeds` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetbreeds`()
BEGIN
    SELECT 
        b.*, 
        c.`countryname`, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`
    FROM `breeds` b
    LEFT JOIN `countries` c ON b.`originid` = c.`id`
    LEFT JOIN `user` u ON b.`addedby` = u.`userid`
    WHERE b.`deleted` = 0
    ORDER BY b.`breedname`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetrolesforuserassignment` 

 DROP PROCEDURE IF EXISTS  `spgetrolesforuserassignment` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetrolesforuserassignment`()
BEGIN
	select `roleid`,`rolename` from `roles` order by `rolename`;
    END $$
DELIMITER ;

/* Procedure structure for procedure `spgetroleusers` 

 DROP PROCEDURE IF EXISTS  `spgetroleusers` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetroleusers`(`$roleid` INT)
BEGIN
	select r.`userid`, `username`,`firstname`,`middlename`,`lastname` from `roleusers` r, `user` u
	where r.`userid`=u.`id` and `roleid`=$roleid
	order by `firstname`,`middlename`,`lastname`;
    END $$
DELIMITER ;

/* Procedure structure for procedure `spgetuserroles` 

 DROP PROCEDURE IF EXISTS  `spgetuserroles` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetuserroles`(`$userid` INT)
BEGIN
	select r.* from `roles` r, `roleusers` u
	where r.`roleid`=u.`roleid` and `userid`=$userid
	and ifnull(u.`deleted`,0)=0
	order by `rolename`;
    END $$
DELIMITER ;

/* Procedure structure for procedure `spsavebreed` 

 DROP PROCEDURE IF EXISTS  `spsavebreed` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsavebreed`(
    IN `$id` INT,
    IN `$breedname` VARCHAR(100),
    IN `$originid` INT,
    IN `$characteristics` TEXT,
    IN `$isindigenous` TINYINT(1),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        -- Insert new breed
        INSERT INTO `breeds` (
            `breedname`, 
            `originid`, 
            `characteristics`, 
            `isindigenous`, 
            `addedby`, 
            `dateadded`, 
            `deleted`
        )
        VALUES (
            `$breedname`, 
            `$originid`, 
            `$characteristics`, 
            `$isindigenous`, 
            `$userid`, 
            NOW(), 
            0
        );
        
        SET `$id` = LAST_INSERT_ID();
        
        -- Audit Trail for Insert
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, 
            ',"breedname":"', `$breedname`, 
            '","originid":', IFNULL(`$originid`, 'null'), 
            ',"isindigenous":', `$isindigenous`, 
            '}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, 
            `userid`, 
            `operation`, 
            `narration`, 
            `platform`, 
            `updatedvalues`
        )
        VALUES (
            NOW(), 
            `$userid`, 
            'Insert', 
            CONCAT('Created new breed: ', `$breedname`), 
            `$platform`, 
            `$updatedvalues`
        );
    ELSE
        -- Capture original values for audit trail before update
        SELECT CONCAT(
            '{"id":', `id`, 
            ',"breedname":"', `breedname`, 
            '","originid":', IFNULL(`originid`, 'null'), 
            ',"isindigenous":', `isindigenous`, 
            '}'
        ) INTO `$originalvalues`
        FROM `breeds` 
        WHERE `id` = `$id`;
        
        -- Update existing breed
        UPDATE `breeds` 
        SET `breedname` = `$breedname`, 
            `originid` = `$originid`, 
            `characteristics` = `$characteristics`, 
            `isindigenous` = `$isindigenous`
        WHERE `id` = `$id`;
        
        -- Audit Trail for Update
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, 
            ',"breedname":"', `$breedname`, 
            '","originid":', IFNULL(`$originid`, 'null'), 
            ',"isindigenous":', `$isindigenous`, 
            '}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, 
            `userid`, 
            `operation`, 
            `narration`, 
            `platform`, 
            `originalvalues`, 
            `updatedvalues`
        )
        VALUES (
            NOW(), 
            `$userid`, 
            'Update', 
            CONCAT('Updated breed: ', `$breedname`), 
            `$platform`, 
            `$originalvalues`, 
            `$updatedvalues`
        );
    END IF;
    
    COMMIT;
    
    -- Return the ID of the saved breed
    SELECT `$id` AS `breedid`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spchangeuserpassword` 

 DROP PROCEDURE IF EXISTS  `spchangeuserpassword` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spchangeuserpassword`($id numeric, $userpassword varchar(100),$salt varchar(50),$changepasswordonlogon bool)
BEGIN
	update `user` 
	set `password`=$userpassword, `salt`=$salt,`changepasswordonlogon`=$changepasswordonlogon 
	where `userid`=$id;
    END $$
DELIMITER ;

/* Procedure structure for procedure `spcheckanimaldetails` 

 DROP PROCEDURE IF EXISTS  `spcheckanimaldetails` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spcheckanimaldetails`(
    IN `$id` INT,
    IN `$checkfield` VARCHAR(50),
    IN `$checkvalue` VARCHAR(100)
)
BEGIN
    IF `$checkfield` = 'tagid' THEN
        SELECT * FROM `animals` 
        WHERE `id` <> `$id` AND `tagid` = `$checkvalue` AND `deleted` = 0;
    ELSEIF `$checkfield` = 'designatedname' THEN
        SELECT * FROM `animals` 
        WHERE `id` <> `$id` AND `designatedname` = `$checkvalue` AND `designatedname` <> '' AND `deleted` = 0;
    END IF;
END $$
DELIMITER ;

/* Procedure structure for procedure `spcheckifanimalexists` 

 DROP PROCEDURE IF EXISTS  `spcheckifanimalexists` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spcheckifanimalexists`(
    IN `$id` INT, 
    IN `$tagid` VARCHAR(50),
    IN `$designatedname` VARCHAR(100)
)
BEGIN
    SELECT * FROM `animals` 
    WHERE `id` <> `$id` 
    AND (`tagid` = `$tagid` OR (`designatedname` = `$designatedname` AND `$designatedname` <> ''))
    AND `deleted` = 0;
END $$
DELIMITER ;

/* Procedure structure for procedure `spcheckifbreedexists` 

 DROP PROCEDURE IF EXISTS  `spcheckifbreedexists` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spcheckifbreedexists`(
    IN `$id` INT, 
    IN `$breedname` VARCHAR(100)
)
BEGIN
    SELECT * FROM `breeds` 
    WHERE `id` <> `$id` 
    AND `breedname` = `$breedname` 
    AND `deleted` = 0;
END $$
DELIMITER ;

/* Procedure structure for procedure `spcheckifcountryexists` 

 DROP PROCEDURE IF EXISTS  `spcheckifcountryexists` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spcheckifcountryexists`(
    IN `$id` INT, 
    IN `$countryname` VARCHAR(100)
)
BEGIN
    SELECT * FROM `countries` 
    WHERE `id` <> `$id` 
    AND `countryname` = `$countryname` 
    AND `deleted` = 0;
END $$
DELIMITER ;

/* Procedure structure for procedure `spcheckifdiseaseexists` 

 DROP PROCEDURE IF EXISTS  `spcheckifdiseaseexists` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spcheckifdiseaseexists`(
    IN `$id` INT, 
    IN `$diseasename` VARCHAR(100)
)
BEGIN
    SELECT * FROM `diseases` 
    WHERE `id` <> `$id` 
    AND `diseasename` = `$diseasename` 
    AND `deleted` = 0;
END $$
DELIMITER ;

/* Procedure structure for procedure `spcheckifemployeeisystemuser` 

 DROP PROCEDURE IF EXISTS  `spcheckifemployeeisystemuser` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spcheckifemployeeisystemuser`($staffno varchar(100))
BEGIN
		select employeeid into @employeeid from `employeerecords` where `staffno`=$staffno;
		select * from `user` where `employeeid`=@employeeid;
	END $$
DELIMITER ;

/* Procedure structure for procedure `spcheckifpenexists` 

 DROP PROCEDURE IF EXISTS  `spcheckifpenexists` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spcheckifpenexists`(
    IN `$id` INT,
    IN `$penname` VARCHAR(100)
)
BEGIN
    SELECT 1 FROM `pens` WHERE `penname` = `$penname` AND `id` <> `$id` AND `deleted` = 0;
END $$
DELIMITER ;

/* Procedure structure for procedure `spcheckuser` 

 DROP PROCEDURE IF EXISTS  `spcheckuser` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spcheckuser`(`$userid` INT, `$checkfield` VARCHAR(50), `$checkvalue` VARCHAR(50))
BEGIN
	if $checkfield='username' then 
		select * from `user` where `userid`<>$userid and `username`=$checkvalue;
	elseif $checkfield='email' then 
		select * from `user` where `userid`<>$userid AND `email`=$checkvalue;
	elseif $checkfield='mobile' then 
		SELECT * FROM `user` WHERE `userid`<>$userid AND `mobile`=$checkvalue;
	end if;
    END $$
DELIMITER ;

/* Procedure structure for procedure `spcheckuserovertimeapprovalprivilege` 

 DROP PROCEDURE IF EXISTS  `spcheckuserovertimeapprovalprivilege` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spcheckuserovertimeapprovalprivilege`($userid int,$levelid int,$unitid int)
BEGIN
		select * from `overtimeapprovalusers`
		where `levelid`=$levelid and `unitid`=$unitid and `userid`=$userid and `allowed`=1;
	END $$
DELIMITER ;

/* Procedure structure for procedure `spcreateemployeeuseraccount` 

 DROP PROCEDURE IF EXISTS  `spcreateemployeeuseraccount` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spcreateemployeeuseraccount`($staffno varchar(50),$mobile varchar(50),$emailaddress varchar(50),$salt varchar(50),
	$userpassword varchar(100),$emailactivationcode varchar(50),$phoneactivationcode varchar(50),
	$userid int,$platform varchar(50))
BEGIN
		declare $firstname varchar(50);
		declare $middlename varchar(50);
		declare $lastname varchar(50);
		
		select `firstname`,`middlename`,`lastname` 
		into $firstname,$middlename,$lastname
		from  `employeerecords` where `staffno`=$staffno;
		
		start transaction;		
			if not exists(select * from `user` where `username`=$staffno) then 
				-- Create user account for employee
				insert into `user`(`category`,`username`,`firstname`,`middlename`,`lastname`,`email`,`mobile`,`password`,`salt`,
				`emailactivationcode`,`phoneactivationcode`,`dateadded`,`addedby`)
				values('employee',$staffno,$firstname,$middlename,$lastname,$emailaddress,$mobile,$userpassword,$salt,
				$emailactivationcode,$phoneactivationcode,now(),$userid);
				
				-- Update mobile and email addresses
				update `employeerecords`
				set `mobile`=$mobile,`emailaddress`=$emailaddress
				where `staffno`=$staffno;
				
				-- Add audit trails for the same
				select concat('Created ESS portal access account for  staff: ',$staffno,' names:',$firstname,' ',$middlename,' ',$lastname)
				into @narration;
				CALL `spsaveaudittrailentry`($userid,'insert',@narration,$platform,'','',NULL);
				
				SELECT CONCAT('Updated concat details for  staff: ',$staffno,' names:',$firstname,' ',$middlename,' ',$lastname)
				INTO @narration;
				CALL `spsaveaudittrailentry`($userid,'update',@narration,$platform,'','',NULL);
			end if;
		commit;
	END $$
DELIMITER ;

/* Procedure structure for procedure `spdeleteanimal` 

 DROP PROCEDURE IF EXISTS  `spdeleteanimal` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spdeleteanimal`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$reason` TEXT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$tagid` VARCHAR(50);
    
    START TRANSACTION;
    
    -- Get tagid for the audit narration
    SELECT `tagid` INTO `$tagid` FROM `animals` WHERE `id` = `$id`;
    
    -- Soft delete the record
    UPDATE `animals` 
    SET `deleted` = 1, 
        `deletedby` = `$userid`, 
        `datedeleted` = NOW(), 
        `reasondeleted` = `$reason`
    WHERE `id` = `$id`;
    
    -- Audit Trail for Delete
    INSERT INTO `audittrail` (
        `timestamp`, 
        `userid`, 
        `operation`, 
        `narration`, 
        `platform`
    )
    VALUES (
        NOW(), 
        `$userid`, 
        'Delete', 
        CONCAT('Soft deleted animal: ', IFNULL(`$tagid`, 'Unknown'), '. Reason: ', `$reason`), 
        `$platform`
    );
    
    COMMIT;
END $$
DELIMITER ;

/* Procedure structure for procedure `spdeletebreed` 

 DROP PROCEDURE IF EXISTS  `spdeletebreed` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spdeletebreed`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$reason` TEXT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$breedname` VARCHAR(100);
    
    START TRANSACTION;
    
    -- Get breed name for the audit narration
    SELECT `breedname` INTO `$breedname` FROM `breeds` WHERE `id` = `$id`;
    
    -- Soft delete the record
    UPDATE `breeds` 
    SET `deleted` = 1, 
        `deletedby` = `$userid`, 
        `datedeleted` = NOW(), 
        `reasondeleted` = `$reason`
    WHERE `id` = `$id`;
    
    -- Audit Trail for Delete
    INSERT INTO `audittrail` (
        `timestamp`, 
        `userid`, 
        `operation`, 
        `narration`, 
        `platform`
    )
    VALUES (
        NOW(), 
        `$userid`, 
        'Delete', 
        CONCAT('Soft deleted breed: ', IFNULL(`$breedname`, 'Unknown'), '. Reason: ', `$reason`), 
        `$platform`
    );
    
    COMMIT;
END $$
DELIMITER ;

/* Procedure structure for procedure `spdeletecountry` 

 DROP PROCEDURE IF EXISTS  `spdeletecountry` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spdeletecountry`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$reason` TEXT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$countryname` VARCHAR(100);
    
    START TRANSACTION;
    SELECT `countryname` INTO `$countryname` FROM `countries` WHERE `id` = `$id`;
    
    UPDATE `countries` 
    SET `deleted` = 1, `deletedby` = `$userid`, `datedeleted` = NOW(), `reasondeleted` = `$reason`
    WHERE `id` = `$id`;
    
    INSERT INTO `audittrail` (
        `timestamp`, `userid`, `operation`, `narration`, `platform`
    )
    VALUES (
        NOW(), `$userid`, 'Delete', CONCAT('Soft deleted country: ', IFNULL(`$countryname`, 'Unknown'), '. Reason: ', `$reason`), `$platform`
    );
    
    COMMIT;
END $$
DELIMITER ;

/* Procedure structure for procedure `spdeletedisease` 

 DROP PROCEDURE IF EXISTS  `spdeletedisease` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spdeletedisease`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$reason` TEXT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$diseasename` VARCHAR(100);
    
    START TRANSACTION;
    SELECT `diseasename` INTO `$diseasename` FROM `diseases` WHERE `id` = `$id`;
    
    UPDATE `diseases` 
    SET `deleted` = 1, `deletedby` = `$userid`, `datedeleted` = NOW(), `reasondeleted` = `$reason`
    WHERE `id` = `$id`;
    
    INSERT INTO `audittrail` (
        `timestamp`, `userid`, `operation`, `narration`, `platform`
    )
    VALUES (
        NOW(), `$userid`, 'Delete', CONCAT('Soft deleted disease: ', IFNULL(`$diseasename`, 'Unknown'), '. Reason: ', `$reason`), `$platform`
    );
    
    COMMIT;
END $$
DELIMITER ;

/* Procedure structure for procedure `spdeleteinventorycategory` 

 DROP PROCEDURE IF EXISTS  `spdeleteinventorycategory` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spdeleteinventorycategory`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$categoryname` VARCHAR(255);
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    SELECT `categoryname`, JSON_OBJECT('id', `id`, 'categoryname', `categoryname`) INTO `$categoryname`, `$originalvalues`
    FROM `inventorycategories` WHERE `id` = `$id`;
    
    UPDATE `inventorycategories`
    SET `deleted` = 1,
        `deletedby` = `$userid`,
        `datedeleted` = NOW()
    WHERE `id` = `$id`;
    
    INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`)
    VALUES (NOW(), `$userid`, 'Delete', CONCAT('Deleted Inventory Category: ', `$categoryname`), `$platform`, `$originalvalues`);
    
    COMMIT;
    SELECT 1 AS `success`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spdeleteinventoryitem` 

 DROP PROCEDURE IF EXISTS  `spdeleteinventoryitem` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spdeleteinventoryitem`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$itemname` VARCHAR(255);
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    SELECT `itemname`, JSON_OBJECT('id', `id`, 'itemname', `itemname`) INTO `$itemname`, `$originalvalues`
    FROM `inventoryitems` WHERE `id` = `$id`;
    
    UPDATE `inventoryitems`
    SET `deleted` = 1,
        `deletedby` = `$userid`,
        `datedeleted` = NOW()
    WHERE `id` = `$id`;
    
    INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`)
    VALUES (NOW(), `$userid`, 'Delete', CONCAT('Deleted Inventory Item: ', `$itemname`), `$platform`, `$originalvalues`);
    
    COMMIT;
    SELECT 1 AS `success`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spdeleteinventoryreceipt` 

 DROP PROCEDURE IF EXISTS  `spdeleteinventoryreceipt` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spdeleteinventoryreceipt`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$receiptno` VARCHAR(50);
    
    START TRANSACTION;
    
    SELECT `receiptno` INTO `$receiptno` FROM `inventoryreceipts` WHERE `id` = `$id`;
    
    UPDATE `inventoryreceipts`
    SET `deleted` = 1,
        `deletedby` = `$userid`,
        `datedeleted` = NOW()
    WHERE `id` = `$id`;
    
    INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`)
    VALUES (NOW(), `$userid`, 'Delete', CONCAT('Deleted Inventory Receipt: ', `$receiptno`), `$platform`);
    
    COMMIT;
    SELECT 1 AS `success`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spdeletesupplier` 

 DROP PROCEDURE IF EXISTS  `spdeletesupplier` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spdeletesupplier`(
    IN `$id` INT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$name` VARCHAR(255);
    
    START TRANSACTION;
    
    SELECT `suppliername` INTO `$name` FROM `suppliers` WHERE `id` = `$id`;
    
    UPDATE `suppliers`
    SET `deleted` = 1,
        `deletedby` = `$userid`,
        `datedeleted` = NOW()
    WHERE `id` = `$id`;
    
    INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`)
    VALUES (NOW(), `$userid`, 'Delete', CONCAT('Deleted Supplier: ', `$name`), `$platform`);
    
    COMMIT;
    SELECT 1 AS `success`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spdeleteuser` 

 DROP PROCEDURE IF EXISTS  `spdeleteuser` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spdeleteuser`(`$id` INT, `$userid` INT)
BEGIN
	update `user` set `accountactive`=0,`lastmodifiedon`=now(),`lastmodifiedby`=$userid, `reasoninactive`='Account deleted'
	where `id`=$id;
    END $$
DELIMITER ;

/* Procedure structure for procedure `spdisableuseraccount` 

 DROP PROCEDURE IF EXISTS  `spdisableuseraccount` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spdisableuseraccount`(`$id` INT, `$reason` VARCHAR(500), `$userid` INT,$platform varchar(1000))
BEGIN
		
		DECLARE $username VARCHAR(100);
		DECLARE $fullname VARCHAR(100);
		
		SELECT username, CONCAT(firstname,' ',middlename,' ',lastname) INTO $username
		FROM `user` WHERE userid=$id;
		
		update `user` 
		set `accountactive`=0,`reasoninactive`=$reason,`lastmodifiedby`=$userid,`lastmodifiedon`=now()
		where `id`=$id;
		
		-- Add Audit trail to capture the same
		SELECT CONCAT('Disabled account for user id:',$userid,' username:',$username,' fullname:',$fullname,' reason:',$reason)
		INTO @narration;
		
		CALL `spsaveaudittrailentry`($userid,'Update',@narration,$platform,'','',NULL);
	END $$
DELIMITER ;

/* Procedure structure for procedure `spenableuseraccount` 

 DROP PROCEDURE IF EXISTS  `spenableuseraccount` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spenableuseraccount`(`$id` INT,`$userid` INT,$platform varchar(1000))
BEGIN
	declare $username varchar(100);
	declare $fullname varchar(100);
	
	select username, concat(firstname,' ',middlename,' ',lastname) into $username
	from `user` where userid=$id;
	
	update `user` 
	set `accountactive`=1, `lastmodifiedon`=now(),`lastmodifiedby`=$userid
	where `userid`=$id;
	
	-- Add Audit trail to capture the same
	select concat('Enabled account for user id:',$userid,' username:',$username,' fullname:',$fullname)
	into @narration;
	
	CALL `spsaveaudittrailentry`($userid,'Update',@narration,$platform,'','',NULL);
	
    END $$
DELIMITER ;

/* Procedure structure for procedure `spgetallsettings` 

 DROP PROCEDURE IF EXISTS  `spgetallsettings` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetallsettings`()
BEGIN
    SELECT 'company' AS `type`, c.* FROM `companydetails` c WHERE `id` = 1
    UNION ALL
    SELECT 'email' AS `type`, e.* FROM `emailsettings` e
    UNION ALL
    SELECT 'sms' AS `type`, s.* FROM `smssettings` s;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetallusers` 

 DROP PROCEDURE IF EXISTS  `spgetallusers` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetallusers`()
BEGIN
	select u.*, ifnull(concat(a.firstname,' ',a.middlename,' ',a.lastname),'System') as addedbyname 
	from `user` u  left OUTER join `user` a on u.addedby=a.userid -- where u.`accountactive`=1 
	order by u.`firstname`,u.`middlename`,u.`lastname`;
    END $$
DELIMITER ;

/* Procedure structure for procedure `spgetanimaldetails` 

 DROP PROCEDURE IF EXISTS  `spgetanimaldetails` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetanimaldetails`(
    IN `$id` INT
)
BEGIN
    SELECT 
        a.*, 
        b.`breedname`, 
        p.`penname`,
        m.`designatedname` AS `mothername`,
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`
    FROM `animals` a
    LEFT JOIN `breeds` b ON a.`breedid` = b.`id`
    LEFT JOIN `pens` p ON a.`penid` = p.`id`
    LEFT JOIN `animals` m ON a.`damid` = m.`id`
    LEFT JOIN `user` u ON a.`addedby` = u.`userid`
    WHERE a.`id` = `$id` 
    AND a.`deleted` = 0;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetanimals` 

 DROP PROCEDURE IF EXISTS  `spgetanimals` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetanimals`()
BEGIN
    SELECT 
        a.*, 
        b.`breedname`, 
        p.`penname`,
        m.`designatedname` AS `mothername`,
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`,
        COALESCE((SELECT SUM(`quantitylitres`) FROM `milkcollection` WHERE `animalid` = a.`id` AND `logdate` = CURDATE() AND `deleted` = 0), 0) AS `yield`
    FROM `animals` a
    LEFT JOIN `breeds` b ON a.`breedid` = b.`id`
    LEFT JOIN `pens` p ON a.`penid` = p.`id`
    LEFT JOIN `animals` m ON a.`damid` = m.`id`
    LEFT JOIN `user` u ON a.`addedby` = u.`userid`
    WHERE a.`deleted` = 0
    ORDER BY a.`tagid`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetbreeddetails` 

 DROP PROCEDURE IF EXISTS  `spgetbreeddetails` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetbreeddetails`(
    IN `$id` INT
)
BEGIN
    SELECT 
        b.*, 
        c.`countryname`, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`,
        -- Calculate Total Population
        IFNULL(p.`totalcount`, 0) AS `totalcount`,
        -- Calculate Average Actual Milking
        IFNULL(m.`avgactualmilking`, 0) AS `avgactualmilking`,
        -- Calculate Efficiency: (Average Actual / Breed Potential) * 100
        CASE 
            WHEN b.`avgmilking` > 0 THEN ROUND((IFNULL(m.`avgactualmilking`, 0) / b.`avgmilking`) * 100, 0)
            ELSE 0 
        END AS `efficiency`,
        -- Calculate Health Index
        IFNULL(h.`healthscore`, 100) AS `healthindex`,
        CASE 
            WHEN IFNULL(h.`healthscore`, 100) >= 90 THEN 'OPTIMAL'
            WHEN IFNULL(h.`healthscore`, 100) >= 70 THEN 'GOOD'
            ELSE 'ATTENTION'
        END AS `healthstatus`
    FROM `breeds` b
    LEFT JOIN `countries` c ON b.`originid` = c.`id`
    LEFT JOIN `user` u ON b.`addedby` = u.`userid`
    -- Population Join
    LEFT JOIN (
        SELECT `breedid`, COUNT(*) AS `totalcount` 
        FROM `animals` 
        WHERE `deleted` = 0 AND `status` = 'Active'
        GROUP BY `breedid`
    ) p ON b.`id` = p.`breedid`
    -- Milking Join (Last 30 days average)
    LEFT JOIN (
        SELECT a.`breedid`, AVG(mc.`quantitylitres`) AS `avgactualmilking`
        FROM `milkcollection` mc
        JOIN `animals` a ON mc.`animalid` = a.`id`
        WHERE mc.`deleted` = 0 AND mc.`logdate` >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
        GROUP BY a.`breedid`
    ) m ON b.`id` = m.`breedid`
    -- Health Join
    LEFT JOIN (
        SELECT 
            a.`breedid`, 
            ROUND(100 - (COUNT(DISTINCT hl.`animalid`) / COUNT(DISTINCT a.`id`) * 100), 0) AS `healthscore`
        FROM `animals` a
        LEFT JOIN `healthlogs` hl ON a.`id` = hl.`animalid` AND hl.`deleted` = 0 AND hl.`logdate` >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
        WHERE a.`deleted` = 0 AND a.`status` = 'Active'
        GROUP BY a.`breedid`
    ) h ON b.`id` = h.`breedid`
    WHERE b.`id` = `$id` 
    AND b.`deleted` = 0;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetbreeds` 

 DROP PROCEDURE IF EXISTS  `spgetbreeds` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetbreeds`()
BEGIN
    SELECT 
        b.*, 
        c.`countryname`, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`,
        -- Calculate Total Population
        IFNULL(p.`totalcount`, 0) AS `totalcount`,
        -- Calculate Average Actual Milking
        IFNULL(m.`avgactualmilking`, 0) AS `avgactualmilking`,
        -- Calculate Efficiency: (Average Actual / Breed Potential) * 100
        CASE 
            WHEN b.`avgmilking` > 0 THEN ROUND((IFNULL(m.`avgactualmilking`, 0) / b.`avgmilking`) * 100, 0)
            ELSE 0 
        END AS `efficiency`,
        -- Calculate Health Index (Mock calculation based on health logs)
        -- In a real scenario, this would be more complex
        IFNULL(h.`healthscore`, 100) AS `healthindex`,
        CASE 
            WHEN IFNULL(h.`healthscore`, 100) >= 90 THEN 'OPTIMAL'
            WHEN IFNULL(h.`healthscore`, 100) >= 70 THEN 'GOOD'
            ELSE 'ATTENTION'
        END AS `healthstatus`
    FROM `breeds` b
    LEFT JOIN `countries` c ON b.`originid` = c.`id`
    LEFT JOIN `user` u ON b.`addedby` = u.`userid`
    -- Population Join
    LEFT JOIN (
        SELECT `breedid`, COUNT(*) AS `totalcount` 
        FROM `animals` 
        WHERE `deleted` = 0 AND `status` = 'Active'
        GROUP BY `breedid`
    ) p ON b.`id` = p.`breedid`
    -- Milking Join (Last 30 days average)
    LEFT JOIN (
        SELECT a.`breedid`, AVG(mc.`quantitylitres`) AS `avgactualmilking`
        FROM `milkcollection` mc
        JOIN `animals` a ON mc.`animalid` = a.`id`
        WHERE mc.`deleted` = 0 AND mc.`logdate` >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
        GROUP BY a.`breedid`
    ) m ON b.`id` = m.`breedid`
    -- Health Join (Simplified: 100 - (sick count / total count * 100))
    LEFT JOIN (
        SELECT 
            a.`breedid`, 
            ROUND(100 - (COUNT(DISTINCT hl.`animalid`) / COUNT(DISTINCT a.`id`) * 100), 0) AS `healthscore`
        FROM `animals` a
        LEFT JOIN `healthlogs` hl ON a.`id` = hl.`animalid` AND hl.`deleted` = 0 AND hl.`logdate` >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
        WHERE a.`deleted` = 0 AND a.`status` = 'Active'
        GROUP BY a.`breedid`
    ) h ON b.`id` = h.`breedid`
    WHERE b.`deleted` = 0
    ORDER BY b.`breedname`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetcategorysummaries` 

 DROP PROCEDURE IF EXISTS  `spgetcategorysummaries` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetcategorysummaries`()
BEGIN
    SELECT 
        ic.id,
        ic.categoryname,
        ic.categoryicon,
        COUNT(ii.id) as item_count
    FROM inventorycategories ic
    LEFT JOIN inventoryitems ii ON ic.id = ii.categoryid AND ii.deleted = 0
    WHERE ic.deleted = 0
    GROUP BY ic.id, ic.categoryname, ic.categoryicon
    ORDER BY ic.categoryname ASC;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetcompanydetails` 

 DROP PROCEDURE IF EXISTS  `spgetcompanydetails` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetcompanydetails`()
BEGIN
    SELECT * FROM `companydetails` WHERE `id` = 1;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetcountries` 

 DROP PROCEDURE IF EXISTS  `spgetcountries` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetcountries`()
BEGIN
    SELECT 
        c.*, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`
    FROM `countries` c
    LEFT JOIN `user` u ON c.`addedby` = u.`userid`
    WHERE c.`deleted` = 0
    ORDER BY c.`countryname`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetcountrydetails` 

 DROP PROCEDURE IF EXISTS  `spgetcountrydetails` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetcountrydetails`(
    IN `$id` INT
)
BEGIN
    SELECT 
        c.*, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`
    FROM `countries` c
    LEFT JOIN `user` u ON c.`addedby` = u.`userid`
    WHERE c.`id` = `$id` 
    AND c.`deleted` = 0;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetdiseasedetails` 

 DROP PROCEDURE IF EXISTS  `spgetdiseasedetails` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetdiseasedetails`(
    IN `$id` INT
)
BEGIN
    SELECT 
        d.*, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`
    FROM `diseases` d
    LEFT JOIN `user` u ON d.`addedby` = u.`userid`
    WHERE d.`id` = `$id` 
    AND d.`deleted` = 0;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetdiseases` 

 DROP PROCEDURE IF EXISTS  `spgetdiseases` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetdiseases`()
BEGIN
    SELECT 
        d.*, 
        CONCAT(u.`firstname`, ' ', u.`lastname`) AS `addedbyname`
    FROM `diseases` d
    LEFT JOIN `user` u ON d.`addedby` = u.`userid`
    WHERE d.`deleted` = 0
    ORDER BY d.`diseasename`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetemailsettings` 

 DROP PROCEDURE IF EXISTS  `spgetemailsettings` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetemailsettings`()
BEGIN
    SELECT * FROM `emailsettings`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetemailsettingsbyrole` 

 DROP PROCEDURE IF EXISTS  `spgetemailsettingsbyrole` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetemailsettingsbyrole`(
    IN `$role` VARCHAR(100)
)
BEGIN
    SELECT * FROM `emailsettings` WHERE `role` = `$role`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetinbuiltsystemuser` 

 DROP PROCEDURE IF EXISTS  `spgetinbuiltsystemuser` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetinbuiltsystemuser`()
BEGIN
		select * from `user`
		where systemlabel='INBUILT SYSTEM ACCOUNT';
	END $$
DELIMITER ;

/* Procedure structure for procedure `spgetinventorycategories` 

 DROP PROCEDURE IF EXISTS  `spgetinventorycategories` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetinventorycategories`(
    IN `$id` INT
)
BEGIN
    IF `$id` = 0 THEN
        SELECT * FROM `inventorycategories` WHERE `deleted` = 0 ORDER BY `categoryname` ASC;
    ELSE
        SELECT * FROM `inventorycategories` WHERE `id` = `$id` AND `deleted` = 0;
    END IF;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetinventorycategorysummaries` 

 DROP PROCEDURE IF EXISTS  `spgetinventorycategorysummaries` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetinventorycategorysummaries`()
BEGIN
    SELECT 
        ic.id,
        ic.categoryname,
        ic.categoryicon,
        ic.itemprefix,
        (SELECT COUNT(*) FROM `inventoryitems` ii WHERE ii.`categoryid` = ic.`id` AND ii.`deleted` = 0) AS `itemcount`
    FROM `inventorycategories` ic
    WHERE ic.`deleted` = 0
    ORDER BY ic.`categoryname` ASC;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetinventoryitems` 

 DROP PROCEDURE IF EXISTS  `spgetinventoryitems` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetinventoryitems`(
    IN `$categoryid` INT,
    IN `$itemid` INT
)
BEGIN
    SELECT 
        ii.*,
        ic.`categoryname`,
        ic.`categorycode`
    FROM `inventoryitems` ii
    LEFT JOIN `inventorycategories` ic ON ii.`categoryid` = ic.`id`
    WHERE ii.`deleted` = 0
    AND (ii.`categoryid` = `$categoryid` OR `$categoryid` = 0)
    AND (ii.`id` = `$itemid` OR `$itemid` = 0)
    ORDER BY ii.`itemname` ASC;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetinventoryreceiptdetails` 

 DROP PROCEDURE IF EXISTS  `spgetinventoryreceiptdetails` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetinventoryreceiptdetails`(
    IN `$receiptid` INT
)
BEGIN
    SELECT 
        ird.*,
        ii.`itemname`,
        ii.`itemcode`,
        ii.`uom`
    FROM `inventoryreceiptdetails` ird
    JOIN `inventoryitems` ii ON ird.`itemid` = ii.`id`
    WHERE ird.`receiptid` = `$receiptid`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetinventoryreceipts` 

 DROP PROCEDURE IF EXISTS  `spgetinventoryreceipts` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetinventoryreceipts`(
    IN `$id` INT
)
BEGIN
    IF `$id` = 0 THEN
        SELECT ir.*, s.`suppliername`, u.`fullname` AS `inspectedby`
        FROM `inventoryreceipts` ir 
        LEFT JOIN `suppliers` s ON ir.`supplierid` = s.`id` 
        LEFT JOIN `user` u ON ir.`inspectedbyid` = u.`userid`
        WHERE ir.`deleted` = 0 
        ORDER BY ir.`dateadded` DESC;
    ELSE
        SELECT ir.*, s.`suppliername`, u.`fullname` AS `inspectedby`
        FROM `inventoryreceipts` ir 
        LEFT JOIN `suppliers` s ON ir.`supplierid` = s.`id` 
        LEFT JOIN `user` u ON ir.`inspectedbyid` = u.`userid`
        WHERE ir.`id` = `$id` AND ir.`deleted` = 0;
    END IF;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetinventorystats` 

 DROP PROCEDURE IF EXISTS  `spgetinventorystats` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetinventorystats`()
BEGIN
    SELECT 
        IFNULL(SUM(current_stock * unitprice), 0) AS total_value,
        COUNT(CASE WHEN current_stock <= reorderlevel AND deleted = 0 THEN 1 END) AS low_stock_count,
        (SELECT COUNT(*) FROM inventorycategories WHERE deleted = 0) AS category_count
    FROM inventoryitems
    WHERE deleted = 0;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetmilkcollection` 

 DROP PROCEDURE IF EXISTS  `spgetmilkcollection` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetmilkcollection`(
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
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetnonuserroles` 

 DROP PROCEDURE IF EXISTS  `spgetnonuserroles` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetnonuserroles`($userid int)
BEGIN
	select * from `roles` 
	where roleid not in(select `roleid` from `roleusers` where `userid`=$userid)
	order by rolename;
    END $$
DELIMITER ;

/* Procedure structure for procedure `spgetpendingemails` 

 DROP PROCEDURE IF EXISTS  `spgetpendingemails` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetpendingemails`()
BEGIN
    SELECT * FROM `emaillogs` WHERE `status` = 'Pending' ORDER BY `dateadded` ASC;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetpens` 

 DROP PROCEDURE IF EXISTS  `spgetpens` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetpens`()
BEGIN
    SELECT 
        p.*,
        (SELECT COUNT(*) FROM `animals` a WHERE a.`penid` = p.`id` AND a.`deleted` = 0) as current_occupancy
    FROM `pens` p
    WHERE p.`deleted` = 0;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetproductionstats` 

 DROP PROCEDURE IF EXISTS  `spgetproductionstats` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetproductionstats`(
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
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetproductiontrends` 

 DROP PROCEDURE IF EXISTS  `spgetproductiontrends` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetproductiontrends`(
    IN `$enddate` DATE
)
BEGIN
    SELECT 
        d.`date`,
        COALESCE(SUM(mc.`quantitylitres`), 0) AS `totalyield`,
        COALESCE(AVG(mc.`milkdensity`), 0) AS `avgdensity`
    FROM (
        SELECT CURDATE() AS `date` UNION ALL
        SELECT DATE_SUB(CURDATE(), INTERVAL 1 DAY) UNION ALL
        SELECT DATE_SUB(CURDATE(), INTERVAL 2 DAY) UNION ALL
        SELECT DATE_SUB(CURDATE(), INTERVAL 3 DAY) UNION ALL
        SELECT DATE_SUB(CURDATE(), INTERVAL 4 DAY) UNION ALL
        SELECT DATE_SUB(CURDATE(), INTERVAL 5 DAY) UNION ALL
        SELECT DATE_SUB(CURDATE(), INTERVAL 6 DAY)
    ) d
    LEFT JOIN `milkcollection` mc ON d.`date` = mc.`logdate` AND mc.`deleted` = 0
    GROUP BY d.`date`
    ORDER BY d.`date` ASC;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetrecentemaillogs` 

 DROP PROCEDURE IF EXISTS  `spgetrecentemaillogs` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetrecentemaillogs`()
BEGIN
    SELECT 
        `id`, 
        `sender`, 
        `recipient`, 
        `status`, 
        IFNULL(`statusreason`, 'Success') as `reason`,
        DATE_FORMAT(`dateadded`, '%H:%i') as `timeadded`
    FROM `emaillogs`
    ORDER BY `dateadded` DESC
    LIMIT 5;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetrecentsmslogs` 

 DROP PROCEDURE IF EXISTS  `spgetrecentsmslogs` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetrecentsmslogs`()
BEGIN
    SELECT * FROM `smslogs` ORDER BY `id` DESC LIMIT 5;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetroles` 

 DROP PROCEDURE IF EXISTS  `spgetroles` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetroles`()
BEGIN
		select * from `roles`
		where `deleted`=0
		order by `rolename`;
	END $$
DELIMITER ;

/* Procedure structure for procedure `spgetrolesforuserassignment` 

 DROP PROCEDURE IF EXISTS  `spgetrolesforuserassignment` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetrolesforuserassignment`()
BEGIN
	select `roleid`,`rolename` from `roles` order by `rolename`;
    END $$
DELIMITER ;

/* Procedure structure for procedure `spgetroleusers` 

 DROP PROCEDURE IF EXISTS  `spgetroleusers` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetroleusers`(`$roleid` INT)
BEGIN
	select r.`userid`, `username`,`firstname`,`middlename`,`lastname` from `roleusers` r, `user` u
	where r.`userid`=u.`id` and `roleid`=$roleid
	order by `firstname`,`middlename`,`lastname`;
    END $$
DELIMITER ;

/* Procedure structure for procedure `spgetsmsproviders` 

 DROP PROCEDURE IF EXISTS  `spgetsmsproviders` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetsmsproviders`()
BEGIN
    SELECT `id`, `providername`, `isdefault` FROM `smssettings` WHERE `deleted` = 0;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetsmssettings` 

 DROP PROCEDURE IF EXISTS  `spgetsmssettings` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetsmssettings`(
    IN `$id` INT
)
BEGIN
    IF `$id` = 0 THEN
        SELECT * FROM `smssettings` WHERE `isdefault` = 1 AND `deleted` = 0 LIMIT 1;
    ELSE
        SELECT * FROM `smssettings` WHERE `id` = `$id` AND `deleted` = 0;
    END IF;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetsuppliers` 

 DROP PROCEDURE IF EXISTS  `spgetsuppliers` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetsuppliers`(
    IN `$id` INT
)
BEGIN
    IF `$id` = 0 THEN
        SELECT * FROM `suppliers` WHERE `deleted` = 0 ORDER BY `suppliername` ASC;
    ELSE
        SELECT * FROM `suppliers` WHERE `id` = `$id` AND `deleted` = 0;
    END IF;
END $$
DELIMITER ;

/* Procedure structure for procedure `spgetuserbyid` 

 DROP PROCEDURE IF EXISTS  `spgetuserbyid` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetuserbyid`(`$userid` INT)
BEGIN
	select * from `user` where `userid`=$userid;
    END $$
DELIMITER ;

/* Procedure structure for procedure `spgetuserdetails` 

 DROP PROCEDURE IF EXISTS  `spgetuserdetails` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetuserdetails`(`$username` VARCHAR(50))
BEGIN
	select `companyname`,`supportemail`,`supportphone` 
	into @companyname,@supportemail,@supportphone from `institution`;
	
	select *,@companyname as companyname , @supportemail supportemail, @supportphone supportphone,
	ifnull((select `staffno` from `employeerecords` where `employeeid`=u.employeeid),'') staffno
	from `user` u WHERE `username`=$username;
	
    END $$
DELIMITER ;

/* Procedure structure for procedure `spgetuserdetailsbyusername` 

 DROP PROCEDURE IF EXISTS  `spgetuserdetailsbyusername` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetuserdetailsbyusername`($username varchar(100))
BEGIN
		select * from `user` where username=$username;
	END $$
DELIMITER ;

/* Procedure structure for procedure `spgetusernamefromuserid` 

 DROP PROCEDURE IF EXISTS  `spgetusernamefromuserid` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetusernamefromuserid`(`$userid` INT)
BEGIN
	select * from `user` where `userid`=$userid;
    END $$
DELIMITER ;

/* Procedure structure for procedure `spgetuserovertimeapprovalprivileges` 

 DROP PROCEDURE IF EXISTS  `spgetuserovertimeapprovalprivileges` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetuserovertimeapprovalprivileges`($userid int)
BEGIN
		select * from `overtimeapprovalusers`
		where `userid`=$userid and `allowed`=1;
	END $$
DELIMITER ;

/* Procedure structure for procedure `spgetuserprivileges` 

 DROP PROCEDURE IF EXISTS  `spgetuserprivileges` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetuserprivileges`(`$userid` INT)
BEGIN
	select * from `userprivileges` where userid=$userid;
    END $$
DELIMITER ;

/* Procedure structure for procedure `spgetuserrecruitmentprivileges` 

 DROP PROCEDURE IF EXISTS  `spgetuserrecruitmentprivileges` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetuserrecruitmentprivileges`($userid int)
BEGIN
		select * 
		from `recruitmentrequisitionapprovalusers`
		where `userid`=$userid and `valid`=1;
	END $$
DELIMITER ;

/* Procedure structure for procedure `spgetuserroles` 

 DROP PROCEDURE IF EXISTS  `spgetuserroles` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetuserroles`(`$userid` INT)
BEGIN
	select r.* , u.id from `roles` r, `roleusers` u
	where r.`roleid`=u.`roleid` and `userid`=$userid
	and ifnull(u.`deleted`,0)=0
	order by `rolename`;
    END $$
DELIMITER ;

/* Procedure structure for procedure `spgetuserunits` 

 DROP PROCEDURE IF EXISTS  `spgetuserunits` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetuserunits`($userid int)
BEGIN
		select u.*, unitname, companyname
		from `userunits` u
		join `units` n on n.unitid=u.unitid
		join `companies` c on c.companyid=n.companyid
		where u.userid=$userid and u.allowed=1
		order by companyname,unitname;
	END $$
DELIMITER ;

/* Procedure structure for procedure `spremoveusercompany` 

 DROP PROCEDURE IF EXISTS  `spremoveusercompany` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spremoveusercompany`($userunitid int, $addedby int,$platform varchar(1000))
BEGIN
		declare $userid int;
		declare $username varchar(100);
		declare $unitid int;
		
		select n.userid,concat(firstname,' ',middlename,' ',lastname),n.unitid
		into $userid,$username,$unitid
		from `userunits` n
		join `user` u on u.`userid`=n.`userid`
		join `units` t on t.unitid=n.unitid
		where `userunitid`=$userunitid;

		
		UPDATE `userunits`
		SET `allowed`=0
		WHERE `userunitid`=$userunitid;
		
		SELECT @narration=CONCAT('Removed user id:',$userid,' name:',$username,' from accessing unit id:',$unitid,' unitname:',unitname)
		INTO @narration
		FROM `units` WHERE `unitid`=$unitid;
		
		CALL `spsaveaudittrailentry`($addedby,'deleted',@narration,$platform,'','',NULL); 
	END $$
DELIMITER ;

/* Procedure structure for procedure `spremoveuserrole` 

 DROP PROCEDURE IF EXISTS  `spremoveuserrole` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spremoveuserrole`($userroleid int,$userid int,$platform varchar(1000))
BEGIN
		start transaction;
			update `roleusers`
			set deleted=1,`deletedby`=$userid,`datedeleted`=now()
			where `id`=$userroleid;
			
			select concat('Removed role id:',ru.roleid,' role name:',rolename,' from user id:',ru.userid,' username:',username,' (',firstname,' ',middlename,' ',lastname,')')
			into @narration
			from `roleusers` ru 
			join `roles`r on r.`roleid`=ru.roleid
			join `user` u on u.`userid`=ru.`userid`
			where ru.`id`=$userroleid;
			
			CALL `spsaveaudittrailentry`($userid,'Delete',@narration,$platform,'','',NULL); 
		commit;
	END $$
DELIMITER ;

/* Procedure structure for procedure `spsaveanimal` 

 DROP PROCEDURE IF EXISTS  `spsaveanimal` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsaveanimal`(
    IN `$id` INT,
    IN `$tagid` VARCHAR(50),
    IN `$designatedname` VARCHAR(100),
    IN `$breedid` INT,
    IN `$penid` INT,
    IN `$damid` INT,
    IN `$birthdate` DATE,
    IN `$initialweight` DECIMAL(10, 2),
    IN `$registrationsource` VARCHAR(50),
    IN `$purchaseprice` DECIMAL(15, 2),
    IN `$status` VARCHAR(50),
    IN `$autogen` TINYINT(1),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        -- Auto-generate Tag ID if requested
        IF `$autogen` = 1 THEN
            SET `$tagid` = fn_generateanimaltag();
            -- Increment the serial number
            UPDATE `serials` SET `currentno` = `currentno` + 1 WHERE `document` = 'Animal Tag';
        END IF;

        -- Insert new animal
        INSERT INTO `animals` (
            `tagid`, 
            `designatedname`, 
            `breedid`, 
            `penid`, 
            `damid`, 
            `birthdate`, 
            `initialweight`, 
            `registrationsource`, 
            `purchaseprice`, 
            `status`, 
            `addedby`, 
            `dateadded`, 
            `deleted`
        )
        VALUES (
            `$tagid`, 
            `$designatedname`, 
            `$breedid`, 
            `$penid`, 
            `$damid`, 
            `$birthdate`, 
            `$initialweight`, 
            `$registrationsource`, 
            `$purchaseprice`, 
            `$status`, 
            `$userid`, 
            NOW(), 
            0
        );
        
        SET `$id` = LAST_INSERT_ID();
        
        -- Audit Trail for Insert
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, 
            ',"tagid":"', `$tagid`, 
            '","designatedname":"', IFNULL(`$designatedname`, ''), 
            '","breedid":', IFNULL(`$breedid`, 'null'), 
            ',"penid":', IFNULL(`$penid`, 'null'), 
            ',"status":"', `$status`, 
            '"}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, 
            `userid`, 
            `operation`, 
            `narration`, 
            `platform`, 
            `updatedvalues`
        )
        VALUES (
            NOW(), 
            `$userid`, 
            'Insert', 
            CONCAT('Registered new animal: ', `$tagid`, ' (', IFNULL(`$designatedname`, 'Unnamed'), ')'), 
            `$platform`, 
            `$updatedvalues`
        );
    ELSE
        -- Capture original values for audit trail before update
        SELECT CONCAT(
            '{"id":', `id`, 
            ',"tagid":"', `tagid`, 
            '","designatedname":"', IFNULL(`designatedname`, ''), 
            '","breedid":', IFNULL(`breedid`, 'null'), 
            ',"penid":', IFNULL(`penid`, 'null'), 
            ',"status":"', `status`, 
            '"}'
        ) INTO `$originalvalues`
        FROM `animals` 
        WHERE `id` = `$id`;
        
        -- Update existing animal
        UPDATE `animals` 
        SET `tagid` = `$tagid`, 
            `designatedname` = `$designatedname`, 
            `breedid` = `$breedid`, 
            `penid` = `$penid`, 
            `damid` = `$damid`, 
            `birthdate` = `$birthdate`, 
            `initialweight` = `$initialweight`, 
            `registrationsource` = `$registrationsource`, 
            `purchaseprice` = `$purchaseprice`, 
            `status` = `$status`
        WHERE `id` = `$id`;
        
        -- Audit Trail for Update
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, 
            ',"tagid":"', `$tagid`, 
            '","designatedname":"', IFNULL(`$designatedname`, ''), 
            '","breedid":', IFNULL(`$breedid`, 'null'), 
            ',"penid":', IFNULL(`$penid`, 'null'), 
            ',"status":"', `$status`, 
            '"}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, 
            `userid`, 
            `operation`, 
            `narration`, 
            `platform`, 
            `originalvalues`, 
            `updatedvalues`
        )
        VALUES (
            NOW(), 
            `$userid`, 
            'Update', 
            CONCAT('Updated animal details: ', `$tagid`), 
            `$platform`, 
            `$originalvalues`, 
            `$updatedvalues`
        );
    END IF;
    
    COMMIT;
    
    -- Return the ID of the saved animal
    SELECT `$id` AS `animalid`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spsavebreed` 

 DROP PROCEDURE IF EXISTS  `spsavebreed` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsavebreed`(
    IN `$id` INT,
    IN `$breedname` VARCHAR(100),
    IN `$originid` INT,
    IN `$characteristics` TEXT,
    IN `$isindigenous` TINYINT(1),
    IN `$avgmilking` DECIMAL(10,2),
    IN `$icon` VARCHAR(50),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        -- Insert new breed
        INSERT INTO `breeds` (
            `breedname`, 
            `originid`, 
            `characteristics`, 
            `isindigenous`, 
            `avgmilking`,
            `icon`,
            `addedby`, 
            `dateadded`, 
            `deleted`
        )
        VALUES (
            `$breedname`, 
            `$originid`, 
            `$characteristics`, 
            `$isindigenous`, 
            `$avgmilking`,
            `$icon`,
            `$userid`, 
            NOW(), 
            0
        );
        
        SET `$id` = LAST_INSERT_ID();
        
        -- Audit Trail for Insert
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, 
            ',"breedname":"', `$breedname`, 
            '","originid":', IFNULL(`$originid`, 'null'), 
            ',"isindigenous":', `$isindigenous`, 
            ',"avgmilking":', `$avgmilking`,
            '}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, 
            `userid`, 
            `operation`, 
            `narration`, 
            `platform`, 
            `updatedvalues`
        )
        VALUES (
            NOW(), 
            `$userid`, 
            'Insert', 
            CONCAT('Created new breed: ', `$breedname`), 
            `$platform`, 
            `$updatedvalues`
        );
    ELSE
        -- Capture original values for audit trail before update
        SELECT CONCAT(
            '{"id":', `id`, 
            ',"breedname":"', `breedname`, 
            '","originid":', IFNULL(`originid`, 'null'), 
            ',"isindigenous":', `isindigenous`, 
            ',"avgmilking":', `avgmilking`,
            ',"icon":"', IFNULL(`icon`, ''),
            '"}'
        ) INTO `$originalvalues`
        FROM `breeds` 
        WHERE `id` = `$id`;
        
        -- Update existing breed
        UPDATE `breeds` 
        SET `breedname` = `$breedname`, 
            `originid` = `$originid`, 
            `characteristics` = `$characteristics`, 
            `isindigenous` = `$isindigenous`,
            `avgmilking` = `$avgmilking`,
            `icon` = `$icon`
        WHERE `id` = `$id`;
        
        -- Audit Trail for Update
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, 
            ',"breedname":"', `$breedname`, 
            '","originid":', IFNULL(`$originid`, 'null'), 
            ',"isindigenous":', `$isindigenous`, 
            ',"avgmilking":', `$avgmilking`,
            '}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, 
            `userid`, 
            `operation`, 
            `narration`, 
            `platform`, 
            `originalvalues`, 
            `updatedvalues`
        )
        VALUES (
            NOW(), 
            `$userid`, 
            'Update', 
            CONCAT('Updated breed: ', `$breedname`), 
            `$platform`, 
            `$originalvalues`, 
            `$updatedvalues`
        );
    END IF;
    
    COMMIT;
    
    -- Return the ID of the saved breed
    SELECT `$id` AS `breedid`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spsavecompanydetails` 

 DROP PROCEDURE IF EXISTS  `spsavecompanydetails` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsavecompanydetails`(
    IN `$companyname` VARCHAR(255),
    IN `$taxregno` VARCHAR(100),
    IN `$incorporationdate` DATE,
    IN `$emailaddress` VARCHAR(255),
    IN `$physicaladdress` TEXT,
    IN `$postaladdress` VARCHAR(255),
    IN `$mobileno` VARCHAR(50),
    IN `$logopath` VARCHAR(255),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    SELECT JSON_OBJECT(
        'companyname', `companyname`, 'taxregno', `taxregno`, 'emailaddress', `emailaddress`
    ) INTO `$originalvalues` FROM `companydetails` WHERE `id` = 1;
    
    UPDATE `companydetails`
    SET `companyname` = `$companyname`,
        `taxregno` = `$taxregno`,
        `incorporationdate` = `$incorporationdate`,
        `emailaddress` = `$emailaddress`,
        `physicaladdress` = `$physicaladdress`,
        `postaladdress` = `$postaladdress`,
        `mobileno` = `$mobileno`,
        `logopath` = IFNULL(`$logopath`, `logopath`),
        `updatedby` = `$userid`,
        `lastupdated` = NOW()
    WHERE `id` = 1;
    
    SELECT JSON_OBJECT(
        'companyname', `companyname`, 'taxregno', `taxregno`, 'emailaddress', `emailaddress`
    ) INTO `$updatedvalues` FROM `companydetails` WHERE `id` = 1;
    
    INSERT INTO `audittrail` (
        `timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`
    )
    VALUES (
        NOW(), `$userid`, 'Update', 'Updated Company Details', `$platform`, `$originalvalues`, `$updatedvalues`
    );
    
    COMMIT;
END $$
DELIMITER ;

/* Procedure structure for procedure `spsavecountry` 

 DROP PROCEDURE IF EXISTS  `spsavecountry` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsavecountry`(
    IN `$id` INT,
    IN `$countryname` VARCHAR(100),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        INSERT INTO `countries` (
            `countryname`, `addedby`, `dateadded`, `deleted`
        )
        VALUES (
            `$countryname`, `$userid`, NOW(), 0
        );
        
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, ',"countryname":"', `$countryname`, '"}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`
        )
        VALUES (
            NOW(), `$userid`, 'Insert', CONCAT('Created new country: ', `$countryname`), `$platform`, `$updatedvalues`
        );
    ELSE
        SELECT CONCAT(
            '{"id":', `id`, ',"countryname":"', `countryname`, '"}'
        ) INTO `$originalvalues`
        FROM `countries` WHERE `id` = `$id`;
        
        UPDATE `countries` 
        SET `countryname` = `$countryname`
        WHERE `id` = `$id`;
        
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, ',"countryname":"', `$countryname`, '"}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`
        )
        VALUES (
            NOW(), `$userid`, 'Update', CONCAT('Updated country: ', `$countryname`), `$platform`, `$originalvalues`, `$updatedvalues`
        );
    END IF;
    
    COMMIT;
    SELECT `$id` AS `countryid`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spsavedisease` 

 DROP PROCEDURE IF EXISTS  `spsavedisease` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsavedisease`(
    IN `$id` INT,
    IN `$diseasename` VARCHAR(100),
    IN `$commonsymptoms` TEXT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        INSERT INTO `diseases` (
            `diseasename`, `commonsymptoms`, `addedby`, `dateadded`, `deleted`
        )
        VALUES (
            `$diseasename`, `$commonsymptoms`, `$userid`, NOW(), 0
        );
        
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, ',"diseasename":"', `$diseasename`, '"}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`
        )
        VALUES (
            NOW(), `$userid`, 'Insert', CONCAT('Created new disease: ', `$diseasename`), `$platform`, `$updatedvalues`
        );
    ELSE
        SELECT CONCAT(
            '{"id":', `id`, ',"diseasename":"', `diseasename`, '"}'
        ) INTO `$originalvalues`
        FROM `diseases` WHERE `id` = `$id`;
        
        UPDATE `diseases` 
        SET `diseasename` = `$diseasename`, 
            `commonsymptoms` = `$commonsymptoms`
        WHERE `id` = `$id`;
        
        SET `$updatedvalues` = CONCAT(
            '{"id":', `$id`, ',"diseasename":"', `$diseasename`, '"}'
        );
        
        INSERT INTO `audittrail` (
            `timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`
        )
        VALUES (
            NOW(), `$userid`, 'Update', CONCAT('Updated disease: ', `$diseasename`), `$platform`, `$originalvalues`, `$updatedvalues`
        );
    END IF;
    
    COMMIT;
    SELECT `$id` AS `diseaseid`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spsaveemaillog` 

 DROP PROCEDURE IF EXISTS  `spsaveemaillog` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsaveemaillog`(
    IN `$sender` VARCHAR(255),
    IN `$recipient` VARCHAR(255),
    IN `$subject` VARCHAR(255),
    IN `$message` TEXT,
    IN `$userid` INT
)
BEGIN
    INSERT INTO `emaillogs` (`sender`, `recipient`, `subject`, `message`, `addedby`)
    VALUES (`$sender`, `$recipient`, `$subject`, `$message`, `$userid`);
END $$
DELIMITER ;

/* Procedure structure for procedure `spsaveemailsettings` 

 DROP PROCEDURE IF EXISTS  `spsaveemailsettings` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsaveemailsettings`(
    IN `$id` INT,
    IN `$role` VARCHAR(100),
    IN `$smtpserver` VARCHAR(255),
    IN `$smtpport` INT,
    IN `$useremail` VARCHAR(255),
    IN `$password` VARCHAR(255),
    IN `$ssltoggle` TINYINT(1),
    IN `$sendmode` VARCHAR(50),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        INSERT INTO `emailsettings` (
            `role`, `smtpserver`, `smtpport`, `useremail`, `password`, `ssltoggle`, `sendmode`, `addedby`
        )
        VALUES (
            `$role`, `$smtpserver`, `$smtpport`, `$useremail`, `$password`, `$ssltoggle`, `$sendmode`, `$userid`
        );
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = JSON_OBJECT('id', `$id`, 'role', `$role`, 'useremail', `$useremail`);
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Created Email Settings for role: ', `$role`), `$platform`, `$updatedvalues`);
    ELSE
        SELECT JSON_OBJECT('role', `role`, 'useremail', `useremail`) INTO `$originalvalues` 
        FROM `emailsettings` WHERE `id` = `$id`;
        
        UPDATE `emailsettings`
        SET `role` = `$role`,
            `smtpserver` = `$smtpserver`,
            `smtpport` = `$smtpport`,
            `useremail` = `$useremail`,
            `password` = `$password`,
            `ssltoggle` = `$ssltoggle`,
            `sendmode` = `$sendmode`,
            `updatedby` = `$userid`,
            `lastupdated` = NOW()
        WHERE `id` = `$id`;
        
        SELECT JSON_OBJECT('role', `role`, 'useremail', `useremail`) INTO `$updatedvalues` 
        FROM `emailsettings` WHERE `id` = `$id`;
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Update', CONCAT('Updated Email Settings for role: ', `$role`), `$platform`, `$originalvalues`, `$updatedvalues`);
    END IF;
    
    COMMIT;
END $$
DELIMITER ;

/* Procedure structure for procedure `spsaveinventorycategory` 

 DROP PROCEDURE IF EXISTS  `spsaveinventorycategory` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsaveinventorycategory`(
    IN `$id` INT,
    IN `$categorycode` VARCHAR(50),
    IN `$categoryname` VARCHAR(255),
    IN `$categoryicon` VARCHAR(100),
    IN `$itemprefix` VARCHAR(50),
    IN `$startingnumber` INT,
    IN `$padzeros` TINYINT(1),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        INSERT INTO `inventorycategories` (
            `categorycode`, `categoryname`, `categoryicon`, `itemprefix`, `startingnumber`, `padzeros`, `addedby`
        )
        VALUES (
            `$categorycode`, `$categoryname`, `$categoryicon`, `$itemprefix`, `$startingnumber`, `$padzeros`, `$userid`
        );
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = JSON_OBJECT('id', `$id`, 'categorycode', `$categorycode`, 'categoryname', `$categoryname`);
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Created Inventory Category: ', `$categoryname`), `$platform`, `$updatedvalues`);
    ELSE
        SELECT JSON_OBJECT('categorycode', `categorycode`, 'categoryname', `categoryname`) INTO `$originalvalues` 
        FROM `inventorycategories` WHERE `id` = `$id`;
        
        UPDATE `inventorycategories`
        SET `categorycode` = `$categorycode`,
            `categoryname` = `$categoryname`,
            `categoryicon` = `$categoryicon`,
            `itemprefix` = `$itemprefix`,
            `startingnumber` = `$startingnumber`,
            `padzeros` = `$padzeros`,
            `updatedby` = `$userid`,
            `lastupdated` = NOW()
        WHERE `id` = `$id`;
        
        SELECT JSON_OBJECT('categorycode', `categorycode`, 'categoryname', `categoryname`) INTO `$updatedvalues` 
        FROM `inventorycategories` WHERE `id` = `$id`;
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Update', CONCAT('Updated Inventory Category: ', `$categoryname`), `$platform`, `$originalvalues`, `$updatedvalues`);
    END IF;
    
    COMMIT;
    SELECT `$id` AS `categoryid`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spsaveinventoryitem` 

 DROP PROCEDURE IF EXISTS  `spsaveinventoryitem` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsaveinventoryitem`(
    IN `$id` INT,
    IN `$categoryid` INT,
    IN `$itemcode` VARCHAR(100),
    IN `$itemname` VARCHAR(255),
    IN `$uom` VARCHAR(50),
    IN `$unitprice` DECIMAL(15, 2),
    IN `$reorderlevel` DECIMAL(15, 2),
    IN `$itemtype` VARCHAR(50),
    IN `$description` TEXT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        INSERT INTO `inventoryitems` (
            `categoryid`, `itemcode`, `itemname`, `uom`, `unitprice`, `reorderlevel`, `itemtype`, `description`, `addedby`
        )
        VALUES (
            `$categoryid`, `$itemcode`, `$itemname`, `$uom`, `$unitprice`, `$reorderlevel`, `$itemtype`, `$description`, `$userid`
        );
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = JSON_OBJECT('id', `$id`, 'itemcode', `$itemcode`, 'itemname', `$itemname`);
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Provisioned Inventory Item: ', `$itemname`), `$platform`, `$updatedvalues`);
    ELSE
        SELECT JSON_OBJECT('itemcode', `itemcode`, 'itemname', `itemname`) INTO `$originalvalues` 
        FROM `inventoryitems` WHERE `id` = `$id`;
        
        UPDATE `inventoryitems`
        SET `categoryid` = `$categoryid`,
            `itemcode` = `$itemcode`,
            `itemname` = `$itemname`,
            `uom` = `$uom`,
            `unitprice` = `$unitprice`,
            `reorderlevel` = `$reorderlevel`,
            `itemtype` = `$itemtype`,
            `description` = `$description`,
            `updatedby` = `$userid`,
            `lastupdated` = NOW()
        WHERE `id` = `$id`;
        
        SELECT JSON_OBJECT('itemcode', `itemcode`, 'itemname', `itemname`) INTO `$updatedvalues` 
        FROM `inventoryitems` WHERE `id` = `$id`;
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Update', CONCAT('Updated Inventory Item: ', `$itemname`), `$platform`, `$originalvalues`, `$updatedvalues`);
    END IF;
    
    COMMIT;
    SELECT `$id` AS `itemid`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spsaveinventoryreceipt` 

 DROP PROCEDURE IF EXISTS  `spsaveinventoryreceipt` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsaveinventoryreceipt`(
    IN `$id` INT,
    IN `$receiptno` VARCHAR(50),
    IN `$invoiceno` VARCHAR(100),
    IN `$receiptdate` DATE,
    IN `$supplierid` INT,
    IN `$lpono` VARCHAR(100),
    IN `$inspectedbyid` INT,
    IN `$status` VARCHAR(50),
    IN `$notes` TEXT,
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        -- Auto-generate receipt no if empty
        IF `$receiptno` = '' OR `$receiptno` IS NULL THEN
            SET `$receiptno` = CONCAT('REC-', DATE_FORMAT(NOW(), '%y%m%d'), '-', LPAD((SELECT COUNT(*) + 1 FROM `inventoryreceipts`), 4, '0'));
        END IF;

        INSERT INTO `inventoryreceipts` (
            `receiptno`, `invoiceno`, `receiptdate`, `supplierid`, `lpono`, `inspectedbyid`, `status`, `notes`, `addedby`
        )
        VALUES (
            `$receiptno`, `$invoiceno`, `$receiptdate`, `$supplierid`, `$lpono`, `$inspectedbyid`, `$status`, `$notes`, `$userid`
        );
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = JSON_OBJECT('id', `$id`, 'receiptno', `$receiptno`, 'supplierid', `$supplierid`);
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Created Inventory Receipt: ', `$receiptno`), `$platform`, `$updatedvalues`);
    ELSE
        SELECT JSON_OBJECT('receiptno', `receiptno`, 'status', `status`) INTO `$originalvalues` 
        FROM `inventoryreceipts` WHERE `id` = `$id`;
        
        UPDATE `inventoryreceipts`
        SET `invoiceno` = `$invoiceno`,
            `receiptdate` = `$receiptdate`,
            `supplierid` = `$supplierid`,
            `lpono` = `$lpono`,
            `inspectedbyid` = `$inspectedbyid`,
            `status` = `$status`,
            `notes` = `$notes`,
            `updatedby` = `$userid`,
            `lastupdated` = NOW()
        WHERE `id` = `$id`;
        
        SELECT JSON_OBJECT('receiptno', `receiptno`, 'status', `status`) INTO `$updatedvalues` 
        FROM `inventoryreceipts` WHERE `id` = `$id`;
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Update', CONCAT('Updated Inventory Receipt: ', `$receiptno`), `$platform`, `$originalvalues`, `$updatedvalues`);
    END IF;
    
    COMMIT;
    SELECT `$id` AS `receiptid`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spsaveinventoryreceiptdetail` 

 DROP PROCEDURE IF EXISTS  `spsaveinventoryreceiptdetail` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsaveinventoryreceiptdetail`(
    IN `$receiptid` INT,
    IN `$itemid` INT,
    IN `$quantity` DECIMAL(15, 2),
    IN `$unitcost` DECIMAL(15, 2),
    IN `$expirydate` DATE,
    IN `$batchno` VARCHAR(100)
)
BEGIN
    INSERT INTO `inventoryreceiptdetails` (
        `receiptid`, `itemid`, `quantity`, `unitcost`, `expirydate`, `batchno`
    )
    VALUES (
        `$receiptid`, `$itemid`, `$quantity`, `$unitcost`, `$expirydate`, `$batchno`
    );
    
    -- Update Master Total
    UPDATE `inventoryreceipts` 
    SET `totalamount` = (SELECT SUM(`totalcost`) FROM `inventoryreceiptdetails` WHERE `receiptid` = `$receiptid`)
    WHERE `id` = `$receiptid`;
    
    SELECT LAST_INSERT_ID() AS `detailid`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spsavemilkcollection` 

 DROP PROCEDURE IF EXISTS  `spsavemilkcollection` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsavemilkcollection`(
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
END $$
DELIMITER ;

/* Procedure structure for procedure `spsavepen` 

 DROP PROCEDURE IF EXISTS  `spsavepen` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsavepen`(
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
END $$
DELIMITER ;

/* Procedure structure for procedure `spsaveroleusers` 

 DROP PROCEDURE IF EXISTS  `spsaveroleusers` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsaveroleusers`(`$userid` INT, `$roleid` INT, `$addedby` INT)
BEGIN
	declare $userbac int;
	select userbac into $userbac from `institution`;
	if $userbac=0 then 
		update `userprivileges`
		set `allowed`=0 
		where `userid`=$userid and `definedfromuser`=0;
		
		insert into `userprivileges` (`objectid`,`userid`,`allowed`,`dateadded`,`addedby`,`definedfromuser`)
		select `objectid`,$userid,`allowed`,now(),$addedby,0
		from `roleprivileges` where `roleid`=$roleid and `deleted`=0;
	end if;
	if not exists (select * from `roleusers` where `roleid`=$roleid and `userid`=$userid and ifnull(`deleted`,0)=0) then
		insert into `roleusers`(`roleid`,`userid`,`dateadded`,`addedby`)
		values($roleid,$userid,now(),$addedby);
	end if;
	
    END $$
DELIMITER ;

/* Procedure structure for procedure `spsavesmslog` 

 DROP PROCEDURE IF EXISTS  `spsavesmslog` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsavesmslog`(
    IN `$senderid` VARCHAR(11),
    IN `$recipient` VARCHAR(20),
    IN `$message` TEXT,
    IN `$userid` INT
)
BEGIN
    INSERT INTO `smslogs` (`senderid`, `recipient`, `message`, `addedby`)
    VALUES (`$senderid`, `$recipient`, `$message`, `$userid`);
END $$
DELIMITER ;

/* Procedure structure for procedure `spsavesmssettings` 

 DROP PROCEDURE IF EXISTS  `spsavesmssettings` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsavesmssettings`(
    IN `$id` INT,
    IN `$providername` VARCHAR(100),
    IN `$senderid` VARCHAR(11),
    IN `$config` JSON,
    IN `$priorityroute` TINYINT(1),
    IN `$isdefault` TINYINT(1),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    -- If setting this as default, unset all others
    IF `$isdefault` = 1 THEN
        UPDATE `smssettings` SET `isdefault` = 0;
    END IF;
    
    IF `$id` = 0 THEN
        INSERT INTO `smssettings` (
            `providername`, `senderid`, `config`, `priorityroute`, `isdefault`, `addedby`
        )
        VALUES (
            `$providername`, `$senderid`, `$config`, `$priorityroute`, `$isdefault`, `$userid`
        );
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = JSON_OBJECT('id', `$id`, 'provider', `$providername`, 'isdefault', `$isdefault`);
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Created SMS Settings for: ', `$providername`), `$platform`, `$updatedvalues`);
    ELSE
        SELECT JSON_OBJECT('providername', `providername`, 'isdefault', `isdefault`) INTO `$originalvalues` 
        FROM `smssettings` WHERE `id` = `$id`;
        
        UPDATE `smssettings`
        SET `providername` = `$providername`,
            `senderid` = `$senderid`,
            `config` = `$config`,
            `priorityroute` = `$priorityroute`,
            `isdefault` = `$isdefault`,
            `updatedby` = `$userid`,
            `lastupdated` = NOW()
        WHERE `id` = `$id`;
        
        SELECT JSON_OBJECT('providername', `providername`, 'isdefault', `isdefault`) INTO `$updatedvalues` 
        FROM `smssettings` WHERE `id` = `$id`;
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Update', CONCAT('Updated SMS Settings for: ', `$providername`), `$platform`, `$originalvalues`, `$updatedvalues`);
    END IF;
    
    COMMIT;
END $$
DELIMITER ;

/* Procedure structure for procedure `spsavesupplier` 

 DROP PROCEDURE IF EXISTS  `spsavesupplier` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsavesupplier`(
    IN `$id` INT,
    IN `$code` VARCHAR(50),
    IN `$name` VARCHAR(255),
    IN `$contact` VARCHAR(255),
    IN `$mobile` VARCHAR(20),
    IN `$email` VARCHAR(255),
    IN `$address` TEXT,
    IN `$location` VARCHAR(255),
    IN `$generatesupplierno` TINYINT(1),
    IN `$userid` INT,
    IN `$platform` VARCHAR(1000)
)
BEGIN
    DECLARE `$originalvalues` MEDIUMTEXT DEFAULT '';
    DECLARE `$updatedvalues` MEDIUMTEXT DEFAULT '';
    
    START TRANSACTION;
    
    IF `$id` = 0 THEN
        -- Generate Supplier Number if requested
        IF `$generatesupplierno` = 1 THEN
            SET `$code` = `fngeneratesupplierno`();
            UPDATE `serials` SET `currentno` = `currentno` + 1 WHERE `document` = 'Supplier';
        END IF;

        INSERT INTO `suppliers` (
            `suppliercode`, `suppliername`, `contactperson`, `mobile`, `email`, `address`, `location`, `addedby`
        )
        VALUES (
            `$code`, `$name`, `$contact`, `$mobile`, `$email`, `$address`, `$location`, `$userid`
        );
        SET `$id` = LAST_INSERT_ID();
        
        SET `$updatedvalues` = JSON_OBJECT('id', `$id`, 'suppliername', `$name`, 'mobile', `$mobile`);
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Insert', CONCAT('Created Supplier: ', `$name`), `$platform`, `$updatedvalues`);
    ELSE
        SELECT JSON_OBJECT('suppliername', `suppliername`, 'mobile', `mobile`) INTO `$originalvalues` 
        FROM `suppliers` WHERE `id` = `$id`;
        
        UPDATE `suppliers`
        SET `suppliercode` = `$code`,
            `suppliername` = `$name`,
            `contactperson` = `$contact`,
            `mobile` = `$mobile`,
            `email` = `$email`,
            `address` = `$address`,
            `location` = `$location`,
            `updatedby` = `$userid`,
            `lastupdated` = NOW()
        WHERE `id` = `$id`;
        
        SELECT JSON_OBJECT('suppliername', `suppliername`, 'mobile', `mobile`) INTO `$updatedvalues` 
        FROM `suppliers` WHERE `id` = `$id`;
        
        INSERT INTO `audittrail` (`timestamp`, `userid`, `operation`, `narration`, `platform`, `originalvalues`, `updatedvalues`)
        VALUES (NOW(), `$userid`, 'Update', CONCAT('Updated Supplier: ', `$name`), `$platform`, `$originalvalues`, `$updatedvalues`);
    END IF;
    
    COMMIT;
    SELECT `$id` AS `supplierid`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spsaveuser` 

 DROP PROCEDURE IF EXISTS  `spsaveuser` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsaveuser`(`$userid` INT, `$userpassword` VARCHAR(100),$salt varchar(50),`$roleid` int, `$username` VARCHAR(50), `$firstname` VARCHAR(50), `$middlename` VARCHAR(50), `$lastname` VARCHAR(50), `$email` VARCHAR(50), `$mobile` VARCHAR(50), 
`$changepasswordonlogon` bool, `$accountactive` bool,$profilephoto varchar(1000), `$addedby` INT,$platform varchar(1000))
BEGIN
	set $email=lower($email);
	-- select `name` into @institutionname from `institution` where `id`=$institutionid;

	if $userid=0 then 
		-- begin
		insert into `user`(`username`,`password`,`firstname`,`middlename`,`lastname`,`email`,`mobile`,`changepasswordonlogon`,`accountactive`,`addedby`,`dateadded`,roleid,`salt`,`profilephoto`)
		values($username,$userpassword,$firstname,$middlename,$lastname,$email,$mobile,$changepasswordonlogon,$accountactive,$addedby,now(),$roleid,$salt,$profilephoto);
		set $userid=(select max(`userid`) from `user`);
		
		-- Add audit trail entry
		SET @narration=CONCAT('Created user account for userid:',$userid,', username: ',$username,', fullname:',$firstname,' ',$middlename,' ',$lastname); 
		CALL `spsaveaudittrailentry`($userid,'Insert',@narration,$platform,'','',null);
		-- end
	else
		CALL `spgettabledata`('user','userid',$userid,@originalvalues);
		
		update `user` 
		set `username`=$username,`firstname`=$firstname,`middlename`=$middlename,`lastname`=$lastname,`email`=$email,`mobile`=$mobile,
		/*`changepasswordonlogon`=$changepasswordonlogon,`accountactive`=$accountactive, `salt`=$salt,
		`roleid`=$roleid,`lastmodifiedby`=$addedby,`lastmodifiedon`=NOW()
		WHERE `userid`=$userid;
		
		CALL `spgettabledata`('user','userid',$userid,@currentvalues);
		
		if @originalvalues<>@currentvalues then
			SET @narration=CONCAT('Updated details of user id ',$userid); 
			CALL `spsaveaudittrailentry`($addedby,'Update',@narration,$platform,@originalvalues,@currentvalues,null);
		end if;
	END IF;
	
	SELECT $userid AS `userid`;
	
    END $$
DELIMITER ;

/* Procedure structure for procedure `spsaveuserprivilege` 

 DROP PROCEDURE IF EXISTS  `spsaveuserprivilege` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsaveuserprivilege`(`$userid` INT, `$objectid` INT, `$allowed` BIT, `$useradding` INT)
BEGIN
	if not exists(select * from `userprivileges` where `objectid`=$objectid and `userid`=$userid) then
		insert into `userprivileges`(`objectid`,`userid`,`allowed`,`dateadded`,`addedby`)
		values($objectid,$userid,$allowed,now(),$useradding);
	else
		update `userprivileges` set `allowed`=$allowed, `lastdateupdated`=now(),`lastupdatedby`=$useradding 
		WHERE `objectid`=$objectid AND `userid`=$userid;
	end if ;
		
    END $$
DELIMITER ;

/* Procedure structure for procedure `spsaveuserunit` 

 DROP PROCEDURE IF EXISTS  `spsaveuserunit` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spsaveuserunit`($userid int,$unitid int,$allowed bool,$addedby int,$platform varchar(1000))
BEGIN
		declare $username varchar(100) default (select concat(firstname,' ',middlename,' ',lastname) from `user` where userid=$userid);
		 
		if $allowed=0 then
			if exists(select * from `userunits` WHERE `userid`=$userid AND `unitid`=$unitid AND `allowed`=1) then
				
				update `userunits`
				set `allowed`=0
				where `userid`=$userid and `unitid`=$unitid and `allowed`=1;
				
				select @narration=concat('Removed user id:',$userid,' name:',$username,' from accessing unit id:',$unitid,' unitname:',unitname)
				into @narration
				from `units` where `unitid`=$unitid;
				
				CALL `spsaveaudittrailentry`($addedby,'deleted',@narration,$platform,'','',NULL);
			end if;
		else
			IF not EXISTS(SELECT * FROM `userunits` WHERE `userid`=$userid AND `unitid`=$unitid AND `allowed`=1) then
				insert into `userunits`(`userid`,`unitid`,`allowed`,`dateadded`,`addedby`)
				values($userid,$unitid,$allowed,now(),$addedby);
				
				select concat('Granted user id:',$userid,' name:',$username,' access to unit id:',$unitid,' name:',unitname)
				into @narration
				from `units` WHERE `unitid`=$unitid;
				
				CALL `spsaveaudittrailentry`($addedby,'insert',@narration,$platform,'','',NULL);
			end if;
		end if;
	END $$
DELIMITER ;

/* Procedure structure for procedure `spupdateemailstatus` 

 DROP PROCEDURE IF EXISTS  `spupdateemailstatus` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spupdateemailstatus`(
    IN `$id` INT,
    IN `$status` ENUM('Sent', 'Failed'),
    IN `$reason` TEXT
)
BEGIN
    UPDATE `emaillogs`
    SET `status` = `$status`,
        `statusreason` = `$reason`,
        `sentdate` = IF(`$status` = 'Sent', NOW(), `sentdate`)
    WHERE `id` = `$id`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spupdatesmsreadstatus` 

 DROP PROCEDURE IF EXISTS  `spupdatesmsreadstatus` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spupdatesmsreadstatus`(
    IN `$id` INT,
    IN `$readstatus` ENUM('Unread', 'Read')
)
BEGIN
    UPDATE `smslogs`
    SET `readstatus` = `$readstatus`,
        `dateread` = IF(`$readstatus` = 'Read', NOW(), `dateread`)
    WHERE `id` = `$id`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spupdatesmsstatus` 

 DROP PROCEDURE IF EXISTS  `spupdatesmsstatus` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spupdatesmsstatus`(
    IN `$id` INT,
    IN `$status` ENUM('Pending', 'Sent', 'Failed'),
    IN `$reason` TEXT,
    IN `$referenceno` VARCHAR(100)
)
BEGIN
    UPDATE `smslogs`
    SET `status` = `$status`,
        `statusreason` = `$reason`,
        `referenceno` = `$referenceno`,
        `timesent` = IF(`$status` = 'Sent', NOW(), `timesent`)
    WHERE `id` = `$id`;
END $$
DELIMITER ;

/* Procedure structure for procedure `spvalidateuserprivilege` 

 DROP PROCEDURE IF EXISTS  `spvalidateuserprivilege` ;

DELIMITER $$

 CREATE DEFINER=`root`@`localhost` PROCEDURE `spvalidateuserprivilege`(`$userid` INT, `$objectcode` varchar(50))
BEGIN
	declare $admin int;
	declare $valid int default 0;
	declare $userbac int;
	
	select `userbac` into $userbac from `institution`;
	
	set $admin=(select systemadmin from `user` where `userid`=$userid);
	if $admin=1 then
		set $valid=1;
	elseif $userbac=1 and exists(select * from `roleusers` ru 
		join `roles` r on r.`roleid`=ru.`roleid` 
		join `roleprivileges` p on r.roleid=p.roleid
		join `objects` o on o.`id`=p.objectid 
		where `code`=$objectcode and ru.userid=$userid and ru.deleted=0 and allowed=1) then
		set $valid=1;
	else
		set $valid=ifnull((select `allowed` from `userprivileges` up join objects o on o.id=up.objectid 
		where `userid`=$userid and `code`=$objectcode),0);
	end if;
	
	select $valid as `allowed`;
	
    END $$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE ;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS ;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS ;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES ;
