/*
SQLyog Ultimate v13.1.1 (32 bit)
MySQL - 10.4.32-MariaDB : Database - farm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`farm` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `farm`;

/*Table structure for table `audittrail` */

DROP TABLE IF EXISTS `audittrail`;

CREATE TABLE `audittrail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `operation` varchar(50) DEFAULT NULL,
  `narration` varchar(5000) DEFAULT NULL,
  `platform` varchar(1000) DEFAULT NULL,
  `originalvalues` mediumtext DEFAULT NULL,
  `updatedvalues` mediumtext DEFAULT NULL,
  `branchid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2336 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `audittrail` */

insert  into `audittrail`(`id`,`timestamp`,`userid`,`operation`,`narration`,`platform`,`originalvalues`,`updatedvalues`,`branchid`) values 
(1,'2025-07-30 05:06:57',50,'Insert','Created user account for userid:50, username: angelakhakula, fullname:Angela Khakula Makari','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2,'2025-08-05 14:49:35',5,'update','Updated employee details for id :6528 staff no:108055 names:ELIZABETH MKAMBE MWANGOMBE','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"employeeid\": 6528, \"staffno\": \"108055\", \"firstname\": \"ELIZABETH\", \"middlename\": \"MKAMBE\", \"lastname\": \"MWANGOMBE\", \"termid\": 2, \"categoryid\": 1, \"departmentid\": 16, \"religionid\": 1, \"salutationid\": 2, \"iddocumentid\": 1, \"iddocreferenceno\": \"38108484\", \"iddocexpirydate\": null, \"dateofbirth\": \"2000-01-30\", \"gender\": \"female\", \"pinno\": \"A015009148Q\", \"nssfno\": \"2049135889\", \"nhifno\": \"CR8104533286353-1\", \"disabled\": 0, \"disabilitytype\": null, \"disabilitydescription\": null, \"disabilitycertificateno\": null, \"onpayroll\": 1, \"fixedpaye\": 0, \"status\": \"active\", \"positionid\": 102, \"jobgroupid\": 1, \"notchid\": 1, \"bankbranchid\": 536, \"bankaccountnumber\": \"01102033542001\", \"employmentdate\": \"2025-07-04\", \"separationdate\": null, \"separationreason\": null, \"physicaladdress\": \"Mombasa\", \"postaladdress\": \"30780109\", \"town\": \"MTWAPA\", \"postalcode\": \"80109\", \"mobile\": \"254743399254\", \"emailaddress\": \"elizabethmwangombe696@gmail.com\", \"alternativemobile\": null, \"alternativeemailaddress\": null, \"dateadded\": \"2025-07-29 06:33:59\", \"addedby\": 5, \"unitid\": 3, \"shiftid\": 1, \"sectionid\": 56, \"lastmodifiedby\": null, \"lastmodificationdate\": null, \"attendancestatus\": \"active\", \"otapplicable\": 1, \"targetbased\": 1, \"biometricid\": 38108484, \"countryid\": 1}','{\"employeeid\": 6528, \"staffno\": \"108055\", \"firstname\": \"ELIZABETH\", \"middlename\": \"MKAMBE\", \"lastname\": \"MWANGOMBE\", \"termid\": 2, \"categoryid\": 1, \"departmentid\": 16, \"religionid\": 1, \"salutationid\": 2, \"iddocumentid\": 1, \"iddocreferenceno\": \"38108484\", \"iddocexpirydate\": \"0000-00-00\", \"dateofbirth\": \"2000-01-30\", \"gender\": \"female\", \"pinno\": \"A015009148Q\", \"nssfno\": \"2049135889\", \"nhifno\": \"CR8104533286353-1\", \"disabled\": 0, \"disabilitytype\": \"none\", \"disabilitydescription\": \"\", \"disabilitycertificateno\": \"\", \"onpayroll\": 1, \"fixedpaye\": 0, \"status\": \"active\", \"positionid\": 102, \"jobgroupid\": 1, \"notchid\": 1, \"bankbranchid\": 536, \"bankaccountnumber\": \"01102033542001\", \"employmentdate\": \"2025-07-04\", \"separationdate\": null, \"separationreason\": null, \"physicaladdress\": \"Mombasa\", \"postaladdress\": \"30780109\", \"town\": \"MTWAPA\", \"postalcode\": \"80109\", \"mobile\": \"254743399254\", \"emailaddress\": \"abc@yahoo.com\", \"alternativemobile\": \"\", \"alternativeemailaddress\": \"\", \"dateadded\": \"2025-07-29 06:33:59\", \"addedby\": 5, \"unitid\": 3, \"shiftid\": 1, \"sectionid\": 56, \"lastmodifiedby\": null, \"lastmodificationdate\": null, \"attendancestatus\": \"active\", \"otapplicable\": 1, \"targetbased\": 1, \"biometricid\": 38108484, \"countryid\": 1}',NULL),
(3,'2025-08-05 14:51:55',5,'update','Updated employee details for id :6527 staff no:108054 names:ANGELA KHAKULA MAKARI','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"employeeid\": 6527, \"staffno\": \"108054\", \"firstname\": \"ANGELA\", \"middlename\": \"KHAKULA\", \"lastname\": \"MAKARI\", \"termid\": 2, \"categoryid\": 1, \"departmentid\": 16, \"religionid\": 1, \"salutationid\": 2, \"iddocumentid\": 1, \"iddocreferenceno\": \"794993490\", \"iddocexpirydate\": null, \"dateofbirth\": \"2006-03-24\", \"gender\": \"female\", \"pinno\": \"A021622258W\", \"nssfno\": \"2059340435\", \"nhifno\": \"CR3340710507162-8\", \"disabled\": 0, \"disabilitytype\": null, \"disabilitydescription\": null, \"disabilitycertificateno\": null, \"onpayroll\": 1, \"fixedpaye\": 0, \"status\": \"active\", \"positionid\": 128, \"jobgroupid\": 1, \"notchid\": 1, \"bankbranchid\": 536, \"bankaccountnumber\": \"01101756066001\", \"employmentdate\": \"2025-07-04\", \"separationdate\": null, \"separationreason\": null, \"physicaladdress\": \"Mombasa\", \"postaladdress\": \"30780109\", \"town\": \"MTWAPA\", \"postalcode\": \"80109\", \"mobile\": \"254791362297\", \"emailaddress\": \"angelakhakulamakari@gmail.com\", \"alternativemobile\": null, \"alternativeemailaddress\": null, \"dateadded\": \"2025-07-29 06:33:59\", \"addedby\": 5, \"unitid\": 3, \"shiftid\": 1, \"sectionid\": 70, \"lastmodifiedby\": null, \"lastmodificationdate\": null, \"attendancestatus\": \"active\", \"otapplicable\": 1, \"targetbased\": 1, \"biometricid\": 794993490, \"countryid\": 1}','{\"employeeid\": 6527, \"staffno\": \"108054\", \"firstname\": \"ANGELA\", \"middlename\": \"KHAKULA\", \"lastname\": \"MAKARI\", \"termid\": 2, \"categoryid\": 1, \"departmentid\": 16, \"religionid\": 1, \"salutationid\": 2, \"iddocumentid\": 1, \"iddocreferenceno\": \"794993490\", \"iddocexpirydate\": \"0000-00-00\", \"dateofbirth\": \"2006-03-24\", \"gender\": \"female\", \"pinno\": \"A021622258W\", \"nssfno\": \"2059340435\", \"nhifno\": \"CR3340710507162-8\", \"disabled\": 0, \"disabilitytype\": \"none\", \"disabilitydescription\": \"\", \"disabilitycertificateno\": \"\", \"onpayroll\": 1, \"fixedpaye\": 0, \"status\": \"active\", \"positionid\": 128, \"jobgroupid\": 1, \"notchid\": 1, \"bankbranchid\": 661, \"bankaccountnumber\": \"01101756066001\", \"employmentdate\": \"2025-07-04\", \"separationdate\": null, \"separationreason\": null, \"physicaladdress\": \"Mombasa\", \"postaladdress\": \"30780109\", \"town\": \"MTWAPA\", \"postalcode\": \"80109\", \"mobile\": \"254791362297\", \"emailaddress\": \"angelakhakulamakari@gmail.com\", \"alternativemobile\": \"\", \"alternativeemailaddress\": \"\", \"dateadded\": \"2025-07-29 06:33:59\", \"addedby\": 5, \"unitid\": 3, \"shiftid\": 1, \"sectionid\": 70, \"lastmodifiedby\": null, \"lastmodificationdate\": null, \"attendancestatus\": \"active\", \"otapplicable\": 1, \"targetbased\": 1, \"biometricid\": 794993490, \"countryid\": 1}',NULL),
(4,'2025-08-05 20:03:59',5,'update','Marked clockin for employee #:100346 names: KEVIN MOSES MUMIA. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(5,'2025-08-05 20:03:59',5,'update','Marked clockin for employee #:100576 names: RAJAB MASHOMBO SALIM. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(6,'2025-08-05 20:03:59',5,'update','Marked clockin for employee #:100614 names: JACINTA NTHAMBI KIMAU. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(7,'2025-08-05 20:03:59',5,'update','Marked clockin for employee #:100930 names: LUCAS OCHIENG NYANGANYI. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(8,'2025-08-05 20:03:59',5,'update','Marked clockin for employee #:100947 names: ANAHSTACIA KAVUTHA MUTHAMA. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(9,'2025-08-05 20:03:59',5,'update','Marked clockin for employee #:101315 names: IMMACULATE MAKOKHA MWANGA. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(10,'2025-08-05 20:03:59',5,'update','Marked clockin for employee #:101478 names: PHILIMON NYAMB MWALE. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(11,'2025-08-05 20:03:59',5,'update','Marked clockin for employee #:102757 names: FAITH MWIKALI KYALO. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(12,'2025-08-05 20:03:59',5,'update','Marked clockin for employee #:103017 names: HILLARY KIBET KUBOI. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(13,'2025-08-05 20:03:59',5,'update','Marked clockin for employee #:103328 names: EMMAH LEAH AWUOR. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(14,'2025-08-05 20:04:38',5,'update','Marked clockin for employee #:100346 names: KEVIN MOSES MUMIA. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(15,'2025-08-05 20:04:38',5,'update','Marked clockin for employee #:100576 names: RAJAB MASHOMBO SALIM. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(16,'2025-08-05 20:04:38',5,'update','Marked clockin for employee #:100614 names: JACINTA NTHAMBI KIMAU. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(17,'2025-08-05 20:04:38',5,'update','Marked clockin for employee #:100930 names: LUCAS OCHIENG NYANGANYI. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(18,'2025-08-05 20:04:38',5,'update','Marked clockin for employee #:100947 names: ANAHSTACIA KAVUTHA MUTHAMA. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(19,'2025-08-05 20:04:38',5,'update','Marked clockin for employee #:101315 names: IMMACULATE MAKOKHA MWANGA. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(20,'2025-08-05 20:04:38',5,'update','Marked clockin for employee #:101478 names: PHILIMON NYAMB MWALE. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(21,'2025-08-05 20:04:38',5,'update','Marked clockin for employee #:102757 names: FAITH MWIKALI KYALO. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(22,'2025-08-05 20:04:38',5,'update','Marked clockin for employee #:103017 names: HILLARY KIBET KUBOI. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(23,'2025-08-05 20:04:38',5,'update','Marked clockin for employee #:103328 names: EMMAH LEAH AWUOR. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(24,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:100346 names: KEVIN MOSES MUMIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(25,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:100576 names: RAJAB MASHOMBO SALIM. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(26,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:100614 names: JACINTA NTHAMBI KIMAU. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(27,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:100930 names: LUCAS OCHIENG NYANGANYI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(28,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:100947 names: ANAHSTACIA KAVUTHA MUTHAMA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(29,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:101315 names: IMMACULATE MAKOKHA MWANGA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(30,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:101478 names: PHILIMON NYAMB MWALE. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(31,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:102757 names: FAITH MWIKALI KYALO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(32,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:103017 names: HILLARY KIBET KUBOI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(33,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:103328 names: EMMAH LEAH AWUOR. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(34,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:103341 names: CELESTINE NANDWA ESPIRA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(35,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:103413 names: NANCY MAWIA MARTHA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(36,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:103444 names: MWENGWA ELOSY MUTHAMIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(37,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:103547 names: REHEMA LEWA . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(38,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:103788 names: DIANAH NZEMBI NOAH. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(39,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:103857 names: HARRIET INZIANI . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(40,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:104227 names: CONSTANCE NAWUSEKI LESHAMT. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(41,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:104347 names: JACKLINE FURAHA KATANA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(42,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:104820 names: BENSON MUTUKU . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(43,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:106438 names: MILCAH ONYONA WACHIYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(44,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:106602 names: RUKIA BARAWA RIZIKI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(45,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:107759 names: ROSE ACHIENG OGWANG. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(46,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:107760 names: PENINA MASUD FINDI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(47,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:107761 names: SUSAN NZEMBI MUTISYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(48,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:107762 names: SHARON KASIKI MWANIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(49,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:107763 names: PERMINUS ROSANA NYANGÁU. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(50,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:107765 names: ERICKSON MUTINDA MUTISYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(51,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:107775 names: NDETO MUTUA . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(52,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:107776 names: BENJAMIN KIMANZI KYALO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(53,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:107777 names: LUCY AMENTONO ESIROMO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(54,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:107778 names: IRENE ATIENO ONYATI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(55,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:107779 names: PHANICE AKOTH OCHIENG. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(56,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:107780 names: ZAWADI MWALIMU WANJE. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(57,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:107781 names: SADICK MUCHELULE WEKHUYI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(58,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:107782 names: BERIL AKINYI RONNY. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(59,'2025-08-05 20:07:06',5,'update','Marked clockin for employee #:107783 names: DARIUS MWANGOME MWAWATO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(60,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:100346 names: KEVIN MOSES MUMIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(61,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:100576 names: RAJAB MASHOMBO SALIM. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(62,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:100614 names: JACINTA NTHAMBI KIMAU. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(63,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:100930 names: LUCAS OCHIENG NYANGANYI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(64,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:100947 names: ANAHSTACIA KAVUTHA MUTHAMA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(65,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:101315 names: IMMACULATE MAKOKHA MWANGA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(66,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:101478 names: PHILIMON NYAMB MWALE. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(67,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:102757 names: FAITH MWIKALI KYALO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(68,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:103017 names: HILLARY KIBET KUBOI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(69,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:103328 names: EMMAH LEAH AWUOR. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(70,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:103341 names: CELESTINE NANDWA ESPIRA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(71,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:103413 names: NANCY MAWIA MARTHA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(72,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:103444 names: MWENGWA ELOSY MUTHAMIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(73,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:103547 names: REHEMA LEWA . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(74,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:103788 names: DIANAH NZEMBI NOAH. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(75,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:103857 names: HARRIET INZIANI . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(76,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:104227 names: CONSTANCE NAWUSEKI LESHAMT. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(77,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:104347 names: JACKLINE FURAHA KATANA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(78,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:104820 names: BENSON MUTUKU . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(79,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:106438 names: MILCAH ONYONA WACHIYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(80,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:106602 names: RUKIA BARAWA RIZIKI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(81,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:107759 names: ROSE ACHIENG OGWANG. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(82,'2025-08-05 17:09:17',5,'update','Marked clockin for employee #:107760 names: PENINA MASUD FINDI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(83,'2025-08-05 17:09:18',5,'update','Marked clockin for employee #:107761 names: SUSAN NZEMBI MUTISYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(84,'2025-08-05 17:09:18',5,'update','Marked clockin for employee #:107762 names: SHARON KASIKI MWANIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(85,'2025-08-05 17:09:18',5,'update','Marked clockin for employee #:107763 names: PERMINUS ROSANA NYANGÁU. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(86,'2025-08-05 17:09:18',5,'update','Marked clockin for employee #:107765 names: ERICKSON MUTINDA MUTISYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(87,'2025-08-05 17:09:18',5,'update','Marked clockin for employee #:107775 names: NDETO MUTUA . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(88,'2025-08-05 17:09:18',5,'update','Marked clockin for employee #:107776 names: BENJAMIN KIMANZI KYALO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(89,'2025-08-05 17:09:18',5,'update','Marked clockin for employee #:107777 names: LUCY AMENTONO ESIROMO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(90,'2025-08-05 17:09:18',5,'update','Marked clockin for employee #:107778 names: IRENE ATIENO ONYATI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(91,'2025-08-05 17:09:18',5,'update','Marked clockin for employee #:107779 names: PHANICE AKOTH OCHIENG. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(92,'2025-08-05 17:09:18',5,'update','Marked clockin for employee #:107780 names: ZAWADI MWALIMU WANJE. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(93,'2025-08-05 17:09:18',5,'update','Marked clockin for employee #:107781 names: SADICK MUCHELULE WEKHUYI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(94,'2025-08-05 17:09:18',5,'update','Marked clockin for employee #:107782 names: BERIL AKINYI RONNY. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(95,'2025-08-05 17:09:18',5,'update','Marked clockin for employee #:107783 names: DARIUS MWANGOME MWAWATO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(96,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:100346 names: KEVIN MOSES MUMIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(97,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:100576 names: RAJAB MASHOMBO SALIM. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(98,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:100614 names: JACINTA NTHAMBI KIMAU. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(99,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:100930 names: LUCAS OCHIENG NYANGANYI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(100,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:100947 names: ANAHSTACIA KAVUTHA MUTHAMA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(101,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:101315 names: IMMACULATE MAKOKHA MWANGA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(102,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:101478 names: PHILIMON NYAMB MWALE. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(103,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:102757 names: FAITH MWIKALI KYALO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(104,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:103017 names: HILLARY KIBET KUBOI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(105,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:103328 names: EMMAH LEAH AWUOR. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(106,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:103341 names: CELESTINE NANDWA ESPIRA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(107,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:103413 names: NANCY MAWIA MARTHA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(108,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:103444 names: MWENGWA ELOSY MUTHAMIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(109,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:103547 names: REHEMA LEWA . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(110,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:103788 names: DIANAH NZEMBI NOAH. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(111,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:103857 names: HARRIET INZIANI . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(112,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:104227 names: CONSTANCE NAWUSEKI LESHAMT. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(113,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:104347 names: JACKLINE FURAHA KATANA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(114,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:104820 names: BENSON MUTUKU . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(115,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:106438 names: MILCAH ONYONA WACHIYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(116,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:106602 names: RUKIA BARAWA RIZIKI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(117,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:107759 names: ROSE ACHIENG OGWANG. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(118,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:107760 names: PENINA MASUD FINDI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(119,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:107761 names: SUSAN NZEMBI MUTISYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(120,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:107762 names: SHARON KASIKI MWANIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(121,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:107763 names: PERMINUS ROSANA NYANGÁU. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(122,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:107765 names: ERICKSON MUTINDA MUTISYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(123,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:107775 names: NDETO MUTUA . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(124,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:107776 names: BENJAMIN KIMANZI KYALO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(125,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:107777 names: LUCY AMENTONO ESIROMO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(126,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:107778 names: IRENE ATIENO ONYATI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(127,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:107779 names: PHANICE AKOTH OCHIENG. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(128,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:107780 names: ZAWADI MWALIMU WANJE. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(129,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:107781 names: SADICK MUCHELULE WEKHUYI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(130,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:107782 names: BERIL AKINYI RONNY. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(131,'2025-08-05 17:43:13',5,'update','Marked clockin for employee #:107783 names: DARIUS MWANGOME MWAWATO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(132,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:100346 names: KEVIN MOSES MUMIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(133,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:100576 names: RAJAB MASHOMBO SALIM. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(134,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:100614 names: JACINTA NTHAMBI KIMAU. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(135,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:100930 names: LUCAS OCHIENG NYANGANYI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(136,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:100947 names: ANAHSTACIA KAVUTHA MUTHAMA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(137,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:101315 names: IMMACULATE MAKOKHA MWANGA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(138,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:101478 names: PHILIMON NYAMB MWALE. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(139,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:102757 names: FAITH MWIKALI KYALO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(140,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:103017 names: HILLARY KIBET KUBOI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(141,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:103328 names: EMMAH LEAH AWUOR. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(142,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:103341 names: CELESTINE NANDWA ESPIRA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(143,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:103413 names: NANCY MAWIA MARTHA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(144,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:103444 names: MWENGWA ELOSY MUTHAMIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(145,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:103547 names: REHEMA LEWA . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(146,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:103788 names: DIANAH NZEMBI NOAH. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(147,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:103857 names: HARRIET INZIANI . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(148,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:104227 names: CONSTANCE NAWUSEKI LESHAMT. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(149,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:104347 names: JACKLINE FURAHA KATANA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(150,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:104820 names: BENSON MUTUKU . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(151,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:106438 names: MILCAH ONYONA WACHIYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(152,'2025-08-05 17:44:54',5,'update','Marked clockin for employee #:106602 names: RUKIA BARAWA RIZIKI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(153,'2025-08-05 17:44:55',5,'update','Marked clockin for employee #:107759 names: ROSE ACHIENG OGWANG. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(154,'2025-08-05 17:44:55',5,'update','Marked clockin for employee #:107760 names: PENINA MASUD FINDI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(155,'2025-08-05 17:44:55',5,'update','Marked clockin for employee #:107761 names: SUSAN NZEMBI MUTISYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(156,'2025-08-05 17:44:55',5,'update','Marked clockin for employee #:107762 names: SHARON KASIKI MWANIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(157,'2025-08-05 17:44:55',5,'update','Marked clockin for employee #:107763 names: PERMINUS ROSANA NYANGÁU. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(158,'2025-08-05 17:44:55',5,'update','Marked clockin for employee #:107765 names: ERICKSON MUTINDA MUTISYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(159,'2025-08-05 17:44:55',5,'update','Marked clockin for employee #:107775 names: NDETO MUTUA . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(160,'2025-08-05 17:44:55',5,'update','Marked clockin for employee #:107776 names: BENJAMIN KIMANZI KYALO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(161,'2025-08-05 17:44:55',5,'update','Marked clockin for employee #:107777 names: LUCY AMENTONO ESIROMO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(162,'2025-08-05 17:44:55',5,'update','Marked clockin for employee #:107778 names: IRENE ATIENO ONYATI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(163,'2025-08-05 17:44:55',5,'update','Marked clockin for employee #:107779 names: PHANICE AKOTH OCHIENG. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(164,'2025-08-05 17:44:55',5,'update','Marked clockin for employee #:107780 names: ZAWADI MWALIMU WANJE. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(165,'2025-08-05 17:44:55',5,'update','Marked clockin for employee #:107781 names: SADICK MUCHELULE WEKHUYI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(166,'2025-08-05 17:44:55',5,'update','Marked clockin for employee #:107782 names: BERIL AKINYI RONNY. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(167,'2025-08-05 17:44:55',5,'update','Marked clockin for employee #:107783 names: DARIUS MWANGOME MWAWATO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(168,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:100346 names: KEVIN MOSES MUMIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(169,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:100576 names: RAJAB MASHOMBO SALIM. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(170,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:100614 names: JACINTA NTHAMBI KIMAU. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(171,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:100930 names: LUCAS OCHIENG NYANGANYI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(172,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:100947 names: ANAHSTACIA KAVUTHA MUTHAMA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(173,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:101315 names: IMMACULATE MAKOKHA MWANGA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(174,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:101478 names: PHILIMON NYAMB MWALE. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(175,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:102757 names: FAITH MWIKALI KYALO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(176,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:103017 names: HILLARY KIBET KUBOI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(177,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:103328 names: EMMAH LEAH AWUOR. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(178,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:103341 names: CELESTINE NANDWA ESPIRA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(179,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:103413 names: NANCY MAWIA MARTHA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(180,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:103444 names: MWENGWA ELOSY MUTHAMIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(181,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:103547 names: REHEMA LEWA . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(182,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:103788 names: DIANAH NZEMBI NOAH. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(183,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:103857 names: HARRIET INZIANI . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(184,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:104227 names: CONSTANCE NAWUSEKI LESHAMT. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(185,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:104347 names: JACKLINE FURAHA KATANA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(186,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:104820 names: BENSON MUTUKU . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(187,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:106438 names: MILCAH ONYONA WACHIYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(188,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:106602 names: RUKIA BARAWA RIZIKI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(189,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:107759 names: ROSE ACHIENG OGWANG. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(190,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:107760 names: PENINA MASUD FINDI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(191,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:107761 names: SUSAN NZEMBI MUTISYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(192,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:107762 names: SHARON KASIKI MWANIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(193,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:107763 names: PERMINUS ROSANA NYANGÁU. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(194,'2025-08-05 17:55:14',5,'update','Marked clockin for employee #:107765 names: ERICKSON MUTINDA MUTISYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(195,'2025-08-05 17:55:15',5,'update','Marked clockin for employee #:107775 names: NDETO MUTUA . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(196,'2025-08-05 17:55:15',5,'update','Marked clockin for employee #:107776 names: BENJAMIN KIMANZI KYALO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(197,'2025-08-05 17:55:15',5,'update','Marked clockin for employee #:107777 names: LUCY AMENTONO ESIROMO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(198,'2025-08-05 17:55:15',5,'update','Marked clockin for employee #:107778 names: IRENE ATIENO ONYATI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(199,'2025-08-05 17:55:15',5,'update','Marked clockin for employee #:107779 names: PHANICE AKOTH OCHIENG. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(200,'2025-08-05 17:55:15',5,'update','Marked clockin for employee #:107780 names: ZAWADI MWALIMU WANJE. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(201,'2025-08-05 17:55:15',5,'update','Marked clockin for employee #:107781 names: SADICK MUCHELULE WEKHUYI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(202,'2025-08-05 17:55:15',5,'update','Marked clockin for employee #:107782 names: BERIL AKINYI RONNY. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(203,'2025-08-05 17:55:15',5,'update','Marked clockin for employee #:107783 names: DARIUS MWANGOME MWAWATO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(204,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:100346 names: KEVIN MOSES MUMIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(205,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:100576 names: RAJAB MASHOMBO SALIM. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(206,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:100614 names: JACINTA NTHAMBI KIMAU. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(207,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:100930 names: LUCAS OCHIENG NYANGANYI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(208,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:100947 names: ANAHSTACIA KAVUTHA MUTHAMA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(209,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:101315 names: IMMACULATE MAKOKHA MWANGA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(210,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:101478 names: PHILIMON NYAMB MWALE. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(211,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:102757 names: FAITH MWIKALI KYALO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(212,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:103017 names: HILLARY KIBET KUBOI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(213,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:103328 names: EMMAH LEAH AWUOR. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(214,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:103341 names: CELESTINE NANDWA ESPIRA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(215,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:103413 names: NANCY MAWIA MARTHA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(216,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:103444 names: MWENGWA ELOSY MUTHAMIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(217,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:103547 names: REHEMA LEWA . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(218,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:103788 names: DIANAH NZEMBI NOAH. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(219,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:103857 names: HARRIET INZIANI . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(220,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:104227 names: CONSTANCE NAWUSEKI LESHAMT. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(221,'2025-08-05 17:57:02',5,'update','Marked clockin for employee #:104347 names: JACKLINE FURAHA KATANA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(222,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:104820 names: BENSON MUTUKU . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(223,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:106438 names: MILCAH ONYONA WACHIYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(224,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:106602 names: RUKIA BARAWA RIZIKI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(225,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:107759 names: ROSE ACHIENG OGWANG. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(226,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:107760 names: PENINA MASUD FINDI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(227,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:107761 names: SUSAN NZEMBI MUTISYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(228,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:107762 names: SHARON KASIKI MWANIA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(229,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:107763 names: PERMINUS ROSANA NYANGÁU. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(230,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:107765 names: ERICKSON MUTINDA MUTISYA. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(231,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:107775 names: NDETO MUTUA . Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(232,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:107776 names: BENJAMIN KIMANZI KYALO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(233,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:107777 names: LUCY AMENTONO ESIROMO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(234,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:107778 names: IRENE ATIENO ONYATI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(235,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:107779 names: PHANICE AKOTH OCHIENG. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(236,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:107780 names: ZAWADI MWALIMU WANJE. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(237,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:107781 names: SADICK MUCHELULE WEKHUYI. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(238,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:107782 names: BERIL AKINYI RONNY. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(239,'2025-08-05 17:57:03',5,'update','Marked clockin for employee #:107783 names: DARIUS MWANGOME MWAWATO. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(240,'2025-08-05 21:18:49',5,'update','Marked clockin for employee #:100513 names: ALEPH KYALO MULYUNGI. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(241,'2025-08-05 21:18:49',5,'update','Marked clockin for employee #:101269 names: MERCY MAKU MGANGA. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(242,'2025-08-05 21:18:49',5,'update','Marked clockin for employee #:101917 names: WYCLIFFE MASAKHALIA KHWAKA. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(243,'2025-08-05 21:18:49',5,'update','Marked clockin for employee #:103501 names: JANET MUSYAWA MUTWII. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(244,'2025-08-05 21:18:49',5,'update','Marked clockin for employee #:103756 names: IRENE NDUSYA MWENDWA. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(245,'2025-08-05 21:18:49',5,'update','Marked clockin for employee #:104056 names: MONICA WAMBUGHA KINYANGO. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(246,'2025-08-05 21:18:49',5,'update','Marked clockin for employee #:104116 names: SAUMU NYAMVULA NYUNDO. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(247,'2025-08-05 21:18:50',5,'update','Marked clockin for employee #:105624 names: JESCAR REHEMA HINZANO. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(248,'2025-08-05 21:18:50',5,'update','Marked clockin for employee #:106350 names: THOYA PATRICK NDURYA. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(249,'2025-08-05 21:18:50',5,'update','Marked clockin for employee #:106408 names: EDWARD MWANGALA TEMBO. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(250,'2025-08-05 21:36:45',5,'update','Marked clockin for employee #:100818 names: JACKLINE MAISY OWIN. Narration:This is another test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(251,'2025-08-05 21:36:45',5,'update','Marked clockin for employee #:102283 names: KETTY WINNY WANDERA. Narration:This is another test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(252,'2025-08-05 21:36:45',5,'update','Marked clockin for employee #:102925 names: ASHA OMAR MWAYAMA. Narration:This is another test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(253,'2025-08-05 21:36:45',5,'update','Marked clockin for employee #:103400 names: MILLYSCENT MANENO OKOTH. Narration:This is another test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(254,'2025-08-05 21:36:45',5,'update','Marked clockin for employee #:103543 names: CECILIA KANII KIOKO. Narration:This is another test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(255,'2025-08-05 21:36:45',5,'update','Marked clockin for employee #:103658 names: LUCAS SOLO SAMMY. Narration:This is another test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(256,'2025-08-05 21:36:45',5,'update','Marked clockin for employee #:104129 names: JACKLINE ANDEYO . Narration:This is another test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(257,'2025-08-05 21:36:45',5,'update','Marked clockin for employee #:104777 names: FATUMA ZULEKHA HASSAN. Narration:This is another test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(258,'2025-08-05 21:36:45',5,'update','Marked clockin for employee #:105353 names: CECELIA CHONI MWAMBAO. Narration:This is another test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(259,'2025-08-05 21:36:45',5,'update','Marked clockin for employee #:106771 names: MARY MILLICENT ONYANGO. Narration:This is another test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(260,'2025-08-05 22:01:05',5,'update','Marked clockin for employee #:107075 names: JANET NYADZUA MBUI. Narration:New test clockin','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(261,'2025-08-05 22:07:10',5,'update','Marked clockin for employee #:100204 names: CONSOLATA KEMUNTO ONDARI. Narration:This is test clock-out from system','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(262,'2025-08-05 22:17:19',5,'update','Changed shift for employee AARON WEKESA WAMALWA payroll#:106702 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(263,'2025-08-05 22:40:41',5,'Update','Updated details of user id 50','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"userid\": 50, \"username\": \"angelakhakula\", \"firstname\": \"Angela\", \"middlename\": \"Khakula\", \"lastname\": \"Makari\", \"email\": \"angelakhakulamakari@gmail.com\", \"mobile\": \"254791362297\", \"password\": \"a217f2abb074f614c1e29b88a31c8326ba169ece9a7e612dc891c51a61ea5411\", \"accountexpires\": 0, \"accountexpirydate\": null, \"changepasswordonlogon\": 0, \"accountactive\": 1, \"reasoninactive\": null, \"dateadded\": \"2025-07-30 05:06:57\", \"addedby\": 5, \"lastmodifiedon\": null, \"lastmodifiedby\": null, \"systemadmin\": 0, \"profilephoto\": null, \"institutionid\": null, \"salt\": \"3ec16c308fb7a5665503\", \"systemlabel\": null, \"category\": \"system\", \"emailactivationcode\": null, \"phoneactivationcode\": null, \"isemployee\": 1, \"employeeid\": 6527}','{\"userid\": 50, \"username\": \"test\", \"firstname\": \"Test\", \"middlename\": \"User\", \"lastname\": \"\", \"email\": \"test@gmail.com\", \"mobile\": \"0712333444\", \"password\": \"a217f2abb074f614c1e29b88a31c8326ba169ece9a7e612dc891c51a61ea5411\", \"accountexpires\": 0, \"accountexpirydate\": null, \"changepasswordonlogon\": 0, \"accountactive\": 1, \"reasoninactive\": null, \"dateadded\": \"2025-07-30 05:06:57\", \"addedby\": 5, \"lastmodifiedon\": \"2025-08-05 22:40:41\", \"lastmodifiedby\": 5, \"systemadmin\": 0, \"profilephoto\": null, \"institutionid\": null, \"salt\": \"3ec16c308fb7a5665503\", \"systemlabel\": null, \"category\": \"system\", \"emailactivationcode\": null, \"phoneactivationcode\": null, \"isemployee\": 1, \"employeeid\": 6527}',NULL),
(264,'2025-08-05 22:40:52',5,'insert','Granted user id:50 name:Test User  access to unit id:2 name:M2','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(265,'2025-08-05 22:43:56',5,'Update','Updated details of user id 50','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"userid\": 50, \"username\": \"test\", \"firstname\": \"Test\", \"middlename\": \"User\", \"lastname\": \"\", \"email\": \"test@gmail.com\", \"mobile\": \"0712333444\", \"password\": \"959a290a74087aed4ba1d2ceec842b1dda92b0573d9cf8f2aa38e2d84acc2437\", \"accountexpires\": 0, \"accountexpirydate\": null, \"changepasswordonlogon\": 0, \"accountactive\": 1, \"reasoninactive\": null, \"dateadded\": \"2025-07-30 05:06:57\", \"addedby\": 5, \"lastmodifiedon\": \"2025-08-05 22:40:41\", \"lastmodifiedby\": 5, \"systemadmin\": 0, \"profilephoto\": null, \"institutionid\": null, \"salt\": \"cde818d4ebb77d96b0e743293eda96\", \"systemlabel\": null, \"category\": \"system\", \"emailactivationcode\": null, \"phoneactivationcode\": null, \"isemployee\": 1, \"employeeid\": 6527}','{\"userid\": 50, \"username\": \"test\", \"firstname\": \"Test\", \"middlename\": \"User\", \"lastname\": \"\", \"email\": \"test@gmail.com\", \"mobile\": \"0712333444\", \"password\": \"959a290a74087aed4ba1d2ceec842b1dda92b0573d9cf8f2aa38e2d84acc2437\", \"accountexpires\": 0, \"accountexpirydate\": null, \"changepasswordonlogon\": 0, \"accountactive\": 1, \"reasoninactive\": null, \"dateadded\": \"2025-07-30 05:06:57\", \"addedby\": 5, \"lastmodifiedon\": \"2025-08-05 22:43:56\", \"lastmodifiedby\": 5, \"systemadmin\": 0, \"profilephoto\": null, \"institutionid\": null, \"salt\": \"cde818d4ebb77d96b0e743293eda96\", \"systemlabel\": null, \"category\": \"system\", \"emailactivationcode\": null, \"phoneactivationcode\": null, \"isemployee\": 1, \"employeeid\": 6527}',NULL),
(266,'2025-08-06 14:09:38',5,'update','Updated employee details for id :6515 staff no:108083 names:BRIMMER MIRIAM KWEYU','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"employeeid\": 6515, \"staffno\": \"108083\", \"firstname\": \"BRIMMER\", \"middlename\": \"MIRIAM\", \"lastname\": \"KWEYU\", \"termid\": 2, \"categoryid\": 1, \"departmentid\": 16, \"religionid\": 1, \"salutationid\": 2, \"iddocumentid\": 1, \"iddocreferenceno\": \"569429776\", \"iddocexpirydate\": null, \"dateofbirth\": \"2005-03-25\", \"gender\": \"female\", \"pinno\": \"A022352515F\", \"nssfno\": \"2059723632\", \"nhifno\": \"CR5688951320535-5\", \"disabled\": 0, \"disabilitytype\": null, \"disabilitydescription\": null, \"disabilitycertificateno\": null, \"onpayroll\": 1, \"fixedpaye\": 0, \"status\": \"active\", \"positionid\": 102, \"jobgroupid\": 1, \"notchid\": 1, \"bankbranchid\": 1542, \"bankaccountnumber\": \"1190186537831\", \"employmentdate\": \"2025-07-08\", \"separationdate\": null, \"separationreason\": null, \"physicaladdress\": \"Mombasa\", \"postaladdress\": \"30780109\", \"town\": \"MTWAPA\", \"postalcode\": \"80109\", \"mobile\": \"254759391472\", \"emailaddress\": \"brimerkweyu@gmail.com\", \"alternativemobile\": null, \"alternativeemailaddress\": null, \"dateadded\": \"2025-07-29 06:33:58\", \"addedby\": 5, \"unitid\": 3, \"shiftid\": 1, \"sectionid\": 60, \"lastmodifiedby\": null, \"lastmodificationdate\": null, \"attendancestatus\": \"active\", \"otapplicable\": 1, \"targetbased\": 1, \"biometricid\": 569429776, \"countryid\": 1}','{\"employeeid\": 6515, \"staffno\": \"108083\", \"firstname\": \"BRIMMER\", \"middlename\": \"MIRIAM\", \"lastname\": \"KWEYU\", \"termid\": 2, \"categoryid\": 1, \"departmentid\": 16, \"religionid\": 1, \"salutationid\": 2, \"iddocumentid\": 1, \"iddocreferenceno\": \"569429776\", \"iddocexpirydate\": \"0000-00-00\", \"dateofbirth\": \"2005-03-25\", \"gender\": \"female\", \"pinno\": \"A022352515F\", \"nssfno\": \"2059723632\", \"nhifno\": \"CR5688951320535-5\", \"disabled\": 0, \"disabilitytype\": \"none\", \"disabilitydescription\": \"\", \"disabilitycertificateno\": \"\", \"onpayroll\": 1, \"fixedpaye\": 0, \"status\": \"active\", \"positionid\": 102, \"jobgroupid\": 1, \"notchid\": 1, \"bankbranchid\": 1542, \"bankaccountnumber\": \"1190186537831\", \"employmentdate\": \"2025-07-08\", \"separationdate\": null, \"separationreason\": null, \"physicaladdress\": \"Mombasa\", \"postaladdress\": \"30780109\", \"town\": \"MTWAPA\", \"postalcode\": \"80109\", \"mobile\": \"254759391472\", \"emailaddress\": \"brimerkweyu@gmail.com\", \"alternativemobile\": \"\", \"alternativeemailaddress\": \"\", \"dateadded\": \"2025-07-29 06:33:58\", \"addedby\": 5, \"unitid\": 3, \"shiftid\": 1, \"sectionid\": 60, \"lastmodifiedby\": null, \"lastmodificationdate\": null, \"attendancestatus\": \"active\", \"otapplicable\": 1, \"targetbased\": 1, \"biometricid\": 569429776, \"countryid\": 1}',NULL),
(267,'2025-08-06 14:12:36',5,'update','Updated employee details for id :6515 staff no:108083 names:BRIMMER MIRIAM KWEYU','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"employeeid\": 6515, \"staffno\": \"108083\", \"firstname\": \"BRIMMER\", \"middlename\": \"MIRIAM\", \"lastname\": \"KWEYU\", \"termid\": 2, \"categoryid\": 1, \"departmentid\": 16, \"religionid\": 1, \"salutationid\": 2, \"iddocumentid\": 1, \"iddocreferenceno\": \"569429776\", \"iddocexpirydate\": \"0000-00-00\", \"dateofbirth\": \"2005-03-25\", \"gender\": \"female\", \"pinno\": \"A022352515F\", \"nssfno\": \"2059723632\", \"nhifno\": \"CR5688951320535-5\", \"disabled\": 0, \"disabilitytype\": \"none\", \"disabilitydescription\": \"\", \"disabilitycertificateno\": \"\", \"onpayroll\": 1, \"fixedpaye\": 0, \"status\": \"active\", \"positionid\": 102, \"jobgroupid\": 1, \"notchid\": 1, \"bankbranchid\": 1542, \"bankaccountnumber\": \"1190186537831\", \"employmentdate\": \"2025-07-08\", \"separationdate\": null, \"separationreason\": null, \"physicaladdress\": \"Mombasa\", \"postaladdress\": \"30780109\", \"town\": \"MTWAPA\", \"postalcode\": \"80109\", \"mobile\": \"254759391472\", \"emailaddress\": \"brimerkweyu@gmail.com\", \"alternativemobile\": \"\", \"alternativeemailaddress\": \"\", \"dateadded\": \"2025-07-29 06:33:58\", \"addedby\": 5, \"unitid\": 3, \"shiftid\": 1, \"sectionid\": 60, \"lastmodifiedby\": null, \"lastmodificationdate\": null, \"attendancestatus\": \"active\", \"otapplicable\": 1, \"targetbased\": 1, \"biometricid\": 569429776, \"countryid\": 1}','{\"employeeid\": 6515, \"staffno\": \"108083\", \"firstname\": \"BRIMMER\", \"middlename\": \"MIRIAM\", \"lastname\": \"KWEYU\", \"termid\": 2, \"categoryid\": 1, \"departmentid\": 16, \"religionid\": 1, \"salutationid\": 2, \"iddocumentid\": 1, \"iddocreferenceno\": \"569429776\", \"iddocexpirydate\": \"0000-00-00\", \"dateofbirth\": \"2005-03-25\", \"gender\": \"female\", \"pinno\": \"A022352515F\", \"nssfno\": \"2059723632\", \"nhifno\": \"CR5688951320535-5\", \"disabled\": 0, \"disabilitytype\": \"none\", \"disabilitydescription\": \"\", \"disabilitycertificateno\": \"\", \"onpayroll\": 1, \"fixedpaye\": 0, \"status\": \"active\", \"positionid\": 102, \"jobgroupid\": 1, \"notchid\": 1, \"bankbranchid\": 1658, \"bankaccountnumber\": \"1190186537831\", \"employmentdate\": \"2025-07-08\", \"separationdate\": null, \"separationreason\": null, \"physicaladdress\": \"Mombasa\", \"postaladdress\": \"30780109\", \"town\": \"MTWAPA\", \"postalcode\": \"80109\", \"mobile\": \"254759391472\", \"emailaddress\": \"brimerkweyu@gmail.com\", \"alternativemobile\": \"\", \"alternativeemailaddress\": \"\", \"dateadded\": \"2025-07-29 06:33:58\", \"addedby\": 5, \"unitid\": 3, \"shiftid\": 1, \"sectionid\": 60, \"lastmodifiedby\": null, \"lastmodificationdate\": null, \"attendancestatus\": \"active\", \"otapplicable\": 1, \"targetbased\": 1, \"biometricid\": 569429776, \"countryid\": 1}',NULL),
(268,'2025-08-07 14:16:37',5,'insert','Create leave type id:7 name;TEST LEAVE','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(269,'2025-08-07 14:25:03',5,'insert','Create leave type id:8 name;Another Test Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(270,'2025-08-07 14:25:58',5,'update',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"leaveid\": 2, \"leavename\": \"Annual Leave\", \"allocationdays\": 21, \"probationperiod\": 60, \"canbesplit\": 1, \"halfdayapplication\": 1, \"skipsholidays\": 1, \"applywithoutallocation\": 0, \"requiresattachment\": 0, \"approvalflow\": 1, \"allowancepayable\": 1, \"allowancepayrollitemid\": 16, \"dateadded\": \"2024-08-03 21:26:23\", \"deleted\": 0, \"addedby\": 5, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": \"ANNUAL LEAVE\", \"abbreviation\": \"AL\", \"overridespublicholidays\": 0}','{\"leaveid\": 2, \"leavename\": \"Annual Leave\", \"allocationdays\": 21, \"probationperiod\": 60, \"canbesplit\": 1, \"halfdayapplication\": 1, \"skipsholidays\": 1, \"applywithoutallocation\": 1, \"requiresattachment\": 0, \"approvalflow\": 1, \"allowancepayable\": 1, \"allowancepayrollitemid\": 16, \"dateadded\": \"2024-08-03 21:26:23\", \"deleted\": 0, \"addedby\": 5, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": \"ANNUAL LEAVE\", \"abbreviation\": \"AL\", \"overridespublicholidays\": 0}',NULL),
(271,'2025-08-07 15:12:50',5,'insert','Created leave application  id:13 for Employee Id: 1325 Staff #: 100182 Names: ABEDNEGO KILELE MAKAU Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(272,'2025-08-07 15:13:39',5,'insert','Created leave application  id:14 for Employee Id: 2019 Staff #: 104153 Names: AGNES NGUI  Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(273,'2025-08-07 15:14:57',5,'insert','Created leave application  id:15 for Employee Id: 1420 Staff #: 100616 Names: AGNETER MWANYALO MALEMBA Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(274,'2025-08-07 15:14:57',5,'insert','Approved leave application of leave, id 15 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(275,'2025-08-07 15:14:57',5,'insert','Approved leave application of leave, id 15 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(276,'2025-08-07 15:14:57',5,'insert','Approved leave application of leave, id 15 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(277,'2025-08-07 15:16:43',5,'insert','Created leave application  id:16 for Employee Id: 1325 Staff #: 100182 Names: ABEDNEGO KILELE MAKAU Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(278,'2025-08-07 15:16:43',5,'insert','Approved leave application of leave, id 16 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(279,'2025-08-07 15:16:43',5,'insert','Approved leave application of leave, id 16 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(280,'2025-08-07 15:16:43',5,'insert','Approved leave application of leave, id 16 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(281,'2025-08-07 15:16:43',5,'insert','Created leave application  id:17 for Employee Id: 2019 Staff #: 104153 Names: AGNES NGUI  Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(282,'2025-08-07 15:16:43',5,'insert','Approved leave application of leave, id 17 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(283,'2025-08-07 15:16:43',5,'insert','Approved leave application of leave, id 17 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(284,'2025-08-07 15:16:43',5,'insert','Approved leave application of leave, id 17 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(285,'2025-08-07 15:16:44',5,'insert','Created leave application  id:18 for Employee Id: 1420 Staff #: 100616 Names: AGNETER MWANYALO MALEMBA Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(286,'2025-08-07 15:16:44',5,'insert','Approved leave application of leave, id 18 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(287,'2025-08-07 15:16:44',5,'insert','Approved leave application of leave, id 18 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(288,'2025-08-07 15:16:44',5,'insert','Approved leave application of leave, id 18 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(289,'2025-08-07 15:18:43',5,'insert','Created new overtime requisition number:OTR00018 id:1','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(290,'2025-08-07 15:36:58',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id4 unit name:Global Staff','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(291,'2025-08-07 15:36:58',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id1 unit name:M1','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(292,'2025-08-07 15:36:58',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id2 unit name:M2','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(293,'2025-08-07 15:36:58',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id6 unit name:M4','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(294,'2025-08-07 15:36:58',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id5 unit name:M5','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(295,'2025-08-07 15:36:58',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id3 unit name:M6','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(296,'2025-08-07 15:38:16',5,'Insert','Approved overtime requisition id:1 no:OTR00018 for level:Production Manager narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(297,'2025-08-07 15:39:03',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id4 unit name:Global Staff','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(298,'2025-08-07 15:39:03',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id4 unit name:Global Staff','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(299,'2025-08-07 15:39:03',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id1 unit name:M1','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(300,'2025-08-07 15:39:03',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id1 unit name:M1','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(301,'2025-08-07 15:39:03',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id2 unit name:M2','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(302,'2025-08-07 15:39:03',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id2 unit name:M2','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(303,'2025-08-07 15:39:03',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id6 unit name:M4','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(304,'2025-08-07 15:39:03',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id6 unit name:M4','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(305,'2025-08-07 15:39:03',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id5 unit name:M5','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(306,'2025-08-07 15:39:03',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id5 unit name:M5','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(307,'2025-08-07 15:39:03',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id3 unit name:M6','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(308,'2025-08-07 15:39:03',5,'Insert','Added overtime approval privilege for user id:5 name:System Administrator  for unit id3 unit name:M6','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(309,'2025-08-07 15:39:25',5,'Insert','Approved overtime requisition id:1 no:OTR00018 for level:Factory Manager narration:This is a test approval','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(310,'2025-08-07 15:39:36',5,'Insert','Approved overtime requisition id:1 no:OTR00018 for level:Human Resource narration:This is ok','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(311,'2025-08-07 15:47:24',5,'update','Updated employee details for id :6494 staff no:108097 names:BEATRICE MUSENYA MUSUMBA','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"employeeid\": 6494, \"staffno\": \"108097\", \"firstname\": \"BEATRICE\", \"middlename\": \"MUSENYA\", \"lastname\": \"MUSUMBA\", \"termid\": 2, \"categoryid\": 1, \"departmentid\": 16, \"religionid\": 1, \"salutationid\": 2, \"iddocumentid\": 1, \"iddocreferenceno\": \"33803804\", \"iddocexpirydate\": null, \"dateofbirth\": \"1996-08-15\", \"gender\": \"female\", \"pinno\": \"A012835221Q\", \"nssfno\": \"2025244968\", \"nhifno\": \"CR4810084857599-6\", \"disabled\": 0, \"disabilitytype\": null, \"disabilitydescription\": null, \"disabilitycertificateno\": null, \"onpayroll\": 1, \"fixedpaye\": 0, \"status\": \"active\", \"positionid\": 102, \"jobgroupid\": 1, \"notchid\": 1, \"bankbranchid\": 1542, \"bankaccountnumber\": \"1200178506083\", \"employmentdate\": \"2025-07-08\", \"separationdate\": null, \"separationreason\": null, \"physicaladdress\": \"Mombasa\", \"postaladdress\": \"30780109\", \"town\": \"MTWAPA\", \"postalcode\": \"80109\", \"mobile\": \"254112639391\", \"emailaddress\": \"beatricemasumba1996@gmail.com\", \"alternativemobile\": null, \"alternativeemailaddress\": null, \"dateadded\": \"2025-07-29 06:33:58\", \"addedby\": 5, \"unitid\": 2, \"shiftid\": 1, \"sectionid\": 74, \"lastmodifiedby\": null, \"lastmodificationdate\": null, \"attendancestatus\": \"active\", \"otapplicable\": 1, \"targetbased\": 1, \"biometricid\": 33803804, \"countryid\": 1}','{\"employeeid\": 6494, \"staffno\": \"108097\", \"firstname\": \"BEATRICE\", \"middlename\": \"MUSENYA\", \"lastname\": \"MUSUMBA\", \"termid\": 2, \"categoryid\": 1, \"departmentid\": 16, \"religionid\": 1, \"salutationid\": 2, \"iddocumentid\": 1, \"iddocreferenceno\": \"33803804\", \"iddocexpirydate\": \"0000-00-00\", \"dateofbirth\": \"1996-08-15\", \"gender\": \"female\", \"pinno\": \"A012835221Q\", \"nssfno\": \"2025244968\", \"nhifno\": \"CR4810084857599-6\", \"disabled\": 0, \"disabilitytype\": \"none\", \"disabilitydescription\": \"\", \"disabilitycertificateno\": \"\", \"onpayroll\": 1, \"fixedpaye\": 0, \"status\": \"active\", \"positionid\": 102, \"jobgroupid\": 1, \"notchid\": 1, \"bankbranchid\": 1718, \"bankaccountnumber\": \"1200178506083\", \"employmentdate\": \"2025-07-08\", \"separationdate\": null, \"separationreason\": null, \"physicaladdress\": \"Mombasa\", \"postaladdress\": \"30780109\", \"town\": \"MTWAPA\", \"postalcode\": \"80109\", \"mobile\": \"254112639391\", \"emailaddress\": \"beatricemasumba1996@gmail.com\", \"alternativemobile\": \"\", \"alternativeemailaddress\": \"\", \"dateadded\": \"2025-07-29 06:33:58\", \"addedby\": 5, \"unitid\": 2, \"shiftid\": 1, \"sectionid\": 74, \"lastmodifiedby\": null, \"lastmodificationdate\": null, \"attendancestatus\": \"active\", \"otapplicable\": 1, \"targetbased\": 1, \"biometricid\": 33803804, \"countryid\": 1}',NULL),
(312,'2025-08-08 13:36:39',50,'update','Marked employee #:100077 names: SERAPHINE KHAMUSALI SHIKAL as present. Narration: This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(313,'2025-08-08 13:38:53',50,'update','Marked employee #:100153 names: JANETER MUMBI NZUMU as present. Narration: This is another test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(314,'2025-08-08 13:41:14',50,'update','Marked employee #:100163 names: RACHAEL MBONE  as present. Narration: This is another test','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(315,'2025-08-08 13:48:50',50,'update','Marked employee #:100211 names: MARIAM OKETCH MAKUKHA as present. Narration: This is test present randomize','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(316,'2025-08-08 13:49:20',50,'update','Marked employee #:100224 names: MAGDALENE MACHOCHO MWASHOR as present. Narration: ','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(317,'2025-08-08 14:10:44',50,'update','Marked clockin for employee #:100206 names: CATHERINE MUNGUTI . Narration:','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(318,'2025-08-08 16:43:51',5,'Delete','Removed role id:1 role name:Payroll Clerk from user id:5 username:admin (System Administrator )','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(319,'2025-08-08 16:49:49',5,'Delete','Removed role id:1 role name:Payroll Clerk from user id:5 username:admin (System Administrator )','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(320,'2025-08-08 16:57:49',5,'update',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(321,'2025-08-08 18:26:53',5,'update',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(322,'2025-08-08 18:27:09',5,'update',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(323,'2025-08-08 18:29:12',5,'update',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(324,'2025-08-08 18:33:15',5,'update',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(325,'2025-08-08 18:33:15',5,'update',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(326,'2025-08-08 18:44:38',5,'update',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(327,'2025-08-08 18:44:38',5,'update',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(328,'2025-08-08 18:46:15',5,'update',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(329,'2025-08-08 18:52:24',5,'update','Marked employee #:100171 names: KEVIN OKOTH NYAMANGA as absent. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(330,'2025-08-08 18:52:24',5,'update','Marked employee #:100199 names: MORRIS MUSANI KYUSYA as absent. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(331,'2025-08-10 15:25:56',5,'update','Changed shift for employee AARON MUNYWOKI KAENDI payroll#:107457 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(332,'2025-08-10 15:25:56',5,'update','Changed shift for employee AARON WEKESA WAMALWA payroll#:106702 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(333,'2025-08-10 15:25:56',5,'update','Changed shift for employee ABEDNEGO KILELE MAKAU payroll#:100182 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(334,'2025-08-10 15:25:56',5,'update','Changed shift for employee ABIGAEL KAVULA NDONYI payroll#:104158 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(335,'2025-08-10 15:25:56',5,'update','Changed shift for employee ABIGAEL MUSENYA LOISE payroll#:104246 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(336,'2025-08-10 15:25:56',5,'update','Changed shift for employee ABIGAIL MWIKALI KITHINGO payroll#:103118 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(337,'2025-08-10 15:25:56',5,'update','Changed shift for employee ACHIENG ELIZABETH ODERA payroll#:103760 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(338,'2025-08-10 15:25:56',5,'update','Changed shift for employee ADHIAMBO MARY OMENO payroll#:103148 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(339,'2025-08-10 15:25:56',5,'update','Changed shift for employee ADOLPHINAH MWAMVUA LUCAS payroll#:102862 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(340,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGADA MUSIRA KACHIA payroll#:100069 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(341,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGNES AKULIMA TATWA payroll#:102916 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(342,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGNES ATIENO OKUMU payroll#:104371 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(343,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGNES CHONI KATANA payroll#:106010 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(344,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGNES KASAMU MALUNI payroll#:103200 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(345,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGNES MUMBE NDULU payroll#:100799 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(346,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGNES MUSANGI MUTEMWA payroll#:104021 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(347,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGNES MWIKALI KITHEKA payroll#:101153 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(348,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGNES NGUI  payroll#:104153 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(349,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGNES NZISA NDAMBU payroll#:107611 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(350,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGNESS NZEMBI HASSAN payroll#:100126 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(351,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGNETA KADZO KARISA payroll#:103897 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(352,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGNETA TELESIA NZUKI payroll#:105946 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(353,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGNETER MWANYALO MALEMBA payroll#:100616 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(354,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGNETOR WAYUA MASEKI payroll#:103409 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(355,'2025-08-10 15:25:57',5,'update','Changed shift for employee AGOSTINA NZEMBI MUTHAMA payroll#:103639 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(356,'2025-08-10 15:25:57',5,'update','Changed shift for employee AKINYI MAUREEN ADHIAMBO payroll#:104248 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(357,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALBERT MWALIMO MWANZIGHE payroll#:100610 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(358,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALEXANDER NZOMO MASESI payroll#:104414 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(359,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALFRED MTAMU KISAKA payroll#:107814 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(360,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALICE ATIENO ODUOR payroll#:100236 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(361,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALICE CHARI MRWAA payroll#:104040 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(362,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALICE KALEKYE BENJAMIN payroll#:103079 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(363,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALICE KAMBUA MUSYOKI payroll#:105116 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(364,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALICE KASYOKA QUEEN payroll#:102819 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(365,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALICE KASYOKA TITUS payroll#:106647 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(366,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALICE KYUA MUSEMBI payroll#:107721 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(367,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALICE MBITHE MUTHAMA payroll#:107666 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(368,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALICE MBOVI KITHUKA payroll#:106017 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(369,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALICE MUTHEU JUMA payroll#:104018 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(370,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALICE MUTHEU SAMMY payroll#:101790 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(371,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALICE MWENDE MWEMA payroll#:106374 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(372,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALICE SANTA MALINGI payroll#:102455 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(373,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALICE WAKESHO MWARIMBO payroll#:104196 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(374,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALISHA RIZIKI KATANA payroll#:101728 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(375,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALLAN AMUYUNZU AYODI payroll#:106138 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(376,'2025-08-10 15:25:57',5,'update','Changed shift for employee ALPHONCE NGALA CHARO payroll#:100974 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(377,'2025-08-10 15:25:57',5,'update','Changed shift for employee AMEZE MUENDI MAKAU payroll#:103567 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(378,'2025-08-10 15:25:57',5,'update','Changed shift for employee AMINA JOSEPH MATUKU payroll#:104348 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(379,'2025-08-10 15:25:57',5,'update','Changed shift for employee AMINA KUVUNA NYOKA payroll#:107548 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(380,'2025-08-10 15:25:57',5,'update','Changed shift for employee AMINA MEDZA JOHN payroll#:107491 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(381,'2025-08-10 15:25:58',5,'update','Changed shift for employee AMINA MJENI MWARUWA payroll#:101729 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(382,'2025-08-10 15:25:58',5,'update','Changed shift for employee AMINA TSADZA FONDO payroll#:107698 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(383,'2025-08-10 15:25:58',5,'update','Changed shift for employee AMOS MUMO MULYUNGI payroll#:100252 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(384,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANAHSTACIA KAVUTHA MUTHAMA payroll#:100947 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(385,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANASTACIA MANGA KALAMA payroll#:107711 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(386,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANASTANCIA VERONICA SIMIYU payroll#:103140 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(387,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANDREW MARTIN  payroll#:100405 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(388,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANDREW MULEI MAUNDU payroll#:107965 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(389,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANET MWANASITI KARISA payroll#:102156 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(390,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANGELA MBULA MUANGE payroll#:102302 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(391,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANGELA SAINA MAINGI payroll#:100417 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(392,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANGELA WANGA CHIBOLE payroll#:102788 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(393,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANGELICA MLELWA ZAWADI payroll#:100304 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(394,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANGELINE KAVESE NDUNGA payroll#:104575 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(395,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANGELINE MAINA MORARA payroll#:100965 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(396,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANGELLAH KATOI JANET payroll#:107630 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(397,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANN NDEVE WAMBUA payroll#:103884 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(398,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANN NJERI MATHENGE payroll#:104114 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(399,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANN PAUL  payroll#:101968 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(400,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANN WANDIA GACHUHI payroll#:103007 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(401,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNA KAMBUA PETER payroll#:101014 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(402,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNA KAMENE WAMBUA payroll#:107703 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(403,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNA MWIA MAKAU payroll#:103041 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(404,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNA VAATI MUNYAO payroll#:101451 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(405,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNA WAYUA MUTUA payroll#:100829 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(406,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNAH ATIENO ANGANG\"O payroll#:102751 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(407,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNAH KALUMU MWANGU payroll#:107550 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(408,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNAH KAMENE QUEEN payroll#:107609 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(409,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNAH MUENI KASINA payroll#:103321 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(410,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNAH MWIKALI MUENI payroll#:102698 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(411,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNAH NYAMOKI MBAJI payroll#:101983 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(412,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNAH NZISA MUTUKU payroll#:102476 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(413,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNAH WANTHI NZOKA payroll#:102820 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(414,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNASTACIA APHIA KIMWELE payroll#:102485 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(415,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNASTACIA MUSENYA MBULI payroll#:104334 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(416,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNASTACIA NTHAMBI MUSYOKA payroll#:101592 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(417,'2025-08-10 15:25:58',5,'update','Changed shift for employee ANNASTACIA SYOMBUA MUTUNGI payroll#:104245 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(418,'2025-08-10 15:25:59',5,'update','Changed shift for employee ANNASTACIAH KALEKYE  payroll#:102016 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(419,'2025-08-10 15:25:59',5,'update','Changed shift for employee ANNATOLIA KITAWA MWADIME payroll#:101754 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(420,'2025-08-10 15:25:59',5,'update','Changed shift for employee ANNE ATIENO OGINGA payroll#:104505 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(421,'2025-08-10 15:25:59',5,'update','Changed shift for employee ANNE AYOO ODUORI payroll#:104023 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(422,'2025-08-10 15:25:59',5,'update','Changed shift for employee ANNE NANJALA WANYAMA payroll#:103048 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(423,'2025-08-10 15:25:59',5,'update','Changed shift for employee ANNE SALOME MASINDE payroll#:103481 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(424,'2025-08-10 15:25:59',5,'update','Changed shift for employee ANNE VAATI MUTHUI payroll#:101046 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(425,'2025-08-10 15:25:59',5,'update','Changed shift for employee ANNET NAFUNA NYONGESA payroll#:102816 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(426,'2025-08-10 15:25:59',5,'update','Changed shift for employee ANTHONY MUGENDI MWITHI payroll#:107488 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(427,'2025-08-10 15:25:59',5,'update','Changed shift for employee ANTONINA VIOLET AKODOI payroll#:100451 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(428,'2025-08-10 15:25:59',5,'update','Changed shift for employee ANTONY WANYAMA  payroll#:105772 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(429,'2025-08-10 15:25:59',5,'update','Changed shift for employee ARWA AOKO CARROLINE payroll#:102787 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(430,'2025-08-10 15:25:59',5,'update','Changed shift for employee ASHA JUMA MBAJI payroll#:103347 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(431,'2025-08-10 15:25:59',5,'update','Changed shift for employee ASHA NZALAMBI JUMAA payroll#:104430 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(432,'2025-08-10 15:25:59',5,'update','Changed shift for employee ASHA OMAR MWAYAMA payroll#:102925 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(433,'2025-08-10 15:25:59',5,'update','Changed shift for employee ASHA RAMA RAMTU payroll#:105139 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(434,'2025-08-10 15:25:59',5,'update','Changed shift for employee ASHA SALIM NGANZI payroll#:102983 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(435,'2025-08-10 15:25:59',5,'update','Changed shift for employee ASIA MNYAZI ALI payroll#:103082 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(436,'2025-08-10 15:25:59',5,'update','Changed shift for employee ASMA KUVA MWINGA payroll#:104275 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(437,'2025-08-10 15:25:59',5,'update','Changed shift for employee ASSUMPTAH NDUKU KILYUNGI payroll#:104703 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(438,'2025-08-10 15:25:59',5,'update','Changed shift for employee ATHUMAN CHOMBO MWARINGA payroll#:101350 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(439,'2025-08-10 15:25:59',5,'update','Changed shift for employee AUMA EUPHINE OMOLLO payroll#:103795 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(440,'2025-08-10 15:25:59',5,'update','Changed shift for employee AZIZA SIDI ASILI payroll#:104454 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(441,'2025-08-10 15:25:59',5,'update','Changed shift for employee BAHATI BEJA  payroll#:101991 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(442,'2025-08-10 15:25:59',5,'update','Changed shift for employee BAHATI NYAMVULA MAZURI payroll#:103818 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(443,'2025-08-10 15:25:59',5,'update','Changed shift for employee BAIJU JACOB  payroll#:100446 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(444,'2025-08-10 15:25:59',5,'update','Changed shift for employee BEATRICE ADHIAMBO JUMA payroll#:102682 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(445,'2025-08-10 15:25:59',5,'update','Changed shift for employee BEATRICE ADHIAMBO OTIENO payroll#:100988 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(446,'2025-08-10 15:25:59',5,'update','Changed shift for employee BEATRICE APONDI AKUNDA payroll#:103349 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(447,'2025-08-10 15:25:59',5,'update','Changed shift for employee BEATRICE BIBI MUNGA payroll#:103856 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(448,'2025-08-10 15:25:59',5,'update','Changed shift for employee BEATRICE JEPKURGAT KOSGEI payroll#:104311 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(449,'2025-08-10 15:25:59',5,'update','Changed shift for employee BEATRICE KATSUHENI CHARO payroll#:102444 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(450,'2025-08-10 15:25:59',5,'update','Changed shift for employee BEATRICE KATUI KAKULI payroll#:100157 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(451,'2025-08-10 15:25:59',5,'update','Changed shift for employee BEATRICE KAVINYA NYAMAI payroll#:105686 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(452,'2025-08-10 15:25:59',5,'update','Changed shift for employee BEATRICE MEDZA MWAKOYO payroll#:101010 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(453,'2025-08-10 15:25:59',5,'update','Changed shift for employee BEATRICE MKAMBURI  payroll#:102502 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(454,'2025-08-10 15:26:00',5,'update','Changed shift for employee BEATRICE MUSENYA MUSUMBA payroll#:108097 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(455,'2025-08-10 15:26:00',5,'update','Changed shift for employee BEATRICE MUTANU MUNYITHYA payroll#:101898 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(456,'2025-08-10 15:26:00',5,'update','Changed shift for employee BEATRICE NYASI MWAMBURI payroll#:102982 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(457,'2025-08-10 15:26:00',5,'update','Changed shift for employee BEATRICE TATU WANJE payroll#:104269 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(458,'2025-08-10 15:26:00',5,'update','Changed shift for employee BEATRICE WAMBUGHA WAMWANDU payroll#:102235 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(459,'2025-08-10 15:26:00',5,'update','Changed shift for employee BELINDA AUMA ODHIAMBO payroll#:103394 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(460,'2025-08-10 15:26:00',5,'update','Changed shift for employee BENALINE CHERONO  payroll#:102396 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(461,'2025-08-10 15:26:00',5,'update','Changed shift for employee BENARD SIFUNA NYONGESA payroll#:104182 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(462,'2025-08-10 15:26:00',5,'update','Changed shift for employee BENITOR KAMENE MATI payroll#:102150 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(463,'2025-08-10 15:26:00',5,'update','Changed shift for employee BENSON ALUSHULA ANGOTE payroll#:100612 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(464,'2025-08-10 15:26:00',5,'update','Changed shift for employee BENSON MUSYOKI MUINDUKO payroll#:100615 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(465,'2025-08-10 15:26:00',5,'update','Changed shift for employee BENSON MUTUKU  payroll#:104820 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(466,'2025-08-10 15:26:00',5,'update','Changed shift for employee BENSON TITO MUEMA payroll#:103291 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(467,'2025-08-10 15:26:00',5,'update','Changed shift for employee BENTA AWUOR OMONDI payroll#:103093 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(468,'2025-08-10 15:26:00',5,'update','Changed shift for employee BERINABETA WAWUDA CHOLA payroll#:102398 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(469,'2025-08-10 15:26:00',5,'update','Changed shift for employee BERINES SAMI OSANYA payroll#:104280 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(470,'2025-08-10 15:26:00',5,'update','Changed shift for employee BERNARD MAMAI JUSTUS payroll#:102924 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(471,'2025-08-10 15:26:00',5,'update','Changed shift for employee BERNARD OUMA OCHIENG payroll#:104577 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(472,'2025-08-10 15:26:00',5,'update','Changed shift for employee BERRINE MBEYU CHIKOKO payroll#:103656 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(473,'2025-08-10 15:26:00',5,'update','Changed shift for employee BETH MWIKALI MUTUKU payroll#:103414 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(474,'2025-08-10 15:26:00',5,'update','Changed shift for employee BETH NZAKU MWEU payroll#:101753 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(475,'2025-08-10 15:26:00',5,'update','Changed shift for employee BETRICE KASIVA PAUL payroll#:106883 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(476,'2025-08-10 15:26:00',5,'update','Changed shift for employee BETTY KATHULE KAVINYA payroll#:101329 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(477,'2025-08-10 15:26:00',5,'update','Changed shift for employee BETTY SADA KATANA payroll#:103979 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(478,'2025-08-10 15:26:00',5,'update','Changed shift for employee BETTY ZIGHE MWAWUGANGA payroll#:101884 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(479,'2025-08-10 15:26:00',5,'update','Changed shift for employee BIBI OMARI SAGA payroll#:105698 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(480,'2025-08-10 15:26:00',5,'update','Changed shift for employee BIBIAN MGHOI ILUME payroll#:101993 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(481,'2025-08-10 15:26:00',5,'update','Changed shift for employee BIHIJA KWEKWE WASHE payroll#:102286 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(482,'2025-08-10 15:26:00',5,'update','Changed shift for employee BILLY NERIMA MULINDO payroll#:100323 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(483,'2025-08-10 15:26:00',5,'update','Changed shift for employee BONFACE ASIENWA  payroll#:104263 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(484,'2025-08-10 15:26:00',5,'update','Changed shift for employee BONFACE MATHINA MUIA payroll#:104461 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(485,'2025-08-10 15:26:00',5,'update','Changed shift for employee BONIFACE MUTISO MUSYOKI payroll#:106051 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(486,'2025-08-10 15:26:00',5,'update','Changed shift for employee BONIFACE MWINZAI KASYOKA payroll#:107769 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(487,'2025-08-10 15:26:00',5,'update','Changed shift for employee BRENDA ACHIENG ALOO payroll#:102764 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(488,'2025-08-10 15:26:00',5,'update','Changed shift for employee BRENDA AKINYI  payroll#:106015 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(489,'2025-08-10 15:26:00',5,'update','Changed shift for employee BRENDA KARAMBU GIKUNDA payroll#:103842 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(490,'2025-08-10 15:26:00',5,'update','Changed shift for employee BRENDA MECAN WASWA payroll#:102712 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(491,'2025-08-10 15:26:00',5,'update','Changed shift for employee BRENDA NANGIRA  payroll#:106209 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(492,'2025-08-10 15:26:00',5,'update','Changed shift for employee BRENDA NASIMIYU WANYAMA payroll#:102262 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(493,'2025-08-10 15:26:00',5,'update','Changed shift for employee BRENDA NDUNGE KYENZIE payroll#:103770 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(494,'2025-08-10 15:26:00',5,'update','Changed shift for employee BRENDA SHIMULI WANJALA payroll#:104502 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(495,'2025-08-10 15:26:00',5,'update','Changed shift for employee BRENDA WANJA  payroll#:107626 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(496,'2025-08-10 15:26:00',5,'update','Changed shift for employee BRIAN BOSIRE OICHOE payroll#:100531 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(497,'2025-08-10 15:26:00',5,'update','Changed shift for employee BRIAN MAUNDU KYALO payroll#:101608 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(498,'2025-08-10 15:26:00',5,'update','Changed shift for employee BRIAN MUNYAO SAMMY payroll#:104574 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(499,'2025-08-10 15:26:00',5,'update','Changed shift for employee BRIAN MUTUMA MUTEGI payroll#:103648 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(500,'2025-08-10 15:26:00',5,'update','Changed shift for employee BRIAN NDUNG\'U  payroll#:107417 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(501,'2025-08-10 15:26:01',5,'update','Changed shift for employee BRIAN OUMA RACHILO payroll#:100080 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(502,'2025-08-10 15:26:01',5,'update','Changed shift for employee BRIAN WAFULA OKUTOYI payroll#:102504 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(503,'2025-08-10 15:26:01',5,'update','Changed shift for employee BRIAN WANJE KEAH payroll#:103641 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(504,'2025-08-10 15:26:01',5,'update','Changed shift for employee BRIDGIT ASHA KITSAO payroll#:105945 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(505,'2025-08-10 15:26:01',5,'update','Changed shift for employee BRIDGIT RHODA MWEU payroll#:104241 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(506,'2025-08-10 15:26:01',5,'update','Changed shift for employee CALLEN MORAA MOGIRI payroll#:102131 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(507,'2025-08-10 15:26:01',5,'update','Changed shift for employee CALVIN OGOLA  payroll#:100158 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(508,'2025-08-10 15:26:01',5,'update','Changed shift for employee CALVINCE OMONDI OTIENO payroll#:104959 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(509,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAREN AKUMU OCHIENG payroll#:103995 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(510,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAREN CLARE OUNDO payroll#:101733 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(511,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAREN NALIAKA WANJALA payroll#:106500 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(512,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAREN NDINDA KIMUYU payroll#:107809 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(513,'2025-08-10 15:26:01',5,'update','Changed shift for employee CARINA ITIEVA AKOLA payroll#:104267 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(514,'2025-08-10 15:26:01',5,'update','Changed shift for employee CARO KAWAYA KANINI payroll#:106403 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(515,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROL KAVINYA MWANGANGI payroll#:101743 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(516,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROL MWONGELI MUSEE payroll#:106012 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(517,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLINE AWOUR OLIEWO payroll#:101670 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(518,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLINE CHIRINDO NZAKA payroll#:104034 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(519,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLINE JUDITH ONYANGO payroll#:100105 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(520,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLINE KAKWASI KILONZO payroll#:100090 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(521,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLINE KALONDU KAMUNZYU payroll#:101301 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(522,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLINE MOSE MCHOMBO payroll#:105941 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(523,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLINE MUMBUA MUTUA payroll#:103415 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(524,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLINE MUTONO MUTHOKA payroll#:102596 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(525,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLINE MWENDE MBITHE payroll#:107675 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(526,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLINE MWIKALI SAMUEL payroll#:103876 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(527,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLINE NDINDA MUTISO payroll#:105138 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(528,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLINE NEKESA BARASA payroll#:100179 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(529,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLYNE GRACE OD payroll#:100294 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(530,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLYNE KHABWAYI ESABWA payroll#:104509 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(531,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLYNE NAFULA MUDIBO payroll#:102341 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(532,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLYNE NANZAI OSUNDWA payroll#:102601 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(533,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLYNE NDANU KAUNDA payroll#:107624 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(534,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLYNE NDUNGE MUSYOKI payroll#:103085 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(535,'2025-08-10 15:26:01',5,'update','Changed shift for employee CAROLYNE WAIRIMU KANGETHE payroll#:107621 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(536,'2025-08-10 15:26:01',5,'update','Changed shift for employee CARROLYNE ATIENO OCHIENG payroll#:101740 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(537,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE AWUOR OTIENO payroll#:102507 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(538,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE DENA MKEMBI payroll#:102457 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(539,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE KADESA OGOVA payroll#:100068 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(540,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE KALEE KITOU payroll#:107812 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(541,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE KAMENE KIOKO payroll#:102715 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(542,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE KASYOKA JOSEPH payroll#:105311 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(543,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE KATHINI MOKI payroll#:107625 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(544,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE MARY NDUNGULI payroll#:106493 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(545,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE MBITHE MULI payroll#:102000 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(546,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE MUNGUTI  payroll#:100206 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(547,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE MUTIE  payroll#:103319 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(548,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE MWENDE MAKUSA payroll#:100481 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(549,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE NDANU NGULA payroll#:102326 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(550,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE NGINA KIIO payroll#:100144 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(551,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE NTHENYA KISYOKA payroll#:103769 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(552,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHERINE WALENGWA MALIMO payroll#:100145 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(553,'2025-08-10 15:26:02',5,'update','Changed shift for employee CATHRINE ATIENO OTIANGA payroll#:100071 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(554,'2025-08-10 15:26:02',5,'update','Changed shift for employee CECILIA KAVATA MUTANGILI payroll#:104480 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(555,'2025-08-10 15:26:02',5,'update','Changed shift for employee CECILIAH MBUTHA MUTUNGA payroll#:107702 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(556,'2025-08-10 15:26:02',5,'update','Changed shift for employee CECILIAH TALU MWANDAGHA payroll#:103947 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(557,'2025-08-10 15:26:02',5,'update','Changed shift for employee CELESTINA CHARI MKALA payroll#:102218 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(558,'2025-08-10 15:26:02',5,'update','Changed shift for employee CELESTINE NANDWA ESPIRA payroll#:103341 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(559,'2025-08-10 15:26:02',5,'update','Changed shift for employee CELESTINE NZULA PETER payroll#:102617 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(560,'2025-08-10 15:26:02',5,'update','Changed shift for employee CELINE KAVITA MUTHAMBI payroll#:104354 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(561,'2025-08-10 15:26:02',5,'update','Changed shift for employee CHARITY EREGA  payroll#:107603 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(562,'2025-08-10 15:26:02',5,'update','Changed shift for employee CHARITY KADOGO MWANDIA payroll#:107919 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(563,'2025-08-10 15:26:02',5,'update','Changed shift for employee CHARITY KANARIO  payroll#:102753 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(564,'2025-08-10 15:26:02',5,'update','Changed shift for employee CHARITY MINOO MULI payroll#:104503 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(565,'2025-08-10 15:26:02',5,'update','Changed shift for employee CHARITY M’ KARISA payroll#:107610 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(566,'2025-08-10 15:26:02',5,'update','Changed shift for employee CHARITY NDUKU PHILIP payroll#:107695 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(567,'2025-08-10 15:26:02',5,'update','Changed shift for employee CHARITY SYONZIA JULIUS payroll#:107545 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(568,'2025-08-10 15:26:02',5,'update','Changed shift for employee CHARLES MWANDAWIRO WATEE payroll#:104971 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(569,'2025-08-10 15:26:02',5,'update','Changed shift for employee CHARLES NJERU MWANIKI payroll#:101957 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(570,'2025-08-10 15:26:02',5,'update','Changed shift for employee CHARLES OSUNDWA KWEYU payroll#:100866 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(571,'2025-08-10 15:26:02',5,'update','Changed shift for employee CHARLES WAMBUA MICHAEL payroll#:105130 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(572,'2025-08-10 15:26:02',5,'update','Changed shift for employee CHARLOTTE CHIZI MLALA payroll#:103417 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(573,'2025-08-10 15:26:02',5,'update','Changed shift for employee CHENGO TSOFA KALELA payroll#:100261 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(574,'2025-08-10 15:26:02',5,'update','Changed shift for employee CHERONO JULIUS MUMO payroll#:101016 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(575,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHIZI GWARU CHONGWA payroll#:102639 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(576,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISPINE ANAKAYI  payroll#:105770 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(577,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE AKINYI OLONGO payroll#:102148 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(578,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE ANNAH MUTINDA payroll#:101206 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(579,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE ANYANGO OFWETE payroll#:105320 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(580,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE ANZAZI MBEGA payroll#:104691 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(581,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE ATSIENO OSOSO payroll#:100299 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(582,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE KACHE KAZUNGU payroll#:100691 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(583,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE KANINI JUMA payroll#:105699 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(584,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE LINAH TITUS payroll#:102460 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(585,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE MALEMBA MWANJUMWA payroll#:108096 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(586,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE MBETSA MLALA payroll#:102299 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(587,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE MBULI KANUNGUI payroll#:102835 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(588,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE MEDZA ADAM payroll#:102408 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(589,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE MKAMBE RUMBA payroll#:102584 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(590,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE MUSENYA KIMWELE payroll#:103416 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(591,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE MUTANU JONATHAN payroll#:105191 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(592,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE NZISA MUTUKU payroll#:107420 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(593,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE TABU PIUS payroll#:100900 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(594,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE UMAZI MENZA payroll#:106039 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(595,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTINE WANJALA MWAKULOM payroll#:104341 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(596,'2025-08-10 15:26:03',5,'update','Changed shift for employee CHRISTOPHER MUTHENYA NDAVU payroll#:101500 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(597,'2025-08-10 15:26:03',5,'update','Changed shift for employee CIDY KANINI WILLIAM payroll#:102461 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(598,'2025-08-10 15:26:03',5,'update','Changed shift for employee CLARE BOSIBORI NYOUGO payroll#:107633 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(599,'2025-08-10 15:26:03',5,'update','Changed shift for employee CLARICE ADHIAMBO  payroll#:102147 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(600,'2025-08-10 15:26:03',5,'update','Changed shift for employee CLARIS MULUNGA MAMBO payroll#:100420 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(601,'2025-08-10 15:26:03',5,'update','Changed shift for employee CLEAH NEKESA WANJALA payroll#:105483 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(602,'2025-08-10 15:26:03',5,'update','Changed shift for employee CLEMENCE MATUNDA MWABILI payroll#:100312 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(603,'2025-08-10 15:26:03',5,'update','Changed shift for employee CLEMENCE MBODZE KOMBO payroll#:102146 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(604,'2025-08-10 15:26:03',5,'update','Changed shift for employee CLEMENCE MKAMBURI MUTUA payroll#:101970 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(605,'2025-08-10 15:26:03',5,'update','Changed shift for employee CLIFFSON ONSERIO MOSE payroll#:105411 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(606,'2025-08-10 15:26:03',5,'update','Changed shift for employee CLIMENCE KACHE SULEIMANI payroll#:103971 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(607,'2025-08-10 15:26:03',5,'update','Changed shift for employee CLOUDIS MUSENYA PETER payroll#:103346 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(608,'2025-08-10 15:26:03',5,'update','Changed shift for employee COLIVET WERE ONONO payroll#:103652 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(609,'2025-08-10 15:26:03',5,'update','Changed shift for employee COLLETA ANYANGO ABOK payroll#:100842 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(610,'2025-08-10 15:26:03',5,'update','Changed shift for employee CONSOLATA KEMUNTO ONDARI payroll#:100204 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(611,'2025-08-10 15:26:03',5,'update','Changed shift for employee CONSTANCIA MARURA MDINDI payroll#:103700 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(612,'2025-08-10 15:26:03',5,'update','Changed shift for employee CORNEL OLUOCH OUKO payroll#:108098 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(613,'2025-08-10 15:26:03',5,'update','Changed shift for employee CORRINE MBATHA JOHN payroll#:105172 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(614,'2025-08-10 15:26:03',5,'update','Changed shift for employee COSBY EVERLYNE ANYANGO payroll#:104036 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(615,'2025-08-10 15:26:04',5,'update','Changed shift for employee COSMAS MAKAU MUKOMA payroll#:100763 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(616,'2025-08-10 15:26:04',5,'update','Changed shift for employee CYNTHIA AKINYI ONYANGO payroll#:106131 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(617,'2025-08-10 15:26:04',5,'update','Changed shift for employee CYNTHIA MUENI MAKAU payroll#:103605 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(618,'2025-08-10 15:26:04',5,'update','Changed shift for employee CYNTHIA MWELU MUTUKU payroll#:102338 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(619,'2025-08-10 15:26:04',5,'update','Changed shift for employee CYNTHIA TABITHA KIOKO payroll#:107514 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(620,'2025-08-10 15:26:04',5,'update','Changed shift for employee CYPRIANCA KAIGONGI  payroll#:103651 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(621,'2025-08-10 15:26:04',5,'update','Changed shift for employee DAISY ANZAZI DZOMBO payroll#:103075 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(622,'2025-08-10 15:26:04',5,'update','Changed shift for employee DAMA KAHINDI NYALE payroll#:103514 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(623,'2025-08-10 15:26:04',5,'update','Changed shift for employee DAMA SHAKARI CHARO payroll#:107607 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(624,'2025-08-10 15:26:04',5,'update','Changed shift for employee DAMARICE MKANYIKA ZIGHE payroll#:100654 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(625,'2025-08-10 15:26:04',5,'update','Changed shift for employee DAMARIS KARISA CHENGO payroll#:103149 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(626,'2025-08-10 15:26:04',5,'update','Changed shift for employee DAMARIS MUNYIVA MUTIE payroll#:104185 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(627,'2025-08-10 15:26:04',5,'update','Changed shift for employee DAMARIS MUNYIVA ONESMUS payroll#:103477 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(628,'2025-08-10 15:26:04',5,'update','Changed shift for employee DAMARIS NZINGA  payroll#:100317 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(629,'2025-08-10 15:26:04',5,'update','Changed shift for employee DAMARIS WAKESHO KOLE payroll#:102164 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(630,'2025-08-10 15:26:04',5,'update','Changed shift for employee DANCAN KIOKO KARIUKI payroll#:107860 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(631,'2025-08-10 15:26:04',5,'update','Changed shift for employee DANIEL KORI MNYIKA payroll#:104370 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(632,'2025-08-10 15:26:04',5,'update','Changed shift for employee DANIEL MUIA WAMBUA payroll#:104322 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(633,'2025-08-10 15:26:04',5,'update','Changed shift for employee DANIEL OTIENO BWIRE payroll#:100303 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(634,'2025-08-10 15:26:04',5,'update','Changed shift for employee DAUDI NZINGA KARIUKI payroll#:104192 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(635,'2025-08-10 15:26:04',5,'update','Changed shift for employee DAVID  JOHNSON payroll#:100522 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(636,'2025-08-10 15:26:04',5,'update','Changed shift for employee DAVID WAMBUA MUSYOKA payroll#:103794 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(637,'2025-08-10 15:26:04',5,'update','Changed shift for employee DAVIS BAYA CHARO payroll#:101141 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(638,'2025-08-10 15:26:04',5,'update','Changed shift for employee DAYANA MWENDE MATHUKU payroll#:103822 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(639,'2025-08-10 15:26:04',5,'update','Changed shift for employee DEBBORAH KWAMBOKA GITEBE payroll#:104497 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(640,'2025-08-10 15:26:04',5,'update','Changed shift for employee DEBORAH NANJALA WABWILE payroll#:107662 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(641,'2025-08-10 15:26:04',5,'update','Changed shift for employee DELIVINE KERUBO NYABUTI payroll#:101690 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(642,'2025-08-10 15:26:04',5,'update','Changed shift for employee DENIS ODHIAMBO  payroll#:107415 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(643,'2025-08-10 15:26:04',5,'update','Changed shift for employee DENIS WAITHAKA MUNYIRI payroll#:104355 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(644,'2025-08-10 15:26:04',5,'update','Changed shift for employee DENNIS MUTHAMA MUTETI payroll#:104620 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(645,'2025-08-10 15:26:04',5,'update','Changed shift for employee DENNIS MUTUA MUSYA payroll#:103551 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(646,'2025-08-10 15:26:04',5,'update','Changed shift for employee DENNIS OMONDI OSORE payroll#:100375 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(647,'2025-08-10 15:26:04',5,'update','Changed shift for employee DHAHABU HADULA AKARE payroll#:103480 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(648,'2025-08-10 15:26:04',5,'update','Changed shift for employee DIANA JEPKEMBOI  payroll#:104973 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(649,'2025-08-10 15:26:04',5,'update','Changed shift for employee DIANA MURUNGA NASIMIYU payroll#:107922 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(650,'2025-08-10 15:26:04',5,'update','Changed shift for employee DIANA MWIKALI NGUTHU payroll#:102411 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(651,'2025-08-10 15:26:04',5,'update','Changed shift for employee DIANA SHAWIZA OMULO payroll#:106035 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(652,'2025-08-10 15:26:04',5,'update','Changed shift for employee DIANA WANZIA TATE payroll#:104189 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(653,'2025-08-10 15:26:04',5,'update','Changed shift for employee DIANAH NZEMBI NOAH payroll#:103788 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(654,'2025-08-10 15:26:04',5,'update','Changed shift for employee DICAEL MURIKI MUNYUA payroll#:103566 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(655,'2025-08-10 15:26:05',5,'update','Changed shift for employee DINAH KWAMBOKA NYABUTI payroll#:102846 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(656,'2025-08-10 15:26:05',5,'update','Changed shift for employee DIVINAH KERUBO ANGWENYI payroll#:101513 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(657,'2025-08-10 15:26:05',5,'update','Changed shift for employee DOLPHINE ANASI ARONDO payroll#:103808 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(658,'2025-08-10 15:26:05',5,'update','Changed shift for employee DOLVINE NYABOKE MOGAMBI payroll#:100991 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(659,'2025-08-10 15:26:05',5,'update','Changed shift for employee DONENCIAH MKALUMA NGANGA payroll#:104514 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(660,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORCAH KERUBO MONDA payroll#:107664 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(661,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORCAS ARAPMWOK CHEPCHIRCH payroll#:103554 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(662,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORCAS CHAO MOSOWA payroll#:100585 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(663,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORCAS JONES KIMILU payroll#:101755 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(664,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORCAS KANINI MUTHUKA payroll#:104386 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(665,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORCAS LINAH JOEL payroll#:107592 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(666,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORCAS MAWIA MWEMA payroll#:102726 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(667,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORCAS NZYUKI  payroll#:101164 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(668,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORCAS VELESI KIOKO payroll#:100918 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(669,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORCUS KASYOKA PATRICK payroll#:104525 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(670,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORCUS MBETE MUTISYA payroll#:105769 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(671,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORCUS MUTIO MULANI payroll#:107773 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(672,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORCUS SYOMBUA KISASI payroll#:103820 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(673,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORCUS WAYUA KIMWELE payroll#:108104 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(674,'2025-08-10 15:26:05',5,'update','Changed shift for employee DOREEN KARIMI  payroll#:104344 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(675,'2025-08-10 15:26:05',5,'update','Changed shift for employee DOREEN VAATI MWOSYA payroll#:104272 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(676,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORICE MAENDE  payroll#:108099 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(677,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORIS KANARIO  payroll#:100776 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(678,'2025-08-10 15:26:05',5,'update','Changed shift for employee DORIS MAWIA MUTHAMI payroll#:100983 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(679,'2025-08-10 15:26:05',5,'update','Changed shift for employee DOROTHY KERUBO  payroll#:107574 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(680,'2025-08-10 15:26:05',5,'update','Changed shift for employee DOROTHY TABU KAHINDI payroll#:106726 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(681,'2025-08-10 15:26:05',5,'update','Changed shift for employee DUNCAN ANUNDA ASUMA payroll#:102761 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(682,'2025-08-10 15:26:05',5,'update','Changed shift for employee DUNCAN MGHADI KOMBO payroll#:107570 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(683,'2025-08-10 15:26:05',5,'update','Changed shift for employee EDDA WAWUDA KIWO payroll#:102333 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(684,'2025-08-10 15:26:05',5,'update','Changed shift for employee EDINA MOIGE  payroll#:100832 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(685,'2025-08-10 15:26:05',5,'update','Changed shift for employee EDINA NZEMBI MUSANGO payroll#:104439 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(686,'2025-08-10 15:26:05',5,'update','Changed shift for employee EDINAH MOKEIRA MASERA payroll#:100873 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(687,'2025-08-10 15:26:05',5,'update','Changed shift for employee EDITH ANJELINE NASIRUMBI payroll#:100857 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(688,'2025-08-10 15:26:05',5,'update','Changed shift for employee EDITH NABWIRE MWIMA payroll#:102754 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(689,'2025-08-10 15:26:05',5,'update','Changed shift for employee EGLAE KHAGOITSA NGAIRA payroll#:103077 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(690,'2025-08-10 15:26:05',5,'update','Changed shift for employee ELIJA KYALO MUSAU payroll#:100029 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(691,'2025-08-10 15:26:05',5,'update','Changed shift for employee ELIJAH MACHUMA GIDEON payroll#:103862 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(692,'2025-08-10 15:26:05',5,'update','Changed shift for employee ELINA NAZI BALO payroll#:102648 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(693,'2025-08-10 15:26:05',5,'update','Changed shift for employee ELIPINAH SAMBO MWAKUJA payroll#:100741 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(694,'2025-08-10 15:26:05',5,'update','Changed shift for employee ELIZA SYOMBUA MUSANGO payroll#:106491 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(695,'2025-08-10 15:26:05',5,'update','Changed shift for employee ELIZABETH ADHIAMBO OMONDI payroll#:106400 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(696,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH ATIENO OMONDI payroll#:104690 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(697,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH KAHINDI  payroll#:102040 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(698,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH KAMBE MWAZIGHE payroll#:101140 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(699,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH KANINI WAITA payroll#:102590 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(700,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH KARISA NYANJE payroll#:101747 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(701,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MALEMO MWEMBULA payroll#:101591 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(702,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MAUNA MRENJE payroll#:106278 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(703,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MAWIA MUSILI payroll#:102301 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(704,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MAWIA NZALWA payroll#:103276 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(705,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MBINYA JOHN payroll#:100772 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(706,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MBONA SAMINI payroll#:106031 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(707,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MEDZA CHIRANZI payroll#:102228 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(708,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MGHOI SHAKE payroll#:102793 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(709,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MUKAI KIMULI payroll#:101697 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(710,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MUKONYO NZUKI payroll#:102752 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(711,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MUMBUA MUTUKU payroll#:107709 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(712,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MUTENDE JOHN payroll#:103647 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(713,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MUTWA MWENDWA payroll#:100285 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(714,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MWENDE MUTEVU payroll#:100478 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(715,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MWENDWA  payroll#:107549 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(716,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH MWIKALI MBITI payroll#:101263 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(717,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH NAMAROME SIMIYU payroll#:107634 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(718,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH NDIGHA MWADUWI payroll#:103819 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(719,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH NTHENYA MUTUKU payroll#:102052 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(720,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH NYABOKE NYAMORI payroll#:104976 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(721,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH NYATUNGA MOMANYI payroll#:102221 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(722,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH NYIVA NDETEI payroll#:101680 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(723,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH NZISA MUTUA payroll#:100945 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(724,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELIZABETH WAYUA NZOMO payroll#:102337 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(725,'2025-08-10 15:26:06',5,'update','Changed shift for employee ELOSY KINYA  payroll#:100100 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(726,'2025-08-10 15:26:06',5,'update','Changed shift for employee EMILIANA MANGA MWANYANYA payroll#:100429 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(727,'2025-08-10 15:26:06',5,'update','Changed shift for employee EMILLY NELLY OKETCH payroll#:103603 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(728,'2025-08-10 15:26:06',5,'update','Changed shift for employee EMILY ACHIENG OMOLLO payroll#:107644 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(729,'2025-08-10 15:26:06',5,'update','Changed shift for employee EMILY ADONGO MAGONYA payroll#:103106 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(730,'2025-08-10 15:26:06',5,'update','Changed shift for employee EMILY AKOTH ACHIENG payroll#:102458 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(731,'2025-08-10 15:26:06',5,'update','Changed shift for employee EMILY AWUOR ONYANGO payroll#:100537 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(732,'2025-08-10 15:26:06',5,'update','Changed shift for employee EMILY GAKII  payroll#:107627 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(733,'2025-08-10 15:26:06',5,'update','Changed shift for employee EMILY KILONZO  payroll#:104352 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(734,'2025-08-10 15:26:06',5,'update','Changed shift for employee EMILY MNYAZI MRANGA payroll#:105241 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(735,'2025-08-10 15:26:06',5,'update','Changed shift for employee EMILY MUTUA  payroll#:103843 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(736,'2025-08-10 15:26:06',5,'update','Changed shift for employee EMILY NAMULEMBO OKUMU payroll#:105178 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(737,'2025-08-10 15:26:07',5,'update','Changed shift for employee EMMA AKINYI ONDHAWO payroll#:106057 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(738,'2025-08-10 15:26:07',5,'update','Changed shift for employee EMMA MBETSA MADZUNGU payroll#:104239 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(739,'2025-08-10 15:26:07',5,'update','Changed shift for employee EMMACULATE AKOTH  payroll#:100148 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(740,'2025-08-10 15:26:07',5,'update','Changed shift for employee EMMACULATE ATIENO ODONGO payroll#:102459 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(741,'2025-08-10 15:26:07',5,'update','Changed shift for employee EMMACULATE DZAME JUMA payroll#:102716 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(742,'2025-08-10 15:26:07',5,'update','Changed shift for employee EMMACULATE MARY MULANDI payroll#:102700 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(743,'2025-08-10 15:26:07',5,'update','Changed shift for employee EMMACULATE MWONGELI LUSIA payroll#:100715 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(744,'2025-08-10 15:26:07',5,'update','Changed shift for employee EMMAH LEAH AWUOR payroll#:103328 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(745,'2025-08-10 15:26:07',5,'update','Changed shift for employee EMMANUEL MUTUNGA MUTHUI payroll#:105129 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(746,'2025-08-10 15:26:07',5,'update','Changed shift for employee EMMANUEL OCHIENG OKECH payroll#:103486 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(747,'2025-08-10 15:26:07',5,'update','Changed shift for employee EMMANUEL ODONGO MULA payroll#:101973 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(748,'2025-08-10 15:26:07',5,'update','Changed shift for employee EMMILY KALEKYE KIMULI payroll#:103636 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(749,'2025-08-10 15:26:07',5,'update','Changed shift for employee ENOCK DALMAS OKOTH payroll#:106451 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(750,'2025-08-10 15:26:07',5,'update','Changed shift for employee ERIC DISII KENGA payroll#:102499 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(751,'2025-08-10 15:26:07',5,'update','Changed shift for employee ERIC SHIKUKU SHAYO payroll#:100352 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(752,'2025-08-10 15:26:07',5,'update','Changed shift for employee ERIC WANGILA MABONGA payroll#:105152 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(753,'2025-08-10 15:26:07',5,'update','Changed shift for employee ERICK ODHEK MAKORE payroll#:103957 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(754,'2025-08-10 15:26:07',5,'update','Changed shift for employee ERICK OMONDI ONGORO payroll#:102632 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(755,'2025-08-10 15:26:07',5,'update','Changed shift for employee ERICKSON MANASE MWALUNDI payroll#:104155 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(756,'2025-08-10 15:26:07',5,'update','Changed shift for employee ERICKSON MUTINDA MUTISYA payroll#:107765 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(757,'2025-08-10 15:26:07',5,'update','Changed shift for employee ERIMINA MAGEMA MWANGI payroll#:107513 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(758,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER DAMA KAHINDI payroll#:103967 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(759,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER KADZO NGAO payroll#:102424 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(760,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER KADZO RUWA payroll#:103560 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(761,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER KADZO ZACHARIA payroll#:104772 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(762,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER KALONDU KATENGE payroll#:106495 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(763,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER KAMBUA NEKETHI payroll#:107708 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(764,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER KATUMBU MUMO payroll#:100032 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(765,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER KAVATA NDUKU payroll#:106289 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(766,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER KILOLA MBELA payroll#:107924 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(767,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER KIOKO  payroll#:105126 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(768,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER KOKI WILSON payroll#:103345 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(769,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER MALIAMU MUNGOTI payroll#:106025 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(770,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER MBELEETE MWANIA payroll#:100750 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(771,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER MBITHE KILONZO payroll#:103969 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(772,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER MLONGO MBEGA payroll#:103127 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(773,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER MLONGO MWAZAMA payroll#:106644 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(774,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER MORAA NYAKONO payroll#:104346 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(775,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER MOSE MBUI payroll#:105943 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(776,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER MUMBE MUTHUVI payroll#:101994 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(777,'2025-08-10 15:26:07',5,'update','Changed shift for employee ESTHER MWAKA MBAITA payroll#:104390 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(778,'2025-08-10 15:26:08',5,'update','Changed shift for employee ESTHER MWIKALI NZUKI payroll#:100125 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(779,'2025-08-10 15:26:08',5,'update','Changed shift for employee ESTHER SYONZIA MWENDWA payroll#:103550 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(780,'2025-08-10 15:26:08',5,'update','Changed shift for employee ESTHER TUNAI MUBO payroll#:101599 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(781,'2025-08-10 15:26:08',5,'update','Changed shift for employee ESTHER WAVINYA NDUNYU payroll#:107509 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(782,'2025-08-10 15:26:08',5,'update','Changed shift for employee ESTHER ZIGHE WALI payroll#:100518 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(783,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUDIVA MINOO KITIVI payroll#:101745 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(784,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE ADHIAMBPO OTIENO payroll#:102169 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(785,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE AKINYI OTIENO payroll#:104022 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(786,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE AKOTH OBANDA payroll#:100070 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(787,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE AKOTH OUNGU payroll#:103045 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(788,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE ATIENO ODHIAMBO payroll#:102242 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(789,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE KERUBO NYABUTO payroll#:103074 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(790,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE MBENEKE KIVONDO payroll#:107686 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(791,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE MUMBUA MUTUA payroll#:106124 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(792,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE MUTETE MUTHEKA payroll#:102806 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(793,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE MUTINDA HELLEN payroll#:103052 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(794,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE MWENDE MUTINDA payroll#:105492 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(795,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE MWIKALI MUNYALO payroll#:108100 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(796,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE NADZUA MWAVUO payroll#:104033 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(797,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE NDANU MWENDWA payroll#:106037 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(798,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE NTHENYA MUTISO payroll#:103926 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(799,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE NZILANI MWANTHI payroll#:103412 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(800,'2025-08-10 15:26:08',5,'update','Changed shift for employee EUNICE WAWIRA MWANIKII payroll#:107577 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(801,'2025-08-10 15:26:08',5,'update','Changed shift for employee EVALINE ACHIENG NYAWANDA payroll#:101682 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(802,'2025-08-10 15:26:08',5,'update','Changed shift for employee EVALINE OSEBE OKIOGA payroll#:100327 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(803,'2025-08-10 15:26:08',5,'update','Changed shift for employee EVALINY KIEMA WANGAIKA payroll#:102409 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(804,'2025-08-10 15:26:08',5,'update','Changed shift for employee EVANS MONDA OMWENGA payroll#:101677 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(805,'2025-08-10 15:26:08',5,'update','Changed shift for employee EVELYNE NDARIGHO MWAGHOTI payroll#:103914 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(806,'2025-08-10 15:26:08',5,'update','Changed shift for employee EVERLINE ACHIENG BONYO payroll#:103753 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(807,'2025-08-10 15:26:08',5,'update','Changed shift for employee EVERLINE AKINYI OWINO payroll#:101672 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(808,'2025-08-10 15:26:08',5,'update','Changed shift for employee EVERLINE MKABILI MWAMBALE payroll#:103512 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(809,'2025-08-10 15:26:08',5,'update','Changed shift for employee EVERLINE MORAA NDUKO payroll#:104702 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(810,'2025-08-10 15:26:08',5,'update','Changed shift for employee EVERLINE NEKESA KUNDU payroll#:103653 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(811,'2025-08-10 15:26:08',5,'update','Changed shift for employee EVERLYN NADZUWA CHIMANGA payroll#:104773 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(812,'2025-08-10 15:26:09',5,'update','Changed shift for employee EVERLYN NDINDA MULAI payroll#:102501 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(813,'2025-08-10 15:26:09',5,'update','Changed shift for employee EVERLYNE KWEYU OSUNDWA payroll#:100830 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(814,'2025-08-10 15:26:09',5,'update','Changed shift for employee EVERLYNE MKAMBE MBUYA payroll#:107576 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(815,'2025-08-10 15:26:09',5,'update','Changed shift for employee EVERLYNE NDINDA KILATYA payroll#:104180 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(816,'2025-08-10 15:26:09',5,'update','Changed shift for employee EVERLYNE NYIVA MUSEMBI payroll#:103660 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(817,'2025-08-10 15:26:09',5,'update','Changed shift for employee EVON ATIENO ONYANGO payroll#:100831 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(818,'2025-08-10 15:26:09',5,'update','Changed shift for employee EVRLYNE NDANU MUATHA payroll#:105117 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(819,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH  KYALO payroll#:107859 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(820,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH AKINYI ONYANGO payroll#:107648 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(821,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH ATIENO OKEMBA payroll#:107599 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(822,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH BAHATI MUTULA payroll#:102336 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(823,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH HALIMA HARE payroll#:100146 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(824,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH KANINI KYALO payroll#:103518 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(825,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH KASELE MAKIO payroll#:104438 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(826,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH KASYOKA MBEVI payroll#:103290 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(827,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH KAWIRA LAICHENA payroll#:100104 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(828,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH KEMUNTO DAVID payroll#:106126 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(829,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH KERUBO ATONI payroll#:105957 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(830,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH KERUBO MACHUNGO payroll#:107861 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(831,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MADANGO MICHO payroll#:102703 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(832,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MALIA KIMANTHI payroll#:104032 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(833,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MAWIA KATHOKI payroll#:103810 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(834,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MBITHE MUTUA payroll#:102727 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(835,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH muendi KIIO payroll#:100139 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(836,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MUINDI MBITI payroll#:102031 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(837,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MUKAI JOSHUA payroll#:104028 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(838,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MUSENYA MUTUKU payroll#:107688 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(839,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MUTETHYA MUTINDA payroll#:103141 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(840,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MUTHEU WILLY payroll#:104031 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(841,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MUTHINI KITUNGUU payroll#:103562 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(842,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MUTHINI MUTUA payroll#:100826 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(843,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MUTHOKI MUTHAMI payroll#:105485 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(844,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MUTHOKI WAYUA payroll#:107693 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(845,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MWENDE KAKUSU payroll#:100903 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(846,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MWIKALI KIMILU payroll#:102794 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(847,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MWIKALI KYALO payroll#:102757 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(848,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MWIKALI OMALI payroll#:105482 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(849,'2025-08-10 15:26:09',5,'update','Changed shift for employee FAITH MWOSYA  payroll#:104120 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(850,'2025-08-10 15:26:10',5,'update','Changed shift for employee FAITH NDAMA SYENGO payroll#:107663 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(851,'2025-08-10 15:26:10',5,'update','Changed shift for employee FAITH NDINDA WAMBUA payroll#:100942 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(852,'2025-08-10 15:26:10',5,'update','Changed shift for employee FAITH NDUNGE MASAI payroll#:102728 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(853,'2025-08-10 15:26:10',5,'update','Changed shift for employee FAITH NDUNGE MUTINDA payroll#:102258 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(854,'2025-08-10 15:26:10',5,'update','Changed shift for employee FAITH NGINA MUTUNGA payroll#:107707 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(855,'2025-08-10 15:26:10',5,'update','Changed shift for employee FAITH NYEVU KALUME payroll#:103033 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(856,'2025-08-10 15:26:10',5,'update','Changed shift for employee FAITH NZEMBI MUSYOKA payroll#:100293 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(857,'2025-08-10 15:26:10',5,'update','Changed shift for employee FAITH SARAH MUTUA payroll#:100187 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(858,'2025-08-10 15:26:10',5,'update','Changed shift for employee FAITH SYOKAU KAMBUA payroll#:105683 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(859,'2025-08-10 15:26:10',5,'update','Changed shift for employee FAITH TATU KAHINDI payroll#:103418 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(860,'2025-08-10 15:26:10',5,'update','Changed shift for employee FAITH WACEKE MWAURA payroll#:102644 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(861,'2025-08-10 15:26:10',5,'update','Changed shift for employee FAITH WANJIRU MUSYOKA payroll#:107811 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(862,'2025-08-10 15:26:10',5,'update','Changed shift for employee FATUMA CHIZI KAMANZA payroll#:106038 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(863,'2025-08-10 15:26:10',5,'update','Changed shift for employee FATUMA DZAME MWARINGA payroll#:103773 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(864,'2025-08-10 15:26:10',5,'update','Changed shift for employee FATUMA KAHASO NGAO payroll#:102589 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(865,'2025-08-10 15:26:10',5,'update','Changed shift for employee FATUMA KALUMA KAINGU payroll#:102932 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(866,'2025-08-10 15:26:10',5,'update','Changed shift for employee FATUMA LUVUNO KIDANGA payroll#:102658 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(867,'2025-08-10 15:26:10',5,'update','Changed shift for employee FATUMA LUVUNO MUNGA payroll#:100207 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(868,'2025-08-10 15:26:10',5,'update','Changed shift for employee FATUMA MKAMBE CHANGOKA payroll#:104314 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(869,'2025-08-10 15:26:10',5,'update','Changed shift for employee FATUMA MNYAZI KAGINYA payroll#:102347 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(870,'2025-08-10 15:26:10',5,'update','Changed shift for employee FATUMA MOSE KAZUNGU payroll#:103799 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(871,'2025-08-10 15:26:10',5,'update','Changed shift for employee FATUMA MRENJE KARUKU payroll#:104030 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(872,'2025-08-10 15:26:10',5,'update','Changed shift for employee FATUMA NGOMBE MGANDI payroll#:102616 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(873,'2025-08-10 15:26:10',5,'update','Changed shift for employee FATUMA TSAMA MAGONGO payroll#:102383 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(874,'2025-08-10 15:26:10',5,'update','Changed shift for employee FATUMA ZULEKHA HASSAN payroll#:104777 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(875,'2025-08-10 15:26:10',5,'update','Changed shift for employee FAUZIA AMANYA JUMA payroll#:100989 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(876,'2025-08-10 15:26:10',5,'update','Changed shift for employee FAUZIA SAMUEL MWACHIRO payroll#:102718 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(877,'2025-08-10 15:26:10',5,'update','Changed shift for employee FELISTA MALEKYE JOSEPHAT payroll#:101297 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(878,'2025-08-10 15:26:10',5,'update','Changed shift for employee FELISTAR KANINI DANIEL payroll#:100617 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(879,'2025-08-10 15:26:10',5,'update','Changed shift for employee FELISTER MINOO KALUI payroll#:102887 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(880,'2025-08-10 15:26:10',5,'update','Changed shift for employee FELISTER MUENI NDETEI payroll#:100378 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(881,'2025-08-10 15:26:10',5,'update','Changed shift for employee FELISTER MUTHEU MOI payroll#:102814 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(882,'2025-08-10 15:26:10',5,'update','Changed shift for employee FELISTER NDUKU NTHENTA payroll#:104484 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(883,'2025-08-10 15:26:10',5,'update','Changed shift for employee FELISTUS  KITUNGU payroll#:102711 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(884,'2025-08-10 15:26:10',5,'update','Changed shift for employee FELISTUS KALEKYE  payroll#:106018 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(885,'2025-08-10 15:26:10',5,'update','Changed shift for employee FELISTUS KAVUTHA MUNYITHYA payroll#:101681 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(886,'2025-08-10 15:26:10',5,'update','Changed shift for employee FELISTUS MBITE NGALA payroll#:102236 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(887,'2025-08-10 15:26:11',5,'update','Changed shift for employee FELISTUS MUTETHYA MUSEMBEI payroll#:102349 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(888,'2025-08-10 15:26:11',5,'update','Changed shift for employee FELISTUS MWIKALI MBALUKA payroll#:104117 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(889,'2025-08-10 15:26:11',5,'update','Changed shift for employee FELISTUS TEMEA JULIUS payroll#:103844 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(890,'2025-08-10 15:26:11',5,'update','Changed shift for employee FELIX ODHIAMBO OSOO payroll#:102323 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(891,'2025-08-10 15:26:11',5,'update','Changed shift for employee FENNY ATIENO NYAWINA payroll#:106406 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(892,'2025-08-10 15:26:11',5,'update','Changed shift for employee FESTUS KISYANGA NDAMBUKI payroll#:100183 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(893,'2025-08-10 15:26:11',5,'update','Changed shift for employee FIBY KERUBO  payroll#:105120 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(894,'2025-08-10 15:26:11',5,'update','Changed shift for employee FIDELIS MBITHE CHRISTOPHER payroll#:104479 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(895,'2025-08-10 15:26:11',5,'update','Changed shift for employee FIDELIS NAFULA BARASA payroll#:104521 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(896,'2025-08-10 15:26:11',5,'update','Changed shift for employee FIDERIAH MUMBUA KIMINDU payroll#:101965 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(897,'2025-08-10 15:26:11',5,'update','Changed shift for employee FINA AUMA OGOFU payroll#:100416 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(898,'2025-08-10 15:26:11',5,'update','Changed shift for employee FINAH FELISTER NYABOLA payroll#:102386 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(899,'2025-08-10 15:26:11',5,'update','Changed shift for employee FLAVIA NAMUKURU  payroll#:105240 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(900,'2025-08-10 15:26:11',5,'update','Changed shift for employee FLAVIAN SHIKHOMOLI  payroll#:103989 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(901,'2025-08-10 15:26:11',5,'update','Changed shift for employee FLOMENA MWAKA MWENDA payroll#:107880 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(902,'2025-08-10 15:26:11',5,'update','Changed shift for employee FLORENCE AUMA  payroll#:104473 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(903,'2025-08-10 15:26:11',5,'update','Changed shift for employee FLORENCE AWINO OMONDI payroll#:108103 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(904,'2025-08-10 15:26:11',5,'update','Changed shift for employee FLORENCE KADZENDERE BANDI payroll#:102628 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(905,'2025-08-10 15:26:11',5,'update','Changed shift for employee FLORENCE KAVUMBI DZANGA payroll#:107487 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(906,'2025-08-10 15:26:11',5,'update','Changed shift for employee FLORENCE MUENI MBOTELA payroll#:104474 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(907,'2025-08-10 15:26:11',5,'update','Changed shift for employee FLORENCE MUENI NDOLO payroll#:105702 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(908,'2025-08-10 15:26:11',5,'update','Changed shift for employee FLORENCE MUTHEU KULA payroll#:106028 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(909,'2025-08-10 15:26:11',5,'update','Changed shift for employee FLORIANA MANDI KALAMA payroll#:102263 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(910,'2025-08-10 15:26:11',5,'update','Changed shift for employee FLORITA KERENA MWASHIGHADI payroll#:101735 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(911,'2025-08-10 15:26:11',5,'update','Changed shift for employee FORTUNE NAMALWA  payroll#:101062 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(912,'2025-08-10 15:26:11',5,'update','Changed shift for employee FRANCIS MAWEU MBITHI payroll#:101899 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(913,'2025-08-10 15:26:11',5,'update','Changed shift for employee FRANCIS MWATAME MWAMBANGA payroll#:100468 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(914,'2025-08-10 15:26:11',5,'update','Changed shift for employee FRANCIS OMANGA ONSANDO payroll#:103951 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(915,'2025-08-10 15:26:11',5,'update','Changed shift for employee FRANCIS WAMBUA MULWA payroll#:100602 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(916,'2025-08-10 15:26:11',5,'update','Changed shift for employee FRANCISCA MUTENDE KASAKWA payroll#:100393 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(917,'2025-08-10 15:26:11',5,'update','Changed shift for employee FRANCISCAH MUTHEU MUTUA payroll#:105950 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(918,'2025-08-10 15:26:12',5,'update','Changed shift for employee FRANK MUTHAMI MUSINGI payroll#:100603 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(919,'2025-08-10 15:26:12',5,'update','Changed shift for employee FRANSISCA UMAZI MWINGA payroll#:106040 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(920,'2025-08-10 15:26:12',5,'update','Changed shift for employee FRED AGENGO OGAYE payroll#:107573 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(921,'2025-08-10 15:26:12',5,'update','Changed shift for employee FREDA WANTHI MUTHIANI payroll#:106492 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(922,'2025-08-10 15:26:12',5,'update','Changed shift for employee FREDRICK KALOKI WATHI payroll#:100604 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(923,'2025-08-10 15:26:12',5,'update','Changed shift for employee FRIDAH CHEMUNUNG  payroll#:107774 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(924,'2025-08-10 15:26:12',5,'update','Changed shift for employee FRIDAH CLAIRE KHAYATSI payroll#:105682 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(925,'2025-08-10 15:26:12',5,'update','Changed shift for employee FRIDAH KAWIRA MWANGANGI payroll#:102450 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(926,'2025-08-10 15:26:12',5,'update','Changed shift for employee FRIDAH KENDI  payroll#:102917 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(927,'2025-08-10 15:26:12',5,'update','Changed shift for employee FRIDAH MBUNA MURUMWA payroll#:103765 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(928,'2025-08-10 15:26:12',5,'update','Changed shift for employee FRIDAH MUENI SAUL payroll#:107619 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(929,'2025-08-10 15:26:12',5,'update','Changed shift for employee FRIDAH MUTHINI MUEKE payroll#:104306 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(930,'2025-08-10 15:26:12',5,'update','Changed shift for employee FRIDAH NECHESA ABUREBE payroll#:101961 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(931,'2025-08-10 15:26:12',5,'update','Changed shift for employee FRIDER MUNANE KIMINZA payroll#:102206 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(932,'2025-08-10 15:26:12',5,'update','Changed shift for employee FURAHA NGALLA MBOVU payroll#:101981 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(933,'2025-08-10 15:26:12',5,'update','Changed shift for employee GABRIEL NYANGE MAKOKO payroll#:103023 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(934,'2025-08-10 15:26:12',5,'update','Changed shift for employee GEORGE FUMBA MWALIMO payroll#:103917 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(935,'2025-08-10 15:26:12',5,'update','Changed shift for employee GETRUDE MKALUMA MWANDEWE payroll#:100112 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(936,'2025-08-10 15:26:12',5,'update','Changed shift for employee GETRUDE MWIKALI MUIYA payroll#:101311 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(937,'2025-08-10 15:26:12',5,'update','Changed shift for employee GIBSON MUNDUNGI EGWA payroll#:107596 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(938,'2025-08-10 15:26:12',5,'update','Changed shift for employee GINORA MKALUMA WUGANGA payroll#:104483 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(939,'2025-08-10 15:26:12',5,'update','Changed shift for employee GLADNES MANGA MDAMU payroll#:102758 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(940,'2025-08-10 15:26:12',5,'update','Changed shift for employee GLADYS JUMWA CHIRUNGA payroll#:104038 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(941,'2025-08-10 15:26:12',5,'update','Changed shift for employee GLADYS KANZE MKUTANO payroll#:104412 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(942,'2025-08-10 15:26:12',5,'update','Changed shift for employee GLADYS MONJE MASHA payroll#:104157 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(943,'2025-08-10 15:26:12',5,'update','Changed shift for employee GLADYS MWIKALI MUISYO payroll#:104431 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(944,'2025-08-10 15:26:12',5,'update','Changed shift for employee GLADYS SYOKWAA MULUKU payroll#:104119 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(945,'2025-08-10 15:26:12',5,'update','Changed shift for employee GLORIA ADHIAMBO OCHIENG payroll#:100273 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(946,'2025-08-10 15:26:12',5,'update','Changed shift for employee GLORIA KOLI KIVISU payroll#:102635 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(947,'2025-08-10 15:26:12',5,'update','Changed shift for employee GLORIAH LUKIA MUNA payroll#:100382 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(948,'2025-08-10 15:26:12',5,'update','Changed shift for employee GODFREY AYODI  payroll#:106052 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(949,'2025-08-10 15:26:12',5,'update','Changed shift for employee GODLIZEN CHAO SHUMA payroll#:108102 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(950,'2025-08-10 15:26:12',5,'update','Changed shift for employee GRACE ADHIAMBO OUMA payroll#:100789 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(951,'2025-08-10 15:26:12',5,'update','Changed shift for employee GRACE AUMA OJWANG payroll#:101746 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(952,'2025-08-10 15:26:12',5,'update','Changed shift for employee GRACE CHARI KAMBU payroll#:107578 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(953,'2025-08-10 15:26:12',5,'update','Changed shift for employee GRACE KALEKYE NGUTHU payroll#:102478 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(954,'2025-08-10 15:26:12',5,'update','Changed shift for employee GRACE KAVUTHA MALONZA payroll#:102714 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(955,'2025-08-10 15:26:12',5,'update','Changed shift for employee GRACE KOKI NGAU payroll#:107623 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(956,'2025-08-10 15:26:12',5,'update','Changed shift for employee GRACE MBALA MWANZANA payroll#:101741 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(957,'2025-08-10 15:26:13',5,'update','Changed shift for employee GRACE MBEYU CHENGO payroll#:102352 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(958,'2025-08-10 15:26:13',5,'update','Changed shift for employee GRACE MURUGI MAINA payroll#:101641 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(959,'2025-08-10 15:26:13',5,'update','Changed shift for employee GRACE MUTANU NZOMO payroll#:102828 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(960,'2025-08-10 15:26:13',5,'update','Changed shift for employee GRACE MUTENA KYULE payroll#:100828 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(961,'2025-08-10 15:26:13',5,'update','Changed shift for employee GRACE MWIKALI MUTEMBEI payroll#:100827 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(962,'2025-08-10 15:26:13',5,'update','Changed shift for employee GRACE MWIKALI MUTUNGA payroll#:100879 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(963,'2025-08-10 15:26:13',5,'update','Changed shift for employee GRACE NGILEE JAMES payroll#:104327 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(964,'2025-08-10 15:26:13',5,'update','Changed shift for employee GRACE NJOKI RUGAITA payroll#:102942 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(965,'2025-08-10 15:26:13',5,'update','Changed shift for employee GRACE NYAMBURA WAWERU payroll#:106296 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(966,'2025-08-10 15:26:13',5,'update','Changed shift for employee GRACE PENDO NZARO payroll#:101748 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(967,'2025-08-10 15:26:13',5,'update','Changed shift for employee GRACE SAMBA MWAKIRETI payroll#:103649 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(968,'2025-08-10 15:26:13',5,'update','Changed shift for employee GRIVIN NYONGESA WANYONYI payroll#:100605 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(969,'2025-08-10 15:26:13',5,'update','Changed shift for employee HADIJA CHIRINGA DENA payroll#:101964 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(970,'2025-08-10 15:26:13',5,'update','Changed shift for employee HADIJA MLAA MUNGA payroll#:105693 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(971,'2025-08-10 15:26:13',5,'update','Changed shift for employee HADIJA MUMBUA MUTETI payroll#:105942 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(972,'2025-08-10 15:26:13',5,'update','Changed shift for employee HADIJA SAID MWABOMA payroll#:104428 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(973,'2025-08-10 15:26:13',5,'update','Changed shift for employee HAJRA MBODZA CHIRANZI payroll#:100362 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(974,'2025-08-10 15:26:13',5,'update','Changed shift for employee HALIMA HASSAN NGOKA payroll#:107683 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(975,'2025-08-10 15:26:13',5,'update','Changed shift for employee HALIMA KWEKWE  payroll#:106208 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(976,'2025-08-10 15:26:13',5,'update','Changed shift for employee HALIMA LUVUNO MWINGA payroll#:107643 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(977,'2025-08-10 15:26:13',5,'update','Changed shift for employee HALIMA MKUMBI ALI payroll#:100775 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(978,'2025-08-10 15:26:13',5,'update','Changed shift for employee HALIMA NADZUA MVUU payroll#:105691 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(979,'2025-08-10 15:26:13',5,'update','Changed shift for employee HALIMA NYAMVULA GULANI payroll#:103315 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(980,'2025-08-10 15:26:13',5,'update','Changed shift for employee HALIMA UMAZI JIRA payroll#:106284 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(981,'2025-08-10 15:26:13',5,'update','Changed shift for employee HANNA AKUMU ODIDI payroll#:106054 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(982,'2025-08-10 15:26:13',5,'update','Changed shift for employee HANNAH INGANGA MUNYENDO payroll#:103602 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(983,'2025-08-10 15:26:13',5,'update','Changed shift for employee HANNAH MINOO KIMEU payroll#:101402 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(984,'2025-08-10 15:26:13',5,'update','Changed shift for employee HAPPY SIDI FONDO payroll#:102602 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(985,'2025-08-10 15:26:13',5,'update','Changed shift for employee HARIET MOSE RIZIKI payroll#:101750 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(986,'2025-08-10 15:26:13',5,'update','Changed shift for employee HARMONY NZIOKA MUASYA payroll#:107608 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(987,'2025-08-10 15:26:13',5,'update','Changed shift for employee HARNY KHASIALA MURUNGA payroll#:100797 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(988,'2025-08-10 15:26:13',5,'update','Changed shift for employee HARON MUIA MWAU payroll#:101967 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(989,'2025-08-10 15:26:13',5,'update','Changed shift for employee HARRIET INZIANI  payroll#:103857 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(990,'2025-08-10 15:26:13',5,'update','Changed shift for employee HARRIET MUHONJA ANYAMBA payroll#:100421 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(991,'2025-08-10 15:26:14',5,'update','Changed shift for employee HARRIET NAFULA OKEMBA payroll#:103986 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(992,'2025-08-10 15:26:14',5,'update','Changed shift for employee HASSAN KEA SADI payroll#:100961 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(993,'2025-08-10 15:26:14',5,'update','Changed shift for employee HASSAN LUGOMA JUMA payroll#:100771 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(994,'2025-08-10 15:26:14',5,'update','Changed shift for employee HASSAN OTELU MIYA payroll#:103119 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(995,'2025-08-10 15:26:14',5,'update','Changed shift for employee HELDAH MARIA ONGERA payroll#:102918 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(996,'2025-08-10 15:26:14',5,'update','Changed shift for employee HELLEN KWEKWE CHITI payroll#:104132 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(997,'2025-08-10 15:26:14',5,'update','Changed shift for employee HELLEN MARIACHANA MARANGA payroll#:103509 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(998,'2025-08-10 15:26:14',5,'update','Changed shift for employee HELLEN MBETSA MICHAEL payroll#:101624 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(999,'2025-08-10 15:26:14',5,'update','Changed shift for employee HELLEN MUTHEU MWEMA payroll#:100779 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1000,'2025-08-10 15:26:14',5,'update','Changed shift for employee HELLEN NGALA KARISA payroll#:102479 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1001,'2025-08-10 15:26:14',5,'update','Changed shift for employee HELLEN TSADZA NGOME payroll#:107921 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1002,'2025-08-10 15:26:14',5,'update','Changed shift for employee HEPHZIBAR NEEMA NAFULA payroll#:103894 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1003,'2025-08-10 15:26:14',5,'update','Changed shift for employee HERBERT MWANYALO MWAIGHURI payroll#:104115 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1004,'2025-08-10 15:26:14',5,'update','Changed shift for employee HEZRON CHILIMO KADENGE payroll#:101408 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1005,'2025-08-10 15:26:14',5,'update','Changed shift for employee HIDAYA ZAWADI MUHAMBI payroll#:107553 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1006,'2025-08-10 15:26:14',5,'update','Changed shift for employee HILDA MARIAM JOHN payroll#:100235 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1007,'2025-08-10 15:26:14',5,'update','Changed shift for employee HILDER MJENI NDUNE payroll#:100852 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1008,'2025-08-10 15:26:14',5,'update','Changed shift for employee HOLINESS SOFI MATUKU payroll#:104326 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1009,'2025-08-10 15:26:14',5,'update','Changed shift for employee HOPE MBITE MBALUKA payroll#:101409 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1010,'2025-08-10 15:26:14',5,'update','Changed shift for employee HOPE MUTHEU MALUKI payroll#:107665 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1011,'2025-08-10 15:26:14',5,'update','Changed shift for employee HUMPREY OKOTH ODHIAMBO payroll#:102618 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1012,'2025-08-10 15:26:14',5,'update','Changed shift for employee HUSNA LUVUNO ZUMA payroll#:104006 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1013,'2025-08-10 15:26:14',5,'update','Changed shift for employee IAN FITSCHER OPIYO payroll#:104353 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1014,'2025-08-10 15:26:14',5,'update','Changed shift for employee IAN KAMUNZYU MUTINDA payroll#:107772 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1015,'2025-08-10 15:26:14',5,'update','Changed shift for employee IDD SELEMAN BAKARI payroll#:103038 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1016,'2025-08-10 15:26:14',5,'update','Changed shift for employee INDIKA UDAYANGA DAYARATHNA payroll#:101044 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1017,'2025-08-10 15:26:14',5,'update','Changed shift for employee IREEN AKAMURAN MUKOLE payroll#:107764 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1018,'2025-08-10 15:26:14',5,'update','Changed shift for employee IRENE ANYANGO ODINDO payroll#:103207 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1019,'2025-08-10 15:26:14',5,'update','Changed shift for employee IRENE ANYANGO OTIENO payroll#:100721 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1020,'2025-08-10 15:26:14',5,'update','Changed shift for employee IRENE KALEKYE NDINDA payroll#:102159 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1021,'2025-08-10 15:26:14',5,'update','Changed shift for employee IRENE KAMBUA NYAMAI payroll#:100838 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1022,'2025-08-10 15:26:14',5,'update','Changed shift for employee IRENE KAMENE MULE payroll#:106036 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1023,'2025-08-10 15:26:14',5,'update','Changed shift for employee IRENE KENDI  payroll#:103991 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1024,'2025-08-10 15:26:14',5,'update','Changed shift for employee IRENE MWENDE CHRISTOPHER payroll#:106285 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1025,'2025-08-10 15:26:14',5,'update','Changed shift for employee IRENE NDAMBUKI  payroll#:100151 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1026,'2025-08-10 15:26:14',5,'update','Changed shift for employee IRENE NZEMBI MUTUA payroll#:105706 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1027,'2025-08-10 15:26:15',5,'update','Changed shift for employee IRENE REHEMA JOSEPH payroll#:102873 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1028,'2025-08-10 15:26:15',5,'update','Changed shift for employee IRENE SYOKAU KASINA payroll#:103443 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1029,'2025-08-10 15:26:15',5,'update','Changed shift for employee IRENE WAVINYA WAMBUA payroll#:103860 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1030,'2025-08-10 15:26:15',5,'update','Changed shift for employee IRINE ANYANGO OTIENO payroll#:101744 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1031,'2025-08-10 15:26:15',5,'update','Changed shift for employee IRINE JEMUTAI  payroll#:104309 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1032,'2025-08-10 15:26:15',5,'update','Changed shift for employee ISAAC MWASYA KIILU payroll#:100618 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1033,'2025-08-10 15:26:15',5,'update','Changed shift for employee ISAAC SHITUMA NJOMO payroll#:101985 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1034,'2025-08-10 15:26:15',5,'update','Changed shift for employee ISHARA RASOA BIMBO payroll#:100787 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1035,'2025-08-10 15:26:15',5,'update','Changed shift for employee ISSABELLAH KANINI KASINGA payroll#:104237 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1036,'2025-08-10 15:26:15',5,'update','Changed shift for employee IVY KAGOTA RUDENYO payroll#:105224 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1037,'2025-08-10 15:26:15',5,'update','Changed shift for employee IVY WANGUI KINUTHIA payroll#:107637 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1038,'2025-08-10 15:26:15',5,'update','Changed shift for employee IVYNE IYAGWEYA INYANGALA payroll#:107716 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1039,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACINTA AWINO ODHIAMBO payroll#:102219 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1040,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACINTA KANANASI MKUNU payroll#:105170 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1041,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACINTA KANGENDO ALEX payroll#:100391 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1042,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACINTA MILLY MULUN payroll#:104466 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1043,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACINTA MUTHEU MUTISYA payroll#:104372 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1044,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACINTA MWENDE KAMULA payroll#:104610 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1045,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACINTA MWENDE MUTUNGA payroll#:101132 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1046,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACINTA NTHAMBI KIMAU payroll#:100614 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1047,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACKLINE ADHIAMBO OWINO payroll#:100086 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1048,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACKLINE ANDEYO  payroll#:104129 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1049,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACKLINE FURAHA KATANA payroll#:104347 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1050,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACKLINE KALUKI GIBSON payroll#:100752 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1051,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACKLINE KAMENE ANN payroll#:103422 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1052,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACKLINE KAVULU SAMMY payroll#:103055 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1053,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACKLINE KAWIRA  payroll#:104515 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1054,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACKLINE KITAWA MWARORI payroll#:100237 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1055,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACKLINE KWAMBOKA ONDIMA payroll#:102135 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1056,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACKLINE MBODZE MVUKO payroll#:103044 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1057,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACKLINE MINAYO ANZEZE payroll#:101972 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1058,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACKLINE MORAA ATONI payroll#:101784 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1059,'2025-08-10 15:26:15',5,'update','Changed shift for employee JACKLINE MOYANGI OBIERO payroll#:107416 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1060,'2025-08-10 15:26:16',5,'update','Changed shift for employee JACKLINE MUENI MUTINDA payroll#:104082 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1061,'2025-08-10 15:26:16',5,'update','Changed shift for employee JACKLINE NAFULA OMOMDI payroll#:102149 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1062,'2025-08-10 15:26:16',5,'update','Changed shift for employee JACKLINE NDINDA WAMBUA payroll#:102106 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1063,'2025-08-10 15:26:16',5,'update','Changed shift for employee JACKSON MULU DAVID payroll#:100593 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1064,'2025-08-10 15:26:16',5,'update','Changed shift for employee JACKSON MUTUKU MUSEMBI payroll#:100939 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1065,'2025-08-10 15:26:16',5,'update','Changed shift for employee JACKTON MANDELA ONGOTE payroll#:106139 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1066,'2025-08-10 15:26:16',5,'update','Changed shift for employee JACOB KIVINDU MUTINDA payroll#:100264 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1067,'2025-08-10 15:26:16',5,'update','Changed shift for employee JACQUELINE SIDI CHARO payroll#:102477 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1068,'2025-08-10 15:26:16',5,'update','Changed shift for employee JACQUILINE KANYIVA  payroll#:101598 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1069,'2025-08-10 15:26:16',5,'update','Changed shift for employee JAEL MGHULO MAGHANGA payroll#:102889 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1070,'2025-08-10 15:26:16',5,'update','Changed shift for employee JAKLYNE NAFUNA WAFULA payroll#:107492 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1071,'2025-08-10 15:26:16',5,'update','Changed shift for employee JAMES KIOKO VATI payroll#:106121 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1072,'2025-08-10 15:26:16',5,'update','Changed shift for employee JAMES MURIMI KAURA payroll#:104619 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1073,'2025-08-10 15:26:16',5,'update','Changed shift for employee JAMES MWANJAGI MZUMBI payroll#:100135 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1074,'2025-08-10 15:26:16',5,'update','Changed shift for employee JAMES NGUGI MBUGUA payroll#:105955 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1075,'2025-08-10 15:26:16',5,'update','Changed shift for employee JAMES OCHECK OKWARA payroll#:104609 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1076,'2025-08-10 15:26:16',5,'update','Changed shift for employee JAMILA SHEBANI KHAMIS payroll#:102198 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1077,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE ATIENO OJAL payroll#:100442 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1078,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE AUMA  payroll#:102763 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1079,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE AUMA DANGA payroll#:102725 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1080,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE CHAO MWAMBI payroll#:102592 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1081,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE CHIZI CHIJE payroll#:101009 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1082,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE GAKII  payroll#:100479 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1083,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE KAMBUA MWANTHI payroll#:100111 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1084,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE KAMBURA  payroll#:100291 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1085,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE KATILE MUTINDA payroll#:100804 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1086,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE KERUBO ONGERA payroll#:107720 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1087,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE MUNYIVA MUTISO payroll#:103997 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1088,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE NDUNGE NDILA payroll#:100747 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1089,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE NGITHI MUMO payroll#:100220 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1090,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE NYAKERARIO MORANGA payroll#:103990 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1091,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE NZEMBI MAKUTHU payroll#:105684 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1092,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE SYOMITI MUSILI payroll#:106370 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1093,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE WAKESHO SHOLO payroll#:100908 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1094,'2025-08-10 15:26:16',5,'update','Changed shift for employee JANE WAMBUA  payroll#:107689 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1095,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANE WAMBUI KARANJA payroll#:100734 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1096,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANE WANJIKU NJOYA payroll#:102488 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1097,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANET ADHIAMBO ODHIAMBO payroll#:104368 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1098,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANET AUMA ANYANGO payroll#:100240 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1099,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANET CHIZI MZUNGU payroll#:100419 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1100,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANET KAMANTHE MUENI payroll#:102327 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1101,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANET KAVATA KIMENYE payroll#:107462 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1102,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANET KWEKWE NZAKA payroll#:105141 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1103,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANET MBEYU BARAWA payroll#:103883 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1104,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANET MUKOYA WAKHUNGU payroll#:100853 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1105,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANET MUSYAWA MUTWII payroll#:103501 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1106,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANET NYEVU KAHINDI payroll#:106745 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1107,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANET WAMBUGHA KILILO payroll#:101498 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1108,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANET WAMBUGHA KISOMBE payroll#:104775 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1109,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANET WAMBUI MWASYA payroll#:100746 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1110,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANETER MUMBI NZUMU payroll#:100153 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1111,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANETH AKOTH AWUONDA payroll#:105293 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1112,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANETH WAKESHO MGHOI payroll#:100127 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1113,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANICE KAIYU MWANGANGI payroll#:103517 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1114,'2025-08-10 15:26:17',5,'update','Changed shift for employee JANNET KAVESA PETER payroll#:101590 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1115,'2025-08-10 15:26:17',5,'update','Changed shift for employee JASINTA MWIKALI KIOKO payroll#:100372 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1116,'2025-08-10 15:26:17',5,'update','Changed shift for employee JASON MAKORI KASIMIRI payroll#:104342 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1117,'2025-08-10 15:26:17',5,'update','Changed shift for employee JECINTER MOSE MASHUDI payroll#:106204 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1118,'2025-08-10 15:26:17',5,'update','Changed shift for employee JEDIDAH MUKELI KANYIVA payroll#:103483 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1119,'2025-08-10 15:26:17',5,'update','Changed shift for employee JEDIDAH MWENDE MUTUA payroll#:102234 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1120,'2025-08-10 15:26:17',5,'update','Changed shift for employee JEFFERSON LENJO MGHENDI payroll#:105854 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1121,'2025-08-10 15:26:17',5,'update','Changed shift for employee JEMIMAH NAFULA OKELLO payroll#:102666 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1122,'2025-08-10 15:26:17',5,'update','Changed shift for employee JEMMIMAH MWONGELI KISYOKA payroll#:102802 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1123,'2025-08-10 15:26:17',5,'update','Changed shift for employee JENIPHER MANGA MWADUWI payroll#:107593 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1124,'2025-08-10 15:26:17',5,'update','Changed shift for employee JENIPHER WANDOE TOLI payroll#:107617 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1125,'2025-08-10 15:26:17',5,'update','Changed shift for employee JENNIFER MBITHE DANIEL payroll#:106130 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1126,'2025-08-10 15:26:17',5,'update','Changed shift for employee JENNIFER MWANAKE MLAMBA payroll#:100178 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1127,'2025-08-10 15:26:17',5,'update','Changed shift for employee JENNIFER WANZA PAUL payroll#:104238 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1128,'2025-08-10 15:26:17',5,'update','Changed shift for employee JENTRIX NANJALA WASIKE payroll#:103841 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1129,'2025-08-10 15:26:17',5,'update','Changed shift for employee JESCA DAMA SAMMY payroll#:105703 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1130,'2025-08-10 15:26:17',5,'update','Changed shift for employee JESCA IMBOSA ALUVALA payroll#:102388 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1131,'2025-08-10 15:26:17',5,'update','Changed shift for employee JESCAH WANGOI WAUSI payroll#:104029 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1132,'2025-08-10 15:26:17',5,'update','Changed shift for employee JESCAR KWEKWE MGANGA payroll#:100260 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1133,'2025-08-10 15:26:17',5,'update','Changed shift for employee JEVAS MUTINDA WAYUA payroll#:107789 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1134,'2025-08-10 15:26:17',5,'update','Changed shift for employee JEVUNEI TIRIMBA MOKANO payroll#:104427 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1135,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOAB KEN  payroll#:105155 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1136,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOAN SHIUNDU WANYAMA payroll#:102629 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1137,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOAN WATIRI MUTHONI payroll#:104015 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1138,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOASH KIMANI NJAGI payroll#:104190 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1139,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOHN ASHIKA OKINDA payroll#:100286 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1140,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOHN JUMA ODUOR payroll#:107810 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1141,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOHN KISOI NZIOKA payroll#:103411 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1142,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOHN KIVOTO DARIUS payroll#:103833 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1143,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOHN KOMBE MWARANDU payroll#:102265 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1144,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOHN KOMU SIMEONI payroll#:101725 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1145,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOHN MULWA KITHOME payroll#:107640 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1146,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOHN MUTWII MULEWA payroll#:102692 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1147,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOLLINES MUTINYA LUBEMBE payroll#:103838 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1148,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSELINE WAYUA KYALO payroll#:100608 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1149,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPH KIVAA KATHINI payroll#:104975 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1150,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPH MOKOMBA ONSARINGO payroll#:106497 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1151,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPH MUSEE KIMANTHI payroll#:108107 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1152,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPH NOVI NGINA payroll#:102594 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1153,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPH SAFARI KITUKU payroll#:101149 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1154,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPHAT ANGWENYI NYANGARE payroll#:106133 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1155,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPHINE JUMWA KAHINDI payroll#:100957 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1156,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPHINE KHAKUYIA IMBIAKH payroll#:103988 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1157,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPHINE MBATHA KAINDI payroll#:100461 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1158,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPHINE MEDZA MGUNGA payroll#:106728 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1159,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPHINE MUSENYA MULIKI payroll#:100439 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1160,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPHINE MWENDE NICODEMUS payroll#:107684 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1161,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPHINE MWIKALI MUNYWOKI payroll#:100440 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1162,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPHINE NDUNGE NZAU payroll#:104467 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1163,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPHINE WANJALA MWACHOKI payroll#:101906 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1164,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPHINE WUGHANGA MWAMODE payroll#:102482 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1165,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSEPHINE WUGHANGA MWAWAZA payroll#:103638 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1166,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSINTA ALUOCH PESA payroll#:102888 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1167,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSLINE MWENDE KITULU payroll#:102227 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1168,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOSPHINE MUTHINI MWINZILA payroll#:101742 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1169,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOY KANANA KINOTI payroll#:102121 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1170,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOY KANARIO LAIBUNI payroll#:107862 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1171,'2025-08-10 15:26:18',5,'update','Changed shift for employee JOY MWANZA  payroll#:107692 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1172,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOY NZAMBI ROBERT payroll#:105701 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1173,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCE ANZAZI DZOMBO payroll#:100950 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1174,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCE CHEMUTAI LANGAT payroll#:100369 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1175,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCE CHEPKOECH TAITA payroll#:101992 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1176,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCE CHIZI MBUI payroll#:104027 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1177,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCE DAMA KATANA payroll#:106371 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1178,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCE KASWII DAVID payroll#:100871 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1179,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCE KAVENGI MWAMBU payroll#:105290 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1180,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCE MUKEI JOHN payroll#:107594 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1181,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCE MUTHEU MUASA payroll#:107651 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1182,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCE MUTHEU MWENDWA payroll#:105242 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1183,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCE MUTINDI MUTHIANI payroll#:103511 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1184,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCE MWENDE MANZI payroll#:104508 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1185,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCE ROSE AKUMU payroll#:107551 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1186,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCE SAMUEL  payroll#:101336 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1187,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCE SIMBE MUSUMBA payroll#:104528 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1188,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYCELINE MWIKALI MUTHINI payroll#:104236 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1189,'2025-08-10 15:26:19',5,'update','Changed shift for employee JOYLINE MAPENZI KARISA payroll#:107647 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1190,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDITH ACHIENG OTIENO payroll#:102260 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1191,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDITH AKECH WASIAJI payroll#:100088 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1192,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDITH AKINYI OTIENO payroll#:104188 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1193,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDITH AKINYI OUMA payroll#:104089 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1194,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDITH AKINYI OWINO payroll#:106032 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1195,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDITH AMIMO MUKOLWE payroll#:104177 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1196,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDITH ANYANGO OGOMBE payroll#:102325 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1197,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDITH ATIENO OKELO payroll#:102203 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1198,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDITH MASAGO MWANYANGWA payroll#:107687 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1199,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDITH MUTETHYA MOSES payroll#:106746 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1200,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDITH NYAMVULA MRENJE payroll#:104774 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1201,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDITH SHANGARI MWAISAKA payroll#:103330 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1202,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDY CHEPKOGEI SAWE payroll#:105697 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1203,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDY KASYOKA WAMBUA payroll#:102075 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1204,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDY KEMUNTO AYOTO payroll#:107616 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1205,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDY KERUBO MIGOSI payroll#:103426 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1206,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDY WANZA KIMEU payroll#:103998 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1207,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDY WAYUA MUTUKU payroll#:107697 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1208,'2025-08-10 15:26:19',5,'update','Changed shift for employee JUDYCASTER MWENDE MUTKU payroll#:102130 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1209,'2025-08-10 15:26:20',5,'update','Changed shift for employee JULIA ATIENO ONDIEK payroll#:103805 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1210,'2025-08-10 15:26:20',5,'update','Changed shift for employee JULIA KATHURE  payroll#:100860 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1211,'2025-08-10 15:26:20',5,'update','Changed shift for employee JULIANA TALU MSAE payroll#:102153 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1212,'2025-08-10 15:26:20',5,'update','Changed shift for employee JULIANNA PILI JOSEPH payroll#:107724 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1213,'2025-08-10 15:26:20',5,'update','Changed shift for employee JULIET DESTA WANJALA payroll#:103711 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1214,'2025-08-10 15:26:20',5,'update','Changed shift for employee JULIET MUTHONI  payroll#:107614 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1215,'2025-08-10 15:26:20',5,'update','Changed shift for employee JULIET MWENI  payroll#:102329 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1216,'2025-08-10 15:26:20',5,'update','Changed shift for employee JULIET NASIMIYU MAKHANU payroll#:102197 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1217,'2025-08-10 15:26:20',5,'update','Changed shift for employee JULIET NYAMVULA NDUNE payroll#:105939 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1218,'2025-08-10 15:26:20',5,'update','Changed shift for employee JULIETA MANGA MWAORE payroll#:100079 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1219,'2025-08-10 15:26:20',5,'update','Changed shift for employee JUMAA MWADIGA MWANALOMA payroll#:104716 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1220,'2025-08-10 15:26:20',5,'update','Changed shift for employee JUMWA KAZUNGU KAHINDI payroll#:108101 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1221,'2025-08-10 15:26:20',5,'update','Changed shift for employee JUSTINE OBEGI BENARD payroll#:104193 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1222,'2025-08-10 15:26:20',5,'update','Changed shift for employee JUSTUS KINGI KAZUNGU payroll#:103325 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1223,'2025-08-10 15:26:20',5,'update','Changed shift for employee JUSTUS MUNYAO MUTHAMA payroll#:103484 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1224,'2025-08-10 15:26:20',5,'update','Changed shift for employee KABIBI BIRYA MASHA payroll#:102729 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1225,'2025-08-10 15:26:20',5,'update','Changed shift for employee KABIBI KARISA KAINGU payroll#:107925 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1226,'2025-08-10 15:26:20',5,'update','Changed shift for employee KACHE CHANGAWA  payroll#:102195 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1227,'2025-08-10 15:26:20',5,'update','Changed shift for employee KADII CHARO KITHI payroll#:107677 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1228,'2025-08-10 15:26:20',5,'update','Changed shift for employee KALEKYE MAKUTHU  payroll#:102332 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1229,'2025-08-10 15:26:20',5,'update','Changed shift for employee KALEN MWENDA NJERU payroll#:102851 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1230,'2025-08-10 15:26:20',5,'update','Changed shift for employee KALUMU JONATHAN  payroll#:101147 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1231,'2025-08-10 15:26:20',5,'update','Changed shift for employee KAMBUA KIOKO  payroll#:104512 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1232,'2025-08-10 15:26:20',5,'update','Changed shift for employee KASYOKA KUTHUKA  payroll#:107652 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1233,'2025-08-10 15:26:20',5,'update','Changed shift for employee KASYOKA MAKAU  payroll#:103448 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1234,'2025-08-10 15:26:20',5,'update','Changed shift for employee KATHEKE NDONYI  payroll#:103478 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1235,'2025-08-10 15:26:20',5,'update','Changed shift for employee KATHINI MAINGI  payroll#:100899 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1236,'2025-08-10 15:26:20',5,'update','Changed shift for employee KATUKU OTIENO  payroll#:101461 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1237,'2025-08-10 15:26:20',5,'update','Changed shift for employee KAVATA JOSHUA  payroll#:102847 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1238,'2025-08-10 15:26:20',5,'update','Changed shift for employee KAVUTHA TITUS  payroll#:107489 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1239,'2025-08-10 15:26:20',5,'update','Changed shift for employee KELVIN ACHAGA ANINI payroll#:107597 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1240,'2025-08-10 15:26:20',5,'update','Changed shift for employee KELVIN FUNDI MUCHOMBA payroll#:104974 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1241,'2025-08-10 15:26:20',5,'update','Changed shift for employee KELVIN KIEMA JONATHAN payroll#:103351 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1242,'2025-08-10 15:26:20',5,'update','Changed shift for employee KELVIN PETELO MUSILI payroll#:105228 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1243,'2025-08-10 15:26:20',5,'update','Changed shift for employee KENNEDY MUNG\'AI  payroll#:106291 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1244,'2025-08-10 15:26:20',5,'update','Changed shift for employee KENNETH CHILUMO MWANGUDZA payroll#:107877 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1245,'2025-08-10 15:26:20',5,'update','Changed shift for employee KERRY KAVINYA MUTHANGA payroll#:103935 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1246,'2025-08-10 15:26:20',5,'update','Changed shift for employee KETTY WINNY WANDERA payroll#:102283 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1247,'2025-08-10 15:26:21',5,'update','Changed shift for employee KEVIN MOSES MUMIA payroll#:100346 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1248,'2025-08-10 15:26:21',5,'update','Changed shift for employee KEVIN ODHIAMBO SAWANDA payroll#:100345 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1249,'2025-08-10 15:26:21',5,'update','Changed shift for employee KEVIN OGADA MASHETI payroll#:103624 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1250,'2025-08-10 15:26:21',5,'update','Changed shift for employee KEVIN OMULINJII OSORE payroll#:102984 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1251,'2025-08-10 15:26:21',5,'update','Changed shift for employee KEVIN SHIVOGO NYONGESA payroll#:102910 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1252,'2025-08-10 15:26:21',5,'update','Changed shift for employee KHADIJA CHENGO KATANA payroll#:103881 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1253,'2025-08-10 15:26:21',5,'update','Changed shift for employee KHADIJA NZEMBE  payroll#:102483 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1254,'2025-08-10 15:26:21',5,'update','Changed shift for employee KHAYANJE KEPHA ROSELYNE payroll#:100109 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1255,'2025-08-10 15:26:21',5,'update','Changed shift for employee KHERI KESI MWANYULE payroll#:106030 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1256,'2025-08-10 15:26:21',5,'update','Changed shift for employee KIBOGO MATHIAS MUCHIRI payroll#:105144 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1257,'2025-08-10 15:26:21',5,'update','Changed shift for employee KILILE KILOKO  payroll#:100289 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1258,'2025-08-10 15:26:21',5,'update','Changed shift for employee KILONZO MWOVA  payroll#:101726 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1259,'2025-08-10 15:26:21',5,'update','Changed shift for employee KOKI KIMANZI  payroll#:103879 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1260,'2025-08-10 15:26:21',5,'update','Changed shift for employee KUVUNA MAJALIWA  payroll#:101980 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1261,'2025-08-10 15:26:21',5,'update','Changed shift for employee KWEKWE SALAMA JUMAA payroll#:100773 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1262,'2025-08-10 15:26:21',5,'update','Changed shift for employee KYUSYA JAMES KISULU payroll#:102771 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1263,'2025-08-10 15:26:21',5,'update','Changed shift for employee LAMECH NGUI KYEMBWA payroll#:101302 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1264,'2025-08-10 15:26:21',5,'update','Changed shift for employee LAURAH NORAH WUGANGA payroll#:104080 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1265,'2025-08-10 15:26:21',5,'update','Changed shift for employee LAURINE KACHE AMANI payroll#:103878 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1266,'2025-08-10 15:26:21',5,'update','Changed shift for employee LAVENDA ANYANGO OCHOLA payroll#:103390 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1267,'2025-08-10 15:26:21',5,'update','Changed shift for employee LAVENDA MWIKALI NGINA payroll#:102981 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1268,'2025-08-10 15:26:21',5,'update','Changed shift for employee LAVENDER AKOTH OTIENO payroll#:102241 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1269,'2025-08-10 15:26:21',5,'update','Changed shift for employee LAVENDER AWINO OMACHARI payroll#:100667 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1270,'2025-08-10 15:26:21',5,'update','Changed shift for employee LAZARUS KYALO MWALUKO payroll#:104591 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1271,'2025-08-10 15:26:21',5,'update','Changed shift for employee LEAH AKINYI WANJALA payroll#:102264 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1272,'2025-08-10 15:26:21',5,'update','Changed shift for employee LEAH MWIKALI KYUMA payroll#:102591 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1273,'2025-08-10 15:26:21',5,'update','Changed shift for employee LEAH RIZIKI KAZUNGU payroll#:107511 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1274,'2025-08-10 15:26:21',5,'update','Changed shift for employee LEAH TITO  payroll#:104109 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1275,'2025-08-10 15:26:21',5,'update','Changed shift for employee LEAH UCHI DIMA payroll#:103288 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1276,'2025-08-10 15:26:21',5,'update','Changed shift for employee LEAH ZAWADI KENGA payroll#:100927 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1277,'2025-08-10 15:26:21',5,'update','Changed shift for employee LEBAH HARON INDUSA payroll#:101897 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1278,'2025-08-10 15:26:21',5,'update','Changed shift for employee LEHAH MUMBE NZOMO payroll#:102343 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1279,'2025-08-10 15:26:21',5,'update','Changed shift for employee LEILA CHARO KONDE payroll#:104107 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1280,'2025-08-10 15:26:21',5,'update','Changed shift for employee LENAH KAWIRA  payroll#:101628 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1281,'2025-08-10 15:26:21',5,'update','Changed shift for employee LENAH SAULA  payroll#:103285 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1282,'2025-08-10 15:26:21',5,'update','Changed shift for employee LENNYS NABWIRE ODUOR payroll#:101978 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1283,'2025-08-10 15:26:21',5,'update','Changed shift for employee LENZAH AWUOR  payroll#:102486 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1284,'2025-08-10 15:26:21',5,'update','Changed shift for employee LEONIDAH ETOLAH OBIERO payroll#:103005 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1285,'2025-08-10 15:26:22',5,'update','Changed shift for employee LEVINA ACHIENG SAOKE payroll#:107575 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1286,'2025-08-10 15:26:22',5,'update','Changed shift for employee LEVINNAH NZAMBI NGAU payroll#:101979 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1287,'2025-08-10 15:26:22',5,'update','Changed shift for employee LEVITIZIA NAKIO  payroll#:102489 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1288,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN ACHIENG MUDUDA payroll#:102120 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1289,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN AKOTH OKOTH payroll#:100341 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1290,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN ANYANGO ODHIAMBO payroll#:103072 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1291,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN ATIENO OUMA payroll#:102756 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1292,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN KOKI MWENDE payroll#:103095 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1293,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN KWAMBOKA NYAMBANE payroll#:106029 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1294,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN MIKAELI MUTHOKA payroll#:103728 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1295,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN MONYENYE MWERESA payroll#:104271 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1296,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN MUYANGA  payroll#:101671 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1297,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN MWIKANDI GUNDU payroll#:104987 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1298,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN NABWIRE WANDERA payroll#:104126 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1299,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN NAVARIA  payroll#:107645 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1300,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN NDINDA MULOKI payroll#:102697 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1301,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN SIDI JUMA payroll#:104364 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1302,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN WAYUA NZULAI payroll#:104527 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1303,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILIAN ZIPPORAH NAFULA payroll#:101971 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1304,'2025-08-10 15:26:22',5,'update','Changed shift for employee LILLIAN ACHIENG ABUYA payroll#:105704 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1305,'2025-08-10 15:26:22',5,'update','Changed shift for employee LINAH  MWAKIKOTO payroll#:103108 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1306,'2025-08-10 15:26:22',5,'update','Changed shift for employee LINAH WAWUDA MWANDOE payroll#:102008 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1307,'2025-08-10 15:26:22',5,'update','Changed shift for employee LINDA MOSES  payroll#:102196 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1308,'2025-08-10 15:26:22',5,'update','Changed shift for employee LINET  KIOKO payroll#:104335 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1309,'2025-08-10 15:26:22',5,'update','Changed shift for employee LINET ACHIENG  payroll#:104121 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1310,'2025-08-10 15:26:22',5,'update','Changed shift for employee LINET ADHIAMBO ONYANGO payroll#:100315 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1311,'2025-08-10 15:26:22',5,'update','Changed shift for employee LINET AWUOR JUMA payroll#:107613 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1312,'2025-08-10 15:26:22',5,'update','Changed shift for employee LINET KAHINDI MWALIMU payroll#:102342 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1313,'2025-08-10 15:26:22',5,'update','Changed shift for employee LINET MOKEIRA MWITA payroll#:103792 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1314,'2025-08-10 15:26:22',5,'update','Changed shift for employee LISPER KERUBO MORWABE payroll#:102704 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1315,'2025-08-10 15:26:22',5,'update','Changed shift for employee LORINE AKOTH OTIENO payroll#:102397 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1316,'2025-08-10 15:26:22',5,'update','Changed shift for employee LORRINE KENDI ONZERE payroll#:102223 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1317,'2025-08-10 15:26:22',5,'update','Changed shift for employee LOVIN NAMATORE WAKWEIKA payroll#:102667 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1318,'2025-08-10 15:26:22',5,'update','Changed shift for employee LOYCE MEDZA MDZOMBA payroll#:103387 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1319,'2025-08-10 15:26:22',5,'update','Changed shift for employee LUCAS OCHIENG NYANGANYI payroll#:100930 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1320,'2025-08-10 15:26:22',5,'update','Changed shift for employee LUCAS SOLO SAMMY payroll#:103658 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1321,'2025-08-10 15:26:22',5,'update','Changed shift for employee LUCIANA MUTINDI MUTUA payroll#:104283 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1322,'2025-08-10 15:26:22',5,'update','Changed shift for employee LUCKY AUMA OTIENO payroll#:104524 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1323,'2025-08-10 15:26:23',5,'update','Changed shift for employee LUCY ADHIAMBO OMONDI payroll#:104037 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1324,'2025-08-10 15:26:23',5,'update','Changed shift for employee LUCY ATIENO OWOUR payroll#:101977 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1325,'2025-08-10 15:26:23',5,'update','Changed shift for employee LUCY KAGURI  payroll#:107620 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1326,'2025-08-10 15:26:23',5,'update','Changed shift for employee LUCY MARKU CHILUMO payroll#:102230 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1327,'2025-08-10 15:26:23',5,'update','Changed shift for employee LUCY MASIKA JEMBE payroll#:103928 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1328,'2025-08-10 15:26:23',5,'update','Changed shift for employee LUCY MBETE MUEMA payroll#:104112 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1329,'2025-08-10 15:26:23',5,'update','Changed shift for employee LUCY MNYAZI KITSAO payroll#:104279 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1330,'2025-08-10 15:26:23',5,'update','Changed shift for employee LUCY MWENDE DAVID payroll#:100287 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1331,'2025-08-10 15:26:23',5,'update','Changed shift for employee LUCY NATHAN MUVOI payroll#:102226 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1332,'2025-08-10 15:26:23',5,'update','Changed shift for employee LUCY NYADZUA MWAMGULO payroll#:107606 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1333,'2025-08-10 15:26:23',5,'update','Changed shift for employee LUCY NYAMBURA MUNYAGA payroll#:100218 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1334,'2025-08-10 15:26:23',5,'update','Changed shift for employee LUCY SIDI SAFARI payroll#:102029 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1335,'2025-08-10 15:26:23',5,'update','Changed shift for employee LUCY SYLVIA AKINYI payroll#:103657 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1336,'2025-08-10 15:26:23',5,'update','Changed shift for employee LUKIA KITHEKA  payroll#:102701 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1337,'2025-08-10 15:26:23',5,'update','Changed shift for employee LUVUNO CHIKOPHE TSUMA payroll#:102340 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1338,'2025-08-10 15:26:23',5,'update','Changed shift for employee LYDIA AKUMU ACHUKI payroll#:102077 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1339,'2025-08-10 15:26:23',5,'update','Changed shift for employee LYDIA KAIMENYI ISAAC payroll#:105225 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1340,'2025-08-10 15:26:23',5,'update','Changed shift for employee LYDIA KAVATA SAMUEL payroll#:102719 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1341,'2025-08-10 15:26:23',5,'update','Changed shift for employee LYDIA KERUBO MOREGO payroll#:104511 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1342,'2025-08-10 15:26:23',5,'update','Changed shift for employee LYDIA MUEKE NGUNGU payroll#:100893 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1343,'2025-08-10 15:26:23',5,'update','Changed shift for employee LYDIA NELIMA WABWILE payroll#:105467 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1344,'2025-08-10 15:26:23',5,'update','Changed shift for employee LYDIA NYABOKE RIOBA payroll#:102717 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1345,'2025-08-10 15:26:23',5,'update','Changed shift for employee LYDIA NYADZUWA MWATSUMA payroll#:105102 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1346,'2025-08-10 15:26:23',5,'update','Changed shift for employee LYDIAH MOSIARA OMENYO payroll#:103948 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1347,'2025-08-10 15:26:23',5,'update','Changed shift for employee LYDIAH MUTUA  payroll#:101966 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1348,'2025-08-10 15:26:23',5,'update','Changed shift for employee LYDIAH ONG\"OCHA FRANCIS payroll#:100298 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1349,'2025-08-10 15:26:23',5,'update','Changed shift for employee MACKLINE ANYANGO ODHIMABO payroll#:100697 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1350,'2025-08-10 15:26:23',5,'update','Changed shift for employee MACRINA WAMBUGHA KISAKA payroll#:101005 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1351,'2025-08-10 15:26:23',5,'update','Changed shift for employee MAGDALENE MACHOCHO MWASHOR payroll#:100224 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1352,'2025-08-10 15:26:23',5,'update','Changed shift for employee MAGDALINE AMILE  payroll#:102395 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1353,'2025-08-10 15:26:23',5,'update','Changed shift for employee MAGDALINE MUENI NZOMO payroll#:102345 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1354,'2025-08-10 15:26:23',5,'update','Changed shift for employee MAGDALINE NDINDA MULI payroll#:104111 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1355,'2025-08-10 15:26:23',5,'update','Changed shift for employee MAGDALINE ZAINAB THOYA payroll#:102224 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1356,'2025-08-10 15:26:23',5,'update','Changed shift for employee MALUU DAVID MWANZIA payroll#:104108 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1357,'2025-08-10 15:26:23',5,'update','Changed shift for employee MARCIANA MANDI MWASI payroll#:105497 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1358,'2025-08-10 15:26:23',5,'update','Changed shift for employee MARGARET AMENYA  payroll#:100962 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1359,'2025-08-10 15:26:23',5,'update','Changed shift for employee MARGARET KAINGU  payroll#:100363 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1360,'2025-08-10 15:26:23',5,'update','Changed shift for employee MARGARET KANINI MUTUA payroll#:103050 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1361,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARGARET KATINI WAKESHO payroll#:102706 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1362,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARGARET KWEKWE MUNGA payroll#:105135 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1363,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARGARET MULIKE MUNGAU payroll#:101609 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1364,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARGARET MUTHONI MWAURA payroll#:101027 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1365,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARGARET MWAKA MWANGOME payroll#:103420 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1366,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARGARET MWIKALI KOMU payroll#:102713 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1367,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARGARET NDUKU MBOYA payroll#:105118 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1368,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARGARET REHEMA MASILA payroll#:104265 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1369,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARGARET WANGUI CHEGE payroll#:106210 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1370,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARGARET WANJIRU MWANGI payroll#:102237 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1371,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARGRET NDUKU MUTUKU payroll#:102865 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1372,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARIA CHANYA TENGIA payroll#:100874 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1373,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARIAM ALI MWADZAMBO payroll#:103912 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1374,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARIAM BAHATI NZAKA payroll#:100324 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1375,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARIAM JELEL MKALA payroll#:107963 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1376,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARIAM KALEKYE NGAU payroll#:107636 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1377,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARIAM NYABOKE  payroll#:107615 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1378,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARIAM OKETCH MAKUKHA payroll#:100211 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1379,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARIAM SALIM MWAYAMA payroll#:100878 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1380,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARION NAFUNA MAYUNGA payroll#:107555 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1381,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARION TATU KATANA payroll#:105121 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1382,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARK OFULA BARASA payroll#:104350 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1383,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARK OPIYO OKENGO payroll#:100904 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1384,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARTHA MUTETHYA MUSEE payroll#:103425 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1385,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARTHA WALOWE MWASHUMA payroll#:103449 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1386,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARTHA ZILIBA  payroll#:102480 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1387,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARTHER NYADZUA KATANA payroll#:102866 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1388,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARTIN MUNENE  payroll#:103642 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1389,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARTINA MATUNDA MWASHUMA payroll#:102456 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1390,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARTINA NAZI  payroll#:103199 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1391,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARY ADHIAMBO WERE payroll#:104452 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1392,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARY AKINYI OTIENO payroll#:102168 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1393,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARY AOKO SHIKUKU payroll#:101988 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1394,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARY DZINE NYAMAWI payroll#:102158 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1395,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARY EMMACULATE OUMA payroll#:107572 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1396,'2025-08-10 15:26:24',5,'update','Changed shift for employee MARY GHATI MWIKWABE payroll#:107632 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1397,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY KADOGO WAMALWA payroll#:100309 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1398,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY KASUNI JOSEPH payroll#:106367 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1399,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY KOKI MUTIE payroll#:100892 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1400,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY KWEKWE MONGOLO payroll#:102881 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1401,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY LUCY  payroll#:106206 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1402,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY MARIA MWINZI payroll#:104411 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1403,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY MASHA GONA payroll#:105498 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1404,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY MAUNA NGAO payroll#:106135 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1405,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY MKAMBE MWADEWA payroll#:106013 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1406,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY MORAA NYAATA payroll#:103139 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1407,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY MUENI MULANGO payroll#:102076 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1408,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY MUTANU JUMA payroll#:103289 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1409,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY MUTHINI MBUVI payroll#:102979 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1410,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY MUTHOKI MUTUKU payroll#:104561 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1411,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY MWELU KIOKO payroll#:105226 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1412,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY NANJALA MASIKA payroll#:106646 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1413,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY NDAKULA MWANYUMBA payroll#:102941 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1414,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY SOPHIA BARASA payroll#:100430 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1415,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY SYOMITI MUMO payroll#:102935 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1416,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY TABU MWAMBI payroll#:103877 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1417,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY UMAZI NDEGWA payroll#:104194 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1418,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY WAMBUI WATIRI payroll#:107546 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1419,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARY WANJIRU MWANGI payroll#:101499 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1420,'2025-08-10 15:26:25',5,'update','Changed shift for employee MARYCASTER NDUNGE KALUI payroll#:103447 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1421,'2025-08-10 15:26:25',5,'update','Changed shift for employee MATILDA MKANDOE SALIM payroll#:102266 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1422,'2025-08-10 15:26:25',5,'update','Changed shift for employee MATULU KINYUNGU  payroll#:105953 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1423,'2025-08-10 15:26:25',5,'update','Changed shift for employee MAUREEN ACHIENG OUGO payroll#:102789 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1424,'2025-08-10 15:26:25',5,'update','Changed shift for employee MAUREEN KASYOKA MUNYOKI payroll#:105198 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1425,'2025-08-10 15:26:25',5,'update','Changed shift for employee MAUREEN KATUNGWA MASAI payroll#:102707 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1426,'2025-08-10 15:26:25',5,'update','Changed shift for employee MAUREEN KWEKWE MWANYOKA payroll#:101982 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1427,'2025-08-10 15:26:25',5,'update','Changed shift for employee MAUREEN MOIGE NYOUGO payroll#:105286 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1428,'2025-08-10 15:26:25',5,'update','Changed shift for employee MAUREEN MONAYO ZIRIBA payroll#:102646 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1429,'2025-08-10 15:26:25',5,'update','Changed shift for employee MAUREENE ANYANGO OJWANG payroll#:103815 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1430,'2025-08-10 15:26:25',5,'update','Changed shift for employee MAUREN AHAVALI  payroll#:102208 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1431,'2025-08-10 15:26:25',5,'update','Changed shift for employee MAURICE MUTISO NZUKI payroll#:102640 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1432,'2025-08-10 15:26:25',5,'update','Changed shift for employee MAURINE ADHIAMBO NYABOLA payroll#:100384 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1433,'2025-08-10 15:26:26',5,'update','Changed shift for employee MAURINE NGELE MBAYA payroll#:102154 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1434,'2025-08-10 15:26:26',5,'update','Changed shift for employee MAURINE SHIDA KARISA payroll#:106045 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1435,'2025-08-10 15:26:26',5,'update','Changed shift for employee MAXIMILA OPATI  payroll#:102240 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1436,'2025-08-10 15:26:26',5,'update','Changed shift for employee MAXWEL EMBUNGESI GWUMA payroll#:104964 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1437,'2025-08-10 15:26:26',5,'update','Changed shift for employee MAXWELL KIPLAGAT  payroll#:106281 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1438,'2025-08-10 15:26:26',5,'update','Changed shift for employee MBEYU CHAGA BUNDI payroll#:107685 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1439,'2025-08-10 15:26:26',5,'update','Changed shift for employee MBINYA MUNYWOKI  payroll#:103751 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1440,'2025-08-10 15:26:26',5,'update','Changed shift for employee MBITHE CHARLES  payroll#:104441 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1441,'2025-08-10 15:26:26',5,'update','Changed shift for employee MBULA NDELEVA  payroll#:101619 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1442,'2025-08-10 15:26:26',5,'update','Changed shift for employee MECY KANINI NTHENGE payroll#:100854 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1443,'2025-08-10 15:26:26',5,'update','Changed shift for employee MEDIATRIX NAFULA  payroll#:103604 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1444,'2025-08-10 15:26:26',5,'update','Changed shift for employee MEJUMA NYANJE MWABOGA payroll#:107618 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1445,'2025-08-10 15:26:26',5,'update','Changed shift for employee MELAN MIJIDE  payroll#:106034 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1446,'2025-08-10 15:26:26',5,'update','Changed shift for employee MELODINE NAMWEYA  payroll#:104365 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1447,'2025-08-10 15:26:26',5,'update','Changed shift for employee MELVIN AMONDI  payroll#:104349 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1448,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY ACHIENG NYAMBIGA payroll#:102462 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1449,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY ADHIAMBO ODHIAMBO payroll#:107595 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1450,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY AKOTH ODHIAMBO payroll#:103623 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1451,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY ANYANGO OBUYA payroll#:103682 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1452,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY ATIENO OCHIENG payroll#:107696 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1453,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY ATIENO OWINO payroll#:107635 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1454,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY AWINO OOKO payroll#:100872 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1455,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY CHEPKORIR LELEI payroll#:103911 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1456,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY KAHURU FONDO payroll#:107552 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1457,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY KAKI KITUVU payroll#:104704 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1458,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY KATHINI JAMES payroll#:102339 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1459,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY KATHINI JOSHUA payroll#:104151 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1460,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY MAGOMBE MWANGALA payroll#:104268 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1461,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY MAKUTHI  payroll#:101676 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1462,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY MIJIDE  payroll#:104475 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1463,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY MKANDOO MAGANGA payroll#:100722 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1464,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY MUMBUA MBITHI payroll#:100514 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1465,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY MUTIO MUTINDA payroll#:101305 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1466,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY MWAKA MGALA payroll#:105140 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1467,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY MWENDE LUCAS payroll#:107612 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1468,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY MWENDE PETER payroll#:107654 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1469,'2025-08-10 15:26:26',5,'update','Changed shift for employee MERCY MWONGELI MUTUA payroll#:103084 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1470,'2025-08-10 15:26:27',5,'update','Changed shift for employee MERCY NDUSYA MUTIA payroll#:107600 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1471,'2025-08-10 15:26:27',5,'update','Changed shift for employee MERCY NEKESA BARASA payroll#:105146 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1472,'2025-08-10 15:26:27',5,'update','Changed shift for employee MERCY NYATICHI KAMANDA payroll#:102627 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1473,'2025-08-10 15:26:27',5,'update','Changed shift for employee MERCY REHEMA KATANA payroll#:102001 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1474,'2025-08-10 15:26:27',5,'update','Changed shift for employee MERCYLINE ANNE OOKO payroll#:105688 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1475,'2025-08-10 15:26:27',5,'update','Changed shift for employee MERCYLINE BULENYWA WESONGA payroll#:107741 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1476,'2025-08-10 15:26:27',5,'update','Changed shift for employee MERCYLINE MWAKA KARISA payroll#:103774 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1477,'2025-08-10 15:26:27',5,'update','Changed shift for employee MERCYLINE NYABOKE MORARA payroll#:103771 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1478,'2025-08-10 15:26:27',5,'update','Changed shift for employee METRINE NANJALA WANYONYI payroll#:107791 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1479,'2025-08-10 15:26:27',5,'update','Changed shift for employee MICAL AWINO OKETCH payroll#:105179 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1480,'2025-08-10 15:26:27',5,'update','Changed shift for employee MICHAEL MUSE NAIBEI payroll#:107418 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1481,'2025-08-10 15:26:27',5,'update','Changed shift for employee MICHALLE GAKII MUVEA payroll#:107642 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1482,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILCAH MWENDE MATHEKA payroll#:100662 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1483,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILCAH OMWAKA OMUKOKO payroll#:105168 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1484,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILDRED ATIENO OYIMBRA payroll#:104332 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1485,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILDRED CHIBOLE OSORE payroll#:100447 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1486,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILDRED ILABONGA SHIKANGA payroll#:104576 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1487,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILDRED OMUKUBA EKONYA payroll#:104385 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1488,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILLEN ATIENO OCHIENG payroll#:103775 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1489,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILLICENT ACHIENG OTIENO payroll#:104133 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1490,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILLICENT AKINYI OGINGA payroll#:103107 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1491,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILLICENT ATIENO AWUOR payroll#:104004 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1492,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILLICENT AWINO OGINGA payroll#:100263 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1493,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILLICENT CHIBULE GONJA payroll#:102449 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1494,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILLICENT DIANA ANYANGO payroll#:105180 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1495,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILLICENT MOKIEIRA OMBATI payroll#:104264 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1496,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILLICENT SYONTHIA NZUKI payroll#:106287 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1497,'2025-08-10 15:26:27',5,'update','Changed shift for employee MILTON MWACHIRU KITTI payroll#:101685 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1498,'2025-08-10 15:26:27',5,'update','Changed shift for employee MIRIAM KANANA MUTURIA payroll#:107676 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1499,'2025-08-10 15:26:27',5,'update','Changed shift for employee MIRIAM KATETHYA MWOVA payroll#:103831 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1500,'2025-08-10 15:26:27',5,'update','Changed shift for employee MIRIAM MAKENA GICHURU payroll#:106127 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1501,'2025-08-10 15:26:27',5,'update','Changed shift for employee MIRIAM NDAMU MGHENDI payroll#:100849 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1502,'2025-08-10 15:26:27',5,'update','Changed shift for employee MIRIAM NDINDA NZUKI payroll#:104367 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1503,'2025-08-10 15:26:27',5,'update','Changed shift for employee MIRIAM NEKESA WANYAMA payroll#:105827 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1504,'2025-08-10 15:26:28',5,'update','Changed shift for employee MIRIAM NTHENYA MUTETI payroll#:104501 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1505,'2025-08-10 15:26:28',5,'update','Changed shift for employee MIRRIAM MONTHE NZIOKI payroll#:104035 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1506,'2025-08-10 15:26:28',5,'update','Changed shift for employee MIRRIAM MUSENGY\'A  payroll#:107653 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1507,'2025-08-10 15:26:28',5,'update','Changed shift for employee MIRRIAM NTHENYA KIMEU payroll#:102993 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1508,'2025-08-10 15:26:28',5,'update','Changed shift for employee MIRRIAM NZILANI MUTETA payroll#:104366 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1509,'2025-08-10 15:26:28',5,'update','Changed shift for employee MIRRIAM NZINGO KASHONGOLE payroll#:104135 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1510,'2025-08-10 15:26:28',5,'update','Changed shift for employee MISHI MNYAZI BAYA payroll#:103927 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1511,'2025-08-10 15:26:28',5,'update','Changed shift for employee MITCHEL AYIENDO OLONYI payroll#:103707 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1512,'2025-08-10 15:26:28',5,'update','Changed shift for employee MITCHELLE ATIENO OMONDI payroll#:103699 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1513,'2025-08-10 15:26:28',5,'update','Changed shift for employee MOHAMED KATAMA ALI payroll#:100465 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1514,'2025-08-10 15:26:28',5,'update','Changed shift for employee MOHAMED SALIM OMAR payroll#:103128 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1515,'2025-08-10 15:26:28',5,'update','Changed shift for employee MONICAH ATIENO OKOTH payroll#:107655 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1516,'2025-08-10 15:26:28',5,'update','Changed shift for employee MONICAH KAMENE MWANIA payroll#:107771 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1517,'2025-08-10 15:26:28',5,'update','Changed shift for employee MONICAH KATUNGE MUTUKU payroll#:104496 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1518,'2025-08-10 15:26:28',5,'update','Changed shift for employee MORAANZANGI MUASYA  payroll#:104005 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1519,'2025-08-10 15:26:28',5,'update','Changed shift for employee MORGAN NJOROGE MBURU payroll#:107382 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1520,'2025-08-10 15:26:28',5,'update','Changed shift for employee MORINE ACHIENG  payroll#:105108 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1521,'2025-08-10 15:26:28',5,'update','Changed shift for employee MORINE KEMUNTO ONDIEKI payroll#:104244 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1522,'2025-08-10 15:26:28',5,'update','Changed shift for employee MOSES JUMA KAROZI payroll#:101969 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1523,'2025-08-10 15:26:28',5,'update','Changed shift for employee MOSES NEGEMBE  payroll#:102786 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1524,'2025-08-10 15:26:28',5,'update','Changed shift for employee MOSES ODUOR  payroll#:104351 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1525,'2025-08-10 15:26:28',5,'update','Changed shift for employee MOTARI NGARE DENNIS payroll#:105088 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1526,'2025-08-10 15:26:28',5,'update','Changed shift for employee MOTI NYAKNGO BENARD payroll#:100926 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1527,'2025-08-10 15:26:28',5,'update','Changed shift for employee MOUREEN KARISA  payroll#:105171 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1528,'2025-08-10 15:26:28',5,'update','Changed shift for employee MOURINE ADLIGHT JUMA payroll#:102346 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1529,'2025-08-10 15:26:28',5,'update','Changed shift for employee MOURINE KWAMBOKA ATONI payroll#:100975 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1530,'2025-08-10 15:26:28',5,'update','Changed shift for employee MOURINE NABWIRE  payroll#:105148 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1531,'2025-08-10 15:26:28',5,'update','Changed shift for employee MTISYA COLLINS MAINGI payroll#:105114 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1532,'2025-08-10 15:26:28',5,'update','Changed shift for employee MUEMA PHILIP  payroll#:103131 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1533,'2025-08-10 15:26:28',5,'update','Changed shift for employee MUENI KALUKU  payroll#:101984 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1534,'2025-08-10 15:26:28',5,'update','Changed shift for employee MUENI NGELA  payroll#:103830 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1535,'2025-08-10 15:26:28',5,'update','Changed shift for employee MUMBE MUSANGO  payroll#:102334 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1536,'2025-08-10 15:26:28',5,'update','Changed shift for employee MUMO MUINDE  payroll#:102586 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1537,'2025-08-10 15:26:28',5,'update','Changed shift for employee MUNEE MULWA  payroll#:103929 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1538,'2025-08-10 15:26:28',5,'update','Changed shift for employee MUPA FATUMA RAMADHANI payroll#:102481 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1539,'2025-08-10 15:26:28',5,'update','Changed shift for employee MUPA NDORO NGOWA payroll#:104127 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1540,'2025-08-10 15:26:28',5,'update','Changed shift for employee MUSENYA OTIENO  payroll#:104793 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1541,'2025-08-10 15:26:28',5,'update','Changed shift for employee MUTEMI MULI  payroll#:106200 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1542,'2025-08-10 15:26:28',5,'update','Changed shift for employee MUTHEU MUTUA  payroll#:100152 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1543,'2025-08-10 15:26:29',5,'update','Changed shift for employee MUTHUI MUNYITHYA  payroll#:100321 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1544,'2025-08-10 15:26:29',5,'update','Changed shift for employee MUTIA MUSYIMI  payroll#:105654 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1545,'2025-08-10 15:26:29',5,'update','Changed shift for employee MUTINDA MUSYOKA KILOKO payroll#:107799 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1546,'2025-08-10 15:26:29',5,'update','Changed shift for employee MUTINDI MARGARET  payroll#:104007 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1547,'2025-08-10 15:26:29',5,'update','Changed shift for employee MVERA KARISA CHENGO payroll#:107641 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1548,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWAKA KOMBO NYAMAWI payroll#:101216 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1549,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWAKA MKAMBA  payroll#:100368 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1550,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWANAHAMISI BAKARI JUMA payroll#:104392 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1551,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWANAHARUSI MLONGO KESI payroll#:106369 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1552,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWANAHAWA GABRIEL MWAMBURI payroll#:104706 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1553,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWANAIDI JUMWA KINGI payroll#:101401 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1554,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWANAIDI NYAMVULA MAGONGO payroll#:102403 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1555,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWANAISHA KIRIMA MWANDORO payroll#:106727 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1556,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWANAKOMBO LUVI YAWA payroll#:102200 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1557,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWANAMISI MWAKA MALAU payroll#:106136 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1558,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWANAMISI NJOROGE NGANGA payroll#:102404 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1559,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWANAPILI LUVUNO NGOME payroll#:103446 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1560,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWANZIA KALAITA  payroll#:102874 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1561,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWANZIA KASIVI  payroll#:105767 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1562,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWENDE MALII  payroll#:103859 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1563,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWENGWA ELOSY MUTHAMIA payroll#:103444 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1564,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWIKALI KITHOME  payroll#:100101 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1565,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWIKALI MUTHEMBWA  payroll#:102724 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1566,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWILI MUTULA  payroll#:104435 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1567,'2025-08-10 15:26:29',5,'update','Changed shift for employee MWONGELI MUTUA  payroll#:101734 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1568,'2025-08-10 15:26:29',5,'update','Changed shift for employee NADZUA MALEJA BORA payroll#:102011 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1569,'2025-08-10 15:26:29',5,'update','Changed shift for employee NAHASHON BAGWASI RATEMO payroll#:103474 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1570,'2025-08-10 15:26:29',5,'update','Changed shift for employee NANCY AKINYI OCHIENG payroll#:103083 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1571,'2025-08-10 15:26:29',5,'update','Changed shift for employee NANCY AKINYI OMOLLO payroll#:102615 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1572,'2025-08-10 15:26:29',5,'update','Changed shift for employee NANCY KANANU NJERU payroll#:105763 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1573,'2025-08-10 15:26:29',5,'update','Changed shift for employee NANCY KWAMBOKA ONDIMU payroll#:102880 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1574,'2025-08-10 15:26:29',5,'update','Changed shift for employee NANCY MASIKA GEGE payroll#:102109 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1575,'2025-08-10 15:26:29',5,'update','Changed shift for employee NANCY MAWIA MARTHA payroll#:103413 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1576,'2025-08-10 15:26:29',5,'update','Changed shift for employee NANCY MONYANGI OGERA payroll#:104085 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1577,'2025-08-10 15:26:30',5,'update','Changed shift for employee NANCY MUKHWANA WANYONYI payroll#:102871 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1578,'2025-08-10 15:26:30',5,'update','Changed shift for employee NANCY MUSIKU KAVEMBA payroll#:101756 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1579,'2025-08-10 15:26:30',5,'update','Changed shift for employee NANCY NAKHUMICHA  payroll#:107419 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1580,'2025-08-10 15:26:30',5,'update','Changed shift for employee NANCY NIGHT OTIENO payroll#:107510 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1581,'2025-08-10 15:26:30',5,'update','Changed shift for employee NANCY NZEMBI MAITHYA payroll#:100955 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1582,'2025-08-10 15:26:30',5,'update','Changed shift for employee NAOM KEMUNTO NYABUTO payroll#:101193 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1583,'2025-08-10 15:26:30',5,'update','Changed shift for employee NAOMIE NYEKE MRUU payroll#:102368 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1584,'2025-08-10 15:26:30',5,'update','Changed shift for employee NAOMY KALEKYE MUTHANGA payroll#:103882 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1585,'2025-08-10 15:26:30',5,'update','Changed shift for employee NAOMY MBAIKA KILAWA payroll#:105952 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1586,'2025-08-10 15:26:30',5,'update','Changed shift for employee NAUM NZILANI MASILA payroll#:100292 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1587,'2025-08-10 15:26:30',5,'update','Changed shift for employee NAUMI MANGA SHUMA payroll#:102225 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1588,'2025-08-10 15:26:30',5,'update','Changed shift for employee NAUMI MUTHIO WAMBUA payroll#:100121 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1589,'2025-08-10 15:26:30',5,'update','Changed shift for employee NDETHYA KITHEKA  payroll#:104186 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1590,'2025-08-10 15:26:30',5,'update','Changed shift for employee NDILA MUTIE  payroll#:103421 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1591,'2025-08-10 15:26:30',5,'update','Changed shift for employee NDINDA KILONZO  payroll#:103147 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1592,'2025-08-10 15:26:30',5,'update','Changed shift for employee NDUKI KALELI  payroll#:104510 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1593,'2025-08-10 15:26:30',5,'update','Changed shift for employee NDUNGE MATHEKA  payroll#:107766 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1594,'2025-08-10 15:26:30',5,'update','Changed shift for employee NEEMA ABDALLA BAKARI payroll#:104816 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1595,'2025-08-10 15:26:30',5,'update','Changed shift for employee NEEMA KATHINI JOHN payroll#:103809 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1596,'2025-08-10 15:26:30',5,'update','Changed shift for employee NEEMA MGENI JINDWA payroll#:103895 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1597,'2025-08-10 15:26:30',5,'update','Changed shift for employee NEEMA SYONZAA SIMON payroll#:100762 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1598,'2025-08-10 15:26:30',5,'update','Changed shift for employee NELLY AUMA OGOTI payroll#:102856 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1599,'2025-08-10 15:26:30',5,'update','Changed shift for employee NELLY KABOGO OGOFU payroll#:102151 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1600,'2025-08-10 15:26:30',5,'update','Changed shift for employee NELLY MANYASA NYONGESA payroll#:103388 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1601,'2025-08-10 15:26:30',5,'update','Changed shift for employee NELSON NYAKOE MAGETO payroll#:105768 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1602,'2025-08-10 15:26:30',5,'update','Changed shift for employee NEMAH ADHIAMBO NGESAH payroll#:100262 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1603,'2025-08-10 15:26:30',5,'update','Changed shift for employee NICHOLUS NDUNDA SIMON payroll#:107770 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1604,'2025-08-10 15:26:30',5,'update','Changed shift for employee NORAH MLAGHO MWAJINGI payroll#:104087 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1605,'2025-08-10 15:26:30',5,'update','Changed shift for employee NURNCY REHEMA NGEREZA payroll#:105119 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1606,'2025-08-10 15:26:31',5,'update','Changed shift for employee NURU DZAME MWANGUDZA payroll#:106381 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1607,'2025-08-10 15:26:31',5,'update','Changed shift for employee NURU MLONGO DENA payroll#:107547 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1608,'2025-08-10 15:26:31',5,'update','Changed shift for employee NURU MWABAYA GANDI payroll#:103348 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1609,'2025-08-10 15:26:31',5,'update','Changed shift for employee NYADZUA WESA  payroll#:102927 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1610,'2025-08-10 15:26:31',5,'update','Changed shift for employee NYAMVULA HUSSEIN KALIMBO payroll#:103476 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1611,'2025-08-10 15:26:31',5,'update','Changed shift for employee NZEMBI MUTEMI  payroll#:103863 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1612,'2025-08-10 15:26:31',5,'update','Changed shift for employee NZUKI KELVIN NZUKI payroll#:101723 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1613,'2025-08-10 15:26:31',5,'update','Changed shift for employee ODHIAMBO JEFF ODHIAMBO payroll#:107798 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1614,'2025-08-10 15:26:31',5,'update','Changed shift for employee OLIVIA NASIMIYU  payroll#:107718 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1615,'2025-08-10 15:26:31',5,'update','Changed shift for employee OMBASA ROBINSON MOKUA payroll#:100850 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1616,'2025-08-10 15:26:31',5,'update','Changed shift for employee ONG\'ERA NAOMY  payroll#:100499 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1617,'2025-08-10 15:26:31',5,'update','Changed shift for employee OSCAR LUKA MASIMBU payroll#:107441 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1618,'2025-08-10 15:26:31',5,'update','Changed shift for employee OUMA MERESA ATIENO payroll#:103855 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1619,'2025-08-10 15:26:31',5,'update','Changed shift for employee OWEN MWAKAZO SIKUKU payroll#:107807 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1620,'2025-08-10 15:26:31',5,'update','Changed shift for employee PAMELA EGWA MWALUNDI payroll#:100609 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1621,'2025-08-10 15:26:31',5,'update','Changed shift for employee PAMELA LUVUNO MWAKAI payroll#:102405 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1622,'2025-08-10 15:26:31',5,'update','Changed shift for employee PAMELLA ADHIAMBO SEE payroll#:102598 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1623,'2025-08-10 15:26:31',5,'update','Changed shift for employee PATIENCE KAMBUA NTHENGE payroll#:103410 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1624,'2025-08-10 15:26:31',5,'update','Changed shift for employee PATIENCE MARIAM MWEMA payroll#:104178 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1625,'2025-08-10 15:26:31',5,'update','Changed shift for employee PATIENCE MWAKE MAZA payroll#:104455 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1626,'2025-08-10 15:26:31',5,'update','Changed shift for employee PATIENCE NYADZUA MGANDI payroll#:103073 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1627,'2025-08-10 15:26:31',5,'update','Changed shift for employee PATRICIA DZAME MWARUMBA payroll#:102192 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1628,'2025-08-10 15:26:31',5,'update','Changed shift for employee PATRICIA MWENDE MUSEE payroll#:103039 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1629,'2025-08-10 15:26:31',5,'update','Changed shift for employee PATRICIA MWIKARI MAINGI payroll#:104235 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1630,'2025-08-10 15:26:31',5,'update','Changed shift for employee PATRICIA NAKODAI SAKWA payroll#:107722 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1631,'2025-08-10 15:26:31',5,'update','Changed shift for employee PATRICIA THOYA BAYA payroll#:102141 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1632,'2025-08-10 15:26:31',5,'update','Changed shift for employee PATRICK MALEVE MBAI payroll#:103789 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1633,'2025-08-10 15:26:31',5,'update','Changed shift for employee PATRICK NYAMAWI MWATELA payroll#:103594 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1634,'2025-08-10 15:26:31',5,'update','Changed shift for employee PATRICK WAMBUA REGINA payroll#:101045 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1635,'2025-08-10 15:26:31',5,'update','Changed shift for employee PAUL MURAGE MWANGI payroll#:104243 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1636,'2025-08-10 15:26:31',5,'update','Changed shift for employee PAULINE AWUOR OWILI payroll#:104465 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1637,'2025-08-10 15:26:31',5,'update','Changed shift for employee PAULINE KANINI MULI payroll#:102463 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1638,'2025-08-10 15:26:31',5,'update','Changed shift for employee PAULINE MBITHE MATATA payroll#:104330 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1639,'2025-08-10 15:26:31',5,'update','Changed shift for employee PAULINE MMBOGA  payroll#:100351 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1640,'2025-08-10 15:26:31',5,'update','Changed shift for employee PAULINE MUNYIVA WAMBUA payroll#:100136 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1641,'2025-08-10 15:26:31',5,'update','Changed shift for employee PAULINE MUTHEU MALETE payroll#:104388 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1642,'2025-08-10 15:26:31',5,'update','Changed shift for employee PAULINE MUTIO LULA payroll#:104134 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1643,'2025-08-10 15:26:31',5,'update','Changed shift for employee PAULINE NDILA NGULI payroll#:102350 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1644,'2025-08-10 15:26:31',5,'update','Changed shift for employee PAULLINAH NTHENYA NTHENDU payroll#:103542 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1645,'2025-08-10 15:26:31',5,'update','Changed shift for employee PENINA KAMBUA MUTUA payroll#:100379 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1646,'2025-08-10 15:26:31',5,'update','Changed shift for employee PENINA MKANDOO MKAMBURI payroll#:103891 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1647,'2025-08-10 15:26:31',5,'update','Changed shift for employee PENINAH JUMA METHO payroll#:103419 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1648,'2025-08-10 15:26:31',5,'update','Changed shift for employee PENINAH MAMI MUSYOKA payroll#:101731 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1649,'2025-08-10 15:26:31',5,'update','Changed shift for employee PENINAH WAVINYA KAMBUA payroll#:106196 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1650,'2025-08-10 15:26:31',5,'update','Changed shift for employee PERICE WUKINDENYI NJUMWA payroll#:102785 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1651,'2025-08-10 15:26:31',5,'update','Changed shift for employee PERIS KAZUNGU  payroll#:100098 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1652,'2025-08-10 15:26:31',5,'update','Changed shift for employee PERIS NEEMA HABEL payroll#:103655 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1653,'2025-08-10 15:26:32',5,'update','Changed shift for employee PETER KOSO MAYOLI payroll#:100783 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1654,'2025-08-10 15:26:32',5,'update','Changed shift for employee PETER LUTOMIA MULUPI payroll#:107461 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1655,'2025-08-10 15:26:32',5,'update','Changed shift for employee PETER MUSUMALI  payroll#:100060 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1656,'2025-08-10 15:26:32',5,'update','Changed shift for employee PETER MUTIA JAMES payroll#:100833 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1657,'2025-08-10 15:26:32',5,'update','Changed shift for employee PETRONILA KANINI MWENDE payroll#:107656 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1658,'2025-08-10 15:26:32',5,'update','Changed shift for employee PETRONILA NDINDA STEPHENE payroll#:106741 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1659,'2025-08-10 15:26:32',5,'update','Changed shift for employee PHANE KERUBO MORANGA payroll#:103445 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1660,'2025-08-10 15:26:32',5,'update','Changed shift for employee PHELDAH NALIAKA WAFULA payroll#:101462 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1661,'2025-08-10 15:26:32',5,'update','Changed shift for employee PHELOMINAH KAMENE NZIVO payroll#:103840 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1662,'2025-08-10 15:26:32',5,'update','Changed shift for employee PHENY FIONA  payroll#:107631 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1663,'2025-08-10 15:26:32',5,'update','Changed shift for employee PHEOBE ACHIENG ONGWESO payroll#:100265 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1664,'2025-08-10 15:26:32',5,'update','Changed shift for employee PHEOBE AWUOR OUKO payroll#:104436 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1665,'2025-08-10 15:26:32',5,'update','Changed shift for employee PHILES BIYAKI OSORO payroll#:106044 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1666,'2025-08-10 15:26:32',5,'update','Changed shift for employee PHILIP MUEMA WAMBUA payroll#:100272 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1667,'2025-08-10 15:26:32',5,'update','Changed shift for employee PHILIS AHADI KITHEKA payroll#:101688 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1668,'2025-08-10 15:26:32',5,'update','Changed shift for employee PHILISIAH WAKIO MWAGOGO payroll#:104789 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1669,'2025-08-10 15:26:32',5,'update','Changed shift for employee PHILISTINA NGELE MWABILI payroll#:102406 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1670,'2025-08-10 15:26:32',5,'update','Changed shift for employee PHOEBE ADHIAMBO OWINO payroll#:100861 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1671,'2025-08-10 15:26:32',5,'update','Changed shift for employee PHOEBE AKINYI OWITI payroll#:100412 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1672,'2025-08-10 15:26:32',5,'update','Changed shift for employee PHOEBE AWINO OWINO payroll#:104008 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1673,'2025-08-10 15:26:32',5,'update','Changed shift for employee PHOSTINE NAMALWA SAENYI payroll#:107700 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1674,'2025-08-10 15:26:32',5,'update','Changed shift for employee PIUS WEKESA WANYAMA payroll#:100935 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1675,'2025-08-10 15:26:32',5,'update','Changed shift for employee PRECIOUS MARA ALFAYO payroll#:104526 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1676,'2025-08-10 15:26:32',5,'update','Changed shift for employee PRISCA AWINO OMOLLOH payroll#:107512 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1677,'2025-08-10 15:26:32',5,'update','Changed shift for employee PRISCA ODORO AUMA payroll#:100308 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1678,'2025-08-10 15:26:32',5,'update','Changed shift for employee PRISCAH KALEKYE JOHN payroll#:102194 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1679,'2025-08-10 15:26:32',5,'update','Changed shift for employee PRISCILA LUVUNO WILLIAM payroll#:104369 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1680,'2025-08-10 15:26:32',5,'update','Changed shift for employee PRISCILA NEKESA OKWAKO payroll#:100357 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1681,'2025-08-10 15:26:32',5,'update','Changed shift for employee PRISCILAR MBINYA BENARD payroll#:102448 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1682,'2025-08-10 15:26:32',5,'update','Changed shift for employee PRISCILLA MEDZA MTENGO payroll#:102852 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1683,'2025-08-10 15:26:32',5,'update','Changed shift for employee PRISCILLA MUDIE MVITA payroll#:102453 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1684,'2025-08-10 15:26:32',5,'update','Changed shift for employee PRISCILLAH VATA MULI payroll#:104016 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1685,'2025-08-10 15:26:32',5,'update','Changed shift for employee PURITY DHAHABU NGUA payroll#:103892 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1686,'2025-08-10 15:26:32',5,'update','Changed shift for employee PURITY HALUWA KADENGE payroll#:106648 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1687,'2025-08-10 15:26:32',5,'update','Changed shift for employee PURITY KALUMU PHILIP payroll#:100606 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1688,'2025-08-10 15:26:33',5,'update','Changed shift for employee PURITY KANINI KISILU payroll#:100798 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1689,'2025-08-10 15:26:33',5,'update','Changed shift for employee PURITY KIWASI MWASHIGHADI payroll#:101974 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1690,'2025-08-10 15:26:33',5,'update','Changed shift for employee PURITY MBETI MBUVI payroll#:102779 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1691,'2025-08-10 15:26:33',5,'update','Changed shift for employee PURITY MUMBE JUMA payroll#:102506 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1692,'2025-08-10 15:26:33',5,'update','Changed shift for employee PURITY MUTHEU MULWA payroll#:102705 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1693,'2025-08-10 15:26:33',5,'update','Changed shift for employee PURITY MUTIO MBUVI payroll#:101064 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1694,'2025-08-10 15:26:33',5,'update','Changed shift for employee PURITY MWIKALI MUTHU payroll#:101739 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1695,'2025-08-10 15:26:33',5,'update','Changed shift for employee PURITY NGIRA NDUMA payroll#:102394 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1696,'2025-08-10 15:26:33',5,'update','Changed shift for employee PURITY SYOMBUA KIMATU payroll#:103237 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1697,'2025-08-10 15:26:33',5,'update','Changed shift for employee PURITY UCHI CHARO payroll#:102804 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1698,'2025-08-10 15:26:33',5,'update','Changed shift for employee PURITY WANZA KITHEKA payroll#:105136 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1699,'2025-08-10 15:26:33',5,'update','Changed shift for employee QUEEN MUTHOKA  payroll#:104432 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1700,'2025-08-10 15:26:33',5,'update','Changed shift for employee QUEEN NYIVA MWANGANGI payroll#:104507 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1701,'2025-08-10 15:26:33',5,'update','Changed shift for employee QUINTER ATIENO OTIENO payroll#:100960 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1702,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHAEL KABIBI KENGA payroll#:102393 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1703,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHAEL KATUKU KYULE payroll#:107639 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1704,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHAEL KAWEE MUTUNGA payroll#:102328 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1705,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHAEL KUVUNA MADZUNGU payroll#:107879 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1706,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHAEL MBEYU NYAMAWI payroll#:102294 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1707,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHAEL MBONE  payroll#:100163 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1708,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHAEL MBULWA KAVITA payroll#:100611 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1709,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHAEL MUMBUA KIILU payroll#:100690 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1710,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHAEL MUPA MKOMBA payroll#:101749 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1711,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHAEL MUPA MUMBO payroll#:104413 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1712,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHAEL TABU KIOKO payroll#:103385 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1713,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHEAL NGANI MBEGA payroll#:102157 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1714,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHEAL NYEVU CHAKA payroll#:102699 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1715,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHEAL WANJALA  payroll#:102451 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1716,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHEL CHEBET  payroll#:100418 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1717,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHEL MWARI CHIMERA payroll#:102402 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1718,'2025-08-10 15:26:33',5,'update','Changed shift for employee RACHEL SHALI MWAILOGHO payroll#:100896 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1719,'2025-08-10 15:26:33',5,'update','Changed shift for employee RAEL KAVATA MUEMA payroll#:103053 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1720,'2025-08-10 15:26:33',5,'update','Changed shift for employee RAHAB MARY LUNDI payroll#:102992 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1721,'2025-08-10 15:26:33',5,'update','Changed shift for employee RAJAB JUMA CHENGO payroll#:100729 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1722,'2025-08-10 15:26:33',5,'update','Changed shift for employee RAJAB MZARAKWE KATSINYE payroll#:102872 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1723,'2025-08-10 15:26:33',5,'update','Changed shift for employee RAJABU MWARINGA LWAMBI payroll#:102886 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1724,'2025-08-10 15:26:33',5,'update','Changed shift for employee RAMLA HABIBA JILLO payroll#:101910 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1725,'2025-08-10 15:26:33',5,'update','Changed shift for employee RAPHAEL NDIYENYA WERE payroll#:104696 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1726,'2025-08-10 15:26:33',5,'update','Changed shift for employee RASHID MUKALA WANGA payroll#:102792 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1727,'2025-08-10 15:26:33',5,'update','Changed shift for employee REBECCA ANYANGO OJIAMBO payroll#:102980 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1728,'2025-08-10 15:26:33',5,'update','Changed shift for employee REBECCA EMMA BARASA payroll#:105694 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1729,'2025-08-10 15:26:33',5,'update','Changed shift for employee REBECCA KAMBUA MAKIO payroll#:107964 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1730,'2025-08-10 15:26:33',5,'update','Changed shift for employee REBECCA KARIMI NJAGI payroll#:102755 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1731,'2025-08-10 15:26:34',5,'update','Changed shift for employee REBECCA MORAA NYAMBATI payroll#:104429 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1732,'2025-08-10 15:26:34',5,'update','Changed shift for employee REBECCA MWENDE MUTUKU payroll#:100780 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1733,'2025-08-10 15:26:34',5,'update','Changed shift for employee REBECCA TABITHA MWANZIA payroll#:102287 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1734,'2025-08-10 15:26:34',5,'update','Changed shift for employee RECHEAL MUTHINI HARRISON payroll#:103236 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1735,'2025-08-10 15:26:34',5,'update','Changed shift for employee REDEMTA KAVUTHA MUTIA payroll#:101480 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1736,'2025-08-10 15:26:34',5,'update','Changed shift for employee REGINA KWEKWE TUNJE payroll#:103054 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1737,'2025-08-10 15:26:34',5,'update','Changed shift for employee REGINA MAPENZI KARISA payroll#:106027 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1738,'2025-08-10 15:26:34',5,'update','Changed shift for employee REGINA MINOO MUTAVA payroll#:103839 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1739,'2025-08-10 15:26:34',5,'update','Changed shift for employee REGINA NANGIRA ADEYA payroll#:101678 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1740,'2025-08-10 15:26:34',5,'update','Changed shift for employee REGINA WANZA MALUSI payroll#:105067 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1741,'2025-08-10 15:26:34',5,'update','Changed shift for employee REGINAH MWENDE MUTIE payroll#:107920 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1742,'2025-08-10 15:26:34',5,'update','Changed shift for employee REHEMA ACHIENG OBIERO payroll#:106026 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1743,'2025-08-10 15:26:34',5,'update','Changed shift for employee REHEMA CHIZI  payroll#:106019 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1744,'2025-08-10 15:26:34',5,'update','Changed shift for employee REHEMA KOMBO HASSAN payroll#:107768 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1745,'2025-08-10 15:26:34',5,'update','Changed shift for employee REHEMA LEWA  payroll#:103547 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1746,'2025-08-10 15:26:34',5,'update','Changed shift for employee REHEMA MWAKA RAMA payroll#:102801 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1747,'2025-08-10 15:26:34',5,'update','Changed shift for employee REHEMA NYAMVULA MARKENZIE payroll#:100931 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1748,'2025-08-10 15:26:34',5,'update','Changed shift for employee RHODA KAMBUA  payroll#:100110 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1749,'2025-08-10 15:26:34',5,'update','Changed shift for employee RHODA NDANU CHARLES payroll#:103485 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1750,'2025-08-10 15:26:34',5,'update','Changed shift for employee RHODAH NYADZUA RUAH payroll#:105158 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1751,'2025-08-10 15:26:34',5,'update','Changed shift for employee RISPER ADHIAMBO ODHIAMBO payroll#:102603 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1752,'2025-08-10 15:26:34',5,'update','Changed shift for employee RISPER BOSIBORI OKIOGA payroll#:101464 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1753,'2025-08-10 15:26:34',5,'update','Changed shift for employee RISPER RIZIKI MUTHUI payroll#:107649 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1754,'2025-08-10 15:26:34',5,'update','Changed shift for employee RITA JEPKOECH CHUMBA payroll#:102803 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1755,'2025-08-10 15:26:34',5,'update','Changed shift for employee RIZIKI CHITSAKA NDIRO payroll#:104701 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1756,'2025-08-10 15:26:34',5,'update','Changed shift for employee RIZIKI KWEKWE NZAKA payroll#:103516 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1757,'2025-08-10 15:26:34',5,'update','Changed shift for employee RIZIKI MOHAMED MUTISYA payroll#:103479 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1758,'2025-08-10 15:26:34',5,'update','Changed shift for employee RIZIKI MYAZI MWERO payroll#:102487 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1759,'2025-08-10 15:26:34',5,'update','Changed shift for employee ROBERT MOGWASI OTIENO payroll#:103726 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1760,'2025-08-10 15:26:34',5,'update','Changed shift for employee ROBERT MUTINDA KITHEKA payroll#:100448 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1761,'2025-08-10 15:26:34',5,'update','Changed shift for employee ROBERT MUTUKU KAVULI payroll#:102776 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1762,'2025-08-10 15:26:34',5,'update','Changed shift for employee ROBERT WAMBUA KIMATU payroll#:100784 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1763,'2025-08-10 15:26:34',5,'update','Changed shift for employee ROBIN JUMA ODHIAMBO payroll#:107439 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1764,'2025-08-10 15:26:34',5,'update','Changed shift for employee RODA WANJIKA MUTHUI payroll#:100306 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1765,'2025-08-10 15:26:35',5,'update','Changed shift for employee RODGERS OWUORI EKESA payroll#:104563 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1766,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROMEL MUKOLWE OKELLO payroll#:105215 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1767,'2025-08-10 15:26:35',5,'update','Changed shift for employee RONALD SIMIYU  payroll#:107723 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1768,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSA ALEWA NUNGO payroll#:102238 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1769,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE ANYANGO ODUWO payroll#:102943 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1770,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE AOKO OMOTH payroll#:105689 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1771,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE AUMA OPIYO payroll#:100847 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1772,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE KALUKU  payroll#:102432 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1773,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE KATINDI JOHN payroll#:102330 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1774,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE KOKI NYERERE payroll#:104273 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1775,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE MARTHA NYAMAI payroll#:102762 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1776,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE MARURA MWANYEMBO payroll#:101675 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1777,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE MATUKU KOLI payroll#:107508 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1778,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE MUSENYA NZOMO payroll#:102503 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1779,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE MUSENYA SAMMY payroll#:100124 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1780,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE MUSYOKA  payroll#:105944 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1781,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE MWONGELI KIOKO payroll#:100504 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1782,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE NAFULA MAKHANU payroll#:107767 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1783,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE NAFUNA WEKESA payroll#:102152 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1784,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE NDINDA MUEMA payroll#:100394 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1785,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSE NDINDA MUTUNGA payroll#:100923 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1786,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSELYNE ADHIAMBO ODHIAMBO payroll#:105685 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1787,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSELYNE ANYANZWA OCHIENG payroll#:103035 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1788,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSELYNE MBUTHI MARTIN payroll#:107813 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1789,'2025-08-10 15:26:35',5,'update','Changed shift for employee ROSEMARY AKINYI WERE payroll#:100284 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1790,'2025-08-10 15:26:35',5,'update','Changed shift for employee RUFENCE KORI MWIKAMBA payroll#:106382 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1791,'2025-08-10 15:26:35',5,'update','Changed shift for employee RUKIA KADZO GONA payroll#:104150 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1792,'2025-08-10 15:26:35',5,'update','Changed shift for employee RUKIA KIDOSHO STEPHEN payroll#:101976 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1793,'2025-08-10 15:26:35',5,'update','Changed shift for employee RUKIA MNYAZI SAMUEL payroll#:102490 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1794,'2025-08-10 15:26:35',5,'update','Changed shift for employee RUTH KAHONZI MBITHA payroll#:100227 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1795,'2025-08-10 15:26:35',5,'update','Changed shift for employee RUTH KALUMU JOSPHAT payroll#:107602 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1796,'2025-08-10 15:26:35',5,'update','Changed shift for employee RUTH KAMANTHE PAUL payroll#:105947 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1797,'2025-08-10 15:26:35',5,'update','Changed shift for employee RUTH KATHINA MUSYOKA payroll#:100925 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1798,'2025-08-10 15:26:35',5,'update','Changed shift for employee RUTH KATHINI MUIA payroll#:105940 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1799,'2025-08-10 15:26:35',5,'update','Changed shift for employee RUTH MANGA  payroll#:107679 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1800,'2025-08-10 15:26:35',5,'update','Changed shift for employee RUTH MUE  payroll#:107719 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1801,'2025-08-10 15:26:35',5,'update','Changed shift for employee RUTH MUKAI MUEMA payroll#:107694 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1802,'2025-08-10 15:26:35',5,'update','Changed shift for employee RUTH MUSENYA MBUVI payroll#:105190 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1803,'2025-08-10 15:26:36',5,'update','Changed shift for employee RUTH MUTAMU MUEMA payroll#:101300 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1804,'2025-08-10 15:26:36',5,'update','Changed shift for employee RUTH MUTHONI MUNUVE payroll#:102012 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1805,'2025-08-10 15:26:36',5,'update','Changed shift for employee RUTH MWELU MBONDO payroll#:107604 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1806,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAFARI JOHN CHARO payroll#:103953 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1807,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAGERO LYDIA NYANCHERA payroll#:103235 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1808,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAGINA KHAYUMBI MULINDO payroll#:103821 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1809,'2025-08-10 15:26:36',5,'update','Changed shift for employee SALAMA DZUYA CHIRINGA payroll#:102133 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1810,'2025-08-10 15:26:36',5,'update','Changed shift for employee SALLY  ATICHI payroll#:102508 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1811,'2025-08-10 15:26:36',5,'update','Changed shift for employee SALMA KARISA KAZUNGU payroll#:102636 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1812,'2025-08-10 15:26:36',5,'update','Changed shift for employee SALMON BABU MALOBA payroll#:105774 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1813,'2025-08-10 15:26:36',5,'update','Changed shift for employee SALOME KACHE MWACHENGO payroll#:104433 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1814,'2025-08-10 15:26:36',5,'update','Changed shift for employee SALOME MNYAZI SAHA payroll#:107699 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1815,'2025-08-10 15:26:36',5,'update','Changed shift for employee SALOME MWIKALI MBWIKA payroll#:103150 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1816,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAMMY JOHN  payroll#:103834 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1817,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAMSON KARAGU GICHANA payroll#:105291 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1818,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAMSON MBELESIA MBALILWA payroll#:100313 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1819,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAMUEL ELISHA AMOI payroll#:105214 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1820,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAMUEL KOSGEI KEMBOI payroll#:102709 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1821,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAMUEL MKARE KAINGU payroll#:107479 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1822,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAMWEL OYAGI MIGOSI payroll#:103026 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1823,'2025-08-10 15:26:36',5,'update','Changed shift for employee SARAH KAREMU KITHINJI payroll#:106372 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1824,'2025-08-10 15:26:36',5,'update','Changed shift for employee SARAH MORAA MOGAKA payroll#:106375 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1825,'2025-08-10 15:26:36',5,'update','Changed shift for employee SARAH MWENDE JONATHAN payroll#:100140 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1826,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAUMU ANZAZI MWINGA payroll#:103408 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1827,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAUMU CHIZI JUMA payroll#:108105 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1828,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAUMU KABIBI JUMA payroll#:107258 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1829,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAUMU LUVUNO YAWA payroll#:103913 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1830,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAUMU MLONGO YOYO payroll#:100777 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1831,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAUMU MNYAZI CHIRINGA payroll#:100141 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1832,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAUMU NJIRA JUMAPILI payroll#:103548 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1833,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAUMU NYAMVULA NYUNDO payroll#:104116 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1834,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAUMU OMAR JUMA payroll#:103861 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1835,'2025-08-10 15:26:36',5,'update','Changed shift for employee SAUMU UMAZI MWAUCHI payroll#:104310 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1836,'2025-08-10 15:26:36',5,'update','Changed shift for employee SCARLET MEDZA TSAKA payroll#:102863 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1837,'2025-08-10 15:26:37',5,'update','Changed shift for employee SCHOLA MWONGELI MUTHENGI payroll#:107622 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1838,'2025-08-10 15:26:37',5,'update','Changed shift for employee SCHOLAR BEVERLINE OLOO payroll#:104792 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1839,'2025-08-10 15:26:37',5,'update','Changed shift for employee SCHOLAR NEEMA MWAGONA payroll#:103946 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1840,'2025-08-10 15:26:37',5,'update','Changed shift for employee SCOLASTICAH MUENI MUTUNGA payroll#:107995 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1841,'2025-08-10 15:26:37',5,'update','Changed shift for employee SELESTINE AKINYI OWINO payroll#:101683 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1842,'2025-08-10 15:26:37',5,'update','Changed shift for employee SELESTINE AUMA OBONYO payroll#:103804 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1843,'2025-08-10 15:26:37',5,'update','Changed shift for employee SELFINE EUNICE OTIENO payroll#:107705 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1844,'2025-08-10 15:26:37',5,'update','Changed shift for employee SELIA AUMA WANJALA payroll#:102232 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1845,'2025-08-10 15:26:37',5,'update','Changed shift for employee SELINA GUNGA BAYA payroll#:107878 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1846,'2025-08-10 15:26:37',5,'update','Changed shift for employee SELINA MWEMBAVALA  payroll#:103955 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1847,'2025-08-10 15:26:37',5,'update','Changed shift for employee SELINA SIDI MWADENA payroll#:103338 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1848,'2025-08-10 15:26:37',5,'update','Changed shift for employee SELLAH MUYAKU WAMALWA payroll#:104384 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1849,'2025-08-10 15:26:37',5,'update','Changed shift for employee SELLAN TERESA AMBAISI payroll#:102748 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1850,'2025-08-10 15:26:37',5,'update','Changed shift for employee SELLINA NEEMA KAHINDI payroll#:104195 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1851,'2025-08-10 15:26:37',5,'update','Changed shift for employee SELLINE ACHIENG WERE payroll#:103643 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1852,'2025-08-10 15:26:37',5,'update','Changed shift for employee SELPHA AUMA OJIAMBO payroll#:102199 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1853,'2025-08-10 15:26:37',5,'update','Changed shift for employee SERA FRANCIS KIMENJU payroll#:103450 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1854,'2025-08-10 15:26:37',5,'update','Changed shift for employee SERAH MUENI ISAAC payroll#:102940 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1855,'2025-08-10 15:26:37',5,'update','Changed shift for employee SERAH NDINDA MUTHAMA payroll#:101730 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1856,'2025-08-10 15:26:37',5,'update','Changed shift for employee SERAH NGENESI SINGI payroll#:102939 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1857,'2025-08-10 15:26:37',5,'update','Changed shift for employee SERAPHINE KHAMUSALI SHIKAL payroll#:100077 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1858,'2025-08-10 15:26:37',5,'update','Changed shift for employee SETH MAHORO NGOMA payroll#:103650 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1859,'2025-08-10 15:26:37',5,'update','Changed shift for employee SHADRACK MUTHUI MUNANIE payroll#:107742 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1860,'2025-08-10 15:26:37',5,'update','Changed shift for employee SHADRACK MUTHUSI MUSILI payroll#:102938 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1861,'2025-08-10 15:26:37',5,'update','Changed shift for employee SHALET SALAME MWACHIRO payroll#:104041 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1862,'2025-08-10 15:26:37',5,'update','Changed shift for employee SHANICE ACHIENG  payroll#:107646 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1863,'2025-08-10 15:26:37',5,'update','Changed shift for employee SHARLET DAMAM TUVA payroll#:104086 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1864,'2025-08-10 15:26:37',5,'update','Changed shift for employee SHARLET MWAKA MWIJAHA payroll#:104175 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1865,'2025-08-10 15:26:37',5,'update','Changed shift for employee SHARON ADHIAMBO OPONDO payroll#:104128 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1866,'2025-08-10 15:26:37',5,'update','Changed shift for employee SHARON ATIENO  payroll#:103898 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1867,'2025-08-10 15:26:37',5,'update','Changed shift for employee SHARON CHIZI BEDZOKA payroll#:103640 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1868,'2025-08-10 15:26:37',5,'update','Changed shift for employee SHARON KALUNDE MEKI payroll#:102710 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1869,'2025-08-10 15:26:37',5,'update','Changed shift for employee SHARON MBINYA JOSEPH payroll#:100997 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1870,'2025-08-10 15:26:37',5,'update','Changed shift for employee SHARON MUTUNE FRANCIS payroll#:107682 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1871,'2025-08-10 15:26:38',5,'update','Changed shift for employee SHARON SHIVAKALI SHIVISI payroll#:100751 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1872,'2025-08-10 15:26:38',5,'update','Changed shift for employee SHARON TARMA KALUNDA payroll#:100897 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1873,'2025-08-10 15:26:38',5,'update','Changed shift for employee SHEILA CHEPKEMOI  payroll#:104088 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1874,'2025-08-10 15:26:38',5,'update','Changed shift for employee SHEILA WANGUI MWANIKI payroll#:103954 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1875,'2025-08-10 15:26:38',5,'update','Changed shift for employee SHEILAH NGINA MUTUNGA payroll#:102193 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1876,'2025-08-10 15:26:38',5,'update','Changed shift for employee SHEILLAH JELIMO  payroll#:100406 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1877,'2025-08-10 15:26:38',5,'update','Changed shift for employee SHEILLAH NASIMIYU BARASA payroll#:102335 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1878,'2025-08-10 15:26:38',5,'update','Changed shift for employee SHYREEN KATHINI NGALA payroll#:100454 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1879,'2025-08-10 15:26:38',5,'update','Changed shift for employee SIMON GAIGA ODALI payroll#:100607 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1880,'2025-08-10 15:26:38',5,'update','Changed shift for employee SIMON KITHEKA  payroll#:102760 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1881,'2025-08-10 15:26:38',5,'update','Changed shift for employee SLIVIA MOIGE SAMUSI payroll#:104328 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1882,'2025-08-10 15:26:38',5,'update','Changed shift for employee SNAIDA NAMBAKHA SIMEKHA payroll#:107601 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1883,'2025-08-10 15:26:38',5,'update','Changed shift for employee SOFIA MBAJI MBAITA payroll#:100113 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1884,'2025-08-10 15:26:38',5,'update','Changed shift for employee SOPHIA AWUOR ONYANGO payroll#:104014 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1885,'2025-08-10 15:26:38',5,'update','Changed shift for employee SPINICHA MAGACHI NYATWONGI payroll#:104829 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1886,'2025-08-10 15:26:38',5,'update','Changed shift for employee STACY NICE JOHN payroll#:107490 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1887,'2025-08-10 15:26:38',5,'update','Changed shift for employee STANELY SAKAYO TITUS payroll#:102231 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1888,'2025-08-10 15:26:38',5,'update','Changed shift for employee STANLEY MATATA MUSANGO payroll#:106642 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1889,'2025-08-10 15:26:38',5,'update','Changed shift for employee STEFFY AWUOR OUNGA payroll#:104786 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1890,'2025-08-10 15:26:38',5,'update','Changed shift for employee STELLA MALEMBA SERENGE payroll#:107923 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1891,'2025-08-10 15:26:38',5,'update','Changed shift for employee STELLA TABU MWACHIA payroll#:100149 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1892,'2025-08-10 15:26:38',5,'update','Changed shift for employee STELLAH KALUKI JOHN payroll#:103896 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1893,'2025-08-10 15:26:38',5,'update','Changed shift for employee STELLAMARIES NZILANI MUTUK payroll#:101398 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1894,'2025-08-10 15:26:38',5,'update','Changed shift for employee STELLAMATIES ANYANGO  payroll#:103062 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1895,'2025-08-10 15:26:38',5,'update','Changed shift for employee STEPHEN KOMBO MWALIMU payroll#:100213 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1896,'2025-08-10 15:26:38',5,'update','Changed shift for employee STEPHEN LUNGU SAMUEL payroll#:103558 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1897,'2025-08-10 15:26:38',5,'update','Changed shift for employee STEPHEN MUENDO SOLOMON payroll#:104965 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1898,'2025-08-10 15:26:38',5,'update','Changed shift for employee STEPHEN MUTUNE MULI payroll#:100176 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1899,'2025-08-10 15:26:38',5,'update','Changed shift for employee STEPHEN NJUGUNA  payroll#:104794 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1900,'2025-08-10 15:26:38',5,'update','Changed shift for employee STEVEN SAWANDA ONYANGO payroll#:106643 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1901,'2025-08-10 15:26:38',5,'update','Changed shift for employee SULEIMAN CHIKURO MBAJI payroll#:108106 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1902,'2025-08-10 15:26:38',5,'update','Changed shift for employee SURESH RAMAMOORTHY  payroll#:103130 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1903,'2025-08-10 15:26:38',5,'update','Changed shift for employee SUSAN AWINO ANYANGO payroll#:102412 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1904,'2025-08-10 15:26:38',5,'update','Changed shift for employee SUSAN CHERUBET  CHAMANGARE payroll#:107678 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1905,'2025-08-10 15:26:38',5,'update','Changed shift for employee SUSAN KANINI MUMO payroll#:104281 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1906,'2025-08-10 15:26:39',5,'update','Changed shift for employee SUSAN KAUNDA  payroll#:104573 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1907,'2025-08-10 15:26:39',5,'update','Changed shift for employee SUSAN KAVITHE KIOKO payroll#:102399 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1908,'2025-08-10 15:26:39',5,'update','Changed shift for employee SUSAN KENDI MUTHEE payroll#:102261 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1909,'2025-08-10 15:26:39',5,'update','Changed shift for employee SUSAN KINA KITURI payroll#:101593 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1910,'2025-08-10 15:26:39',5,'update','Changed shift for employee SUSAN MASIKA BONDORA payroll#:107710 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1911,'2025-08-10 15:26:39',5,'update','Changed shift for employee SUSAN MUSANGI MWENDWA payroll#:103968 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1912,'2025-08-10 15:26:39',5,'update','Changed shift for employee SUSAN MUTHEU KITOME payroll#:103798 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1913,'2025-08-10 15:26:39',5,'update','Changed shift for employee SUSAN MUTHONI NGUGI payroll#:100613 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1914,'2025-08-10 15:26:39',5,'update','Changed shift for employee SUSAN NALIAKA MASIKA payroll#:104440 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1915,'2025-08-10 15:26:39',5,'update','Changed shift for employee SUSAN NAMARUME NYONGESA payroll#:101883 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1916,'2025-08-10 15:26:39',5,'update','Changed shift for employee SUSAN NJOKI JULIA payroll#:100462 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1917,'2025-08-10 15:26:39',5,'update','Changed shift for employee SUSAN NYANGASY KWATEMBA payroll#:102331 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1918,'2025-08-10 15:26:39',5,'update','Changed shift for employee SUSAN NZILANI MUSYOKI payroll#:107629 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1919,'2025-08-10 15:26:39',5,'update','Changed shift for employee SUSAN RUTH MUNYOKI payroll#:100226 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1920,'2025-08-10 15:26:39',5,'update','Changed shift for employee SWALEH SAID KAHINDI payroll#:103442 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1921,'2025-08-10 15:26:39',5,'update','Changed shift for employee SYLVESTER MUTATI MUTHENGI payroll#:107543 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1922,'2025-08-10 15:26:39',5,'update','Changed shift for employee SYLVIA MUOTI MUSIA payroll#:102475 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1923,'2025-08-10 15:26:39',5,'update','Changed shift for employee SYLVIA NEKESA KEFA payroll#:102344 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1924,'2025-08-10 15:26:39',5,'update','Changed shift for employee SYLVIA NGELIMA KUNDU payroll#:102204 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1925,'2025-08-10 15:26:39',5,'update','Changed shift for employee SYLVIA UCHI TUNJE payroll#:104242 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1926,'2025-08-10 15:26:39',5,'update','Changed shift for employee SYONTHI KITONGA  payroll#:101210 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1927,'2025-08-10 15:26:39',5,'update','Changed shift for employee TAABU NDENGE  payroll#:102351 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1928,'2025-08-10 15:26:39',5,'update','Changed shift for employee TABITHA MAJUMA OBUYA payroll#:102205 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1929,'2025-08-10 15:26:39',5,'update','Changed shift for employee TABITHA MUTANU PETER payroll#:102593 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1930,'2025-08-10 15:26:39',5,'update','Changed shift for employee TABITHA NGAYAU NTHOKI payroll#:101907 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1931,'2025-08-10 15:26:39',5,'update','Changed shift for employee TABITHA NTHENYA MUTUA payroll#:107650 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1932,'2025-08-10 15:26:39',5,'update','Changed shift for employee TABITHA SYOKAU KISOVE payroll#:100383 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1933,'2025-08-10 15:26:39',5,'update','Changed shift for employee TABITHA WAMBOI GITAU payroll#:103637 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1934,'2025-08-10 15:26:39',5,'update','Changed shift for employee TARANCILA MGHOI MJOMBA payroll#:100463 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1935,'2025-08-10 15:26:39',5,'update','Changed shift for employee TATU NYEVU KEA payroll#:103561 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1936,'2025-08-10 15:26:39',5,'update','Changed shift for employee TATU NZEMERI KOBE payroll#:104307 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1937,'2025-08-10 15:26:39',5,'update','Changed shift for employee TECLA SANITA NGALA payroll#:103858 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1938,'2025-08-10 15:26:39',5,'update','Changed shift for employee TELESIA NZUKI  payroll#:107681 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1939,'2025-08-10 15:26:39',5,'update','Changed shift for employee TERESA ATIENO OMONDI payroll#:101881 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1940,'2025-08-10 15:26:39',5,'update','Changed shift for employee TERESA KAVIVI KAUNDA payroll#:103094 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1941,'2025-08-10 15:26:39',5,'update','Changed shift for employee TERESA SHILAKO MILIMU payroll#:103563 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1942,'2025-08-10 15:26:40',5,'update','Changed shift for employee TERESIA KARONDU MALUSI payroll#:104529 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1943,'2025-08-10 15:26:40',5,'update','Changed shift for employee TERESIA MBISHI  payroll#:100409 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1944,'2025-08-10 15:26:40',5,'update','Changed shift for employee TERESIA MUTHINI THOMAS payroll#:104523 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1945,'2025-08-10 15:26:40',5,'update','Changed shift for employee TERESIA MWANGANGI  payroll#:102103 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1946,'2025-08-10 15:26:40',5,'update','Changed shift for employee TEREZI WAKESHO DALI payroll#:105149 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1947,'2025-08-10 15:26:40',5,'update','Changed shift for employee THOMAS MUTINDA KIOKO payroll#:103564 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1948,'2025-08-10 15:26:40',5,'update','Changed shift for employee THOMAS MWADIME MGHANA payroll#:106198 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1949,'2025-08-10 15:26:40',5,'update','Changed shift for employee THOMAS OKUMU MUPIRA payroll#:103796 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1950,'2025-08-10 15:26:40',5,'update','Changed shift for employee TIMOTHY MULUPI KHAYISIE payroll#:105480 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1951,'2025-08-10 15:26:40',5,'update','Changed shift for employee TINAH BRENDA WAKIO payroll#:102770 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1952,'2025-08-10 15:26:40',5,'update','Changed shift for employee TONNY MACHANGA WANJALA payroll#:107571 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1953,'2025-08-10 15:26:40',5,'update','Changed shift for employee TREEZER ATIENO OUMA payroll#:104589 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1954,'2025-08-10 15:26:40',5,'update','Changed shift for employee TREVOR OTIENO JUMA payroll#:104963 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1955,'2025-08-10 15:26:40',5,'update','Changed shift for employee TREZA EMILY RAELI payroll#:100233 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1956,'2025-08-10 15:26:40',5,'update','Changed shift for employee TRUPENAH KEMUTNO  payroll#:103845 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1957,'2025-08-10 15:26:40',5,'update','Changed shift for employee TRUPHOSER AMBUNDO  payroll#:103109 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1958,'2025-08-10 15:26:40',5,'update','Changed shift for employee TSUMA BORA CHIBENDO payroll#:100837 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1959,'2025-08-10 15:26:40',5,'update','Changed shift for employee TURUPHENAH KEMUNTO MARIAKA payroll#:107598 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1960,'2025-08-10 15:26:40',5,'update','Changed shift for employee UMAZI MWANGOME MAZERA payroll#:103832 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1961,'2025-08-10 15:26:40',5,'update','Changed shift for employee VAATI MUTHUI  payroll#:100796 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1962,'2025-08-10 15:26:40',5,'update','Changed shift for employee VAILET KAISHA MUHONJA payroll#:107808 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1963,'2025-08-10 15:26:40',5,'update','Changed shift for employee VALENTINE TETE ANGOTE payroll#:100506 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1964,'2025-08-10 15:26:40',5,'update','Changed shift for employee VANE MWANGO OMAGWA payroll#:104152 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1965,'2025-08-10 15:26:40',5,'update','Changed shift for employee VANE NYABIAGE NYAATA payroll#:107717 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1966,'2025-08-10 15:26:40',5,'update','Changed shift for employee VANE NYAMBOGO ONDIEKI payroll#:107544 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1967,'2025-08-10 15:26:40',5,'update','Changed shift for employee VELENTINAH KIWASI CHAO payroll#:100137 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1968,'2025-08-10 15:26:40',5,'update','Changed shift for employee VELENTINAH SHALI SANGE payroll#:102750 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1969,'2025-08-10 15:26:40',5,'update','Changed shift for employee VENESA MWONGELI NDUNDA payroll#:107680 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1970,'2025-08-10 15:26:40',5,'update','Changed shift for employee VENTRIX SENDRA  payroll#:104329 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1971,'2025-08-10 15:26:40',5,'update','Changed shift for employee VERAH NYABONYI NYAKORA payroll#:101880 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1972,'2025-08-10 15:26:40',5,'update','Changed shift for employee VERONICA ACHIENG OTIENO payroll#:106020 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1973,'2025-08-10 15:26:40',5,'update','Changed shift for employee VERONICA KALEE AGNES payroll#:102995 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1974,'2025-08-10 15:26:40',5,'update','Changed shift for employee VERONICA MWIKALI MUTUA payroll#:100495 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1975,'2025-08-10 15:26:40',5,'update','Changed shift for employee VERONICA NALIAKA LUBISIA payroll#:107994 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1976,'2025-08-10 15:26:40',5,'update','Changed shift for employee VERONICA SYOKAU MUTISYA payroll#:102581 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1977,'2025-08-10 15:26:40',5,'update','Changed shift for employee VERONICAH MINOO MBITHI payroll#:106373 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1978,'2025-08-10 15:26:40',5,'update','Changed shift for employee VERONICAH WANDII MUNYAMBU payroll#:104784 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1979,'2025-08-10 15:26:41',5,'update','Changed shift for employee VIATA KAMAU  payroll#:104019 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1980,'2025-08-10 15:26:41',5,'update','Changed shift for employee VICKY ACHIENG MIRUKA payroll#:107542 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1981,'2025-08-10 15:26:41',5,'update','Changed shift for employee VICTOR AMWATA BIRIKA payroll#:103729 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1982,'2025-08-10 15:26:41',5,'update','Changed shift for employee VICTOR BARASA JUMA payroll#:100195 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1983,'2025-08-10 15:26:41',5,'update','Changed shift for employee VICTOR MKALA DENA payroll#:103025 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1984,'2025-08-10 15:26:41',5,'update','Changed shift for employee VICTOR ONYANGO JUMA payroll#:103137 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1985,'2025-08-10 15:26:41',5,'update','Changed shift for employee VICTORIA AKINYI ONYANGO payroll#:100972 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1986,'2025-08-10 15:26:41',5,'update','Changed shift for employee VICTORIA KASYOKA MWANGANGI payroll#:103078 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1987,'2025-08-10 15:26:41',5,'update','Changed shift for employee VICTORIA NAITI BARASA payroll#:103049 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1988,'2025-08-10 15:26:41',5,'update','Changed shift for employee VIDELLIUS ATIENO AKELLO payroll#:107910 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1989,'2025-08-10 15:26:41',5,'update','Changed shift for employee VIGINIA TABITHA MUNYAO payroll#:104118 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1990,'2025-08-10 15:26:41',5,'update','Changed shift for employee VILITA MWONGELA  payroll#:102207 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1991,'2025-08-10 15:26:41',5,'update','Changed shift for employee VIOLET ANYERA WERE payroll#:102222 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1992,'2025-08-10 15:26:41',5,'update','Changed shift for employee VIOLET ASIKO MEBERO payroll#:107638 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1993,'2025-08-10 15:26:41',5,'update','Changed shift for employee VIOLET AWUOR OCHIENG payroll#:103996 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1994,'2025-08-10 15:26:41',5,'update','Changed shift for employee VIOLET KIGASHA NGONDA payroll#:105089 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1995,'2025-08-10 15:26:41',5,'update','Changed shift for employee VIRGINIA KANINI MWIKALI payroll#:104039 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1996,'2025-08-10 15:26:41',5,'update','Changed shift for employee VIRGINIA MONICAH CHARLES payroll#:101407 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1997,'2025-08-10 15:26:41',5,'update','Changed shift for employee VIRGINIA NZAMU MUSYOKA payroll#:103047 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1998,'2025-08-10 15:26:41',5,'update','Changed shift for employee VIRGINIA WANZA PATRICK payroll#:107706 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(1999,'2025-08-10 15:26:41',5,'update','Changed shift for employee VIVIAN ATIENO YONGO payroll#:103875 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2000,'2025-08-10 15:26:41',5,'update','Changed shift for employee VIVIAN JONATHAN  payroll#:102210 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2001,'2025-08-10 15:26:41',5,'update','Changed shift for employee WAMBUA NDUA  payroll#:100290 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2002,'2025-08-10 15:26:41',5,'update','Changed shift for employee WAMBUI  KAVITI payroll#:103817 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2003,'2025-08-10 15:26:41',5,'update','Changed shift for employee WAMBUI NZEKI  payroll#:102010 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2004,'2025-08-10 15:26:41',5,'update','Changed shift for employee WANZA NZIVI  payroll#:101986 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2005,'2025-08-10 15:26:41',5,'update','Changed shift for employee WAYUA MUTUKU  payroll#:105705 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2006,'2025-08-10 15:26:41',5,'update','Changed shift for employee WENDI AKINYI NYAMATA payroll#:104083 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2007,'2025-08-10 15:26:41',5,'update','Changed shift for employee WHITNEY NTINYARI  payroll#:107704 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2008,'2025-08-10 15:26:41',5,'update','Changed shift for employee WILBRODA AUMA ODUOR payroll#:105696 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2009,'2025-08-10 15:26:41',5,'update','Changed shift for employee WILFRIDA AUMA OMBOKO payroll#:100295 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2010,'2025-08-10 15:26:41',5,'update','Changed shift for employee WILLIAM ABONG OGOT payroll#:107790 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2011,'2025-08-10 15:26:41',5,'update','Changed shift for employee WILLIAM FRANKLIN SAVARI payroll#:100812 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2012,'2025-08-10 15:26:41',5,'update','Changed shift for employee WILLIAM MWANYENGELA MWACHI payroll#:102073 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2013,'2025-08-10 15:26:42',5,'update','Changed shift for employee WINFRED KASYOKA JOHN payroll#:106402 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2014,'2025-08-10 15:26:42',5,'update','Changed shift for employee WINFRED SYOVATA MWANZI payroll#:100147 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2015,'2025-08-10 15:26:42',5,'update','Changed shift for employee WINFRIDA KERUBO ISABOKE payroll#:103910 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2016,'2025-08-10 15:26:42',5,'update','Changed shift for employee WINNIE AKOTH OKOTH payroll#:102452 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2017,'2025-08-10 15:26:42',5,'update','Changed shift for employee WINNIE AUMA MAHERO payroll#:104902 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2018,'2025-08-10 15:26:42',5,'update','Changed shift for employee WINNIE AWUOR OMONDI payroll#:100470 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2019,'2025-08-10 15:26:42',5,'update','Changed shift for employee WINNIE NABWIRE OPAYE payroll#:106046 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2020,'2025-08-10 15:26:42',5,'update','Changed shift for employee WINNIE NDUKU MUTUA payroll#:104590 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2021,'2025-08-10 15:26:42',5,'update','Changed shift for employee WINNIE WANJIKU NJERI payroll#:102220 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2022,'2025-08-10 15:26:42',5,'update','Changed shift for employee WINNY APONDI OUMA payroll#:104453 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2023,'2025-08-10 15:26:42',5,'update','Changed shift for employee WINROSE NALIAKA WACHIYE payroll#:103482 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2024,'2025-08-10 15:26:42',5,'update','Changed shift for employee WYCLIFFE ONDARI NYANGWONO payroll#:103138 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2025,'2025-08-10 15:26:42',5,'update','Changed shift for employee YARO BOSIBORI STELLAH payroll#:102034 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2026,'2025-08-10 15:26:42',5,'update','Changed shift for employee YUSRA NYAMAI  payroll#:101882 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2027,'2025-08-10 15:26:42',5,'update','Changed shift for employee YUSUF MUTAI MBEVI payroll#:107554 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2028,'2025-08-10 15:26:42',5,'update','Changed shift for employee YVONNE KAMENE KAKU payroll#:101928 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2029,'2025-08-10 15:26:42',5,'update','Changed shift for employee ZACHARIA KIAMBA NZUKI payroll#:101724 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2030,'2025-08-10 15:26:42',5,'update','Changed shift for employee ZAWADI JUMA KITILI payroll#:106043 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2031,'2025-08-10 15:26:42',5,'update','Changed shift for employee ZAWADI KARISA MWAKOMBE payroll#:105700 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2032,'2025-08-10 15:26:42',5,'update','Changed shift for employee ZAWADI NYAMVULA MWAMBAO payroll#:107515 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2033,'2025-08-10 15:26:42',5,'update','Changed shift for employee ZEINAB SULEIMAN  payroll#:104270 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2034,'2025-08-10 15:26:42',5,'update','Changed shift for employee ZIPPORAH DIANA NZOMO payroll#:104670 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2035,'2025-08-10 15:26:42',5,'update','Changed shift for employee ZIPPORAH KADOGO DAVID payroll#:106042 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2036,'2025-08-10 15:26:42',5,'update','Changed shift for employee ZIPPORAH KWAMBOKA ZEBEDEO payroll#:107605 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2037,'2025-08-10 15:26:42',5,'update','Changed shift for employee ZIPPORAH MUSILI  payroll#:101686 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2038,'2025-08-10 15:26:42',5,'update','Changed shift for employee ZIPPORAH MUTHONI WAMBUI payroll#:103499 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2039,'2025-08-10 15:26:42',5,'update','Changed shift for employee ZIPPORAH MWIKALI KIVUVA payroll#:100232 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2040,'2025-08-10 15:26:42',5,'update','Changed shift for employee ZUBEDA KASIMU NZIWI payroll#:103725 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2041,'2025-08-10 15:26:42',5,'update','Changed shift for employee ZULEKHA RAJAB SALIM payroll#:104698 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2042,'2025-08-10 15:26:42',5,'update','Changed shift for employee ZULPHA CHARI HASSAN payroll#:106024 to Normal Day Shift','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2043,'2025-08-11 18:08:28',5,'insert','Created leave application  id:19 for Employee Id: 1325 Staff #: 100182 Names: ABEDNEGO KILELE MAKAU Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2044,'2025-08-11 18:08:28',5,'insert','Approved leave application of leave, id 19 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2045,'2025-08-11 18:08:28',5,'insert','Approved leave application of leave, id 19 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2046,'2025-08-11 18:08:28',5,'insert','Approved leave application of leave, id 19 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2047,'2025-08-11 18:08:28',5,'insert','Created leave application  id:20 for Employee Id: 2019 Staff #: 104153 Names: AGNES NGUI  Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2048,'2025-08-11 18:08:28',5,'insert','Approved leave application of leave, id 20 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2049,'2025-08-11 18:08:28',5,'insert','Approved leave application of leave, id 20 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2050,'2025-08-11 18:08:28',5,'insert','Approved leave application of leave, id 20 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2051,'2025-08-11 18:13:34',5,'insert','Created leave application  id:21 for Employee Id: 1325 Staff #: 100182 Names: ABEDNEGO KILELE MAKAU Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2052,'2025-08-11 18:13:34',5,'insert','Approved leave application of leave, id 21 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2053,'2025-08-11 18:13:34',5,'insert','Approved leave application of leave, id 21 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2054,'2025-08-11 18:13:34',5,'insert','Approved leave application of leave, id 21 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2055,'2025-08-11 18:13:34',5,'insert','Created leave application  id:22 for Employee Id: 2019 Staff #: 104153 Names: AGNES NGUI  Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2056,'2025-08-11 18:13:34',5,'insert','Approved leave application of leave, id 22 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2057,'2025-08-11 18:13:34',5,'insert','Approved leave application of leave, id 22 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2058,'2025-08-11 18:13:34',5,'insert','Approved leave application of leave, id 22 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2061,'2025-08-11 18:22:11',5,'insert','Created leave application  id:25 for Employee Id: 6011 Staff #: 107579 Names: ABDALLA MWANDORO KAIDZA Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2062,'2025-08-11 18:31:30',5,'insert','Created leave application  id:26 for Employee Id: 6011 Staff #: 107579 Names: ABDALLA MWANDORO KAIDZA Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2063,'2025-08-11 18:31:30',5,'insert','Approved leave application of leave, id 26 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2064,'2025-08-11 18:31:31',5,'insert','Approved leave application of leave, id 26 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2065,'2025-08-11 18:31:31',5,'insert','Approved leave application of leave, id 26 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2066,'2025-08-11 18:31:31',5,'insert','Created leave application  id:27 for Employee Id: 6199 Staff #: 107787 Names: AGNES KALENDI MAINGI Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2067,'2025-08-11 18:31:31',5,'insert','Approved leave application of leave, id 27 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2068,'2025-08-11 18:31:31',5,'insert','Approved leave application of leave, id 27 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2069,'2025-08-11 18:31:31',5,'insert','Approved leave application of leave, id 27 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2070,'2025-08-11 18:32:54',5,'insert','Created leave application  id:28 for Employee Id: 6011 Staff #: 107579 Names: ABDALLA MWANDORO KAIDZA Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2071,'2025-08-11 18:32:54',5,'insert','Approved leave application of leave, id 28 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2072,'2025-08-11 18:32:54',5,'insert','Approved leave application of leave, id 28 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2073,'2025-08-11 18:32:54',5,'insert','Approved leave application of leave, id 28 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2074,'2025-08-11 18:32:55',5,'insert','Created leave application  id:29 for Employee Id: 6199 Staff #: 107787 Names: AGNES KALENDI MAINGI Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2075,'2025-08-11 18:32:55',5,'insert','Approved leave application of leave, id 29 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2076,'2025-08-11 18:32:55',5,'insert','Approved leave application of leave, id 29 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2077,'2025-08-11 18:32:55',5,'insert','Approved leave application of leave, id 29 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2078,'2025-08-11 19:27:03',5,'insert','Created leave application  id:30 for Employee Id: 20 Staff #: 100010 Names: BEATRICE ATIENO OTIENO Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2079,'2025-08-11 19:27:03',5,'insert','Approved leave application of leave, id 30 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2080,'2025-08-11 19:27:03',5,'insert','Approved leave application of leave, id 30 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2081,'2025-08-11 19:27:03',5,'insert','Approved leave application of leave, id 30 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2082,'2025-08-12 13:07:53',5,'update','Marked employee #:100373 names: FRANCIS JOHN  as present. Narration: Bioometric device issue','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2083,'2025-08-12 13:43:11',5,'insert','Processed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2084,'2025-08-12 14:03:34',5,'insert','Granted user id:50 name:Test User  access to unit id:4 name:Global Staff','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2085,'2025-08-12 14:03:38',5,'deleted',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2086,'2025-08-12 16:08:01',5,'insert','Created a new recruitment requisition id:1','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2087,'2025-08-12 16:08:37',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id4 unit name:Global Staff','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2088,'2025-08-12 16:08:37',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id1 unit name:M1','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2089,'2025-08-12 16:08:37',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id2 unit name:M2','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2090,'2025-08-12 16:08:37',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id6 unit name:M4','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2091,'2025-08-12 16:08:37',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id5 unit name:M5','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2092,'2025-08-12 16:08:37',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id3 unit name:M6','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2093,'2025-08-12 16:31:22',5,'insert','Created leave application  id:31 for Employee Id: 1325 Staff #: 100182 Names: ABEDNEGO KILELE MAKAU Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2094,'2025-08-12 16:31:22',5,'insert','Approved leave application of leave, id 31 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2095,'2025-08-12 16:31:22',5,'insert','Approved leave application of leave, id 31 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2096,'2025-08-12 16:31:22',5,'insert','Approved leave application of leave, id 31 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2097,'2025-08-12 16:31:22',5,'insert','Created leave application  id:32 for Employee Id: 2019 Staff #: 104153 Names: AGNES NGUI  Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2098,'2025-08-12 16:31:22',5,'insert','Approved leave application of leave, id 32 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2099,'2025-08-12 16:31:22',5,'insert','Approved leave application of leave, id 32 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2100,'2025-08-12 16:31:22',5,'insert','Approved leave application of leave, id 32 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2101,'2025-08-12 17:13:58',5,'insert','Created a new recruitment requisition id:2','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2102,'2025-08-12 17:14:34',5,'insert','Approved recruitment requisition #:RRN00004, ID:2 for level id:1 levelname:Factory Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2103,'2025-08-12 17:15:18',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id4 unit name:Global Staff','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2104,'2025-08-12 17:15:18',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id4 unit name:Global Staff','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2105,'2025-08-12 17:15:18',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id1 unit name:M1','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2106,'2025-08-12 17:15:18',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id1 unit name:M1','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2107,'2025-08-12 17:15:18',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id2 unit name:M2','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2108,'2025-08-12 17:15:18',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id2 unit name:M2','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2109,'2025-08-12 17:15:18',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id6 unit name:M4','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2110,'2025-08-12 17:15:18',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id6 unit name:M4','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2111,'2025-08-12 17:15:18',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id5 unit name:M5','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2112,'2025-08-12 17:15:18',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id5 unit name:M5','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2113,'2025-08-12 17:15:18',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id3 unit name:M6','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2114,'2025-08-12 17:15:18',5,'Insert','Added recruitment approval privilege for user id:5 name:System Administrator  for unit id3 unit name:M6','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2115,'2025-08-12 17:15:37',5,'insert','Approved recruitment requisition #:RRN00004, ID:2 for level id:2 levelname:HR Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2116,'2025-08-12 17:15:51',5,'insert','Approved recruitment requisition #:RRN00004, ID:2 for level id:3 levelname:CEO','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2117,'2025-08-12 17:20:31',5,'insert','Created a new recruitment requisition id:3','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2118,'2025-08-12 17:52:34',5,'update','Updated job position details for id :31','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"positionid\": 31, \"positionname\": \"CHECKER\", \"establishment\": 1, \"reportsto\": 0, \"startjobgroupid\": null, \"startnotchid\": null, \"endjobgroupid\": null, \"endnotchid\": null, \"dateadded\": \"2025-05-24 14:20:37\", \"addedby\": 5, \"deleted\": 0, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": null, \"otapplicable\": 1, \"targetbased\": 0}','{\"positionid\": 31, \"positionname\": \"CHECKER\", \"establishment\": 1, \"reportsto\": 72, \"startjobgroupid\": 1, \"startnotchid\": 1, \"endjobgroupid\": 1, \"endnotchid\": 1, \"dateadded\": \"2025-05-24 14:20:37\", \"addedby\": 5, \"deleted\": 0, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": null, \"otapplicable\": 1, \"targetbased\": 0}',NULL),
(2119,'2025-08-12 17:54:09',5,'update','Updated employee details for id :1284 staff no:103726 names:ROBERT MOGWASI OTIENO','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"employeeid\": 1284, \"staffno\": \"103726\", \"firstname\": \"ROBERT\", \"middlename\": \"MOGWASI\", \"lastname\": \"OTIENO\", \"termid\": 2, \"categoryid\": 1, \"departmentid\": 16, \"religionid\": 1, \"salutationid\": 1, \"iddocumentid\": 1, \"iddocreferenceno\": \"30632050\", \"iddocexpirydate\": null, \"dateofbirth\": \"1993-07-04\", \"gender\": \"male\", \"pinno\": \"A009133641H\", \"nssfno\": \"2002337734\", \"nhifno\": \"CR5312671175104-4\", \"disabled\": 0, \"disabilitytype\": null, \"disabilitydescription\": null, \"disabilitycertificateno\": null, \"onpayroll\": 1, \"fixedpaye\": 0, \"status\": \"active\", \"positionid\": 102, \"jobgroupid\": 1, \"notchid\": 1, \"bankbranchid\": 536, \"bankaccountnumber\": \"01116791839000\", \"employmentdate\": \"2025-01-06\", \"separationdate\": null, \"separationreason\": null, \"physicaladdress\": \"Mombasa\", \"postaladdress\": \"30780109\", \"town\": \"MTWAPA\", \"postalcode\": \"80109\", \"mobile\": \"254700898111\", \"emailaddress\": \"robertmogwasi@gmail.com\", \"alternativemobile\": null, \"alternativeemailaddress\": null, \"dateadded\": \"2025-07-29 06:31:18\", \"addedby\": 5, \"unitid\": 2, \"shiftid\": 1, \"sectionid\": 95, \"lastmodifiedby\": 5, \"lastmodificationdate\": \"2025-08-10 15:26:34\", \"attendancestatus\": \"active\", \"otapplicable\": 1, \"targetbased\": 1, \"biometricid\": 30632050, \"countryid\": 1}','{\"employeeid\": 1284, \"staffno\": \"103726\", \"firstname\": \"ROBERT\", \"middlename\": \"MOGWASI\", \"lastname\": \"OTIENO\", \"termid\": 2, \"categoryid\": 1, \"departmentid\": 16, \"religionid\": 1, \"salutationid\": 1, \"iddocumentid\": 1, \"iddocreferenceno\": \"30632050\", \"iddocexpirydate\": \"0000-00-00\", \"dateofbirth\": \"1993-07-04\", \"gender\": \"male\", \"pinno\": \"A009133641H\", \"nssfno\": \"2002337734\", \"nhifno\": \"CR5312671175104-4\", \"disabled\": 0, \"disabilitytype\": \"none\", \"disabilitydescription\": \"\", \"disabilitycertificateno\": \"\", \"onpayroll\": 1, \"fixedpaye\": 0, \"status\": \"active\", \"positionid\": 72, \"jobgroupid\": 1, \"notchid\": 1, \"bankbranchid\": 536, \"bankaccountnumber\": \"01116791839000\", \"employmentdate\": \"2025-01-06\", \"separationdate\": null, \"separationreason\": null, \"physicaladdress\": \"Mombasa\", \"postaladdress\": \"30780109\", \"town\": \"MTWAPA\", \"postalcode\": \"80109\", \"mobile\": \"254700898111\", \"emailaddress\": \"robertmogwasi@gmail.com\", \"alternativemobile\": \"\", \"alternativeemailaddress\": \"\", \"dateadded\": \"2025-07-29 06:31:18\", \"addedby\": 5, \"unitid\": 2, \"shiftid\": 1, \"sectionid\": 95, \"lastmodifiedby\": 5, \"lastmodificationdate\": \"2025-08-10 15:26:34\", \"attendancestatus\": \"active\", \"otapplicable\": 1, \"targetbased\": 1, \"biometricid\": 30632050, \"countryid\": 1}',NULL),
(2120,'2025-08-13 12:30:08',5,'insert','Created leave application  id:33 for Employee Id: 4488 Staff #: 104461 Names: BONFACE MATHINA MUIA Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2121,'2025-08-13 12:30:08',5,'insert','Approved leave application of leave, id 33 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2122,'2025-08-13 12:30:09',5,'insert','Approved leave application of leave, id 33 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2123,'2025-08-13 12:30:09',5,'insert','Approved leave application of leave, id 33 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2124,'2025-08-13 12:30:09',5,'insert','Created leave application  id:34 for Employee Id: 1539 Staff #: 101641 Names: GRACE MURUGI MAINA Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2125,'2025-08-13 12:30:09',5,'insert','Approved leave application of leave, id 34 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2126,'2025-08-13 12:30:09',5,'insert','Approved leave application of leave, id 34 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2127,'2025-08-13 12:30:10',5,'insert','Approved leave application of leave, id 34 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2128,'2025-08-13 12:30:10',5,'insert','Created leave application  id:35 for Employee Id: 2210 Staff #: 100734 Names: JANE WAMBUI KARANJA Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2129,'2025-08-13 12:30:10',5,'insert','Approved leave application of leave, id 35 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2130,'2025-08-13 12:30:10',5,'insert','Approved leave application of leave, id 35 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2131,'2025-08-13 12:30:10',5,'insert','Approved leave application of leave, id 35 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2132,'2025-08-13 12:30:10',5,'insert','Created leave application  id:36 for Employee Id: 1387 Staff #: 100315 Names: LINET ADHIAMBO ONYANGO Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2133,'2025-08-13 12:30:10',5,'insert','Approved leave application of leave, id 36 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2134,'2025-08-13 12:30:10',5,'insert','Approved leave application of leave, id 36 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2135,'2025-08-13 12:30:10',5,'insert','Approved leave application of leave, id 36 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2136,'2025-08-13 12:30:11',5,'insert','Created leave application  id:37 for Employee Id: 1411 Staff #: 100606 Names: PURITY KALUMU PHILIP Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2137,'2025-08-13 12:30:11',5,'insert','Approved leave application of leave, id 37 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2138,'2025-08-13 12:30:11',5,'insert','Approved leave application of leave, id 37 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2139,'2025-08-13 12:30:11',5,'insert','Approved leave application of leave, id 37 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",','','',NULL),
(2140,'2025-08-13 12:38:05',5,'update','Updated job position details for id :128','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"positionid\": 128, \"positionname\": \"PRODUCTION WRITER\", \"establishment\": 1, \"reportsto\": 0, \"startjobgroupid\": null, \"startnotchid\": null, \"endjobgroupid\": null, \"endnotchid\": null, \"dateadded\": \"2025-05-24 14:20:37\", \"addedby\": 5, \"deleted\": 0, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": null, \"otapplicable\": 1, \"targetbased\": 0}','{\"positionid\": 128, \"positionname\": \"PRODUCTION WRITER\", \"establishment\": 1, \"reportsto\": 72, \"startjobgroupid\": 1, \"startnotchid\": 1, \"endjobgroupid\": 1, \"endnotchid\": 1, \"dateadded\": \"2025-05-24 14:20:37\", \"addedby\": 5, \"deleted\": 0, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": null, \"otapplicable\": 1, \"targetbased\": 0}',NULL),
(2141,'2025-08-13 12:48:03',5,'insert','Created leave application  id:38 for Employee Id: 6527 Staff #: 108054 Names: ANGELA KHAKULA MAKARI Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2142,'2025-08-13 12:50:00',5,'update','Updated job position details for id :4','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"positionid\": 4, \"positionname\": \"ACCOUNTS MANAGER(PAYROLL)\", \"establishment\": 1, \"reportsto\": 0, \"startjobgroupid\": null, \"startnotchid\": null, \"endjobgroupid\": null, \"endnotchid\": null, \"dateadded\": \"2025-05-24 14:20:37\", \"addedby\": 5, \"deleted\": 0, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": null, \"otapplicable\": 0, \"targetbased\": 0}','{\"positionid\": 4, \"positionname\": \"ACCOUNTS MANAGER(PAYROLL)\", \"establishment\": 1, \"reportsto\": 72, \"startjobgroupid\": 1, \"startnotchid\": 1, \"endjobgroupid\": 1, \"endnotchid\": 1, \"dateadded\": \"2025-05-24 14:20:37\", \"addedby\": 5, \"deleted\": 0, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": null, \"otapplicable\": 0, \"targetbased\": 0}',NULL),
(2143,'2025-08-13 12:50:49',5,'insert','Created leave application  id:39 for Employee Id: 4471 Staff #: 105647 Names: HEMAN HASMUKH SHAH Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"138.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2144,'2025-08-14 11:57:34',5,'insert','Created leave application  id:40 for Employee Id: 1325 Staff #: 100182 Names: ABEDNEGO KILELE MAKAU Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2145,'2025-08-14 11:57:34',5,'insert','Approved leave application of leave, id 40 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2146,'2025-08-14 11:57:34',5,'insert','Approved leave application of leave, id 40 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2147,'2025-08-14 11:57:35',5,'insert','Approved leave application of leave, id 40 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2148,'2025-08-14 11:57:35',5,'insert','Created leave application  id:41 for Employee Id: 2019 Staff #: 104153 Names: AGNES NGUI  Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2149,'2025-08-14 11:57:35',5,'insert','Approved leave application of leave, id 41 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2150,'2025-08-14 11:57:35',5,'insert','Approved leave application of leave, id 41 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2151,'2025-08-14 11:57:35',5,'insert','Approved leave application of leave, id 41 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2152,'2025-08-14 11:57:35',5,'insert','Created leave application  id:42 for Employee Id: 1420 Staff #: 100616 Names: AGNETER MWANYALO MALEMBA Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2153,'2025-08-14 11:57:36',5,'insert','Approved leave application of leave, id 42 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2154,'2025-08-14 11:57:36',5,'insert','Approved leave application of leave, id 42 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2155,'2025-08-14 11:57:36',5,'insert','Approved leave application of leave, id 42 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2156,'2025-08-14 13:00:57',5,'update','Changed shift status for shiftid:1 name:Normal Day Shift to inactive','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2157,'2025-08-14 13:01:03',5,'update','Changed shift status for shiftid:1 name:Normal Day Shift to active','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2158,'2025-08-14 13:01:16',5,'update','Changed shift status for shiftid:1 name:Normal Day Shift to inactive','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2159,'2025-08-14 13:04:32',5,'update','Changed shift status for shiftid:1 name:Normal Day Shift to active','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2160,'2025-08-14 13:06:19',5,'update','Changed shift status for shiftid:1 name:Normal Day Shift to inactive','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2161,'2025-08-14 15:02:43',5,'insert','Created leave application  id:43 for Employee Id: 4471 Staff #: 105647 Names: HEMAN HASMUKH SHAH Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2162,'2025-08-14 15:05:52',5,'update','Marked employee #:100171 names: KEVIN OKOTH NYAMANGA as absent. Narration:Was at HR with a disciplinary issue','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2163,'2025-08-14 15:12:08',5,'insert','Created leave application  id:44 for Employee Id: 2660 Staff #: 101617 Names: KRISTE BERNARD PERERA Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2164,'2025-08-14 15:12:08',5,'insert','Approved leave application of leave, id 44 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2165,'2025-08-14 15:12:08',5,'insert','Approved leave application of leave, id 44 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2166,'2025-08-14 15:12:08',5,'insert','Approved leave application of leave, id 44 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2167,'2025-08-14 15:12:08',5,'insert','Created leave application  id:45 for Employee Id: 4472 Staff #: 100339 Names: PILLAI MURUKESAN KUTTAN Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2168,'2025-08-14 15:12:08',5,'insert','Approved leave application of leave, id 45 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2169,'2025-08-14 15:12:08',5,'insert','Approved leave application of leave, id 45 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2170,'2025-08-14 15:12:09',5,'insert','Approved leave application of leave, id 45 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2171,'2025-08-14 15:12:09',5,'insert','Created leave application  id:46 for Employee Id: 2535 Staff #: 101224 Names: UDAYA PUSHPA KUMARA Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2172,'2025-08-14 15:12:09',5,'insert','Approved leave application of leave, id 46 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2173,'2025-08-14 15:12:09',5,'insert','Approved leave application of leave, id 46 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2174,'2025-08-14 15:12:09',5,'insert','Approved leave application of leave, id 46 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2175,'2025-08-14 18:12:23',5,'insert','Created leave application  id:47 for Employee Id: 18 Staff #: 100028 Names: ARMOS AZANI KATANA Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2176,'2025-08-14 18:12:23',5,'insert','Approved leave application of leave, id 47 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2177,'2025-08-14 18:12:24',5,'insert','Approved leave application of leave, id 47 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2178,'2025-08-14 18:12:24',5,'insert','Approved leave application of leave, id 47 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",','','',NULL),
(2179,'2025-08-14 18:49:05',5,'delete','Deleted leave type id7 name:TEST LEAVE','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2180,'2025-08-14 18:50:24',5,'insert','Create leave type id:9 name;Unpaid Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2181,'2025-08-14 18:53:38',5,'update','Updated job position details for id :132','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"positionid\": 132, \"positionname\": \"QAD INCHARGE\", \"establishment\": 1, \"reportsto\": 0, \"startjobgroupid\": null, \"startnotchid\": null, \"endjobgroupid\": null, \"endnotchid\": null, \"dateadded\": \"2025-05-24 14:20:37\", \"addedby\": 5, \"deleted\": 0, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": null, \"otapplicable\": 0, \"targetbased\": 0}','{\"positionid\": 132, \"positionname\": \"QAD INCHARGE\", \"establishment\": 1, \"reportsto\": 72, \"startjobgroupid\": 1, \"startnotchid\": 1, \"endjobgroupid\": 1, \"endnotchid\": 1, \"dateadded\": \"2025-05-24 14:20:37\", \"addedby\": 5, \"deleted\": 0, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": null, \"otapplicable\": 0, \"targetbased\": 0}',NULL),
(2182,'2025-08-14 18:54:23',5,'insert','Created leave application  id:48 for Employee Id: 169 Staff #: 100277 Names: KAMBUA MUTHEMBWA  Leave Id:9 name: Unpaid Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2183,'2025-08-16 15:32:51',5,'update','Marked employee #:100438 names: CHARO UHURU CHARO as absent. Narration:This is a test absent','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2184,'2025-08-16 15:33:18',5,'update','Marked employee #:100438 names: CHARO UHURU CHARO as absent. Narration:This is a test absent','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2185,'2025-08-16 15:34:58',5,'update','Marked employee #:100438 names: CHARO UHURU CHARO as absent. Narration:This is a test','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2186,'2025-08-16 15:44:30',5,'update','Marked employee #:100438 names: CHARO UHURU CHARO as absent. Narration:This is a test cancellation','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2187,'2025-08-16 15:51:48',5,'update','Marked employee #:100754 names: JUDITH KALEE ISAAC as absent. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2188,'2025-08-16 16:06:50',5,'update','Marked employee #:100438 names: CHARO UHURU CHARO as absent. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2189,'2025-08-16 16:07:18',5,'update','Marked employee #:100438 names: CHARO UHURU CHARO as absent. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2190,'2025-08-16 16:08:44',5,'update','Marked employee #:100438 names: CHARO UHURU CHARO as absent. Narration:This is a test entry','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2191,'2025-08-19 18:26:38',5,'update','Marked employee #:100823 names: SATHEESHKUMAR BALARAMAN  as present. Narration: This was a mispunch','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2192,'2025-08-19 18:47:31',5,'update','Marked employee #:100130 names: ELIZABETH MUTINDI MUTISYA as present. Narration: This was a mispunch','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2193,'2025-08-19 18:55:02',5,'update','Marked clockin for employee #:107760 names: PENINA MASUD FINDI. Narration:There was a mispunch','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2194,'2025-08-19 18:56:09',5,'update',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2195,'2025-08-19 19:02:22',5,'update','Marked employee #:107760 names: PENINA MASUD FINDI as absent. Narration:There was an error','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2196,'2025-08-19 19:13:33',5,'update','Marked employee #:107760 names: PENINA MASUD FINDI as present. Narration: This was corrected later','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2197,'2025-08-20 07:36:03',5,'update',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"leaveid\": 9, \"leavename\": \"Unpaid Leave\", \"allocationdays\": 0, \"probationperiod\": 0, \"canbesplit\": 1, \"halfdayapplication\": 0, \"skipsholidays\": 1, \"applywithoutallocation\": 1, \"requiresattachment\": 0, \"approvalflow\": 1, \"allowancepayable\": 0, \"allowancepayrollitemid\": 0, \"dateadded\": \"2025-08-14 18:50:24\", \"deleted\": 0, \"addedby\": 5, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": null, \"abbreviation\": null, \"overridespublicholidays\": 0, \"payable\": 0}','{\"leaveid\": 9, \"leavename\": \"Unpaid Leave\", \"allocationdays\": 0, \"probationperiod\": 0, \"canbesplit\": 1, \"halfdayapplication\": 0, \"skipsholidays\": 1, \"applywithoutallocation\": 1, \"requiresattachment\": 0, \"approvalflow\": 1, \"allowancepayable\": 0, \"allowancepayrollitemid\": 0, \"dateadded\": \"2025-08-14 18:50:24\", \"deleted\": 0, \"addedby\": 5, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": null, \"abbreviation\": \"UPL\", \"overridespublicholidays\": 0, \"payable\": 0}',NULL),
(2198,'2025-08-20 07:36:51',5,'update',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"leaveid\": 8, \"leavename\": \"Another Test Leave\", \"allocationdays\": 0, \"probationperiod\": 0, \"canbesplit\": 1, \"halfdayapplication\": 1, \"skipsholidays\": 1, \"applywithoutallocation\": 1, \"requiresattachment\": 1, \"approvalflow\": 1, \"allowancepayable\": 0, \"allowancepayrollitemid\": 0, \"dateadded\": \"2025-08-07 14:25:03\", \"deleted\": 0, \"addedby\": 5, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": null, \"abbreviation\": null, \"overridespublicholidays\": 0, \"payable\": 0}','{\"leaveid\": 8, \"leavename\": \"Another Test Leave\", \"allocationdays\": 0, \"probationperiod\": 0, \"canbesplit\": 1, \"halfdayapplication\": 1, \"skipsholidays\": 1, \"applywithoutallocation\": 1, \"requiresattachment\": 1, \"approvalflow\": 1, \"allowancepayable\": 0, \"allowancepayrollitemid\": 0, \"dateadded\": \"2025-08-07 14:25:03\", \"deleted\": 0, \"addedby\": 5, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": null, \"abbreviation\": \"ATL\", \"overridespublicholidays\": 0, \"payable\": 0}',NULL),
(2199,'2025-08-20 07:51:33',5,'update',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"leaveid\": 5, \"leavename\": \"Sick Leave\", \"allocationdays\": 45, \"probationperiod\": 60, \"canbesplit\": 1, \"halfdayapplication\": 1, \"skipsholidays\": 0, \"applywithoutallocation\": 1, \"requiresattachment\": 1, \"approvalflow\": 1, \"allowancepayable\": 0, \"allowancepayrollitemid\": 0, \"dateadded\": \"2024-08-03 21:28:14\", \"deleted\": 0, \"addedby\": 5, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": \"SICK LEAVE\", \"abbreviation\": \"SL\", \"overridespublicholidays\": 0, \"payable\": 0}','{\"leaveid\": 5, \"leavename\": \"Sick Leave\", \"allocationdays\": 45, \"probationperiod\": 60, \"canbesplit\": 1, \"halfdayapplication\": 1, \"skipsholidays\": 0, \"applywithoutallocation\": 1, \"requiresattachment\": 1, \"approvalflow\": 1, \"allowancepayable\": 0, \"allowancepayrollitemid\": 0, \"dateadded\": \"2024-08-03 21:28:14\", \"deleted\": 0, \"addedby\": 5, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": \"SICK LEAVE\", \"abbreviation\": \"SL\", \"overridespublicholidays\": 0, \"payable\": 1}',NULL),
(2200,'2025-08-20 07:51:51',5,'update',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"leaveid\": 2, \"leavename\": \"Annual Leave\", \"allocationdays\": 21, \"probationperiod\": 60, \"canbesplit\": 1, \"halfdayapplication\": 1, \"skipsholidays\": 1, \"applywithoutallocation\": 1, \"requiresattachment\": 0, \"approvalflow\": 1, \"allowancepayable\": 1, \"allowancepayrollitemid\": 16, \"dateadded\": \"2024-08-03 21:26:23\", \"deleted\": 0, \"addedby\": 5, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": \"ANNUAL LEAVE\", \"abbreviation\": \"AL\", \"overridespublicholidays\": 0, \"payable\": 0}','{\"leaveid\": 2, \"leavename\": \"Annual Leave\", \"allocationdays\": 21, \"probationperiod\": 60, \"canbesplit\": 1, \"halfdayapplication\": 1, \"skipsholidays\": 1, \"applywithoutallocation\": 1, \"requiresattachment\": 0, \"approvalflow\": 1, \"allowancepayable\": 1, \"allowancepayrollitemid\": 16, \"dateadded\": \"2024-08-03 21:26:23\", \"deleted\": 0, \"addedby\": 5, \"datedeleted\": null, \"deletedby\": null, \"systemlabel\": \"ANNUAL LEAVE\", \"abbreviation\": \"AL\", \"overridespublicholidays\": 0, \"payable\": 1}',NULL),
(2201,'2025-08-20 11:08:58',5,'update','Marked employee #:100776 names: DORIS KANARIO  as absent. Narration:This is test absent','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2202,'2025-08-20 11:54:50',5,'update','Marked employee #:100776 names: DORIS KANARIO  as absent. Narration:I want to test for leave application','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2203,'2025-08-20 11:56:47',5,'insert','Created leave application  id:49 for Employee Id: 1440 Staff #: 100776 Names: DORIS KANARIO  Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2204,'2025-08-20 11:56:47',5,'insert','Approved leave application of leave, id 49 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2205,'2025-08-20 11:56:47',5,'insert','Approved leave application of leave, id 49 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2206,'2025-08-20 12:00:42',5,'insert','Created leave application  id:50 for Employee Id: 1440 Staff #: 100776 Names: DORIS KANARIO  Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2207,'2025-08-20 12:00:42',5,'insert','Approved leave application of leave, id 50 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2208,'2025-08-20 12:00:42',5,'insert','Approved leave application of leave, id 50 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2209,'2025-08-20 12:01:11',5,'insert','Created leave application  id:51 for Employee Id: 1440 Staff #: 100776 Names: DORIS KANARIO  Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2210,'2025-08-20 12:01:11',5,'insert','Approved leave application of leave, id 51 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2211,'2025-08-20 12:01:12',5,'insert','Approved leave application of leave, id 51 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2212,'2025-08-20 12:10:33',5,'insert','Created leave application  id:52 for Employee Id: 1440 Staff #: 100776 Names: DORIS KANARIO  Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2213,'2025-08-20 12:10:33',5,'insert','Approved leave application of leave, id 52 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2214,'2025-08-20 12:10:33',5,'insert','Approved leave application of leave, id 52 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2215,'2025-08-20 12:10:33',5,'insert','Approved leave application of leave, id 52 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2216,'2025-08-20 13:14:24',5,'insert','Created leave application  id:53 for Employee Id: 3419 Staff #: 105076 Names: MARY ADHIAMBO ODUMA Leave Id:9 name: Unpaid Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2217,'2025-08-20 19:00:50',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2218,'2025-08-20 19:02:33',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2219,'2025-08-20 19:03:37',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2220,'2025-08-22 06:10:59',5,'insert','Created leave application  id:54 for Employee Id: 1325 Staff #: 100182 Names: ABEDNEGO KILELE MAKAU Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2221,'2025-08-22 06:11:00',5,'insert','Approved leave application of leave, id 54 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2222,'2025-08-22 06:11:00',5,'insert','Approved leave application of leave, id 54 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2223,'2025-08-22 06:11:00',5,'insert','Approved leave application of leave, id 54 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2224,'2025-08-22 06:11:00',5,'insert','Created leave application  id:55 for Employee Id: 1326 Staff #: 100183 Names: FESTUS KISYANGA NDAMBUKI Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2225,'2025-08-22 06:11:00',5,'insert','Approved leave application of leave, id 55 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2226,'2025-08-22 06:11:00',5,'insert','Approved leave application of leave, id 55 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2227,'2025-08-22 06:11:00',5,'insert','Approved leave application of leave, id 55 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2228,'2025-08-22 06:11:01',5,'insert','Created leave application  id:56 for Employee Id: 1327 Staff #: 100187 Names: FAITH SARAH MUTUA Leave Id:2 name: Annual Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2229,'2025-08-22 06:11:01',5,'insert','Approved leave application of leave, id 56 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2230,'2025-08-22 06:11:01',5,'insert','Approved leave application of leave, id 56 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2231,'2025-08-22 06:11:01',5,'insert','Approved leave application of leave, id 56 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2232,'2025-08-22 06:23:10',5,'insert','Created leave application  id:57 for Employee Id: 1325 Staff #: 100182 Names: ABEDNEGO KILELE MAKAU Leave Id:9 name: Unpaid Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2233,'2025-08-22 06:23:10',5,'insert','Approved leave application of leave, id 57 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2234,'2025-08-22 06:23:10',5,'insert','Approved leave application of leave, id 57 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2235,'2025-08-22 06:23:10',5,'insert','Approved leave application of leave, id 57 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2236,'2025-08-22 06:23:10',5,'insert','Created leave application  id:58 for Employee Id: 2019 Staff #: 104153 Names: AGNES NGUI  Leave Id:9 name: Unpaid Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2237,'2025-08-22 06:23:10',5,'insert','Approved leave application of leave, id 58 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2238,'2025-08-22 06:23:11',5,'insert','Approved leave application of leave, id 58 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2239,'2025-08-22 06:23:11',5,'insert','Approved leave application of leave, id 58 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2240,'2025-08-22 06:23:11',5,'insert','Created leave application  id:59 for Employee Id: 1801 Staff #: 102819 Names: ALICE KASYOKA QUEEN Leave Id:9 name: Unpaid Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2241,'2025-08-22 06:23:11',5,'insert','Approved leave application of leave, id 59 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2242,'2025-08-22 06:23:11',5,'insert','Approved leave application of leave, id 59 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2243,'2025-08-22 06:23:11',5,'insert','Approved leave application of leave, id 59 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2244,'2025-08-22 06:23:12',5,'insert','Created leave application  id:60 for Employee Id: 1581 Staff #: 101790 Names: ALICE MUTHEU SAMMY Leave Id:9 name: Unpaid Leave','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2245,'2025-08-22 06:23:12',5,'insert','Approved leave application of leave, id 60 for level id:1, levelname:Supervisor','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2246,'2025-08-22 06:23:12',5,'insert','Approved leave application of leave, id 60 for level id:2, levelname:Human Resource Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2247,'2025-08-22 06:23:12',5,'insert','Approved leave application of leave, id 60 for level id:3, levelname:Senior management','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2248,'2025-08-22 16:00:21',5,'Update','Updated applicant details id 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','{\"applicantid\": 1, \"requisitionid\": 2, \"applicantno\": \"APP00001\", \"firstname\": \"John\", \"middlename\": \"Does\", \"lastname\": \"\", \"idno\": \"111222333\", \"gender\": \"male\", \"dob\": \"1987-08-02\", \"mobile\": \"\", \"emailaddress\": \"\", \"postaladdress\": \"\", \"status\": \"pending\", \"dateadded\": \"2025-08-22 13:03:58\", \"addedby\": 5, \"datedeleted\": null, \"deletedby\": null, \"reasondeleted\": null}','{\"applicantid\": 1, \"requisitionid\": 2, \"applicantno\": \"APP00001\", \"firstname\": \"John\", \"middlename\": \"Doe\", \"lastname\": \"\", \"idno\": \"111222333\", \"gender\": \"male\", \"dob\": \"1987-08-02\", \"mobile\": \"0727709772\", \"emailaddress\": \"akellorich@gmail.com\", \"postaladdress\": \"52428\", \"status\": \"pending\", \"dateadded\": \"2025-08-22 13:03:58\", \"addedby\": 5, \"datedeleted\": null, \"deletedby\": null, \"reasondeleted\": null}',NULL),
(2249,'2025-08-22 16:19:41',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:23657524 Names:Richard Onyango Akello','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2250,'2025-08-22 16:21:26',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:4768765 Names:Okelo Samuel Akello','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2251,'2025-08-22 16:21:55',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:67598576 Names:Louis Samuel Onyango','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2252,'2025-08-23 11:59:17',5,'Insert','Updated applicant status, applicant no:APP00002 names:Richard Onyango Akello new status:approved narration:This is a test approval','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2253,'2025-08-23 12:00:28',5,'Insert','Updated applicant status, applicant no:APP00002 names:Richard Onyango Akello new status:approved narration:This is a test approval','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2254,'2025-08-23 12:00:28',5,'Insert','Updated applicant status, applicant no:APP00003 names:Okelo Samuel Akello new status:approved narration:This is a test approval','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2255,'2025-08-23 12:00:28',5,'Insert','Updated applicant status, applicant no:APP00004 names:Louis Samuel Onyango new status:approved narration:This is a test approval','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2256,'2025-08-23 19:48:27',5,'Insert','Created recruitment panel for requisition no:RRN00004, panel name:Panel A','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2257,'2025-08-23 19:48:27',5,'Insert','Added employee to recruitment panel requisition #:RRN00004 role:4 staff name:BEATRICE ATIENO JUMA','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2258,'2025-08-23 19:48:27',5,'Insert','Added employee to recruitment panel requisition #:RRN00004 role:1 staff name:KATHINI MUSEMBI ','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2259,'2025-08-23 19:48:27',5,'Insert','Added employee to recruitment panel requisition #:RRN00004 role:3 staff name:MALINDA KYANDI ','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2260,'2025-08-23 19:48:27',5,'Insert','Added employee to recruitment panel requisition #:RRN00004 role:5 staff name:AGNES MUSIVI KILOKO','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2261,'2025-08-23 20:01:26',5,'Insert','Created recruitment panel for requisition no:RRN00004, panel name:Panel A','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2262,'2025-08-23 20:01:26',5,'Insert','Added employee to recruitment panel requisition #:RRN00004 role:Payroll staff name:HEMAN HASMUKH SHAH','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2263,'2025-08-23 20:01:26',5,'Insert','Added employee to recruitment panel requisition #:RRN00004 role:Human Resource staff name:ABEDNECO WAMBUA MWANGANGI','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2264,'2025-08-23 20:01:26',5,'Insert','Added employee to recruitment panel requisition #:RRN00004 role:Finance staff name:ALICE CHINYAVU ZUMA','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2265,'2025-08-23 20:01:26',5,'Insert','Added employee to recruitment panel requisition #:RRN00004 role:Industrial Engineering staff name:AQUILINA MKAWUGANGA KIDELO','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2266,'2025-08-24 16:04:45',5,'Insert','Scheduled applicant for interview, applicant:Louis Samuel Onyango id no:67598576 interview location:Mega 1 Factory Floor time:0000-00-00 00:00:00 panel:Panel A','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2267,'2025-08-24 16:04:45',5,'Insert','Scheduled applicant for interview, applicant:Okelo Samuel Akello id no:4768765 interview location:Mega 1 Factory Floor time:0000-00-00 00:00:00 panel:Panel A','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2268,'2025-08-24 16:04:45',5,'Insert','Scheduled applicant for interview, applicant:Richard Onyango Akello id no:23657524 interview location:Mega 1 Factory Floor time:0000-00-00 00:00:00 panel:Panel A','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2269,'2025-08-25 16:36:39',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:47687645 Names:Martin  Obwaka ','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2270,'2025-08-25 16:37:13',5,'Insert','Updated applicant status, applicant no:APP00005 names:Martin  Obwaka  new status:approved narration:Ok','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2271,'2025-08-25 16:38:47',5,'Insert','Created recruitment panel for requisition no:RRN00004, panel name:Panel B','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2272,'2025-08-25 16:38:47',5,'Insert','Added employee to recruitment panel requisition #:RRN00004 role:HR staff name:ABDIAZIZ MOHAMED BASHIR','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2273,'2025-08-25 18:26:24',5,'insert','Created a new recruitment requisition id:4','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2274,'2025-08-25 18:34:58',5,'insert','Created a new recruitment requisition id:5','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2275,'2025-08-25 18:37:09',5,'insert','Created a new recruitment requisition id:6','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2276,'2025-08-26 12:39:51',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2277,'2025-08-26 12:51:25',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2278,'2025-08-26 12:51:56',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2279,'2025-08-26 12:52:05',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2280,'2025-08-26 12:52:27',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2281,'2025-08-26 12:54:04',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2282,'2025-08-26 12:56:50',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2283,'2025-08-26 12:57:46',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2284,'2025-08-26 12:59:09',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2285,'2025-08-26 13:00:59',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2286,'2025-08-26 13:01:52',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2287,'2025-08-26 13:03:19',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2288,'2025-08-26 13:19:54',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2289,'2025-08-26 13:20:09',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2290,'2025-08-26 13:20:21',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2291,'2025-08-26 13:20:43',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2292,'2025-08-26 13:21:40',5,'update','Reprocessed payroll for August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2293,'2025-08-26 15:14:34',5,'insert','Approved recruitment requisition #:RRN00008, ID:6 for level id:1 levelname:Factory Manager','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL),
(2294,'2025-08-27 18:37:23',5,'insert',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2295,'2025-08-27 18:37:23',5,'insert',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2296,'2025-08-27 18:37:23',5,'insert',NULL,'{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2297,'2025-08-27 18:45:00',5,'insert','Added interview score for applicant 4 name:Louis Samuel Onyango','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2298,'2025-08-27 18:45:00',5,'insert','Added interview score for applicant 3 name:Okelo Samuel Akello','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2299,'2025-08-27 18:45:00',5,'insert','Added interview score for applicant 2 name:Richard Onyango Akello','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2300,'2025-08-27 18:49:25',5,'insert','Added interview score for applicant 4 name:Louis Samuel Onyango','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2301,'2025-08-27 18:49:25',5,'insert','Added interview score for applicant 3 name:Okelo Samuel Akello','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2302,'2025-08-27 18:49:26',5,'insert','Added interview score for applicant 2 name:Richard Onyango Akello','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2303,'2025-08-27 18:55:56',5,'insert','Added interview score for applicant 4 name:Louis Samuel Onyango','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2304,'2025-08-27 18:55:56',5,'insert','Added interview score for applicant 3 name:Okelo Samuel Akello','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2305,'2025-08-27 18:55:56',5,'insert','Added interview score for applicant 2 name:Richard Onyango Akello','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2306,'2025-08-27 18:57:04',5,'insert','Added interview score for applicant 4 name:Louis Samuel Onyango','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2307,'2025-08-27 18:57:04',5,'insert','Added interview score for applicant 3 name:Okelo Samuel Akello','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2308,'2025-08-27 18:57:04',5,'insert','Added interview score for applicant 2 name:Richard Onyango Akello','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2309,'2025-08-27 19:03:09',5,'insert','Added interview score for applicant 4 name:Louis Samuel Onyango','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2310,'2025-08-27 19:03:09',5,'insert','Added interview score for applicant 3 name:Okelo Samuel Akello','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2311,'2025-08-27 19:03:09',5,'insert','Added interview score for applicant 2 name:Richard Onyango Akello','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2312,'2025-08-27 19:05:54',5,'insert','Added interview score for applicant 4 name:Louis Samuel Onyango','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2313,'2025-08-27 19:05:54',5,'insert','Added interview score for applicant 3 name:Okelo Samuel Akello','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2314,'2025-08-27 19:05:54',5,'insert','Added interview score for applicant 2 name:Richard Onyango Akello','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",',NULL,NULL,NULL),
(2315,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:35867043 Names:Hannah Njoki Kiptoo','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2316,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:30203691 Names:Catherine Kamau Chebet','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2317,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:20437746 Names:John Onyango Wambui','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2318,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:36424196 Names:Michael Cheruiyot Njoroge','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2319,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:31940361 Names:Mary Chebet Koech','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2320,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:33604326 Names:George Wairimu Were','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2321,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:22285652 Names:Elizabeth Ochieng Wambui','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2322,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:27394708 Names:Margaret Chebet Odhiambo','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2323,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:27533682 Names:David Ochieng Were','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2324,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:38784489 Names:Mary Mwangi Kamau','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2325,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:39872809 Names:Daniel Achieng Okoth','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2326,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:36974033 Names:Hannah Wairimu Koech','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2327,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:37426484 Names:John Mutiso Mutiso','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2328,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:21127373 Names:Margaret Onyango Njeri','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2329,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:26129202 Names:Elizabeth Wairimu Mutiso','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2330,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:25688415 Names:James Wanjiku Otieno','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2331,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:31388061 Names:Elizabeth Onyango Omondi','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2332,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:27475305 Names:David Achieng Omondi','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2333,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:33178520 Names:Samuel Achieng Kamau','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2334,'2025-08-31 15:43:04',5,'Insert','Added applicant to recruitment requisition id:2 no:RRN00004 Aplicant id no:28001135 Names:John Kiptoo Were','{\"browser\":\"Chrome\",\"browser_version\":\"139.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}',NULL,NULL,NULL),
(2335,'2026-02-24 19:52:17',5,'update','Closed payroll period August 2025 id: 1','{\"browser\":\"Chrome\",\"browser_version\":\"145.0.0.0\",\"os_platform\":\"windows\",\"device\":\"Desktop\"}','','',NULL);

/*Table structure for table `objects` */

DROP TABLE IF EXISTS `objects`;

CREATE TABLE `objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `module` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `restricted` tinyint(1) DEFAULT 0,
  `code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `objects` */

insert  into `objects`(`id`,`description`,`module`,`restricted`,`code`) values 
(1,'Access system dashboard','admin',0,'1x001'),
(2,'Access Employees menu','Human Resource',0,'2x001'),
(3,'Manage employee bio data','Human Resource',0,'2x002'),
(4,'Manage employee contracts','Human Resource',0,'2x003'),
(5,'Manage employee payroll info','Human Resource',0,'2x004'),
(6,'Manage employee relationships','Human Resource',0,'2x005'),
(7,'manage employee experience','Human Resource',0,'2x006'),
(8,'Manage employee training','Human Resource',0,'2x007'),
(9,'Manage employee leaves','Human Resource',0,'2x008'),
(10,'Manage employee documents','Human Resource',0,'2x009'),
(11,'Manage employee disciplinary cases','Human Resource',0,'2x010'),
(12,'Access payroll menu','payroll',0,'3x001'),
(13,'Process payroll','payroll',0,'3x002'),
(14,'Import employee payroll items','payroll',0,'3x003'),
(15,'Generate payroll reports','payroll',0,'3x004'),
(16,'Access attendance menu','attendance',0,'8x001'),
(17,'View attendance historical data','attendance',0,'8x002'),
(18,'Import attendance data','attendance',0,'8x003'),
(19,'Manage attendance actions','attendance',0,'8x004'),
(20,'Generate PresAbs report','attendance',0,'8x005'),
(21,'Manage overtime data','attendance',0,'8x006'),
(22,'Approve overtime','attendance',0,'8x007'),
(23,'Manage shift master','attendance',0,'8x008'),
(24,'Manage staff shift(s)','attendance',0,'8x009'),
(25,'Access leave menu','leave',0,'4x001'),
(26,'View leave dashboard','leave',0,'4x002'),
(27,'View leave applications','leave',0,'4x003'),
(28,'Manage leave allocations','leave',0,'4x004'),
(29,'Access recruitment menu','recruitment',0,'5x001'),
(30,'Manage recruitment requisitions','recruitment',0,'5x002'),
(31,'Manage applicants','recruitment',0,'5x003'),
(32,'Manage applicant selection','recruitment',0,'5x004'),
(33,'Manage interview panels','recruitment',0,'5x005'),
(34,'Manage interview schedule','recruitment',0,'5x006'),
(35,'Manage Interview scoring','recruitment',0,'5x007'),
(36,'Manage employee onboarding','recruitment',0,'5x008'),
(37,'Access contracts menu','contracts',0,'6x001'),
(38,'View contracts dashboard','contracts',0,'6x002'),
(39,'View contracts history','contracts',0,'6x003'),
(40,'Renew contracts','contracts',0,'6x004'),
(41,'Generate contract document','contracts',0,'6x005'),
(42,'Access settings menu','settings',0,'7x001'),
(43,'Manage institution details','settings',0,'7x002'),
(44,'Manage payroll grades','settings',0,'7x003'),
(45,'Manage payroll scales','settings',0,'7x004'),
(46,'Manage employment positions','settings',0,'7x005'),
(47,'Manage bank and branch details','settings',0,'7x006'),
(48,'Manage payroll items','settings',0,'7x007'),
(49,'Manage payroll creditors','settings',0,'7x008'),
(50,'Manage leave types','settings',0,'7x009'),
(51,'Manage public holidays','settings',0,'7x009'),
(52,'Manage leave approval flow','settings',0,'7x010'),
(53,'Manage employment categories','settings',0,'7x011'),
(54,'Manage departments and sections','settings',0,'7x012'),
(55,'Manage units','settings',0,'7x013'),
(56,'Manage employment terms','settings',0,'7x014'),
(57,'Manage email configuration','settings',0,'7x015'),
(58,'Manage sms configuration','settings',0,'7x016'),
(59,'manage whatsapp configuration ','settings',0,'7x017'),
(60,'Manage system users','admin',0,'1x002'),
(61,'Access reports menu','reports',0,'9x001'),
(62,'Close payroll period','payroll',0,'3x005'),
(63,'Generate payroll register - detailed','reports',0,'9x002'),
(64,'Generate payroll register summarized','reports',0,'9x003'),
(65,'Generate employee payslips','reports',0,'9x004'),
(66,'Generate bank remittance advises','reports',0,'9x005'),
(67,'Generate statutory remittance advises','reports',0,'9x005'),
(68,'Generate third party remittance advises','reports',0,'9x006'),
(69,'Generate payrol chnages report','reports',0,'9x007'),
(70,'Generate P9 deduction cards','reports',0,'9x008'),
(71,'Generate P10 summary','reports',0,'9x009'),
(72,'Generate payments summary','reports',0,'9x010'),
(73,'Generate deduction summary','reports',0,'9x011'),
(74,'Generate staff establishment','reports',0,'9x012');

/*Table structure for table `roleprivileges` */

DROP TABLE IF EXISTS `roleprivileges`;

CREATE TABLE `roleprivileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `objectid` int(11) DEFAULT NULL,
  `allowed` tinyint(1) DEFAULT 0,
  `dateadded` datetime DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `deletedby` int(11) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roleprivileges` */

insert  into `roleprivileges`(`id`,`roleid`,`objectid`,`allowed`,`dateadded`,`addedby`,`deleted`,`deletedby`,`datedeleted`) values 
(1,1,12,1,'2025-07-30 05:13:12',5,0,NULL,NULL),
(2,1,62,1,'2025-07-30 05:13:12',5,0,NULL,NULL),
(3,1,15,1,'2025-07-30 05:13:12',5,0,NULL,NULL),
(4,1,14,1,'2025-07-30 05:13:12',5,0,NULL,NULL),
(5,1,13,1,'2025-07-30 05:13:12',5,0,NULL,NULL);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `roledescription` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `addedby` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `lastdatemodified` datetime DEFAULT NULL,
  `lastmodifiedby` int(11) DEFAULT NULL,
  `institutionid` int(11) DEFAULT NULL,
  `colour` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`roleid`),
  KEY `addedby` (`addedby`),
  KEY `lastmodifiedby` (`lastmodifiedby`),
  KEY `institutionid` (`institutionid`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `user` (`userid`),
  CONSTRAINT `roles_ibfk_2` FOREIGN KEY (`lastmodifiedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

insert  into `roles`(`roleid`,`rolename`,`roledescription`,`deleted`,`addedby`,`dateadded`,`lastdatemodified`,`lastmodifiedby`,`institutionid`,`colour`) values 
(1,'Admin','System Admins',0,5,'2025-07-30 05:13:12',NULL,NULL,NULL,'#EF5350'),
(2,'Manager','Farm Managers',0,5,'2025-07-30 05:13:12',NULL,NULL,NULL,'#276834'),
(3,'Milker','Milkers',0,5,'2025-07-30 05:13:12',NULL,NULL,NULL,'#782319'),
(4,'Driver','Drivers',0,5,'2025-07-30 05:13:12',NULL,NULL,NULL,'#217AA0');

/*Table structure for table `roleusers` */

DROP TABLE IF EXISTS `roleusers`;

CREATE TABLE `roleusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `deletedby` int(11) DEFAULT NULL,
  `datedeleted` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roleid` (`roleid`),
  KEY `userid` (`userid`),
  KEY `addedby` (`addedby`),
  KEY `deletedby` (`deletedby`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roleusers` */

insert  into `roleusers`(`id`,`roleid`,`userid`,`dateadded`,`addedby`,`deleted`,`deletedby`,`datedeleted`) values 
(1,1,5,'2025-08-05 15:00:19',5,1,5,'2025-08-08 16:49:49');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `middlename` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lastname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mobile` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accountexpires` tinyint(1) DEFAULT 0,
  `accountexpirydate` datetime DEFAULT NULL,
  `changepasswordonlogon` tinyint(1) DEFAULT 0,
  `accountactive` tinyint(1) DEFAULT 1,
  `reasoninactive` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  `lastmodifiedon` datetime DEFAULT NULL,
  `lastmodifiedby` int(11) DEFAULT NULL,
  `systemadmin` tinyint(1) DEFAULT 0,
  `profilephoto` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `institutionid` int(11) DEFAULT NULL,
  `salt` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `systemlabel` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'system',
  `emailactivationcode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `phoneactivationcode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `isemployee` tinyint(1) DEFAULT 1,
  `employeeid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'active',
  PRIMARY KEY (`userid`,`email`),
  KEY `institutionid` (`institutionid`),
  KEY `addedby` (`addedby`),
  KEY `idx_user_userid` (`userid`),
  KEY `employeeid` (`employeeid`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`addedby`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user` */

insert  into `user`(`userid`,`username`,`firstname`,`middlename`,`lastname`,`email`,`mobile`,`password`,`accountexpires`,`accountexpirydate`,`changepasswordonlogon`,`accountactive`,`reasoninactive`,`dateadded`,`addedby`,`lastmodifiedon`,`lastmodifiedby`,`systemadmin`,`profilephoto`,`institutionid`,`salt`,`systemlabel`,`category`,`emailactivationcode`,`phoneactivationcode`,`isemployee`,`employeeid`,`roleid`,`status`) values 
(5,'admin','System','Administrator','','akellorich@gmail.com','254780480253','7b885174f1eb08747da64cf6a8f4f4425c4ed41bd480c27dc571dd7d113e9d95',0,'0000-00-00 00:00:00',0,1,'Account deleted',NULL,NULL,'2025-07-28 10:57:02',5,1,NULL,NULL,'067bd2e06b5244ff340ed31def78bc',NULL,'system',NULL,NULL,0,NULL,NULL,'active'),
(49,'system','System','Account',NULL,'',NULL,NULL,0,NULL,0,1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'INBUILT SYSTEM ACCOUNT','system',NULL,NULL,1,NULL,NULL,'active'),
(50,'test','Test','User','','test@gmail.com','0712333444','959a290a74087aed4ba1d2ceec842b1dda92b0573d9cf8f2aa38e2d84acc2437',0,NULL,0,1,NULL,'2025-07-30 05:06:57',5,'2025-08-05 22:43:56',5,0,NULL,NULL,'cde818d4ebb77d96b0e743293eda96',NULL,'system',NULL,NULL,1,6527,NULL,'active');

/*Table structure for table `userprivileges` */

DROP TABLE IF EXISTS `userprivileges`;

CREATE TABLE `userprivileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objectid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `allowed` tinyint(1) DEFAULT NULL,
  `dateadded` datetime DEFAULT NULL,
  `addedby` int(11) DEFAULT NULL,
  `lastdateupdated` datetime DEFAULT NULL,
  `lastupdatedby` int(11) DEFAULT NULL,
  `definedfromuser` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `userprivileges` */

insert  into `userprivileges`(`id`,`objectid`,`userid`,`allowed`,`dateadded`,`addedby`,`lastdateupdated`,`lastupdatedby`,`definedfromuser`) values 
(8,16,50,1,NULL,5,'2025-08-05 22:43:56',5,1),
(9,17,50,1,NULL,5,'2025-08-05 22:43:56',5,1),
(10,38,50,1,NULL,5,'2025-08-05 22:43:56',5,1),
(11,39,50,1,NULL,5,'2025-08-05 22:43:56',5,1),
(12,27,50,1,NULL,5,'2025-08-05 22:43:56',5,1),
(13,26,50,1,NULL,5,'2025-08-05 22:43:56',5,1);

/* Procedure structure for procedure `spgetrolesforuserassignment` */

/*!50003 DROP PROCEDURE IF EXISTS  `spgetrolesforuserassignment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetrolesforuserassignment`()
BEGIN
	select `roleid`,`rolename` from `roles` order by `rolename`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `spgetroleusers` */

/*!50003 DROP PROCEDURE IF EXISTS  `spgetroleusers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetroleusers`(`$roleid` INT)
BEGIN
	select r.`userid`, `username`,`firstname`,`middlename`,`lastname` from `roleusers` r, `user` u
	where r.`userid`=u.`id` and `roleid`=$roleid
	order by `firstname`,`middlename`,`lastname`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `spgetuserroles` */

/*!50003 DROP PROCEDURE IF EXISTS  `spgetuserroles` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetuserroles`(`$userid` INT)
BEGIN
	select r.* from `roles` r, `roleusers` u
	where r.`roleid`=u.`roleid` and `userid`=$userid
	and ifnull(u.`deleted`,0)=0
	order by `rolename`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_changeuserpassword` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_changeuserpassword` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_changeuserpassword`($id numeric, $userpassword varchar(100),$salt varchar(50),$changepasswordonlogon bool)
BEGIN
	update `user` 
	set `password`=$userpassword, `salt`=$salt,`changepasswordonlogon`=$changepasswordonlogon 
	where `userid`=$id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkifemployeeisystemuser` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkifemployeeisystemuser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkifemployeeisystemuser`($staffno varchar(100))
BEGIN
		select employeeid into @employeeid from `employeerecords` where `staffno`=$staffno;
		select * from `user` where `employeeid`=@employeeid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkuser` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkuser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkuser`(`$userid` INT, `$checkfield` VARCHAR(50), `$checkvalue` VARCHAR(50))
BEGIN
	if $checkfield='username' then 
		select * from `user` where `userid`<>$userid and `username`=$checkvalue;
	elseif $checkfield='email' then 
		select * from `user` where `userid`<>$userid AND `email`=$checkvalue;
	elseif $checkfield='mobile' then 
		SELECT * FROM `user` WHERE `userid`<>$userid AND `mobile`=$checkvalue;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkuserovertimeapprovalprivilege` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkuserovertimeapprovalprivilege` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkuserovertimeapprovalprivilege`($userid int,$levelid int,$unitid int)
BEGIN
		select * from `overtimeapprovalusers`
		where `levelid`=$levelid and `unitid`=$unitid and `userid`=$userid and `allowed`=1;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_createemployeeuseraccount` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_createemployeeuseraccount` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createemployeeuseraccount`($staffno varchar(50),$mobile varchar(50),$emailaddress varchar(50),$salt varchar(50),
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
				CALL `sp_saveaudittrailentry`($userid,'insert',@narration,$platform,'','',NULL);
				
				SELECT CONCAT('Updated concat details for  staff: ',$staffno,' names:',$firstname,' ',$middlename,' ',$lastname)
				INTO @narration;
				CALL `sp_saveaudittrailentry`($userid,'update',@narration,$platform,'','',NULL);
			end if;
		commit;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteuser` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteuser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteuser`(`$id` INT, `$userid` INT)
BEGIN
	update `user` set `accountactive`=0,`lastmodifiedon`=now(),`lastmodifiedby`=$userid, `reasoninactive`='Account deleted'
	where `id`=$id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_disableuseraccount` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_disableuseraccount` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_disableuseraccount`(`$id` INT, `$reason` VARCHAR(500), `$userid` INT,$platform varchar(1000))
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
		
		CALL `sp_saveaudittrailentry`($userid,'Update',@narration,$platform,'','',NULL);
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_enableuseraccount` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_enableuseraccount` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_enableuseraccount`(`$id` INT,`$userid` INT,$platform varchar(1000))
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
	
	CALL `sp_saveaudittrailentry`($userid,'Update',@narration,$platform,'','',NULL);
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getallusers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getallusers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getallusers`()
BEGIN
	select u.*, ifnull(concat(a.firstname,' ',a.middlename,' ',a.lastname),'System') as addedbyname 
	from `user` u  left OUTER join `user` a on u.addedby=a.userid -- where u.`accountactive`=1 
	order by u.`firstname`,u.`middlename`,u.`lastname`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getinbuiltsystemuser` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getinbuiltsystemuser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getinbuiltsystemuser`()
BEGIN
		select * from `user`
		where systemlabel='INBUILT SYSTEM ACCOUNT';
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getnonuserroles` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getnonuserroles` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getnonuserroles`($userid int)
BEGIN
	select * from `roles` 
	where roleid not in(select `roleid` from `roleusers` where `userid`=$userid)
	order by rolename;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getroles` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getroles` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getroles`()
BEGIN
		select * from `roles`
		where `deleted`=0
		order by `rolename`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getrolesforuserassignment` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getrolesforuserassignment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getrolesforuserassignment`()
BEGIN
	select `roleid`,`rolename` from `roles` order by `rolename`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getroleusers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getroleusers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getroleusers`(`$roleid` INT)
BEGIN
	select r.`userid`, `username`,`firstname`,`middlename`,`lastname` from `roleusers` r, `user` u
	where r.`userid`=u.`id` and `roleid`=$roleid
	order by `firstname`,`middlename`,`lastname`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getuserbyid` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getuserbyid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getuserbyid`(`$userid` INT)
BEGIN
	select * from `user` where `userid`=$userid;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getuserdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getuserdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getuserdetails`(`$username` VARCHAR(50))
BEGIN
	select `companyname`,`supportemail`,`supportphone` 
	into @companyname,@supportemail,@supportphone from `institution`;
	
	select *,@companyname as companyname , @supportemail supportemail, @supportphone supportphone,
	ifnull((select `staffno` from `employeerecords` where `employeeid`=u.employeeid),'') staffno
	from `user` u WHERE `username`=$username;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getuserdetailsbyusername` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getuserdetailsbyusername` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getuserdetailsbyusername`($username varchar(100))
BEGIN
		select * from `user` where username=$username;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getusernamefromuserid` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getusernamefromuserid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getusernamefromuserid`(`$userid` INT)
BEGIN
	select * from `user` where `userid`=$userid;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getuserovertimeapprovalprivileges` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getuserovertimeapprovalprivileges` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getuserovertimeapprovalprivileges`($userid int)
BEGIN
		select * from `overtimeapprovalusers`
		where `userid`=$userid and `allowed`=1;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getuserprivileges` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getuserprivileges` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getuserprivileges`(`$userid` INT)
BEGIN
	select * from `userprivileges` where userid=$userid;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getuserrecruitmentprivileges` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getuserrecruitmentprivileges` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getuserrecruitmentprivileges`($userid int)
BEGIN
		select * 
		from `recruitmentrequisitionapprovalusers`
		where `userid`=$userid and `valid`=1;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getuserroles` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getuserroles` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getuserroles`(`$userid` INT)
BEGIN
	select r.* , u.id from `roles` r, `roleusers` u
	where r.`roleid`=u.`roleid` and `userid`=$userid
	and ifnull(u.`deleted`,0)=0
	order by `rolename`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getuserunits` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getuserunits` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getuserunits`($userid int)
BEGIN
		select u.*, unitname, companyname
		from `userunits` u
		join `units` n on n.unitid=u.unitid
		join `companies` c on c.companyid=n.companyid
		where u.userid=$userid and u.allowed=1
		order by companyname,unitname;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_removeusercompany` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_removeusercompany` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_removeusercompany`($userunitid int, $addedby int,$platform varchar(1000))
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
		
		CALL `sp_saveaudittrailentry`($addedby,'deleted',@narration,$platform,'','',NULL); 
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_removeuserrole` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_removeuserrole` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_removeuserrole`($userroleid int,$userid int,$platform varchar(1000))
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
			
			CALL `sp_saveaudittrailentry`($userid,'Delete',@narration,$platform,'','',NULL); 
		commit;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveroleusers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveroleusers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveroleusers`(`$userid` INT, `$roleid` INT, `$addedby` INT)
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
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveuser` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveuser` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveuser`(`$userid` INT, `$userpassword` VARCHAR(100),$salt varchar(50),`$roleid` int, `$username` VARCHAR(50), `$firstname` VARCHAR(50), `$middlename` VARCHAR(50), `$lastname` VARCHAR(50), `$email` VARCHAR(50), `$mobile` VARCHAR(50), 
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
		CALL `sp_saveaudittrailentry`($userid,'Insert',@narration,$platform,'','',null);
		-- end
	else
		CALL `sp_gettabledata`('user','userid',$userid,@originalvalues);
		
		update `user` 
		set `username`=$username,`firstname`=$firstname,`middlename`=$middlename,`lastname`=$lastname,`email`=$email,`mobile`=$mobile,
		/*`changepasswordonlogon`=$changepasswordonlogon,`accountactive`=$accountactive, `salt`=$salt,*/
		`roleid`=$roleid,`lastmodifiedby`=$addedby,`lastmodifiedon`=NOW()
		WHERE `userid`=$userid;
		
		CALL `sp_gettabledata`('user','userid',$userid,@currentvalues);
		
		if @originalvalues<>@currentvalues then
			SET @narration=CONCAT('Updated details of user id ',$userid); 
			CALL `sp_saveaudittrailentry`($addedby,'Update',@narration,$platform,@originalvalues,@currentvalues,null);
		end if;
	END IF;
	
	SELECT $userid AS `userid`;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveuserprivilege` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveuserprivilege` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveuserprivilege`(`$userid` INT, `$objectid` INT, `$allowed` BIT, `$useradding` INT)
BEGIN
	if not exists(select * from `userprivileges` where `objectid`=$objectid and `userid`=$userid) then
		insert into `userprivileges`(`objectid`,`userid`,`allowed`,`dateadded`,`addedby`)
		values($objectid,$userid,$allowed,now(),$useradding);
	else
		update `userprivileges` set `allowed`=$allowed, `lastdateupdated`=now(),`lastupdatedby`=$useradding 
		WHERE `objectid`=$objectid AND `userid`=$userid;
	end if ;
		
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveuserunit` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveuserunit` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveuserunit`($userid int,$unitid int,$allowed bool,$addedby int,$platform varchar(1000))
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
				
				CALL `sp_saveaudittrailentry`($addedby,'deleted',@narration,$platform,'','',NULL);
			end if;
		else
			IF not EXISTS(SELECT * FROM `userunits` WHERE `userid`=$userid AND `unitid`=$unitid AND `allowed`=1) then
				insert into `userunits`(`userid`,`unitid`,`allowed`,`dateadded`,`addedby`)
				values($userid,$unitid,$allowed,now(),$addedby);
				
				select concat('Granted user id:',$userid,' name:',$username,' access to unit id:',$unitid,' name:',unitname)
				into @narration
				from `units` WHERE `unitid`=$unitid;
				
				CALL `sp_saveaudittrailentry`($addedby,'insert',@narration,$platform,'','',NULL);
			end if;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_validateuserprivilege` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_validateuserprivilege` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validateuserprivilege`(`$userid` INT, `$objectcode` varchar(50))
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
	
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
