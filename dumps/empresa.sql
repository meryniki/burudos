-- MySQL dump 10.13  Distrib 5.6.16, for osx10.7 (i386)
--
-- Host: localhost    Database: burucps
-- ------------------------------------------------------
-- Server version	5.6.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `party` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_update_by` varchar(255) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `bu_id` bigint(20) DEFAULT NULL,
  `dofbeg` datetime DEFAULT NULL,
  `basic` int(11) DEFAULT NULL,
  `dofbirth` datetime DEFAULT NULL,
  `dofingreso` datetime DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `iscoordinator` bit(1) DEFAULT NULL,
  `isworker` bit(1) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `legajo` varchar(255) DEFAULT NULL,
  `names` varchar(255) DEFAULT NULL,
  `statement_rules_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emp_name_idx` (`name`,`bu_id`),
  KEY `FK6581AE6B1060859` (`bu_id`),
  KEY `FK6581AE6F2B2268` (`statement_rules_id`),
  KEY `NameParty_Idx` (`name`),
  KEY `name_idx` (`name`),
  CONSTRAINT `FK6581AE6F2B2268` FOREIGN KEY (`statement_rules_id`) REFERENCES `rule_set` (`id`),
  CONSTRAINT `FK6581AE6B1060859` FOREIGN KEY (`bu_id`) REFERENCES `bussines_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=299 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
INSERT INTO `party` VALUES (1,0,NULL,'2014-08-10 12:41:26',NULL,NULL,'2014-08-10 12:41:26','CATALANO DIEGO','20-20468785-5','ar.com.burudos.party.Employee',18,NULL,0,NULL,'2004-05-03 00:00:00','CATALANO, DIEGO RAMIRO','\0','','CATALANO','12','DIEGO',NULL),(2,0,NULL,'2014-08-10 12:41:26',NULL,NULL,'2014-08-10 12:41:26','PREZIO JOSE','20-12438666-8','ar.com.burudos.party.Employee',18,NULL,0,NULL,'2009-04-16 00:00:00','PREZIO, JOSE MARIA','\0','','PREZIO','51','JOSE',NULL),(3,0,NULL,'2014-08-10 12:41:26',NULL,NULL,'2014-08-10 12:41:26','UMANSKY ESTEBAN','20-14038414-4','ar.com.burudos.party.Employee',20,NULL,0,NULL,'2005-12-01 00:00:00','UMANSKY, ESTEBAN','\0','','UMANSKY','64','ESTEBAN',NULL),(4,0,NULL,'2014-08-10 12:41:26',NULL,NULL,'2014-08-10 12:41:26','SILVERO VIVIANA','27-30959155-6','ar.com.burudos.party.Employee',28,NULL,0,NULL,'2007-06-05 00:00:00','SILVERO, VIVIANA','\0','','SILVERO','123','VIVIANA',NULL),(5,1,NULL,'2014-08-10 12:41:26',NULL,NULL,'2014-08-11 00:51:41','SANDOVAL DUBARRY MATIAS','20-30652509-4','ar.com.burudos.party.Employee',19,NULL,0,NULL,'2008-05-16 00:00:00','SANDOVAL DUBARRY, MATIAS H.','\0','','SANDOVAL DUBARRY','137','MATIAS',NULL),(6,0,NULL,'2014-08-10 12:41:26',NULL,NULL,'2014-08-10 12:41:26','MARTINEZ MIGUEL','20-14297825-4','ar.com.burudos.party.Employee',39,NULL,0,NULL,'2010-09-27 00:00:00','MARTINEZ, MIGUEL ANGEL','\0','','MARTINEZ','146','MIGUEL',NULL),(7,0,NULL,'2014-08-10 12:41:26',NULL,NULL,'2014-08-10 12:41:26','CALABRO LEONARDO','20-14871875-0','ar.com.burudos.party.Employee',28,NULL,0,NULL,'2009-10-01 00:00:00','CALABRO, LEONARDO FABIO','\0','','CALABRO','160','LEONARDO',NULL),(8,0,NULL,'2014-08-10 12:41:26',NULL,NULL,'2014-08-10 12:41:26','GONZALEZ MAURICIO','20-25053015-4','ar.com.burudos.party.Employee',32,NULL,0,NULL,'2009-10-02 00:00:00','GONZALEZ, MAURICIO ALEXI','\0','','GONZALEZ','163','MAURICIO',NULL),(9,0,NULL,'2014-08-10 12:41:26',NULL,NULL,'2014-08-10 12:41:26','PEZOA FERNANDO','20-20454113-3','ar.com.burudos.party.Employee',26,NULL,0,NULL,'2009-10-02 00:00:00','PEZOA, FERNANDO OSCAR','\0','','PEZOA','164','FERNANDO',NULL),(10,0,NULL,'2014-08-10 12:41:26',NULL,NULL,'2014-08-10 12:41:26','TALAVERA LUCAS','20-30592610-9','ar.com.burudos.party.Employee',31,NULL,0,NULL,'2009-10-02 00:00:00','TALAVERA, LUCAS MATIAS','\0','','TALAVERA','168','LUCAS',NULL),(11,0,NULL,'2014-08-10 12:41:26',NULL,NULL,'2014-08-10 12:41:26','FERNANDEZ JUAN','20-10691981-0','ar.com.burudos.party.Employee',13,NULL,0,NULL,'2009-11-01 00:00:00','FERNANDEZ , JUAN RAMON','\0','','FERNANDEZ ','174','JUAN',NULL),(12,0,NULL,'2014-08-10 12:41:26',NULL,NULL,'2014-08-10 12:41:26','GUZMAN ENRIQUE','20-32501532-3','ar.com.burudos.party.Employee',22,NULL,0,NULL,'2010-01-01 00:00:00','GUZMAN, ENRIQUE ANTONIO','\0','','GUZMAN','176','ENRIQUE',NULL),(13,0,NULL,'2014-08-10 12:41:26',NULL,NULL,'2014-08-10 12:41:26','BURON ESTEBAN','20-28949098-2','ar.com.burudos.party.Employee',15,NULL,0,NULL,'2010-05-11 00:00:00','BURON, ESTEBAN HORACIO','\0','','BURON','182','ESTEBAN',NULL),(14,0,NULL,'2014-08-10 12:41:26',NULL,NULL,'2014-08-10 12:41:26','VELINO CARLOS','20-25452330-6','ar.com.burudos.party.Employee',12,NULL,0,NULL,'2011-07-01 00:00:00','VELINO, CARLOS ARIEL','\0','','VELINO','191','CARLOS',NULL),(15,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','VERON LUCAS','20-31676105-5','ar.com.burudos.party.Employee',33,NULL,0,NULL,'2011-07-13 00:00:00','VERON, LUCAS ARIEL','\0','','VERON','194','LUCAS',NULL),(16,1,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-11 01:07:19','GUASCHINO M. FERNANDA','27-32900931-4','ar.com.burudos.party.Employee',23,NULL,0,NULL,'2011-12-01 00:00:00','GUASCHINO, MARIA FERNANDA','\0','','GUASCHINO','200','MARIA',NULL),(17,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','ALTAMIRANDA DANIEL','23-38063038-9','ar.com.burudos.party.Employee',22,NULL,0,NULL,'2011-12-26 00:00:00','ALTAMIRANDA, DANIEL','\0','','ALTAMIRANDA','203','DANIEL',NULL),(18,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','TELLO SYLVIA','27-10762689-7','ar.com.burudos.party.Employee',39,NULL,0,NULL,'2012-01-02 00:00:00','TELLO, SYLVIA DEL CARMEN','\0','','TELLO','205','SYLVIA',NULL),(19,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','ALAMINO PAMELA','27-38110653-0','ar.com.burudos.party.Employee',26,NULL,0,NULL,'2012-07-02 00:00:00','ALAMINO, PAMELA SOL','\0','','ALAMINO','207','PAMELA',NULL),(20,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','SERABIAN ARIEL','23-23656898-9','ar.com.burudos.party.Employee',17,NULL,0,NULL,'2012-07-06 00:00:00','SERABIAN, ARIEL BALTASAR','\0','','SERABIAN','209','ARIEL',NULL),(21,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','MOLLA ALEJANDRO','20-31444113-4','ar.com.burudos.party.Employee',15,NULL,0,NULL,'2012-09-10 00:00:00','MOLLA, ALEJANDRO JAVIER','\0','','MOLLA','213','ALEJANDRO',NULL),(22,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','VON FEHLEISEN RICARDO','20-10897779-6','ar.com.burudos.party.Employee',19,NULL,0,NULL,'2012-09-01 00:00:00','VON FEHLEISEN, RICARDO CESAR','\0','','VON FEHLEISEN','215','RICARDO',NULL),(23,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','PAGANI VANESA','27-32290406-7','ar.com.burudos.party.Employee',23,NULL,0,NULL,'2012-10-09 00:00:00','PAGANI, VANESA SILVANA','\0','','PAGANI','222','VANESA',NULL),(24,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','REY ROXANA','27-29394944-7','ar.com.burudos.party.Employee',31,NULL,0,NULL,'2013-02-06 00:00:00','REY , ROXANA PATRICIA','\0','','REY ','226','ROXANA',NULL),(25,1,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-11 00:49:26','VILA CAROLINA','27-27535436-3','ar.com.burudos.party.Employee',31,NULL,0,NULL,'2013-02-06 00:00:00','VILA , CAROLINA MAGALI','\0','','VILA ','227','CAROLINA',NULL),(26,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','MIJANGOS JORGE','20-27996910-4','ar.com.burudos.party.Employee',29,NULL,0,NULL,'2013-02-06 00:00:00','MIJANGOS , JORGE','\0','','MIJANGOS ','229','JORGE',NULL),(27,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','PEREIRA WALTER','20-30959442-9','ar.com.burudos.party.Employee',29,NULL,0,NULL,'2013-02-06 00:00:00','PEREIRA, WALTER DANIEL','\0','','PEREIRA','230','WALTER',NULL),(28,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','GONZALEZ ROBERTO','20-21659723-1','ar.com.burudos.party.Employee',34,NULL,0,NULL,'2013-03-01 00:00:00','GONZALEZ , ROBERTO DANIEL','\0','','GONZALEZ ','231','ROBERTO',NULL),(29,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','DIAZ FLORENCIA','27-37127252-1','ar.com.burudos.party.Employee',24,NULL,0,NULL,'2013-08-01 00:00:00','DIAZ , FLORENCIA IVON','\0','','DIAZ ','236','FLORENCIA',NULL),(30,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','ALAMOS CRISTIAN','20-36032016-3','ar.com.burudos.party.Employee',36,NULL,0,NULL,'2013-08-12 00:00:00','ALAMOS, CRISTIAN RUBEN','\0','','ALAMOS','237','CRISTIAN',NULL),(31,1,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-11 00:52:48','LIMA DANIEL','20-30157627-8','ar.com.burudos.party.Employee',36,NULL,0,NULL,'2013-08-12 00:00:00','LIMA , RAMON DANIEL','\0','','LIMA ','238','RAMON',NULL),(32,1,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-11 00:37:52','JARA GUSTAVO','20-32220930-5','ar.com.burudos.party.Employee',31,NULL,0,NULL,'2013-08-16 00:00:00','JARA MARTINEZ, GUSTAVO ADOLFO','\0','','JARA MARTINEZ','239','GUSTAVO',NULL),(33,1,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-11 00:51:02','GARCIA ANTONELA','27-29437251-8','ar.com.burudos.party.Employee',32,NULL,0,NULL,'2013-08-16 00:00:00','GARCIA , GLADYS ANTONELA','\0','','GARCIA ','240','GLADYS',NULL),(34,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','FERNANDEZ CARMEN','27-26090479-0','ar.com.burudos.party.Employee',25,NULL,0,NULL,'2013-08-20 00:00:00','FERNANDEZ, CARMEN ELISA','\0','','FERNANDEZ','241','CARMEN',NULL),(35,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','PADILLA PABLO','20-30663423-3','ar.com.burudos.party.Employee',12,NULL,0,NULL,'2013-09-10 00:00:00','PADILLA, PABLO ADRIAN','\0','','PADILLA','244','PABLO',NULL),(36,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','PAREDES LORENA','27-26413183-4','ar.com.burudos.party.Employee',25,NULL,0,NULL,'2013-10-11 00:00:00','PAREDES, LORENA DEL CARMEN','\0','','PAREDES','247','LORENA',NULL),(37,0,NULL,'2014-08-10 12:41:27',NULL,NULL,'2014-08-10 12:41:27','GONZALEZ PI GISELA','27-34428293-0','ar.com.burudos.party.Employee',38,NULL,0,NULL,'2013-11-01 00:00:00','GONZALEZ PI, GISELA ELIANA','\0','','GONZALEZ PI','248','GISELA',NULL),(38,1,NULL,'2014-08-10 18:33:39',NULL,NULL,'2014-08-10 18:48:34','VALDI NICOLAS','23-27584501-9','ar.com.burudos.party.Employee',NULL,NULL,0,NULL,'2005-02-07 00:00:00',NULL,'','\0','VALDI','44','NICOLAS JORGE',NULL),(39,1,NULL,'2014-08-10 18:34:40',NULL,NULL,'2014-08-10 18:48:59','PACHE CAROLINA','27-22970898-3','ar.com.burudos.party.Employee',NULL,NULL,0,NULL,'2007-11-01 00:00:00',NULL,'','\0','PACHE','130','CAROLINA',NULL),(40,1,NULL,'2014-08-10 18:36:35',NULL,NULL,'2014-08-10 18:49:19','AGUIRRE MARINO','20-21508541-5','ar.com.burudos.party.Employee',NULL,NULL,0,NULL,'2010-03-02 00:00:00',NULL,'','\0','AGUIRRE','181','MARINO GABRIEL',NULL),(41,1,NULL,'2014-08-10 18:44:21',NULL,NULL,'2014-08-10 18:50:16','FIORENTINO CLAUDIA','27-16558279-4','ar.com.burudos.party.Employee',20,NULL,0,NULL,'2010-06-01 00:00:00',NULL,'\0','','FIORENTINO','183','CLAUDIA BEATRIZ',NULL),(42,1,NULL,'2014-08-10 18:45:27',NULL,NULL,'2014-08-10 18:50:34','MORENO ANA','27-18609120-0','ar.com.burudos.party.Employee',20,NULL,0,NULL,'2010-06-01 00:00:00',NULL,'\0','','MORENO','184','ANA ISABEL',NULL),(43,0,NULL,'2014-08-10 18:47:59',NULL,NULL,'2014-08-10 18:47:59','BASUALDO VERONICA','27-36786808-8','ar.com.burudos.party.Employee',20,NULL,0,NULL,'2012-08-14 00:00:00',NULL,'\0','','BASUALDO ALTEZ','211','VERONICA ELIZABETH',NULL),(44,0,NULL,'2014-08-10 18:52:20',NULL,NULL,'2014-08-10 18:52:20','SPITALE MARIA JOSE','27-38413484-5','ar.com.burudos.party.Employee',NULL,NULL,0,NULL,'2012-08-20 00:00:00',NULL,'\0','','SPITALE','242','MARIA JOSE',NULL),(263,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000000-0','ar.com.burudos.party.Employee',28,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1010','INGRESADO',NULL),(264,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000001-0','ar.com.burudos.party.Employee',12,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1011','INGRESADO',NULL),(265,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000002-0','ar.com.burudos.party.Employee',13,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1012','INGRESADO',NULL),(266,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000003-0','ar.com.burudos.party.Employee',14,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1013','INGRESADO',NULL),(267,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000004-0','ar.com.burudos.party.Employee',35,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1014','INGRESADO',NULL),(268,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000005-0','ar.com.burudos.party.Employee',37,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1015','INGRESADO',NULL),(269,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000006-0','ar.com.burudos.party.Employee',15,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1016','INGRESADO',NULL),(270,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000007-0','ar.com.burudos.party.Employee',16,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1017','INGRESADO',NULL),(271,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000008-0','ar.com.burudos.party.Employee',17,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1018','INGRESADO',NULL),(272,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000009-0','ar.com.burudos.party.Employee',31,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1019','INGRESADO',NULL),(273,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000011-0','ar.com.burudos.party.Employee',18,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1020','INGRESADO',NULL),(274,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000012-0','ar.com.burudos.party.Employee',22,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1021','INGRESADO',NULL),(275,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000013-0','ar.com.burudos.party.Employee',29,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1022','INGRESADO',NULL),(276,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000014-0','ar.com.burudos.party.Employee',39,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1023','INGRESADO',NULL),(277,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000015-0','ar.com.burudos.party.Employee',19,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1024','INGRESADO',NULL),(278,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000016-0','ar.com.burudos.party.Employee',33,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1025','INGRESADO',NULL),(279,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000017-0','ar.com.burudos.party.Employee',23,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1026','INGRESADO',NULL),(280,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000018-0','ar.com.burudos.party.Employee',21,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1027','INGRESADO',NULL),(281,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000020-0','ar.com.burudos.party.Employee',24,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1029','INGRESADO',NULL),(282,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000021-0','ar.com.burudos.party.Employee',40,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1030','INGRESADO',NULL),(283,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000022-0','ar.com.burudos.party.Employee',34,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1031','INGRESADO',NULL),(284,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000023-0','ar.com.burudos.party.Employee',32,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1032','INGRESADO',NULL),(285,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000024-0','ar.com.burudos.party.Employee',25,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1033','INGRESADO',NULL),(286,0,NULL,'2014-08-11 01:03:44',NULL,NULL,'2014-08-11 01:03:44','NO INGRESADO','20-00000025-0','ar.com.burudos.party.Employee',26,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1034','INGRESADO',NULL),(287,0,NULL,'2014-08-11 01:03:45',NULL,NULL,'2014-08-11 01:03:45','NO INGRESADO','20-00000026-0','ar.com.burudos.party.Employee',27,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1035','INGRESADO',NULL),(288,0,NULL,'2014-08-11 01:03:45',NULL,NULL,'2014-08-11 01:03:45','NO INGRESADO','20-00000027-0','ar.com.burudos.party.Employee',38,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1036','INGRESADO',NULL),(289,0,NULL,'2014-08-11 01:03:45',NULL,NULL,'2014-08-11 01:03:45','NO INGRESADO','20-00000028-0','ar.com.burudos.party.Employee',36,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1037','INGRESADO',NULL),(290,0,NULL,'2014-08-11 01:03:45',NULL,NULL,'2014-08-11 01:03:45','NO INGRESADO','20-00000029-0','ar.com.burudos.party.Employee',41,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1038','INGRESADO',NULL),(291,0,NULL,'2014-08-11 01:03:45',NULL,NULL,'2014-08-11 01:03:45','NO INGRESADO','20-00000030-0','ar.com.burudos.party.Employee',20,NULL,0,NULL,'2014-01-01 00:00:00','NO, INGRESADO','\0','','NO','1039','INGRESADO',NULL),(292,0,NULL,'2014-08-11 01:03:45',NULL,NULL,'2014-08-11 01:03:45','GUERRERO JORGE','20-00000031-0','ar.com.burudos.party.Employee',20,NULL,0,NULL,'2014-01-01 00:00:00','GUERRERO, JORGE','\0','','GUERRERO','1040','JORGE',NULL),(293,0,NULL,'2014-08-11 01:03:45',NULL,NULL,'2014-08-11 01:03:45','MELOGNO EZEQUIEL','20-00000032-0','ar.com.burudos.party.Employee',21,NULL,0,NULL,'2014-01-01 00:00:00','MELOGNO, EZEQUIEL','\0','','MELOGNO','1041','EZEQUIEL',NULL),(294,0,NULL,'2014-08-11 01:03:45',NULL,NULL,'2014-08-11 01:03:45','MARTINEZ MANUEL','20-00000033-0','ar.com.burudos.party.Employee',16,NULL,0,NULL,'2014-01-01 00:00:00','MARTINEZ, MANUEL','\0','','MARTINEZ','1042','MANUEL',NULL),(295,0,NULL,'2014-08-11 01:03:45',NULL,NULL,'2014-08-11 01:03:45','PANOZZO PABLO','20-00000034-0','ar.com.burudos.party.Employee',14,NULL,0,NULL,'2014-01-01 00:00:00','PANOZZO, PABLO','\0','','PANOZZO','1043','PABLO',NULL),(296,0,NULL,'2014-08-11 01:03:45',NULL,NULL,'2014-08-11 01:03:45','QUEVEDO HORACIO','20-00000036-0','ar.com.burudos.party.Employee',27,NULL,0,NULL,'2014-01-01 00:00:00','QUEVEDO, HORACIO','\0','','QUEVEDO','1045','HORACIO',NULL),(297,0,NULL,'2014-08-11 01:03:45',NULL,NULL,'2014-08-11 01:03:45','MUNOZ FRANCISCO','20-00000038-0','ar.com.burudos.party.Employee',35,NULL,0,NULL,'2014-01-01 00:00:00','MUNOZ, FRANCISCO','\0','','MUNOZ','1047','FRANCISCO',NULL),(298,0,NULL,'2014-08-11 01:04:43',NULL,NULL,'2014-08-11 01:04:43','ANTELMI MARIA','20-00000035-0','ar.com.burudos.party.Employee',30,NULL,0,NULL,'2014-01-01 00:00:00','ANTELMI, MARIA DE LOS ANGELES','\0','','ANTELMI','1044','MARIA',NULL);
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bussines_unit`
--

DROP TABLE IF EXISTS `bussines_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bussines_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `altura` varchar(255) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `coordinator_id` bigint(20) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `father_id` bigint(20) DEFAULT NULL,
  `localidad` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bu_name_idx` (`nombre`),
  KEY `FK8D6A411D16FD1606` (`coordinator_id`),
  KEY `FK8D6A411DCA9006B0` (`father_id`),
  KEY `NombreBu_Idx` (`nombre`),
  CONSTRAINT `FK8D6A411DCA9006B0` FOREIGN KEY (`father_id`) REFERENCES `bussines_unit` (`id`),
  CONSTRAINT `FK8D6A411D16FD1606` FOREIGN KEY (`coordinator_id`) REFERENCES `party` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bussines_unit`
--

LOCK TABLES `bussines_unit` WRITE;
/*!40000 ALTER TABLE `bussines_unit` DISABLE KEYS */;
INSERT INTO `bussines_unit` VALUES (1,3,'1456','Regimiento Patricios','JAG',NULL,NULL,NULL,'Ciudad de Buenos Aires','JAG','Ciudad de Buenos Aires'),(2,5,NULL,NULL,'907',NULL,NULL,1,NULL,'Area Metropolitana de Buenos Aires',NULL),(3,1,NULL,NULL,'NORTE',NULL,NULL,1,NULL,'Region Norte',NULL),(4,1,NULL,NULL,'SUR',NULL,NULL,1,NULL,'Region Sur',NULL),(5,0,NULL,NULL,'F09',NULL,NULL,3,NULL,'Centro','Cordoba'),(6,1,NULL,NULL,'A02',NULL,NULL,3,NULL,'Noreste Argentino M','Misiones'),(7,2,NULL,NULL,'F10F35',NULL,NULL,3,NULL,'Noreste Argentino FCC','Corrientes/Chaco/Formosa'),(8,1,NULL,NULL,'F10',NULL,NULL,7,NULL,'Noreste Argentino C','Corrientes'),(9,1,NULL,NULL,'F35',NULL,NULL,7,NULL,'Noreste Argentino','Chaco/Formosa'),(10,1,NULL,NULL,'C46',NULL,NULL,3,NULL,'Region Cuyo SJ','San Juan'),(11,1,NULL,NULL,'E04',NULL,NULL,3,NULL,'Region Cuyo SL','San Luis'),(12,0,'1152','Saenz','1031',NULL,'Ciudad de Buenos Aires',2,'Ciudad de Buenos Aires','LOCAL POMPEYA','Ciudad de Buenos Aires'),(13,0,'5243','Francisco Beiro','1033',NULL,'Ciudad de Buenos Aires',2,'Ciudad de Buenos Aires','LOCAL BEIRO','Ciudad de Buenos Aires'),(14,2,'2064','Bonifacini','1050',NULL,'General San Martin',2,'General San Martin','LOCAL SAN MARTIN','Buenos Aires'),(15,2,'2630','Jose A. Lopez','2859',NULL,'Quilmes',2,'San Francisco Solano','LOCAL SOLANO','Buenos Aires'),(16,1,'495','Suipacha','2905',NULL,'Merlo',2,'Merlo','LOCAL MORON','Buenos Aires'),(17,0,'115','Noguera','3134',NULL,'Ituzaingo',2,'San Antonio de Padua','LOCAL PADUA','Buenos Aires'),(18,0,'7097','Ramon Falcon','3280',NULL,'Ciudad de Buenos Aires',2,'Ciudad de Buenos Aires','LOCAL LINIERS','Ciudad de Buenos Aires'),(19,0,'2001','Santa Fe','4930',NULL,'San Isidro',2,'Martinez','LOCAL MARTINEZ','Buenos Aires'),(20,0,'796','Regimiento de Patricios','5663',NULL,'Ciudad de Buenos Aires',2,'Ciudad de Buenos Aires','LOCAL BARRACAS','Ciudad de Buenos Aires'),(21,0,'574','Mitre','5903',NULL,'Moreno',2,'Moreno','LOCAL MORENO','Buenos Aires'),(22,0,'296','9 de Julio','3393',NULL,'Cordoba Capital',5,'Cordoba','LOCAL CORDOBA','Cordoba'),(23,0,'957','General Paz','4994',NULL,'Rio Cuarto',5,'Rio Cuarto','LOCAL RIO IV','Cordoba'),(24,0,'2202','25 de Mayo','5907',NULL,'San Justo',5,'San Francisco','LOCAL SAN FRANCISCO','Cordoba'),(25,0,'165','9 de Julio','8043',NULL,'Punilla',5,'Villa Carlos Paz','LOCAL CARLOS PAZ','Cordoba'),(26,0,'163','Rivera Indarte','9085',NULL,'Cordoba Capital',5,'Cordoba','LOCAL RIVERA INDARTE','Cordoba'),(27,0,'64','Libertad','9087',NULL,'Obera',6,'Obera','LOCAL OBERA','Misiones'),(28,1,'1939','Bolivar','4176',NULL,'Capital',6,'Posadas','LOCAL POSADAS 1','Misiones'),(29,0,'2076','Bolivar','6988',NULL,'Capital',6,'Posadas','LOCAL POSADAS 2','Misiones'),(30,1,'1787','San Martin','9176',NULL,'Eldorado',6,'Eldorado','LOCAL EL DORADO','Misiones'),(31,0,'1384','Junin','3222',NULL,'Capital',8,'Corrientes','LOCAL CORRIENTES 1','Corrientes'),(32,0,'1262','Junin','6987',NULL,'Capital',8,'Corrientes','LOCAL CORRIENTES 2','Corrientes'),(33,0,'180','San Martin','4962',NULL,'Comandante Fernandez',9,'Presidencia Roque Saenz Pena','LOCAL SAENZ PENA','Chaco'),(34,0,'612','Rivadavia','6986',NULL,'Formosa',9,'Formosa','LOCAL FORMOSA','Formosa'),(35,0,'297','Rivadavia Este','2159',NULL,'Capital',10,'San Juan','LOCAL SAN JUAN 1','San Juan'),(36,0,'135','Rivadavia Este','9210',NULL,'Capital',10,'San Juan','LOCAL SAN JUAN 2','San Juan'),(37,0,'461','San Juan','2218',NULL,'Jachal',10,'San Jose de Jachal','LOCAL JACHAL','San Juan'),(38,0,NULL,'Diagonal Sarmiento','9152',NULL,'Caucete',10,'Caucete','LOCAL CAUCETE','San Juan'),(39,0,'908','Junin','4611',NULL,'La Capital',11,'San Luis','LOCAL SAN LUIS','San Luis'),(40,0,'531','Coronel Mercau','6962',NULL,'Junin',11,'Merlo','LOCAL MERLO','San Luis'),(41,0,NULL,NULL,'11111',NULL,NULL,9,NULL,'LOCAL CHACO (TERRENO)','CHACO');
/*!40000 ALTER TABLE `bussines_unit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-11  1:15:33