CREATE DATABASE  IF NOT EXISTS `puntodeventa` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `puntodeventa`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: puntodeventa
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(450) DEFAULT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'GENERICA','Categoria Default.');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `colonia` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `cp` int(11) NOT NULL,
  `fecha_nacimiento` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `curp` varchar(20) NOT NULL,
  `rfc` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'PUBLICO','PUBLICO','PUBLICO','PUBLICO','PUBLICO','CHIHUAHUA',33800,'1/1/2000','0000000000','PUBLICO','000000000000000000','0000000000000');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracion` (
  `idconfig` int(11) NOT NULL,
  `ticketprintname` varchar(45) DEFAULT NULL,
  `etiquetaprintname` varchar(45) DEFAULT NULL,
  `globalprintname` varchar(45) DEFAULT NULL,
  `defaultcliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idconfig`),
  KEY `fk_CONFIGURACION_CLIENTE1_idx` (`defaultcliente`),
  CONSTRAINT `fk_CONFIGURACION_CLIENTE1` FOREIGN KEY (`defaultcliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion`
--

LOCK TABLES `configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle` (
  `numdetalle` int(11) NOT NULL AUTO_INCREMENT,
  `pkproducto` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` double NOT NULL,
  `descuento` int(11) NOT NULL,
  PRIMARY KEY (`numdetalle`),
  KEY `fk_DETALLE_PRODUCTO1_idx` (`pkproducto`),
  KEY `fk_DETALLE_VENTA1_idx` (`idventa`),
  CONSTRAINT `fk_DETALLE_PRODUCTO1` FOREIGN KEY (`pkproducto`) REFERENCES `producto` (`pkproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DETALLE_VENTA1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

LOCK TABLES `detalle` WRITE;
/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `idfactura` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `fk_FACTURA_VENTA1_idx` (`idventa`),
  CONSTRAINT `fk_FACTURA_VENTA1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `idlogin` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_cierre` time DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_cierre` date DEFAULT NULL,
  PRIMARY KEY (`idlogin`),
  KEY `fk_LOGIN_USUARIO1_idx` (`idusuario`),
  CONSTRAINT `fk_LOGIN_USUARIO1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modo_pago`
--

DROP TABLE IF EXISTS `modo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modo_pago` (
  `idmodopago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `otros_detalles` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmodopago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modo_pago`
--

LOCK TABLES `modo_pago` WRITE;
/*!40000 ALTER TABLE `modo_pago` DISABLE KEYS */;
INSERT INTO `modo_pago` VALUES (1,'EFECTIVO','Pago en una sola Excibicion.'),(2,'TARJETA CREDITO','Pago con Tarjeta de Credito.'),(3,'TARJETA DEBITO','Pago con Tarjeta de Debito.');
/*!40000 ALTER TABLE `modo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `pkproducto` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(1024) DEFAULT NULL,
  `precio` double NOT NULL,
  `stock` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `preciocosto` double NOT NULL,
  PRIMARY KEY (`pkproducto`),
  KEY `fk_PRODUCTO_CATEGORIA1_idx` (`idcategoria`),
  CONSTRAINT `fk_PRODUCTO_CATEGORIA1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_TICKET_VENTA1_idx` (`idventa`),
  CONSTRAINT `fk_TICKET_VENTA1` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tienda` (
  `idtienda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `logotienda` mediumblob,
  `calle` varchar(45) NOT NULL,
  `numero` int(11) NOT NULL,
  `colonia` varchar(45) NOT NULL,
  `cp` varchar(20) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `razonsocial` varchar(20) NOT NULL,
  `rfc` varchar(20) NOT NULL,
  PRIMARY KEY (`idtienda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` VALUES (1,'DEFAULT','ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\î\0Adobe\0d\0\0\0\0ÿ\á\àExif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0b\0\0\0\0\0\0\0j(\0\0\0\0\0\0\01\0\0\0\0\"\0\0\0r2\0\0\0\0\0\0\0”‡i\0\0\0\0\0\0\0¨\0\0\0\È\0H\0\0\0\0\0\0H\0\0\0\0\0Adobe Photoshop CC 2014 (Windows)\02018:04:03 06:17:55\0\0 \0\0\0\0\0\0© \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0(\0\0\0\0\0\0\0\0\0\0\0\0\0&\0\0\0\0\0\0±\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿ\Øÿ\í\0Adobe_CM\0ÿ\î\0Adobe\0d€\0\0\0ÿ\Û\0„\0			\n\r\r\rÿÀ\0\0k\0 \"\0ÿ\Ý\0\0\nÿ\Ä?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚\ÑC%’Sð\áñcs5¢²ƒ&D“TdEÂ£t6\ÒU\âeò³„\Ã\Óu\ãóF\'”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö7GWgw‡—§·\Ç\×\ç÷\05\0!1AQaq\"2‘¡±B#ÁR\Ñð3$b\ár‚’CScs4ñ%¢²ƒ&5\Â\ÒD“T£dEU6te\âò³„\Ã\Óu\ãóF”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö\'7GWgw‡—§·\Çÿ\Ú\0\0\0?\0õT’I%)$’IJI$’R’IW\Î\Î\Æ\éø–fe\Ø*¢¡¹\ïqøþòJCÔº\ÏO\é¸ùdX	Æ©\×>–l-hŸc	o¹\Ëüf}TÊ¤?#!\ØV\É›˜\âtü\íô¶\Úöÿ\0mq”\Ûõ—¨õN®öl*á¼¼7Ô°˜\ØU=\Þ\ß\Ò\ÚYë®¡˜_Tú]Ž7\ÖA‹[Oºª2+úQ{ª©\Å\ÛÝµ_\Ç\Ë\Â8Y‡.\\Ó—¦8¥Á\íc­²~¯7®|_\'/\ìw™õ\ß\ê›ø\ê”|\ÉoýP\nVýsú«M½ýS±¢Hc\Ãß©m5o¹\ß\Ùb\ä¯\ëŸVj¿Yó,s5µXùþ«W§ÿ\0MrYXýF\åb¿ü¡‰‘en\ÝsEo\r©\í·ôn¯\ÝS\ïk}\'ÿ\0Á½M\Ëü3&\\‰\å9Œp”‡\å8Ç†¥/\Ö`\Åqx‡\Üj¶«\êeÔ¼YU­­\í2\×5\Ãs\×¤\×5MrWz—\ìÑ…‡y{zGT­–t[n%Æ§=¢\Ï\Ø\×^\ï\Îgý\çú¿\ÏUú>\ÏIu‹?>#Žu¼O\Ê|<¯–iI$’‰*I$’R’I$”ÿ\0ÿ\ÐõT’I%)$’IJI$<†z”XÀKw4Ã‘!%9\ë‡F\è4\×fS\Ýs\íyc*£k\ß\í÷:\\ÆµŒ–¯&ú\Ãõ“ªõ\ë\ë\Ú\æ\â›¨\Æøµ\îk?\í\ËV«U[^VSŽCrú\ÅX{	?\ÍÍ®\É\Ýÿ\0\Æ#\ß\Ó:}ý?\î;-\Ë\ê6\Z\Üy¸µ[c˜\Ï\Íÿ\0BÅ¥\ÊK!ƒ\'¶Nn9d–C!\ÃX=|P\Ç\Ã?_\Ïóý@^O§z™u\á\Ü\×\×u\Î“­{]½¬,ûA§ù\Ë[\ì~\åo ef:Êºn3ò²)pW¹¼~wóV~÷ò•\ìl<[²,ú½\ÖÇ·®n6F¿£º\ÓS÷Yþ“k+«gü=–Ôºï¨m¸¹÷}_\ë4³¬Vv³\"\07´\r\Ím¯ÿ\0w§úJ¯ÿ\0µTÿ\0\Âÿ\0;79\Í\å\Çð21\Â9sò\Æy \'ˆüœ\Î(\âÉ‹\Ü\Ã8=\ÐZ\0¿È¸9\â\íý7£\ß\Ôú¥Í­Õ´9˜õ\ë?\à\ßo»~\Õ\Ïô\ì|õœFu&\î\ÂkYfK\"ñ¸m\Ú\ïð”¯Gÿ\0™.vKa‡\æ\ÜøL,_ñÑ±z\Ýýo7)…\Øö‰A<m\'\Ô1üª««Q\åyŒÒ3\ÌO$±ŠCºC?5úŒsŒ{‚YRz\ÏN5t›Ÿõ7®¿\í]©´»¤f»ˆ$9´úŸA¶\×fÍŸ\èr=?ðwÔº^“\Ö-Á\ÈoA\ë\×5¹Ì…–ò3*\'eOaw\Ñ\ÎoóY8¿O\Ôý->­v®;>Ÿ²a\å}Së€¹ƒô#*$µ\ãù­¿õþB§ƒ\Ô,\Í[\ÖŸ\Ô~«¾œOW¾\ê\r\Ìûu\Ó\è\âS\è^\Ïwú[›K6\Íógù½Ï“9ý¦Oo;ÿ\0‡ÿ\0±[~\Ï\àú\êI$³)$’IJI$’Sÿ\ÑõT’I%)$’IJP¸\í¦\Ã\à\Ò5WªdW\Óro°\Ã+©ÄŸ’Jxsiú¹Ò­?Hu;²ÿ\0[§)\ßõJ®vr›\Ózc¤·\Ôw¦@{òsm`£	®ü\Ër=¦ÿ\0\æ©õ/þn¥\Õ:³`tv\ã\í}T¿!\ÙP\ï\Ò1öK?E\íöz6o\ßùö{?Eþ\ëcpz®OSýžü\ë\Ë+mm76°\Æú½\Ó]¿¦~\í›ÿ\0Á2ûªÿ\0µy^S&L>ôDe‘‘÷1\ã\áÉ“$±\ËC9\Ã\Ú\ãÁ“‹Š_ ´žž/sõ3£\nm-wW#Ô³7»¬€==\ßO\ìµ5¾Ž5_\à©c \ê,\êE½ª“‡\×ú~3<¥\ÛNöb_`÷z[½\Øöý<k‘\êÖ´.ÿ\0\Z~\Ãú§NÆªxõ,u¿ù\èÒ°ú\çSú\Ç\×^Ì¬ŒZ+²!øõX\Ò#÷­©ÿ\0V¡†<¸òŒÃ™Á$MŠ\Ëœ?Õ®_\Þô~‡´:QcÕ¾°gõEZ)\ê.‹(±†\Z\ç\Ýü\Íw6¿ô»¬ý3+ÿ\0E\êÿ\07ô=ü^\áW\Òþ¨c[|RrweZ\ç˜a\ÛK÷;÷±™Bò_C©uN¡]m/;-\Û\Z9ÀG¹\Î\Ú\ßk?=ÿ\0˜»?ñ]Õ²(©\ÝS\'g¦\Ïm›\Òô™ù­þÇ±_\æa\ÉG“Ža½dgN_\æ„ñð\á†o»O\Ø÷½\ß\çP.ûÖŽ—×®·õc¨|o\Ú5o¨º\ßZ‰¼‚²¶š7³\Þ\ï\å®Î¤\Ëñ.62\Çf’\\\Ì\Ö;d6\ÐkÍ¦ñõ©½–z{?Áÿ\0\Å\Ùmkf«T[Ò³2k\'\Ü,ºj\Ú\Í\Íunx¡Í\Þk\ÞË¿\ë~šŸD\èôuÏ¬˜B (sŽ~cw§õlx\Ýþswÿ\0#*¿ôjJ\\®9\ãÉŠ3•Jy2\Ë,øN,<´x¥ú¼0‡ó\Þ\ï·\íûù}i7\Õô¨™}[+\ê\íª\Ðh¶£\éP^]e,kU\ïkýÛŸ\ïÿ\0Œþwó\×B’K/>A—,òŒbr2\à\Ë\\’I(Ô¤’I%?ÿ\ÒõT’I%)$’IJP²º\í­\Õ\Ø\Ðö<Cšu4’S\æŸ\\þ£ŒG;©t\Æ~®ž¥¢v-£÷5Sqƒk3ö[)÷×’Á¹ÔŸô•\Ó,ÿ\0µ~’\ì/\çhõ)õ±\ïö÷48¸H:Wýqú®:hQ\Âa8„\î{ôªyüúÿ\0\ï\Îj›—\æ\'‚bq\×÷£\ÒCùKùc÷1 ‹v>ªu\Ì\ËeuJ0ú\Ã\ZÖ±­ô²+#{rp¬l²\Æ9Ÿ¤\Ú\Ç}\ÒW\ìõ=+ÿ\0\\s\Ù\Ó~¯ä¾¶m£Ò© r\çûW’WgQÍ·\å£\æ\ÌF5Í­õ\Ú\ã»õ[\ì\Øú˜\ënm·§\êÂ­,®·\Ôz¥­\ÅúÅ“u7\à\ï·\"›ˆ¤;cMµ2œzÙú{}•~“\Ô¿Ô¥]\Ë\Éb\Í•–——–\Å\ëÍ‡‹ô£‡‹\äýÿ\0_\ê¿\Î\äÆ€kCöºW­\é=#®dgõ]=¸\íúK2í““\éWþ\Ö9\Ù8ÿ\0ö\ÚôN‘\×zWY\ÆfFCln\ãTc;\ÛW\Ócš¼·¡\Ùõw¤\à3;;©\ÎvUOõ°i©¹\Û	o£~\é£ô•mõ(¾\Æ#\Ûõ¿#9¬\ÅÀ\è˜ù\ÔR1þ×ŽÃµ£µtÑ±•b\å/5\ÊY0–8\á¬\æ2\Ï2†!ú\É\Æ¸8ý\ÌüyW—ô\Ô\ãö·~³õjk\ÄwJy-­\Ù\Æü\Ò­©Žú?\Ö{öµ«¡ÿ\0=*\Ê:]½c)»rú»…\Ûuö\Ð\Ý1klþf\Ó\ê3þ	õ.¥ýR\ë\ßY–CÛŠö<]­{j ŸsXÿ\0\Ò=¾—ø:ö¯a\Â\Çv.>3\ßêºŠ™[­€\ÝÅ/\Ø\ßk7\Ç\ÐU²û8ySh\æÉ–¬0pK\Ûõ\Çôòú¥þ\Ï\Zµ\'j¤\é$’ ¹I$’JRI$’Ÿÿ\ÓõT”^ö±Ž{´kAq>CU\Î\ãõ>\'\í\ßøŸùøbÉ’ý¼s\É[ûq–N\ïÀ‚@\Ü\ÓÒ¤°s~¼}YÁ¸Q•˜+°±¶±\ç\Úñ¾³-iúLOO\×«7\âd\æU—»g®ýöú‡e^Ý›½ßº±›„K\Ú\É\Ã*\á—øe\Ç\é‡«ôÿ\0EV;‡u%\Í\ãõ<\Úÿ\0ü\Ïü‚è©¶»ªeÕ\Õ\Ø\Ðöá¹¨O\\u\îcž;\ÛÜŒ±ñyq¨v6\ÍE\ìe,{Cšt-\"AX9^þ«ae[‰“™²úYc6<Ã‡\Ò\ÖmG³\ë\Õúº]]YùQƒ{\ÍU[±ú¼n–\ìÛ¿ó±š¢}¬•:<õñ|¼\Zzø•c¸kõß©]ª\Ö\\Ú†>H\Ëkö\ê>Žà¸¬oñ\×ú\Æc\Û\Õl~3hö³&Á\ê5º5¬·\Ùý¥\ÞôÏ­ÿ\0Wú­¶S•\ëYMf\ëµÍ†6\ïkySÿ\0\Ç\êý\Ïÿ\0À\ìÿ\0\È\'\â\Ç\ÍC –,yc—ô\ãŸ;ùx£\ÃúJ$V\ã\íE\Ó?\Å\Ç\Õ\Ü\Óeg*Æ/³¹ñ\Ú\Õ\Ñ\ã`\á\â·n5,¨\Ýh#+\ë\ÇÕŒF\Ð\ëó6ª…ôûf·Ö¿F{~\ç\'Áú\ïõg¨d}›0Yn\×?nÇk÷\êæ¢À„ñó\â\Í<y%ve–P™\Ö\âÈ«XwZß¢\0ža:\Ç\é[zZ\Év/M\Éõ®k\r…›\\\ßh!¥ß¤k9Èg\ë/F\èn©½O#\Ð7‡\Z½®t\íÿ\0A®ý\ä\Ïk/·\í\Ï\Üÿ\07\Ã/s÷¿›ù\Õc{uY9ZzN\Ç\êy0ò\àQn\×\Ò‡µ­\Þ\ßkPºo\×?«W1˜89~®E€–3c\Ä\í\î{Zß¢Ã”\Ä\Ìc™„oŠ|\à\Í\Å/\ÑUŽ\á\ÛIsù__>«bdÛ‹‘šu5\ØÝ0\æ\è\æ\ËYµZ\é¿ZzT£&ü‘mXmß\í®n\ÖÃ»\Þ\Öþk‰Áš1\ã–9\Æ\Zz\å	\Æ¯—\×òú•c¸u’\\\×þ8\ßS\â~\Ýÿ\0\Ùÿ\0[ø™tf\âÕ—Œ\íô^\Ðú\ßK\\%®\Õ	\áËŽ½\Ìs\Ç{q\ÂP¿ñ\Ô;_ÿ\Ôô^¿VM\Ý6¬F½\Ù¥í©µ»kËˆöŠ\ì?A\ß\Ê^yõs\ê\Ö\'Z¨\ÑoX¿¨4¼Y‚\ÛYk\Ú\Ö›\Ü\æ¯Q²\Ê\êc¬±ÁŒh—9\Æ\0$•\ç}z¬~‹\Ö+\ëý*§\Õe`á²£c›ü\å\æ\Ë÷oô®s?H¬òù(J\0\Æ—ª¿Pÿ\0%þR¿\î\Õ`‚\Z\ß[ð*\ÄúÅ‰nm”c\ßM-¶ÿ\0Zºƒ\Z\ß\Ð}öý\r\îØ¶z?\Õ^—™\Ó3ñð:Ý¹µäº¶¿!…®5º£\ê\íc›þ“w½e}uo\íN»Óƒ\\(nF5[\Þúj¹”úŽs¿NûN\êö4®£\ê_I§¤bdc3:Œ÷>\ÏQ\Î\Çc+\r¡›]].s7\é§\Îq¶*œM?W\È\Ë\Ñ9p\Îr–?oô\Îÿ\0\Ô\Ð7:<gOú´\ì\ï¬y\r\ÝC%Œ\ÆkÈ¼][œí¥÷c4zµ8½G\ZŸ³\ãU@qw¤Æ°8òv»Š\áþ¯=§ü`õ+\'\Ùh´V\ïN¶µ\Ä:½\Ã\ë]ôWz£\æfd`.?$ ~”\á;þ·\ï~‡ù´‡\ÊzEnoY\ËÀ\ê\ÝG#¥\åú¿ ¥\×\×c\í6;\Û\\og·gù\ê\ß\Ö\î”þ‘‹ÑºUyw\Ú\Ý÷Zne.%\î¯\Ü\æ\Ø¯\é\ïölZ_]0pr:\ÏL\Ï\Ç\Ç\Ï\Ã\Ïô\Ù]·\Úáµµ6·9Áí²­«/\ë7Q·«aô\çSen\Üö\Ø\×\×]¤:¦:Çº\Ãúûw\ï­O‚r\Å+\Æ#¯2$#‹$qÎ¸¿\ÊJ9>x~·/¯ù\Ïo\äEo»>“\Ó\Ó~¼’2î¾¿I\í6>\æI«»S\Ûû\ë¥`ô\ëò²±úŸZ³¦³\ì©\îÈª\Ãd9\Ìw± :»~ƒ\×IUµ\Ýþ2þ\ÑS…˜\æ³µ•–iO»õ°}_\ì,•õf\ï¬G:º²k\Å,{ž\Ón%/õ\Z\ç¿\ÝS§}oúDüs¹Nxñ\Þ,FS¬’—\îFYþsõ^\Úð\'Rô?X~©\ÖÎ‹_P£¨\Þ\æôü0\Ú\Ã\\\Ö@%\í²\Ë^\×Y¿\é¦ú…õx]^?^³.\çŸ\Ò\Öq_c.¬u?\Î\Ö6¿÷–ÿ\0\ÖJ†7\Õ¬w83TÖ\Î¬ö\Ôÿ\0c÷£Uÿ\0\Å\é\ê\ÕU\Ë,n\Ö\ÖA..÷SW²µ[Ý—Ýˆ¸\ßŽß¬\à”g)Sƒ‹þ¨ºµpþ£dcôþ§Ö‡P³\ì\î\Ç÷E\×1û+k\ß\êmk][wU¹ÿ\0ƒDÿ\0=G?¥tû:u\í½÷\Ü\áK¨¹•9\Í\0\×`e¶ooª\æ1õ³ó\ÖG[6ôÞ¿\×*ôÝ‘ö\êœÆ¹”\Õ\rõMvj÷;~O§þŽ\ÅO\Õ\Ï=¥ŠŸIÇ½\à\Üú)\Ú}Klúmw\ê\Ûvý*¾š˜Bq\Ïx\ë\Ó#Ÿ§½?\Ï9Ÿÿ\0F»kü‹\Ø}wô±~¨QK¢›¥µ4X\Ê]¸	±µ\Ý`ô\Ø\í›÷,o¨L³\ë+ñóŒ½\Ø\ÓUyWc¥\Û-öU[Zúÿ\0Gùÿ\0žÅ£þ3­s±ðp\ÛS\Þ^÷[¹µ²\è\Ú==ž•\çn\çúŸI`}Z»¨\ãýkÂ»¨U’û¬>‰9õ\Ô\à\×7Ó­Þ¬úÞ›\Å÷I\ë‹^9zŽO~\ãÁÁÁ\Ãú¯òsù\ÔO«¯\ì_«\áb®9xyJ\Ì[mvA¾¶†—·\Õmc\Ã\Ôk}\Û7«ÿ\0R1]wS\êøô\äÛ‘‚h}\r\Ëõ™kN\çmª\ÑMcôVl\Þ\æoUº\ïKwYúï“‡]Í ZZ\Ñ}˜ô\ÛXs+n\êýKª\çþn\Å\ê\ÛÓºŸTé¶¸<A-\É\×MnôK˜\ïO\Ñ?¤Ý¿ò²\Êu\Òx\Ìý¼wŒœQ\Ö>¾.w÷\ã\îðªP¾-Ž\å\çz6K\Ë9õN·gLôHm[²*³x÷;\ÙžÝ¿E\Ë\Özf+0úv6+,76š\Ú\Æ\Ú\î\\\0únþ²òn•õ|uw\ä›s\è\éÂ·K~Õ‹ú@\â\ïun\Ý\ï\Ûû\ë×±v}š­01¡¯i@Iª>zP2ˆ„\ã/ÞŽ1.f£úY!./ö™U\'ÿ\ÕôŽ³…fJ\ÊÂ¬´?\"§V\Òñ-—÷ù«€oø°\ê\ÒŸ¶F\è­óœ½1%s”û\ßþï¶œ_\'ý\Ú\ÙpõxO¬P3ºT~N#°Ù\é\×]l¹ŽsÀ­¢¸\Ü?ª´¾¦}U\Í\èe¿)\Ø\îû@`h\Çio\Ð\Ýô÷]u)%?½ý\Ôq¹\ê5ò|·\èÿ\0X¡\Ã\Å\âñ\ê7Q\éÿ\0X™\Õm~!¥–Zø­ŽÅ\ío¼ÿ\0_Ü»d\é(yŸ{Š>÷\ÍÁ—ù¯\Ñù+£\æ·‹>®û¬°Y{œ7V\â`’\íV·Rú†üŽÓº~8\Æn^q{\ìkg\Ô÷_\é³ó}K6=v‰+Sÿ\0H^+¿›õU\íü\Ü?\Õÿ\0W\Çó­:þ/õs\êgLÎ³/(\â8úWO¢\Ç4µ\ï7º3\Ó\Þ\ÔoªRóúSvfKñ\\\ÃKª†9¯’Z\í\\\ï\Íö.\É$Ì¿|ýw¹û°÷¾O“\Õ\íWüÿ\0\æ\Ò8t¯£‘õ«£\ßÖº=˜î­¶=\ìp7\æ{N\ïsZ«ýNú¿•\Ðpo\Ç\Éu.}¶úƒ\ÐikckY¨w\ç{VúJ\ï}\Ü\×ózü¿\Îðÿ\0ò§Kñ§Šú\Õõ+«õcŸ†qX,cE¾»\ç·Û¿\Ûÿ\0±¨ü_e\àuœ|ì£ˆ\ì|wµµ1\Í|€}/wò»Ä•‘÷\ï»\é~\Çý\Ï\æ¿\éÿ\0u›ñ·’ú\Ýõ[¬u\Ìü|Œ[±™N3?F\Û\Ø\\\æ\Ø]¹ö5\Íþ­\æ!uOª}7\ë]™8¿«ú\"·>²lh¯\Ýl;\èû\ìu®oõ\×d’Šx\á‡Nö¿š¿\×ü\ß÷_\ë?®£_“\Ä\×õ¨·\ëA\ëøž\ÉvD8[“ôþŽýPzW\Ô§…\Ô-É²\Ì=–W}cen›Z\æ3wò}\Þõ\Þ$ž~ù\Ã+ù}˜q7þ\çõ{÷\×W§ñü_2\âÃ¬mS§\Ì¢zô…fK\ÅÂ°´¿¦\Ö\âÁ\r–ˆö4þj¸’\ç\Þ\ê?y\Ú\Ïó{õþmQ\á\èÿ\0ÿ\Ù\0ÿ\â@ICC_PROFILE\0\0\00ADBE\0\0mntrRGB XYZ \Ï\0\0\0\0\0\0\0\0acspAPPL\0\0\0\0none\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-ADBE\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ncprt\0\0\0ü\0\0\02desc\0\00\0\0\0kwtpt\0\0œ\0\0\0bkpt\0\0°\0\0\0rTRC\0\0\Ä\0\0\0gTRC\0\0\Ô\0\0\0bTRC\0\0\ä\0\0\0rXYZ\0\0ô\0\0\0gXYZ\0\0\0\0\0bXYZ\0\0\0\0\0text\0\0\0\0Copyright 1999 Adobe Systems Incorporated\0\0\0desc\0\0\0\0\0\0\0Adobe RGB (1998)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0XYZ \0\0\0\0\0\0óQ\0\0\0\0\ÌXYZ \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0curv\0\0\0\0\0\0\03\0\0curv\0\0\0\0\0\0\03\0\0curv\0\0\0\0\0\0\03\0\0XYZ \0\0\0\0\0\0œ\0\0O¥\0\0üXYZ \0\0\0\0\0\04\0\0 ,\0\0•XYZ \0\0\0\0\0\0&1\0\0/\0\0¾œÿ\Û\0C\0ÿ\Û\0Cÿ\Â\0©\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\08\0\0\0\0\0	\0\nP 1`!\Z@3pA\"2#4\'$ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0	\nÿ\Ä\0_\0		\r\0\0!1A\"Qaq2’#\Ö8 P‘¡B$\Õ6–7	±Rr\Ò3“%`ÁC\Ô&V@bSs³4dF(‚²\ÂcDT¤5u†\Æ\'ÿ\Ä\0c\0\n\0!1AQa\" q\Ñ2’\ÓPð‘¡±#4”5\Õ6Á\áB¢3“•89R‚7`ñbr\âCcs£$\Ôp\ÒSƒ%u&Â³DTt´	ÿ\Ú\0\0\0\0\0¿À\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0õHü\È.˜\Ù\Ë\È[\ë`\0ùúþ¾\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0è¢©$(o\"U\r²•OÎ–f\\\ì(?¿o\ã…\Ì>r„\í¦]³\'\Ë\\þIqj$\0\0\0\0\0\0\0\0\0\0\0\0\0\0Á»ˆ\éõýI­\æšyû\Ð\Üþ!ó@ƒ\íÎ¾~^ƒ¤\Ùo>\Þ\ÏG\Ó~À¦ù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n$^~¬-\Þ®\ß\Z£ŸŒM‰\ÅÛ¯×‡W³§¯\ÇV^^¨#½q30œ\'1!vNù!¨¡£:`\ï]¢¹Ç³\Ô\0\0\0\0\0\0\0\0\0\0\0\0\0†FQH­\Ñ\Ë \Ñ\\“9q\'©oWG\\.v\åõlŸw×²ý¿&\ìuý\ìq\ïô*\Î?s2¡-ý£I­„uµ[€¸Þš¦ \0\0\0\0\0\0\0\0\0\0\0\0K\ê\'Ÿ5ñnF[ˆÙ•ð63\Þ\Øgšs™}¬8‹\àY‰\r\×B—\ÉF¢¦yÉ†10‰Er\ÃXõ\Õt÷2®–\Ï .g¦éŸ·\Ë\ç\ár:ìƒ¬\é€\0\0\0\0\0\0\0\0\0\0\0#„§\Æ\î%u±ß¤›\"|\íNú~ðõfu\î\Ã-\àÊ¤‡b8nŒ&ó!o¹\Íüéžœ*Š­ùV)\×È•öùJØ‡Å•Qj©/\Úú§ö&ùœžÁ®Á\à²6i\Æ\Õú{š\0\0\0\0\0\0\0\0\0\0\05v\ÇWg\Ä&if\\\'phòm‰›Á•tž‘f²K°‰\é~Cf/<Ó«‘\ë?0N>PHŠ,\ë„\ãÞ‡$¶]ññR\á\Ù2¹\ÓJ\ÏFR;_y\â\Öÿ\0\Ñdi—“:Œ\0\0\0\0\0\0\0\0\0\0\0°PÀ“ûƒ\ì{Ï–b4LG\ïU‹úHšc>\Ý%¶˜Á¨\ÊHzÎ§6QyŒžÍ¾\Æ\ãq­\Ð\Æ\ÝöJ,Sp¹ßž\Ù\ÕL´ \ëcP]cº¹M‚u§sýBM9¬‡\è\0\0\0\0\0\0\0\0\0\0e5L\ÎÙœ¿1.T,Wm77o*œ]K\Ìj\í\êC)>K*)Á\Í8ZZú•§öƒùF¨z÷bhP`\ç®\êsbÎˆ\æ³É®\Ø\ì(DdA>—\äS[O|´ö´¦Í®\è\à\0\0\0\0\0\0\0\0\0\0J‰¶)vk¶:WªŽ9\ÍY?µ·Áxº+\Ã>ù#›#‚©ÿ\0£©£<ŽÔ§m{\"›\Ûe+¸ÿ\0ÄU\Út‡/L§‰Z\ÙÓ½_q7\Ò“#«n­š¾Qj>Â¦¹\0\0\0\0\0\0\0\0\0\0\0Â‚¬G\Ö\Ü\\³õ+1\í‹Ar\êg•—±†\"A\ìgn62t\í=ºKª\í¼9Fv\ém\Ú[h–\í ò7Rz¿Q™5\n\Í\èXœ\Ùd^®¿—rúû¢²\á¶ÇK—_´\0\0\0\0\0\0\0\0\0\0{•½:\Ûtr¼O\Ó\Ów­(·n\Å\ÙcðF9B^LÚ®xW÷\ÐüŸ¶ó,\\e\î|ZŠ‰\Ó\ÕÖ¸ÿ\0\Ý\Ì\ìWov\Ú^\Ï:b™\ão§I\Ô-\Í\ä‹\Z;À\0\0\0\0\0\0\0\0\0\0¤ |¯_ª\êŒk:;¡·	-·~ª\ãñ®\ìu\â5\è\ë\Ä;\ÅÕŠ“v0uºò’\å\ëÛž|Ojòþò°Óƒä†¢\Î;\'\Û_­°(8ŠÊˆk\\±½\Û\èO²\Ç\Ëtü\0\0\0\0\0\0\0\0\0\0\0ðUð«\Ù\Åòª}@\È€\é\Î-5\Ìû#ZQÝ·e»{\Æ\Ðöw;Ëµ>\"\è\Ä+™×–Þž\ä;<·T“Dòè²‹e–kNªŽWpƒ{2†Ú–˜L^E€\0\0\0\0\0\0\0\0\0\0\nƒ\Ç<\Ý^¾ÿ\0\ÝÄ¯‰e|5´ôi5°FFvI\ÌOˆkü0óoR\ë58\Ú\ßP³1ÅŠÐœ~\ât\×>ÿ\0ñ\ë\ï@R]¢þNª/ \0\0\0\0\0\0\0\0\0\0\0N\ë+òs‹±×’[™–cvU\Ã\\gS“\ë\Z`#¨£1€~ª)í”¾v§x\åwú¦Kbø©U\Ò.oNz”\Þ{W\Ñ\Ö\Ö\ìp\0\0\0\0\0\0\0\0\0\0\0\0:TƒC…]~¼\Ö\Ü,³¤r+¦\Êx+j\rA\Ì\êZñ­žjB\ÇûdöW\ÒT\Û\0öi/·®’&œsŠ²’>qauzþ×£)Ø¿õ?¹\Ð\0\0\0\0\0\0\0\0\0\0\0\0\0t\ÙQ2=»}}ê†Ÿ\é{÷\Ñ2º\åŽ\Ç]+\Í~>gB÷\Ç/–\Ó\Ô\Ï#¹:?)¡ñbðuh\ÙlR_Î™†\Æ\îí¡žJ*0\0\0\0\0\0\0\0\0\0\0\0\0\0(RÌ®™À2c£=óV6÷Á(Ì_\Çð»†µ¾¬\æ1…™Ð°]–ðüC;ò\×\\Ñ¿G_—v¡9\Í\Ä\Ó\çkH>€\0\0\0\0\0\0\0\0\0\0\0\0\0¶Ci\0Dw™¡5ù^/G2^5·ing\èzo%úÞšLD‰—¾†xœ\Ë#—\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0» ¤Áuo\æ\Êxy\ÓÂ¸¬¼9ñû€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\"x\ÍC- \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0•ó\æüFJJùt¬o+\Þ>f“·\ç=~‡ \Ì)O,¿…û\àÀ(þ8ù1ø|\Ï	\'f0\Çñ\ê\ØÏœ\Ê›rž\ÈõŸu¿Wƒ%%\\ñZqÀ{?>eä“³\çya+\çšz´jƒ¯¿%üòn\ìrÏºÿ\0‡\ÞÝ‚ûœ\ÎQ›>\á\êrÍ”r÷>0šq\Äsø_²i)\å\ï\0~%*óB›«.\â-°±¦£\î,,g­%ŽW\îN}·\æ„n\åH·—j~G\Ð-Ë§•pü5¨ø\á®\ãiT,:\ì:Œ>\Ý\ÇB—j®{2¡ðk.iÌ‚°“‹¤iV\çP\×\Ñ5™|sª2\Éúˆ¸\ÕvÝ•­·_Û¦yú¼4¾\ßÝ¡¸^\îE¶0ö¡ÀˆßšË½Y›\ëB¸²¾\nUZ\Ø=YÏ…5\ê›\í~\Ö73\ÕM{¬{\Ò=•ùó±h\í>\\Œ¬£\âi‹»;\\3¯ª-š:X¹|\à\äš\æv·AbžFIsf“\ïš\ÝxVu¨ÏŠK©®„\Ð\Ñ6EÔÄ®Ô¨ˆ\ÈNoZ\Ø\Û_\ëº±4Îºu÷XVòmn@vqÈ™o;\0jR\âR#y–¯<\ìô\Æ=¯Ì¦\ëú»´¸\ßU¥\Î[Q˜T\\\ßk®³¬–Ó¨(ý¼2\éf±³;‘\é*\è\ë·\ß]¦¿\î\îŒ\Ç\Ò=ývû¬Ÿu6\ÎÜšÈ®\'R\Æ\Í5†o\×tÛ—[R—\n\È8•Pk\Zôhr&”\ïø±2ggVFÁš¦Œ›¾µÒŸ`f¹ûÓ‹¸k\Z¸\äÀ‘Kœê¥°F\äÁ\Ý3^5~u\Ó]\Ô\n\ØýŒµ\Ô%Œq¡±0O>wÖ±­\Ú[žê–¿Ÿ\ëKýœ	÷_†\Ö(,¹±óKŠ\à\ÕQ\Õý_u‰z´;|ù\Ýú\ï\æ\Ñ\ß\ãCWf‹Û¦¶SW…\Õ4\ÝX´\ï\Ù)”-\×ð´BÜ•·\Ù\ë¢\ë§÷Mg»¯¶V·Õ•{\Ê\ê¸lÙ±\ÓZ\îŽ\Ù\Þ\×Qw4(½l½µù/e¦’‘a\æ\×bÁjŸZ\Ö\Þ\í\îjYÉ—œuöl+r\ë~³\Ö}\èb\Ï\ÛR\×\nel´\Æ]­¼`\0b\×6»\r\Ø[$\Åz‚òúô«\ès²J.¶ADó\Ê3hŸ‹¿\Úü¾k\Ýí¯º§®ÿ\0Z8ð\"’\á\Âkó\Ý³´Î­«\Ùö\ÆÞ±ŸCV{`wž‹\Å@_@v‚ÿ\0z»”\\\Ý}¯Æ›ÿ\0\'•|ªö<jz¾†«C\Ý\Î[MŸš#º\Ý\Êù®ÿ\0h>S\Ùi¤%g½#d\íF\ÜZ¯n¾\×lÿ\0ó\åx0®ª‡×¾\ËM!™Pò^ß›õ3_\ëh\Ü»<Á¦…\Ãt\×r\çgú\È=\ZÙJ7…™õMp/‚•O\à€«û*§¦\Ä(\ëëŠ³¯¶]\Ó\Ø+~\å‘ŒS\Ëg\ëÖ°þþµ„\ï\Ö\ÝR÷Á‚` Uƒ.©ú\Òf½1p½Q\\\n\ï\Ê\Òló¹y(	\è2\Ï\ì\0\Ð=Ý¢¾\í\ít”XI¼\Øc\î\ÎØ•PB¥Ã„¡\Þ\è\í¦\ÐM\Ý~ð|£¦yÒ±«v`01©™@×¥e‡™sNl\Î\ÑõÑ¯\æA\Ê(ó¼\ÛW\äË¬rl¡\Ñ\å\Ñ\×c¸\Ës\ÜÒž|Rg\Ã9,\Ú\×zõ¬5—z2³6\"×¥c:Ÿ?ž›\r5ò\é•n\Ì*wr\nOù(›Lª\ã(d\\&°†—»+2²n½kÂ¦{õ¨\ïº\Ò\ÚW5\åÀñ þŽTS`–>\\H(Ëªz\Õ\Úg¹•0\Ým¯˜l2©¡¯6\é{¾h:\íÒ£zÖ¦Øº§¯\íÍŠ3\ß%R²zIO½¸[Íº»iK÷US&¤\Ô\è\Û-½\ã5\ä\')·ñ’WŒSÍZ¡¯©¹š”\Ü\rf\Å11ØŸPWoa”v\Æ>·{_ø­D\ê\àuY\Ô\Õd<\\e†\Û\Zœ¸4†ÞªŸlª³\â\Ï\ÌmŸƒuG\ß\0ù&¹­Pq%¯‚\ç\Z\'º\ÕV\Û\r¾\Ç\ï*ð_#D—W+\í\äf¸ŸC\ÖvÄšÇ®o…¯Z»ô:q÷XNòmv7_™O!¥{öh\í\ÒqV\ç2bG\Ýv~ct])\\\ê\'ú\r³öKÕ¥{y\Üª¼”ŠÎŠ^±[Z v\è\í\ÎE·‹…ºË£^ [EÍ­<Ã^9m’uY^\Ýû*|H¡°v÷J\ìõ¬zâ™»³¶73\ÑØ¦~÷\í<¿\à-]\ÕÕœ,z\åŠ\Êú‘¸Us\Ý-³ÑŠsý™:i¸ü\äð!Ž\ë@\ãus	úýsˆº¼\Ò\Þ>\éþ‰t±3^{.\ç\n9\'\Í[c+6ú/\É\Ç,¾2\Î>\é\ä2þs™`&ñ%v\åøÿ\0ZBö…7\ß\'\Ö~c¹	\'\ÎkY)TPŒ:\æ®´¾d\ì\ß\'¥üº¡öò.Mö©\Þ\î3StI-™H%\ß	wz_\×S¾¬Ê¶Q\Øx\å²!cf±ù{¥y-@Fq\È\Þ;Ttg¥˜Gõ\è–\ä¥\"&ö\Í\Ì~˜\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ú\0\0\0þ‘µÁ”Õ³¼\Ä!¾¯\nÖÛ¥<†˜UoS¼\Þ2­\Þ}¨F³\nß±\èBm\Ì3‡[\"+YWª÷\ä}õp2\ÏMch\Ð3q|Áœ™¬ž&\nDw\\dË™>\æ\Øñµ±9V\â¸\nW)_ô§SŠq\Þr§ž\"jý\Zx\Ú°H(\ÐJ~\él#ó²\í.§´\Õó\0ÄšbD•\'\'×§c<†V\\E®i”rsP2ß„:T_ª{J\ÍÀ{\ã„bc	ð€\áÅ‡”A³Ä¹²ó ;b³\à\Ì?s\ê9#\Ü\r¸0YúE\årÁ<À2	Bi² §¯#@”´þw\ÄD\ß¶§p\n(•\æF\Å/.Û£²°\\;\Ò\Ør\íök\ÛE\Æ\Õa\á\ÊqU¤b\Ö2¹ón9¢\Öó¹-¶\ë\îÆ—R\å6Œú²°!K_?\Ù\ï¹C°\Ü/vžZ§P’òM\ÈòC°©‰&\å]\r\à–\ç<ÒšC4£z>uÚ‚\n¸q\×\îa¿5p\Û\Õ6º\çgV\Ê\Í~Ë’	T\ÙN¨~s¨9/Œ£*\ê|D\æ¸oqé¥ªB©\'@’\åv\Éw¹•GZ\ßC\Ä#‡\Ùk6&\ÚIÄ¹V‰•­\Î\ÇIÆŒ)´Ì•\'v”¾\ï1*±óŸ\Ò:B!{„C•\n¡ST\Ù<K‘.cª]ª[%‹n¹h¶UŸö1g\Ü\Ýq\È\Ì\â\äþ¨\í*7¸µ¨ºX¤\å¶\Èç›–]\Í`\á\Û\ÇB2Œ¯…É›N\ê1/‹i*\Ú]„ÁC\æ¢ú5º\Úû•.v\ãU³‰]‘zG¬c§#V\Ëa±\Ö<…sš™a\"%	\"¢w±Ad4§™Ÿò\Òÿ\0•¶\ægOÅ…£\ÎL`ƒòÁ\Ä§(–ña\ÉF,Z‰F\ÐNˆV¢‹+n\Ý,6Õ¥›¢r-\í×¤\Ð×²­ˆG\ç&\Õj„\é:©O$”\ÝÃ©`ù3L	F;)”Ã‹&|»?Ë¶Lr\å ò?Sú5¶IYÿ\0r&Ì…DP_´Ò‰ž—\Ñ5e^\Íq6\Þ\Ú\Äm¢94p%Ÿ\Ñ	\äjQ™J¼q¤td—[@jý·•}Ã§`I×¸]G¼\Ñu\îŠÛŠ\ß\Z–Q²@A\ÆÖhÁf#; \ç5Œª‡£k\å;I#£º\î49M\âDjýz+)+^\Ý8\n±‹µ\Ïlsl\íw^‡\å\Ð\Ì\é=ZÞ–\Æ\Ò9µœœ¾\\\'\ÖI#\Ô¯¸4\Ú%®Ê´UÃ•z—DQS,”ˆ\ÚJi¡!^qOk…ôk†{efMeh@\Ê\Ö\Æ	\Ã\ç=7vH\äûo¹m·_s¤“¡•§\É\"¥Áµn\Ù3!£\Z™+\\•s¤þ3Œ¨9\æy\à\Ô\0{pðE\ßx=¡M=%T%Œ‚\è²\Ëò\\F\×9Šj\ë)Â“%¥¾ñ•q%+„¥\âz3T.0Ú¾\Û\ÌbJÚŠ\ÙŸ”Œ<	¬´\Ì\à\Ü\ìN®X\àŒœr—o°\Ùýw¶˜F\Ñž=R»·?\í,Y7Œñ¤¿L\ÏÐ„þ”S˜¸O§H\Ì¥:Ð…iŒ^\Ék½´²’_M¾3Ý¥C\íqn\Z6>,2\0r])\Ô\ärg9\"ü:\ÙkZ\Ý^k¢NF—§l­µtkÑ’!ú\Ùû\Ü	‘\Ý\Ä\ÂM	\Äù^‚•hµº0\ìör\Ë\é\ÃWª\r“Ìµ\å|˜QT\Õb®=¾·V\êö3-\à\çe\×\Ø\Ö>-\Å\åÓ”\à¹æ½­¸zq$¾[³H]C°6!Ú‚?¹\É\Ül\ÃÎ¾aW\Âð•\ÌB´s½¶šeuNžš/V¾[†u\ïT¾_CCg˜\ì\Z4\Ç¬ÚœŽ\É$N‰Ÿ¯r²\ÏJýƒ_ª)‰¾—Š“-·_J8\èeôka½\0\ÇC•fe¼«‘²_R7$ûY[~\ç^\ÌA¼=Ty\ä/s2\ÏJùƒ_¸ò\"}!!|ó#}AÏ­s´xŽmœ7[s­i¨TLe‹6\É\Æ\\\Åü\éÉŽDcN†¡aeñÑ©T^s\rdiPi^\çuß™v(\ï„‰4Os²Ojþ?¸ý\'$a\n™\ÝG‘¸ò².¦˜$’²q\Ê@-H·f\Îdƒ\ÜC»j¡\æ\å–_’ö\ÊJGnÖ¿K\Ë\×3N/\ÆlÈ‰Ã¸JÝ—«QiØ\Ý,l¾\ã ÿ\0¶·•b\ÅJF>G”l[()®ú=Æ³­uK™6\ì5\Úme¶†NÁx~\Î\Ü{JZ\è\í\ÆL­n^»î“¤8ñÅ‚”\nµB°Ou’&u3\Üw\äY± \"B·gtm\èOYX\ì\\$P‘™û\Å»X6Šw;`ò­\ÛEÀ€†gôŠ·ž‘VðiqfP©\Å\ì‘Vó\Ò*\ÞgÁœ.liUNl~‘Vó\Ò*\Þ8»?`“cZúE[\ÏH«yŸp¹€‘ž\âôŠ·‚Óª,¶ü—zE[\ÏH«y•.¨Áˆ 1cóúE[\ÏH«yTš²\ÚbÅ”F_H«x4¼À³7)JÖ¾‘VðyI±Ul²ü—úE[\ÏH«x8\è¯,J*²[\éo=\"­\à°c\0g\nX\ìþ‘Vó\Ò*\Þ ?.\Ãô\Â«žÌ»Ÿ“‰\Ï\ÉÄƒ\äþ~Ö’Ø‹³\å\èkX\ÉÄƒ\ç\ä\âAòH®N\\\×\Õ²w\ì¡!ù8|üœH>N§­Xý¾	÷z¢\Ù?\ä\âAóòq ù$—g.c\ï\n\åù\Ù\ï\ÉÄƒäž™2\ZG1\ÍùÀô‹‹]›\ÈJWòq ø\é\ìi÷T¶0µ\ÙR22òq ùù8|Í³‰\ä´.=Z—„«i\élÛ“\Ãek¹\ÂÑ•.2N\íy\àW”Ï¹’y*\Ñ\Ê\Ò*òMª¼\êr¯\ÉÄƒ\äöÊ¹†¥|*O³\0£òq ùù8|œKgA\êv!“®¤e$\'\ä\âAóòq ù5\æ\ë¼ö°?L	“²M“lÖ›|mÁ\×\æ\å\Íä¼•‡ò\íÀ‰›’)Öw¶¹&×üÜ¹¼{\ïc¬œ\Ý”O%¶Y3\'»œy\Ó2¶KJ\×K²0\ÌÙ„\Þ0§; x\Ó\Æÿ\0›—7{¤=\íu\Ò\Úq#n\ÝË›mJ¶+8O\n\ÖfI\Ç=3²©œ¶\";\ÜóÊ›8^n9\Ç]¡\ã#øo\â½\Ó;\ÇFJ‘MT‰.MÛ¹\×\ãÍ’¹ò±Szh$Y·\0\Ü\Ìý{\Ù\æ´kcü–Z¬\\W\ã‘veKö\á‚ \Ù|\ÊU\ß5\Ý71\á})_\n·[4—k„²³q/\Âù·\é\â\ÏY?%Æ²3¿Fñ¡\áÉ°ùÏˆ\æ\åÌ¯$\î\Îq¢úb¼ýwbrBK3ó\âR9j©¾Ss_\îü±jðÊ”6Á%Â”\îJô\Ù5+\ãNEY#°´Ký®U/Old\Ù F$\ÜÈ6\Ý&;ð\ä»\Ã\íJ\ÊÝ¢ƒDgºûò5RŸf¤mø\âÏ¢ô“Ø‚-…sb|\Út\ÜW.7?,\Ù/\ZsUQ¥\"$\ÖÇ•l…9^F9\Ï;MZ÷\Ù\ë¢\Üt|C“Žh\é2 N©g‡d1M“x\ÝS\ç½\Ï-.pb\Ú\ÈE–63Ï¹c[7\0Ê¥\ÚË‘ý-\Ã\' X\Ù#ˆ\Ö\Í\Ïh¼\åNYw%\Ý\Ò\Û+u·ˆ”[M5LRLKh\æ3\îƒ2mô\â\Év¬œü\Ø\ä‰9“‘Jn›™s_J9¨A\Ü]\Ïq\Ø^\í\È[[o‡\ÛÈ¢¶\Ú\\~F8ƒ\Þ\ÎÖ\ÎS³+1/6—!\ïŒD‘\Ì\ÞjU\Â\Ü$8Š\ß\\:÷naZ\ãûÌ²Eµ¶Ñ‹/qw=\Éì«ŸÇ­g\Za+nœŒ\\\íTÁŽ§\é\Í©§)\n^xI\Ã\×z2.6–Z\Ã:\Ãao³ž¾\ÛÀ–\Ö\ßµ\r”ÿ\0\Ý\Ä¸75\nÁCÍŽ\Æ\ç\ny«6x\Ôr«¶.H\È{‹¹\î{‹¹\îMCi\0tû\Ù÷Rò\×rÖ—{‹¹\îO“\ÉRz\ä}QúL;1Œýðlr~6\Üut\ãJ¯^·\Í{q?óGe±”õ[´v¶JÒž\äO¿h\Ö\Ç\É\î-^ï¡„œR5#\Ô	\ì%‘r\å;R¸Jd\ÜU\">ÿ\05¦Ë·Ÿk\Éÿ\0?2m2Œ\çf³ÅºY¿\Ór@I„§\Z/Y{­#rmr¬m?NA§¢W&“\"<O\Ùû`\ÝmñŸ@¯\áœ\Â?’²‘\í\Ú2\×Ò”¥#C(ð=\îg›ºny»¦\ä£föŠôµÔ­+H7~\Ç-cž\r†l)Šp™	\ë±y¸,¤\Ã,4³\îû\î6Ü¡Bn›iš7R@I\'VM)>˜\ëŸiD•ü@\Ì>2P¯g±\Ðò$”„Nœ9\ÛL7/\\\Ùˆ7ü@\Ì>9­Ò‘¤_‘“P¶±\Ën\r\n&b°/ó2¿\íiµ£&Þ†\ïñ0ø\Ø\ÆÍ¶3h‰	\Î.{\Ò-\Ö\âE\"\ï\Ô\Ä\Éri™\ÜbA;…8¤S¸-\ÌvÛ›LŠ—\ÌK\èË¹}‘=ˆzG1vÁmñ\ÌG®\ç-\âÓøµò7øÝ¶\çD·{¤\àøÓ¶£G\"x¥6D\Õò	’\É\ã\×nG¼{OŠ\ävc9\Æ\nq\Ð;~\ÞYý\íd\âö\ÕYT\â`\å#z§ƒq\Òb©ñ\É8Ç³·M´c™…¼‚q\Ä4»•QM@L+xúk\ÊEGvó\é,”\Ðs[O‰[V\çÄ­«r@-Ýµ‹—\ã~Ä–7Ä­«s\âVÕ¹\"S«ô›\âl`°¬JÚµk°²Oµ\çÝ±†7\ìAb\ÂüJÚ·1\ßh\èJ±Z¤^¨\â‚Kc]ªø•µn?m–\Í#\ÓJ‡À¦Q¸õ‰[V­g\Ûe$\Û¿dm¤Sœ\å|JÚ·B…b}\Ü\âÁ[µÊ°WjƒÀ¸M®\Ì\Ûuÿ\0Ä­«rq•(e \Ì@•n\nRPA\Ù\Ön\Õ\Æxü³“™¼3\Ú)ñK\Ô\Ò(—Lž\'\í;9NÀY\Ùr×Á6l¹m™vnR\ÛÃ„k¾¿~%m[Ÿ¶­ÉŸ\ç›~\Ãý(\'\Õ\éj\Ë~bK|Ä–00l=1&\äb(‡\æ$°\ç\ÌIa\Å\nˆýZxX ¾bK/Ý—A\×Ú˜“r-CóXp\ÚWI\Ã\â¯!\×Å¯\'ù‰,8®’R~Ÿ/8¤\ÌIa\Åó¤\å:£ûNsŒÕ™üÄ–775?5\ì\Ã/¥X|GR>A(\Î>bK-W«w$÷ˆyú6D‡Ò–JªIQ+Õ»l{óXqL¨R-°\Ë\éV€ô;Î¾ö÷5\Å’\ÂO–#–«ðÿ\0\æ$°\ç\ÌIaÅ¤‰~\Ür/\êÿ\0ÿ\Ú\0\0\0þÏž\Ìa1Å—\'z\Zx}¸±_šÿ\0\ãóÓŸ±N~\Ðu9ûs\Zs\É3§>\ÃJs6A`L\Þx~\ëÏž\Ì\ë ‹,²\Û-únº\Ûi_(I…ö\Þ_šÛ­¾\Þ\éÉ›;1\Ùxü\ÙiO2µ¥9v|6ò\áÁm¥LƒÓ•5³•4¾¼\Î/0‹x\Z¿¹	Šû€f\îƒ\×Ym|k\Êm·e\Íu\ßõ]Za\Éw-\"¼¡xŽT5)\\EÙ¯\àÀØƒ\Ò\Ì92Z\\*—Z#‚1„\Ï~\Ë÷[\áœr\Ë\åWô°C\× \\8.³\îÁ‚…Ùq‚®\É@¿w,²\Ë)Á÷ý\â±ý¡††»\à\ÅPN1h#!U\ÉN\ã3\É}¶Ò·V¸1d\ÃA×‰¦\å¿\0\×¼‘’´\r‚œ®U·L8oìº´¶™+\\·ã¶–c¾\Ûo·-™@ˆÃš\Ìø\Ç`¯€s+r_\ÜCl¶\à\à\ã®>¯ßŸô\à\Ëi’\Ìø2`¼\Ï>ß mÿ\0`pvy‚»3\á·><9rÏš¸\ï‡m\ÜC\ë\à¿`^ºgZÒ” ¼9EÁ`‹2Y“@b\è&\Î\ÓKøWgý£S=ò\ÝKŒ­û+mÔº\Þ\á3¯€L4ð\ÃÀõ\æ\ÍJ]‹,\Ù.\à Öˆ²¾h|¡D\Ø\'`\ìŸx‚\ì`o V³W81vO07p™ÿ\0\ë\âÿ\0o=\ßf\Û~\Ð\Ùk\ç\äý;F¦{qß6\\\ìŽû¾\Ë.ñ\É}–\Ò\Ë;s\äòñb\ÇLx‡¦ÂŠý¥mº—\Û\Ü•ÿ\0\Çm<-2¾¶†¥ß·‡1Yô\r	\æ\Ók\Ãe\'ÁAcóv^#:^e‚\Þf~Z\×8¼\ÕÉƒ5–Ù‡.na\Ç\åb\î?\ïN\ßJ\\Û²\Ýô\×&;x:\Ì\ìž\à\Ù/1<gå…¹\î\åÀp`°0\Ù9JRœ0\Í\\™ƒa¦=\Â;.K³\â1\Å\\9DS6zšb¥.5»•2^Tp»¹L£¯\ç6þP¼U\Üþ37…iZT>³\å³}£pW6\"\à\×ã¨Œ¾N¼\áÅ˜6õ\à÷\Ö\Û\éh0\áYh \Öòð[\Ê[m>Œ·\Ó0x¨ E–YŽ¹\ë\á‡ûFY¾\ëÁaòpw\\Vf²•¨Z\çÁ”&@ƒ,O¤\Ë\'Ûˆ¯† Gþ¿™LA\Âã¨‘=Ë—™¬¶\ë‚\\(%ø.6\Üôú\ß\\¢-û\à\Â7{ûDp\ãsÒ¶\àò°w6\\Vf²\Ë\ïx°U\ÇÀC¼\ÞË¯²\Ê^7\r¶†·.QCˆ\Íf<\ßÿ\0]œ¦|–ò\Ñ8.¨‘8±\ã\r‹\ÏJxwF\\Vf³5s\à­1\Ýu„ÝšûBà·†7\Ó¼nÌ‚°c\æC;)Ì¢³ˆ\å\ØsYh/¨®\é\Ênf.\Å3Ë‹€\ÇV\Þ\ÍLÙ¨46yò\ÝÏ¸Xš\ã-\Íw1—`³–cÇŽ•¥+\Ê[m½\ÙZR\ê)JÖ¸\Ë)\áŒ ||ý;\Êû-¾\Ü`\Ã\ã¿þÖ¶\Ûoœžp~[u·Ò¹0\Û_8?<\ì§…\ÔópR¾p~yÁùJ\Ûu;.¾\Ë9\ççƒ”ð­.¿•óƒò™1]^y\Ø9\ç\å2\á­n­¶\Ó\Î\Ï8?<\ì¯…9\ç`\å·Y};<\ì¶üwöy\Ø9\ç\å·ã¾´çƒžp~yÁùJ\Ûu+[m§œžp~[“õúU!\0–ú—ž„%\â@ )1qú@¨À\ãÐ„¼ô!/	bT%O”O¡	y\èB^%JÃ”ö+\Ê\nòz—ž„%\á(L`JU\ê/Bð…2JHj/‚ú—ž„%\áz$œ8õ9vRBóÐ„¼¢—\Ä\Èò\Ùòœ96\'‹yu¿}™›\ÂÀ\Ù)œ)\ìb0\Ð@|­ñP|ž„%\âI$”U9•\nMvOBóÐ„¼K/+.R`5%ô!/=KÄºT°¨\ß\éVšŽ\Û\Å\í`\'0\'¨Q¤bB·DC¬ö°\nÀ\ØV;b>|\èTÀ\\¸\Û¼ø\Èð§\ËùO\Ôõ.š\Zo°,Ë\ÚÀ*aX(ôžQ>Õ€\æDJSùc\Ì:..6Ä¯60m¨b\ÏJq–\Þ×–\ã³\n,#/µ )Zn\Z¥\âL‚\ãÇ„\')\Å\Zi:`pJ0\"š~§É„\Ð\ã|\ÈDÀ~&KÀÓƒP‰°¢06…ð‰m‰\âI•;(\ÄzYè¤•n«Xœ!B„!1úO\Òª!$†)\0!\ÄƒŠò\Ô\é#Sñ©“\ÙòÖž§\È\Ñb\Î\n°„W\ÙN\"H‰ J€\ËQ	\ÔÂ©ú˜\'yGb¶\ËqŸ\"…‚P%@tPe—ƒñ‡\Ì\0˜…Ò¿­?SÔšFÁ\åBK…¢!Ÿl9°™•¡\Ô&…\ÅøJ€]}˜\ìLˆ?5<G§.˜¹>/$\é!Æ…\É\"R\ã³$ðªlˆ²úr\Ôû}=Uiªðˆ,Oü\è’lDj¦<óX`K\æ\ç\ì[n-0»”\â„\"!ÁM ¬+\í˜#4\Û~L ­DHqš\ß\Ô@&Ö¢\éú˜ƒn.‹Ë¦3ðˆ‡±l8‘Ž\Â?ƒ\í\rpPõ†µýx¯À“Í™\'ˆ‹	i\èDCrûAZT\0oh\ë¿Q\ÃP ¬m@7R\"Á$ƒ#°˜qT”\×ö-‡?b\Øq3Œ›E9x\Ç\ïý‹aÄ–$öQ¹!q\îE¨„xâ“’óÀ\ëKp¡0…=\Âš\n\"µñ­8¡ôó%?²þ+\è6K	\Ä%4/\0ð\Â=³ýÕ¿©o\ß\âòü³ÿ\0o¿˜\n…HP—&#\Ã\Úÿ\0K\í\çò\Õýx©,Nˆ™9H…\Â<sjd0\Z5„Œ„­f>µñ©Ù¡iPþ[\Ïþ[\Â4`úÿ\0jªýü©r5l\Ñ\"‰&•4L\ä\ÇNSa“=[Äµ*PJ\\Eƒ\é:U÷3\ÃEB\ê\äžR\Å\êS\Ä^q¥Šô96/q\Ó\\3€<™,ÃŒq\Ûpd)8nNh´\ÅnBV6Ž:gƒ\Ï“1D·\0¼¬H\Ö\Ò\Ñ^\ä&yœÑ³ž\ì\Ø0\Zt\ÜŠN›\Z\0\ì?6+)\á¶$0œCqE§83\Æ\ä¾ÿ\0ÞµÜ°õº\Æ$!˜ÃŠ¼¤8KIõZ¡\Òt µ\Ãkúš·¦‚\Ò\Æ\äCªŽ“!\êHzƒ\08\Ð\Ì)0+L[rU\ÈMW…+C¡ŸJ´\Õ.\0w©\Îz‘½\á@R\àÀOAMýH\ÞsÔ\ç\n3Už\ìvõ#yÄ‰†\Ê~§§ˆ ¦þ¤o8\í¿+\0|1(\"HŒ=H\Þp Át`*\ìAú‘¼\âHy€N\Åh\â@\0}H\Þp» |\Å\Ü(ð÷¨›\Û/=8©\Î%­O‹\ÅR‘<A±#Œy\ÙÀR \Õ9\n\Ìp›\0È£o­È3M˜eV%@P òR\n-Q\êFóž¤o8™9H\r6úE••˜_\é\Ä÷=8ž\å¶ÛŽ\Ñd¢³zq=\ÏN\'¹‹ø«Kn§§\Ü^\0¾\Þ\Ñ„¢³zq=\ÌdXrxðYIPüžœOp1)0<\×[fK}8ž\à@ @Y\Ø,!øý8ž\å˜ñ\â\Ç\ÊWÃ•N§\î®\"b|½8ž\à`Abà²‚‘\Ùp‘‡\Ê((AØ½8ž\æ8\âªu?uA––—\ÔYIPü˜\Ó\ä8²	fN\'¹\é\Ä÷“”\Ëý_ÿ\Ú\0\0\0þ‹ñð\å\ãA\ã»b»0Žz\Òh\à/R<Xšo\'\Õ[­¥{­ýuÁ´è—·v&\Ä..ò¥¹lÁÇ¶K§‰\Ô«­†’Ôª\î$ƒ%\Ñg~a-\×u‡2Yõ)6\"Ss©ñV-äœ³µW!u)0M\è\Ý7]Kiµw‘6žh\ßuPb\Ó\äT:u\ÜV\\›Q.\Ú0Mk\ÉP´Ë¯™NñPš\\¥\Ñfcc“Ã¤\Ã_l\0\r\Zö=\Ò*\ì\Û}þÿ\0L–ÁÚ§Mö7}\Ñ$ô\ë4\Ù\â\ëÝª½z*öS$fóß›MJ¹·GØ¾žºül¬Z\ïCOÈ».§­]¦ø\äu^Ç \á¦N\äU2\àB\Ý\Ä5[\Øpâ±°=–Ü†—5\Í0]\Í\0CBƒ\îSõrtñ³¡®®\ç¶t\à\È\Õ\ÆA£r‡möW3dú\Îd\Ë\r\Ç;[«\Ï\Ä\â¾ñ×†O(E\Ýj	cu¢H\Å¸µ¿Q˜qZD8`PÓ¸\Ç\í¿O&\Ô\ËS{VÖƒ]µˆÉ¢=¤9,»™Ü† J\ì’w5\é&ŽAL£š­P¦\ÔLJ\Ì\Ê.eÍ»–¯ˆ\Ç+¦¿Ø’Tð—\ÂÄ³l‘jT«w@k!©±\Û\Zðê¤¦96%…)\×5­W\Z\rf™\ã\È!±x.\êkM\é?k„Ù­\ß¡«9\Û\Ín\Ïoû…N§,J–8[4g\ÑF\ÝB{Ap\äB\ÍZ}\\­¹\Ê\Ñ\Ð\Îw[\Â1J‹+\ÜË­^Å‘)\çM;-\ËNH¹†\Ú\Ðm¥»yút£X^#\Øöýx®øRT\äk°	`¢R\ãE‚–0HœTy]F‰\Ú|J4+’ºšz\Ô\ØK-\Ú. }}FEÎ¹z›[©@\ì÷\É\ê4\Û8ô:Ž9«†ø±\ÊóF$\ë·!C1cŠžK:\Î2U\ØL\æ©\rùi‘òÕ°|\Ø\ç\Ú?úªT\Ç\r‘eŒ\Ñy<ÁqRcaQ\è^,Š—5\Ã0\È\ØÁ\Í8\Ç:\Ê‰m—^bÉuµ8l‚\ïjð²Ù¤Zƒ²ýÒ|¼HI…©\rlÂ\á6\×\Ü\Ý ^ªi²\Ç\Å\ì¯Ý„mF\Æý>·\"J[)é»´\ÙVº3¶UuI\ÈòmC8^ûb-“R\"54[°‹\âC>ð\íý\Ó\Ý\Ð{&gù)8‘\ÍL\ÑY\ær½Ð›H\Û\Õ\Ó|šr7A±ˆr§bœ}|l;ø\ä^\Ô\ZP‹—[_\Ï\Ý\î\"÷©9\"1M¶\ÙvF\è7¿\ë\äØªj#¾*M^ªl\ØBkiôSbO\ë·V\ÉH\ëŸˆ± Zù]®†\ê(Iò\ÎC)®±bÜ‚A\çq\Ì,ò¾P\Éü\Õv\Î\Ú}—°»dvq¢™\Ô`·NA\Ëe\ÐwIt\àGÛ˜\ía]m·\Û2\"’eðCLF	[œ†BQ\Élv…@8),õÃ°½Bt\ãI{d³¿\×\ÌT\n\ÏB\ß\É\Ì¬“€¡¡\ì™0°i$´R\Û4m#½Ì1>,e´Ž’1\0\ä5³\æ\r*˜…¦½§š¥ŠYm“Zi6\Îc½\ÐIøŸ;CMh\Å½–l\Ð\ç.k†\Ç6EL»5Áô\ÅP{‡@—¸j\×3°Á’CÕ²@•À\Ùlžm5müóW+†\ÐF=Ÿú\é\Ô>€™]rþNRõh\Z\ÏChº’½DöXL†2AMiÁ´\ÙnKf@I>¨\éÁ\rñ\áy­]…)\Zn\ëµv”|l\Ë\Ä)·ý¨\èi\Óõ~@mƒ‡,)6Ã¯\Æ	&\én–4\Ø\îÌ‘Ê·÷)c˜I\áj»öQ\î!I\ÙZ¥q\à\Ú\'\Ãõ\Û@Œ†ª€þúAõLˆ¸\Â_7.aySë³—l±}-u\rTm\Ù\ìÉŽÌ¶N\ØVœ}\Ñ2ª6­#›vZ¡lPrˆ©!GSîº¶\ë{bŽÖµ_Gë©“gO\r\ÙA/dÙˆ}zg˜\á‹„)d£‰ŽÑ¥\Û#3\Å#˜ÁJ\ê\êj‚°ký~\Ò\Ö\ÄÌ¶Ÿ	\Å<ûŠœ¯ŒžØ‚fM6!°ˆ‘-«\é2Œ:²bR™s\Õô¿UWU\Þ\Ã\Îh¶\ê.\Û*¾õ\ÎÕ¶Zö\Ð÷$‘V\Ö\ä\Êø^AˆUp0¶_f[#\Ë6¦|£P\ëó¡Cµ\nz†H\\•E<\Û!\ÕB‚@Áˆ\ÈÆ¹±y™¥À\ÃG®œl±›\ë\îþ\Ö\îùHºÀžŠ•M\×[]²2½À1/0%1‡0<\èø\Ñ.\Å1i\'u\åq8\ÈÆ‰ˆføe´‹^Ò€\ê€õ÷›ƒ“±”\í…<Q•¡´Só\Òe°ZÎŠ¼”°E‘\Ù,z,Z£\Èp¨(¤a`¨\ï¨÷Hø\Ý\Ë°EðSg?F0‡#€Á$\"\âIø$Ø†«Ç¶”P&\rHM\nÓŽ!¦\È\Ü#U²‚\'ImT½š}›b)hb\ÎPº=6%´\Ø\"Aq\Ä™I£vd»\è?û(\"N2‘\ç¥2*ûw;–c¹0\0²\ë}R,\n~‘Ÿ…d\Z+…F3¿`´¥)N\ávšã žÙ†²†\"L‡#Ey‚Q\×EC)DÁ€œEj}\à\Ò\Þó\Ð3Øƒ³bN\àv\áœeS\Æ2WlI~*M\Ï\Ôa\Ëª\Ý{A\r\çÁÝ9¼[WÁ,¸[EHµ\ÈA\Ï-;!\â\éÍƒ‰0O¸\ÝÖ‘>\è\'v5®#6\Ø\Ðz?ÕªrUŠc\\\Û²,sgšžtuº«\Ò&ü\Èe@k\ëöÛ¼\é<B/ŽS}šŒ	x’t¾I¾2š\Ù6\Ø\"\î´4ß³EL¤°\ÓŒu«]¾½­)±›\r£Ä»u—©‚ô.¥a\à™\ã<‹\ËÀ”€\îGy¡O:‰Ý‡k\ÈÝ¥:7+$U•-Óª\Òõ¼—$-cv¼À€Ž{‘òÚ¯;ZÐ‰^M´ˆ\Ö›…\Z÷u\Þhó øØ¦s(¥W€\ç{M³ó\ê»:Êž’òÈ•K•\"\ÆNtò¶nº÷i}\Ìó3\é÷Y5³\Ø<vÉœQedK)N›Z—\ÊÔ„Œ\Ò%¯\â[ú€]9;{Ó’Nf¢7¬\ä?T\Ä\É^\Õ\æ—óZ%c[²®Ì”\ÖË˜d^žˆ+²eN¯¢™9³$\Ò1“C\Üò4%BG#JHC R\ËR®f1¾W;Q‘e)\'ø	&É¸	RÔ‘‘1H³\Ót$u\Â\Ù-4­±z5\ÏLlö¥\ÚTN2hŽ\Ó–|ghv‘E’£Kû¦´¥\ÔYµ\é%¸-Œk%jtš…B5c5Œk+\Â\Æ›6´R¶zúgX“\ÍZ)7‹P\á\í\îõrL¹`P\åj§pTñö$¡˜2\Ûm¶\ÚIÈ¹x\Ù\Æð¿˜\È\Ã\Ï\Ìda\ã)>§¸\n\Ólq\Å¢ü\ÆFSq‘†µ@\ÌvÁÁo\ÍvýK?1‘‡Ÿ˜\È\Ã\È\é1\Úù!—]Kmv\ÊGó\ï\Ìda\å7kV6L ŸtÃ·³¦¢Uþc#[[Ž‹\Õ3”ý#›$>]\ÅFy?1‘‡„›yŒ\çF®œ\âi\Z”\æ20óóxp±ˆP¥D\ÅlR­\ÅÛŒŒº:M†¢He\ã°ê§šDÈ\ÄF9\Ø=„²’\0ù\ãz\Ì\Â_&\â£™?1‘‡Œ\Þ\Ë\ØW™R½q\È\Ð	Qû‚Œ`F~c#?1‘‡‘\Ö^6r<,‰•\í\Äq.ü\ÆF~c#]¦Ç—-RZ?	˜\Ñ9\ì\rƒ¨1|×¿~µøv\ÔsH*i±@Ë¸¸Ü«d\ÇÃ¶£ŸÚŽkµXŒ\×r® 5y\Õ?ÚŽ|;j9\Ó|Ù¶D|VžN§·=\í³‘ŸÚŽ|;j9¦<©¶>lM\ÏÊ‰Cð\í¨\äUg\ZA\Îe’q\ì\×\Õ!\ÛQZ|;j8\×Ä†¸±\Ë\Û{tJ\âC¿‡mG>µ\rZ‹„½±°ùü\ÖÁ\Ä%nˆ\rzw!‘\Ã’\æÃšsgm€\\ÀT[t¬\éð‚\ã\ÛwhL\Ã\ÕTðYŽPü;j9£¸¦LOü\ãY´<jjkð\í¨\çÃ¶£>®\\Á\ê0C’:÷Ã¶£ŸÚŽkj6·\è	ˆ\ÛYK§¶\Ò\âmÏ±\ì\âöaF==\ÊúŒc§\Í^\ê\rk€Í»\'c~ªR”òÞ˜\ÇN\ê\Ã}o+˜|\äô×¸…CV°¡‹o•Q\ÏEfe/¦-c*`a¬8ó5“9°J)5´>m$R–ôÅºu¬}ƒ\Çp\Î«\"\Ôo®%ÐªŒñµ2‰Ø \Í7\ìy5®³…l:	S´Ng%’\Í\×MšŸ^l+Uk9O_\í	Gt’f°K¦µ\ÂX—§™Qlô9ª<›>\Zd#\' ‹œuð\â€\Ø$ya\Õ2\ë§\Ñ“F\Ç\'÷,\íTÀŽŒ\Z’M™\Ã\Ö–ÞœV\í‚JLv\àc–\Í=0-˜h\\ˆÉ¥°ò´²M\é\à¢([¦öE@L]\ãÃ¡J9\Ù#ŽAM—Nš\í\ÐLÁ\îŸG\Z=H\äiUä‰ž\Ó\Õqú.t\\}\\OH‡¯røK4Û©’‡‹¡w\ä\Þ\Çõl\ÖT¯ˆZýV$z‰\âb•F\Ö.€¸\È÷¨(;\ÛY¸\ÐÄƒ™S¡d\êŠ0[Ž\Ë;\Ä\Å\êôf\Ñ5ß³®¹öñ¡«M\"\Í	9°¹‡Q²*\á¤.&\Å]FV‹t ™yh\'1ZŒs\'uÕ·8›š(¥»h\ë(œ\ÐypŽ»24y¼W‹\Ì\ä>,ñ\Ä mÜ½l\ÜNøO\É¥Yt\Ñ\Ý\Ý^ \è¾×¸Wl¸t\âÄ…$‡’ŠCiŽ*Q\Îv¼\éöm‹sÈ‰%_\Ùw®v©¦Dh)ôŽ\ì\Â\ÕYŸ‚h­d^RLm_l’$ÀF\Ñg¼E\Ø1n‹ ³Vbø\ì´\Ùs5	\Ô»}\ÑIŸn ®\ÓYy®iJø\Ó\è–lw¿Mt\åÖ¬Xƒj}G\í2Fq(µNš3~„± \ÊEúK^\Ük\Ð\'\ré†Œ{\ÕL5m&\êj•Z»v‡Kf«=%\â45‹ŽŽ£ö\ÒÉ¬L\æÐƒ£Ò\'¯«—\r\"š@‡U-ò:0Kw˜É¨H*OzK^\ÜÓ™P/˜©ß·ø-\ÛFŠŠñu1C\Èx\ã@ö´F”¶¥»¿#‹¦2\ÃH…,!so.“P€L–a@¶85ˆÚ¥`&7&Z\Ö7rxb\"\â\èß­f<þˆ²õ³Ó‘J/˜¦ôÁ\í®Ñ“\Ðüt\Æô–½¹\é-{s§µ™.Cl^ÀW\Ç\Ó$–½¿‘ô–½¹Ó¬TÁ.­ÿ\0·\è­<i³\íB£§a›ùb¦·dn¤öt†˜hýû\Ù®‘?^q6w©1­2a`Ê·´l\Ðow“\í”Ú²\Ý*t\è:F\Ó0t0/\Øv‰›™\Zä¶Ž$QÖ´ªHM¤¼Ë„\Ê,zøªÍþ+\à+­Š{¥(¤™\á\ÉøM£¦d·_A\ÈŒô ½ô\Åh¿d¶B\Æ\Ï#\ÚXh$6ÿ\0bK›\\@)£S¤¾®Ë†\ÜlM…H\Âø=!l¬\n\Æù³ßŒ½m\ÚÖ¾˜µ\ã\á\å\ëÇ~AB˜\Ó!¥\æ\r‡\ÚN8yY‘u	\Z\ç‚Zj¾/Àz–ñ\å\0\ç\ì$Pñ»(\r{=c:q\Ù×‰¬C$`I\Å)\áN\Ó?³?÷Ö–‡\ï`Ž¨\ä|\Òo\Ä9€\ã\èQtÂ’mZ\Å\'\ÖL\Âm‘Å¨<¤·ªQo5³8ÀÍ¦ŸaO¨V)v_x*ð8\Ý>óA®U²\ï¾\Î8ŠG¤_\î¤\ä[D\ïªz\Ûõ!¸þÁ×¡\Å\×(\æ\Ìf½•Šý}\âX&w\Þ\Õ&\Ùs\ç\")O›Gý*\Æk‘\Ï{\à›®\àtùLf\ÑhKm~\ëký©\Ô3[\Æ\Ñ €x sn¶\Õ\ì-‘1ÓFf\r1sN–w`¢0O«u\çÀ¯Ó©üL1˜\ÉÏ·ø£ƒF(´L$p¦i;’{@Ñ¥j\Û\Õ\\½|•s6P¾JI¨K!-MXS¼ÉžÀ.\Þ_)\á´y¶w>\ÓM¬AÄ»\×\Þ\ìŸQór\Ð\"\âGQ2FE¾Iso\çH;Okm¤ÛŸs#rV`û\ã	¹\ïŒ&\æ¦c{D“‰\Òñ\à‰c\ßM\Ï|a7:Q*×¸QÄ¥ñ{\ßMÎž\å\Û¯z1µ\Ç\ï&MdÀx\"I<›÷\Æq\"\è\Â\Õj®Ã”\n.N\Â8}\äw¾0›‘\Ì\Ê\Z?d\ÊmÐŒ~¼ýñ„\Ü\é\Þ[²‹>\Ïû+úu-Y´‚Ê¯Œ\'ðÑ±ª\\\æ+óp±¾{YOT\'\n)*°‡*\ÔÇ¾0›š	c£\ËÒ¸3\Ïju5º\É\È\Ï+$lš\ÑÉœ‘\Û{Ÿ¥\í„\\-PÄ \Î0K’ù!¯“‡\ÆP\ßJ\î,|VH½¹:¡3.W®‰q¶È­kS0\Ï\ßM\Ï|a75º\ëEµÁm®\Çz´VE“šjŽreÀÿ\0\Ì}<0ö™˜¦Šg\Zw3C1U\Ê[ÿ\0@\å½<0ÿ\0\Æ&DdPEH†\r3 ùºx¡\í\ÙaÞ¬¸~}m)m¼V\'Bªˆ\\\í\rEW-oþ<‰^ŸÈŽ™Q!Û²\ÄZ*Gib5È§üx\"\íE¦‰~÷\Æs\Ô\Ö\å\é\á‡\Õ\É\rµ~\ÈC³JSÂœ™š\Ìef@»:xaõ/Œ™P¼xšÒ§mc\Ó\Ó†\'\Ð<V%*¯O@ñ†\Zùia©qf@$“cL€qPº	‰ˆ•l”\Ök3$‘\é\à‡þ-&¹šf…Ÿ2\é\ê‡\ÃG\Å\Ý>G˜Âª‘ºZ²)z—\éúˆ©\Å‚Ö³= [oñ\àˆÿ\0\Æ+G±…ŽpÉ‹0“–Wÿ\Ú\0?\0ÿ\0q±l\r‚\Ä\Ñ\Å×»»œ°·´¶¨\ÒÉ”33`±Ä£4ŽiUPÎº‡pô]\Ïi¹¶ý‚u/\Þ\â‡Ê”B\Ò\ÏÕ?–UÁUô²Ò´÷ÄÀ}Ž\ï|cn\\6‹q§Ø“~ô#š	e¥¡ð\êJ—UE©	-@V»—}w#S‚=¿ilù¡fŒ\Év\ÅH[X\"‘€ši\ÉÈ±ò5%¨˜\'\Ö~\ÈQH¡jt\ç¢ù³ZŠr>)®û‚2‘\Â\ËH—\æ=#\n\Þû<j|F‘£7\âºS„’\ç\Ùzò¥\r4‹\0\ÜKòÃ…Š\ï³W6€ñôt–¥)š\Þv>>•¡ð\ÅfÚ—¶ü?—k«ÿ\0)\ß\ZFŸ\ÚÝƒ¡\ÜöŸYµ\ë 	E\ÒN¢¯3\Ì\Zv–€#u[©^¦Q\Ü…¥\é³\Û\íU¹\éý@hö“ªÈ7<#fhª+B”<G\Ø\Í;`l\èvK–[û\ÖRa±´\Ì\Í\',\Î\ß\"\Í,„(¢‡u\ío±\Ça´\ë9µX§¾\×ne9…¥­”·\×WR!Pú\êCU\ÌJÁ!(­\Ô\îÛ¹µ›«\Ë\Û\ë\é\î?-+É“­#8D\Î\Ç\"(!UVT\0\0÷\Ún\ÛÚº-Ö£¸o%Ámm\Í<²7$Ž8\Ã;\ä\0ð\âx[i¶Z¾\Ýk‹¹^oWYôÄ¼»•\ÝÙ£\êuKXÔ»©)$\'2¹¨n\Þ\ï\Ëkj\í©h^\Ò\éÀS}\Ðg$š9ˆU»E‘˜­\Â\0ŽÊº\Þ\ÎÝº\\¶[‹O¸hg†AFGCB<\àóVH#ûµö\Õ\Ùz‡Öš¬ªIm\æŠ\á4/s,¬V\Þ$«»\Ô\Ô\0ª\ÙT\Ùöw´“Z\ß{Bk–ýI\î™¥We*ú•\ÒÀC	\Íhþƒ0$¬Š—%½¬ûÛ¹5)nµ\Ï\î\Ëi«q3—š]CpÝ¤/)‘‰f”\Û\ÅtX’Yƒ7Ÿ=A½½“‡ –cÇ—Õ(\Ûý“\Ü÷\nI¾®ºD\áB)$hƒ˜\æ\Þ4\ç„\èv^\ê\Þ6Zæ¸º±„S\Î\ç8>lµòŒÖµ-·¥\ÇÃ„—sLüyú0\Û2pÿ\0¬\ã\á\å\Ägr÷\ÃJ´^5öÜž^\Ü[\'ŸDq¹m\Õ\Þ}j\éBŠ‹[kkj·¾µA\äüøÔ·^Â°¾º\Ý7ýZ¾™g–(I\Ò±Æ‘™FT\Ê\Ô-Až\Ò\î–\ÖT*\è\êXQ••¬\r ‚8o;\Þ\Ëj?V¾•¨\Ã{h±Fss\Éj\ËR$\È\èba”\ÂÁ\ËLG\í\Ùý>+Oh}\Ùb\Ö4Ä§R\èF¤”§äª´–S\Z™5»$t[\\\Ä\Ñ\ÜF\ÅYX\Ê\Êh\ÊÀñAˆ?b7\Çz7Æ…¡4ºtS\Æ$n\åV–[œŽ\n<¶ñˆ\ÄU¯I¥2\0$X\ÙL\É	ˆ¦` \ZV´­+Jñ§—\Z®þÞ»}ow^Ü™ç¸¾¾¾¸21\àªb{ŽˆŠ5#‰c¤jª€a¶¶\Þ\í6Þµ\Û\í2L\Ð%…°\åŒ0ŽYŒõ$@\î\ß3(f\0€N[\é\Ö6vhŽ(‘@\à9\0&n.\èm\Ý?)¡\ê‘|™^U5û˜q¨w\çB‘Ö¼-\ä’\ìð\çù´rý\Ï/…pš~ƒ­\ëšÎ¥!Vz]\Ë4®xA2\ÂY‰\ä\0\ã\ï^«Ù½Wi\ì \Üu-\Ówa¡FTP–KYfšõ\Ë)= `A!¥\\]iÝºµ¾\Ýú\âP\Ö\êmlCÀ›«…\"\æ\áX ‘H©Ê½\Ó\Ü[\Ïmi\Zf\ÉÒš\ÖD´IÌ†\æn¬’	&–W\êd…c®X\ã\â\à\ÐLvï·›\×s%Ž\ç\Ý2\ÍžŽ­Ó‘\á™^Zt\â.Î‘\Å\Ôe\êHÊ‹Rqª{Ml¸\æ»\Û\Z¬©õ¼d´gs•cKZ‘k*ª¡\ãH\\@Œ\Ò{ƒ´g/jŽöÑ‰\ÞZ±Hd\0ü¡ò¢~q\È‡ˆ6~\Û^Ì¶\Ë>\Ý\Ô#\ê\ë–0ž\ÞaA5Á…?£–79o#•¥\Â\Õ±ûªŠK@O›\Z{zùµË·T†\ÜA/^fs•(²ç‘˜ðPªI<\"\îßµþ·ƒ³-#/¥\Ò\è¨WÍª^	g\r$‚6\Éy`pW³ö\\öp\í¢MÛ©\æ’Ñ¯­\ÔY\Û\Æ\Ñ\Ä\ì$´¶é‡šš\æs’‚YU©žM\É\ÚýxYO\Ü\r\"å¼±Wü¼\Ë\Å”^K,P:+§\ï¯f\Ý-¾Ÿ§ú\Ê\Æ\Ú\Ò	\ïdF+–\â’)–*Q\á\ÅÁje\Çm»`;·¯Á­i[KNmW£;\ÛM.©}­\\‹W¹x’Xa\n\ß#! ˜ž­®ƒ½õ\Ö`a§yPy\Ùd<À­1¡ùö·^\Ó;Wj$žñ®\á–\ÌÜ´jV€\Ècž“HW¨ñ\nˆ\ÕÀtbjý\Û\Õv=þ¢\í»f¹¸·\ÑeH^ú$\à-\Ø\\g@\Ò1PeR’Ò´px\âóEöV\ìž\Ý\íþœà¯¯ˆ†§®:•\Êsj7Šùj+\èˆ\Û)$«\Ô\×\ë\ÝÁ\ÞZ–³«¹©–\î\âI\Øy;Š<¨ð\Ü\Ú\ZÍ¸MKq]\Ü\êoÂŒRW[\×Æ†\Þ\Ý|\ÏQ\Ï:…ó‹=­§[Z¦V?“¹û\ÔÎ¤qWü¤ jc\ÄcP\ì_x½^ï¸–:{A:\\\0Ë¬i\Ùzf|­ò®#R\è$\å¸_”\Ù%ú®\ÞiûU«\Èòi—Dñ\ÌöS?„\ÐW\Ñ\ÍC$Y\\T†8—J\Üy\ï{7®0‡T³a\ÔTV\ÜQ·£ÔX‰”\ÑfC\Ç+-‡~;.\É\ØÍ–\â-\Îx\ìeœX³ÿ\0O-I€ž(CD\Ôdû	\Ý\çk\ÖV÷{»BpX,\\\Û¡p\Ó]FZJ\Â%…%2)‘TŽ¡¬û¿S²\Ó\àº\Ó\í¦qw4h¦ò#©™#\Ê+%ôAÁÿ\0\Í\ïlM^÷j\Û\ÌL:6\Ý\Û\×\éð²’A-õ\Êú\äIÿ\0¼\Ü)z±$Qú8¾\Üž]óyºvö5Ï¬\ëW\Åf‚f[F\"+U2u%si2ª‡ùL\Çp»¯Û¯gi/û•±zW¾\×oJ\Èàµ«<vPF-»Æ§$.\Ò…jÁ€¤;«A\Éiº­BÇ©\é\Å\ÃIi9Œ¼Œ–\ÓP´\å\0£QÑ† \ïau\r>\×dˆ\Â\êÞ¯¥\Ø\ÍÕ ¼š\âx\'’Kv\\‘’¹:¶el\Ê\é}ß\Æ#j\ÔEt\Ö\ã\Ò\àx@\"‡A\ÃÂ˜Ñ·Å—sõÃºtù„°O-\äó²0¨\å3º²J²2”e%XH\Âv\ã}\ë\Ö\íV’7¸Ž\Î\Õm\Ú\í¢!£õ‡\Ì\å‘\\	:qô£g\nÌ‘2ûš\Ú\Ó\"/©j\ÛD£‰i\'‘b@>an\ÛMoh\Â<N\Î\ÙT’O”FI\'Ä’q\Ü-ýu.y5m^\æ\áO’7•º+ð,Ay†6öü\Ùz¬–[ŸK¹Y\à•\Ë\ÍXrh\ÝIIú.Œ\ÊxOCÜ–‰®Ñ¬:…²g\Ó5Z\ÅunM[¤\ì:¶\îE3\Âþ’=5þ\Úo[R/-_4€DWv\ÌOF\â\"y«¨\â*r8d\'…LžÆ½\ÝÒŸ[\í^\ì\êÁg!³¸ti2¶òe/Qù¼\Ê&ZõÝ\Ì\í¦ö]kAÓŒ\×\Ø\ËŠ\ê%9ª’‰n\ã \É*¥‡ˆû\ÛMlj\ÒÃ¦k³\Éi\ãÅ°‚Y²ºž\ãYþR\àhH=\Íö]\Ù\Ú]¦™¶a	k}z\Éyu°¤²\Ã%b·†E“§%I]kI1_s\ÚÛ¿7‘~mf\Öñž\\,ì¦¹ó½\Ì?uF..\çj\Ï+³±ò³\Äý\Òq¿;À“\Ü6\ÛÚ»?R\Ô/mc›¢—\à\í\íl\äb)y<-(\å]*’)‹mã¶ºW\ZE\ì&\Þþ\Âl¯%¬Ì”ž\Ò\å9Br=2MY ›¸ý¾±–~\Ë\êw\0Ž™;š‹i„Iõiù£F_y\ÛHg·\êiš+Ë«MQP’æ†¿\r\ÓÛ=iŽ\îjðµ/ï¬†¥”‡¿u·,¾$¤n\ïA\Ï/€\ã\î\é=\Â\Úò4ºq\"BÌµ#½³fH˜r/Ë‚JV9@?$²¶ƒ¾{w¨@û™mZ\çG½ ’Sò\Úu\Õ=$\êb–6þŠe8q=²Ò´\ÃÜ­7sCjÖ·\n@Vi:	(\æ#\è<¥¤ÊŸ•R@ô\îWf­Æ±Œ—š4\æ@Qbn ´¸¹\Ê	2C\ZJ³G\ÅDª\ËR¢´û\Úr\ç¦£#p®Pºm\Ø\Í\æ¡`+\å#ú»†¸\Ñó¯ô0\Åÿ\0ƒ\ÜP²‹}cyß—ò4‰yz)\Ícj?\Ô\ã\Ë\ZF•g%Æ©u2CH<’\ÈÁ#q,\ìB¨\É\éÕµm\Òÿ\0u\î¥‹k)ši´\í.\ÆI/nŒÄ¤k,¦a\É»Lª±–ô´\Þ;jG¸\Û\×bÔ´ò\ÄEyl\âxªZ	iTj©ª;©‡[\Ò\r¾³Û­~Í¢šT\Zff·¸Œ\Ô\Å<-Á”Ñ‘Àt4\Ê\ÅõM\ZnûEªL\Æ\Âê…Œ}#gry,¨\ä\Øð•a\é\Ý\ï\'wn \àM¶“l\Äy?\ïw`»i\\v›µ6\Òþ^öömF`þn\Ý:1_\Ï30¯Š}\ïwû©¼od“³š\ä\ê·JIaaph‰ñ¢EºE¦x€~/\Zƒ¼½®»Y¶e\Ô{\Ùe´î£°’\ÊE\é\Î. 0G\"«z\Äö¶sJð²]|®—\Ú/\Ù{q\ÊZ\Ëqh²\\Û£QZ\Üe“RH$<?\æªycpmmV&RÓ¯f¶•H¡T|+öC•¡‰©3y„ ü,1\ß+Ùd}Ó©}åº‘G\àA\n•\Ø*Ì’h\0øN=’{o%\r–\Ò/‰6VQZ#˜¬“H\Ã\Ï_Ž\Öî½ 6«®\Økö3Af£3]J—”·AC\é\Ê\ÔD44b\r8c~m\Ýcx\Åy\ÜKk`}\Þ9g—\Öå††\ÒI\Ò&³C>IÙ¦+WR\ZEé›‹ž˜N£³e†bM˜VƒYš{\Þ\Ö\êr*\êv«\Ã\ä­\å°c•n¡\0š:\Ä\ç\ä25Éµ\×;g¸¬ƒ#¡aT’6\ç\Ä/Ë“\Å\"•`a‰ô\rQ\ëe^³É¦_…ô\'„\è\ä#‚\\D\Ç\ãÁÖªk\îö¾\Úh2jz\ÄRj³ð¡-|ùá¯œZ­ºý\Ìn\Ý>\Úä¾™·\ímô\è\ÇòC¢u§+ð\É1R|Jy\0÷¾Ïž\Ë\Ô\×n\Îý\×4¬ ž\á“Õ­#¿™\å\Ót–fc\"I%·§p–}8Àí‡µOh´y›·š¦´¶úÝ²33~L3\Ïh	6Ó¬!P´Že§u¦\ê\Õ-mòhÛ–µHHRòŽ\È\'˜\Ë8òý‚\ÜWÁŠ\×jÝ³&{‹DòV§\îWØ½geÜš“Tq­o&\Çe¶sAÔ·¼\Üv=U¥A‚)\Öi\ë\æ\è\Æ\å¼\Õ\Ä{r\Ý\ëm \è–\Ö\äW€šRó\È\0ðô^0|j>]ûSn[h\Ïqõ~½†Ìµ‘UŠLNû_xœ\ÑX£­#£Ü¿\0\Ç »\Ô5©\'¿žF’I‹¼’;wvbY™˜–f$’I$\×Ýdok™n»)ª\\ºqw\Ógr\×m×ŸLðõ¨WúDDU£\Ü\íM\ÅÐ¿\Úú²\Ïe{Ghdd\Íå¬¢¢¢ ð9dBQ¸j½\Þ\ÖÙ•I’\Ò\í^\ÛBO<8I9¢z©¨\ÊÍ³6>œ¤\Þ\êú¥­šSÀ\ÜL‘W\à\\\Õ>a‰¥ \ÛûF4¯H,­è¢ƒ	\Þ\ÒþV{½WR¹ºb\Üÿ\0/+\Èú¡‚\à\0óa\ìk£—Fžó­zü\0Ž\Â\ÕZ\æöBM\0m”$\Ó1\\o®\ã\Ø9‚\Ö\çR&\È!)Ñ´¶\Ë\rŠ\ÇJ\é\Û\Å\Ó+E1s´w\å¤\ï\Ü=¹I-\ÛF\ÝBÚ¹!¸2e\É\ëJW%\ÂV¬ÀL£\Ó`šÝ†\âú¯}h‘\\Gd\âP¬ ¸þZ\'QWN*Yª\Æ\â\Ù{š\Ì\Û\î\r.ò[kˆ\Ïòe‰Š0\Ä*§\ÅH>?`{Ñª‡;}¤Aø^\î&\ît\Î75\ë>f›P¹r|¥\æv¯Ý®4ý~hsZm\íöôŸ’E[(\ë\çÿ\0½1ñN;\áºwV«\ê]©\Ñõk\Ë\ÝkQ\å®“§\É\ê\áQ…A¸ºXVdP\Ì\Ò9‘Q\Ö7¸\×\à±[\r™av\Z6ž‚‘Xiv£%­º¨$g(:“µNy\È9*û\Ë\ÊwoUf\íMôùl\î\äb~©žCòXšŸQ™Ï¦9[\Èz¢‘´”¸Úšÿ\0I5UŒÍ¦j1…g¶™–¨\ê\â¹\à“€‘*\èj*i[M7¸û>\î\r;f-\Í\ã\Ý\\\Ù\Í(C“CpW¤ýW”O\\˜\Ðjw\à»\éjz\ÊÇ¦CJf&\é©._8d$Ž Tø{Ibh\0\âN-“ev__¹·—\äO-«\ÚZ‘\åõ»¾…·ý®\"»Þšöƒ·bb+\Ì÷—\n)RJ[)·\áÊ‚\è\Ôùo)5\ÝùªkZþµ£Í¦I<iŠÁmp\Èn=YU§–9eT\é4¦v\"&pK‰5\rGclý-\ÔÏ«\Ëò´$¤šœ²¸<‰‘Zòã‹®\×vww\Ù\êz¦Ÿ`n$Ky}N#tˆYX–\Ô\ÎF’EJŠ‰/;Ÿ\ÜM/HaL±M2úÄ¨¼+\r²\æžbO¢¢8Ø–\à8\îs´\ÛFƒM\Öui§…ƒx$E\Çò]\ãEwZœ¬\ÄTÒ§\ìµ&¶\ÎCmÛ¥|½vBk\áN\áñbw¯7c÷\ÉÇ´pô›A&·<\é–A˜ yR	®KŸ’\ÛU¹~>É›/Y·¾\×\ä¿\ZŽð\Ô\íÜ²\ßj¡˜Å¥«sk]2ª]X×•r±È²\ï¢–c\àN#]¹\Û\Írüº\Ôz½…\Ô\ÕQÓ‰¸yùaû#\Þ\Î\Ô\îH6…¡“L\Õo­&·ñ¥¨LÓª4ˆA­©\\Ì€4M\èd\ÊM8\â\r…¹õ[>{kÔºµº†Œ\ÐÊ £\Ö6!$Y\"fBŠ\Ô2Gqº­µ\Ér¤\ß^´)\ÊG`,ý4¯/Ãˆb‚÷`\í\ÍF\ÝHf\×ü\0\'7DKx\îE8¾f<qqo³t\ísq]¡¢ô-…¥»úÛ¶Ž@¾qy\Çþ\\{3ö[B±\Ô\Ì3\ÜjW\\­´	@\ÓL\é\ê\ÑF¡™UW§3»¨ŒM1\Ú]‹¯\ï­B\Î\ÂM5î¥¦S·\Õ59š\é È±Z!Ž(Q„EÔ´¥	5{¬\ê—7wŒI2M+\Ê\ä“RK;3OI\ây\â\ïºÛª5·×·R}a+\È˜4\ÈÍ¢–4¢º.\ÍH™+òq¾{ˆ\×\Ú\\m9	4Ž\ÂÜ”ƒ( \êúWó0­\0û¡n=.½Ö·¾\ÕÕ§\ê3u™\â[ e‰mRI\"`\\\Êdgbr\åº\ÛÝŸ\Ñ{7uÃ¨\\\\DR\Â	iVd.·›s™QQ\åôEK\r\ß\Ú^\Ç\îÔŸ¸w‹uq£¤gP¸Š8„¦ú‚8\âH×£²°F¬ÚŽñ\ïN¥pZY ¹¼všF,å¤‘\íË–bY¤\"¬ÄšxSº»\ë{?¢*-,\"ƒ\Zi\î8y=\Z\áTÜ»¦ø‚*\Z\ê\Þ54\æ?%j\Ç\ÌÂž\Íu\ÛXô³g¼\Ô/—…\Z\áS(ñô~€úŽ\Ó\íÅ£Fó^\Éa+\âku$Âœ<žÇ«\é[÷eZˆ\ÑK#–€“Pž©‹Ä’HÆ§–[²ûP‘@ ³\Ón5ƒL°\'HSÂ¸\Òt›}µ¹M¸»Ž).\æ†\Þ8 ‰\Û+\\:-Ä’2G\\Ìª¹²ÖœE\r†¯¥]\Çq¥\ÝB“C*\É$R(x\äF\nº0e#˜ \ãu÷ZÔ ‹V[y\"Ó¡r3\Ý_:„1\ÇP\ÏFô\ä\ËP‘+HôU\'¾ÿ\0\îÆ¹¨Á!$\Â÷R%¸©&‚\Þ2… (‚\Ìj\ÇÜ¼¹Ýº\\\Ó\í}\ÅiŸ4¨y­œÎÁ	\\ñ‡ªÊªse!”3 S¡v7c¬÷š\Î\Ý\Öf—P»hŒP\Å2DaõX\Ñ\æl\Ìýg‘!Dm6rc\Ø}µŽ7úžkž½û­%aoI.Z¿\É. C?ó² ñ\Ä}²\ÚÓ­¦¿¹\Ði\Öñ\Ç\è˜t\èUVè¨§¢¶Â„2‚¼¾ÁýKÛ\äWjµÀ™¬.cK›RÅ“\"\È@e,!5\Íò¨q\å\Ûr-¦\ëµUMGMwkYHùK\È\Ém!©†j\nñF\n\êF5}±£\î½:\ëq\éôõ«X®\"’\âÞ´§Zs$|Àô”P_XXhú§l\ïe?Vj1X\Ésž0?¢žI\åh\Ò\ìP—¤Ž1\ÔV’\îü¶hÆ´´´²‚ž`\ËnXõ°\çX\ï¾\ê˜1$¬®Qxó¢\Ç\"¨`\0Mot\êW’q\ã=\ÌÒž<ø\È\í\Ï\ÇËŠ±$û½½í¶œ„\Ük:µ½±§òcyZO‚8ƒ¹>IÅµ§mµ\Ó7EÜ¶ºF™$J…­\âŽ:\È\è¦;XYcp¤¤Œ„PÐ„\×;‹½uMsWDÈ²\Þ\Ü\Ër\è•\'\"Y²%I9R‹RM+\ï6«|™u«?\ë\\\Ä?‡ë‘I\Üúàºcpw\ßpÙˆõ½\Ì\æ+6qC™j\ìŠŽ\æ\á]\É\ä\ÑÁ¯P°»\êm\r\r\ÛM\ÓÀ5C»‘4\ÃÂ³Ïƒ•\Z\Å\äû	£÷·:\ÃZk¶­FSS\r\Ä$Ž¥½\ÄuHdŒ§ˆ4e*\ê¬,=¯½õ1·=¬¶\ê)Õ´¤eS|BþR)‚\Ü,\à‚W;”üŒùePWqös»û^>\ã\Û\Â\Ðj\Ú-\È(\âHý»°/ùE\é\È	\áù{YWªQ\Þ]V\Æ9uN\Ò^LÞ©~ªI†¤•¶½„s*ðWùU ú>ût÷Rþ\×6—µ´Ì±=vÿ\04HA\åT¶K’|At>#W¶W9´­µ¥‰$P\Ü=rù³¸u\åš8#‡)<@‘¼y\Ûü»‡N~òn\Î\Ö\èJ\Â\çV\Þ\×ñ\È\àW£n·s=\Ì\í\æ†’N<ÊÌŒ6\Õ\Ø\å,µ[«(´M\"$ 4QˆDo*Šƒùef\ÏCY\n\æ\âØ©\çöG\î/nµ‡µ\Ö\íXJ“\r\Ì$Ž¥µ\Äu¤\ÈO4t*\ê¬,ý¬}’\ï\Î\Ûö®Û¡%\Ôô\ØdMq,kZ‚($w\0‹{†^\Üu·¹AA¬v#¿:\r­—v’µ¿\Ón\ã	¤d•\àŽJH&[nB\ã<UA\è_w·vój=˜¸–µ\0¼úc1\á\Í*Z\nðŠ~T¢\ÉF\â}\å†÷\ÜA-®5±s®\ÝH\ä.Ka[l\Ìhú¤	0¯#3yq¸\îv¦›&¡»w^»1µˆµGr!\Î@H\â·E\Î\Î@DBM)ˆ7\Æ\î´\Óõ\rª\n,÷\Z|\ÒL¶®üN²\ÅKz\"@…3p$T{\ÎÓ¯—riŸÿ\0v{K{F\î<¬÷»§U\Ót¦u úº_J×·)^9eG?ˆ†aÉ¸\ß\í}\Z÷©³v’½„9X’\ë07³\n\Ò*ÁÆ´\è87\Ø}¸Ýº\Ö\Z\×[µj2\Z˜na$u-\î#¨C e<T\ÑÐ«ª°Ú‹\Ù~_¨ý§tº¦—‚\çž ^6R§\Ö*¥­.\Å\áGFl³FogŸi,û¬#{6õ¸\Ö;}\\-c’	bŠÿ\0Y `bD\Ö1©÷s²št\×}±wi.ì’²M¦TÔºŽ-%y0«B8?¢{‰a°ö6­¬Ý³S-¤÷$|LHÁh8’\Ä\08“Lm}{\Øi;V\ÏP™rKR´K©c©*\Û\ÙA,÷R\Î\"\Â3PM‘C2\Þl­ÿ\0«\êºf\É\Ôl¡\Ñ M*(d¾’V··ƒokXZYh±­J\ÖLŠv¶\ä\í×³v£¬r4:Æ¥ª\Ë{©\Çk2ô\å’\Ú\Ê5Ž\Â9©B\ÙAfC$H\ê†\â\Ñ4}Ew¥\æ¹i\Ðú¥ò\Ó4r®®^¢*f¢“;0Q\Ze&DU¾\Ú\Û\×f\êü«K›mb\ÐWR\åm\î@]\Ã\Ë»[\íKµ®KS-¾´—Z\â ú&Kˆ¤µf­D\áxÖ \n\âMVÇ·¬\èÀð¸\Ònm5X˜¤¾¡<\îTøƒ\ÉÏ†6ö©cµ\å\Òö\î\ÛÕ¬\î¯\îµ\æµDÎ³z¼H\Ñõ&¹‘c!cEÊ•V™\ãVRw\Æø²Šš\ÓE\êv*ªrú\Ý\ÖdŽU!V1žV\'(!1¸¼»¥º•\Ù\ÝØ–gv%™˜ž%˜’I<I5?b4Ž\âö\ëVkmbÙ¨ñš˜na$u-\î#	\"\n\ÍM\nº«\r©\íggôU\î»m“\Ë,1\ÜKmyi#\Ä\å©H\çIPÿ\0\Þy#cAM±\ÚÁ¤\êgS×­¥0M\êK¦¹PÙ­¦»Ð¤®Š\äG%¨£0,¡µn\ëû6{/m\r{Zi\æŸS\Z¥½Î§%¬M\é	t\í>YýYV2\\ºÆ€¢€U\ZœŠ½Ï¹Ñ¶ú\Ç\ÓK=\"4›x££E±Š\n9P¹>Rq¹{¿ºn\î/¡\Ú\Úa\Íp\ï3\ÝC<1‘$…‰)n·Lx\ÔSã£Ú:ó6¶ôþµÂ©ô}rð†\Ê\Ãý8 D ø,\Ç\Ê}ÅŽ4-#\Z\0I\'\0q\'	>\Ð\ì\æª4\æ\0‹‹\Ô]>§ùI%ó@%?‘\Zr×\à\îÅ–Ÿn@-m¥\Â÷RšóCsr Ž6_¶ó­x\nK\ËKµ¹;ƒO~ \Ôõ-FU(\ÔùM\ZIm`\0¥m\Çd\ãTØ›º\Z©º\í£Koiq„©%K#§\ä\æ*G\åO#F\n—\nkÜ/t\ÝÛCUHm\ì!r½I.úÑº4(}\"bUi”z“O±Z†‘\Ú\Ýðöº\Ó{Y¢Š\æ\ÜJE±\Å2¸ŽJR¬™s\Ðg\rA„°\ïešn\í±$¥ŒÁb¶\ÔmóŸH\Âñ¢A*\0xE$hiè‰”c\×{g¼­\îo\Äuš\ÂjC}G-«œ\åGd©	ð\ãV\ïG³¾‚]\ã.¡£À¼.	5k›\Ç)¼e·QùN-\ÍPSû\ã·\æ³ßš\Õ\Üú•Ý³\ë¨Q¥»¨©Y:+ôÏ¤’N\ÊÀ6`7\çuwŽ—aµôýoR–\í©t$¹ò9ñk1s\"\É41\Üb¡iÀŒ¢\Îóº{\ëX\ÜzŠ8g†\ß&›dâ‚±²\'^ðŠ\ÔgK\ÈI\ÉSˆ\å6»3k^\ÆK,“¼2\êL@þL“4úŒ´§\Ô5 š\ÏiÛ¹¬n{õ$,-\r<z·\0\ÎEyR×”\nwi²!\Òv®’\à…õh}j\íGž\â\ë:fó\Ço<0úq;ƒ«\ë7Mÿ\0î®¥•G™cf\é ó\"¨\Äúm\ä¶÷\Ñ6d’\'h\Ý\äUÔ†S\çGyºwþ¥v€…{«‰nA¥B´®\äAPƒ\ìe–¹·uk›f\Ù\Ã\Å<<R\ÆÃ“$ˆU”ü¿µ½\Ý\×-¯õ\í*\Â›+¦Q\å\Ì]FŽ\ág\ÊBL\Ñf…„ŠŠôcŸ53\rGYÔ§X´ûXYˆUTK±%ˆ\0\0@òœjzgf;Q…\Ò+\íRv|\à¢\Îß§”7P\×MÀúB¼1u¿Ý«û-*PAµ\ÓH\Ó\à\Êy©õ|’¸ðü¬®|ø’\æò\á\å¹sVwb\Ì\Äñ$³I>R~\Éi{\Ïa\î/tY¹hn |Žµa\â®Œ\n2’‹\Î\ß\î\Î\â…\ÛwQô\îV\Ö\Ö\Þ\ÒK˜ˆ*\ÑM41¬€‘,jÊ’FEe$ý­­…œ³Ü°4HÑ¤sN&Š€± \âxpý\Ô\Ôÿ\0D¸ú<~\êj¢\\}\rKOž\Úr¹‚\Ë\Æ\ÅjEB¸REA¥*ð\ÄwV[zþkWù/¼ÎÆœP©\â\ày‚1û©©þ‰qôxý\Ô\Ôÿ\0D¸ú<Iou\Åp†ŒŽ¥YH\æXñ„–±¨¼L¶³A\â\":GG1û©©þ‰qôxý\Ô\Ôÿ\0D¸ú<mB\Êk{\É*4mC\È\åp\r§vQ¥\éw7E)›£’\å­i›\"µ+CJÒ´4\å\ÝMOôK£\Çî¦§ú%\Ç\Ñ\âKk¨+„4du*\Ê|Œ¬\Ì@8iô\Íò\æ\0\ÙKE²(`*Y€ iZÐ.?u5?\Ñ.>u·ï µZUä·™T\ÐU™Š’\0©\âHTK;\0¤“\È\08’|\0\âqû©©þ‹qôxý\Ô\Ôÿ\0D¸ú<I<ûgQHK35´êª T–c\0Ä’h„µ°´–{¦­4gsASEPX\ÐM\ÇºšŸ\è—G\ÝMOôK£Áf\ÚÚ˜QÌ›YþÁM$\îÁUTfbhTI\'€\0Tœ~\êj¢\\}¾¥a=µÁ\\Áe\ãb¦ ®Ò ŠÒ•\É\î\0I\Çî®§ú-\Ç\Ñ\â!ªiW6¥ë—­‘f¥+—:­iQZV•ç„Ž4-#\0¤“À\0I\à\0\âN?u5?\Ñ.>ºšŸ\è—G„—SÑ®\í¢c@\Ò\Ã$@žt\ÕA4\ãAÆž\â¼{_Rd\" ‹Y\È ò ˆ\èA\Çî¦§ú%\Ç\Ñ\ã÷SSý\ã\èðÖ·örÁr U$F\ÅxŠ«€Â£ˆ\á\Äa-lm%ž\é«D\Ü\ÐT\ÑT4\0“AÀ\n\ã÷SSý\ã\èñû©©þ‰qôx7:Ž…{ol\å‚XÖ§\Ìè¢§ÀW¾²\ïv\Æ\ìv»¼ô\í>\Þ\ê\ÎX¬`º1‰. \ËF¹‚\Ò\é#tR¦\ÉVS\áPqþ_\Ï\çj°ñþ_\Ï\çj°ñµ7^ø\ìÎ§±õ;=½¤vW\Æs4\Ñ»¹…\Êõ\ílÛ¦\Ï3Ä¹ce¬M\é“P;c\Ûý·\ì]º7‡¥\Ø40\êv\Í{Ð»^¼\Ìd‹§¤Î”\ÅY¤ñð\åñ¼þv¡û\åñ¼þv¡û\Óß›‹h\\mýkT\Õdšm:\ã?Z\ÍÊª˜e\êE\çP£6h£<~HÚšU§°Fð»´¶\ÓmbIÑ¯òL‘Á\Z,\ÉM†ITZ3¬(Ç™ÿ\0/\çóµ\Øxÿ\0/\çóµ\Øx‹{\ï>\Ó\ê;3YM\Ò\×\ê\ë\Ó1Ÿ§\Î\ë?å­­$¦Vù,¾£7\Z{›÷Z\Û^\Ë[Ÿx\íý\Ô,ž+‹XobE‰¼L\Ñ\ËŸw\ê\íp\êJ‘‘£\"¦¤òø\Þ;Pý‡òø\Þ;Pý‡Ž\éo\íÅ³\îvþ·ªj¯4\Úu\Æ~½›\åE\è\ËÔŠÎ¡Al\ÑFxü1?o,ýŒ÷vã²½Õ¦\Ôã¼ŽB\Ù.­\íQUTiw*\ë–\0\ë*É•\Õ\ÅOù|o?¨~\Ã\Æ÷\ì\Â{\r\ï- \ëB\ÑMÙ‹Q¹\ék\Ûk\Î\"\åÍ¸úEË›7\ZP\ì~\ßG–\ïT\Òõ»;…´P\Ë,\Ò\Û]G ·\0+:\É#§H\0ŒÁ\'†ÿ\0þ{\ï1þ¶¡û\åñ¼þv¡û\Ç\Û:°–\í\ÓtýGA¿µ–\îV¿\éZ\Çqk,R\\Ë›Fzp#™_4ˆ¹T\Õ\ÔqS¸[K¶\×Û»\\µ´¾4\Ë>§¬L\'´’\'t\è\Û\Ý=!RejB\Ã*š•ÿ\0/\çóµ\Øxÿ\0/\çóµ\Øxš¿ÿ\0Ÿ{\ÍFFô³j\Äÿ\0ðAÀs<GÃŽ\ßwX\èþºtv\ßQõ^§K­\êó	z=\\’tóS.~›e\ç”òÅ†³¡û\î\Ë\Í\"\ê%’\à–úXf\ÅVH¤Ed‘qVBTŽD\ãM\ß:†À“m\Ý\éz4zS\Ù\Ép\×2·»¼žF‘šc‡¹h\Ú#P\Ç\Ä\æ$iÚŠÇœ\Û\ÜG.Z\Ó7M\Õ\é^4­)ZpÅ¾¿´ý†7.©¡\ÊX%Í¥\Í\Ý\ÌQŠ¸I¡\Ñ^6(À«\0Ä«\r\Æ\Â\Ûû‹´[?X\Úrj5½\Í\Ë\Í;Iz,\ê’E%¥£Û´B\ÕNVVf\êq Q]©»#¶¾—©\Ú\Þ\ËY\ãœ&p	\\\å2\æ\0•­hiLYk\Ûk\ØGt\ê\ZÊ–†\æ\Ú{\É\à•C-\Ñh­€\Ê\ÊJ±”Ž`\ãü¾7Ÿ\Î\Ô?a\ãD\ì\æð\ì¡²õ›\rb\rM…\íÌ­;\"\Û]A\Z›Y¬mVAr]e$‚Šb@>C*\Þ/`\r\ã4Q\ÛD¢EmC,€F :ÿ\0ðC\è¸ô‡ÀŽ\'ž?\Ë\ãyü\íCö?\Ë\ãyü\íCö.{ß¾;¯l½2ö\Ö\Ò\Æ8ï º™m¢~s=¥¢;È¡œF©˜*“\Äq´{‡´»o}»u\ÛKk\è\ÓL´\ê‰\ÄösD\î{—¤(\ÆV¤,2©©Q\éòø\Þ;Pý‡òø\Þ;Pý‡{·Û»\Ùq\í\r\æú\ÊGÔ¯M\á‚6†u•\"=]2\Ö<\Ó2„Z\Ì<h¬h=ö\ï\Û]˜öc¾\ßz\ã\\73]Áû¬\rko·ck±×§r\0J½ˆ ­\Û\î²Íž‰¸DI/«_Om?JJä“§-º6G¡\ÊÔ¡¡¡\áö¡~Ÿwô8\Û\Ûÿ\0p\í=\Z\ëN\Ñ\ÓOXm\æ’dtK‹‹Ž£4ª¤1k‚¹@¥\Z’N6\ÏhûC\ìµ&ð°Ú¶io-Í§\Ö:¬\Ò\Í$Mp–öò¬%ý5@Z\Ób¼ˆ:or=’\á\Ð5¨Œ°Ç¨K¨Z¼±†(df¶B\è,µ¸°ôû¿¡\Æýî¶§¥Cc¯_½\Ó\Û\Ä\í$qU\\Š\î0GO€1 \íøû!¡\Ë…”\á\ÍõÒ—D±g#¤h[-iSJÒ§ž4ýÓ³=†\ï5]µvÁuhš¬öóv\Ìr\Çh\È\ádFF*MYyƒSn\î?g-*\Ã_²¡¸¶¸»½Šx%CGŠX\Þtu<X1ˆ»¡¯\í‹]\"ñ4»{!¼²L™ yœ9yB¶f35@P\0™©>\çm6Wo}Œu=É³4û\'Š\ÓRŠM£»\Ö&c\"˜m¤ˆ\åvh\ÉGeª\\†§ k\ÞÎºM–¹e;Áqo=\å\ìsA4LRH¥\àVIWV\0©ö¡~Ÿwô8ß½\×\Õ4¨l/õ\Û\æ¹{x¤ŽÊ«‘]Àf\0(\â@©¯\08ck\Ø\éþÁºµÖ“k¥\Û$W\r[,\Ð\Çn\'Z0\Ë\" £0\Ê\Üó$7aô!Nu¿»\áOý\Î4\ÝkFö	\Ô\îô{\È#ž	¡‹Vx¦†U±:Ù•x\äFWGZ†R¨8\Óû†\Úb}qa¸Q6\ïW­\r\à¹09\á\"®u\é±\à\àWùXÓ·F\Îö½\Õ6\Õ\â³Aujš¬ðLª\í4r\ÇhQÀud%I”Ž`\ãT\ÛÛƒ\Ù\ÏJ±×¬§x.-ç¼½Šh&Š\É±¼\n\é\"0*\ÊÀ ‚1¼öE\ÏetK{}gI»±iVö\éš%»·’Ý¤U1\0Ì‚BÁI\0‘BF4\ïh{~\ßT\Ô,-®¡ó\ÈñF\ëuÀÄ¼a˜˜p ‘C\å\Z~£û<\éz½\Ü\éCyxò\Í4¬8£E€³\È\îB¢¨%˜€N5=Éº½…/ô\í½e’\â\æ\æ=V Œ\Ë#\ÚD€Yˆ¸‘b´J‘__»\áQ\æˆ¼Aò\ÏLÀv,\Ö$ÿ\0;]µv±«­\í]?C³¶´¿Ž\rT¥\í¼1,q\\!Ž\ÕÐ‰UCŒ\ÈkU9iñ¯kzSXkW\Ú\Å\í\ÅÅ³\ro<\×2\É,823FC€\Õ_H_we\ìn\Ø{ j;¯d\ÙIy\êúœ0\êM\æ[\É\ç•CAo,D\Ã,\È\Ôô(@l\Õ\înõ\îÌ“n\ï-CP\Ïu¦È²«\ÙÈ±E‰\Äê’†ÈŠ\Ç:¯Ê¨P´\çmvOn½Œµ=É²ôû9#µ\Ô\ã‡Sh\î\Ð\Ü\Î\í\"´6¯#<~ƒ°ª5¨\Z\ì{g\ØróP“K¾’\Êð[¦«)µ¼„)–\Öp¶‡¥qe/\Ñ\Ô0¨¾\Þ=\Û\ílû;x.\Î\ÓfK„‘bX\Å11\Ç%&YN@´	58s:§o}‹g×¶ô¶õ»!ª\\@\ÒÀˆ:‘\Û:‡PT²gf\\Â¤ó7»W{û1\Øhûš\Ø!–\Òò\æú\Þ\â1\",‘—ŠKuu«¡#\ÒFVa6\ÖÀöZ³\Ö÷Dò‹k‹û™\Ìq€d“§»¶DfjPTTñÚ»c¼þ\Ìû#n\Û\ëñ\Ü\Ã{<W\è³\\%¥\ÔKl\r\ÔG™£šIh	zGÀeÍ»\Þ\ro[êºŽŸ\ÔB\Úy(\Ü][\ÉnÄ¼a˜f_D‚E:‡\Ô\åö\ÕWNXL¦C®D9·©\Ð OHžAxâ£±:?þ}\ß\Ð\ãX\íµ\Ú\Í+J\Ó\ï.­¦kˆ.®%‘}Ze˜(GDS”I4 ­÷º\æ\Ä\íö\Ó\ÛÚŽ›©jž¸\ÇPŠñ\åYžmò!¶¼¶\\…aB#6b}*\Z\Ý\r÷ì¿¨\Ø\ëCO‚\ÌEal\ë\0Š‘•©=\ÝÄ™\Ø\ÊÙ‰’œ€QN:¶\Í\Þ\Ú\rÎ™ºl%Å¬\ë’X™‘dP\ëSL\È\êÂ„‚¬\ç\îwU}™;\'k¼!½}8\ê&h.f¼¡L–L\ÂI\ê¨OH\ËFÍµ·Op}•¯4û\í\"\ÆKX—N¶•#xä—¬ZAq{r\Å\ÃpYVœÁ<q«\îw°»†\×C°µ–\â\âi!PÁ4²\Ê\ç¨h‘Æ¬\ìhh\ÅG¹Û½­ÙŸe\Ë\rÁ\Û;8n\ÇP–\Öõ\Þ\å\Zò\âI	xµ;x\Û$\ï,@¬((€\ZX÷Cq÷3o&“\Ü\Ýj\æ]B\ÉQ\ã[[¦z\É¤’Jê±ž4’\Zq.\Üý\çm½œûGÚµ¯]\Ù\Äö¶\Éû\Þ\ÜúS\\\Ý-F™•Kšª È•55\'|w+_öm\× Öµ\íV\æþx\í\í\é\nKu+L\é\n¼ò8Yˆ@\î\ï@338’P¬¨\ÅXhAPE\Z¼©·§h\Þ\ÇZuÎ‡•o›-@¼°-º,Rº²‚\ÏW \"‚MX¦‘™‹xP’k\ÃÂ†¸í¾‹³=t\ÝCg\Ù\è:|7Mi~\Ísg¤Q\Ú\Ü3.­\Z³M¤„¬h¤µU»wª\ÛôuIogy£¡&i]¥JH\Èå–„’)BO<v\ãkö\ÙgO×»mgi*\Ø\ß\Ékz\ïs¹\ÙÙ£\Ô\àF\Ë+I+\n \àMI\ß\Ë×½šõ\Ë}k_\Õ.o\çŽ\Þ\nA·2´®‘žIj\ÌBwjR¬OY\î>\év«WÐ´‹¥¶Ž{¨‚Fó²I*\Ä3zmR8š£\îv\ß[Øº8\Ô7­ž»a5…©F\\\ÞEu\Û@Q\Ä\ÓŒª:1\ÍEe<Gs6\ßt=”tý··º\\±j\Ñ\Ú_+\Û[1^¤ª\Òj“\"\Ðsf‰Â‚I*=Í¿²;\ì\é¡\îm±µ,­t\Óp–\×\ï*ˆ¡¸e\Õ!N«Æ™ŽH\ÕO0«\Ë\Z\Üý\äØ·[{w\ë“Oª›Y¥c¼º‹\Â\Èz=eš4,\ìß“!‰ œi\ÇeöK^Ô¶µüfK{˜aS\È“:\êJ\æV\0Ó*8cS\Ùú\î‘=¦è³¼{I\íd\\³Es†\'\×\ÂE#ý,X\ì\r\'\Ù6\Ú]·¡½¹k»ûK³2Bò\Í{pó5¾§\ne‹<„eˆŠ+™…Nò\î\Æè²´·×µË¡<\ÑZ¬‹nŒ#H\ÂÄ²\É,B¢ü¹Ö¦¸\Óô*\Ñ\ç\Õ.\çŽbAW’Y\\Gh<YÝ•Tx’1£\ì\Øý“¬—·»ON\Þöþ\ÖôÈ–\Èò\ÝM5\ÃA©Æ”Œ;’R%T	=\Ì\Û]•\ìÖ¸÷^\î\Üz†ä¹¶÷ò<S\\¤p¶\á5B\ÚÄ±G—ª\Ï%X\æ‘\ê\0Nü{EvJmª·‘\Ûi¨\ÑÁ,VfHc™\âL·72	¤er\ZJ0F\ÊS\î.\Ûö{öq²\Ý=½\Z½Ü¢ökk¹\Ödu\á¡j…cÊ”üAb\r\Ë\Þ\r\å\ìÅª\ÙnQ-VXl­\Ùm\ÔZ\Ú\ÃiMfºžPZ8UŸ4W,V‹E	\Ý-‹ì¿©_k‚\Â{N•õ³´;Œ…š]\ÛÉLk”õ)Î \ãJì—´?iô­©\éwð\ê‚!¼Šè–·ž‹õ\ïn£0¼s»ª2HQ”£ ôÁøk\Ã\íó\ìe§}]s`\ÖùÅø“§$&<âº½\å5Z\Í|0ÿ\0·}\É\Ãþ?‚Liúu6=þ…¬]\Ûõ\áŠ\é<\çhúŠ5W:2Ö¼Á÷\ÑLŸ-0øT‚?Æ³·{=´¶¶±«\éÖ‹qpž­¶HY\Ö ù\îµ‰v*\Ü\Î\\ ‘Ü¯i>øv²\Ú\Ê\Ëw¨\Ïo{¦tbUX­\Ô\Ço\rô\Ó\0Œ¢G&¬|O¹\ÝQì‹²´­b[Oú\Ó\×M¢ô™E\ç©ô\Í\Í\å¡ôÁ¹\Î¸ôT°R¿\ìWjÿ\0Y¥þ\Ù\Çr­w\ïhvÕ¾Å“@\ÔQ–7\ÓL‘X5¤\ÂòH\Âj\Ò9t·22…\Û0Q\åOs·V…\ín\ß\Ô;GN¸¹m=f’3{re.&\Ô\í\äônLÊ¥\áBUAc\Ý+\Þ\í\é\Ð\Ù÷6]n\åµ8!\ÉÒŠð¹\ë$})%Œ¢·)$ŠEv­}\æ\Ô\îŽ\Ì6ÿ\0\Þ}\Z\à\Ío×«v\â\"Hó)`RFH4 ‚1¼{C\ÛÍ­ª\í»k×³’n•¥¶[„Ž)]]jp»eI£lÁJz@V k½û\Ë\Ûñ¥hš†£\ê\é0¼°¸u*K?O§is3­R)X3(A–™ª@-^T\ÆÛA\ì\æÙ“m®‘n-Ý›K\ê5°¶A²6¬§¨\Ñeb¦0s¥\É\Ä\æqI6o†§7\á®;ki°»C¶n64zžšt²¾š$–Ám!rHVƒ½¸›<h\Õ\'2)¨\Z\äš\Ìa5†½œÎ \0\æV2€•\0I˜\0	CLv\ÚÃ±¬\Û÷ý§Ž\ÒQ§\\\\6ž³I­N\\\È%\Ô\à’¢c*Œð¡*¡1ÿ\0b»Wú\Í/ö\Î6¥¯µwo´]#a®¿\Ú\Ëf\ÖM#ß‹K ‘·«\ß\Ý\È\Õ\Í\ÃqEB\Ê*\Õ\n;mw\Û\Ë8\î7ôZõƒ\é±8B’_­\ÔF\Ò72FU\ç­\ÕhNf§Ð²\ïiö\í—l$Ò¥]N{wÓšh­	^£F#\Õ\'<R)\n°*=\Î\ã\Åì“±4cA“Q¶:ƒ^5¢´w¬~³}h\ÅZ*–Ê®¥I¡\Û\×~Õ»cO\Ò{„»z·†\ÌÛ˜›Ow¦)	¶¹ºB\íp\×*sHQ”(R{gc\Ù.\Õm\ë\î\ÕG`F›=\Ãi\ë4°u\åô¤\êH|\à‰	P\r\rsý¿ôømû±&\è¹{øGÒS7Œf‰;\Å\Ó[Š¨\Ë#&ZQ\Èô±\Ü;m\í\Ú\r³o³d\Ð\ï\ÖþXŸL2GdmeRFV‘‹¤F@±»*1 +NT\ÆÌŸj@’\î”Õ¬\Ú\É)G»›d`\åT«L6fU¡9˜\nœo\Ý\î^\Êí¡·õ½:{+žŒ\ÚR\ÉÐ¹¢—¦í«¸W\È\Ä+l§\Ò b\æv\ã²\Ö_\ÞH\ì\ç¶\êÿ\0HžÀPõA©FsªT†#A#j\ÏÚ³·º6“\Ûõ\×\â{ylÍ“H\×\â\Ö\èE›{û¹\Zá¸¢©ej…\à²öa\íÎ‡ªö¿ë‹¶ÝµŠ\Ë\ëdC\ëú…¬…\Ð\ÊLT©`ÒƒýŠ\í_\ë4¿\Û8ÿ\0b»Wú\Í/ö\Î5k\ïi¿g¦wL\é\ÖK$¦¶We6ó\Ü\ÆK)%¿*\Ä5A@dùuøk\Ãð\ãO[N\Ë\ífµG—\ÒÁ)e$}p(H¡\"‚‡…,±]«ýf—ûg*\ç\Ú\Ëji\ÚFòM-”VfÝ£{/Zœ—smuv¹ú\æE£:¶PJO¾×·/i5[K]WR³[i\ÍÅ´W*\Ñ,‚U\n²EƒŽc˜\à|)\ÜÝ“¶&Ûš–\Ç+–¤+	/ùdX\Èz‘K¨\áË™\á¥\ì¾\íi6\Özõ\í‚\ÞÂ°\Ü\Åtn\Ò\Ë\0bð±\n\ÝHdZ@\r(A\Çuÿ\0ûA‹EhK\é\ßZýa\ê|\Z—ž§\Òõ’—¬\ç\éú<?˜\Ð6\çwum³gªjvsn ³°ºV‰$11fˆ„8¥1\Äx\ãsl\Íui¡jú}Å•Ê¦™lŒ\Ö÷P¼*¸F1\ÈÀ0â¦„q\0{·ƒ‡kž\Ñt.>®7Wú\ÇO\×nz½N«	?9\ëe\Î+–ž\Çt\ÏwE¸\î\×w?Zt:}\\\Ïùn—Kòy3|œœ)\ç÷º†\Å\íN½§\ÛmËBK\×I\ì`¹X’(avH3…)`%r‚	,\Õ\ÙzÞ«e¶õ\ØO¨I{d\Êö\Z|\æ{Vº\ÓÙœêª†7‘©ŸÑ’”\Èqº;s½­#ƒt\è÷-our$È²(B\É(\âŒ øñ¡cm\r\rý\Ûúª\ß\Õ\ËýUŸÕ½]:%ó53ô²\æ\Ì)šµ\Å\Ç_ú\\Í›\á©\Í\Ë\Ï^X\í§÷\Ûhÿ\0q~ \Óþ­\ë3«\ê©©õ3>n¡·\é\ç\Í\éf®j5q¯}u—\ëŸ]Ÿ\Ö2\å\Ë\×\ê¿V™}\Zu3S/£N\\1\ÛQØ¨6±\í(´—\ê\Óuõw¬}f|ýN«u+\Ö\ê\Ó8Í–˜\Ý[u\î]Í¢\ß\Ígt‰¦\ÙÈ‰=»˜\åU‘j®¡”Ñ”ÐŽ#\ZV\Ë\îÆ»§\Ýh6Z‚\ÞÄ°XÁl\â\á!šc$c1Qò•\ÊIÔª\Ó³ÿ\0Ë®þ`}aõo[§\Òõÿ\0Z‹\Õ:½_\Étúù3õ=µ\ÍÂ¸\îˆ\ï;Pv»\ê™~³6ÿ\0WuýS\Ñ\êt²1|ô\å”fÿ\0GÒ§»w\Ùoe»\'ûÁ¹ek¦ŠöfWkYdf\Ü±…å¯¤À\0*q²;›\í¢\èRj×—Z~Û²{;›\Ô\ËyspöqI,\0\r<ò\ç\ÍH\ÌB¨¦\Ø\í¦\È\Óö„[SG·0\Û$²\é“H±\çy(ò3s™\ÏÆ”¯—h;·oi/Þ­\Õë»ˆ\ïl\Ö\ÚN\ÏR\æRU„QRva§4^\0‘{?}\'\Úö\Ûp´º;›Xtù\åcyip]\0‰‹¦kxæ¤ ŒH%j\0\å‹=+²:m¥\Îõ\ÑcMYE\ÌðÁ-Í¾W&rJO$ \Ä*YI$eG\æ\Û/\ï\éú\Øü\ßeýý+ÿ\0[\Ö]ñÒ¶\Ä\ÛAy5‰¬\Út2©³µ¸\Ì\à\Æ\Ù\Ü,MHØŠÔ… #–{/C·k¾¸»¡¾õ¿­\Ò/Xþ„™>FZŠs§k®\î>¿·­w†œ°4\ÑÃ§\ÙOGsYc%4R£\ZqRJšpº\ív··.÷A´–\ç$ö66\ÉÑƒ/Qº’µ\Ô&¾@H´\ï\çµ6™¤%Þ§5¾–“X\ÏhT¼PM$(m\íØ•(¥&J˜\0\ÄULŸ/0§\Ã^‡Wh6j\é¶=cú¨°†8³òB\Ù4\'‘¦»E§ÿ\0)µÆ‰»;µ©\Ú]k:}ªB\Öö\Ñ\Û(‡ªóQ’>\Ù\äc˜ñ¥‡¾Ö·—k`\ÑÎ‰a¨9M\Ýç«¿\\E\Ä*¥%BLž‘\Ê	$\n\å4ü\ßkÿ\0i·þ\Zþ™Ù½\ëµô{Rh\åº_X´¹\êI\n²FÕ»\Ò\ç)•Y…¨5©«m\íeº,5möúmi-§«t\Ö\Ã\Ö\î\Â\ÆE­­¢\áŽh\Ë\Ë\é‘@±w7ÙŸx\è\Z6\Õ\ÞC;‰å´–Y’\Õ\î\"„¼wZ}Ø…”¼\Ô°,®3ñ\0.‹¯w‹tm}cVÓ­š\Þ\Ýýn\ÞÛ§¿Q—-¦›5_ŽgVo\0i\Ã›\í\í6ÿ\0\Â\ãvv\Óx$¹ô[¶¶¹\ÉÕ‹¨ Ó’‹™H`A\Ê\0ŠcF\ÛúhC¨\ß\Ý\Ãmc•z³È±G™¸\å\\\î37€©Æ…Ûž\Þw;liû7LI\Úß©§\Ï\ÒYe’w[\"Y˜ev\äjf\Ê( o¹ý¡\ïôÛ½\ç»å»¿i\í&ID²$‘‰\ÞDŽx\á%¥L‰a)P §¼\Ú\Ý\Ð\Ùvú÷_X€\Ío\ë\æ)Š	*¼b\Ý\ÂÑ’biJ\Ð\Ô\Íö¿ö›\áq¢ö\ã¶ý\Ì\Úúv\ÌÓº¾¯o\Ô\Ó\ç\éõ¦’\â_\Ê\Üi\ÌÙ¦–Gô¤jf¢\Ñ@¹\Ö=\èÔ¡¼\î”z›NxL})nr¡f£1*V\"Œ\nS(#\\h\àÛ‘m\É4»oVGú¨È–\ÍtU˜\è\î\Å\Ö\"¡˜\È\í˜¤]ž®Y‰$ýf\ÜI\âO\æ˜\Ð6ž\Þ\î\Þ×·\Ûú]”–\ÑWK~½´K1\ç“Fi$h«™Ù©VbI%6‰1É»õk\Ô\ÉgUG¼ž\ë¢KI@ª;T½…5¥8c@\í\ÞÀ\î†Ø°\Ùú\\Mµ¾}:nš<+/V}\"Yž²H\çÓ‘ˆ(!@\0\ê~\Ð7ºu\Îú\Ýf\ãT’k9RE™ä„ò:\Ç¼q3JI	a\0>ˆ\0P{‹b.\ì-÷\Î\ÛHuxæº˜B±5½\Ô\"43¬Ž“´m‘\ã(@9ª8Ã°··u6\Å\æ\Ó\Õmš\Þ\ê\0út=XZ™“©¨\r(J:šTV„\ãv\ì\Ä\"ƒDÔ®lnDOÔ‹¯i3Á/NJ\é+\ÐfZ\Z\nû›>\Ã\Ù\Ç\\´Ó»ºð_;‹žE#[9\Í\ÐoX‚\æ*µ°•W4,s”«Q†¦\ïž\çm‹\Û=/X´\Õ-W©§\ÃÒ¾±s%¬õƒHŸ¤\ä·M\ËD\æ™Ñ¨1þ\Ùö¿\Í\Òbco÷rû¹{]û…¥\é\Ó\ØZ\Ýõ4ñÒ´¹póE\Ñ] [¾v\0\çxšE¥€\ÆØ»ö°\ßú>­°_‰-¢´õ\"ß›K³Œ-´û9\nu¹^.\È\n­J‘z\×\ÙGsX\é]Á]g¸–\ïÕºMa\ë6‹$`][]¡s9·a–,\à+\ás¶·u{Õ¤?V»{h=N\×G¸n¤qõ[:&,«—“xð Å­œ\í&y¤TPt½\ÎÁV§\êþ¤Tøc~\ÜoN\ïm¹örh·\Í\Z\r/<–B\ÚSt‰“GÃ´\Õrº5H\Ê\êhB\äiLY\í.\Ñwl\é;:iZñm\Ì\ÖKr¨\Î\ÆK*\á\êÁVª²¼\É:gvý¨u\'Q\Ý¢S\0¸³–&i\Z\Â\Ú”<0Z\Ú\ÅHH¥\Ò*KzD“ß¯e­{G\Ò\î­..t–¸»š¡&+y§AoqiwB’\ÃIA\ÌZe\'\Z“w\ß~m½_dmõ›W0\Ç-”­ik9y\Ú\é–\Í#ˆ\ZeX\ÞL„·\Z\Z¢v»·Ihw]ôS\Ë¬\ÍÐ„-´/q!i29\" !%¨8\n‘>…q\Þ\r°\Ú\\¶\Í\'ÿ\0\Ä\Èce\Î4P\à”$f\r›Æµ\ãŠ}¯Oþf\ßø\\j\Ï\î,\Z\ÚÖ³Á†\Öø\Í0k‰Q\Ò3y†v¨\Õ\ßn\í_Ù»¿ö{KhA®47\ÓMr†kÁkn\í:¬67KC\Ã%Õ‰J¢‚Æ®“úM÷\ìŒ]\'ô›\ï\Ù\×\ì;Ï¿.w\ï\Û÷\ZI¹•ó¨K+©Ñ’\Z¤dBf2È™‘X\ç«\0x\Ún^\ÒûT\é\Ún.\ìY\ì,$ž\í^\Ú¼£#ôÙUÃ°+€\nŠP]\'ô›\ï\Ùÿ\0\ZºO\é7ß²1\Üý·\Ý=Ìš\×q,õY#¿¾FwK©Â©2«INT©P3F”™@J\Ã@¾ºôú¥¤v\Ó@†\á\ça”•ÀG)W¨V#-@\'†	ÿ\0\ïWIý\"ûöF;gm\í1\Þ;mß¨]\Ù\Þ5ƒ\Ã$òh\ã’p­Öµµ¡•š#UPœH \Ý\í®\æ\í\'µF¡v\â\î\É\Þ\Â\ÂI\î\Õ\í¡õ‰”£ôÙV@\î\Ê\à£ÿ\0\ZºO\é7ß²1¼wÞ«í›§Í¥\èºU\Ýü\Ñ\Åqxex¬\íä¸‘#¥\"#*™W1˜\n‘¬\ï\ã¬Ï¨\î}Fc5\Í\Ì\Ç4³HÀ\Î@´\0P\0\0\0\0\0\Â\ï~\ÚûXÇ¥m]>ùô¸\í\ïg¸©´‚ÙQŸp½1Ñª–“9*Å‡\"Æ®“úM÷\ìŒn\Þð\î\ÏlkÝ¿£-¹šI\îš\á\Å\Í\Üi\Ói‘Fr\ÉpŒÙ¤_@1j)\Ùöú®m÷•þ¹j¶\×N\Ìw³\Ý Š\áU˜–F`¬Â„…\'†	ÿ\0\ïWIý\"ûöF6\í+\Ý\ËmÝ¸.´©d³ž&‘m\í\Ö\à«\ÄzÖ¶¤3I\éðVR­Âž\îò\Ò=›{­o´w]¾‡Öº¹šI£Y­=j\è\rµ\Ó\ë4rP¢Š)ô«Àÿ\0]\'ô‹\ï\Ùî†…¿u\Å\Ô÷Åž\à\Ô \Ô/™–\êö+©R\ê\à3¤n\Âiƒ\È\Ñ†«*ž\Zvõ\í\Þ\å¹\Ò7m¨‘aº€…•Ñ´2\0X0£\Æ\ìPx‹+\èý´´µI¢I\077\Õ\Ô0šA¡¡§“š\íÞ±\ío>¯½õ»;9!ž\ä\Ã–v¦\îF¹/¦£„hÁT\é$Ÿ\å\08\ãüj\é?¤\ß~\ÈÅ¿aý¢»\Û&\ëKH­µH\Ö)\íI’x¢qÕ¶¶Ì‘™’¥2…‘²“˜û—½÷öu\ï6‘´\ä–{*F–k¸î¤Ž#o4¨\Â+˜Œ,ý&P[6x\ëA@N\â\Þ\Ýóö\Ð÷.\Õ\Úv7z ¶i\ïšAÐšc\0:l(eh”¢õW($\âÇ¶[[\Óô\í\Âm&¼Y\ï\Zd…\×#0E<™\Ée\ÉD¥x’)OB\Ö=²´{\"ö\ÚKy\â{›ü²\Ã2å©¤ƒGFe4 \Ðó®7h÷=ý¥Ö¿¢\Ü$2\Ëj\ÒwgŠ9”\ÆeŽ))–U4jA\'Jž\Ó\Û?JŽ\Ñ\í¢dCs|J¡E*¤ýRjUh	©©©\çŽ\Ù\Ý{Lw\Î\Ówé——·ia\ÜI\êÒ¤P´\Î\Âk;P:ˆÈ ©s\èž\Ì\ë\Úï³Ÿ´5–\ÓØ±\ëó\Ã-¤\Ó\\£Iz¶Ö-ÀXlnŠH#¯P11ñP\0\'¸\Z®\ëöÁ\Ó/¶µ¶‰}-\å²\Ü^æ¸µŽ\ÖW¸siH3K\n¼b®‚­Å”qGlv#}C¶û“5µ\ë[\ß\Êò\"Cv’½Â³E\r\ÃþVñ€\"`K\n•ÿ\0\ZºO\é7ß²1þ5tŸ\Òo¿dc]Ü½ùö—±\ÜÝ·Šú\Íf°†{¦y%’uH,º}º2\Å)W \Ê9 {\ë\Í¶\×\Ü\Z‘q?ZXl/®-b’lªWHUŸ\"*–\"¹UEh?Ä†õþ×½ú\\‰\ëý¯{ô¸¾\ÕuK\Énu;©ži¥‘‹\É,²1y$‘Ø–wwb\Î\ÌIf$’IÆ›µ¶‡|÷V™¶¬¥½­¶¥u¡b\Åb‰$‹™™¨ \n’qþ$7¯ö½\ï\Ò\ãüH\ï_\í{ß¥Æ©¹·Nµu¨\î+ÙŒ·74\Ó\Í#syer]\Ø\ÐT±\'·\Ö7\r\ì,‘ÈŒU\ÒD`\È\èÂ…YXV@#Ž?ÄŽõþ×½ú\\i·\Î\î³¸.\ì\ãtõ¹®šr\Ö#3¶@\åT°Zf*+\È{\Í7klþùn­/mY!K{[]J\ê!B\Ì\åb‰$ŠY™¨ \n’|qþ$7¯ö½\ï\Ò\ãS\Ðõ¿h\áw£^\Û\ÉðKª\Þ<SC*\åŠDiJ¼r#2:0!”• ‚}É¶\ïn;»¸ô-K†­\ìo\îm¡iQSR*ucEg¥HEðÿ\0\×û^÷\éq´÷\Ç{wF¯µ\î²u­.õ+©\í\å\éÈ²\ÇÔŠI\n>I$PÀ\Ñ\ÑXqPqcª\éw’\Û\êv\Ó$°\Ë’)c`ñ\É©®Ž+\n°qÿ\0;\×û^÷\éqcª÷3~\êúþ¥k	Šoî¦ºx¢,\\\ÇL\ÌQ\ÅV€“S\î\Þk]´\ßZ¶«\ÜAÐ–k™me’\êý\'xYKGò’Fe•\âGzÿ\0k\Þý.5=w]\Ôg¼\Ö\ïn$ž\ây¤ši¥bò\Ë,ŽK<’;wbY˜’MO»{F\ïD…*¨\Õ\ï@UQ@\0\êð\0\nmÃ¯÷¯t^\ëº,\ÒMaq6¥u$\ÖRÊ‚9d¶v´/\"Ž\ÈAdôMG‰\r\ëý¯{ô¸“s÷wj:\Þ\ãh’3u{<—3˜\ãFIY›\"T\åZ\ÐTÓ™÷\Û\í\×x7‡·Œ\ï7«X\ß\Ü\ÛAÕ(y:qH«\Â(f¥NQ^X\Õ6\Þ\å\ï\Þ\î¿\Û÷\Ð<7\Ó\ê—rC<2¯±´¥^7RC+ \â=\Ï\Û\ÝÝ¨è›bx…Í”ò[N#\"	\"el®\0Ìµ¡ ¯,‰\ëý¯{ô¸Ô·N\ï×®õ=\Ëy yî®¥y®&p¡CI,…\ÈUU“@\0\0\Ä6ð{FoD‚5\nª5k\ÐTP\0:¼\0€cL·\îwsu\ÝÁod\Î\Ö\ë¨^\Ït°´D™\Ø#8UV„…\0ò\ÅÆ\Ûn\í\î-C–\á§{{û‹hZfTF•£‰\ÕLŒ‘¢—¦b¨ š(Æ¡£k\Ð{\Â\ëI»‚Hg†MVñ\ã–T¤‘H†Z2HŒUÔ‚IÅž\ë\Ø{žÿ\0F\Ü\Ö\ê\ëÕœ\Ò[\ÜF²!Ž@’\Æ\Ê\ê‘€>’’ñ!½µ\ï~—\âCzÿ\0k\Þý.&\Úûÿ\0¼Û›Z\ÛrH’=­\î¡sq<g4l\ÑI#!doII\Ä»ÿ\Ú\0?\0ÿ\0q¹\ß2¥Xò¯\ÙX½.5<?‡ðaV1\Çñyñ\Â\è\ã…\Ùû\ç\â\Ç¯\Â~,P\\¾q\Âa÷ñý ü<„J?#ü¢8ü?c·\Ü\\=\ÌÇ™\0»O¼>\ßQ\á\ï‹1¢Œq \Æ\ßÀ‘*m[˜òyþ\ß\à\âMTýŠ.\Î(1Õ“„#þ·\âÅ´@p\Í_¼?Hô¥_¿Š™G\á\Ç\Ç\îcÑˆŸÁF >÷ð\èÍ€k\Ä~Fe,¼qÐÿ\0\Ý\Øð>O·\íðû±¡¥yâ„š|8®637–¸\âMq\Â2~\á8\á	üX©\09\Ê$þE©\Å\\…‡ª’\\ùp\î‹U^x\Îhã—œ|~\\4n1\êw\Ç\É>_7\Ûñ\Ó\ì)5\ÇN\ØU¼¿y\äôü˜Y\nœ‡‘ÁI×‰\äk\Ã\àøp\ÒôÁÆŸ†>R¼0zNž·—\Ã\0\Ï)s\ä\ä>ö(Š\0÷x/+Åp&‹‚Ö£\Ì~/\à\áŽ<$\Ç\Û\áŽ$ŽpŸ\ì$h¤…5®2‚MO,~NÚ\å$Wd\ÉF4 ­9&¢Pp\0|8\Êx©\äpbš¹ü8)\æ\ÇôCñþ<éŒ§ÍŒ\èo\Å\î–<€Á\'›\Æpˆ<\n0ªœN_Œy>\ß1\â²!\àp.b9e_\Ãöý¼i…ŽD\ÊÇ€>ýƒrÃˆ\â1\ËXŠ\ä÷-aòŸ÷¿)„‹ùLÀ7”\ã+pa\Äø\Ç\Û\æ8\É\'	‡\áó·‡½)\á÷ÿ\0‹\Ç\Ý(\Üü<\Ç_ú:úCøGðù¸øqr\Ç\Ð#ý\ïÃˆb—‡\Ä>Á\È~ÇˆÈ¾\ç™ûß†¸$žˆE\0Ò¾$ÿ\0½Œ­\ÏÀù1J\å‘Oöó£p˜s\Â<\Þò8þ\ïð|x–_ §¼Ì£òƒðù±¬Hs~/\äüü@b•\æŒ>ß½\\+D}‚“ËˆÀÿ\0D{—SO¹\Ï+5ƒ\ÇÉ„9h•¿¯\Ã\î\ÒGø1™xJ¿m>fsC\î\È|½üu\Â(\Í\Ç\Þ\Í:(\È\r<\æœ\Î%¶˜þQV£\ÎðŒ \'\Ò^\î}‚\åo\à8\à•¼rœÿ\0H“÷òþöüx \å\î\æ_\éG\áó`HœsQ\ä?Á\äÀ‘ña˜ò¸\Ëü¦o\Ç\Ï\n£ñ\Ø|®C\á<<ƒú\Ã\ÉüXrR±ž~o>\Ôú$}„y\\aG›2iü8…zd\0œüXü®dùO½2\Æ?(9ùÿ\0×—ò‡—ø\Ç\á\å\ä¥QÁ-öœG\ä^?ºKH?\âÇ¢a2 \0\Zù~ß½Šcð:’©\0ŸR4\'\Æyö\Ü\ÂüD{)ù \Ôýÿ\0\âÁ¸qOA\åøO¾ôœ»Ž¬R\Äññû†EPŒzQð|xþYƒ\0¹\0}óŒó\ÊHó}§:¨\'7#Æƒ\Ãk\Èpû¿o\â\ÂF\Zqø~Á­ž\r+~X }¼°’Ê¿“\È?(±5>ö==\\pz}\ÌS;ý\ÊãŠ±øq\ÄS\á?Ç‚Ä®j}ÿ\0Á‚1…P=ƒ„`{¼ã‡™øf\0Sþ>Œ=\ã÷O\ÛøþÁ\Õ\×\Òò\â‡\äøW)¦+Rd\Ç*cú?\Âq\Â%û\Ø\à {\Çs\à0z‚ªO\Ûöó\Å@oy1ÿ\0‚#øK\ÉÂƒòö£Ž6\×>•³r>O·ð`Mz>ø)\ÊQ\Ì|^o|±Žl\0\ÃI\â\Çð{\Ùÿ\0\â7\â8Àf\â©ûQ\ÅT\à\Û\\úV\Í\Èù<\Ç\í\á4\'\Ñ\æðø|ß\áÀŽN÷þzc_Dðý\ì(cEQŽš’\È|~y8ÿ\0€ßˆ\â(Tò\0Ÿ½\Ãð`1ùm\Äÿ\0\ØrŽ*§¯q\Æ\Üò>O1ó~,u¡\'\'>ÇŸ\àûN3p—Àø\ã÷*\î©,G`:(.\rxò\Ã+\Ì<ÀžˆË”ó\çø+\Ç…}\ãñcò–\ì>?‹\êPùøaj³@0ˆ~O3÷1A\Ë\ìA\ÅTá­º‡¦9|i\ËCñ\àEq;/’œ+\æ\'ËŠ\ä©óñüx¨¦cø\Ú0Ò‘ò\à÷})\ãüXüœdŸ?\Ûü8\È@\Ê|)öœt!O—²Žµû‰\Ç‹\ÑoÁŠHœ<¾\í8Xn\ào\à8¢ŸDp¯ðþÁ„Mh<1H\Ð÷\Ï\Û÷1ü¦ƒ\â\Å]‚þöý\Ü\Õcöù1D@1C\ËŠö0†Y#	\â<0\'\0\Ë\'\Ü\á\'\Ï\Ç>\ÉqU8Î©\é|?ú\n,\Ì\0óš~<~q\Î_œGó—\ã\ÅQ\Ã1ñ`«Ì¼…€?œGó—\ã\Ç\çü\åøð\nAÁtþ0øñù\Ä9~<~q\Î_‘c_tg‘V¾R\ã\Ç\çü\åøñù\Ä9~<R\nŸ\0òªŸ9ñœ~q\Î_Rd\'\È\'ñ\ã,~q\Î?8\ç/Ç€t$ÿ\0\Â3\0¾sL~q\Î_œGó—\ã\Ç\çü\áñ\à’hŽ?8\ç/ÇŠ£†c_\Å\îþq\Î_$Š\Ôò*ycóˆþpøñù\Ä9~<’«1ñs\ÂWþ0øñù\Ä9~<~q\Î_•cQø0Y˜òžð\ãóˆþrüxü\â?œ¿2¤ª\Ç\ÌAüG\ß6•w«Cj\î\ÊÀ¹Z\ÑO‚–RG…k\ß;_\æ}.?|\í™ô¸¸·´\Ôã»¦,])@r¨\ËÁ›ˆ\0~<±y>è·‚Y¦6\ËU\à8\Z\ÈŸ\ç\ß;_\æ}.?|\í™ô¸Ó­!¹Y¢Ž0ŠQÇ”P‘Oºqq#\ïef‘‰%A$š\Êó±û\çküÏ¥\Çï¯ó>—\Ò\×QK¨Œ¬\ÙÒ”©‡n\"ž_v\Ò+Áok5¾`UŠ“\é\å<Au\"”\rqû\çküÏ¥\Çï¯ó>—\Z}œ+4Q\Æ\0u¥yE	û§zû¢\ÚH\ÄeIF ©cÿ\0´Zs¥)Â˜ýóµþg\Ò\â\×TþöZ\É\Ò\Í\è\Õ¹‘—ŸPÒ™«\Ë\Ãp´RH˜fð\0©¹ò<~ù\Úÿ\03\éqû\çküÏ¥Å\Ä{º\ÚGI‘‚Œ•b¬QùSÄ‘AÀü¹²¹¾KhY™\Z”`EjTq<9\ã÷\Î\×ùŸK\ß;_\æ}.ÿ\0YZž?ð>—ºS\'Z&LÔ­3\nV•ø+‡Š]\ál²©¡( ù2\Ô‡f—‚u’S `¹ET\nqjŠ-k_qÒ´\Ìû\ã\ÛsjÊªÂ¼EA–¼qy4\Z’\Ü\Çp†U\0Q3q3Tßƒ\å©Ô–¼\é˜_¹\\43\î\ët™y«| \ËQ\ß;_\æ}.%\Ôíµ”º\â1ú\n)ò”ŸH;r\ËJ`\âF;\Æ\ÔÇ‡¡Ã/\é|1û\çküÏ¥\Çï¯ó>—¥Zj\Ð\ÝHŒ\ÎJ­ÿ\0¢ˆ•|§6W7\Ëm&F¦QFV¥G\ZSŸŽ?|\í™ô¸ýóµþg\Ò\â+\Ëm\ÉÌªŽ:k–¦¢„ðv4¾¶ŸT×’\Òu‹(RSŠ†c_HƒÌ‘\äü8\ë\Ù\î–\Z‘™Tsx\ãõ¼¿1~<Mg\r\ÃJ¯)z°‰UZpÿ\0‹‰õ-Kpg¸bB¶@8\0\r	\"´\á_‡%Ž\ã3\"šÎ†Œi\Ã­\åù‹ñ\â\ÏOŽB\é\n\Ð\ç biŽ­(\Îå©‘xT“\å\Ã\Û\ÝnÅŽu\æ­\Ó*+\Ä¨\àkˆ\æƒ[‘\áqU`ªA‘#O†\á¤S!j\ãAJƒÝ¾º½\ÝÁt\ìFLuS”p\âÀò\ã\Äx\â9¡\Ö\äx˜*A\â5\â\Ç\ëy~büx³\ÓãºB™A\"„ýÁ‹‡}\ß\Z\È\Ò1+XøMG\Êð<1ú\Þ_˜¿)w„k\"’&0A#7<=ŸSòo	LÂœŠ\å¨ð\å\ÇÉ‡·¹Ý«\ë\Í[¦\á^ µG\\G4:Ü€U‚© ƒ^ \â\Ö\íuYY¢‘\\«\Ç+N~4\Ä\Úl³4h\ì§0\0‘”ƒ\È\á\å—Z‘cPI%T\0I¯!„‚\ßw#\ÌÆŠ«\Ó$Ÿ ¸\à­\åù‹ñ\à\Èbþ\â\çu\Ç\Ã\Ê\Ì\ÈLuRMJš°<<ü|¸´†)3Ä‘ Vÿ\0H\08Ž<=Û«½Cr¥½\Ó¬d¥EÍ\â\0<,-l®„ö¨”W£\n“^>\åõ\Ý\î\èŽ§`Z2RªrN,*#\Ç÷b ‘.n˜Ì§“KŠŸ\Ë	k¦\êsm\Ôcœe¡\'˜ôI>q\Ò÷tˆg>–W\éƒBM\rzan-5\ç–­U\nš\Z\Z\Ô\àx>:÷›¢† fuE<…K\'\ézú]\ÎÐ•*\npR\Êsz$ž`\'ƒ\é’\ÌÑ£•9€Œ¬‘ \ãJ` \Þ1\ç­)X\ë^Tù\\\ë\Öó|\Åøñ£¡$Žª\Ã)U\Ò\æ‡¾†\îö\æd’8òú@¥I\ã™[P³\×\ãx³–«°­M<Š8y1Õ¬\Ë%»Š«GÃ‡\Ý\á\îiÿ\0_j­lS>J«—7\ÊV\åAÊœñqoe¸Q\ÒGK°¨ S†U^ŽuˆZg`ª\âI4\0pñ>\í\íÆ©¸ö+(\nB¨Ðž \ÌóÅ„3™,\Ò%õ2Ó\à\0\ãðy{­\êZŒð«\ÎA@‹\É|PŸ\'‰\âqic¹	Š\Õ-Ä…\ÐS\ã@ðÀ\ÄòK¹f21#:P\Zš\è\Ï#Ãž˜½–\ërº]4\Î]s\'¢Å‰e\ã\äj9œB±µc\n\0>P÷q{q©\î†ù˜g@\Êœ x\ÆO*g–0ë°˜¡P\ÜHQ@M\0ò\Ð4\Z~¡\Ó*\æ!MH¼¹T÷}\Ë\è®\å\Éj\Ñ8v­2©R\Ô\Ô\n<±c>Ÿ¸ž[ÕB\ÉFo\Â0Á÷&»Õµ¹m\î.¤\ÊY\0\âx\å¬d\Ð)\ÄK¦]¬\Ö\Ñ`k\ÅTp<\ZPž8–\Ú\ëU….Ñ”ž ó¡\áˆ\îa5»(`Ã‘R*óSŽò]\ÆE\Ü\ÅW*2Ð(ŒššxµÓ­Ùš–€µ*x“Æ€gÀaä‘€A$ž@ROÀ1%\Ñ\Üm\ë·\0Dd¡b€µŒž4\Ï<XÏªj“Aom@­™\0!I\ËZ¡ôMiA\æú£D\ÕE\ÆR\ÎjAj*x*Š@\å\ã\îuõ­q­\ïzj2Q\èŠ\ÐÐ£? \Ó-uø\Þ\ËP³z^“5¢Ìšpåƒ§\Þkñ¤Y\ÃUV¢¾U\"œ|˜“U\Ñu.#‘u%Jü M(ªj8Y¿½_53%*\riý,~ºƒ\çm>\í&‰Z„©¨•§\Þ>øƒ\È\â)õ;›ˆ¢vÊ§1jšW’¡<¼¸±\Ðô­AœE,•<Û‹\ËÎžOsOþò]Iúysqù9«•[—£J\Ó­n>ôŸG‹³\Ô\çk±2d=\æAü˜\àZž#\áÇŸÜ½}_P™5\"W:¨z•iJ!&œ‰Å‚i\ÎZÀD½2kR´\àM@?|yq§\ÝW\Õ\åZ5\r0x„a-µ+\ëˆ\çeY½H­U\æŸ\rk¦^õ%D\ÌFWˆ V¬ s#™µ9\ÄýF\Ì)%3f5\éò¯Ÿ\î\ái\Ë\Íy©Î·fg\Î\0z\ÌsH\Ï&¯*\â¬yE>\npü½}[Q™5\Ã:¨z”r¤dr§\"qú\Ö\ã\ïIôx¸m½{,·6jÌµ<QEk—Æ¾\åòÞ±[3‡\"µ	”\æ<8ð\å\Ç¦j3½øtÁB\Þ¬`}ò0}\Ë¸\î\åŠ`“.n+QZ\åVñø12\íë‡’Ë¬s­s\åZITüœ¾\ÅóêºŒÉ¨ô\ÕC\Ð5*FG*r\'if\ä\é\Â\ÝBZ˜òð& \Z\åòŠù±dÖºœ\æ\èJ™BÙ†P&8Jòû˜ó\â\è\\\Z[˜\Û1ò.S›—U\å‹k\Ø5Yú\Ñ8u¨’•SQQ\Ó+á†°¾\Õ X7¢’Q\Ëù¶Þ½–[Î‰03-Hª(\çO?¹›^¾–;þ’ðPô\Ë\Ç)\àŒ+\Ï\Ç\îcõ­\ÇÞ“\èñú\Ö\ã\ïIôx‰4)šM?;Pµkš¾—0§ð`×–6«qš¦¼$\ç_ú¼~µ¸û\Ò}.—n\Ü<¶½_H¶j‡\Ê8Ê¼)O»\ï\áƒRš8\Û0£\ãJxb\Â\î\ágK¾-¸\áÀ\Ô}\ÞX’\ïN‘š|¦ªT\æ\0G\ÌF4\ï\ï)–¾ŸO&oø9«—ýZW\îx\âiôØ§h\ãl­™x‘_6 º†\ÞA4n¬µ‘ Ž<G»}õÇ¬}eUÏ—>Z\åZRœ>M9cOú·7¨t—§Z\×-8V¼k\ïR\ëQ…\Úu@ ‡*(	 Py\Éã‹¨£i\Òü V\à\î´l¯ð¢k÷<¸·½µr\ÐH¹”A#\Î‰ú\Æ\ë\Ö:šJf\Ìk÷+…§,_z\á¹õÎ³\ç¦zg\ÌsSÍš¸‡§ýQO‚œ?/¾·7X\æò\ç\Ë\\£•8r§,[\Þ[Á1·•)20$0¨\á\ÌpðÄ—Zt.³2e$¹aBA\ä|\àq÷/ýv¾§\Ñ~¥+\\™NjSiZSŽ,>¬7?XuO6zfð­xSð{«ªn“£\0\ËT-ü¶\0pø‘‹«\rY„H¯;W&Š£1ù€\à9\â{ë¶¹7š±À­)ÀxrÁž\Úi>«·\ËlÂ«ES\Ã\Ç4…¸k¸i(\Ì\\E–‡\é\Ã\Ç\Üi5Weµ”˜\ÎPI9”ð\áË€<q\Î\ïþ\Ó\îÿ\0\í0¤½À»š‘Á\Èô˜p\ãÀq†?ú€\Ïõ‡I~Fzeã——\nó\Ä7ö0\ÌÖ¯Z\ì¢Jž\Î\r\î¡\ëo˜-C»\Zž\\Á†\ÑöûË–0\ÒQ\Ãr$s9?¼°\"­\×QžŸóœÉ§\ã\Ç\æ\Òÿ\0XØ–\ÛN–\'|Æ¬[\0\æ|\Ã\ßEm¨:®™†U¨¥H\çQÆ \ã\Çõò±\êv·¼`…ôYhòdZý\Ü\\6Ý\ã³\ëÁ³T¾U©ô™2\åñð\åƒa®\ÛM-Å±#€``	¡WZòüœ1,:dF\íVYª@§ò¤\'–9\Ïý_ü¬[_[Ð•s-E\r<\ã\ÃLõÈŠXü\0T\â[\Û\Û	\Þ\êJfj8­\0‚\Ê 94Tuµ¶\n”`E\r\0$±<¸’k\ï.,.ŒÞ±£Q*+@x\ZŠó\Ç;\êÿ\0\åb[\Û\ë‡ºzfj8­\0‚\Ê ,X>–…lc¦\rj\ÈjIû\äü8Ÿ­¦\Îg6cùJf©©þ”p¯˜|n?«ÿ\0•‰®&Ó§i¤r\Ì(*\ÌjO	h*O€¦\r\Ïn‘fó…^^Zxbk\Û\Ë	\Þ\æCV4qS@9	@\ä<2h\Ê\ëio–0@€$ž$\×Ý®®®Ö““\n+\\\Êj9‚\ã\\Cyk§Î·µT\Ñ\Í–†R>øÅ½\ä\è\Ë\Zº\ÔPÑ…EG¡÷._[‰ŸMªfZ\×0\ËÈ©ùTñ\Ä\Ïic:<‘4mÁ\ÍQ\Åq”Ò£\Äqò~¬Ÿþ\Ó\é±6œ–7\ÊG\ËG\â\ËÀ\Zõs\ny¦\']»g$wX¶zdÌµ“°®l¾\0û¶\á\ä²\ë\n\Í\\ùZ‡\Ñe4\Ë_\Zy±<:~—&x\Ô1\ÌÒ¯i\Ãò‡\ÇJ\à¤—\Ãý|Y­®›8º2¦Bz”\r˜e&²‘Îž\àÁ\Ã\\jVs\ÉrZ\Ñ\Ç­8,Š?q& E\"[ÛŠ\å`xgbx\ÌMMO\Ã	¤ne‘YVLª\r9°ª\ÊkPxW4‹Iã»˜ˆ\êC\é0 9¤j\nÓˆÄº…\éoWB\Ê*}\"PTxŸ.«¦\Ï\Ô\rZþSkÿ\0µ§?¹•qý_ü¬%…‘—\Ö3%Tñ©÷\Ö\Ñ\ëš3\\Ü˜ª¬š.f\á\Å\×Æ§º²|\ÔúL~\ê\ÉóS\é1ivk´Ád\Ê<¬ ñ\âxÒ€ñ§_A¨\í\çšù^Ž\à-\Ðq\â\àòó~\ê\ÉóS\é1û«\'\ÍO¤Å„ú|+&ŒC\ÍW\ÉÀ‘øN.d\Í‹*€Itp\Çî¬Ÿ5>“Í \élŠËœbA§&n\\|œý\åô\Z–\Þy¯•€wh\Ç(\ã\ÅÁ\åA\Èc÷VOšŸI‹kHö»‰%‘P«@X…\ÒBiS\Ç[[DU€òz¥þ\Ü2\\:	\"­=\"\ÞWj	\åL~\ê\ÉóS\é1o¦[m’“Ëš…‚\åT±­$\'’Ÿx¹i£­²DÙ”x¨SU\Î8s\Çî¬Ÿ5>“¡i­m\n\È\0«S\à\Í\á\ÃÝ¶—\\Óš\æ\Ø\ËEP£ec^,¾üqû«\'\ÍO¤Å„¶qt\í\Z(¿\è¡PUx8Ï¸ö—°,–\ÍJ©\ähj>ñ\Ã!\Ú\ÒT>Jx\ï1©\ÞÅ¶HŠ\Õ˜µ!›(\ËG\"µ\çZc÷VOšŸI†\ÕôM([\æ-¨¨$pf&‡Ÿ‡¸šF·¥\Ér\0Y•\æ\0ñu5¿\Ú\é:°\\\\:Ç˜‰\á_LšÇ€\Ã\ß\ÞD\ï`´P*s|$\nyx\â9b\Úò¬ªÀ‚8jôžÚ”\Ë¢ 53$q¡#\ÃË‰¶´…ƒ\Zœ©\Ä\×þ³Ë \é\rm\"ª\ç$(\Ì	4¹\Zù1:\æŠ\×7f!€SE\Ì\Ô^.¾ ž^8³Ž\ÛlÈ—\r*l©\è±`ÿ\0Hy\ZG7\Z½¡ž\Ä2f@$–\0s p<y\ã÷VOšŸI\ÝY>j}&\"ƒH\Ð^\âG!@\0#ƒ±\â8r÷\É-ö\Ò( .Š\Ät©«\Ôv¿Õ¯Å\Ôv¿Õ¯Å„Ž5\nŠ\0\0p\0\0\à\0\Ã\Ü\\\é6òNÆ¬ÌŠI>rEN?Q\Úÿ\0V¿?Q\Úÿ\0V¿#‚\Þ%HQUE\0@,2:‚„PƒÈƒ\Ì~£µþ­~,:\ØYE\n±„Pµ#•iJûÇ¸¹\Òmä¸³2)$ù\É8ýGkýZüXŽX´ke•H ˆ\ÔGA§}Á5\î›\ÓLÎŠÆ‚´\"´\âxyñúŽ\×úµø°—šU¼s­hÊŠTPÐQPHø\r0ñÈ £<A˜>PF?Q\Úÿ\0V¿\Z;8\áF5!(\'•M9ð÷V+\ëH\æ‰M@u\åQ_\Zcõ¯õkñb8¢@±\"€\0\0\0\à\0\àºI\Ñ-I?ôkñb\ât«u†P¨E€5…8€xŠø\ãõ¯õkñ`Ael‘ARr \n*yš\îu\ït\Ø&ž”\Ì\è¬h9\n‘\Èb9\à\Ò-’d5V¨ ŽD\Zp80^[$°’W…G.É\Ôv¿Õ¯Å„·¶…cE¨\0\ä\0rÁc¢Z’\è\×\âÄ†\Â\Â(Y\é›\"…¨«@+L,\×\Út3J8šTŽU$\ÓÏ„–-\Z\ÙdR\"5¨#ˆ#‡0ya\í\ï I`jUX	£\áÀñýGkýZüXýGkýZüX\Ù\épE8TPhyñ¼Ý‡ÿ\Ú\0?\0ÿ\0‘zžÃ­«’\Êá¢œH:ý\âzª\ä\Þn™qww™O°¤\ã1Ã›‡/2\äº\Øi™a\è‘6LXU8\å\"c\êV’V#\Ãõ, %\Ù°Ã´|—q\ÖQ\í\ß9\Í%ý3\0““\äõ¹f)“Ü¬«\ÓQ;ŸU5Å‚@›r:\Ûy\Ó\å‡¶\îý²RT¥kµ$€U´jv ñýÌ³\Èe8”±x@\î„<|:—UY0úH³”\Ñ\Ñ\åh—6÷\Ñ@Û¯hù”lš\Ë<3\ä\Ìf\×Ë¶Ub\Û\"Æ®¡d~•,¨5÷\Êv*œ[¡K]rBT¡†ñÿ\0)\Æ3«˜‰«µD‰P˜\Ç\ÜaÔ¾röpÒ§\ê+é¼¿=\ÙcO!(Ý® u18·÷“ñûžc‹‡\Ï>\à\ê„\ÇP\\	q\Ý8\áK\'E’ O\Ì~\ïCó[ûÆ°ŠC\åU\Þî¹¾\åZÿ\0Vµ‰\\yqGø@×¤¹û\Ç\ê¬’•!¨^ó¹	+Qp\íoŠÖ±¦¿+Nœn»\Þ[÷ÜŸ/\Ý\Æ!!\×?ýR\í­!-(;µÚ¢½Û²§\É\æœ\Ò\å(üž®û„\à|¢’—½\â%§ ­¯›\Ëü\"€­¤‰&+:Ë¤-aE¾\ÙoõZˆ:E\Èd¨w:jFŸw«ŽY\å®\æx\\ÿ\0†d2(fÌ•’Z\ã\ÖX%\Þa&®^/_ŽW¹\n£jŠ\Ú3\í½<fYKªq\nqn)\\Í¹ý-\ç%?¯\åd\Ô\ÈaNÁ\Îñ™’*,M¤&–\\­m\Z+3‹krd…\'\å#÷(¨\0\îOW•Ù²Ì·`Im(\0½ûƒ\Ç\ÇN®²7:R)`©\Å,d¡ÀV¥\ÍÁ‰¼)÷>\0„§U­ Ÿr\Ùz,k1l«–ø\ãˆ0e\Æ\"g!f†D\Ä\Õô\Ü)W\Ò1¬Zùq ¤ \ÅK(\ÜC¥¤±ŒUV\ânI‹\ÚF¡©‹P·e¦;*\Ô\ç`\ÇaÙ«b@)\Õ\Õ,ü¿ptRÍ‡o\ËHðýñ\ØtKVd\rt\ÒCÿ\0{A¯n¿%2\à‘á¤™\0~\ï\Äô²Ü›Ó±$$¿\áñþ7N\ÅÉ¬n#¶’¡«\Ò\ÓDýš¯\ÇA\Ó‹˜³I‹@y2m­\î¬=%l(‰p)\×$>ò€»§U­Z% ’\å<\ã˜S‚\Ìö\Ý\È^]~\ÕV_böK\ÈQ°\Ü“\Æd$·7´6y+V\ÊÚ”\ë²\ã\É¹£pžs)\ä\Ï\îö÷hóÔ“\Ýs\Ô*\ï„\ë\"\\£dH<\Ù\Ä\rX¶—•µ¶\ï\êTÜ–\ÂK¯G…ˆr·d•\ÙvRB\Èqœ‚­\ä½Â¶{AÖ–:´óD”:Ú´[n$¥@rm-,\'0\Ë\ì\Ä}\Ä!N%*\Õ\r©Zé®º\05\×\àYFF\îL\Êñ:\é’!Fj¾\Ò$—\í¬V¥&5Esm>\ç›1ò“¸é±–Âœp„$ž«m¹)v4\Ü‰\ØÄ•˜Ï†eV\ÑY‰Ç¸›\Ê\Z¢e\ÔÊ•\ßÓ²Vúõul¶\ï÷;û	\ã\ì:ª—Ž1|ã”½\Í\å´4P‘%Á8,S¯,±Ýˆv2sKT%\×7)r[.(©Â¢L¬\×)\ÂñVœó22‹\êJ&Õ·\çu~m¬¸©!!Z¨\ë\Û^ý8¬\ë\Ý¶šGKk\\C\Ê\Ø=•–×”´7¶®¢\Þ}’\Ê\Ëjì–‰\Ð\áß§½wº\\>\íö_,*&)‚òFDòœO\á†.Œÿ\0õ\í‡\àOJk\ÂyÓ‘\Þ~Ž\Õñö?C^¢\Þ\ÐÖ’2²\à$\ÛX£hô=º‘‹=‘\å\×ò––’\Ä\ì\ï(ñ\èm•/ò\å\Ú\Ê*+¹„6>P%5¸øw\Ëü	\Ç\Ø5\Èym3Oc}2J#«P\Ò•>l–œu ü\Ê €VÇ•=t\Z\ß5\ÄÁƒò±\"cÀ%Sd\è\Úó\í´\n\ÜHm*PN›Õ¬;:É²\ël«\ä±6¾\Â—¡Îƒ6+‰z4¸rã­·\ãJŽò\Ð\â•!@A\ë	\â\ßx0&^É·‰cˆGÍ†\Ä\åôYv\Zo\åŒJ\ÂR]2JEX\íl¥>šD_:Í¹\r÷\Ùs&þ\ìÿ\0}–=\í\ã\'\ÈZŸ\Ç|Œ´\ÌF-I&!Œ[–ð·ey\ëG\çNGS6ð‚Öª[f_i\Ó\æÇL[\nùLMƒ:3!LŠ\ê‹.$–\Òôy1\ßiJm\æiaHRIJ’A¿qžŸbúa”)j[Š	\0¯‰\ê\Â\× ª\\tº¡\æÔ­\éÜŸ\0¡\Ü\Ô\"\Âr›\nŽ?j©ùŠj\ä½ü†Lùó#\ÓQÉ’\Ã\ÉX§…¹r^\Ù2\\\Ñ^©l\"»2[‘R\àu1œò\ã¥Ð‚\Øu,©e´¸%!@k§o™Å¸O˜l¸j†<D\ÄfW\×bjk\åH‘)k\ã‰\âtÕ§{\Ïy»Ö¯ˆ\0\0\ï/f~ã¹£!\ä÷q\Åa\Ç;Ÿ\È\ÙJòf±%\Ê\\\å\âñmSf™Pñ\ç\'8§•\r¥\":žR–PT¢K\Óò,»#¸–ñqoÌ¸¾²œû…\ÕouN?2S‹W˜¾\ê\Ô÷>= ¹9Ï‘¾[Ÿ\á\ry‹\ëllzùÃ®šý\ZÅ¦ûý®½¦€û¥ZtVº5Fm=\Ö\ì\Ë:H¶?\Êt»f\Ú~øè°©•R&”(µºL›9.¸”•“\é!.;Š\ZhKn8£ ·\Øn¥…\0C–*)xƒ\á¶>d ­>†~ÿ\0Uõ‘leXL]aŸi\çGb<xþ¢[‘\ë‘\r—]\Ü\êa¾§7¸¾\Û4¾¹‡.Q\â6ö\Üs\Çö”•¾S¤?•‘8X§r\Ý	s\ÕGƒ.RÉS-:óiqIÞh}›òLºúKLQ·QÇ²@j\\†…\ÇŽE\0´»ˆ.¯GôÅ…!\íJ¤.9Æ¼\êŒcð8\Ö9·\îX‘¬\ãy¦TüK%v+k/Žó¤\Ãf5¬tª;ˆbs-®DF«O\îœþð%\Ú\àü«\Æwòp#¶\Ï\r\ÚU\ÛV¤8ž$\Èm\Þu\È\ÖdAu©XÅ’]r5s\ÍyºË‘–¿\ÜI62\ãA…	‡%K—-ö£E‹”\ïzD™­¶c\ÇiU-jJR;“\ÖC;\ä¼6\æ,Xr*\ëË¨n*¢)-’¯SeUc*$r‘\Ü,ð×«•\ã—62Y™6ClÙ¬¼¥»\æ8¤§\é\ÜN\âTO\È\ã‰$ÿ\0²º^Ou-µÊ“a©Q¦ºü‹I&Á\Ô0™’T´¦CK^\å6\æª-¥Z”®M¥t\êño»J§&Ey†l«\ÝCN¦T\ÜBY–\ØnCjV\Å(¥.$†³ñk‰ŽSò½eŽª\Â\éu˜\î[Rˆ\í*u\n_mq\Õ_“\Ö%—$\ÅJ\rX4§\ZN’e¹f`\ÎÄ†nšº¸r\Îw­u¯O2ò\ÅÊ¨`Ê“\ä¼\Ä\Z?J§7•¢I:õ\è§\É\Âi\Â\n\Ô\áG\æ\ãIh$€\âÖ¦‚Ö€“\Ø\ê{u\\p\ì\ê‡!\É\î,™„aR\Ì2\Í%P‹*L«W\Ó˜]a¸\í¥KÜ•?¼$\ì\éž)«£\Æm²‹±*F7’Ø™•öu¯\Õ\ÖËŸ\"\î\Ä!\ÛÇ´f1m\r¿o™E½Ž¤!pd\æO\ÞOin$ú\n\æ­¬\r©@„)õ…Mtµ¯K¯\ÙÔ‹\ÉP\êd¦\Z\ÝYj0L—(Ü¢ü·7Ë¢G}\ëQ\ê]5SK}\Ô\ÉS-¡´•0¤\0\0Ô’OYrÁôÁ¼•J\ÒÆ›RŠ\0šg[A\Z\êÙ›	\åƒñß¯Ç®B\ãNC§£»¹çœ‚\Ê\Ï%¦º‹T{,I\ÚUU\Õ\ÕÌŒø%\ØVöooOm\ß)\Zƒ\ÕdüBeô^5¹¾‘“p/#¶·“\\õ{ž¶Vw8¤¶\îCŒ°\èH›j•%\ÒP–†\ëq<\ÎÅŠ\îV\ÄYS—\Ó=\'rÞ–Tc\Û\Â/º©Ã³e…ºÚ—¹jCn-\×’±\Ý_¶:\Ã[\ïO„\éÚ•R\Ý\Ì\Õ\Í\ç\"‘\ïª\Ç\Â\ä\ÎI`£1Gƒ²±I\Å\Ô\ë®×¼¢Üˆ\î\ÂOµ\ïqK¤÷uÃµªª\ë\í;WiÊ¸\Ý	]|›— Ln<˜¹¶4\äoMw\rhC©tJT´§÷E›\í°\Ã\r©\Å)\Å’OrG\ÙÔª—®\ëü\è\ëR†µÜ’Að^¾=q··>9\Ì,©85ŒT\ç¹\ÍU\ÕÄ\È9„œ†Þ¢¢D\ìU!\Û\nl>º/G„µ\æ]}\Ä-Æ£©¨4k,šÖ®\î\æ´~kÁ&Ks\ç’\ÔuC­}\ÕCUJ\ÈiE#\æ\ÓS§OUG\âL\Ò\æq\n—˜O\Æk®\É\Ð\Ö\Ãv‡\én™ \ÉX\î¥vÒ‚‚Î‰5NÈ™.\Æ2ºfô× %¸\r¥\Ø\ìBc\Èl}`mü¢÷8>z\Ç8\Ó.\å®\Ç\r-2eU\à³\ígFs\Zˆ(\ãNË¿¨\"j ·±ðÚ›mÁ¨\ìA¶\ãœ\Ù›-XQ\ä5^r¨3nZ–j²ŒvK\ÉJÜƒ1((u¥~Z¦ÜŽ\ï\å$\ä|g\î	®[·\åL~™üu_]\Ëw¸\ÖqŽEK²e\ÕWRSˆvÂ©\nq\ÇYn^‚6\çƒe°û‘œ®\Ç8|\"­‰¥¦b[[e÷_*\Ú÷\Öof—A\Ó\æJõ\nøŽ¤\â7\\;‰\ãô7Œ¶—lqœn³\Ékä¶´½\ZÊ§#6°§\Ã}i%Å´½\nC)m©¨ý\Ï\"r6a#±iW\Èv\Ô«1¡(m•*²«\Æñ\Øòlœg\äKòý@e$©´!\Í\Ý]$&ý:2€>Dý\î\ÞK\Ç ¸\Û!m>\Ùm²”öJTŸÁu\ÈÜ·z†«\ãŒ;/\Ï$*ghî»SMµ\Åw#\×\Ø\Çj:@\î¥:\0\îzªªS¾¢\ï*¾…	\Ç\Â\0ó\ío¬[e\é\06d²²\Û\ÔJ;%H¬¦ƒ\"|h‹\Þ\Ãl@ˆ\Ó¢0P­º)ˆ\Í%_Š{õy\Æy«,Jü\à§eøõþ˜\ßb\Ù4\ÔýY>\àXwE4ù\îü›\í©\Æ\ne\ç©tW\Ê\ìóŽ,c¼$Cõpq®V\ã‹)E\Ú\Ëê…¼•\Ô_5©½Á\ã[k\ÆóÄ«Êª.\â¸\äø1\Ñ2#¯6Üª\Ë$%ML®›º\ã±dF’ÓˆSjR¶)8—UýòžË²jþ+\Îq<\ëÏ´•¶©\Ñe˜d—µ\Ø\Þ5Ë¸¤Gf<û¬Ž\âÍŠÌ®©°~¬Ü„Ø†ü\ä\Ù9\'Œ}¼{…\á÷ø‹6\ÏQA‰SrU.F‹\Ì2ÿ\0\å0˜ÊeLõ\\	¸¬+û$^¢ZqÔ¶¢÷öM\ÞCÂ¾A\nh©$\Ùû\Ù\Õ\âe[Xù\Æ{\ÉJ®ëªœ#@5\ê×2süÎ¼\ÅkaÚ½\æ$¢6_‘WSL€\áX\Ñø²Rðt þ­%cB¸7¼«;‘vUŽ\Ýb¸ú+ÚƒGK`\ÜV\ël¦\äÊº‘\Éü›ILf’±«žj~N§Ç’‡¤>¹Ž—VR¥’§P$“ñ$÷\ëŠ8AT›*¼Wò»v6÷ó‚\Þ\ç*~—ómß\ÒFQ$x=\á \Z¼›7\Ã\í\Û:d’T\Ø\Þd+z†ºh\nµ\ë\Ù\ß\á’q\Öù·˜½\ÄD\ÃñÜ¶Ù™$\á‚0ûws+&½k”r\î%Ò‰l\ëµ\Å6Ú’ˆINK\Ä<­Kg\Æü\Ë\Ä\ÙW\Ã\Ðe8X{\ËZg\ãY¾z\ÒjóÈ¡†\æ\ÖX2a`-(u.´ˆ¼_\ÊH£\Âý\Ñ\ã‘Z{Ñ‘¾Ÿ”j\ãll\ÚÐ¡\Å%,]%[|\è©\Õ>b\Ãi)*Ž—£\Õ\Ô\Äm\ÊI	Hü§ˆ\Çö-\'-A!ˆ/S\ÛM£\ãþ¬é˜–\\CR^g`Y=ü\Å\Ý\Èøõ•¸\ÒnÏ™³<KŽ[š%\ÑK\É9\æDû#s‰-bq\â8Gd¦h\Ô÷\0ûv\ã‰0\äÌ ƒ”\Ó-Lf<å³Œ\â­z\ë\ÔJT\Û)krõ\r ·N­¹ª[kT‡\ç¬\Äg@•©jx\í\ØƒS\Ô,-°y˜\ËLE·)Å¥!!{4\Ñd\rMgRéª¹Û\ë¦\ä<Q™-He´Ï‘§mpœŽK([«Ã³$\Åm·\É0e¶\Ä\ÄY[n\Üc—\ë¼\Å(\Ý\È_\Æy/ž\ÛÉ›‡\äµr\rk÷€Ú•¹\êÇ™\r\ÍCEI™\rq²\âÙŠ¡\î\ß\æ{\Ù\Ðb\ã7Ÿa7Xùg*o&\ã¹N;c\Ä+©,Ä¸ª\Îr\Ùpk](wk•\ÖKÒ”R\Ù>\Û}³û™±™\ÅWuw\ÜuÊ‰\Èsd\Þ;?ñ\Îs\ã\Ìz¾\Ç\ÌôŒ=•\Ñ\Ú\ÄiÇ’TGË­\ìS­”þ\à\ä,Nm$W\Êx©W\Ûöu\'C	1\ÈÒ’”¤z’a÷:‚\Ü£Á¸\Ë}\Âð­De yNX\ÕY\Õô˜Z ~U)f \È)?(ô\á^!={K„†\â\Ù9u!\ä¡>b\äY[X\Å)Q\ÓR´µ)?t}Î¬2Gbù³\Æ\Õ®«\Ôxƒ®¤õ\î§1´,\Ú\â\ÜCš\çxü$4\âd\×C¦\à<B·‰#Fe\ÄnkÈ“3”ú†»K9¡\ï\Ök\É´Š\ì^”Z\ÜZ[<p W\ÃI“.C –\Ùi$öÔ“\ØH`¹l;un=Ç­\Z\ã:\ë*,›lŠ\âú¦U\ËU)t-”Û¹MJÉ‹©\É)[m\îx¶\Ò\ê 5ma~\íx¶’c\Ü\ÊV!-³)j—3‰¹Lt™’¸ó+š\É?£®\ÐX¸\'0…¡R\ãJ“|\\·…=ÁpFpcNƒ#ufK‡e\ÔO!\Ï-\Â\ÒÜ2¦V•¶\ãkz\rŒ\Ò\ãjz;\ÉR\Ù\Ç2\Éu¸¿ºn8¨†\×&\á^k1\Û\Ê\"¶=:9aJJ\ä\ÒØ­\0\Êe ®…\ìV¨(Q\ë\"ž·CDW\ÊP$\é\à\Êü:´m.ª@v\íä©Wc(€>\ç^\ßxj;jiw\Í\ä’6;u\ÉvMÃˆÃŽ\év?…Gu$\èv\Ï\í\Ø\ê}\Îû˜°¬<CÇ¸—}\È\áI6\ÙeÈ¯%@\ìr5m-¬\'¹LŽý»Z{8L\É2\"º\Ú|\ÆÒ³ª¡ñõ?1\Å\ë¤Fˆ\Ô\ç$¥\È\í­	HK…z\ê\0LÀ3‹5\0ˆªŠ)\ïŽÂ4Yñ=_óg\ÕSÖ‚rÈµ‘·¹’\Õ\ÅHL{4!‘¬‹\Ú8¨\Ú…\É0\Ò\ZÔ©–×·Of\Ü\ç\È\Õ\Øßµ«ÿ\0pœu˜\ä\×6±\\šôh8Ì‹;\nLPLIZŽ=+ ²õ\Ø)RDõ5\ÙIKhG÷yÿ\0x\ç3\n5{Œ\Óa¶Ó¨b6Š³q\Ây<L\ïys Rò\Ü2²‡%CX4@#T$mÁ¹#\Z”\Ì\Ü=Ä±\ìÂšTw¬½[‘UEµˆ¤8ž\Ë™@}ñû‘,¡•ÿ\0¡WO;ø`dR¯ŽŸ\Êø;×µ\Êõ¨%ù>\íñW™AI\ÕH‰Á\\\ä \é¢vú„øø\ë×²®?„\âR†8^’\Óz (»mvñ%	:n*wU5\'Sñ\ë/\æ\\¤”.”rô¥h€\Ý6#\Í\È\ìœÜ®Ú¦\rkškñ\ëÜ·¸Üˆ‘•r\ÕÝ…Xu\å—Y]\ÃÙ–R´\ÈRB–·»\Ú\âµZ|z÷Wdù\Í¸\Ç\Ýf?ñùÇ›¥\Ç\'`ò`\ç†ùp™“bõ-Å¦>\Í|–£4ô§›–P\ÃO<¤4¾9\æ9\\)\Èô²©sš<\âÖše\ruM©\Ô\Ú[¹‰Ž‰ÀÎ«[i\\P\ëIÜ”ž\Ý4gMz4y…\Ù,•©¶\Ð\\|­` U\Ø|<:¬\ç>N;Iï“1vc\ÐIrLZ¨<ó†Õ²ô\Å9”õ²\ÖMz•‹[I!¤(À’\â!\Éó\âQrw\Ød\\]\ÌüA•K‰*”9µ6•–\Õ®\ÈðÜ¾†ZcH1\Ýq‡a\Ø\×\É@=”•$) ˆy\Æ6ô<s—±ð*ù“‹Ü¨c\Ù\ê\Õm­^tüJ\í\Ä)\Èr@!=\ÚsGA»ˆ‰!§¯}°7huSkFm)23!m´\Â\ÕN\ËJS¯c\âO\\Å’Áu÷i\Ú\Ìe\â\Øÿ\0žRBq\ì4\\\Z•L%¥¥@\ÇPú\0ÿ\0\Ë{“\×^\ØWµ!\ç<“*\å\Û74\"[µ\ÖS“Aµ(Ÿ\0\ÝE\nm>/\ë\âOE*\Zƒ\â:¸Žõk\ÍTI,¡JÝ°\é\ßoVb¼I…\×,¤·½¤„y‡·Ë§€\êxº”Ã—‰ŒK}i.RR­\ÊùJ†ºü:Ï¹\ï£†Ž({\îc´šwTd\ÒU›‡\è\ëó`´ß—\Éo -\Ñ!§6G‘9””¥%C˜ýŒ{ƒ\Éÿ\0ý!\í:³÷\í«1¹}¿QÊ˜§ú–òœ*d™•—ŸWq•\Í\Ì(@(½fgð–Û›¸\Ó°ž™™W·ë‹ž¼B\ÝK’‘[N\â-±\ßN¥a\ãv¬´…\Âò\Øp25“§ûºgø ¿Ž£N¥¿¡VÛ©+\×MtþP{ü:öY‰T\'\Úó\ÖAÅŠg\"cœ[uS1\í7V\Ãù„tƒ¡\Ð:{{ûg\ãˆ~š—ŒðˆˆŽ@LDLRKi\0\'UK$\r<^\ëòQm2~\Äõ¾c—#šr{‹e*6¡[\äÆ©\Ë%>”€u\rt\Z‘\ÇP¨+\ä¹+%\È/¯\\²­\Êmùh\r\ÂRV—+\Ð\ÉOU?\ÝûOahÇ·þµ\Ç9\ßNSW!Æ¢\ÛN¤›\Ë\à¨ó\ÛZ\ä\æmÚ¦0\n\Ê-4Z\Óþ\êxu	©\Æ\ê\êª1ün;Ž\Ó\×Ciˆ5ô\Õ\ì\Ö\Ô\ÖAa)\Ú\ÌXc¡¦\Ò<‘ñ\ïÕ¥el†\à¦[¯6´4¤¥)J÷\r\nFU\Ò\Û\ÙID\Éi•¶\ëªJ@ß¡(\Ô\ï}\Ï\ê\"+\Ýv3Ž7c\Ë\ÜiD†’¿q¸%W4ðš)m|ÙŠT\ÆÑ£\Í\Ék\ÙÕ¾k0‚ñ®v\á‚mGDú«²:”¶\êrüm×‚.q<šµö\ÜbDw\Â\Ï9¥ª,”%À\È \á¼\ÃÇ®.¹¬–¹P²\Ìe\ÇwI\Å3Œ¡74r\æ8¶\Ð\Ó\Ë4••)-¸\ëjm÷¹“œ¤nBøç²Üš­ð€¥~r\n\ç`\âHow\Ê\\)Ÿ\r´\ë\ÛUj{uñ\Í+R­/³¼»\Äk\ÛI.Ì›a[D«m[–u[\Î;\'qRŽ¤ž¸«‰)#G‰W\Æ\Ü}ˆ\á1YŠ4cLrŠ\r[®£ü£%ø\ÊqJñR–I\îbGœl4½Û´\ÓM§_¥Uc‘õ’œp\ÂR¥n\ÜGñA>=XcpŒ\ÚËŒ\Ñ\Öp¼}Å¥Ô¥«<¥j¬L¤\'\å\Ð\×BqùZö\È\ÔõM\Çª«/x\å\Út`–x\íœ4K¥È±g\àý\Â\r¥{ÁM¿\â¡ô\â²AB)\ÛÀòªÜ£„¹z¦\Ã2\â),d°-3N¹·c3}\ÆùýkS]¼qˆ½h\ËQg\Êm-]Õ¼\Ë\éqr5¦3zË¼r?s–*\îuY\Å\è.ý²c/&Å’B ÎœªÉªC±\ß\0:–¤‘\ß\å\Î;¶nó\ä|Z›0Å­Z)™Oy	©\Ñ´™§Ð‡v8ƒ\Ý%I=\Çþ‘+]?Ý“{üÔ¯ø:°“·v–o«]5ñ“ûývž\å:¹ó,ùþ\Øè”–½ŸÀUV»¼\Â\ë¯Lð	\ÓDø\ëÛ¬œ\äJj\\*I\Ô\ìD**¶ˆP>\nù¿½½ûk\Æ\íÛ¹¿/\×\ä\Ù[\n\Éôm‡\\–\Úq\'FY\Êrº\Ç@\Ô\ãi\Ó]\\U\Çø\Ú2\Ïy~\ã\ê¨x\ÚOúH\Ó\í_\Î\ïÛ‹o(Î§7»Žq\ÕuŒi{\ÞA&\Ýø1]!·R1\Þ0e\ä\ä\\©”H^}\Ï‹,¦]\Ö}Ê—\é3/\ì\'\Û9¾dø5’¤º\ÄM\ë!@ºù\Ù/,nJˆ=ºµeú¸\î\Ï\\W¼µù(+\ÞPtû¤õe:\r|¦!31\Ç\Zu¶V”„¥{\nHí¦S\ã×·\Z‚‰,´¯­!\Z,\0A$mR|{xi\Õ÷÷“û-¡†nLG²_uœ/‹EF—-\íT›N|Ài\âvM¼dj\æ[W½²\ÚÙ„%\æ\ì=M•E’%]ñ¶f\Üh™¦7ô%Ç™lŸE’\ã\Ët˜\Ñ2ª \ê—\ãù7\ÛR\ã=«/H¸\Æ›QdR9·>\ÇDw\ê&2,,x\ãn^S6l\Ú\Â÷Ô©Ò¬®%<y>„­¹v:þf\Üp#3k\r–;\Ä\Ï\\s.@•˜¬#	†^£T²ž\Û\É%DJR¯•k\Ñ\'\Çö$\ØYL‹_+‘.t\é\rD‡;csÉ’ú\Ûe†[H\ÕJR‚@ñ=]#*÷k\Ãr/\ÐÄ†\Ç0œ¦7$dFJ\ÃÊœ\0dr ¼tþU\ä$A:ƒÕ¦i\Îù‚%Hr\èX\\	!.\Ñl#_L\r9\ãó\ÆmA?\r{u„e\Ô\Ü3ƒq^?€=Ê©\Æ+¦\\\ß=k>ö¡\Ú&¬²+yRb	“ik\ä:a˜Ñ¢!·žZÔ•ü¡?\È\îdÃ”­\Ä7TVÜ•n$¡\r½¼\î?€û<Pr\\’5À‰w2lh.-2\'Ëˆ\Ó\'£MtX­¶Q!²·|¯$)iN\í\Äª±oo\\\ÉÜ«6\Ö\â=³\Äñ‰øµD\Ù$¯&ÌŒf±<Zf•\æ=\"\ÊlVhnZÒžý{sö\ëZ1sqGP\ãy„U—!.ü¥\Û+¨ð!*‘]\Ò{±\ãºR’\ë-%e)\'hÿ\0Ã²®Ÿî©¿\ÂÊ¾\çV²v\ê\ç¤kÿ\0\Ú4\î>v~2Râ›‡Šå²ƒ[·!G#\å>3‚°–ÿ\0Š²œxŒ4\Å\ê\Ò\îK\ÉS\Ñ„0\n¾pXe¦P\Ô÷\Zƒ¯o\Õ\Ùý”è˜®c×™,„\ÆzÀ\Ö\Òf™Ï­·z5zF³$wŽç–JÂ’Ÿ¿gý\éœóŒK¨¨g‹\Â~Àø\Æõ•5ÿ\0½¾\áñ\ÞÇ™\äkv¢3yw ¤Hü?)*l÷RŸ(ÁS°¤-!IP ‚5ú¸uŠfŸ³ôÎ”¢‡\\+\ØH !%Z\ëÕ†\Úùµ\ÍDžµ4¥4\ìr\\\Õ:¥jRqk»u¥§#¹¿:V\à¥%µ4¤l+V\í;‚4#\í\êû0\ã\ÈõõØ¦kqef\æ9]£pñÛ‰92g\Ñ\ã¥	n=\r‹ŠSˆŽ4L7\ÉCc\ÉR\ÐIRŠRIJI;RU¦\â®€«h\×\íÓ©ü\ÑÅ”øþPœ‡™‡\åØ–HÆµ\×ô\ÎÉg\r£9„‹\ZõD¶†ÓŠ1\Ümn5½’¢•¢LLG4À8‘\íƒ\Ñq>\r$ê¬“6‘˜d\Ü^¿1%€@¾\Ùv¼¥\Í<\ã\Ìr§\0Ì…\ß\å™vO-|\ÉLT0¹R+¡DOp\ZJ[hw\í\ã\Ó^®,:\Õ:F\ãkhË’S¯`j\ï©\Êóù*Jtø\é\Ô;þI\È\å\ÖVY\Ì0\êY§¬Bg\Ù<\Óa\é…õ\'/¢3*\nu\Â\Êkz•¹h\n•\ÓÇ¨\É\å\Ô\Þ]\'!‡\"S²­±Vœ°’š\nËŠä­†\ÛôÑš}™\neMI[’Zq-·ŒcµM·-\×\Ñ,WCi\Ê*òÐ‘›F\ï\0\ïÓ¸.?\æÛ®–\å}ÇŒw\ê-\ÙzW\ã´w.\Ã!R\ÚB\Ðv;«R4\ë†øY\êö\á\ç*SŸr«¡¥µ\"O\"f\âÍ·-|È‘E	¸Õª\å\Ý¨~ýÀ½Žô”6\ê\ëe$$¨O”~\î½úž§e°ÚŸ°8°© oQ\Ô|©×¿\Þ\ë•2<È¹‰\Æö\ÉÊ¹¯ðž ª¨‘Á1¾/\Ï\ì`A•b‡Yu\ëLƒ#¸¦ú´\ç%-\ä¤š	Œ\ÛM¦/2\ß\ÎA¾4Ñ\Èx¾šIb\ÆnnÌ…Ä•Sƒ\ê®\Æm”\Ú&‰2½wT\×\åm(^Íž\è°ûˆü,2,\Z&mñd–¾·Žð\ê¸L\ÒPÏ¾R\Ó.l´Àó¥<ö\Â\ë’Sil6š¼K‡½ ò¼\ìW‰\ÆklrŒG…¦†\Í}K0\àWÁË‘˜\Ñ#¡¶£\ï;H\Õzö\é\Äq¯³>œ—\å?œr\ÖIº>‡\Ëó\"\Ðã˜ž×Š»«GHÓ·\Ý\é\Ôcœ{\í»J\Òðm\Øxf[o!•8O”´¼\â|u€Sj\n>=»u¹^\ä bLzu0#\â<m\Æô-‚	ÿ\0PœiÉ…ý>%\ÒÀ—#÷\î!-	Œº\\k.»«¬’Q«j¥\Ä\Ä(O-Â”\îü‘Rþ:\ëÓ·\\½p¹n™NÏ¸‡”%r@JKÊ‘9–Jœ ¯Ã¢Üª›°TT²l\æÆó“ó•·6Å·’²|uN§©3M\\w\Ñ¢û‘\ãØ³\"{­#B\è‰:d!\Z¨6\nöT@(qµ!Ä¥hPðRT’F½ûƒ\ÕŽcöY\nKŸRº^\Ã\îi\á)*\ä\Ç\ÙI¡º\â\Ò\ÝQN\ß3Dê²”–$\ÂÀ\"W)J\\¹\ÎN–\ØQ\ZJ´T×™?\æ)#_\r:#\Ê\ÔólÄŒ·‹k\n\r %D%=\Û\à:ƒŒ­\r®;VM°\àV\ÝKÁ\n\×ü¬ÜŸ·\'±õ]{aÆ¹39\ä\ì&\ÊtzWr~+“Œ\Ô\ä™6EZKqº÷²l!7šš÷\ËF\Æ$§ƒ.ù\ì´ÄŒ×–¹IŠüz¿œ1\nTñ\Þ4‹šû;kª¦Ÿ·BrkX5²d·K(˜\âb·%I–\ê–U\å6\Ø\Ü\ç\'óä„´\Îg‘ø}\Å)y¶Ö¿\ÏLº<\Ô–šq\Æ\ÊÓ‰\ãq\çY…\rÁ2#²…\æ¢rž_Oë¸‹\Úû™\å\á”\Ã2k\íó—\ä©85!‹ˆ}2$\Äz[\èR\Z+€”©IW\îˆñ\Ð\éû\ÝKƒRÔ·!©°\ÐZ†Ýšx$}*\áõÉŒQ(©iYS~n\Ð\ë§V¼¾\Þ0qn[È °\ÎI˜\ã2S¼ª|8,W\×]\å´N¶õmÅ¼8qeR#K’\ÃIC®¬¥\nKõì¡‹\éÒ”¸“¢¨”µa\\\ê‚Tô7ˆ#¸m`¡`(t˜²\Ùz$§#·-¨òšr;®\Åyq™M6òP§c:Û©R\\H(!@ƒ\ÜuW™\ãv|…˜ŸO\Z&YEv=Y3ÈœgW`\ÙDM\rŒ\Ñ])Æœ\\	a\Å31€t(u2\ÊU‰ò«…6›¬¢ÿ\0\Ë\×Q¢‹T‚‘\Z<£¿‡M&·\Û\î(6lT\Ú[…|¿‚T«yS·«\í\']\ßz¡\ãš\Z\ÜRU¥>M^w$¡[\ãU´²¤\04:\ëÛ¤ ›Ø­:{··£7óv\'cIB:rM²­\ÚÒœQx¾¿\0Oñµ:v\éÚ»VÖ—P¢\nH:…ñ\0ü:É²\ÔGq˜µu\Û–~D¦\Ê\ÎC5A+PÛ¿\ê›P:$‘\á\Ö=\Æ9\Ý3\×\\Q†cvŸ!Fõvpš•UT–\Ñ²M…[ñg\Ç3\0½·›^÷\n9E\Ä\ÜI†\àõÒžn]ƒTU(L«I6†‘&\Ú\Öb¥[[<\Ûh*’û»\à\é©\éƒI	½€\0C\rƒ\ÛO±=^\ÕVFm¥š\éIO”\ÚA\Z´¡¯\Ê5øô¨!·\É7ECðÏ‹úý{Á‹=Í“_ö‘Íµ±\Òë¥¢§,¸\Ï ­BBˆ$z­;xøuÂ¼W\\·‹\àøG¦h©iF±\Òò\Ð5\Ó\æÃ¬g€±&N3Àu«\ÅdJe\æ®yS ô³\émª:•æ®ªDhtiBµSo\Ö>FžiŒ¨\îª\ÄT\æ(±y‹•y”·9‹\\¦c¸\ì…¥ô#\ÆLv\ÔËÙ˜\ì\ÛqýÁ•\ê¶\\	RÐ’uRH \èGV™%RñŠ\Ùu\í#´­tQþ ûI¬°a\æ_a\Å ¥Ô«_”‘üm>Î™Æ²©O\ÔœW\Òr(m6\ä\ê)Î§\ËL\ÆZuHndUjˆ«RQ!i)PB\Ó]\ìóûÆ±ùj\â‹\Ö#1\ç\ìQÆ•‘ñ¬W‹:Ár	‰ò¬ñ•%È’÷\"ŽÀœ\Òc¨˜\ØvW_‘@\Ëø\×9e\ë\Þ÷	‡G“/Š9\×µ)Ú»®©M\×dQc…\Þ75\ÏY] Y[¥‰e¼N\Ï\Çx\ëÜ¾-§r\Î8”ˆ\Æ\É!´–\Ð\æQ†8\æ\ÕO†§Ž´„¤´¢“µ¶ùx\åw\Ë\á¤F~\Z\ât\Î=m:#2?ú=ºM!§\Ç\Éoü\Åøusbka2†a<A, x ŸN\ÐU6\ÚÒ»SFBH	”\éòõí³ˆ+b\Æo0\ä\é—½—8‡[!bØ»*\Åpè’£ƒ\æˆ\×÷\Öö¥J\ZÓ‚<œ—\î†ö¹–\ïy\ß/8\æ+%\ÖV™¬\àø3‹f[Œ¼¤¥¯»\È\\D•~R}?f\ã\ÌHPôOv?æžRãµµŠQ%#A£šøýî¹ƒŽke4\Òò&\Éiaµ\0T‹\n§\"-A\ï¨pŽ¹c\Ü\Ý\äv$JÁ(k\é¸ò\Ïõüu\rº|.\nR¦\Ü±Èª\ÂJOò/;u‡\Ê\Îb\Ì\Èø\ã‰\ç;\Í\Ü\Çke\çIM\ãõöbeM]¤µ2\â$M\Ëò\ç\Û…)8\ÑyÀuI\è\0\0\0h\0\ì\0\0€¸S©\í\à1$IŽ\ë_•l,ü\è)û5>=Yeø:Œ]\î\ÈPŽÂ´\0¯ø£\ÃNˆ\ãNB±†â“¡J›PR	q]\Ô:<-\Î\rHús.½+\Í\Øe/d<yHi,&\æ™N¸Ð—_ !°®q\ÄÆ°a +k¨e\æ¯ÿ\0»3ûÎ±v9—\Ø÷+.\Z±¬Ù\Éÿ\0†\Ï<\â¡bü·Ä¹K¥«L}Š‡,\Èa\Øó)\ÝJ¢\ÉJ\Z\Ç\ã¾~\á^E¸Í½¿\ä—qrŸl>\ï8ù\â\Ã2\Ü\ä\Ú\ìS9r­(‹‹r<()\Äur\Ê\\`Ks!Ã§\à®xS{¶£­\r][5ø\ç2D„\Ø¼\ÄJÔ†\ãd~RwÌ«ü-uq\È\ìŸ\Ø\È\ê’\ËË¯Ï¢µSj\0þ:žšt¶\äô;¡(\Z7©\ÉC@	$ž³\Ìss\ë˜\ÎQŽ{m\â\æ¡Fpj8öBp\×Ž\ßu¾\Õ\ÎríµšV\0\nL\ÝGm:\ã¯øÅ•A\ã\Þ*ö\éÄ¸&KlüweË›’¿+S«\é\ê+Z~u\ÞG”\æV.¢,HÍ¸\ëÏ¾<¡3‡8º\Ï;Àù)mM™Œb|±CW\Î\Í @J”\î;&–û\"«~tx\ÉóWrÿ\0–	HV‡N®Oþ\Äÿ\0þ_óõ}q-ô2#\Ê}`©A\ÒI\×S\× \ÕD–\äˆ0q;W	YZl´	\×\Å v\ëŠ=¿c2Tkpvu\ÈhaK\rXrfsX\Ä\Ú\È2…&K“\ÉZwyr.%µ®\ä‘\Õ/#\åµ,{¡z¿”2#\"3ŒX\Õ\á+Œñ\Î>ÿ\0›óš©.\Ùü¡!_RHP%\0þ\âN§¶„Ì\";‚¶Ð­\n\ÒSüa÷z±Ì±\ZÕª\'˜ä…¡†ŽÐ\ÅZ|£N¤@’É‡mKFŠN\Åù\ê5\îQÓœK\Ë\ìHúKR—ˆf™C·¸%\ã­ùµ©q\Õ I!!(ŸÅˆó™\0+k¨i\æò?\î\âþñlr¯™}Žó\Í\ç{\æ\Û\ÑPQÝ¸\ÜzÌ³µy\Èó¢cÌ¾\Ó.\Ç}§cO ›°W\È\ìÈ…Šûªö»š\ä<¡\ì\ß*¾«\ÈøoŸ±9Ï½–qÄ¹ªƒ\ä«*v£š\ÉlLG§«\È–bXº\ZJb\Ø(F{ö¹\îúþ«÷4j¬\ç)š\ÊfCK,A–\á\rÃªÏ¼´¦\ÔPÕ‚µS_”%°¥\0I	\'DI\Ðx\0<OSðgršhªB\Ð\åL‹ˆ-Y¥>\0ª¬\Èõ\á=ÿ\0òZu\ÈÙ¬iw™G0+\ÈQ€\Ã\Ç\ê\Z‘_M™\Ú\×Ê­\Ä\ï2[cÀ««¾Ì—[}\×R\Ö\Ä6T :\Äy‹£\Åsƒr(Y3g’­$\Æ\Æ\É$\"{•†_nu–\ÛW)\ÆPT\ä’Òü-z\ÈW\É^÷¸ƒ‘¯°ûJ¾K\ã?j˜_S`Ø®_˜W¢elˆ\Ò9:Áœ0W\ä±Œ‚\É5)°f\\)”–\Þ~?™ç·†\æ•XžU\ì\Å\î\È\\\È\Ù\ç~`\ÃYr³\Éi\ã<\ållo´µ¨•\É\ÎY\ÈXaI€\ã•\á—·¤%\Zne\ç©={\ë¡JTÓ­cwù\0r[›)fKP2(U<z\Ùu´®\Ñ\Âò‚\rORû\Åþ\ë¿y&óþt+,ÓŽ\è {€\ã\È(V“Ó™ñr/ib£a\ß\äÉ’\ÑÚ“ùM\ÃA{ðvb\Å\ËO<\è‘O=\È\Ôy\\N\è\Óñ\É3dÌ†ü•iöøk\É3¹3×gøm­&\'E0zLe\Ø8\Üo­]-\çZMe[ 9³]_}i!¶\Ôµ\'‡8n\ÞA^#\Ñ\\ƒÉ³$\ËgÔ«\Â\Z\Æ\Ú+®CoK•j´±´ 8¤—ÂŠv%ZAª«‡\Z¾²²jú\è\ÙDx`\Âe¢C‹¤¥¶#FŽ\ÚP„$¥)\0\r\î,\êk˜,ILˆ\î7«¥DnIµ¬sl6µ\Ñ8ô—Ž\ÑÙ°-K#\ågR¡[4˜W’´\à\r¹\æ6ø€u\Ôt\ï\çn/\ÐF”óø¦Q	z\×¶p½|¥\'\ÕWKJR‰\ÐV Ì¶€üPÓ­\Ø{@›\î‘\âö¹-\Þ5§\Ë-caWl¾ûp\ä3e‡cªþŠDxM9\n<ð\êb°´¥	@ùCœ\×D¨i\Æñ¬ªº–eFSL\ÎSŒÞ¾´¿Mbö<Í›9\\(OJBC\rG,!ý ¸…\Ô^÷=\ï\ç\ÜöU\ãu´œyŽq^GM†³ž½\\£E’\ä‚¤Nº\ÉhGL¤I2F¬°Ÿ3\Ëij\Çñ:ªú\ÞD\í,où0¼\Ëòy‹RR\ì»/9\èTÎ¾ñN\âQ\r	\'¿\Ù\×\rq;q\âS9\Êgòm\Õec0\ë¼\Ê,WZs\êpa%•¼Ååœ·Y[©(.Õ’“¹J^G¤¥±EN[›Z9Kl¯d\æi\ãÄ…AI\Z©¨©yKAð>¥c\àz*ªM¤W\Ò\ZÔ‘¢uð\nû=6Á\ÛYZ•.L\Ùn-˜‘\ÚhnR\äIyha†Ò‘©*R@Œß“©n§FQCµ˜|¯\Ï	¡m•!nR.Uk*N\Ý\Ù\Ô÷\Ðw\ê\Ë\Z\ànzeŒ¤;¼Ã“rGbCC*l¡O·‰bžLµ­K?(UÀN\Þ\êIü¬ó\îPc6Ò’ö”x\Ýmg§Xw\Ìi˜ó‹o\\¼\Ïý<—–¯‰:õŽe™vš\Ñ\âù3\Ók1L# ¼­£¼‘T\ÛRf\×Q\Ú\Ù\Äfç¡±).©–V¢^ð6\êz\à\Þ5rº~5“}—ò\Í{o¦®Ÿúd\æo\æ zxñ¯&\Ëf#\rº”IZU\áû>–\Ú2&3´%D%Iøƒöõi\á\ÐDGœ}\Õ&;j	\0©Jþ(\ÓMO;:´:Û‹Üµ6±\Ý\'¾¤zcC°fqS\rÏ•U90³e„6\ËmØ¡\èò\ã¼\ãL6—’„>J\ÈJ@~\ÃÛ‡&\Ó\á¹ñˆV®5\ä»ig\Éd4„­ˆu£MK´Æ¦>ú	É™ð\Ô\á•ˆ€H<s\î‹²\î\'\ÌQ\æË¨nú M^G\n#Á÷	Ê«^—ŽfÁÍ¥3j\æJe$€¥%(\ÂjýÁ^\ÇÇ²H\"D‰\ÉÖŽ!º|’¹¥§d<\á\ÕmDL†\"Œ\ÙöD\ä\r’©\Ú\ëù•žU7‹±ñ>\âü‰–¤B¨Â£¦½üJ˜\ÔwþŸu—\Ù[Ú¥Õ¶ÚŒii\Ô\0\\)\íÏŒ(óŸry—\àt\Øå²°Œz/…½•­“i–>¬\Û(Lg§CFC>CLJ‡Y=·\Úm%+R6¨\ÚS{w\ã$ö\í‹\Èi\è\Õ\ÓÝ¨ÿ\0ŠüF×½’«Ì¡¦q?T\Z .‰\n\î	 œ™\Ëü\Õ\Ë|»,…2+&]\ÜO¦„—«j.;X[£ªi\Â~`\Üv’{kðé°ŠQ\\—€ùç¼©R·ÁO¤®L\Å\î\Ó\Ä8¶´ûý&\Êmmý˜J7­¸\Ð\×Y	d\rt\ÑD\í¿yôŸ¹\Ô*ºü(\Ã}3\Z\Õô@q\É[’½7*[\évYPû«=\'8\ç\äl2\å–Wg‡rN%K™cSÔ†\Ô\ZrMM_c\\\ä†BÕ±\Â×˜N\Ò5:½‹poq—\ãr\\iùT\\a‚\ã8%\\\Ç\ØB\ÐÌ‰°±š\Ê\Æ&Ii(%\ÇRµ€£ß¹ýÈ‘[w‡ü\ÖÔV\ÒFºý©=ú³z²¹”¾\èum\íe¿\ÂV¤hA\ê\ÂÂ†¦Sñ\ZS®\'\ÊaDmN§ø©Ó·Q\ä­u\èƒ)À|\æ\Ònk\á\Û\ì\é®2\ä:z¬º±(i\Ä\×dÚ±f4\ÆBKs ™OV\Ø4´‡ã©§’Geª‘Q&ÁúË¶-i›™\n®‘_\"(0\Z°	K²\Ûr4Ä­à§€mD­~)¬¥‚”ªe¬\èµñ÷’K²žC)q\Õ\0¢†\Zß¹j\Ó\å@\'\á\ÓLº—Kjp¡MR\ÖË”µ\Ú ¢d\æ\â6\ÑRt\'V\Ú{w\ê*\åa\ÓfùªiJ“|›\ßp ˆV§oþc_¿\Ô5\ß\ÄK,)F;q[e”¦-!´44ð\í\ÔWf\ÓBuÖ‚\n‹‘\ÙQÜ<F\ßGB¹œ~¿g•\åöŠ\È\Z‘\ÒnF?XKž`>‘­u\Ü;\ì\éš\êxŒ\Æa”%-!(\0¦š$Ü­\Ä¨\éøw5Qd¤(­¤+]A{÷\ê\ç\'\Å\é™D\ÄF‘ zvR¼ «Á#_Õ•“‘)Æ›Zôì½£\à:n¯\'¤˜º‰.!Ô¸\Ú\äÃ™@J\Ûnl	\Ñ\Ô\Ûð\æ2‡T´«ºTR ¤©I5™\Åú³¾\ê¿c\Õ\Ìf7P§\Ô\Ö\ÉùT™‘\ëk©©Ú‘1‚?&©%ô Á;‚T#†\èk\Ô\ãA\Z¨\Æh¨”©Ô¤žút\ÛuÔ\ÚòÀ	!”‡\Ü\è%–[m hø‡î„š‹&\ãZ[K\Z§E‚ž\ãC¯cÓ™‚•…ºù}M¸Ô€¢J·w\Ùcøzb\r:ò¶”ù¬2F¤\r5m ô@H\0\0ð\ÉD\Ë\Î\î«)\ØR\Ðß¨´\Zt¸\á\Ú\Ú‰Ž²Àq\Ãø)\×U|5\ëú}…ÿ\0Zhœ:þŸaÖš\ç¬§\âY5´zÀ±%\ê»(V-4\ëhS.;\nCÍ¶\èB‚¶“»E¦„ue\Ú\æØ¤;\Z¹.$ÌŠž,¦Oñ\"ko²²’ŠH:|4\ëú}…ÿ\0Zhœ:óÿ\0\î\ïMý§ùŽ\Þ\êFcªJfB”Ì¸¯¶”“½‰1\Ýq—H#T¨GR\ë\Ý\ÏpÔ½\r÷c¼…\äôI[n´²…¡iTð¤­\nI#C\×ôûþ´\Ðÿ\08uý>\Âÿ\0­4?\Î8\î	{Up\ÛN)¥=W>-„1\ZokÏˆó\Íy¨\Ü7\']F£P5ý…(ø%%G\ï©\éþk“\Ð\ÓNt¸n\ÚÞ¾¹Où[|\ÒÀ›!‚÷•½;¶\îÛ¸k¦£¯\éöýi¡þp\è\Ïü/¹ÿ\0½4?õþ•”\áÖ,«RQ.¦e\Åy¤‚|\Æd\Çq\ÆoT‘¹*#^¥b96_VZ\ÅÔ¹\Êò®¯/zÐ‡½<\Él½\å8¦\Ô¶\í%$\Øõý>\Âÿ\0­4?\ÎV\â\ÔÙ®+:\Ò\Ñ\à\ÌHp²\n‰r\ß^…JÆ5\Ç\Ý(@*!)$$\àC:¾59ˆf\ßu\r²\Û)O˜·\\ujJm¶Á*Q:\0	=ºZ…ª)\Ôe4:š÷‡‡_\Ó\ì/ú\ÓCü\á\Ô\Z¨ù\æ\ä›	-DŽ\ÓY5#Ž¼û\ëKm2\ÓhžVã®¸ ”¥ ©D\è=A\Ìr[ÚºÚ©­´´Ë±\ZD\Ê\ÒW&S\Í2…8µ„¤N€jO_\Ó\ì/ú\ÓCü\á\×ôûþ´\Ðÿ\08t\ÄqŸ\á`¾\ê\Zö¦‡\Åj	ÿ\0\ÌrOMòM¼(´J‹\êÜ—&K1\ã0\ÈAqn½!\ç\Ë-!U)D$©=(ÿ\0 ü\é¡ûýC§šÁ/\ê.¼‡<—]ª±‡b\Ëo\0•)—†û\í¡\à…RHVŠM\ìJ\Éò9-Fƒ¥º\ã,6„¡´•-JZˆJR”¤’O`;ž\Ý:\Ð\ä)^ZÔFUBG\Êt\ì~ u\éxþ“P\ÜNh <Š«zû1\æ\ê\Z2\nK\å\áJ¶•mÝ´é®HÊ²‰‘\á\Ö\ÇaR~C¨e–\ÙB®:\ã®)m¶\ÛI*RˆHÎƒ¥ gøYÚ¥\'Q”\Ð\éò’;¨wð\ëú}…ÿ\0Zhœ:c\År\Ür\Ö\Ñ\í\é«.«,$!¢¤¶[\å<\êZó¸€5P\Z\êz{+·}\rWµ\È+Q\Z\î\Zwøõ&\"ó\ì3|wœe`\å@¥m¨¡I \Ï\Ô)$hAð=O°¿\ëMó‡_\Ó\ì/ú\ÓCü\áÒ¥\à—U—%jo\ÔVNaKA\ÑhLˆo<Ê–\Ù\ì ©>=}K;¹­¨‹¹)T›9± \ÆmKPCirD·Ye\nu\Å¤\rÄ€;ö\ëú}…ÿ\0Zhœ:þŸaÖš\ç bt–1ck`°ˆð\ë\ïªf\Ëp\ëSq¢\Ëuå¥´‚TBHH\Z:>:‚™”\Ò]mCÀ¥cPG\ß´zCŸ€\Ëjq_\æ¤jzc„-9_\ãûf\î*²0«\Ë*¤HTj™\ZŠ¹¶Õ9÷V´%Ô«hZ\ï¡\Óõ­\ãÆ¡ý2\ëõ­\ãÆ¡ý2\ë™*1®R¥\ä(¶w’m$\Úcë†˜%\"Š¾Óô6–\È2K\Ð\éÜ´+kƒ\å\ÓBy£%·÷#ƒc6wyÅ„\Ü~\ÑT\ßP¨}ÿ\0(ª³#)†ùu°ùšl\èGn¿Z\Þ7üj\Ó.¿Z\Þ7üj\Ó.£\ãt™„l®º“š\Ä†­\Æ\Äd.\\\éj‘E—5„²¤\r®¯º<u\Ô•÷}\Ôq\Ó=r\ëŒ:h¼\Ör\ÆJ\ÖÃ»³1••jp{uú\Öñ¿\ãPþ™uú\Öñ¿\ãPþ™u’\Ðc¼‹Q\Èu\Ò3Ke\Ü\Ñ./ nSðj\";^S\ÊÑ“&;pµ\ê\àVŽ\'\åBz´·˜ †\"DyÅ¨ø\0WQJ¹\ß\ÂgñÃ™Lú\ë;*I’\Òý\Ë\ÕRÄˆ\Ï\ß\ÖÈ®\Âk’J“¹+A \×õ­\ãÆ¡ý2\ëõ­\ãÆ¡ý2\ê&3Ym57>4,†¹lý>\ÙK°–§\á&<¹Ì†’ü•66:¾\è:u/\å¾\ãø÷lD‹*¹û*5¥\ÚY¶E\Ç=G\ç<% \ï–P¦\Ê5B{Ÿ‡\ë[\Æÿ\0Cúe\×rü¿s|uo½zÁ\Êö\ç\ãõ\ÅôÌª°©;¦«+’#¡¤\Ø“±Z„\éñ×«V\ëò8µõw\\uo[\"ð¼Û¡Á¶¡“vÎ¸_i‡aÇŒÿ\0œIq(Sc]Àw\èñ[\Æ\Ç\ï*‡Oð\Û.¿Z\Þ7üj\Ó.¸ò\Æ?º.>°‘_›â³£ÀˆhýTù\î\áIbm™{«õ\Ýh6£¹C@On°ünÿ\0kpj\É68­ƒùÛŒ\Zø\ïB’—X†òfO¬gÍ˜\âö —A\Ý\à_­oþ5\é—_­oþ5\é—Q\Ò}\Öñ¾‹\Êz\ÙN¥>ž]üz¶\Âi\ïÜ„›œÑ®Ø´¹ÈŠ—!4Ø–¸‰}RÞjPN þVT—\èp\n\ëZy²k¬ Mfš4¸s!º¦dF“\ìÁ0ó. …!I\nI\Z¯W·­e\íf¹~Eù\ã\Î_Å™MO_,%¹ö\r\ÍC±\ë’\ê_	R]\0\r\0\'¬\Ëª}\È\Î\ÍÇ® )öÁQi3\àÈˆ]-\î@s\Ên\ÚH\n\ÓMGWXfY\î_¤¾¢”cM®µ‡U[9­\ÉK¬8ô)y{r°´­;‡tF ƒ\ÖOÊ´<‡;\Æóøû1&T@j$OÊ¹RŸnl{kFlQ!\Û$”¥£Ü’@Î°ú¹®Wª\ß\r¾ zZ/zT\ÛRL¬T“\ÌhIÄå²¤\ï\Ón£]z¸\Åò/s˜%M\Ý\ç«ì«¬cTA›K$jÜˆ’rö\äGYJÚ´‚\ëõ­\ãÆ¡ý2\ê7/\á|¯S\ÈP\êgâ®š\Ó\Ô?gMa%F\ÖÝ£*1ErR¦v\êK€’4\Z\Û\Ä\\•°\äzWYRÒ¢’TRI\ÇqÕ™>\êø\á\ê3µA4;}Sº¡_ö\Ä|\É=aß¯Ö·ÿ\0\Z‡ôË¯Ö·ÿ\0\Z‡ôË©![\Ë8¦m.\î\×%D²«T\É\Úø\ëw\ép­¬\ÞDx\î6\ÚT\éV\Ý\î\Ø\é¬z¼ò¯¨ŸsY/ ¸T§0¸V\r?3É•>¶>ù®(!\Zº\ï\0|:ýkx\ßñ¨Lºýkx\ßñ¨LºâŒ¦‹\Ü›ZWÉ¶n>9Hª‘c53j\äA}ÆŒL–\Æ@n$y*u{ZWÊƒ®ƒR1Ä…\ïÒ¶7Í®ºþM>\'\âif• \Â|\á§\ä\ÏS\îsžp«\ã»vq¶ë˜¥°U2•_\ê\ÚC6mýB\Ò„¶ä‰Žµø*A-v:\ê:”ÿ\0s‹ù|YNÁ]5\r=¬A1„¶§\ã£_–\ÃÌ¥\ä\']@P?¿µ+\ß\êL\Ò¹³\É\ç\äjË¬ß¼2¥Õ±N¨«úD:\ÄDDv%\Í\'l=\åjX:¯M\0\ZžD\È9+cà²¹%·È V\ÛÃ¥Œ€wGL\Ö!?6\æ#³›Œ·T¿-;|À~\æm/s\Ñ\ÊU\\\ã,O‘GMIl\ÜI§Xaóü†œu¤•$ó\0tð=\'ÿ\0\í+\Þú\îT\Ýü\áøuƒ$\ÚJ¸™OI\"¹›Q\é\åù2\æ)\å\Ãe\Ù\r\Æùå”„…¯@5$ž²¬™\ÞR½LX\Ù\Úm8myòÚ•%ùIhº/P[K›wmN\í5\Ðk§WXfY\îfª—\"\Ç\æV•v1ñ\Øsa¿±!#=%\ÖV¶\\JÀP\×j‡Qs:\æ+Z\ì¦U}Œ^²|I\ÑW®\É1¤³|\Zu¥\éØ¤‘¯VôWyÜ‰6™ü‰s¦Ö±R´®tJ\Øb\"\"±&bKl·Z¼¸T¢³\Ø\0\ìeˆq\Ï-&®Vª\×M?\"½{®h¾\È}\ÈRb÷–Ùµ”\ë\\zR±õH§šòZ.\ÂtÉ»#r\0\nù\ÛJ€V„v\Ô\ÃÌ¸ÿ\0˜,¬¨¬c56º|^²tI°Ÿ@q‰Q¤3~\Zy—› ¥I$zþ)^÷?÷&\0ÿ\0ùÃ§8\Îú\æMª±º°Û³‘5\ÏO[²&NS‹ˆ\ËÏ·\ï–R¾\Éñ\'^²R¿tøû/¿‘\Ü\ÆQ\ÆJ\Ø}\Û9\ã,›öõ[.¨ ©Ôt+“¢rÒ©DOV6\â0ß—\æ\r®\Ý)ð:i\Ôú‹?t\ÔPl*\çÉ­±‹!\ÓoÃ™B\ãKaöÕ‘6\ìw›RV“¡z“\Ó^:ºùœb¼a\ÒÔ…˜±“RÕ£\r…\ÏEp<”\îòÕ¨\0\èu\ê÷\Éý\ÎT\Ô_c³Ý®´®°ŽC›CA+\Ù&+¹šÃŠiiV\Õw]E\Ìxó˜,¬\è,#¢]uŒ^²|9\ÑH[RcIfü4ó.¤ü¥$ƒ\Ö‘?\É×5Ž\äôW\Ë`\á\ÐYL‘Oi\ÄES\Âù\ÒÈcl+	VÀu\Ð\é§T\\Múeˆ\Ò\èmev®²õ3þ 0a?\"\"V\Û\à©^bJq¯pf\æy\×.\Ú@¤­Œü\éó%âµ\ãC…µ=&L‰ß–\Ùe†¥)J \05\ê›\Ç}\ÏS\Ú\Þ_ÏYS[	œrLÉ³e+c1\ãGk S¯<\áðJF¤ö\ê¢\î\'*Þ¢¾yŽðZpºå”´²•\n¯ŠJ¶žÚ‚5øua†]¸K\Õø\ï¥*wð¦„\Zý\Ò©Ó®[¶¶÷3EEie\È9]•#\ç/SÎ›o*Tº\Ç|\Û\Ö.@}\Õ4w!\Õ?0^°:\ÊKF®««qv¶¾Ý¯$¢Ö¾\r4(°¬\Û,-\ÆJ\'\Æi.ŠR4_bFŸ±’¶ñ	B«djU¦Ÿ\ê—öõ\Ìù?¸Z\\.ú\Ê\â–Ì£A\ç\Ö)Š˜0\ã…ú»ˆr@•3o€¶ÁÏˆÓ¬b“\Êcft•°&&·%\éK6\íÈ´°˜ó\íz7dGfT…·¢\\Y_s®½e¨{@ƒY\'R~‘^¿Á\×4_d^\ã¨ñ[\Ë\\\Ö|\ËLnG\æÿ\0ŸM-\Ö\Ø\ß	\ßSw\ZFô%)W\Î\ÚT7wV®\ß\Ü\Í]b.kX¹©T\Øø\ät\ÙTJSˆ‹g¹\"…4 ‡ªTRt=W5F{‘*NUuaõø~L‰Ï¢2+€¯—5\äDFAV®nü¦¤§Y-$5”ºº\é^NÅ¥k§ˆ×¿nÇ¬—\Íý\ÉAÇ¯«\æ»!\Ê\ëˆXõ|\äÅ–ó\ÎEyqž¿mÄ¡Ôƒµ[R¦ iÒ®ø¯š\å\ßÒ—_e‹Zœv¦\Ò‡\"¼¸òPÔˆ\×þR–\Ã\í©\n\Z\ê=E‘\Ë<\àþ9]*SP‘esAOUÕ¾¨ñ\ÃÒ¯\Ãe\çƒJÚu!$ø\ÕE\Þ\ÎU\\‡pö7&µú8˜:\Åt›ªYÙ¬\×\ÚÎZbD&š?(F¯\rNºu¿—A^Á£º]œXmOq\n¤}C&+\ï\Æmm\È\0¤«\ÌIFº÷\ÓB˜h÷S@©K˜ˆe#+T…:K@~qwQt\íûýC\É\é9JôB˜\Ú\\@üÍ€\æC]	úú<:Áyzv}ot\Ö(\å‡û®F3±™Î¾EjœrkV\Ó\\i1‘$¯D¶J\ÈP5êž­\ÂK\á0Ê‰ÿ\0)\r¤\á´™xÈŽ\ëC\ï­$ui\î/\"\ËrªV+¨\rb\â\Ó\ZŸ@ºøSlm}S\Æ}l¹•Op+j¶lHùu\×[L~0A¼­Ÿ}2üÌ¹jkòÌ™¬AŠ\ãIô\ìvR\Ëm@Nß“RI\ï\á¤,\ç\0›_uCb\Û\Î@³†Ò“Rc\É~‚„\Éb<„©™qœmAhI©!(Ba\ív¡)ÿ\0£W\ØX£¼¹\É\Óp	pb\ä\í\Ñ1LªF‘\"¥vN¸—i­•ü‰\æX\0‚\Øü©\Z†GiS\Í1ò94\Ú\Û	n^·%\çz²<ˆ\Í6À®\Æ\â¤6¤IQVä¨“¦„uC\Æ\äiù·¶•ô\ÐL+¤ªDû-B‡\nr‘\r¥\É^JT Or~«rh(JXž\Ãn\ì	\0\r\éÝ¡Ó±Ó¬¤<\ÛHA­“¹[ú—>;u\ëšmsNrµ\Æ2\É\ÙQ~÷Œ¸ªb®w\Ó\á6˜\í\î\Æg(\Åm·\nK\Ë)+#Q\à0º\Ì\ëóŸƒ\ÇbŠòG”\ãÖ°\ÝZf:S\Z\"B\Üuk›Û¦›F|ˆB?\ÍHOø€ý‹º\ÔR»o0’;\è\\mIøz\ä¿p\\—\É~7E•\äNd7N%T\ßI©]”ˆ°Q\éÔªI“”Ã²\Ým)\nó¹\Í5\Ó\Ã\âwyVŽen1S‚,\Û\Ö\Ï\Êz$\Â$\Ê\\j4]XN\ålBSß°\ê³4§j:\âX\ÅbS.!\r©5!´ºÛˆ!=\Ò\âûeÒ–€ƒ ¡ …(6­\ÛOz¾\\¿q—1œs*²T¦’\ì%7\Ç-]T†’\ï\æŠÒ¦\ÙZ”­\Ä5\Ôøô¤E[N´Œm´2½²¶\Ñ	!³¼»r@:üz\äIVþá®«\í%\çyL›h-˜…öRof½e	¿û$ñ(…1\Ç:û#ð‰b%\\\ß[R\Æ\\\ÄŠPY“^\Í3\rB”T”¡$¿Y!)_\á\×3\Úf\\\ëm\åS³)\Þ\ÑGT_\"®z˜Ž•\Æo~15ZÒ•h]^…Zk\ÛAqa\åJKX½DjH3\'Fµzd˜ð\Ð[mù*B†<\ç\Õ[‘ö£ñž	–\Ñ\ßd\Ã]’\ë\áF°fB+Y•\Óu[\r¥2Ì©Ì¡[TT‰í§„i!So²‡R\nRFŠN½\ÔuŸ\×\åöi¡\Çgbñ/­šò™r®ú©-XX!keô%p\â)n\rP±ªø±\Åù\ê\Úû$ƒŸcò\è©d.\"´¶bb\Â1x‡l‰		\Ð:‚¯\0 OX†œO\Ó\"\ÞZ5\×\ÉG\Üñ\ë\" d\ì\\šùA%=€%•‡~³\æ9O™²\\J÷6\È2ÑŠ\ç\ÕZYòí®¦;+\ÑùX\Ü\ç}T¶\Ñ\æ/y	\îNšô1<)–Tñ­U~ õ‹\à\ão\ÐR×¡–&yð\ák-\Êõ2\ê\Ê\rŸ3¶ž%\ãûþB¢®»Å­^©¹¯u‹‡]1‚Ÿ2;®E©Âi+‚­c\ÜÕ—0SZD™‹\Üb\î]Á·aKô’*„©‰°Fö\Ûx2b³¹`j\nA\í\ÖY\ÈÃž§G½\ä|Ž²$:Ê‚†\â=-MA¢¯Lo©bÎ¼ƒ/\Éo_1\Í\Ô{\á‰\ãuö6U•õ\î¢$»U0g¿\ëfJ²ur}#£n\ÌR@B@ñ:ž³+üŽ[Pk\"\Ñ\ÙMŸ1\íCP\àC„ü™²\ÞÚ•/Ê¥-Zt@OY&Wžl\ÆS\Ëy\Ê\nZ’\Â#»ku&=|(p„üYn%â€€ã¿„­	\ë‹óX\äü—\Çhqw*\ìTª”µ%¨ª±™^¹`Q\ÍuvRŒ—JƒH\r\íF \r¯ðg\Zòcy¼\Û³É–¥‹OM-Ê¸*j\â*,W|„hVšG…´‚G“&¡\çAñV\É#\á\×!ZòW2\Ùa™S±j™“E\rQ¼–¡Gm\Ö\ë\åh\æ;d¤®[1\Óö\è5\é^\\«º«‡:\Öli\Öñ\ìœ\ê­\ì_²}.˜8û1ö´ô’”\è€vŽ\äžýV\ã³ù†d;\ÈW\Æe33™–$@fk\r³ü¿}…4\â\'+wÉ»P4=Ž£œx‘osjÈ±\'bjvb«\ÕX\nl*lgˆôõ“6;°\ZH\nù68N‡PE\Ô\Î¢=+\ì)GA K\nJ‰V´N½þ\Ztl÷r·!\\™ˆmJ‰\å­Q§y\á§bŠ4\Ôªñ)¼‘)øl4\ÚÉ…v¿™	\Ð÷‹ÿ\0V¸\Îö¯\"M<¶`\Ù=_S\"\É\rz†#¼™\Ð\á:T\ë\Z©%!I\Ðú‚:\í\ïû[¬+z‘õ\ZùpÖ¤’Ë8R{”¬!}ŽU\Õ›–òl¹\Ó T<»\Ù<ûñ\Zõ ¦«´¥¶	R’”\ê@Ôž¸ÿ\0Ûž•\Û\Ùýf\àc¸\ËV¹\Zß—2\â\ÆT\àÜ»\'©!\Ãd¹&ZôR\Ãm¤h>\ïP²A\r\Ø×—\Ç\Þq\Þ?o~±5ó~M‘P\Íj.L1\ÔQ‰1œ‘R«UKD\Z[„\Ë\èŽUåŸ™Zj5\ÓûE\äö7¿¡]qÓ”œHºo9\Å¦!«´°ýº/ ª±—Ô¼>:Ë³\ÃiY+@\ÚNª#òN£\éñw\ä§_\á\ë)úd\Ç];y+ëš¤òq™V\æ¯eey\n\Ö\î5‡Ó ¥-\ÇSµƒ%&\ZZR¶¼°H\Ôx*?O—e‡³\ÆF;6y{\ÖÊ­\Þ\éCÒƒñ\â<—\Ë\Å{‚šoC\Ûh\Z~\Ó!À\í\äXE«²„Ï®v¦B\"X¡5ó¡\Ú\ÇTi.G”\Ûj\ë\ÛÝ¹µ…#Q§}Dþ,\äŒ\Ó=­¿‰›$GL‰³\Ê\ëß“*+/8\íf\')„)Ç¡86•htÐŽ¨}¸\á\Òí® Q³#Ó¿M{^„\ÔW=©O¦e|X®¸Û³NÐ¢\â·j€\é1\åh—\êœy¿†¥l’rs\Õ\ï­\äLõ·••\Ùú´6\Ýñmw½J\Zq8r\Éi¨,’§Ç¥Ž•\ÇN4\Ø`“®­ˆC\É%J\îANž:·®Eró3\È÷gyS—lFf\íL±l»\ÙÊ¶f9Nú\ÓS‹‰F‹X)E(w,7NúÞ¦F\\Š\çœ+.9ZšvSÕ©Ä¡enCJw$Opa\Í3\Ü\ã3­Ì\Ì\æ/#ƒ\\\Ý\Â\àÆ²ò#·Lb³\Ù-ùA\åyÄ…ø\í?\Ø\Þþ…uLÿ\0\re\ÙM\ÞVq\É\rK‰t‹4DE¯(\Õ6C~³¨iR9¸©”R‚V­F¤T\ìüCo\ÞòÆg\ìgR\äAÅŸ\Ä/\Ú\È\åES©“\ZurSg\"9a§\ÞóÙ†TQ±µ«p\Z$ø\Z\Ï3i\Ù[9ö>\æ9{W-Ã•t‰ˆUs2\Ô\î)¤²äw:\ÚI\ìHõˆˆ\ÇsK‹\Üøÿ\0¨G\ß\êpW\àúWõû\ÞZºŠ\ï5\å9-\r\ãxü\æ\é£Ñ·b¶$SýjR\ÔôECp\Ú^M‚H\ÕHQHü\0=s\\5uwŽ9=\Ûi7^±Y¿45[\r&m]KVˆ\ê[)*Qùµ\Ôi‘œg9¤Á\ì\â\ÕÌŽsWƒ\Z\Ù^Y’\ÌU3Š\Îh¶“§à¼´…\Ðu\n./e2^\ß†jl$)ó=\ìW\èN¤Kx»‰\"Y¯*QÕ¤¬/¶Àt`K¦\äòEš3leu\Éjñ¿b›\Èj­jB•‡2”2\ì°\ØY+@	\'º|F+\äG ‹»M4\Ý\ä‚Gb|	\ë=k*ô\\}\ÜC#júDr\à~=”\ÓQnû¶\Þp>\ÕrR6¡j\Ü‰Q\í\Ö#Trr\í®‘\ÓdÕ¨— r2\çROb\Æ ’\Ëxs*q’üt\ï@Zw\rF£^±ž4\Ës[\Ø\Õ4s«m\ímOX™XÌ†Y	y\Ìz[e¥\"RÂ†Ã®º‚\ê’GeùM\ÖZq\éM=\é6ˆŠŠE\ÛÓªt†„¼~¡•\ÈD´FHü¢”£¢|H’!ù¾¡¯\Üô\ç\ã÷ú\ä)³˜\å”Ùš¢Ô¦T\ZtZ¹0\ÛÉ¬p*.9j\Èy\Ø\ÃU€\ï\ØHõý¢òû\ßÐ®¿´^@ÿ\0c{úÕ«<9skuŠþs^9\ën)3ÂŒQ`Â“.¾­Ô¶\Óigg\äBJN “¯Y@š½ý6Y\']\ß){µ \ê>SÕ†¼‹\Èúô¾\ÞUñ\ÓùC‚¿2\ÔTÛ©×¯\í?\Ø\Þþ…u#„r\Ë\ê\Çr\Z\ÅÞ»x™¨z=škBaµ3jjY\\2¥”,nñ#M:Nž\Zñ~Ôƒ\àA¿Ûª‹œ©Û¤7ŒJm_ô[EU:$KŠ˜\ÒD…ˆò“!•4\Út’5\Ä+ó‰\ìõœ»°g/ÆŠ%Í¼Œ£Q9Q·\Ím˜‘\ÛP@AP\'Ný¼f\ã¸z­Wóvz­k«y¹É®‹0%¦\ß[ž{\n‹)-*\Ó]A\0Ž±#\Î.e­\Íô™?\æ\âqY°\Å2*\r©\é™q½Áÿ\0O\å\î\ÑZnÓ¶½]Sñªù	Q\è%Bƒd¹¶ó+D›^‘6™Bša]Á\ìGq\Üu‹\å\r\ÉÍŒŒröžþ *R\Ù3*\'Ç±‰\ç4+[.±\ç\ÇNônN\äö\Ôk¯Tø¶\à£3M( Ü„’Àu•ùúùL“®ž:y.x|<z\æ£\Ènò\Z3s–+ó4ÿ\0Q‚ÀW\Âô{#­Y‡\åk´\íß®aƒŽM‚°á°1³k\æýD\Öyl3<\ä¥\ßP^ß»P†ƒM?i2¼$°\ã?Ž’?\ç\ë \ç|•Ü›\êŒ\Ó&¼Š‹\å\×DU|3\çGˆa\ÉI—g¸\nÁN\ä\ív×¬\Ê÷³\Æó¼$œjñ·™Ÿ}\ÑN57\ÉDub2\ã\êCQ\ÉX\'oÌ‘\ß^œ\Ïh½R©\í1çŸ«T\è®B”¦\ØSñ$\Äx—ZdFZt$‚ A\êô\Í”Ä“”YŸ«yaÿ\0«<d¥¯\ä\å~_™¸\'¾\íºw×¿Jôºù?›mz}\Äÿ\0«ô#\Éw\Ì>]<{õ\È\ÂöG\'}kóó*úÙ‡õ?J-ôß«zQ\éHô\â›\åøüºuS—\r7\æEo\ÓK»ü\ÓYôf=s\Í\ÑÀé‡³v\í»]{õ\Í>‘fs)‡#MG\Ô~š,üˆû\Ä=‘Ö+\É\Ùø$§vºvêŸ’ñ73´Qd\Ñíª–¬ø®®¤\ïeOGzµN2\é)>u–±¹2­[¬v•ß¬^ª\Ê ¯‘>¾Á\àˆ¾Ž2S!R+\Z\Ñ\ÂNÔ‚\á¢CQ†\Ùü„\Ö~3Wù¬pûñ’o®MÒ¤ýL\Ãò5x\Ë÷ù{V\í4\ë†Õ…½\ÉË†~m¦\Ï\êF½W^µ¼N\Ö:\éýIIV¤\'\í\í¯X‘®ß¦Eñÿ\0\Ì#ü>Áÿ\0¦imþ2H\ê7>s2²tÀ¬n68‡1\é’!‹›u»\n;\Êy\ã>Z¿)¹!(\ì|\\…q#™›°,*2.B»E\Ý}Œ—S\Z––6\Ï0úÐ‚T\Ý|\ÊJAZ\Ð\êz\Ì9#$‘É¿]\Ì\î\å\ÞY˜lYÅ\ê¥\ï,\Çò^ƒ´»ˆÃ·V\ÜoD\æR8\ãf«‹\ÜzEEƒ–m‹ª™\ÍW2\êód—+\â<¥¿¨Ø´øR…qÛœŠ\îAK.d”\ÚMŸ7“EuU\å©N»\Ëp&|¦›\Õ*Z	\Ðö:c´(V\ï&bO€\×\Ë\0\è>;€òC–¬\ÑgFná¨ƒ&t§\r\ÍE’eµü˜…DG\ÓZ{GIùV *=\åª~\ïûÏ¿\Ýÿ\0\Õzÿ\0_Ê¿¿iÿ\0U\ë\ÎøþG!&ú\ÒL<E*µ…g>0f\îÞ³o\ä‹M%²©‘š\Õ\ÍPt&ùH\ÚÛ˜ùJÀ €Dc¨û4u\Èg–žÎ“™˜µBRqÿ\0]ô\á\06÷\Ó\n|†k\Ï1¿i\Ó]5\Ð\ë\Òs\\\ÌøcòeÏ‰\×\ï\ä@’]¬˜õ|Ä»ú\å­$° ¤¡\ê\×\"¹Ÿý\Zm¤Z`\ä[\É62}t\Ö\ä½!ˆõ\èPAn\"\ÉQ\Ð\r4ñ t®á·²‡–«¼µÂš’Z“6®÷Œ€”)\Ä=!€–¶§TjF¤+«Ù“5\rI¦}\îÝ¾E°¢¿\ã\å\×Ã¿NAfG)—\æ[®#JYµJ<\ÙK(R‰ˆ¥†÷¬x‚­>\Zõ_—0\în\Êf²‡\n\Ê\Ô\nÆº\0k	\Ðu}7z\él\ä6Q­,Õ¢­2¢EôlúwhÁ†R\É:§BJŽºø€û\0½ûIR¿û»;ø‰\'§xž\ê§.—`j\Ñt\Ò\èi\âOˆ\ÜgN¯i.¿.\â·I*~½\ÂP”¨hI\ï§O2h9+G[[g\\n£Ái)?û\Ó÷zG\"òŽ\È6\Öp\â=¹^ŽMj£Ã‘$\Ìuµ¢«2ˆÛ»¤(¨\îP×±Ó·\\§ðŽ=yGI]~÷\Ö#\Þ«”ýØ¤¯qTË‹§q\\ZH\Ú\âR“ò\ë\Ü\åu<Á‰\æ·w<csuŽ2\åtiq!²ü—!»b˜² e5NÌŽµFkE:\Ø\ÑI;@Smu\ÅXŸ \ÖG½‘eœq\\»%È•§XŒ°\å¶a%m%¼¡µ\nJI:zOûƒ’»i\Ûón§\áÿ\0\îz£äº¸ö«/\àªt­c&%‚D‡\â­£6ü¦šu/EWàº°S¡×¿Y®U9·œƒ]Ž\ÜZNLdy²:\Úù3¥\í :ùa…lIRw+A¨\×^²\ÞL\Ë0.A›‘eöŠ³³”³…\ç¼j3kTX»\Z_§Ž€­ˆ\0‘¯‰\'©œ+\Å7õt~\Õ=Cqo!ú*% ±r½d*\Ö\Õù„/T\ëaDx\ë\Ù\nÿ\0))W\ï€\çý‹ŒƒMMtG_¾§\ËB•ÿ\07Y\ßÍ¥\Ï±\Âo¥Q\Ø=YC_\"½r\ã„)\ÏFüœ‚\Ï2\àN\å4H:4&Æ‘\ÚIŸ\ÆUŽT€Ò¤\êH\Ê	øõ”òvk‚ò\r†O–\ÎD\ëI‰n\Êy\Æb±\n91 f\Ñ\â!MÅŒ\ÚN\Ô\rv\êu:ž‘\'Ž\ë&\ÖaŽ\ã³\Î9\Ä=\ë¢\ÆL\É\ÈqÌ™V/©\Ã8:­Tûº‚4:hJ¹už®[y%ºŸ[K¾K’‹9\å¶\ß\ç\Ë@2·)N\Äè“¦\Ñ\à\ÄQ©¹Bô\"N;Y\å¥h4€5\Éwh\0ðð\\\ävü{\ÈR,\ï\î,.\íB®™N´š\ì\éÎ¡¦s¦\Ùk\Í}õ”„¥:\è\09–Á‰-¼j¦\å\r2\ÊÝ˜\ÕtOi¦˜[…n\Ën±…/U/±WÇ¬³‘²¬gd9}\Ãöö’\Ãvüù¥\r…˜°³†b2¢\ÓI\Ô!!:\ê~=L\â,¬¾­\ÆøøTc¬Æ¼‹\é\Ô\Äiq\ä½\\\Üg—glôÄ¡˜«-\ÇÂ´\×]u\é*û@?¾5èŸ³¨ü_É•—vX\ï .\Óz5$4K[\Ì?Zò\ì\Z”¯©U»‡ ­IJ\Ûs\Ì\n#nšj1\\óÀ9-ö#wö¦R“k,16\Éu‡½<\Ì\á\è¯)µÀ-\nN£¸\ë\Ëi™–\ÍM¾7UqZ‰\ìˆ\ÓD)ðY“KŽ—_KCkhXI\Ôn>?°$s\rM¥\Ö\Z›ªÎN©\"s–³e5N6bXÔ¼ff\Õ/G\Ò6\ë¨W´™Ž`ÜE\Í¾1dµ5g0H¤½Ž\"\Ú\Ã™›>†Œ¨ÿ\0/˜€—PÊ zþ\Î9ýµ÷\é\ïV¸l#[\Ån\î«r:\Ï*\Éj‘oOTZ\éBjóeNdGbk©Ø‡Ú·\ê H\ZRG\áœC+£\Ë9-\ÙS.\×h¨‹¢E\ÕfGo\Öd\×,‰.Nr*‡ä’¢”;ƒQ³ð=}¿{\Ëa\Îsm\r\Íõ\nòø\íVF£3¶o>•n´\ÈuP­\éœ¾ž‰	;RJ”Ÿ—]ÿ\0†F•E—¹»iê¸¶É«›T7gG¯Ha\èù|\å)\Ñ\"JuIù{\ë\ÛN§r#˜•‚ÛƒTý£©9nd\éò£G\\—v¶«ò \ÛgDüOXB*ø\ï>f\Íyv8Š×žvô²Õ‚­\â&¯g/$´Ü²…(,ƒªOnõ”n\Û@ ½;÷Ž\ãò\Û]Oa\ÖYÉ™\Þ\È6·\Ör½\n\åˆ\Ö\Û\âV­\Ö\"¤Æ®\Í\"G($jPF›»õuÂœ3G“TSc_\ÉK\È\Î%”³sj\ç¨,M‘uq2C\îXH*)Z€JO\Êt\Z¸O™ñüª\ê=s5yšc\Ò\Äy0\ÐVõ´\n\åýF-õ4¿T’\Ëû\ÛN¨	XÔ’tna\Æxn{O\Ü\ØV\â&Sñ§OhÇ»¹­JqY„ö™d\Îe•-\Ä6\\JPt×¸02,²%š\ê\'±UJûu\Ñ>j\ä\\­0£†\ØzL&‹A\Åµµ\Z\é©\Ð¬\Û\ã®AÙš‰í¬®ð¤Hmñ%\'\Ë9\áA@p~	\ZiÛ¨ŒJNFu¨L¶\Þöñº­P	ï“§\ÄýÎ±!ª§Í£Y\åLô\\\ÒA‰\\_\r\éòRü˜·³\Üij[?$R¥h	\Z\ë\Õ]®šzØ?ø\é\nþ\rif¥R!H\Ü>\Ñåž§\×r—\Øg˜\ãr\â\Ú\ÄLd¢5;—V\ÌÆ€²õ\Ír–¦\å°ûŸ€ \çew ~®½ô§¯\Õ\Â\ïÿ\0À~”õqÊ¸%¬Ï±¸9³µ\ì¥\ß9\Çn¨aÈŠ\ì\Ï2L\Í%3\0´\Ñ\r¬¶\n;k\ây¢¯.\à‹lƒ\'›\ÙÆ½»a0’Í¥›~X‘-´¹\ÄXJû\rKh* ;õú¸]þôÒž¿W¿ÞúS\Ö\'i€\ã®\âø¼Ú‡¤£y(Kµ‘S6kN\Çp¶ü¤)f[n,\â÷oÔI:™WªÒž\'‘K¶¯BB•>ª5<×¬¡%*[h*—	l¤›¹¿]½¸]ð\Èƒ\ì\Ô\å:ž³ƒ\Ä|m7ec	¾\Ú9)›ƒV¤,\ì´“\Z@Ð”wwQ®§F´ðò\Ñÿ\0\Í±–)ôo@«”JtÔŸÈ¯]>=sE^_Á6\ÙQ6±}x\Âa%«K$%¯>[i^C{V\Z–\ÐTF¤jzý\\.ÿ\0z\éOX\Æ+Ûµ´y96CKÇø†Xaû›(\Õ\Í<ðk\'S…¦œ’­ «A\Øk\ÓŽ9Uš‘óÁ­ˆò!¶\â]´¶_[¯+t‡–²V¥(©dŸ³/¼\àg\îgmFJfT\ÄM—s¬N\Í&\ä1]ù±V¢€„…\0Ÿ\r\ê\áwû\Ð?Jz\ã\Î!­öý6¶notº\æfYy\"B-|\ÛG„ƒ$zRR\ãP’w(xýXÁ—J&\âÕ¼qd»*VJ„œ~¿\ÕU2\Ú\Ö\Ò6»Z\Ée!KHÐT<z\í\í\Â\ì€\Ö\Ð}ó”\ê~ÿ\0Y\Ó\ÜG\ÇS0°m\èZ»bXcu”¹¦®ºBVClVYy:#ºõ\0\êtFžSþ!\Ñû\Çü]`²yo\å\çµ\Ó2Iñª!\ÄK;\ë\ì[¬u\Ù3§\ìkSµèŸ“\Ð)]ô\ì4£ÿ\0Ã…ß‡þÁúS\Öe†\Ó/\Æl1\n9˜ý+‰JWULýlw+\ë\Ôó\í\î‹IAÚµG\áØ¸‘RF\È+\"!»\'+fy\ÞJ\ä\Ö9\êá¿¬w˜x.3\í…\'E\rt\ï¨\íÔ˜\ÇÛ•\Òý<‡˜\Þ\0ä¸¦÷€r@V\Ýtë²¨^ß¥Å‡\Ç\ÕWv±¥ùª|{{\Èt,3]\ä\än5\ç·*j¿5HO–„ž\Çõp»ý\è¥=J\ç.7\ã4\ák,¬pò\ì M‘TösüŒASÊŽ½A\Ü\Ð\×@;\Éu±ò\ÖW( \r\è[:iñ\ï§Vœ?Ë¼c}›±ˆ»#aL¦»\é­Ë°bs\\Ž^·¯˜$3\×³ Ai\ßÇ®?‹xc#\Å/s|\Â±dVyAWc\Äõ›¯\å¹\èÙœ¶\Üp6‚²\Ø\0\ë±\Éhmîª²UVc/W\Õ&/¨Z\î¡K;õò\"±\éCœù·@¹Ò¾\Þ·[\Èóª\çÄ²„úv\æ%ÁÜ¨Î¤+(RIm\æ’@ Ž\ÝÁ\èdm\ÔX\×\ÕÍ¤´1¡Ú¥…Ng\é\Ò\çU:$®ÈŒ²·¡)IÚ¢6¨k¡\Ôuj·£þò\Ü\0\åN÷	ü\éAø\á\ÖSŠxª~	c‰&\âd±‹\n\ÅÙ†Z†\"\ÚÈ‚\Ü\Å%ÃªPž=€\êÒ·“x~\Ã6É•Š\ÖJE\ÄDDKm\Ô=enˆ0^º®qkŽû/¯»d\0î€Ÿ€Æ®öós\n\ÆFgŒ±_1i€¤Cžý\Ì6¡KZFL\æ\äE”´8F\Õj\à|:\Ä\ìù\'\r“˜\ã\rM\ÅcÊ£Œ–\Ë\Ò,$LiòR_—^”zI”\'\ÌŽ\Út\ëõp»ý\è¥=~®½ô§®*©\ã\Î³Ä²\Ù2mU[}%1\Ì6Ø¬‘\"zjúrÁ•§\Z4­7\é\Øz\Ç\Òv \ÖF\Ð}Ÿ’O\íŒ±ªim(}¡i \á\é\ÞBÏ°<S%¾TDÕ\ÝLY³‚zJa¶ó©\Ü#¢D—©K\'\ã\×öI\Ç\ß\Õ\êÿ\0ôzAsˆøõH\nI8\ì\rR;\'\ã\Ò8«¾‚=S4ð\àCe¶\"B\Z2aÅ‰†’–™3iB\0	B@º\Ès›\Þ2\Â,\ï2[¬\í¬\çQA~lùh&[\ëN\çŸZRQ\ît\ëû$\ã\ï\êõú=\r\ÜI\Ç\Äk\Ü~n\×ø~ð\ê€TW\Ñ\Ñ\Ö\Çk\ê\ê\ãµ(\ájsÉ”¥\r º\â”{wR‰=\ÏVxNS<Ú»HR`L‰)´=TIŒ®<¨\Ò\Zp:Ä†R“\ÙI$Ç¥©®\"\ã\Ô6TJ1\Ø\Z%:öT\ë \ê}\ï\Za\Ø\æ-\"\Õ\È\ÏYý\n¶4^\ì0\âb.Ye!O˜È\ào]Bw«M5\' ‘\à\0ûÀiûs\ÄöË€ÿ\0’´”Ÿñõ\çW\Üe„Y\Þ\ä¶Y\Û\ÙÎ£„ü\Ùó\Ú&S\ëN\ç^RQ\ît\ëû$\ã\ï\êõú=Sd18£bu%Œ;X[Ç«Ã±§@Ü˜’YV\Ålz;\í%hV”\éŒ6!3E\Ó]uHF\ÍO\Ý\êo\"\æü}ˆdY\Æ[ˆ»KŠhs\'˜l­\çXŠdºŸ1L0\ã\ë(I\'iQ\ÓÇ¯ì“¿«\Õÿ\0\èõA\ÈX\×\Z\áTù;)Rj­«¨\áG°€ë¬¹\ç\"IB\n\ØqØ¯­µ):…ñ==\Å\Ù³¨d\Õ?O.¦›z,¸2£ª,˜²Zp:Äˆ\î)I\Z)*#¥–øR‚¥¤c°4\0’@îŸ‡V|gˆ\ãØ²­$3.Åº*\èõ\è*;jf;Ò¼„…>¶\ZZ’‚I\Út\ÓS\ÐgoØ\'“±J¥’\×:½‹\Ú\èö\rC˜¶V\Â\åFK\à–^q…”(‚5Oc\ÒJøŠ7 q\è\Z¯q\Ù:\èz«Á0º\èuT´ðc\Ö\Ö\×@a¸\Ð\à@†\ÊcÅ‡†’”3;(	B@\0ûñKt…FšÃ¬«PgRF‡±^¥JOq\ê}Kî¾ 1\ØUº²µ6ö\ÕG«\êŠ\î8\Â\à\×d\ÑcÂ¿ƒŽq®aÄ’‰‘b\Ø6D–#\ÌB]JIù\\JT;¡Ó‰8ûM{\Í\è‹¯O\Õñž7KŒ\×?-\éë¯¤‚\ÌŠ$6$\Ë[,…\È}, )GRB<\0\êT†­\Êel¬}Åðug\Èù§bùš\ZbE­½<I“Ü‹¯\ÓG\\‡AZšŽP@?‚P\åÕœYÃ¶\Ç,\á\ÜTÎA \ØÀ}\"LŠ\àAò¤\Æy°¶\Ö¨XwªŒ<Æ©rJJ—\"If¾\æ3¡‰P¶\â\Ë¼\nD†\ê‚T;€¢>=\rx“´×¸üÞ\áñøkÓœE‰RU\Ñ\ãiŠüXuUqY‰_\r©u\ç’\Äf’–\Ð}õ­]µR”IÔž¥\ÌOq\ê}T‡d(v\0ù\ÞYZÎ…?~O\Êøÿ\0\Åñ›;8­ÂŸ*Žª,	\â²\áy˜\Òe;\Üa·ŽðtÝ¡\ÓP:{?\Î0K\"¾r#Ué²¸¨‰6j`0\ã\Ï1Htoô\ì½!\Å%?³öõQ}‰ð¥\ÓXD³„ú1\êÿ\02<\Ø/·&,†•°\ìu‡\ÛJ\Ðt\ì P8\Û7\Çj2,~†\âª\îb36² ­.Ä¶\è\ï$-\nø¿²N>þ¯Wÿ\0£\×öI\Ç\ß\Õ\êÿ\0ôz¦\ä\\KŽp\Ú<Ž‘nzjºXQ§\ÆnBRPÄ†Ó½°û*(^š‚G=C­`\0\ÔFP\Ê\0ÿ\0%\0$}\Ïÿ\0+ÿ\0ÿ\Ù','DEFAULT',0,'DEFAULT','0','DEFAULT','DEFAULT','DEFAULT','DEFAULT','DEFAULT','DEFAULT');
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `contraseÃ±a` varchar(45) NOT NULL,
  `alias` varchar(45) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'SET SOFTWARE','ADMINISTRADOR','admin','admin');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL AUTO_INCREMENT,
  `idtienda` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `idmodopago` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `articulos` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `total` double NOT NULL,
  `status` varchar(45) NOT NULL,
  `descuentoextra` double NOT NULL,
  `iva` double NOT NULL,
  PRIMARY KEY (`idventa`),
  KEY `fk_VENTA_USUARIO1_idx` (`idusuario`),
  KEY `fk_VENTA_MODO_PAGO1_idx` (`idmodopago`),
  KEY `fk_VENTA_CLIENTE1_idx` (`idcliente`),
  KEY `fk_VENTA_TIENDA1_idx` (`idtienda`),
  CONSTRAINT `fk_VENTA_CLIENTE1` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENTA_MODO_PAGO1` FOREIGN KEY (`idmodopago`) REFERENCES `modo_pago` (`idmodopago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENTA_TIENDA1` FOREIGN KEY (`idtienda`) REFERENCES `tienda` (`idtienda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENTA_USUARIO1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `viewdetallesticket`
--

DROP TABLE IF EXISTS `viewdetallesticket`;
/*!50001 DROP VIEW IF EXISTS `viewdetallesticket`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `viewdetallesticket` AS SELECT 
 1 AS `CANTIDAD`,
 1 AS `NOMBRE`,
 1 AS `PRECIO`,
 1 AS `IMPORTE`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'puntodeventa'
--
/*!50003 DROP PROCEDURE IF EXISTS `spgetclientesnombreapellido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetclientesnombreapellido`(IN INCIDENCIA VARCHAR(128))
BEGIN
		SELECT ID_CLIENTE, CONCAT(NOMBRE, " ", APELLIDO) NOMBRE, CONCAT(CALLE," ",COLONIA) CALLE_COL, CONCAT(CIUDAD," ",ESTADO) CD_EDO, CP, FECHA_NACIMIENTO, TELEFONO, EMAIL, CURP, RFC
        FROM CLIENTE WHERE UPPER(REPLACE(CONCAT(NOMBRE,APELLIDO)," ","")) LIKE CONCAT('%',REPLACE(UPPER(INCIDENCIA),' ',''),'%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spgetdetallesticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spgetdetallesticket`(IN NUMEROVENTA INT)
BEGIN
		SELECT SUM(A.CANTIDAD) AS CANTIDAD, (CASE WHEN A.DESCUENTO > 0 THEN CONCAT(B.NOMBRE,'-',A.DESCUENTO,'%') ELSE B.NOMBRE END ) AS NOMBRE, 
			
            A.PRECIO AS PRECIO, SUM(A.CANTIDAD * A.PRECIO)-((SUM(A.CANTIDAD * A.PRECIO)/100)*A.DESCUENTO)AS IMPORTE    
			
            FROM DETALLE A INNER JOIN PRODUCTO B
					
                    ON A.PKPRODUCTO = B.PKPRODUCTO   
						
                        WHERE A.IDVENTA = NUMEROVENTA
						
                        GROUP BY A.PKPRODUCTO, A.DESCUENTO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `viewdetallesticket`
--

ALTER TABLE `producto` AUTO_INCREMENT = 100;
ALTER TABLE `venta` AUTO_INCREMENT = 100; 

/*!50001 DROP VIEW IF EXISTS `viewdetallesticket`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewdetallesticket` AS select cast(sum(`a`.`cantidad`) as char charset utf8) AS `CANTIDAD`,(case when (`a`.`descuento` > 0) then concat(`b`.`nombre`,'-',`a`.`descuento`,'%') else `b`.`nombre` end) AS `NOMBRE`,cast(`a`.`precio` as char charset utf8) AS `PRECIO`,cast((sum((`a`.`cantidad` * `a`.`precio`)) - ((sum((`a`.`cantidad` * `a`.`precio`)) / 100) * `a`.`descuento`)) as char charset utf8) AS `IMPORTE` from (`detalle` `a` join `producto` `b` on((`a`.`pkproducto` = `b`.`pkproducto`))) group by `a`.`idventa`,`a`.`pkproducto`,`a`.`descuento` */;
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

-- Dump completed on 2018-04-07 20:49:18
