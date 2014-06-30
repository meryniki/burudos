
--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
INSERT INTO `rule` VALUES (1,1,'',NULL,'2014-06-24 00:35:18','MVEL',NULL,'2014-06-28 18:39:03','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"IEM_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_IEM_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 10);','POINTS','Puntos - Altas IEM',99),(2,0,'',NULL,'2014-06-28 18:49:57','MVEL',NULL,'2014-06-28 18:49:57','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"IEM_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_IEM_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 11);','POINTS','Puntos - Bajas IEM',99),(3,0,'',NULL,'2014-06-28 19:41:31','MVEL',NULL,'2014-06-28 19:41:31','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CPLAN_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_CPLAN_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 20);','POINTS','Puntos - Altas Cambios de Plan',99),(4,1,'',NULL,'2014-06-28 19:42:53','MVEL',NULL,'2014-06-28 19:42:58','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CPLAN_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_CPLAN_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 21);','POINTS','Puntos - Bajas Cambios de Plan',99),(5,0,'',NULL,'2014-06-28 19:44:21','MVEL',NULL,'2014-06-28 19:44:21','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"SVC_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_SVC_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 30);','POINTS','Puntos - Altas Paquetes de Servicio',99),(6,2,'',NULL,'2014-06-28 19:46:01','MVEL',NULL,'2014-06-29 19:23:41','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"SVC_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_SVC_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 31);','POINTS','Puntos - Bajas Paquetes de Servicio',99),(7,0,'',NULL,'2014-06-28 19:47:31','MVEL',NULL,'2014-06-28 19:47:31','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"GTIA_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_GTIA_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 40);','POINTS','Puntos - Altas Garantias',99),(8,0,'',NULL,'2014-06-28 19:48:09','MVEL',NULL,'2014-06-28 19:48:09','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"GTIA_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_GTIA_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 41);','POINTS','Puntos - Bajas Garantias',99),(9,0,'',NULL,'2014-06-28 19:49:15','MVEL',NULL,'2014-06-28 19:49:15','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"MIG_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_MIGPOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 50);','POINTS','Puntos - Altas Migraciones Positivas',99),(10,0,'',NULL,'2014-06-28 19:49:57','MVEL',NULL,'2014-06-28 19:49:57','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"MIG_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_MIGPOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 51);','POINTS','Puntos - Bajas Migraciones Positivas',99),(11,0,'',NULL,'2014-06-28 19:51:36','MVEL',NULL,'2014-06-28 19:51:36','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CATER_POS_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_CATERPOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 60);','POINTS','Puntos - Altas CATER Pospago',99),(12,0,'',NULL,'2014-06-28 19:52:20','MVEL',NULL,'2014-06-28 19:52:20','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CATER_POS_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_CATERPOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 61);','POINTS','Puntos - Bajas CATER Pospago',99),(13,0,'',NULL,'2014-06-28 19:53:49','MVEL',NULL,'2014-06-28 19:53:49','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CATER_PRE_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_CATERPRE_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 70);','POINTS','Puntos - Altas CATER Prepago',99),(14,0,'',NULL,'2014-06-28 19:54:28','MVEL',NULL,'2014-06-28 19:54:28','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CATER_PRE_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_CATERPRE_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 71);','POINTS','Puntos - Bajas CATER Prepago',99),(15,0,'',NULL,'2014-06-28 19:58:10','MVEL',NULL,'2014-06-28 19:58:10','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CASIM_POS_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_CASIMPOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 80);','POINTS','Puntos - Altas CASIM Pospago',99),(16,0,'',NULL,'2014-06-28 19:58:45','MVEL',NULL,'2014-06-28 19:58:45','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CASIM_POS_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_CASIMPOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 81);','POINTS','Puntos - Bajas CASIM Pospago',99),(17,0,'',NULL,'2014-06-28 19:59:28','MVEL',NULL,'2014-06-28 19:59:28','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CASIM_PRE_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_CASIMPRE_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 90);','POINTS','Puntos - Altas CASIM Prepago',99),(18,0,'',NULL,'2014-06-28 20:00:10','MVEL',NULL,'2014-06-28 20:00:10','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"CASIM_PRE_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_CASIMPRE_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 91);','POINTS','Puntos - Bajas CASIM Prepago',99),(19,0,'',NULL,'2014-06-28 20:00:44','MVEL',NULL,'2014-06-28 20:00:44','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"BONOS_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_BONOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 100);','POINTS','Puntos - Altas Bonos',99),(20,0,'',NULL,'2014-06-28 20:01:16','MVEL',NULL,'2014-06-28 20:01:16','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"BONOS_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_BONOS_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 101);','POINTS','Puntos - Bajas Bonos',99),(21,0,'',NULL,'2014-06-28 20:01:50','MVEL',NULL,'2014-06-28 20:01:50','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"MTALK_ALTAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_ALTAS_MT_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 110);','POINTS','Puntos - Altas Movitalk',99),(22,0,'',NULL,'2014-06-28 20:02:20','MVEL',NULL,'2014-06-28 20:02:20','$empleado : Employee()\r\n$total : Summary(bu == $empleado.bu && summaryCode == \"MTALK_BAJAS\")\r\n$p : Parameter(paramCode == \"PUNTOS_BAJAS_MT_PU_PTS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 111);','POINTS','Puntos - Bajas Movitalk',99),(23,1,'',NULL,'2014-06-28 20:06:28','MVEL',NULL,'2014-06-28 21:53:31','$empleado: Employee()\r\n$pPuntajeObjetivo : Parameter(paramCode == \"PTOVTA_OBJ_PTS\")\r\n$pPorcentajePuntajeObjetivoMinimo : Parameter(paramCode == \"VTA_CTE_OBJ_PCT\")','statement.addLine(StatementLineType.OBJECTIVE, StatementLineGroup.OBJ_POINTS, $pPuntajeObjetivo.getCurrentDescription(), $pPuntajeObjetivo.getValue(), null, null, 1);\r\n		\r\nDouble total = statement.getPointsSubtotal();\r\nDouble porcentajeAlcanzado = (total / $pPuntajeObjetivo.getValue()) * 100.0;\r\nstatement.setPointsObjPerc(porcentajeAlcanzado);\r\nInteger factor = 1;\r\nif (porcentajeAlcanzado < $pPorcentajePuntajeObjetivoMinimo.getValue()) {\r\n	factor = 0;\r\n}\r\nSystem.out.println(\"Factor Altas: \" + factor);\r\nadditionalValues.put(\"factorAltas\",factor);','OTHERS','Puntos - Totalizacion de puntos',95),(24,0,'',NULL,'2014-06-28 20:07:44','MVEL',NULL,'2014-06-28 20:07:44','$empleado: Employee()\r\n$pPuntajeObjetivo : Parameter(paramCode == \"PTOVTA_OBJ_PTS\")\r\n$p : Parameter(paramCode == \"PVTA_BON_ARS\")','Integer factor = 1;\r\nif (statement.getPointsObjPerc() < $p.getMinValue()) {\r\n	factor = 0;\r\n}\r\nstatement.addLine(StatementLineType.RULE, StatementLineGroup.OBJ_POINTS, $p.getCurrentDescription(), $p.getValue(), null, $p.getValue() * factor, 2);','POINTS','Puntos - Premio Postventa',94),(25,0,'',NULL,'2014-06-28 20:44:13','MVEL',NULL,'2014-06-28 20:44:13','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"IM\")\r\n$p : Parameter(paramCode == \"VTA_IM_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\n		\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 10);','SALES','Altas - IM Control 500 MB',90),(26,0,'',NULL,'2014-06-28 20:46:05','MVEL',NULL,'2014-06-28 20:46:05','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"LEC\")\r\n$p : Parameter(paramCode == \"VTA_LEC_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 20);','SALES','Altas - LEC',90),(27,0,'',NULL,'2014-06-28 20:47:15','MVEL',NULL,'2014-06-28 20:47:15','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PLAN1\")\r\n$p : Parameter(paramCode == \"VTA_PLA_RG1_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\n		\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 30);','SALES','Altas - Planes Externo/Interno Rango 1',90),(28,0,'',NULL,'2014-06-28 20:48:03','MVEL',NULL,'2014-06-28 20:48:03','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PLAN2\")\r\n$p : Parameter(paramCode == \"VTA_PLA_RG2_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\n		\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 31);','SALES','Altas - Planes Externo/Interno Rango 2',90),(29,0,'',NULL,'2014-06-28 20:49:05','MVEL',NULL,'2014-06-28 20:49:05','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PLAN3\")\r\n$p : Parameter(paramCode == \"VTA_PLA_RG3_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\n\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 32);','SALES','Altas - Planes Externo/Interno Rango 3',90),(30,0,'',NULL,'2014-06-28 20:50:04','MVEL',NULL,'2014-06-28 20:50:04','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PLAN4\")\r\n$p : Parameter(paramCode == \"VTA_PLA_RG4_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\n		\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 33);','SALES','Altas - Planes Externo/Interno Rango 4',90),(31,0,'',NULL,'2014-06-28 20:51:06','MVEL',NULL,'2014-06-28 20:51:06','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PLAN5\")\r\n$p : Parameter(paramCode == \"VTA_PLA_RG5_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\n		\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 34);','SALES','Altas - Planes Externo/Interno Rango 5',90),(32,0,'',NULL,'2014-06-28 20:51:52','MVEL',NULL,'2014-06-28 20:51:52','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"CORP\")\r\n$p : Parameter(paramCode == \"VTA_PLA_CORP_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\n		\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 40);','SALES','Altas - Planes Corporativos',90),(33,0,'',NULL,'2014-06-28 20:54:08','MVEL',NULL,'2014-06-28 20:54:08','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"2X1\")\r\n$p : Parameter(paramCode == \"VTA_PLA_2X1_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\n	\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 40);','SALES','Altas - Planes Promo 2x1 2da Linea $ 169',90),(34,0,'',NULL,'2014-06-28 20:54:55','MVEL',NULL,'2014-06-28 20:54:55','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ACC\")\r\n$p : Parameter(paramCode == \"VTA_ACC_BON_PCT\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() / 100.0, 50);','SALES','Altas - Accesorios',90),(35,0,'',NULL,'2014-06-28 20:55:57','MVEL',NULL,'2014-06-28 20:55:57','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PREP\")\r\n$p : Parameter(paramCode == \"VTA_PREP_INT_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 60);','SALES','Altas - Prepago Interno',90),(36,0,'',NULL,'2014-06-28 20:56:57','MVEL',NULL,'2014-06-28 20:56:57','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"CALL\")\r\n$p : Parameter(paramCode == \"VTA_CALL_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\n		\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 70);','SALES','Altas - Operaciones Call Center',90),(37,0,'',NULL,'2014-06-28 20:58:40','MVEL',NULL,'2014-06-28 20:58:40','$empleado : Employee()\r\n$p : Parameter(paramCode == \"VTA_ITAU_RG1_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ITAU\" && quantity <= $p.maxValue)','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\n		\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), \r\n$p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 80);','SALES','Altas - Tarjeta Itau Rango 1 (..10)',90),(38,0,'',NULL,'2014-06-28 20:59:25','MVEL',NULL,'2014-06-28 20:59:25','$empleado : Employee()\r\n$p : Parameter(paramCode == \"VTA_ITAU_RG2_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ITAU\" && quantity >= $p.minValue && quantity <= $p.maxValue)','Integer factor = (Integer) additionalValues.get(\"factorAltas\");Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\n		\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 81);','SALES','Altas - Tarjeta Itau Rango 2 (10-20)',90),(39,0,'',NULL,'2014-06-28 21:00:10','MVEL',NULL,'2014-06-28 21:00:10','$empleado : Employee()\r\n$p : Parameter(paramCode == \"VTA_ITAU_RG3_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ITAU\" && quantity >= $p.minValue)','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\n		\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 82);','SALES','Altas - Tarjeta Itau Rango 3 (20..)',90),(40,1,'',NULL,'2014-06-28 21:00:55','MVEL',NULL,'2014-06-28 21:09:20','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PORT\")\r\n$p : Parameter(paramCode == \"VTA_PORT_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\n		\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 90);','SALES','Altas - Portabilidades',90),(41,0,'',NULL,'2014-06-28 21:09:59','MVEL',NULL,'2014-06-28 21:09:59','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"CASIM_REPRO\")\r\n$p : Parameter(paramCode == \"VTA_CASIMREPRO_PU_ARS\")','Integer factor = 1; \r\nif (additionalValues.containsKey(\"factorAltas\")) {\r\n	factor = (Integer) additionalValues.get(\"factorAltas\");\r\n}\r\n		\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 99);','SALES','Altas - Casim /Repros ($ 50)',90),(42,3,'',NULL,'2014-06-28 21:51:53','MVEL',NULL,'2014-06-29 20:29:11','$empleado: Employee()\r\n$pQPREP : Parameter(paramCode == \"QVTA_IM_OP\")\r\n$pQLEC : Parameter(paramCode == \"QVTA_LEC_OP\")\r\n$pQVOZ : Parameter(paramCode == \"QVTA_ALTAS_VOZ_OP\")\r\n$pPrep : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PREP\")\r\n$pLec : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"LEC\")\r\n$pAltasVoz : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS_DE_VOZ\")\r\n$pAltas : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS\")','Double altas = $pAltas.getQuantity();\r\nDouble qAltas = $pQPREP.getValue() + $pQLEC.getValue() + $pQVOZ.getValue();\r\nInteger employeeCount = $empleado.getBu().getEmployeeCount();\r\n	\r\nadditionalValues.put(\"QVTA_ALTAS\", qAltas);\r\n	\r\nstatement.addLine(StatementLineType.OBJECTIVE, StatementLineGroup.OBJ_Q, $pQPREP.getCurrentDescription(), $pQPREP.getValue(), $pQPREP.getValue() / employeeCount, $pPrep.getQuantity(), 1);\r\nstatement.addLine(StatementLineType.OBJECTIVE, StatementLineGroup.OBJ_Q, $pQLEC.getCurrentDescription(), $pQLEC.getValue(), $pQLEC.getValue() / employeeCount, $pLec.getQuantity(), 2);\r\nstatement.addLine(StatementLineType.OBJECTIVE, StatementLineGroup.OBJ_Q, $pQVOZ.getCurrentDescription(), $pQVOZ.getValue(), $pQVOZ.getValue() / employeeCount, $pAltasVoz.getQuantity(), 3);\r\nstatement.addLine(StatementLineType.OBJECTIVE, StatementLineGroup.OBJ_Q, \"Total ALTAS (ALTAS DE VOZ / LEC / PREPAGOS)\", qAltas, qAltas / employeeCount, $pAltas.getQuantity(), 4);','OBJ_Q','Totalizacion por desempeno individual',85),(43,2,'',NULL,'2014-06-28 21:56:39','MVEL',NULL,'2014-06-29 20:30:42','$empleado : Employee()\r\n$p : Parameter(paramCode == \"QVTA_TOT_RG1_BON_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS\")','Integer qAltas = (Integer) additionalValues.get(\"QVTA_ALTAS\");\r\nDouble performance = $total.getQuantity() * 100.0 / (qAltas / $empleado.getBu().getEmployeeCount());\r\nInteger factor = 0;\r\nif ( (performance >= $p.getMinValue()) && (performance < $p.getMaxValue())) {\r\n	factor = 1;\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), null, null, $p.getValue() * factor, 10);','INDIVIDUAL_INCENTIVE','Incentivos  Individuales - Altas 100% Q',80),(44,2,'',NULL,'2014-06-28 21:58:14','MVEL',NULL,'2014-06-29 20:32:36','$empleado : Employee()\r\n$p : Parameter(paramCode == \"QVTA_TOT_RG2_BON_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS\")','Integer qAltas = (Integer) additionalValues.get(\"QVTA_ALTAS\");\r\n	Double performance = $total.getQuantity() * 100.0 / (qAltas / $empleado.getBu().getEmployeeCount());\r\nInteger factor = 0;\r\nif (performance >= $p.getMinValue()) {\r\n	factor = 1;\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), null, null, $p.getValue() * factor, 11);','INDIVIDUAL_INCENTIVE','Incentivos  Individuales - Altas 120% Q',80),(45,0,'',NULL,'2014-06-28 22:07:04','MVEL',NULL,'2014-06-28 22:07:04','$empleado : Employee()\r\n	$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"LEC\")\r\n$p : Parameter(paramCode == \"QIND_LEC_PU_ARS\")\r\n$q : Parameter(paramCode == \"QVTA_LEC_OP\")','Double performance = $total.getQuantity() * 100.0 / ($q.getValue() / $empleado.getBu().getEmployeeCount());\r\nInteger factor = 0;\r\nif (performance >= $p.getMinValue()) {\r\n	factor = 1;\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity() * factor, 20);','INDIVIDUAL_INCENTIVE','Incentivos  Individuales - LEC 100% Q',80),(46,1,'',NULL,'2014-06-28 22:18:21','MVEL',NULL,'2014-06-29 20:34:39','$empleado : Employee()\r\n$pQPREP : Parameter(paramCode == \"QVTA_IM_OP\")\r\n$pQLEC : Parameter(paramCode == \"QVTA_LEC_OP\")\r\n$pQVOZ : Parameter(paramCode == \"QVTA_ALTAS_VOZ_OP\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS\")\r\n$totalBu : Summary(bu == $empleado.bu && summaryCode == \"ALTAS\" && quantity < ($pQPREP.value + $pQLEC.value + $pQVOZ.value))\r\n$p : Parameter(paramCode == \"QIND_ALTAS_VOZ_PU_ARS\")\r\n$totalVoz : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS_DE_VOZ\")','Double performance = $total.getQuantity() * 100.0 / (($pQPREP.value + $pQLEC.value + $pQVOZ.value) / $empleado.getBu().getEmployeeCount());\r\nInteger factor = 0;\r\nif (performance >= $p.getMinValue()) {\r\n	factor = 1;\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $totalVoz.getQuantity(), $p.getValue() * $totalVoz.getQuantity() * factor, 30);','INDIVIDUAL_INCENTIVE','Incentivos  Individuales - Altas de Voz 100% Q',80),(47,3,'',NULL,'2014-06-28 22:19:17','MVEL',NULL,'2014-06-29 20:35:51','$empleado : Employee()\r\n$pQPREP : Parameter(paramCode == \"QVTA_IM_OP\")\r\n$pQLEC : Parameter(paramCode == \"QVTA_LEC_OP\")\r\n$pQVOZ : Parameter(paramCode == \"QVTA_ALTAS_VOZ_OP\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS\")\r\n$totalBu : Summary(bu == $empleado.bu && summaryCode == \"ALTAS\" && quantity >= ($pQPREP.value + $pQLEC.value + $pQVOZ.value))\r\n$p : Parameter(paramCode == \"QVTA_ALTAS_VOZ_PU_ARS\")\r\n$totalVoz : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS_DE_VOZ\")','Double performance = $total.getQuantity() * 100.0 / (($pQPREP.value + $pQLEC.value + $pQVOZ.value) / $empleado.getBu().getEmployeeCount());\r\nInteger factor = 0;\r\nif (performance >= $p.getMinValue()) {\r\n	factor = 1;\r\n}\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $totalVoz.getQuantity(), $p.getValue() * $totalVoz.getQuantity() * factor, 31);','INDIVIDUAL_INCENTIVE','Incentivos  Individuales - Altas de Voz 100% Q y Q Punto de Venta',80),(48,1,'',NULL,'2014-06-28 22:21:27','MVEL',NULL,'2014-06-29 20:37:53','$empleado : Employee()\r\n$p : Parameter(paramCode == \"IVTA_ALTAS_RG1_BON_ARS\")\r\n$totalBu : Summary(bu == $empleado.bu && summaryCode == \"ALTAS_Y_CATER\" && quantity >= $p.minValue && quantity < $p.maxValue)\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS_Y_CATER\")','Double performance = $total.getQuantity() / $totalBu.getQuantity();\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), performance * 100.0, $p.getValue() * performance, 10);','POS_INCENTIVE','Incentivos  Punto de Venta - X Altas Proporcional',70),(49,1,'',NULL,'2014-06-28 22:22:40','MVEL',NULL,'2014-06-29 20:38:15','$empleado : Employee()\r\n$p : Parameter(paramCode == \"IVTA_ALTAS_RG2_BON_ARS\")\r\n$totalBu : Summary(bu == $empleado.bu && summaryCode == \"ALTAS_Y_CATER\" && quantity >= $p.minValue)\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"ALTAS_Y_CATER\")','Double performance = $total.getQuantity() / $totalBu.getQuantity();\r\nstatement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), performance, $p.getValue() * performance, 11);','POS_INCENTIVE','Incentivos  Punto de Venta - XX Altas Proporcional',70),(50,0,'',NULL,'2014-06-28 22:25:35','MVEL',NULL,'2014-06-28 22:25:35','$empleado : Employee()\r\n$p : Parameter(paramCode == \"BAJAS_IM_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"IM_BAJAS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 10);','DEDUCTIONS','Bajas - IM',60),(51,0,'',NULL,'2014-06-28 22:26:14','MVEL',NULL,'2014-06-28 22:26:14','$empleado : Employee()\r\n$p : Parameter(paramCode == \"BAJAS_LEC_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"LEC_BAJAS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 20);','DEDUCTIONS','Bajas - MEC',60),(52,0,'',NULL,'2014-06-28 22:26:56','MVEL',NULL,'2014-06-28 22:26:56','$empleado : Employee()\r\n$p : Parameter(paramCode == \"BAJA_PLAN_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"PLAN_BAJAS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 30);','DEDUCTIONS','Bajas - Planes Interno/Externo',60),(53,0,'',NULL,'2014-06-28 22:27:39','MVEL',NULL,'2014-06-28 22:27:39','$empleado : Employee()\r\n$p : Parameter(paramCode == \"BAJA_CPLANFULL_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"FULL_BAJAS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 40);','DEDUCTIONS','Bajas - CDP a planes Full',60),(54,0,'',NULL,'2014-06-28 22:28:18','MVEL',NULL,'2014-06-28 22:28:18','$empleado : Employee()\r\n$p : Parameter(paramCode == \"BAJA_RECLAMOS_PU_ARS\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"RECLAMOS\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 50);','DEDUCTIONS','Bajas - Observaciones (Reclamos)',60),(55,0,'',NULL,'2014-06-28 22:28:55','MVEL',NULL,'2014-06-28 22:28:55','$empleado : Employee()\r\n$p : Parameter(paramCode == \"BAJA_FRAUDES\")\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"FRAUDES\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), $p.getValue(), $total.getQuantity(), $p.getValue() * $total.getQuantity(), 60);','DEDUCTIONS','Bajas - Debitos por fraudes',60),(56,0,'',NULL,'2014-06-28 22:29:25','MVEL',NULL,'2014-06-28 22:29:25','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"DIF_PRECIOS\")','statement.addLine(StatementLineType.RULE, StatementLineGroup.DEDUCTIONS, \"Diferencias de precio\", null, null, $total.getQuantity(), 70);','DEDUCTIONS','Bajas - Diferencias de precio',60),(57,2,'',NULL,'2014-06-29 21:18:58','MVEL',NULL,'2014-06-29 21:27:02','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"SUELDO_NETO\")\r\n$p : Parameter(paramCode == \"SUELDO_NETO\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), null, null, $total.quantity, 1);','OTHERS','Sueldo Neto Cobrado',90),(58,1,'',NULL,'2014-06-29 21:21:34','MVEL',NULL,'2014-06-29 21:27:13','$empleado : Employee()\r\n$total : Summary(employee != null && employee.id == $empleado.id && summaryCode == \"SUELDO_NETO\")\r\n$p : Parameter(paramCode == \"SUELDO_NETO\")','statement.addLine(StatementLineType.RULE, $p.getParamCategory(), $p.getCurrentDescription(), null, null, -$total.quantity, 1);','DEDUCTIONS','Bajas - Sueldo Neto',60);
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `rule_set`
--

LOCK TABLES `rule_set` WRITE;
/*!40000 ALTER TABLE `rule_set` DISABLE KEYS */;
INSERT INTO `rule_set` VALUES (1,3,NULL,'2014-06-24 00:56:13',NULL,'2014-06-29 12:37:31','Liquidacion para el vendedor tipico','Vendedor Standard');
/*!40000 ALTER TABLE `rule_set` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `rule_set_rules`
--

LOCK TABLES `rule_set_rules` WRITE;
/*!40000 ALTER TABLE `rule_set_rules` DISABLE KEYS */;
INSERT INTO `rule_set_rules` VALUES (1,1);
/*!40000 ALTER TABLE `rule_set_rules` ENABLE KEYS */;
UNLOCK TABLES;
