-- MySQL dump 10.13  Distrib 5.6.15, for osx10.7 (x86_64)
--
-- Host: localhost    Database: burucps
-- ------------------------------------------------------
-- Server version	5.6.15

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
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `active` bit(1) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `dialect` varchar(255) NOT NULL,
  `last_update_by` varchar(255) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `rule_condition` longtext NOT NULL,
  `rule_consequence` longtext NOT NULL,
  `rule_group` varchar(255) NOT NULL,
  `rule_name` varchar(255) NOT NULL,
  `salience` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_name` (`rule_name`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
INSERT INTO `rule` VALUES (1,3,'',NULL,'2014-06-24 00:35:18','MVEL',NULL,'2014-07-06 23:54:13','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"IEM_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_IEM_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 10);','POINTS','Puntos - Altas IEM',99),(2,1,'',NULL,'2014-06-28 18:49:57','MVEL',NULL,'2014-07-06 23:53:50','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"IEM_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_IEM_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 11);','POINTS','Puntos - Bajas IEM',99),(3,1,'',NULL,'2014-06-28 19:41:31','MVEL',NULL,'2014-07-06 23:55:23','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CPLAN_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_CPLAN_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 20);','POINTS','Puntos - Altas Cambios de Plan',99),(4,2,'',NULL,'2014-06-28 19:42:53','MVEL',NULL,'2014-07-06 23:56:27','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CPLAN_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_CPLAN_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 21);','POINTS','Puntos - Bajas Cambios de Plan',99),(5,1,'',NULL,'2014-06-28 19:44:21','MVEL',NULL,'2014-07-06 23:57:21','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"SVC_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_SVC_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 30);','POINTS','Puntos - Altas Paquetes de Servicio',99),(6,3,'',NULL,'2014-06-28 19:46:01','MVEL',NULL,'2014-07-06 23:58:09','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"SVC_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_SVC_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 31);','POINTS','Puntos - Bajas Paquetes de Servicio',99),(7,1,'',NULL,'2014-06-28 19:47:31','MVEL',NULL,'2014-07-07 00:00:29','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"GTIA_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_GTIA_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 40);','POINTS','Puntos - Altas Garantias',99),(8,1,'',NULL,'2014-06-28 19:48:09','MVEL',NULL,'2014-07-07 00:01:50','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"GTIA_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_GTIA_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 41);','POINTS','Puntos - Bajas Garantias',99),(9,3,'',NULL,'2014-06-28 19:49:15','MVEL',NULL,'2014-07-07 00:02:36','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"MIG_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_MIGPOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 50);','POINTS','Puntos - Altas Migraciones Positivas',99),(10,1,'',NULL,'2014-06-28 19:49:57','MVEL',NULL,'2014-07-07 00:03:26','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"MIG_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_MIGPOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 51);','POINTS','Puntos - Bajas Migraciones Positivas',99),(11,1,'',NULL,'2014-06-28 19:51:36','MVEL',NULL,'2014-07-07 00:04:16','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CATER_POS_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_CATERPOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 60);','POINTS','Puntos - Altas CATER Pospago',99),(12,1,'',NULL,'2014-06-28 19:52:20','MVEL',NULL,'2014-07-07 00:05:31','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CATER_POS_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_CATERPOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 61);','POINTS','Puntos - Bajas CATER Pospago',99),(13,1,'',NULL,'2014-06-28 19:53:49','MVEL',NULL,'2014-07-07 00:06:24','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CATER_PRE_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_CATERPRE_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 70);','POINTS','Puntos - Altas CATER Prepago',99),(14,1,'',NULL,'2014-06-28 19:54:28','MVEL',NULL,'2014-07-07 00:06:42','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CATER_PRE_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_CATERPRE_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 71);','POINTS','Puntos - Bajas CATER Prepago',99),(15,1,'',NULL,'2014-06-28 19:58:10','MVEL',NULL,'2014-07-07 00:06:59','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CASIM_POS_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_CASIMPOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 80);','POINTS','Puntos - Altas CASIM Pospago',99),(16,1,'',NULL,'2014-06-28 19:58:45','MVEL',NULL,'2014-07-07 00:07:12','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CASIM_POS_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_CASIMPOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 81);','POINTS','Puntos - Bajas CASIM Pospago',99),(17,1,'',NULL,'2014-06-28 19:59:28','MVEL',NULL,'2014-07-07 00:07:25','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CASIM_PRE_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_CASIMPRE_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 90);','POINTS','Puntos - Altas CASIM Prepago',99),(18,1,'',NULL,'2014-06-28 20:00:10','MVEL',NULL,'2014-07-07 00:07:39','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CASIM_PRE_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_CASIMPRE_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 91);','POINTS','Puntos - Bajas CASIM Prepago',99),(19,1,'',NULL,'2014-06-28 20:00:44','MVEL',NULL,'2014-07-07 00:07:54','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"BONOS_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_BONOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 100);','POINTS','Puntos - Altas Bonos',99),(20,1,'',NULL,'2014-06-28 20:01:16','MVEL',NULL,'2014-07-07 00:08:11','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"BONOS_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_BONOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 101);','POINTS','Puntos - Bajas Bonos',99),(21,2,'\0',NULL,'2014-06-28 20:01:50','MVEL',NULL,'2014-07-11 10:42:33','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"MTALK_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_MT_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 110);','POINTS','Puntos - Altas Movitalk',99),(22,1,'',NULL,'2014-06-28 20:02:20','MVEL',NULL,'2014-07-07 00:08:37','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"MTALK_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_MT_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 111);','POINTS','Puntos - Bajas Movitalk',99),(23,2,'',NULL,'2014-06-28 20:06:28','MVEL',NULL,'2014-06-30 00:44:47','$empleado: Employee()\r\n$pPuntajeObjetivo : Parameter(paramCode == \"PTOVTA_OBJ_PTS\")\r\n$pPorcentajePuntajeObjetivoMinimo : Parameter(paramCode == \"VTA_CTE_OBJ_PCT\")','statement.addLine(StatementLineType.OBJECTIVE, StatementLineGroup.OBJ_POINTS, $pPuntajeObjetivo.currentDescription, $pPuntajeObjetivo.value, null, null, 1);\r\n		\r\nDouble total = statement.pointsSubtotal;\r\nDouble porcentajeAlcanzado = (total / $pPuntajeObjetivo.value) * 100.0;\r\nstatement.setPointsObjPerc(porcentajeAlcanzado);\r\nInteger factor = 1;\r\nif (porcentajeAlcanzado < $pPorcentajePuntajeObjetivoMinimo.value) {\r\n	factor = 0;\r\n}\r\nSystem.out.println(\"Factor Altas: \" + factor);\r\nadditionalValues.put(\"factorAltas\",factor);','OTHERS','Puntos - Totalizacion de puntos',95),(24,1,'',NULL,'2014-06-28 20:07:44','MVEL',NULL,'2014-07-07 00:09:51','$empleado: Employee()\r\n$pPuntajeObjetivo : Parameter(paramCode == \"PTOVTA_OBJ_PTS\")\r\n$p : Parameter(paramCode == \"PVTA_BON_ARS\")','Integer factor = 1;\r\nif (statement.pointsObjPerc < $p.minValue) {\r\n	factor = 0;\r\n}\r\nstatement.addLine(StatementLineType.RULE, StatementLineGroup.OBJ_POINTS, $p.currentDescription, $p.value, null, $p.value * factor, 2);','POINTS','Puntos - Premio Postventa',94),(25,1,'',NULL,'2014-06-28 20:44:13','MVEL',NULL,'2014-07-07 00:11:18','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"IM\")\r\n$p : Parameter(paramCode == \"VTA_IM_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 10);','SALES','Altas - IM Control 500 MB',90),(26,1,'',NULL,'2014-06-28 20:46:05','MVEL',NULL,'2014-07-07 00:11:51','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"LEC\")\r\n$p : Parameter(paramCode == \"VTA_LEC_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 20);','SALES','Altas - LEC',90),(27,1,'',NULL,'2014-06-28 20:47:15','MVEL',NULL,'2014-07-07 00:12:17','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PLAN1\")\r\n$p : Parameter(paramCode == \"VTA_PLA_RG1_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 30);','SALES','Altas - Planes Externo/Interno Rango 1',90),(28,1,'',NULL,'2014-06-28 20:48:03','MVEL',NULL,'2014-07-07 00:12:40','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PLAN2\")\r\n$p : Parameter(paramCode == \"VTA_PLA_RG2_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 31);','SALES','Altas - Planes Externo/Interno Rango 2',90),(29,1,'',NULL,'2014-06-28 20:49:05','MVEL',NULL,'2014-07-07 00:12:57','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PLAN3\")\r\n$p : Parameter(paramCode == \"VTA_PLA_RG3_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 32);','SALES','Altas - Planes Externo/Interno Rango 3',90),(30,1,'',NULL,'2014-06-28 20:50:04','MVEL',NULL,'2014-07-07 00:13:15','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PLAN4\")\r\n$p : Parameter(paramCode == \"VTA_PLA_RG4_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 33);','SALES','Altas - Planes Externo/Interno Rango 4',90),(31,1,'',NULL,'2014-06-28 20:51:06','MVEL',NULL,'2014-07-07 00:13:30','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PLAN5\")\r\n$p : Parameter(paramCode == \"VTA_PLA_RG5_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 34);','SALES','Altas - Planes Externo/Interno Rango 5',90),(32,1,'',NULL,'2014-06-28 20:51:52','MVEL',NULL,'2014-07-07 00:13:43','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"CORP\")\r\n$p : Parameter(paramCode == \"VTA_PLA_CORP_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 40);','SALES','Altas - Planes Corporativos',90),(33,1,'',NULL,'2014-06-28 20:54:08','MVEL',NULL,'2014-07-07 00:14:22','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"2X1\")\r\n$p : Parameter(paramCode == \"VTA_PLA_2X1_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 40);','SALES','Altas - Planes Promo 2x1 2da Linea $ 169',90),(34,2,'',NULL,'2014-06-28 20:54:55','MVEL',NULL,'2014-07-07 00:15:14','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ACCESORIOS\")\r\n$p : Parameter(paramCode == \"VTA_ACC_BON_PCT\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity / 100.0, 50);','SALES','Altas - Accesorios',90),(35,1,'',NULL,'2014-06-28 20:55:57','MVEL',NULL,'2014-07-07 00:15:45','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PREP\")\r\n$p : Parameter(paramCode == \"VTA_PREP_INT_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 60);','SALES','Altas - Prepago Interno',90),(36,1,'',NULL,'2014-06-28 20:56:57','MVEL',NULL,'2014-07-07 00:16:11','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"CALL\")\r\n$p : Parameter(paramCode == \"VTA_CALL_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 70);','SALES','Altas - Operaciones Call Center',90),(37,1,'',NULL,'2014-06-28 20:58:40','MVEL',NULL,'2014-07-07 00:16:49','$empleado : Employee()\r\n$p : Parameter(paramCode == \"VTA_ITAU_RG1_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ITAU\" && quantity <= $p.maxValue)','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 80);','SALES','Altas - Tarjeta Itau Rango 1 (..10)',90),(38,1,'',NULL,'2014-06-28 20:59:25','MVEL',NULL,'2014-07-07 00:17:12','$empleado : Employee()\r\n$p : Parameter(paramCode == \"VTA_ITAU_RG2_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ITAU\" && quantity >= $p.minValue && quantity <= $p.maxValue)','Integer factor = (Integer) additionalValues.get(\"factorAltas\");Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 81);','SALES','Altas - Tarjeta Itau Rango 2 (10-20)',90),(39,1,'',NULL,'2014-06-28 21:00:10','MVEL',NULL,'2014-07-07 00:17:31','$empleado : Employee()\r\n$p : Parameter(paramCode == \"VTA_ITAU_RG3_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ITAU\" && quantity >= $p.minValue)','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 82);','SALES','Altas - Tarjeta Itau Rango 3 (20..)',90),(40,2,'',NULL,'2014-06-28 21:00:55','MVEL',NULL,'2014-07-07 00:17:57','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PORT\")\r\n$p : Parameter(paramCode == \"VTA_PORT_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 90);','SALES','Altas - Portabilidades',90),(41,4,'',NULL,'2014-06-28 21:09:59','MVEL',NULL,'2014-07-11 10:31:33','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"CASIM10\")\r\n$p : Parameter(paramCode == \"VTA_CASIMREPRO_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 99);','SALES','Altas - Casim /Repros ($ 50)',90),(42,5,'',NULL,'2014-06-28 21:51:53','MVEL',NULL,'2014-06-30 00:50:23','$empleado: Employee()\r\n$pQPREP : Parameter(paramCode == \"QVTA_IM_OP\")\r\n$pQLEC : Parameter(paramCode == \"QVTA_LEC_OP\")\r\n$pQVOZ : Parameter(paramCode == \"QVTA_ALTAS_VOZ_OP\")\r\n$pPrep : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PREP\")\r\n$pLec : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"LEC\")\r\n$pAltasVoz : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS_DE_VOZ\")\r\n$pAltas : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS\")','Double altas = $pAltas.quantity;\r\nDouble qAltas = $pQPREP.value + $pQLEC.value + $pQVOZ.value;\r\nInteger employeeCount = $empleado.bu.employeeCount;\r\n	\r\nadditionalValues.put(\"QVTA_ALTAS\", qAltas);\r\n	\r\nstatement.addLine(StatementLineType.OBJECTIVE, StatementLineGroup.OBJ_Q, $pQPREP.currentDescription, $pQPREP.value, $pQPREP.value / employeeCount, $pPrep.quantity, 1);\r\nstatement.addLine(StatementLineType.OBJECTIVE, StatementLineGroup.OBJ_Q, $pQLEC.currentDescription, $pQLEC.value, $pQLEC.value / employeeCount, $pLec.quantity, 2);\r\nstatement.addLine(StatementLineType.OBJECTIVE, StatementLineGroup.OBJ_Q, $pQVOZ.currentDescription, $pQVOZ.value, $pQVOZ.value / employeeCount, $pAltasVoz.quantity, 3);\r\nstatement.addLine(StatementLineType.OBJECTIVE, StatementLineGroup.OBJ_Q, \"Total ALTAS (ALTAS DE VOZ / LEC / PREPAGOS / IM / 2x1)\", qAltas, qAltas / employeeCount, $pAltas.quantity, 4);','OBJ_Q','Totalizacion por desempeno individual',85),(43,15,'',NULL,'2014-06-28 21:56:39','MVEL',NULL,'2014-06-30 23:02:38','$empleado : Employee()\r\n$p : Parameter(paramCode == \"QIND_ALTAS_RG1_BON_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS\")','Double qAltas = (Double) additionalValues.get(\"QVTA_ALTAS\");\r\nDouble performance = $total.quantity * 100.0 / (qAltas / $empleado.bu.employeeCount);\r\nInteger factor = 0;\r\nif ((performance >= $p.minValue) && (performance < $p.maxValue)) {\r\n	factor = 1;\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, null, $p.value * factor, 10);','INDIVIDUAL_INCENTIVE','Incentivos  Individuales - Altas 100% Q',80),(44,20,'',NULL,'2014-06-28 21:58:14','MVEL',NULL,'2014-06-30 23:02:54','$empleado : Employee()\r\n$p : Parameter(paramCode == \"QIND_ALTAS_RG2_BON_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS\")\r\n$pQPREP : Parameter(paramCode == \"QVTA_IM_OP\")\r\n$pQLEC : Parameter(paramCode == \"QVTA_LEC_OP\")\r\n$pQVOZ : Parameter(paramCode == \"QVTA_ALTAS_VOZ_OP\")','//Double qPosAltas = (Double) additionalValues.get(\"QVTA_ALTAS\");\r\nDouble qPosAltas = $pQPREP.value + $pQLEC.value + $pQVOZ.value;\r\nDouble qEmpAltas = qPosAltas / $empleado.bu.employeeCount;\r\nDouble performance = $total.quantity * 100.0 / qEmpAltas;\r\nInteger factor = 0;\r\nif (performance >= $p.minValue) {\r\n	factor = 1;\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, null, $p.value * factor, 11);','INDIVIDUAL_INCENTIVE','Incentivos  Individuales - Altas 120% Q',80),(45,1,'',NULL,'2014-06-28 22:07:04','MVEL',NULL,'2014-07-07 00:20:35','$empleado : Employee()\r\n	$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"LEC\")\r\n$p : Parameter(paramCode == \"QIND_LEC_PU_ARS\")\r\n$q : Parameter(paramCode == \"QVTA_LEC_OP\")','Double performance = $total.quantity * 100.0 / ($q.value / $empleado.bu.employeeCount);\r\nInteger factor = 0;\r\nif (performance >= $p.getMinValue()) {\r\n	factor = 1;\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity * factor, 20);','INDIVIDUAL_INCENTIVE','Incentivos  Individuales - LEC 100% Q',80),(46,2,'',NULL,'2014-06-28 22:18:21','MVEL',NULL,'2014-07-07 00:21:56','$empleado : Employee()\r\n$pQPREP : Parameter(paramCode == \"QVTA_IM_OP\")\r\n$pQLEC : Parameter(paramCode == \"QVTA_LEC_OP\")\r\n$pQVOZ : Parameter(paramCode == \"QVTA_ALTAS_VOZ_OP\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS\")\r\n$totalBu : Summary(bu == $empleado.bu && summaryCode == \"ALTAS\" && quantity < ($pQPREP.value + $pQLEC.value + $pQVOZ.value))\r\n$p : Parameter(paramCode == \"QIND_ALTAS_VOZ_PU_ARS\")\r\n$totalVoz : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS_DE_VOZ\")','Double performance = $total.quantity * 100.0 / (($pQPREP.value + $pQLEC.value + $pQVOZ.value) / $empleado.bu.employeeCount);\r\nInteger factor = 0;\r\nif (performance >= $p.minValue) {\r\n	factor = 1;\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $totalVoz.quantity, $p.value * $totalVoz.quantity * factor, 30);','INDIVIDUAL_INCENTIVE','Incentivos  Individuales - Altas de Voz 100% Q',80),(47,5,'',NULL,'2014-06-28 22:19:17','MVEL',NULL,'2014-07-07 00:23:27','$empleado : Employee()\r\n$pQPREP : Parameter(paramCode == \"QVTA_IM_OP\")\r\n$pQLEC : Parameter(paramCode == \"QVTA_LEC_OP\")\r\n$pQVOZ : Parameter(paramCode == \"QVTA_ALTAS_VOZ_OP\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS\")\r\n$totalBu : Summary(bu == $empleado.bu && summaryCode == \"ALTAS\")\r\n$p : Parameter(paramCode == \"QVTA_ALTAS_VOZ_PU_ARS\")\r\n$totalVoz : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS_DE_VOZ\")','Double performance = $total.quantity * 100.0 / (($pQPREP.value + $pQLEC.value + $pQVOZ.value) / $empleado.bu.employeeCount);\r\nInteger factor = 0;\r\nif ((performance >= $p.minValue) && ($totalBu.quantity >= ($pQPREP.value + $pQLEC.value + $pQVOZ.value))) {\r\n	factor = 1;\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $totalVoz.quantity, $p.value * $totalVoz.quantity * factor, 31);','INDIVIDUAL_INCENTIVE','Incentivos  Individuales - Altas de Voz 100% Q y Q Punto de Venta',80),(48,22,'',NULL,'2014-06-28 22:21:27','MVEL',NULL,'2014-06-30 23:06:51','$empleado : Employee()\r\n$p : Parameter(paramCode == \"IVTA_ALTAS_RG1_BON_ARS\")\r\n$totalBu : Summary(bu == $empleado.bu && summaryCode == \"ALTAS_Y_CATER\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS_Y_CATER\")','Integer factor = 0;\r\nif (($totalBu.quantity >= $p.minValue) && ($totalBu.quantity < $p.maxValue)) {\r\n	factor = 1;\r\n}\r\nDouble performance = 100.0 * $total.quantity / $totalBu.quantity;\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $totalBu.quantity, $p.value * performance * factor, 10);','POS_INCENTIVE','Incentivos  Punto de Venta - X Altas Proporcional',70),(49,7,'',NULL,'2014-06-28 22:22:40','MVEL',NULL,'2014-06-30 23:06:35','$empleado : Employee()\r\n$p : Parameter(paramCode == \"IVTA_ALTAS_RG2_BON_ARS\")\r\n$totalBu : Summary(bu == $empleado.bu && summaryCode == \"ALTAS_Y_CATER\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS_Y_CATER\")','Integer factor = 0;\r\nif ($totalBu.quantity >= $p.minValue) {\r\n	factor = 1;\r\n}\r\nDouble performance = 100.0 * $total.quantity / $totalBu.quantity;\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $totalBu.quantity, $p.value * performance * factor, 11);','POS_INCENTIVE','Incentivos  Punto de Venta - XX Altas Proporcional',70),(50,1,'',NULL,'2014-06-28 22:25:35','MVEL',NULL,'2014-07-07 00:24:57','$empleado : Employee()\r\n$p : Parameter(paramCode == \"BAJAS_IM_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"IM_BAJAS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 10);','DEDUCTIONS','Bajas - IM',60),(51,1,'',NULL,'2014-06-28 22:26:14','MVEL',NULL,'2014-07-07 00:25:10','$empleado : Employee()\r\n$p : Parameter(paramCode == \"BAJAS_LEC_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"LEC_BAJAS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 20);','DEDUCTIONS','Bajas - MEC',60),(52,1,'',NULL,'2014-06-28 22:26:56','MVEL',NULL,'2014-07-07 00:25:28','$empleado : Employee()\r\n$p : Parameter(paramCode == \"BAJA_PLAN_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PLAN_BAJAS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 30);','DEDUCTIONS','Bajas - Planes Interno/Externo',60),(53,1,'',NULL,'2014-06-28 22:27:39','MVEL',NULL,'2014-07-07 00:25:41','$empleado : Employee()\r\n$p : Parameter(paramCode == \"BAJA_CPLANFULL_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"FULL_BAJAS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 40);','DEDUCTIONS','Bajas - CDP a planes Full',60),(54,1,'',NULL,'2014-06-28 22:28:18','MVEL',NULL,'2014-07-07 00:25:53','$empleado : Employee()\r\n$p : Parameter(paramCode == \"BAJA_RECLAMOS_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"RECLAMOS\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 50);','DEDUCTIONS','Bajas - Observaciones (Reclamos)',60),(55,1,'',NULL,'2014-06-28 22:28:55','MVEL',NULL,'2014-07-07 00:26:06','$empleado : Employee()\r\n$p : Parameter(paramCode == \"BAJA_FRAUDES\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"FRAUDES\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, $p.value, $total.quantity, $p.value * $total.quantity, 60);','DEDUCTIONS','Bajas - Debitos por fraudes',60),(56,1,'',NULL,'2014-06-28 22:29:25','MVEL',NULL,'2014-07-07 00:26:47','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"DIF_PRECIOS\")','statement.addLine(StatementLineType.RULE, StatementLineGroup.DEDUCTIONS, \"Diferencias de precio\", null, null, $total.quantity, 70);','DEDUCTIONS','Bajas - Diferencias de precio',60),(57,3,'',NULL,'2014-06-29 21:18:58','MVEL',NULL,'2014-07-07 00:27:12','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"SUELDO_NETO\")\r\n$p : Parameter(paramCode == \"SUELDO_NETO\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, null, null, $total.quantity, 1);','OTHERS','Sueldo Neto Cobrado',90),(58,3,'',NULL,'2014-06-29 21:21:34','MVEL',NULL,'2014-07-07 00:27:34','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"SUELDO_NETO\")\r\n$p : Parameter(paramCode == \"SUELDO_NETO\")','statement.addLine(StatementLineType.RULE, StatementLineGroup.DEDUCTIONS, $p.currentDescription, null, null, -$total.quantity, 1);','DEDUCTIONS','Bajas - Sueldo Neto',60),(59,0,'',NULL,'2014-07-01 00:33:17','MVEL',NULL,'2014-07-01 00:33:17','$empleado : Employee()\r\n$p : Parameter(paramCode == \"ROUND\")','Double top = ((long) Math.round(statement.total / 10.0)) * 10.0;\r\nDouble round = top - statement.total;\r\nstatement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, null, null, round, 10);','FIXED','Redondeo',10),(60,1,'',NULL,'2014-07-10 13:17:50','MVEL',NULL,'2014-07-10 13:18:09','$empleado: Employee()','if (statement.total < 0.0) {\r\n	Double dueBalance = -statement.total;\r\n	statement.dueBalance = dueBalance;\r\n	statement.total += dueBalance;\r\n}','FIXED','Balance Negativo',20),(61,0,'',NULL,'2014-07-10 14:01:41','MVEL',NULL,'2014-07-10 14:01:41','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"SALDO_JAG\")\r\n$p : Parameter(paramCode == \"SALDO_JAG\")','statement.addLine(StatementLineType.RULE, $p.paramCategory, $p.currentDescription, null, null, $total.quantity, 2);','DEDUCTIONS','Saldo a favor de JAG mes anterior',60);
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule_set`
--

DROP TABLE IF EXISTS `rule_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule_set` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `last_update_by` varchar(255) DEFAULT NULL,
  `last_update_date` datetime DEFAULT NULL,
  `rule_set_description` varchar(255) DEFAULT NULL,
  `rule_set_name` varchar(255) NOT NULL,
  `rule_set_globals` longtext NOT NULL,
  `rule_set_imports` longtext NOT NULL,
  `rule_set_package` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rule_set_name` (`rule_set_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule_set`
--

LOCK TABLES `rule_set` WRITE;
/*!40000 ALTER TABLE `rule_set` DISABLE KEYS */;
INSERT INTO `rule_set` VALUES (1,4,NULL,'2014-06-24 00:56:13',NULL,'2014-07-09 13:20:08','Liquidacion para el vendedor tipico','Vendedor Standard','global ar.com.burudos.sales.statement.EmployeeStatement statement\r\nglobal java.util.Map additionalValues','import ar.com.burudos.party.Employee;\r\nimport ar.com.burudos.sales.statement.Parameter;\r\nimport ar.com.burudos.sales.statement.EmployeeStatement;\r\nimport ar.com.burudos.sales.Summary;\r\nimport ar.com.burucps.sales.statement.StatementLineGroup; \r\nimport ar.com.burucps.sales.statement.StatementLineType;','package ar.com.burucps.sales.statement;');
/*!40000 ALTER TABLE `rule_set` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-12 18:53:49
