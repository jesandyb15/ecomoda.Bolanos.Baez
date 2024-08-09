CREATE DATABASE  IF NOT EXISTS `ecomoda` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecomoda`;
-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: ecomoda
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advertencias`
--

DROP TABLE IF EXISTS `advertencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertencias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(200) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertencias`
--

LOCK TABLES `advertencias` WRITE;
/*!40000 ALTER TABLE `advertencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_por_cobrar`
--

DROP TABLE IF EXISTS `audit_por_cobrar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_por_cobrar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cuenta_cobrar` int NOT NULL,
  `estado` enum('por cobrar','saldada') NOT NULL,
  `valor` double NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `paz_y_salvo` enum('si','no') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cuenta_cobrar` (`id_cuenta_cobrar`),
  CONSTRAINT `audit_por_cobrar_ibfk_1` FOREIGN KEY (`id_cuenta_cobrar`) REFERENCES `cuentas_cobrar` (`id_cuenta_cobrar`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_por_cobrar`
--

LOCK TABLES `audit_por_cobrar` WRITE;
/*!40000 ALTER TABLE `audit_por_cobrar` DISABLE KEYS */;
INSERT INTO `audit_por_cobrar` VALUES (1,9961,'saldada',0,'2024-08-09 20:25:24','si');
/*!40000 ALTER TABLE `audit_por_cobrar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_por_pagar`
--

DROP TABLE IF EXISTS `audit_por_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_por_pagar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cuentas_pagar` int NOT NULL,
  `estado` enum('por pagar','saldada') NOT NULL,
  `valor` double NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `paz_y_salvo` enum('si','no') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cuentas_pagar` (`id_cuentas_pagar`),
  CONSTRAINT `audit_por_pagar_ibfk_1` FOREIGN KEY (`id_cuentas_pagar`) REFERENCES `cuentas_pagar` (`id_cuentas_pagar`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_por_pagar`
--

LOCK TABLES `audit_por_pagar` WRITE;
/*!40000 ALTER TABLE `audit_por_pagar` DISABLE KEYS */;
INSERT INTO `audit_por_pagar` VALUES (1,8851,'saldada',0,'2024-08-09 20:25:24','si');
/*!40000 ALTER TABLE `audit_por_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `nombre_cliente` varchar(45) NOT NULL,
  `id_producto` int NOT NULL,
  `descripcion_producto` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`nombre_cliente`),
  KEY `id_producto` (`id_producto`),
  KEY `descripcion_producto` (`descripcion_producto`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`descripcion_producto`) REFERENCES `productos` (`descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (' modismo',208,'Vestido primavera corto - talla xl','calle 35-90',32423432),('colombia moda',204,'Vestidos azul oscuro largo - talla xl','Avenida chile 45',3423432),('ejectivos',209,'Falda negra plisada ','calle flores 67',234234234),('elegrancia francia',212,'camisa  otono azul','avenida cali 67',3003534),('jeans y mas',202,'Vestidos azul oscuro largo - talla m','calle 50-24',625234324),('lala fashion',215,'Camiseta  multicolor - talla m','calle 90-45',23131494),('moda y estilo',201,'Vestidos azul oscuro largo - talla s','calle 50-22',6253434),('moda y punto',210,'chaqueta rosa','calle 89-05',9459387),('nova moda',214,'Camiseta  multicolor - talla s','calle 56-70',567435599),('offcors',211,'camisa seda otono verde','calle 23-21',23755987),('palacio de la pantaleta',203,'Vestidos azul oscuro largo - talla l','calle 12-56',13432123),('super seda',213,'camisa seda otono blanca','avenida cordoba 56',245663343),('super tex',205,'Vestido primavera corto - talla s','calle 56-09',13456546),('trajes s.a',206,'Vestido primavera corto - talla m',' avenida cordova 34',5464564),('vestidos y demas',207,'Vestido primavera corto - talla l','avenida cali 52',84455234);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas_cobrar`
--

DROP TABLE IF EXISTS `cuentas_cobrar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas_cobrar` (
  `id_cuenta_cobrar` int NOT NULL AUTO_INCREMENT,
  `documento_referencia` int NOT NULL,
  `estado` enum('por cobrar','saldada') NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id_cuenta_cobrar`),
  KEY `documento_referencia` (`documento_referencia`),
  CONSTRAINT `cuentas_cobrar_ibfk_1` FOREIGN KEY (`documento_referencia`) REFERENCES `orden_venta` (`id_orden_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=9975 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas_cobrar`
--

LOCK TABLES `cuentas_cobrar` WRITE;
/*!40000 ALTER TABLE `cuentas_cobrar` DISABLE KEYS */;
INSERT INTO `cuentas_cobrar` VALUES (9960,6669,'saldada',0),(9961,6670,'saldada',0),(9962,6655,'por cobrar',2500),(9963,6656,'saldada',2250),(9964,6657,'saldada',1800),(9965,6658,'por cobrar',5400),(9966,6659,'por cobrar',2160),(9967,6660,'por cobrar',3780),(9968,6661,'saldada',240),(9969,6662,'saldada',8000),(9970,6663,'saldada',5000),(9971,6664,'por cobrar',2610),(9972,6665,'por cobrar',3840),(9973,6667,'por cobrar',3000),(9974,6668,'saldada',3600);
/*!40000 ALTER TABLE `cuentas_cobrar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas_pagar`
--

DROP TABLE IF EXISTS `cuentas_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas_pagar` (
  `id_cuentas_pagar` int NOT NULL AUTO_INCREMENT,
  `documento_referencia` int NOT NULL,
  `estado` enum('por pagar','saldada') NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id_cuentas_pagar`),
  KEY `documento_referencia` (`documento_referencia`),
  CONSTRAINT `cuentas_pagar_ibfk_1` FOREIGN KEY (`documento_referencia`) REFERENCES `orden_compra` (`id_orden_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=8867 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas_pagar`
--

LOCK TABLES `cuentas_pagar` WRITE;
/*!40000 ALTER TABLE `cuentas_pagar` DISABLE KEYS */;
INSERT INTO `cuentas_pagar` VALUES (8850,5555,'por pagar',800),(8851,5556,'saldada',0),(8852,5557,'saldada',3000),(8853,5558,'por pagar',7800),(8854,5559,'saldada',595),(8855,5560,'por pagar',4000),(8856,5561,'por pagar',3020),(8859,5562,'por pagar',446),(8860,5563,'por pagar',850),(8861,5564,'saldada',1000),(8862,5565,'saldada',2000),(8863,5566,'por pagar',3500),(8864,5567,'por pagar',700),(8865,5568,'por pagar',1600),(8866,5569,'por pagar',450);
/*!40000 ALTER TABLE `cuentas_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materiales`
--

DROP TABLE IF EXISTS `materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiales` (
  `id_material` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `tipo` enum('hilo','tela') DEFAULT NULL,
  `cantidad` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_material`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiales`
--

LOCK TABLES `materiales` WRITE;
/*!40000 ALTER TABLE `materiales` DISABLE KEYS */;
INSERT INTO `materiales` VALUES (101,'Tela seda azul','tela',1000,800.00),(102,'hilo negro','hilo',150,2.10),(103,'tela poliester blanco','tela',2500,1.30),(104,'hilo blanco','hilo',300,5.00),(105,'tela algodon negro','tela',500,500.00),(106,'hilo azul','hilo',350,450.00),(107,'tela seda rosa','tela',7000,300.00),(108,'hilo rosa','hilo',400,7.00),(109,'tela algodon blanco','tela',9500,900.00),(110,'hilo rojo','hilo',800,900.00),(111,'tela poliester verde','tela',9000,450.00),(112,'hilo verde','hilo',225,800.00),(113,'tela poliester azul oscuro','tela',800,50.00),(114,'hilo azul oscuro','hilo',200,600.00),(115,'Tela Rojo Carmin','tela',500,5500.00),(116,'tela beige seda','tela',500,1500.00),(119,'tela marron seda','tela',500,1500.00);
/*!40000 ALTER TABLE `materiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_compra`
--

DROP TABLE IF EXISTS `orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_compra` (
  `id_orden_compra` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(25) NOT NULL,
  `id_material` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id_orden_compra`),
  KEY `nombre_proveedor` (`nombre_proveedor`),
  KEY `id_material` (`id_material`),
  CONSTRAINT `orden_compra_ibfk_1` FOREIGN KEY (`nombre_proveedor`) REFERENCES `proveedores` (`nombre_proveedor`),
  CONSTRAINT `orden_compra_ibfk_2` FOREIGN KEY (`id_material`) REFERENCES `materiales` (`id_material`)
) ENGINE=InnoDB AUTO_INCREMENT=5570 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_compra`
--

LOCK TABLES `orden_compra` WRITE;
/*!40000 ALTER TABLE `orden_compra` DISABLE KEYS */;
INSERT INTO `orden_compra` VALUES (5555,'william chams',101,500,800),(5556,'hilarium',102,30,1050),(5557,'telarium',103,40,3000),(5558,' telaris',104,600,7800),(5559,'mega tex',105,700,595),(5560,' textex',106,820,4000),(5561,'elixis tela',107,200,3020),(5562,'hilar',108,350,446),(5563,'hilos de colombia',109,35,850),(5564,' hilos max',110,80,1000),(5565,' telimax',111,90,2000),(5566,'maxi tela',112,50,3500),(5567,' textiler',113,120,700),(5568,'colombia tela',114,1000,1600),(5569,'facol',115,300,450);
/*!40000 ALTER TABLE `orden_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_venta`
--

DROP TABLE IF EXISTS `orden_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_venta` (
  `id_orden_venta` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(45) NOT NULL,
  `id_producto` int NOT NULL,
  `descripcion_producto` varchar(45) NOT NULL,
  `cantidad` int NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id_orden_venta`),
  KEY `nombre_cliente` (`nombre_cliente`),
  KEY `id_producto` (`id_producto`),
  KEY `descripcion_producto` (`descripcion_producto`),
  CONSTRAINT `orden_venta_ibfk_1` FOREIGN KEY (`nombre_cliente`) REFERENCES `clientes` (`nombre_cliente`),
  CONSTRAINT `orden_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `orden_venta_ibfk_3` FOREIGN KEY (`descripcion_producto`) REFERENCES `productos` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=6671 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_venta`
--

LOCK TABLES `orden_venta` WRITE;
/*!40000 ALTER TABLE `orden_venta` DISABLE KEYS */;
INSERT INTO `orden_venta` VALUES (6655,'palacio de la pantaleta',203,'Vestidos azul oscuro largo - talla l',10,2500),(6656,'colombia moda',204,'Vestidos azul oscuro largo - talla xl',9,2250),(6657,'super tex',205,'Vestido primavera corto - talla s',11,1800),(6658,'trajes s.a',206,'Vestido primavera corto - talla m',30,5400),(6659,'vestidos y demas',207,'Vestido primavera corto - talla l',12,2160),(6660,' modismo',208,'Vestido primavera corto - talla xl',21,3780),(6661,'ejectivos',209,'Falda negra plisada ',8,240),(6662,'moda y punto',210,'chaqueta rosa',40,8000),(6663,'offcors',211,'camisa seda otono verde',25,5000),(6664,'elegrancia francia',212,'camisa  otono azul',29,2610),(6665,'super seda',213,'camisa seda otono blanca',32,3840),(6667,'nova moda',214,'Camiseta  multicolor - talla s',20,3000),(6668,'lala fashion',215,'Camiseta  multicolor - talla m',24,3600),(6669,'moda y estilo',201,'Vestidos azul oscuro largo - talla s',4,1000),(6670,'jeans y mas',202,'Vestidos azul oscuro largo - talla m',22,5500);
/*!40000 ALTER TABLE `orden_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unidad` double NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (201,'Vestidos azul oscuro largo - talla s',20,250),(202,'Vestidos azul oscuro largo - talla m',30,250),(203,'Vestidos azul oscuro largo - talla l',25,250),(204,'Vestidos azul oscuro largo - talla xl',40,250),(205,'Vestido primavera corto - talla s',15,201.6),(206,'Vestido primavera corto - talla m',35,180),(207,'Vestido primavera corto - talla l',50,180),(208,'Vestido primavera corto - talla xl',50,180),(209,'Falda negra plisada ',10,300),(210,'chaqueta rosa',20,200),(211,'camisa seda otono verde',55,100),(212,'camisa  otono azul',34,90),(213,'camisa seda otono blanca',80,120),(214,'Camiseta  multicolor - talla s',35,150),(215,'Camiseta  multicolor - talla m',89,150),(216,'blazer amarillo oficina',1000,400),(217,'Blusa Floral Bohemia',1020,300),(218,'Blusa metalica Bohemia',1050,350),(219,'falda Floral Bohemia',500,200),(220,'mini vestido negro',2000,450),(229,'mini falda azul',2000,450),(230,'mini falda verde',2000,450),(231,'mini falda roja',2000,450),(232,'mini falda morada',2000,450);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `nombre_proveedor` varchar(25) NOT NULL,
  `id_material` int NOT NULL,
  `descripcion_material` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` int NOT NULL,
  PRIMARY KEY (`nombre_proveedor`),
  KEY `id_material` (`id_material`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`id_material`) REFERENCES `materiales` (`id_material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (' hilos max',110,'hilo rojo',' calle 14-90',39898488),(' telaris',104,'hilo blanco','avenida cali 42',50383943),(' telimax',111,'tela poliester verde','avenida 40-345',233243),(' textex',106,'hilo azul','calle sol 14',12232133),(' textiler',113,'tela poliester azul oscuro','avenida 34-98',37234234),('colombia tela',114,'hilo azul oscuro','calle 18-25',23323232),('elixis tela',107,'tela seda rosa','calle 234-89',243234898),('facol',115,'Tela Rojo Carmin','calle 45-32',234342332),('hilar',108,'hilo rosa','calle 47-23',12313241),('hilarium',102,'hilo negro','calle 78-126',45334334),('hilos de colombia',109,'tela algodon blanco','calle 56-123',234234234),('maxi tela',112,'hilo verde','calle 45-89',234198373),('mega tex',105,'tela algodon negro','carrera 112-34',323534),('telarium',103,'tela poliester blanco','avenida chile 45',2483323),('william chams',101,'Tela seda azul','avenida flores 23',89646232);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_ccobrar_clientes`
--

DROP TABLE IF EXISTS `view_ccobrar_clientes`;
/*!50001 DROP VIEW IF EXISTS `view_ccobrar_clientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_ccobrar_clientes` AS SELECT 
 1 AS `id_cuenta_cobrar`,
 1 AS `documento_referencia`,
 1 AS `estado`,
 1 AS `valor`,
 1 AS `nombre_cliente`,
 1 AS `direccion`,
 1 AS `telefono`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_clientes_top`
--

DROP TABLE IF EXISTS `view_clientes_top`;
/*!50001 DROP VIEW IF EXISTS `view_clientes_top`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_clientes_top` AS SELECT 
 1 AS `id_orden_venta`,
 1 AS `nombre_cliente`,
 1 AS `id_producto`,
 1 AS `descripcion_producto`,
 1 AS `cantidad`,
 1 AS `precio`,
 1 AS `valor`,
 1 AS `estado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_inventario_bajo`
--

DROP TABLE IF EXISTS `view_inventario_bajo`;
/*!50001 DROP VIEW IF EXISTS `view_inventario_bajo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_inventario_bajo` AS SELECT 
 1 AS `id`,
 1 AS `cantidad`,
 1 AS `tipo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_inventario_total`
--

DROP TABLE IF EXISTS `view_inventario_total`;
/*!50001 DROP VIEW IF EXISTS `view_inventario_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_inventario_total` AS SELECT 
 1 AS `id`,
 1 AS `cantidad`,
 1 AS `tipo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_material`
--

DROP TABLE IF EXISTS `view_material`;
/*!50001 DROP VIEW IF EXISTS `view_material`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_material` AS SELECT 
 1 AS `id_material`,
 1 AS `cantidad`,
 1 AS `descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_producto`
--

DROP TABLE IF EXISTS `view_producto`;
/*!50001 DROP VIEW IF EXISTS `view_producto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_producto` AS SELECT 
 1 AS `id_producto`,
 1 AS `cantidad`,
 1 AS `descripcion`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_ccobrar_clientes`
--

/*!50001 DROP VIEW IF EXISTS `view_ccobrar_clientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_ccobrar_clientes` AS select `cuentas_cobrar`.`id_cuenta_cobrar` AS `id_cuenta_cobrar`,`cuentas_cobrar`.`documento_referencia` AS `documento_referencia`,`cuentas_cobrar`.`estado` AS `estado`,`cuentas_cobrar`.`valor` AS `valor`,`clientes`.`nombre_cliente` AS `nombre_cliente`,`clientes`.`direccion` AS `direccion`,`clientes`.`telefono` AS `telefono` from ((`cuentas_cobrar` join `orden_venta` on((`orden_venta`.`id_orden_venta` = `cuentas_cobrar`.`documento_referencia`))) join `clientes` on((`clientes`.`nombre_cliente` = `orden_venta`.`nombre_cliente`))) where (`cuentas_cobrar`.`estado` = 'por cobrar') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_clientes_top`
--

/*!50001 DROP VIEW IF EXISTS `view_clientes_top`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_clientes_top` AS select `orden_venta`.`id_orden_venta` AS `id_orden_venta`,`orden_venta`.`nombre_cliente` AS `nombre_cliente`,`orden_venta`.`id_producto` AS `id_producto`,`orden_venta`.`descripcion_producto` AS `descripcion_producto`,`orden_venta`.`cantidad` AS `cantidad`,`orden_venta`.`precio` AS `precio`,`cuentas_cobrar`.`valor` AS `valor`,`cuentas_cobrar`.`estado` AS `estado` from (`orden_venta` left join `cuentas_cobrar` on((`cuentas_cobrar`.`documento_referencia` = `orden_venta`.`id_orden_venta`))) where ((`cuentas_cobrar`.`valor` > 3000) and (`cuentas_cobrar`.`estado` = 'saldada')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_inventario_bajo`
--

/*!50001 DROP VIEW IF EXISTS `view_inventario_bajo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_inventario_bajo` AS select `view_inventario_total`.`id` AS `id`,`view_inventario_total`.`cantidad` AS `cantidad`,`view_inventario_total`.`tipo` AS `tipo` from `view_inventario_total` where (`view_inventario_total`.`cantidad` < 50) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_inventario_total`
--

/*!50001 DROP VIEW IF EXISTS `view_inventario_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_inventario_total` AS select `materiales`.`id_material` AS `id`,`materiales`.`cantidad` AS `cantidad`,'material' AS `tipo` from `materiales` union all select `productos`.`id_producto` AS `id`,`productos`.`cantidad` AS `cantidad`,'producto' AS `tipo` from `productos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_material`
--

/*!50001 DROP VIEW IF EXISTS `view_material`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_material` AS select `materiales`.`id_material` AS `id_material`,`materiales`.`cantidad` AS `cantidad`,`materiales`.`descripcion` AS `descripcion` from `materiales` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_producto`
--

/*!50001 DROP VIEW IF EXISTS `view_producto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_producto` AS select `productos`.`id_producto` AS `id_producto`,`productos`.`cantidad` AS `cantidad`,`productos`.`descripcion` AS `descripcion` from `productos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-09 18:24:09
