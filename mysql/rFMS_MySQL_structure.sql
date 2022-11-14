-- --------------------------------------------------------
-- Host:                         192.168.1.160
-- Server versie:                10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Versie:              11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Structuur van  tabel rfms_reading.alerts wordt geschreven
CREATE TABLE IF NOT EXISTS `alerts` (
  `id` int(11) DEFAULT NULL,
  `vin` tinytext DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `message` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `origin` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.api_auth_type wordt geschreven
CREATE TABLE IF NOT EXISTS `api_auth_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT 'reference to authentication solution',
  `auth_script` text NOT NULL COMMENT 'name of script to start',
  `auth_type` char(50) DEFAULT NULL COMMENT 'authenticationtype',
  `add_to` text NOT NULL COMMENT '2 values header or query params',
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.api_collector wordt geschreven
CREATE TABLE IF NOT EXISTS `api_collector` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(50) DEFAULT NULL,
  `typeId` int(3) DEFAULT NULL,
  `apiCustomerName` varchar(50) DEFAULT NULL,
  `ApiType` varchar(50) DEFAULT NULL,
  `vendor` varchar(50) DEFAULT NULL,
  `lastUpdateDateTime` timestamp NULL DEFAULT NULL,
  `BaseUrl` varchar(70) DEFAULT NULL,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `auth_type` varchar(50) DEFAULT NULL,
  `clientId` text DEFAULT NULL,
  `secret` text DEFAULT NULL,
  `proxy_host` varchar(50) DEFAULT NULL,
  `proxy_port` int(11) DEFAULT NULL,
  `contactName` varchar(50) DEFAULT NULL,
  `contactemail` varchar(50) DEFAULT NULL,
  `contactPhone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Settings API-MANAGER per interface';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.api_collector_tokens wordt geschreven
CREATE TABLE IF NOT EXISTS `api_collector_tokens` (
  `id` int(11) NOT NULL COMMENT 'collector_id',
  `challenge` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'wether to use challange proces',
  `authorizeUrl` text DEFAULT NULL,
  `tokenUrl` text DEFAULT NULL,
  `refreshUrl` text DEFAULT NULL,
  `token` text NOT NULL,
  `tokenDT` timestamp NULL DEFAULT NULL COMMENT 'timestamp expiration',
  `tokenLT` int(6) DEFAULT 3600 COMMENT 'Lifetime 1hour (minus 2 minutes)',
  `refreshToken` text DEFAULT NULL,
  `refreshTokenDT` timestamp NULL DEFAULT NULL COMMENT 'timestamp exiration',
  `refreshTokenLT` int(6) DEFAULT 86400 COMMENT 'Lifetime 24 hours (min 10 minutes)',
  `headerContent` text DEFAULT NULL,
  `created` timestamp NULL DEFAULT current_timestamp(),
  `updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  KEY `collector_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.api_scheduler wordt geschreven
CREATE TABLE IF NOT EXISTS `api_scheduler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collector_id` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 1,
  `running` tinyint(1) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `name_EndPoint` varchar(100) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL COMMENT 'api_scriptType_id',
  `scriptTypeId` int(11) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `lastExecution` datetime DEFAULT NULL,
  `lastStatus` varchar(12) DEFAULT '0',
  `url_ext` text DEFAULT NULL,
  `lastUpdateDateTime` datetime(6) DEFAULT NULL COMMENT 'needed to store last succesfull request',
  `edited` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `edited_by` int(12) DEFAULT NULL COMMENT 'UserID',
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_EndPoint` (`name_EndPoint`),
  KEY `Index 2` (`collector_id`,`scriptTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.api_script_type wordt geschreven
CREATE TABLE IF NOT EXISTS `api_script_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  `protocol` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `version` varchar(12) CHARACTER SET utf8mb4 DEFAULT NULL,
  `script` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `url_ext` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `header` text CHARACTER SET utf8mb4 DEFAULT NULL,
  `installed` tinyint(1) DEFAULT NULL,
  `typeId` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.api_type wordt geschreven
CREATE TABLE IF NOT EXISTS `api_type` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COMMENT='defines the different type of interfaces/services';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.audit wordt geschreven
CREATE TABLE IF NOT EXISTS `audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `page` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ip` varchar(255) NOT NULL,
  `viewed` int(1) NOT NULL,
  `cause` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.backlog wordt geschreven
CREATE TABLE IF NOT EXISTS `backlog` (
  `requestDateTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `messageDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `receivedDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `backlog` time NOT NULL,
  `databacklog` time NOT NULL,
  `Endpoint` varchar(24) NOT NULL,
  `AddedDateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  KEY `requestDateTime` (`requestDateTime`,`messageDateTime`,`Endpoint`) USING BTREE,
  KEY `AddedTime` (`AddedDateTime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.countries wordt geschreven
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(50) NOT NULL DEFAULT '',
  `language_id` int(11) DEFAULT NULL,
  `lp_color` varchar(50) DEFAULT 'yellow',
  `lp_lettercolor` varchar(50) DEFAULT 'black',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.customers wordt geschreven
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `accountnumber` varchar(19) DEFAULT NULL,
  `name` varchar(74) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `service_Homedealer` varchar(60) DEFAULT NULL,
  `IsDealer` int(6) DEFAULT NULL COMMENT 'Linked to dealer of group is dealer',
  PRIMARY KEY (`id`),
  UNIQUE KEY `accountnumber` (`accountnumber`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.customer_trailers wordt geschreven
CREATE TABLE IF NOT EXISTS `customer_trailers` (
  `client` varchar(8) DEFAULT NULL,
  `vin` varchar(17) DEFAULT NULL,
  `firstregistrationdate` timestamp NOT NULL DEFAULT curdate(),
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `VinUnique` (`vin`) USING BTREE,
  KEY `idx_VinClient` (`client`,`vin`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.datetable wordt geschreven
CREATE TABLE IF NOT EXISTS `datetable` (
  `_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.dealers_daf wordt geschreven
CREATE TABLE IF NOT EXISTS `dealers_daf` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `Category` varchar(6) NOT NULL,
  `location` int(6) NOT NULL DEFAULT 0,
  `api_details` tinyint(1) NOT NULL DEFAULT 0,
  `name` text NOT NULL,
  `code` text NOT NULL,
  `website` text NOT NULL,
  `reference_city` text NOT NULL,
  `estate` text NOT NULL,
  `highway` text NOT NULL,
  `its_24hours` int(1) NOT NULL,
  `its_trailer` int(1) NOT NULL,
  `its_bus` int(1) NOT NULL,
  `first_choice` int(1) NOT NULL,
  `TRP` int(1) NOT NULL,
  `Communication` text NOT NULL,
  `Address` text NOT NULL,
  `rof_code` varchar(26) NOT NULL,
  `rof_description` varchar(26) NOT NULL,
  `vat_rate` varchar(6) NOT NULL,
  `Person` text NOT NULL,
  `CompanyBusiness` text NOT NULL,
  `Openinghour` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Dealer_ID` (`id`,`location`)
) ENGINE=InnoDB AUTO_INCREMENT=970 DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.driver wordt geschreven
CREATE TABLE IF NOT EXISTS `driver` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `tachoDriverIdentification` varchar(16) NOT NULL,
  `Validity` date NOT NULL,
  `driverLicenseId` varchar(24) NOT NULL DEFAULT '0',
  `driverLicenseValidity` date NOT NULL,
  `CCIndex` int(1) unsigned NOT NULL,
  `CReplIndex` int(1) NOT NULL,
  `CRenewIndex` int(1) NOT NULL,
  `Lastname` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `Surname` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `eMail` varchar(64) NOT NULL,
  `Phone_Home` varchar(16) NOT NULL,
  `Phone_Mobile` varchar(16) NOT NULL,
  `Address` varchar(64) NOT NULL,
  `Housenumber` varchar(8) NOT NULL,
  `Zipcode` varchar(8) NOT NULL,
  `City` varchar(28) NOT NULL,
  `Country` varchar(28) NOT NULL,
  `DateCreated` datetime DEFAULT current_timestamp(),
  `CurrentStatus` varchar(26) NOT NULL,
  `StatusDate` datetime NOT NULL,
  `LastDriverActivity` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `LastVehicle` varchar(19) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_tachoDriverIdentification` (`tachoDriverIdentification`) USING BTREE,
  KEY `Driver_Query` (`LastVehicle`) USING BTREE,
  KEY `idx_lastdrivers` (`LastDriverActivity`)
) ENGINE=InnoDB AUTO_INCREMENT=10379431 DEFAULT CHARSET=utf8 COMMENT='Holds all registered Drivers based on recovered DriverID''s not TACHO ID''s. Data can be enriched via interface';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.driverstatus wordt geschreven
CREATE TABLE IF NOT EXISTS `driverstatus` (
  `vin` varchar(17) NOT NULL,
  `createdDateTime` timestamp NULL DEFAULT NULL,
  `workingstate` varchar(24) NOT NULL,
  `driverId` varchar(19) NOT NULL,
  `driver1` tinyint(1) NOT NULL,
  KEY `idx_driverId_createdDateTime` (`driverId`,`createdDateTime`,`vin`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.drivetimes wordt geschreven
CREATE TABLE IF NOT EXISTS `drivetimes` (
  `driverId` varchar(16) NOT NULL,
  `DriveDate` date NOT NULL,
  `drive` int(11) DEFAULT 0,
  `work` int(11) DEFAULT 0,
  `available` int(11) DEFAULT 0,
  `rest` int(11) DEFAULT 0,
  `EXTRATIME` tinyint(1) NOT NULL DEFAULT 0,
  `SHORTREST` tinyint(1) NOT NULL DEFAULT 0,
  `INFRIGMENT` tinyint(1) NOT NULL DEFAULT 0,
  `lastUpdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `corrected` tinyint(4) NOT NULL DEFAULT 0,
  UNIQUE KEY `idx_drivetimes` (`DriveDate`,`driverId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='registering used drivetime per user on daily basis, checking legislation after each trip and regiser usage and infrigment ';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.email wordt geschreven
CREATE TABLE IF NOT EXISTS `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settings_id` int(11) DEFAULT NULL,
  `website_name` varchar(100) NOT NULL,
  `smtp_server` varchar(100) NOT NULL,
  `smtp_port` int(10) NOT NULL,
  `email_login` varchar(150) NOT NULL,
  `email_pass` varchar(100) NOT NULL,
  `from_name` varchar(100) NOT NULL,
  `from_email` varchar(150) NOT NULL,
  `transport` varchar(255) NOT NULL,
  `verify_url` varchar(255) NOT NULL,
  `email_act` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.famreport wordt geschreven
CREATE TABLE IF NOT EXISTS `famreport` (
  `client` varchar(8) DEFAULT NULL,
  `vin` varchar(17) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `obu_serial` varchar(50) DEFAULT NULL,
  `obu_sw_version` varchar(50) DEFAULT NULL,
  UNIQUE KEY `VinUnique` (`vin`,`client`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.famreport_backup wordt geschreven
CREATE TABLE IF NOT EXISTS `famreport_backup` (
  `client` varchar(8) DEFAULT NULL,
  `vin` varchar(17) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `obu_serial` varchar(50) DEFAULT NULL,
  `obu_sw_version` varchar(50) DEFAULT NULL,
  UNIQUE KEY `VinUnique` (`vin`,`client`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.fuelcard_status wordt geschreven
CREATE TABLE IF NOT EXISTS `fuelcard_status` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(128) DEFAULT NULL,
  `driver_id` int(12) DEFAULT NULL,
  `vehicle_id` int(12) DEFAULT 0,
  `fueltype` tinyint(2) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT NULL,
  `totalCosts` decimal(10,2) DEFAULT NULL,
  `totalCostsCurrency` tinyint(3) DEFAULT NULL,
  `volume` decimal(10,2) DEFAULT NULL,
  `volumeType` tinyint(3) DEFAULT NULL,
  `locationName` varchar(50) DEFAULT NULL,
  `locationLat` decimal(12,7) DEFAULT NULL,
  `locationLng` decimal(12,7) DEFAULT NULL,
  `odometer` int(12) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `notes` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vehicle_driver_date` (`vehicle_id`,`driver_id`,`createdDateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.fueltype wordt geschreven
CREATE TABLE IF NOT EXISTS `fueltype` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT COMMENT 'FuelType based on SPN5738',
  `Description` varchar(50) NOT NULL,
  `Factor` decimal(8,0) NOT NULL COMMENT 'Calculationfactor per liter in KG',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='For each fueltype providing the correct emissionlevel factor for CO2 calculations';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.geofence_cat wordt geschreven
CREATE TABLE IF NOT EXISTS `geofence_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.geofence_def wordt geschreven
CREATE TABLE IF NOT EXISTS `geofence_def` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type_id` int(11) DEFAULT 1,
  `scope` tinyint(2) DEFAULT 1 COMMENT '0=system, 1=personal, 2=public',
  `category` int(11) DEFAULT 1,
  `client` char(12) DEFAULT NULL,
  `geojson` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`geojson`)),
  `geojsonfile` varchar(128) DEFAULT ' ',
  `createdBy` int(11) DEFAULT NULL,
  `createdDateTime` timestamp NULL DEFAULT current_timestamp(),
  `updateDateTime` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `createdBy` (`createdBy`,`client`,`active`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.geofence_log wordt geschreven
CREATE TABLE IF NOT EXISTS `geofence_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `geofence_id` int(11) DEFAULT NULL,
  `vin` char(17) DEFAULT NULL,
  `status` char(17) DEFAULT NULL,
  `previousStatus` char(17) DEFAULT NULL,
  `registration` text DEFAULT NULL,
  `alert` text DEFAULT NULL,
  `latitude` decimal(12,7) DEFAULT NULL,
  `longitude` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `geofence_id` (`geofence_id`,`vin`)
) ENGINE=InnoDB AUTO_INCREMENT=754 DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.geofence_reg wordt geschreven
CREATE TABLE IF NOT EXISTS `geofence_reg` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT 'geofence id',
  `vin` varchar(17) DEFAULT NULL,
  `geofence_id` int(12) DEFAULT NULL,
  `status` char(50) DEFAULT 'new',
  `prio` text DEFAULT NULL,
  `registration` text DEFAULT NULL,
  `range` int(11) DEFAULT 200 COMMENT 'range in meters',
  `alert` text DEFAULT NULL,
  `createTrigger` tinyint(1) NOT NULL DEFAULT 0,
  `latitude` decimal(15,9) unsigned DEFAULT 0.000000000,
  `longitude` decimal(15,9) unsigned DEFAULT 0.000000000,
  `createdDateTime` timestamp NULL DEFAULT current_timestamp(),
  `lastUpdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `vin` (`vin`,`geofence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=652 DEFAULT CHARSET=utf8 COMMENT='registration of matching geofence registration';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.geofence_type wordt geschreven
CREATE TABLE IF NOT EXISTS `geofence_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `notify_inside` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.groups wordt geschreven
CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `accountnumber` varchar(19) DEFAULT NULL,
  `name` varchar(74) DEFAULT NULL,
  `country_id` varchar(14) CHARACTER SET utf8 DEFAULT NULL,
  `serviceHomedealer` varchar(60) DEFAULT NULL,
  `grouptype_id` int(11) DEFAULT NULL,
  `pdc_template_id` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT curdate(),
  `createdby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `accountnumber` (`accountnumber`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.grouptype wordt geschreven
CREATE TABLE IF NOT EXISTS `grouptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `created` timestamp NULL DEFAULT curdate(),
  `createdby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='enabling typ of driving per group (longhaul, distribition, city, local)';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.groupvehicle wordt geschreven
CREATE TABLE IF NOT EXISTS `groupvehicle` (
  `client` varchar(8) DEFAULT NULL,
  `vin` varchar(17) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `obu_serial` varchar(50) DEFAULT NULL,
  `obu_sw_version` varchar(50) DEFAULT NULL,
  UNIQUE KEY `VinUnique` (`vin`,`client`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.groupvehiclecount wordt geschreven
CREATE TABLE IF NOT EXISTS `groupvehiclecount` (
  `CreateDate` date NOT NULL,
  `accountnumber` varchar(19) NOT NULL,
  `VehicleCount` int(4) DEFAULT NULL,
  UNIQUE KEY `idx_groupvehiclecount_CreatedDate_accountnumber` (`CreateDate`,`accountnumber`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.keys wordt geschreven
CREATE TABLE IF NOT EXISTS `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stripe_ts` varchar(255) NOT NULL,
  `stripe_tp` varchar(255) NOT NULL,
  `stripe_ls` varchar(255) NOT NULL,
  `stripe_lp` varchar(255) NOT NULL,
  `recap_pub` varchar(100) NOT NULL,
  `recap_pri` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.language wordt geschreven
CREATE TABLE IF NOT EXISTS `language` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `decription` varchar(50) DEFAULT NULL,
  `locale` varchar(12) DEFAULT NULL,
  `countrycode` int(4) DEFAULT 1,
  `enabled` tinyint(1) DEFAULT 0,
  `created` varchar(50) NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`id`),
  KEY `Search` (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.maintenance_register wordt geschreven
CREATE TABLE IF NOT EXISTS `maintenance_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` date NOT NULL,
  `dealerId` varchar(16) DEFAULT NULL,
  `vehicle` varchar(17) DEFAULT NULL,
  `trailer` varchar(19) DEFAULT NULL,
  `actual_vehicle_milage` int(12) DEFAULT NULL,
  `next_service_milage` int(12) DEFAULT NULL,
  `next_service_date` date DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `damages` tinyint(2) NOT NULL DEFAULT 0,
  `reference` varchar(50) NOT NULL DEFAULT '0',
  `add_notes` mediumtext NOT NULL,
  `checklist` mediumtext NOT NULL,
  `signature` varchar(128) NOT NULL DEFAULT '0',
  `checked` int(3) NOT NULL DEFAULT 0,
  `invoice_id` varchar(48) NOT NULL DEFAULT '0',
  `invoice_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `approvedFm` int(11) NOT NULL DEFAULT 0,
  `approvedDate` datetime DEFAULT NULL,
  `fm_Id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.messages wordt geschreven
CREATE TABLE IF NOT EXISTS `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_from` int(11) NOT NULL,
  `msg_body` text NOT NULL,
  `msg_read` int(1) NOT NULL,
  `msg_thread` int(11) NOT NULL,
  `deleted` int(1) NOT NULL,
  `reponse` char(12) DEFAULT NULL,
  `sent_on` datetime NOT NULL DEFAULT current_timestamp(),
  `edited` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `read` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_Messages` (`msg_from`,`msg_thread`)
) ENGINE=InnoDB AUTO_INCREMENT=476 DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.message_threads wordt geschreven
CREATE TABLE IF NOT EXISTS `message_threads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_from` int(11) NOT NULL,
  `msg_to` int(11) NOT NULL,
  `msg_subject` varchar(255) NOT NULL,
  `last_update` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_update_by` int(11) NOT NULL,
  `archived` tinyint(1) DEFAULT 0,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_Thread` (`msg_to`,`msg_from`,`archived`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.message_thread_pinned wordt geschreven
CREATE TABLE IF NOT EXISTS `message_thread_pinned` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_thread` (`thread_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.mot_register wordt geschreven
CREATE TABLE IF NOT EXISTS `mot_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL,
  `dealerId` varchar(16) DEFAULT NULL,
  `vehicle` varchar(17) DEFAULT NULL,
  `trailer` varchar(19) DEFAULT NULL,
  `actual_vehicle_milage` int(12) DEFAULT NULL,
  `next_service_milage` int(12) DEFAULT NULL,
  `first_registration_date` datetime DEFAULT NULL,
  `next_service_date` date DEFAULT NULL,
  `tachograph_revoke_date` date DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `reference` varchar(50) NOT NULL DEFAULT '0' COMMENT 'CertificateNumber',
  `damages` tinyint(2) NOT NULL DEFAULT 0,
  `add_notes` mediumtext NOT NULL,
  `checklist` mediumtext NOT NULL,
  `signature` varchar(128) NOT NULL DEFAULT '0',
  `checked` int(3) NOT NULL DEFAULT 0,
  `invoice_id` varchar(48) NOT NULL DEFAULT '0',
  `invoice_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `approvedFm` int(11) NOT NULL DEFAULT 0,
  `approvedDate` datetime DEFAULT NULL,
  `fm_Id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `VIN` (`vehicle`)
) ENGINE=InnoDB AUTO_INCREMENT=6971 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.mot_type wordt geschreven
CREATE TABLE IF NOT EXISTS `mot_type` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `frequency_days` int(11) DEFAULT NULL,
  `frequency_km` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT curdate(),
  `createdby` int(11) DEFAULT NULL COMMENT 'UserId'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.notification wordt geschreven
CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(120) NOT NULL,
  `messagegroup` varchar(16) DEFAULT NULL COMMENT 'Client relation customer',
  `notificationHeader` text NOT NULL,
  `notificationInfo` text NOT NULL,
  `notificationType` varchar(12) NOT NULL,
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `desktop` tinyint(1) NOT NULL DEFAULT 0,
  `startPublish` date NOT NULL DEFAULT current_timestamp(),
  `endPublish` date NOT NULL,
  `archive` tinyint(1) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `created_By` int(11) DEFAULT NULL,
  UNIQUE KEY `ID` (`id`),
  KEY `Notification` (`startPublish`,`endPublish`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Holds notification to be shown at login based on publication/release date''s';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.pages wordt geschreven
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(100) NOT NULL,
  `private` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=547 DEFAULT CHARSET=utf8 COMMENT='Holds all authorised pages to control access';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.pages_redirect wordt geschreven
CREATE TABLE IF NOT EXISTS `pages_redirect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pages_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `name` char(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=524 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Holds all authorised pages to control access';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.pdc_categories wordt geschreven
CREATE TABLE IF NOT EXISTS `pdc_categories` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) DEFAULT 'name of new category',
  `cat_description` text DEFAULT NULL,
  `cat_type_id` int(11) DEFAULT 1,
  `cat_icon` varchar(50) NOT NULL,
  `cat_icon_type` varchar(1) NOT NULL COMMENT 'In case of a subcategory, the maincategory_ID is shown and maincategory should by false',
  `template_id` int(10) NOT NULL DEFAULT 0,
  `language` int(3) NOT NULL DEFAULT 1,
  `active` tinyint(1) DEFAULT 1,
  `createdby` tinyint(1) DEFAULT 1,
  `created` timestamp NULL DEFAULT curdate(),
  PRIMARY KEY (`id`),
  KEY `idx_cat_lang` (`id`,`language`,`template_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8 COMMENT='Categories of damages';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.pdc_checkitems wordt geschreven
CREATE TABLE IF NOT EXISTS `pdc_checkitems` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `check` text DEFAULT NULL COMMENT 'item on checklist',
  `description` text DEFAULT NULL,
  `cat_id` int(12) DEFAULT NULL COMMENT 'main category',
  `subcat_id` int(12) DEFAULT NULL,
  `template_id` int(12) NOT NULL,
  `language` int(11) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL DEFAULT curdate(),
  `createdby` int(12) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Categories of damages';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.pdc_damage wordt geschreven
CREATE TABLE IF NOT EXISTS `pdc_damage` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `vin` varchar(17) NOT NULL DEFAULT '0',
  `driver` varchar(16) NOT NULL DEFAULT '0',
  `trailer` varchar(16) NOT NULL DEFAULT '0',
  `UserID` int(12) NOT NULL DEFAULT 0,
  `RegisterID` int(12) NOT NULL DEFAULT 0,
  `odometer` int(12) NOT NULL DEFAULT 0 COMMENT 'in km',
  `eventID` int(12) NOT NULL DEFAULT 0,
  `description` varchar(124) NOT NULL DEFAULT 'write here the description of the damage',
  `severity` int(1) NOT NULL DEFAULT 99,
  `status` int(12) NOT NULL DEFAULT 0,
  `evidence_picture` varchar(24) NOT NULL DEFAULT '0',
  `createdDateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `repairStatus` int(11) NOT NULL DEFAULT 0,
  `repairDateTime` timestamp NULL DEFAULT NULL,
  `repairApproved` int(11) DEFAULT NULL COMMENT 'UserId of Approval',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_DamageVinDriver` (`vin`,`driver`,`repairStatus`,`eventID`,`createdDateTime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.pdc_damageitems wordt geschreven
CREATE TABLE IF NOT EXISTS `pdc_damageitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(125) NOT NULL DEFAULT 'new title',
  `event_description` text NOT NULL,
  `cat_id` int(12) DEFAULT 0,
  `subcat_id` int(12) DEFAULT 0,
  `template_id` int(12) NOT NULL DEFAULT 0 COMMENT 'ID of the Group, by default it is all (''*'')',
  `severity` int(1) NOT NULL DEFAULT 0 COMMENT '0=informal,1=no driving,2=degrated functionality, 3=loss of functionality',
  `type` varchar(12) NOT NULL DEFAULT '*' COMMENT 'Type of vehicle, default is all (''*'')',
  `langauge` int(3) NOT NULL DEFAULT 1,
  `createdDateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `createdBy` int(11) DEFAULT 0 COMMENT 'UserId of Creator',
  PRIMARY KEY (`id`),
  KEY `idx_cat_subcat_lang` (`cat_id`,`subcat_id`,`langauge`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2002 DEFAULT CHARSET=utf8 COMMENT='all posisble registered events';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.pdc_policies wordt geschreven
CREATE TABLE IF NOT EXISTS `pdc_policies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `group` varchar(12) DEFAULT '*',
  `template_id` int(11) DEFAULT 0,
  `report_user_id` int(11) DEFAULT 0,
  `time_policy_days` int(4) DEFAULT 0,
  `trip_policy_count` int(4) DEFAULT 0,
  `distance_policy_km` int(11) DEFAULT 0,
  `created` timestamp NULL DEFAULT curdate(),
  `createdby` int(11) DEFAULT 0,
  `active` tinyint(4) DEFAULT 1,
  `system` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='Enforcement of PDC policy per group or default';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.pdc_register wordt geschreven
CREATE TABLE IF NOT EXISTS `pdc_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdDate` datetime NOT NULL DEFAULT curdate(),
  `driver` varchar(16) DEFAULT NULL,
  `vehicle` varchar(17) DEFAULT NULL,
  `trailer` varchar(25) DEFAULT NULL,
  `vehicle_odometer` int(12) DEFAULT NULL,
  `vehicle_warning` tinyint(4) NOT NULL DEFAULT 0,
  `template` tinyint(4) NOT NULL DEFAULT 0,
  `critical_damages` tinyint(2) NOT NULL DEFAULT 0,
  `damages` tinyint(2) NOT NULL DEFAULT 0,
  `add_notes` varchar(128) NOT NULL DEFAULT '0',
  `signature` varchar(128) NOT NULL DEFAULT '0',
  `checklist` longtext CHARACTER SET utf8 NOT NULL,
  `repaired` tinyint(4) DEFAULT NULL,
  `checked` tinyint(4) NOT NULL DEFAULT 0,
  `fmInformed` tinyint(4) NOT NULL DEFAULT 0,
  `approvedFm` tinyint(4) NOT NULL DEFAULT 0,
  `approvedDate` datetime DEFAULT NULL,
  `fm_Id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_Vehicle_Date` (`createdDate`,`vehicle`),
  KEY `IDX_Driver_Date` (`driver`,`createdDate`),
  KEY `IDX_Template_Date` (`template`,`createdDate`),
  KEY `IDX_Active_Damages` (`vehicle`,`trailer`,`repaired`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.pdc_subcategories wordt geschreven
CREATE TABLE IF NOT EXISTS `pdc_subcategories` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `cat_id` int(12) NOT NULL COMMENT 'In case of a subcategory, the maincategory_ID is shown and maincategory should by false',
  `subcat_name` varchar(50) DEFAULT 'name of new category',
  `subcat_description` text DEFAULT NULL,
  `subcat_icon` varchar(50) NOT NULL,
  `subcat_icon_type` varchar(1) DEFAULT NULL,
  `template_id` int(12) DEFAULT 0,
  `language` int(3) DEFAULT 0,
  `created` datetime DEFAULT curdate(),
  `createdby` int(12) DEFAULT NULL,
  `system` tinyint(1) DEFAULT 0,
  `active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`,`cat_id`) USING BTREE,
  KEY `idx_subcat_lang` (`cat_id`,`language`,`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Categories of damages';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.pdc_template wordt geschreven
CREATE TABLE IF NOT EXISTS `pdc_template` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `templateName` varchar(50) DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `vehicleType` int(11) DEFAULT NULL,
  `trailerEnabled` tinyint(4) DEFAULT NULL,
  `shortdescription` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `createdby` int(12) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `system` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.performancelog wordt geschreven
CREATE TABLE IF NOT EXISTS `performancelog` (
  `DateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `Endpoint` varchar(26) DEFAULT NULL,
  `Status` int(5) DEFAULT NULL COMMENT 'http status',
  `rt` decimal(10,4) DEFAULT NULL COMMENT 'response time in seconds',
  `rz` decimal(16,4) DEFAULT NULL COMMENT 'response size in bytes',
  `ro` int(6) DEFAULT NULL COMMENT 'response objects',
  `LD` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  KEY `Endpoint` (`DateTime`,`Endpoint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='...in development';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.permissions wordt geschreven
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` varchar(150) NOT NULL,
  `system` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='Roles / Permissions';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.permission_page_matches wordt geschreven
CREATE TABLE IF NOT EXISTS `permission_page_matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(15) NOT NULL,
  `page_id` int(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1416 DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.profiles wordt geschreven
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `bio` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.rel_cust_dealer wordt geschreven
CREATE TABLE IF NOT EXISTS `rel_cust_dealer` (
  `Cust_ID` varchar(12) DEFAULT NULL,
  `Dealer_ID` varchar(12) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT current_timestamp(),
  `CreatedByUser` int(8) DEFAULT NULL,
  KEY `IDX_Cust_Dealer` (`Cust_ID`,`Dealer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relation between customer to dealer. Customer grants access to dealer';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.rel_cust_user wordt geschreven
CREATE TABLE IF NOT EXISTS `rel_cust_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) DEFAULT NULL,
  `Cust_ID` varchar(9) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdatedDate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CreatedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Index 2` (`User_ID`,`Cust_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='relation table for customer and users. user as only 1 customer relation';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.rel_sub_cust wordt geschreven
CREATE TABLE IF NOT EXISTS `rel_sub_cust` (
  `CustId` varchar(12) DEFAULT NULL COMMENT 'Customer AccountNumber',
  `UserId` int(8) DEFAULT NULL,
  `CreatedDate` timestamp NULL DEFAULT NULL,
  `CreatedByUser` int(8) DEFAULT NULL,
  KEY `IDX_Sub_Cust` (`CustId`,`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='relation for user having access to more than one customer (subscribed customer)';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.rel_user_role wordt geschreven
CREATE TABLE IF NOT EXISTS `rel_user_role` (
  `user_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `cust_id` varchar(9) DEFAULT NULL,
  `createdDate` timestamp NULL DEFAULT current_timestamp(),
  `updatedDate` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.reporting wordt geschreven
CREATE TABLE IF NOT EXISTS `reporting` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `createdDateTime` datetime DEFAULT current_timestamp(),
  `system` tinyint(1) unsigned zerofill DEFAULT NULL,
  `name` varchar(90) DEFAULT '0',
  `description` varchar(220) DEFAULT '0',
  `script` varchar(25) DEFAULT '0',
  `type` varchar(25) DEFAULT '0',
  `orientation` char(1) DEFAULT 'P' COMMENT 'Portrait of Landscape',
  `mailsubject` varchar(50) DEFAULT NULL,
  `colorSchema` varchar(50) DEFAULT 'blue',
  `attachmentType` varchar(5) DEFAULT 'PDF' COMMENT 'PDF,CSV or BOTH',
  `changeDatetime` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `permissionlevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='list of available reports\r\n';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.reporting_queries wordt geschreven
CREATE TABLE IF NOT EXISTS `reporting_queries` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `report_id` int(12) NOT NULL DEFAULT 0,
  `queryName` varchar(128) NOT NULL,
  `queryDescription` varchar(128) NOT NULL,
  `query` mediumtext NOT NULL,
  `queryGrouping` tinyint(4) NOT NULL DEFAULT 0,
  `sequence` int(2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdBy` int(12) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_id` (`report_id`,`active`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='scripts used for a report';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.reporting_schedules wordt geschreven
CREATE TABLE IF NOT EXISTS `reporting_schedules` (
  `ID` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(24) DEFAULT NULL,
  `period` varchar(50) DEFAULT NULL COMMENT 'using datetimp definitions',
  `count` int(5) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Maintain all type of schedules';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.report_planning wordt geschreven
CREATE TABLE IF NOT EXISTS `report_planning` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT 'your report name' COMMENT 'Customer Report Name',
  `description` varchar(128) NOT NULL DEFAULT 'your report description' COMMENT 'Customer Report Description',
  `creator` int(11) NOT NULL DEFAULT 0 COMMENT 'User ->ID',
  `customer` varchar(19) NOT NULL DEFAULT '0' COMMENT 'Customer->AccountNumber',
  `report_type` int(6) NOT NULL DEFAULT 0 COMMENT 'Script to execute',
  `reporting_frequency` char(12) NOT NULL DEFAULT '7' COMMENT 'Number of days',
  `reporting_period` char(12) NOT NULL DEFAULT '7' COMMENT 'Number of days',
  `reporting_view` char(12) NOT NULL DEFAULT 'day',
  `startDate` date DEFAULT NULL,
  `nextRunDateTime` datetime NOT NULL,
  `lastRunDateTime` datetime DEFAULT NULL COMMENT 'Date laste succesfully executed',
  `domain` varchar(50) NOT NULL DEFAULT 'rFMSConnect.nl',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `extra_email` char(255) DEFAULT NULL COMMENT 'Max 4 email adresses and ; seperator',
  `createdDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `changedDateTime` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `creator` (`creator`,`customer`,`report_type`,`reporting_frequency`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COMMENT='All reportscripts planned';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.resource_groups wordt geschreven
CREATE TABLE IF NOT EXISTS `resource_groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(28) NOT NULL,
  `Description` text NOT NULL,
  `CreatedByUserID` int(11) NOT NULL,
  `ChangedByUserID` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `ChangeDate` datetime NOT NULL,
  `CreatedDT` date NOT NULL,
  PRIMARY KEY (`ID`,`Name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.resource_group_assign wordt geschreven
CREATE TABLE IF NOT EXISTS `resource_group_assign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(8) DEFAULT NULL,
  `resource_id` varchar(50) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_group_assign` (`resource_id`,`client`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.resource_types wordt geschreven
CREATE TABLE IF NOT EXISTS `resource_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `databasetable` varchar(128) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.scheduler wordt geschreven
CREATE TABLE IF NOT EXISTS `scheduler` (
  `id` int(11) DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `ip-address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Maintain status of scheduler';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.settings wordt geschreven
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `recaptcha` int(1) NOT NULL DEFAULT 0,
  `domain` varchar(50) NOT NULL DEFAULT '0',
  `customer_id` varchar(50) NOT NULL DEFAULT '0',
  `site_name` varchar(50) NOT NULL,
  `site_description` varchar(150) NOT NULL,
  `force_ssl` int(1) NOT NULL,
  `login_type` varchar(20) NOT NULL,
  `css_sample` int(1) NOT NULL,
  `us_css` varchar(100) NOT NULL DEFAULT 'StandardCompact.css',
  `allow_user_css` tinyint(1) NOT NULL DEFAULT 1,
  `style_css` varchar(50) NOT NULL DEFAULT 'floating_menu.css',
  `style_menu` tinyint(1) NOT NULL DEFAULT 0,
  `language` varchar(20) NOT NULL,
  `track_guest` int(1) NOT NULL,
  `site_offline` int(1) NOT NULL,
  `force_pr` int(1) unsigned NOT NULL,
  `reserved1` varchar(100) NOT NULL,
  `reserverd2` varchar(100) NOT NULL,
  `custom1` varchar(100) NOT NULL,
  `daysStatistics` int(11) NOT NULL DEFAULT 0,
  `DashboardVC` int(4) NOT NULL,
  `DashBoardType` int(4) NOT NULL DEFAULT 1,
  `glogin` int(1) NOT NULL DEFAULT 0,
  `fblogin` int(1) NOT NULL,
  `gid` varchar(255) NOT NULL,
  `gsecret` varchar(255) NOT NULL,
  `gredirect` varchar(255) NOT NULL,
  `ghome` varchar(255) NOT NULL,
  `fbid` varchar(255) NOT NULL,
  `fbsecret` varchar(255) NOT NULL,
  `fbcallback` varchar(255) NOT NULL,
  `graph_ver` varchar(255) NOT NULL,
  `finalredir` varchar(255) NOT NULL,
  `req_cap` int(1) NOT NULL,
  `req_num` int(1) NOT NULL,
  `min_pw` int(2) NOT NULL,
  `max_pw` int(3) NOT NULL,
  `min_un` int(2) NOT NULL,
  `max_un` int(3) NOT NULL,
  `max_pwa` int(3) DEFAULT 90,
  `emailpwa` tinyint(1) DEFAULT NULL,
  `frocepwr` tinyint(1) DEFAULT NULL,
  `messaging` int(1) NOT NULL,
  `snooping` int(1) NOT NULL,
  `echouser` int(11) NOT NULL,
  `wys` int(1) NOT NULL,
  `change_un` int(1) NOT NULL,
  `FooterText` text NOT NULL,
  `FooterActive` tinyint(4) NOT NULL DEFAULT 0,
  `Default_report_days` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'in days',
  `Minimum_trip_distance` int(11) NOT NULL DEFAULT 0 COMMENT 'in km',
  `ExcessiveIdling` int(3) DEFAULT NULL COMMENT 'in seconds',
  `SpeedingThreshold` int(3) DEFAULT NULL,
  `loginPhrase` text DEFAULT NULL,
  `licensed` varchar(50) DEFAULT NULL,
  `version` varchar(8) DEFAULT NULL,
  `reporting_enabled` tinyint(4) DEFAULT 0,
  `reporting_adaptiveDates` tinyint(4) DEFAULT 0,
  `report_description` char(120) DEFAULT NULL,
  `report_logo` varchar(50) DEFAULT NULL,
  `pdc_enabled` tinyint(1) DEFAULT 1,
  `pdc_reporting` tinyint(1) DEFAULT 1,
  `pdc_autoprocess` tinyint(1) DEFAULT 1,
  `sioc` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'show image on card',
  PRIMARY KEY (`id`,`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.settings_api wordt geschreven
CREATE TABLE IF NOT EXISTS `settings_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` text DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `activation_date` timestamp NULL DEFAULT NULL,
  `last_updated` timestamp(3) NULL DEFAULT '2020-01-01 00:00:00.000',
  `requestTime` timestamp(3) NULL DEFAULT NULL,
  `messageTime` timestamp(3) NULL DEFAULT NULL,
  `receiveTime` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.stat_delayed_count wordt geschreven
CREATE TABLE IF NOT EXISTS `stat_delayed_count` (
  `createdDate` timestamp NULL DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  KEY `Index 1` (`createdDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.trailers wordt geschreven
CREATE TABLE IF NOT EXISTS `trailers` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `vin` varchar(17) DEFAULT NULL,
  `vehicleVIN` varchar(17) DEFAULT NULL,
  `trailerName` char(28) CHARACTER SET utf8mb4 DEFAULT NULL,
  `brand` varchar(28) DEFAULT NULL,
  `Year` int(4) DEFAULT NULL,
  `type` varchar(24) DEFAULT NULL,
  `model` varchar(28) DEFAULT NULL,
  `LicensePlate` longtext DEFAULT NULL,
  `grossCombinationVehicleWeight` int(8) DEFAULT NULL,
  `serviceDistance` int(10) DEFAULT NULL,
  `copplingStatus` tinyint(1) DEFAULT NULL,
  `LastActivity` datetime DEFAULT NULL,
  `LastActivity_Diff` time DEFAULT NULL,
  `AddDateTime` datetime DEFAULT current_timestamp(),
  `UpdateDateTime` datetime DEFAULT NULL,
  `last_Latitude` decimal(10,6) DEFAULT NULL,
  `last_Longitude` decimal(10,6) DEFAULT NULL,
  `last_Heading` int(3) DEFAULT NULL,
  `last_Altitude` int(5) DEFAULT NULL,
  `tripActive` tinyint(1) DEFAULT NULL,
  `trailerActive` tinyint(1) DEFAULT NULL,
  `ambientAirTemperature` int(3) DEFAULT NULL,
  `currentSpeed` decimal(5,2) DEFAULT NULL,
  `noOfAxles` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `VIN` (`vin`),
  KEY `Vehicle_Index` (`trailerName`,`trailerActive`,`tripActive`) USING BTREE,
  KEY `Dashboard` (`vin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.trailerstatus wordt geschreven
CREATE TABLE IF NOT EXISTS `trailerstatus` (
  `vin` varchar(17) NOT NULL,
  `createdDateTime` datetime NOT NULL,
  `receivedDateTime` datetime NOT NULL,
  `triggerType` varchar(36) NOT NULL,
  `triggerContext` varchar(12) NOT NULL,
  `triggerInfo` varchar(48) NOT NULL,
  `hrTotalVehicleDistance` int(10) NOT NULL,
  `GNSS_latitude` decimal(12,6) NOT NULL,
  `GNSS_longitude` decimal(12,6) NOT NULL,
  `GNSS_altitude` int(6) NOT NULL,
  `GNSS_heading` int(3) NOT NULL,
  `GNSS_Speed` decimal(5,2) NOT NULL,
  `grossCombinationVehicleWeight` int(8) NOT NULL,
  `fuelLevel1` int(3) NOT NULL,
  `catalystFuelLevel` int(3) NOT NULL,
  `ambientAirTemperature` int(3) NOT NULL,
  `engineCoolantTemperature` int(3) NOT NULL,
  `serviceBrakeAirPressureCircuit1` int(7) NOT NULL,
  `serviceBrakeAirPressureCircuit2` int(7) NOT NULL,
  `serviceDistance` int(8) NOT NULL,
  `engineSpeed` decimal(5,2) NOT NULL,
  `enginePercentLoadCurrentSpeed` int(3) NOT NULL,
  `actualRetarderPercentTorque` int(3) NOT NULL,
  `acceleratorPedalPercentaccelerationCurrentSpeed` int(3) NOT NULL,
  `idleDuration` int(5) NOT NULL,
  `fuelUsed` int(5) NOT NULL,
  `totalEngineHours` int(12) NOT NULL,
  `AddedtoDB` datetime NOT NULL DEFAULT current_timestamp(),
  `BatteryPotentialPowerInput` int(6) NOT NULL,
  `EngineTotalIdleHours` int(12) NOT NULL,
  `EngineTotalIdleFuelUsed` int(12) NOT NULL,
  `TransmissionCurrentGear` int(2) NOT NULL,
  `SLIBatteryPackStateofCharge` int(3) NOT NULL,
  `RemainingCurrentDrivingTime` time NOT NULL,
  `RemDurationOfCurrentBreakRest` time NOT NULL,
  KEY `VIN_CreatedDT_TT` (`vin`,`createdDateTime`,`triggerType`) USING BTREE,
  KEY `IDX_DriverTrigger` (`triggerType`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='RAW-Vehicle_Data';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.trips wordt geschreven
CREATE TABLE IF NOT EXISTS `trips` (
  `Trip_NO` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `TripActive` tinyint(1) NOT NULL,
  `TripCalc` tinyint(1) NOT NULL,
  `TripDelayed` tinyint(1) NOT NULL,
  `TripCorrected` tinyint(1) NOT NULL,
  `TripSplit` tinyint(1) NOT NULL,
  `StartDate` datetime DEFAULT NULL,
  `start_latitude` decimal(12,6) DEFAULT NULL,
  `start_longitude` decimal(12,6) DEFAULT NULL,
  `start_odometer` int(12) DEFAULT NULL,
  `start_fuelused` int(12) DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `end_latitude` decimal(12,6) DEFAULT NULL,
  `end_longitude` decimal(12,6) DEFAULT NULL,
  `end_odometer` int(12) DEFAULT NULL,
  `end_fuelused` int(12) DEFAULT NULL,
  `VIN` varchar(17) DEFAULT NULL,
  `trailerVIN` varchar(17) DEFAULT NULL,
  `Driver1ID` varchar(19) DEFAULT NULL,
  `Driver2ID` text DEFAULT NULL,
  `Distance` decimal(8,3) DEFAULT NULL,
  `GPS_Distance` decimal(8,3) DEFAULT NULL,
  `Duration` time DEFAULT NULL,
  `FuelUsed` decimal(6,3) DEFAULT NULL,
  `FuelUsage` decimal(6,2) DEFAULT NULL,
  `CO2_emission` decimal(8,3) DEFAULT NULL COMMENT 'CO2 emission in kg',
  `DriveTime` int(8) DEFAULT NULL,
  `IdleTime` int(8) DEFAULT NULL,
  `PreDepIdle` int(8) unsigned DEFAULT NULL,
  `durationCruiseControlActive` int(11) DEFAULT NULL,
  `distanceCruiseControlActive` int(11) DEFAULT NULL,
  `durationWheelbaseSpeedOverZero` int(11) DEFAULT NULL,
  `fuelConsumptionDuringCruiseActive` int(11) DEFAULT NULL,
  `durationWheelbaseSpeedZero` int(11) DEFAULT NULL,
  `fuelDuringWheelbaseSpeedZero` int(11) DEFAULT NULL,
  `fuelDuringWheelbaseSpeedOverZero` int(11) DEFAULT NULL,
  `brakePedalCounterSpeedOverZero` int(11) DEFAULT NULL,
  `distanceBrakePedalActiveSpeedOverZero` int(11) DEFAULT NULL,
  `AverageDrivingSpeed` decimal(9,3) DEFAULT NULL,
  `AverageSpeed` decimal(9,3) DEFAULT NULL,
  `HighestDrivingSpeed` decimal(6,2) DEFAULT NULL,
  `CounterT` int(3) DEFAULT NULL,
  `CounterT_E` int(3) unsigned DEFAULT NULL,
  `TripReliability` decimal(5,1) DEFAULT NULL,
  `UpdatedDB` timestamp NULL DEFAULT NULL,
  `red_TellTale` tinyint(1) DEFAULT NULL,
  `rt_Duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`Trip_NO`),
  UNIQUE KEY `Unique Trips` (`VIN`,`StartDate`),
  KEY `UpdateTrips` (`TripActive`,`VIN`,`TripCalc`,`TripDelayed`,`Driver1ID`) USING BTREE,
  KEY `CustomerTripCountPerDay` (`VIN`,`TripActive`,`EndDate`,`StartDate`) USING BTREE,
  KEY `idx_driverTrips` (`StartDate`,`Driver1ID`,`EndDate`,`TripActive`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6126293 DEFAULT CHARSET=utf8 COMMENT='Trip';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.users wordt geschreven
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(155) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `avatar` tinyint(4) NOT NULL DEFAULT 0,
  `permissions` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'wether account is active',
  `cust_id` varchar(12) NOT NULL DEFAULT '*',
  `driver_id` varchar(16) NOT NULL,
  `logins` int(100) NOT NULL,
  `account_owner` int(11) NOT NULL DEFAULT 0,
  `company` varchar(255) NOT NULL,
  `stripe_cust_id` varchar(255) NOT NULL,
  `join_date` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `email_verified` tinyint(4) NOT NULL DEFAULT 0,
  `last_passwordreset` datetime NOT NULL,
  `vericode` varchar(15) NOT NULL,
  `title` varchar(100) NOT NULL,
  `us_css` varchar(100) NOT NULL,
  `custom1` varchar(255) NOT NULL COMMENT 'Redirect_URL',
  `custom2` varchar(255) NOT NULL,
  `custom3` varchar(255) NOT NULL,
  `custom5` varchar(255) NOT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `language` int(3) NOT NULL DEFAULT 1,
  `gpluslink` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `un_changed` int(1) NOT NULL,
  `profile_picture` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `EMAIL` (`email`,`driver_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.users_groups wordt geschreven
CREATE TABLE IF NOT EXISTS `users_groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(28) NOT NULL,
  `Description` text NOT NULL,
  `CreatedByUserID` int(11) NOT NULL,
  `ChangedByUserID` int(11) NOT NULL,
  `ChangeDate` datetime NOT NULL,
  `CreatedDT` date NOT NULL,
  PRIMARY KEY (`ID`,`Name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.users_online wordt geschreven
CREATE TABLE IF NOT EXISTS `users_online` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `timestamp` varchar(15) NOT NULL,
  `user_id` int(10) NOT NULL,
  `session` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.users_session wordt geschreven
CREATE TABLE IF NOT EXISTS `users_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `uagent` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.user_permission_matches wordt geschreven
CREATE TABLE IF NOT EXISTS `user_permission_matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.vehicles wordt geschreven
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `VIN` varchar(17) DEFAULT NULL,
  `customerVehicleName` char(28) DEFAULT NULL,
  `brand` varchar(28) DEFAULT NULL,
  `group_id` varchar(28) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `type` varchar(24) DEFAULT NULL,
  `model` varchar(28) DEFAULT NULL,
  `emissionLevel` varchar(12) DEFAULT NULL,
  `possibleFuelType` varchar(12) DEFAULT NULL,
  `numberOfAxles` varchar(12) DEFAULT NULL,
  `noOfAxles` int(1) DEFAULT NULL,
  `chassisType` char(50) DEFAULT NULL,
  `totalFuelTankVolume` int(8) DEFAULT NULL,
  `tachographType` varchar(50) DEFAULT NULL,
  `gearboxType` varchar(50) DEFAULT NULL,
  `LicensePlate` char(50) NOT NULL DEFAULT '-',
  `OdoMeter` int(13) DEFAULT NULL,
  `grossCombinationVehicleWeight` int(8) DEFAULT NULL,
  `FuelLevel` int(5) DEFAULT NULL,
  `CatalystFuelLevel` int(5) DEFAULT NULL,
  `serviceDistance` int(10) DEFAULT NULL,
  `TotalFuelUsed` int(12) DEFAULT NULL,
  `TotalEngineHours` int(8) DEFAULT NULL,
  `LastDriver` varchar(19) DEFAULT NULL,
  `LastFuelAdd` timestamp NULL DEFAULT NULL,
  `LastActivity` datetime DEFAULT NULL,
  `LastActivity_received` datetime DEFAULT NULL,
  `AddDateTime` datetime(6) DEFAULT current_timestamp(6),
  `UpdateDateTime` datetime(6) DEFAULT NULL,
  `TT_PAR_BRA` varchar(16) DEFAULT NULL,
  `TT_FUE_LEV` varchar(16) DEFAULT NULL,
  `TT_ENG_COO_TEM` varchar(16) DEFAULT NULL,
  `TT_ENG_OIL` varchar(16) DEFAULT NULL,
  `TT_ENG_MIL_IND` varchar(16) DEFAULT NULL,
  `TT_ENG_EMI_FAI` varchar(16) DEFAULT NULL,
  `TT_ADB_LEV` varchar(16) DEFAULT NULL,
  `last_Latitude` decimal(16,9) DEFAULT NULL,
  `last_Longitude` decimal(16,9) DEFAULT NULL,
  `last_Heading` int(3) DEFAULT NULL,
  `last_Altitude` int(5) DEFAULT NULL,
  `tripActive` tinyint(1) DEFAULT NULL,
  `vehicleActive` tinyint(1) DEFAULT NULL,
  `vehicleOutofService` tinyint(1) DEFAULT NULL,
  `vehicleDelayed` tinyint(1) NOT NULL,
  `triggerType` varchar(50) DEFAULT NULL,
  `ambientAirTemperature` int(3) DEFAULT NULL,
  `engineCoolantTemperature` int(3) DEFAULT NULL,
  `EngineTotalIdleFuelUsed` int(12) DEFAULT NULL,
  `serviceBrakeAirPressureCircuit1` int(7) DEFAULT NULL,
  `serviceBrakeAirPressureCircuit2` int(7) DEFAULT NULL,
  `EngineTotalIdleHours` int(12) DEFAULT NULL,
  `currentSpeed` decimal(5,2) DEFAULT NULL,
  `Driver1_ID` varchar(19) DEFAULT NULL,
  `Driver2_ID` varchar(19) DEFAULT NULL,
  `Driver1_WS` varchar(24) DEFAULT '2',
  `Driver2_WS` varchar(24) DEFAULT NULL,
  `PTO_status` tinyint(1) DEFAULT 0,
  `Status` tinyint(1) DEFAULT 0 COMMENT 'determine status of vehicle ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `VIN` (`VIN`),
  KEY `Dashboard` (`VIN`,`Driver1_ID`) USING BTREE,
  KEY `Vehicle_Index` (`customerVehicleName`,`vehicleActive`,`tripActive`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41349770 DEFAULT CHARSET=utf8 CHECKSUM=1;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.vehiclestatus wordt geschreven
CREATE TABLE IF NOT EXISTS `vehiclestatus` (
  `vin` varchar(17) NOT NULL,
  `createdDateTime` datetime NOT NULL,
  `receivedDateTime` datetime NOT NULL,
  `triggerType` varchar(36) NOT NULL,
  `triggerContext` varchar(12) NOT NULL,
  `triggerInfo` varchar(48) NOT NULL,
  `hrTotalVehicleDistance` int(10) NOT NULL,
  `driver1Id_TDI` varchar(19) NOT NULL,
  `driver2Id_TDI` varchar(19) NOT NULL,
  `driver1Id_WSC` varchar(24) NOT NULL,
  `driver2Id_WSC` varchar(24) NOT NULL,
  `GNSS_latitude` decimal(12,6) NOT NULL,
  `GNSS_longitude` decimal(12,6) NOT NULL,
  `GNSS_altitude` int(6) NOT NULL,
  `GNSS_heading` int(3) NOT NULL,
  `GNSS_Speed` decimal(5,2) NOT NULL,
  `GNSS_PosDateTime` datetime NOT NULL,
  `wheelBasedSpeed` decimal(5,2) NOT NULL,
  `engineTotalFuelUsed` int(12) NOT NULL,
  `tachographSpeed` decimal(5,2) NOT NULL,
  `grossCombinationVehicleWeight` int(8) NOT NULL,
  `fuelLevel1` int(3) NOT NULL,
  `catalystFuelLevel` int(3) NOT NULL,
  `ambientAirTemperature` int(3) NOT NULL,
  `engineCoolantTemperature` int(3) NOT NULL,
  `serviceBrakeAirPressureCircuit1` int(7) NOT NULL,
  `serviceBrakeAirPressureCircuit2` int(7) NOT NULL,
  `serviceDistance` int(8) NOT NULL,
  `TS_IGNITION_ON` tinyint(1) NOT NULL,
  `TS_ENGINE_ON` tinyint(1) NOT NULL,
  `TS_PTO_ENABLED` tinyint(1) NOT NULL,
  `TS_CRUISECONTROL_ON` tinyint(1) NOT NULL,
  `TS_RETARDER_ON` tinyint(1) NOT NULL,
  `TS_BRAKE_SWITCH` tinyint(1) NOT NULL,
  `engineSpeed` decimal(5,2) NOT NULL,
  `enginePercentLoadCurrentSpeed` int(3) NOT NULL,
  `actualRetarderPercentTorque` int(3) NOT NULL,
  `acceleratorPedalPercentaccelerationCurrentSpeed` int(3) NOT NULL,
  `idleDuration` int(5) NOT NULL,
  `fuelUsed` int(5) NOT NULL,
  `totalEngineHours` int(12) NOT NULL,
  `durationCruiseControlActive` int(12) NOT NULL,
  `distanceCruiseControlActive` int(12) NOT NULL,
  `durationWheelbaseSpeedOverZero` int(12) NOT NULL,
  `fuelConsumptionDuringCruiseActive` int(12) NOT NULL,
  `durationWheelbaseSpeedZero` int(12) NOT NULL,
  `fuelDuringWheelbaseSpeedZero` int(12) NOT NULL,
  `fuelDuringWheelbaseSpeedOverZero` int(12) NOT NULL,
  `brakePedalCounterSpeedOverZero` int(12) NOT NULL,
  `distanceBrakePedalActiveSpeedOverZero` int(12) NOT NULL,
  `Trip_no` int(12) NOT NULL,
  `AddedtoDB` datetime NOT NULL DEFAULT current_timestamp(),
  `BatteryPotentialPowerInput` int(6) NOT NULL,
  `EngineTotalIdleHours` int(12) NOT NULL,
  `EngineTotalIdleFuelUsed` int(12) NOT NULL,
  `TransmissionCurrentGear` int(2) NOT NULL,
  `SLIBatteryPackStateofCharge` int(3) NOT NULL,
  `RemainingCurrentDrivingTime` time NOT NULL,
  `RemDurationOfCurrentBreakRest` time NOT NULL,
  `tellTale` varchar(26) NOT NULL,
  `tellTale_State` varchar(12) NOT NULL,
  KEY `VIN_CreatedDT_TT` (`vin`,`createdDateTime`,`triggerType`) USING BTREE,
  KEY `IDX_DriverTrigger` (`driver1Id_TDI`,`triggerType`) USING BTREE,
  KEY `IDX_Fault` (`driver1Id_WSC`,`wheelBasedSpeed`) USING BTREE,
  KEY `IDX_Driver_Speed_Date` (`driver1Id_TDI`,`createdDateTime`,`wheelBasedSpeed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='RAW-Vehicle_Data';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.vehicles_stats wordt geschreven
CREATE TABLE IF NOT EXISTS `vehicles_stats` (
  `createdDateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `D_Min` time DEFAULT NULL,
  `D_Average` time DEFAULT NULL,
  `D_Max` time DEFAULT NULL,
  `V_Count` int(8) DEFAULT NULL,
  `V_CountNC` int(8) DEFAULT NULL,
  `V_Delayed` int(8) DEFAULT NULL,
  `V_CountActive` int(8) DEFAULT NULL,
  PRIMARY KEY (`createdDateTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.vehicles_telltales wordt geschreven
CREATE TABLE IF NOT EXISTS `vehicles_telltales` (
  `vin` varchar(17) DEFAULT NULL,
  `createdDateTime` datetime DEFAULT NULL,
  `tellTale` varchar(36) DEFAULT NULL,
  `state` varchar(24) DEFAULT NULL,
  `latitude` decimal(12,6) DEFAULT NULL,
  `longitude` decimal(12,6) DEFAULT NULL,
  `Driver_ID` varchar(16) NOT NULL,
  KEY `TellTales_Search` (`vin`,`createdDateTime`),
  KEY `idx_CountTellTales` (`createdDateTime`,`state`,`vin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.vehicles_warning_advise wordt geschreven
CREATE TABLE IF NOT EXISTS `vehicles_warning_advise` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `Class` int(2) DEFAULT NULL,
  `Number` int(3) DEFAULT NULL,
  `TT_name` varchar(18) NOT NULL,
  `status` varchar(12) NOT NULL,
  `Language` varchar(2) DEFAULT NULL,
  `Description` varchar(37) DEFAULT NULL,
  `Advise` varchar(990) DEFAULT NULL,
  `changed` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `TellTale` (`TT_name`,`status`,`Language`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.vehicle_activity wordt geschreven
CREATE TABLE IF NOT EXISTS `vehicle_activity` (
  `Total_known` int(6) NOT NULL,
  `active14` int(6) NOT NULL,
  `activetoday` int(6) NOT NULL,
  `driving` int(6) NOT NULL,
  `stopped` int(6) NOT NULL,
  `delayedvehicle` int(6) NOT NULL,
  `noGPS` int(6) NOT NULL,
  `alert` int(6) NOT NULL,
  `addtodb` datetime NOT NULL DEFAULT current_timestamp(),
  KEY `addtodb` (`addtodb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.vehicle_count wordt geschreven
CREATE TABLE IF NOT EXISTS `vehicle_count` (
  `id` int(11) NOT NULL,
  `Count` int(11) DEFAULT NULL,
  `CustomerName` varchar(45) DEFAULT NULL,
  `createDate` date DEFAULT NULL,
  UNIQUE KEY `id_UNIQUE` (`CustomerName`,`createDate`,`Count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count the activated rFMS vehicles per customer';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.vehicle_delayed wordt geschreven
CREATE TABLE IF NOT EXISTS `vehicle_delayed` (
  `vin` varchar(17) DEFAULT NULL,
  `createdDate` date DEFAULT NULL,
  `receivedDateTime` timestamp NULL DEFAULT NULL,
  `add_toDB` timestamp NULL DEFAULT current_timestamp(),
  `delayed_comm` tinyint(1) DEFAULT NULL,
  `latitude` decimal(12,6) DEFAULT NULL,
  `longitude` decimal(12,6) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varbinary(36) DEFAULT NULL,
  UNIQUE KEY `idx_vehicle_delayed_vin_createdDate` (`vin`,`createdDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.vehicle_stat_fuel wordt geschreven
CREATE TABLE IF NOT EXISTS `vehicle_stat_fuel` (
  `vin` varchar(17) NOT NULL,
  `createDate` date NOT NULL,
  `totalFuelUsed` int(12) NOT NULL,
  `last_totalfuelused` int(11) NOT NULL,
  UNIQUE KEY `VehicleStartDayOdo` (`vin`,`createDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Daily_First_OdoMeter_per_vehicle';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.vehicle_stat_km wordt geschreven
CREATE TABLE IF NOT EXISTS `vehicle_stat_km` (
  `vin` varchar(17) NOT NULL,
  `createDate` date NOT NULL,
  `odometer` int(16) NOT NULL,
  `last_odometer` int(16) DEFAULT NULL,
  UNIQUE KEY `VehicleStartDayOdo` (`vin`,`createDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Daily_First_OdoMeter_per_vehicle';

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.vehicle_types wordt geschreven
CREATE TABLE IF NOT EXISTS `vehicle_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(18) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `icon_txt` varchar(128) DEFAULT NULL,
  `icon_code` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT curdate() COMMENT 'created date/time',
  `createdBy` int(11) DEFAULT NULL COMMENT 'userId',
  PRIMARY KEY (`id`),
  KEY `idx_name_created` (`name`,`createdBy`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel rfms_reading.vessel wordt geschreven
CREATE TABLE IF NOT EXISTS `vessel` (
  `id` int(11) DEFAULT NULL,
  `ves_id` char(50) DEFAULT NULL,
  `source` char(50) DEFAULT NULL,
  `timeSecUtc` bigint(20) DEFAULT NULL,
  `boatname` char(100) DEFAULT NULL,
  `callSIgn` char(50) DEFAULT NULL,
  `lengthMeters` int(11) DEFAULT NULL,
  `heightMeters` int(11) DEFAULT NULL,
  `draughtMeters` int(11) DEFAULT NULL,
  `widthMeters` int(11) DEFAULT NULL,
  `speedKmh` decimal(6,2) DEFAULT NULL,
  `bearingDeg` decimal(6,2) DEFAULT NULL,
  `destinationName` char(50) DEFAULT NULL,
  `polyline` char(50) DEFAULT NULL,
  `etaSecUtc` bigint(20) DEFAULT NULL,
  `captain` char(50) DEFAULT NULL,
  `mmsi` int(16) DEFAULT NULL,
  `destination_lat` decimal(12,6) DEFAULT NULL,
  `destination_long` decimal(12,6) DEFAULT NULL,
  `phone` char(50) DEFAULT NULL,
  `point_lat` decimal(12,6) DEFAULT NULL,
  `point_long` decimal(12,6) DEFAULT NULL,
  `vesselType` char(50) DEFAULT NULL,
  `boundingBox_tl_lat` decimal(12,0) DEFAULT NULL,
  `boundingBox_tl_long` decimal(12,0) DEFAULT NULL,
  `boundingBox_br_lat` decimal(12,0) DEFAULT NULL,
  `boundingBox_br_long` decimal(12,0) DEFAULT NULL,
  `fuleType` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='ais vessel status information';

-- Data exporteren was gedeselecteerd

-- Structuur van  event rfms_reading._Organize_Database_Tables wordt geschreven
DELIMITER //
CREATE EVENT `_Organize_Database_Tables` ON SCHEDULE EVERY 1 DAY STARTS '2021-01-07 01:05:00' ON COMPLETION NOT PRESERVE DISABLE DO BEGIN
	INSERT INTO performancelog(EndPoint,Status) values ('OrganizeDB_Start',200);
	DELETE FROM trips WHERE trips.StartDate<(CURDATE() - INTERVAL 6 MONTH);
	optimize table trips;
	DELETE FROM vehicles WHERE vehicles.LastActivity<(CURDATE() - INTERVAL 6 MONTH);
	optimize table vehicles;
	DELETE FROM driver WHERE driver.LastDriverActivity<(CURDATE() - INTERVAL 6 MONTH);
	optimize table driver;
	DELETE FROM trailers WHERE trailers.LastActivity<(CURDATE() - INTERVAL 6 MONTH);
	optimize table trailers;
	DELETE FROM drivetimes WHERE drivetimes.DriveDate<(CURDATE() - INTERVAL 6 MONTH);
	optimize table drivetimes;
	optimize table pages;
	DELETE FROM vehicles_telltales WHERE  vehicles_telltales.createdDateTime<(CURDATE() - INTERVAL 6 MONTH);
	optimize table vehicles_telltales;
	DELETE FROM trailerstatus WHERE  trailerstatus.createdDateTime<(CURDATE() - INTERVAL 6 MONTH);
	optimize table trailerstatus;
	DELETE FROM vehicle_stat_fuel WHERE  vehicle_stat_fuel.createDate<(CURDATE() - INTERVAL 6 MONTH);
	optimize table vehicle_stat_fuel;
	DELETE FROM vehicle_stat_km WHERE  vehicle_stat_km.createDate<(CURDATE() - INTERVAL 6 MONTH);
	optimize table vehicle_stat_km;
	DELETE FROM vehicle_delayed WHERE  vehicle_delayed.createdDate<(CURDATE() - INTERVAL 6 MONTH);
	optimize table vehicle_delayed;
	DELETE FROM pdc_damage WHERE pdc_damage.repairStatus='1' and pdc_damage.createdDateTime<(CURDATE() - INTERVAL 6 MONTH);
	optimize table pdc_damage;
	DELETE FROM pdc_register WHERE  pdc_register.createdDate<(CURDATE() - INTERVAL 6 MONTH);
	optimize table pdc_register;
	DELETE FROM backlog WHERE  backlog.AddedDateTime <(CURDATE() - INTERVAL 6 MONTH);
	optimize table backlog;
	DELETE FROM driverstatus WHERE driverstatus.createdDateTime<(CURDATE() - INTERVAL 6 MONTH);
	optimize table driverstatus;	
	DELETE FROM vehiclestatus WHERE  vehiclestatus.createdDateTime<(CURDATE() - INTERVAL 6 MONTH);
	optimize table vehiclestatus;	
	DELETE FROM performancelog WHERE  performancelog.DateTime<(CURDATE() - INTERVAL 6 MONTH);
	optimize table performancelog;
	INSERT INTO performancelog(EndPoint,Status) values ('OrganizeDB_End',200);
END//
DELIMITER ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
