-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: maiya
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `idofcart` int(11) NOT NULL AUTO_INCREMENT,
  `idofcustomer` int(11) NOT NULL,
  `idofgoods` int(11) NOT NULL,
  `numofgoods` int(11) NOT NULL,
  `totalmoney` double NOT NULL,
  PRIMARY KEY (`idofcart`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `psw` varchar(20) NOT NULL,
  `paypsw` varchar(20) DEFAULT NULL COMMENT '支付密码',
  `phone` varchar(11) NOT NULL COMMENT 'varchar(11)',
  `balance` double DEFAULT '0',
  `ordersid` varchar(255) DEFAULT NULL,
  `deliveryaddresses` varchar(255) DEFAULT NULL,
  `isvalidcustomer` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (201,'小明','12','123','13311111111',1480,'501','海珠区','1'),(203,'信息','3','3','2',2,'1','1','0');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerorder`
--

DROP TABLE IF EXISTS `customerorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customerorder` (
  `idoforder` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `customername` varchar(45) NOT NULL,
  `customeraddress` varchar(155) NOT NULL,
  `customerphone` varchar(15) NOT NULL,
  `idofcart` int(11) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT '交易关闭',
  `expressmode` varchar(45) NOT NULL,
  `expresscharge` double NOT NULL,
  `paymode` varchar(45) NOT NULL,
  `expressworker` varchar(45) NOT NULL,
  `expressworkerphone` varchar(11) NOT NULL,
  `invoicestypeandinfo` varchar(255) NOT NULL,
  `totalmoney` double NOT NULL,
  PRIMARY KEY (`idoforder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerorder`
--

LOCK TABLES `customerorder` WRITE;
/*!40000 ALTER TABLE `customerorder` DISABLE KEYS */;
INSERT INTO `customerorder` VALUES (1,201,'xm','haizhuqu','15911111112',1,'卖家申请退货协议已达成','申通',0,'线上支付','小二哥','12312312311','电子发票',1400);
/*!40000 ALTER TABLE `customerorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `class` varchar(15) NOT NULL DEFAULT '其他',
  `totalvolume` int(11) NOT NULL COMMENT '总量',
  `salesvolume` int(11) DEFAULT NULL COMMENT '销量',
  `kucun` int(11) DEFAULT NULL COMMENT '剩余量',
  `price` double DEFAULT NULL,
  `introduce` varchar(255) DEFAULT NULL COMMENT '简介',
  `color` varchar(45) DEFAULT NULL COMMENT '颜色',
  `style` varchar(45) DEFAULT NULL COMMENT '款式',
  `specification` varchar(255) DEFAULT NULL COMMENT '规格说明',
  `evaluation` varchar(500) DEFAULT NULL COMMENT '评价',
  `picturepath` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=445 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (401,'英特尔（Intel）酷睿四核 i5-4590 1150接口<br> 盒装CPU处理器','cpu',1000,800,200,1400,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;HASWELL平台,强大的处理能力！超快感体验！<br>性价比高！【组装电脑主机，游戏配件推荐】','默认颜色','盒装CPU处理器，1150接口','四核,支持64位','物流也很给力，东西挺不错的，是正品。<br>东西可以送货快速，价格合理。<br>东西挺好的，总的来说服务不错。','images/img_cpu_intel_01.jpg'),(403,'罗技（Logitech）G502 炫光自适应游戏鼠标 RGB鼠标','鼠标',2000,1600,400,179,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;游戏鼠标中的明星之作，1680万色自定义RGB指示灯！','黑色','有线','大鼠标，130mm以上','可以的，把配重块合理分配，效果手感都很好。<br>东西不错，有种爱不释手的感觉，可以手机摄像头出问题了，不能放图。买来打守望先锋的，手感不错，dpi快捷调解，神器啊。','images/new/shubiao02.jpg'),(404,'爱国者（aigo）黑暗骑士D8 中塔游戏机箱 黑色','机箱',6100,3700,2400,139,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;360度立体散热，铁网板设计，免工具安装，支持长显卡','绿色','黑暗骑士D8绿色中塔式机箱（USB3.0/标配12CM LED风扇/免工具设计）','机箱：L400*W183*H420MM 外包装：L468*W232*H490MM','东西收到了跟商家说的一样的好机箱容量大本人觉得很超值<br>爱国者机箱很酷，大板，长显卡无压力。','images/new/jixiang01.jpg'),(407,'先马（SAMA）黑洞 主动静音ATX-Ⅱ宽体游戏电脑机箱长显卡黑化背线配3把静音风扇','机箱',5100,3900,1200,299,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;简单大气给人深邃感，支持背线，布线整洁，减少风道受阻','黑色','黑洞','顶板0.7mm、侧板0.7mm,其它件均采用0.6mm','东西收到了跟商家说的一样的好机箱容量大本人觉得很超值','images/new/jixiang02.jpg'),(412,'罗技（Logitech）K120键盘','键盘',6000,5000,1000,67,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;罗技经典，高性价比键盘，持久耐用,防水溅设计!','黑色','有线键盘','约462x190x29mm','刚收到就迫不及待装上，试试很好用，不愧为名牌产品','images/new/jianpan01.jpg'),(413,'希捷(SEAGATE)1TB 7200转64M SATA3 台式机硬盘(ST1000DM003)','硬盘',7000,5050,1950,300,'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;采用单碟1TB技术,品质代代传承,台式机用户的精明之选','默认','ST1000DM003','采用单碟1TB技术,品质代代传承','没有按预约的时间派送，提前一天送了。刚好网购的主机到。。哈！用PE分区就可以用了。系统盘SSD,这个存数据。','images/new/yingpan01.jpg'),(414,'技嘉（GIGABYTE）B85M-D3H主板 (Intel B85/LGA 1150)','主板',8900,7000,1900,499,'散热加强/4相数字供电/高清接口，稳定耐用好选择！79000好评，见证技嘉主板的卓越品质！','黑色','B85M-D3H','接口类型：LGA 1150   集成显卡：需要搭配内建GPU的处理器','大品牌主板信心保证，好用好快！！！！！<br>板子不错，正在使用，技嘉大品牌，应该没问题.','images/new/xk03.jpg'),(415,'北通（BETOP）BTP-2175s 阿修罗SE PC/PS3/安卓 有线振动炫光版 游戏手柄 镜面黑','手柄',7000,5049,1951,349,'支持PC电脑，安卓手机平板、智能电视、网络盒子! 手机 平板需支持OTG功能，OTG线需单独购买','黑色','有线连接','型号BTP-2175s','一步到位，活动买的。手感不错。',NULL),(416,'沃野牧马人风格USB有线游戏鼠标台式电脑笔记本发光鼠标','鼠标',6000,3000,3000,55,'lol cf 专业电竞竞技背光鼠标 沃野S8无声静音鼠标黑色，S8为按键无声静音鼠标','炫彩白色','有线鼠标','大鼠标','手感很好，没有声音，摩擦力合适，喜欢满意。',NULL),(417,'雷柏（Rapoo）V500 机械游戏键盘 机械黑轴 黑色版','键盘',7900,6000,1900,125,'年轻人，应该拥有人生的一把机械键盘！机械黑轴，游戏级芯片！','黑色','机械键盘','350.9×142.4×36.9mm','第一次使用机械键盘，感觉很特别，想买茶轴买成了黑轴，不过手感还是非常不错的，喜欢，物超所值',NULL),(418,'金士顿(Kingston)骇客神条 Fury系列 DDR3 1600 8GB台式机内存(HX316C10F/8)蓝色','内存',5000,4500,500,249,'【全场铜牌以上会员特价】金士顿7月会员狂欢趴！！','蓝色','HX316C10F/8','预设PNP，即插即用，自动超频','东西很不错，价格也实惠，挺好用的。。。',NULL),(419,'华硕（ASUS）猛禽STRIX-GTX960-DC2OC-4GD5 1317MHz/7010MHz 4GB/128bit DDR5 PCI-E 3.0 显卡','显卡',5800,2000,3800,1700,'5相超合金供电，金属背板！STRIX力作，静音停转设计，双混合动力风扇，四热管！支持DP1.2新标准，3DP口！','默认','显存类型	GDDR5','最大分辨率	4096×2160','东西很不错，价格也实惠，挺好用的。。。',NULL),(420,'三星（SAMSUNG）S24D360HL 23.6英寸PLS广视角窄边框LED背光液晶显示器','显示器',6000,5100,900,999,'PLS广视角、窄边框、经济实惠，不用纠结就是它了!','白色','液晶显示器','含底座尺寸(宽 x 高 x 深)：547.3 × 400.9 × 243.4mm','很不错的显示器，有个遗憾，貌似没有主动调节亮度的功能。。1080p，做笔记本的外接，我觉得挺好了',NULL),(421,'微软（Microsoft）Xbox One 控制器 + Windows 连接线','手柄',6000,4600,1400,349,'【各国版本通用】能在Windows上使用的Xbox手柄，体验不同游戏感受！','黑色','有线/无线','微软控制器 + Windows 连接线','一步到位，活动买的。手感不错。','images/xbox.jpg'),(422,'恩杰（NZXT）H440 白色 中塔式机箱（钢化面板/水冷支持/电源仓/侧透/支持长显卡）','机箱',5000,4000,1000,599,'纯钢材质，简洁易用，静音运行','白色','H440','机箱：220（宽）x510（高）x476（长）mm','东西很不错，价格也实惠，挺好用的。。。',NULL);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodsforsales`
--

DROP TABLE IF EXISTS `goodsforsales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goodsforsales` (
  `idgoods` int(11) NOT NULL,
  `goodsName` varchar(90) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `sum` int(11) DEFAULT NULL,
  `sells` int(11) DEFAULT NULL,
  `less` int(11) DEFAULT NULL,
  `notes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idgoods`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodsforsales`
--

LOCK TABLES `goodsforsales` WRITE;
/*!40000 ALTER TABLE `goodsforsales` DISABLE KEYS */;
INSERT INTO `goodsforsales` VALUES (1,'请求',123,1111,0,1111,'无'),(401,'英特尔（Intel）酷睿四核 i5-4590 1150接口盒装CPU处理器',1400,10000,2000,8000,'无\r\n'),(402,'罗技（Logitech）G502 炫光自适应游戏鼠标 RGB鼠标',100,12000,10000,2000,'\'\''),(403,'AMD 速龙系列 870K 四核 FM2+接口 盒装CPU处理器',1000,9000,6000,3000,'\'\''),(404,'xbx',120,6000,4600,1400,'\'\''),(405,'爱国者（aigo）黑暗骑士D8 中塔游戏机箱 黑色',139,6000,4000,2000,'\'\''),(406,'先马（SAMA）黑洞 主动静音ATX-Ⅱ宽体游戏电脑机箱长显卡黑化背线配3把静音风扇',130,5000,3900,1100,'\'\''),(407,'恩杰（NZXT）H440 白色 中塔式机箱（钢化面板/水冷支持/电源仓/侧透/支持长显卡）',100,5000,4100,900,NULL),(408,'罗技（Logitech）K120键盘',49,6000,5100,900,NULL),(409,'希捷(SEAGATE)1TB 7200转64M SATA3 台式机硬盘(ST1000DM003)',200,7000,5050,1950,NULL),(410,'技嘉（GIGABYTE）B85M-D3H主板 (Intel B85/LGA 1150)',500,8900,7000,1900,NULL);
/*!40000 ALTER TABLE `goodsforsales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodsintransit`
--

DROP TABLE IF EXISTS `goodsintransit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goodsintransit` (
  `idofcart` int(11) NOT NULL,
  `idofcustomer` int(11) NOT NULL,
  `idofgoods` int(11) NOT NULL,
  `numofgoods` int(11) NOT NULL,
  `totalmoney` double NOT NULL,
  PRIMARY KEY (`idofcart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运送中的状态';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodsintransit`
--

LOCK TABLES `goodsintransit` WRITE;
/*!40000 ALTER TABLE `goodsintransit` DISABLE KEYS */;
/*!40000 ALTER TABLE `goodsintransit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operator`
--

DROP TABLE IF EXISTS `operator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `psw` varchar(20) NOT NULL,
  `operatingauthoritypsw` varchar(20) NOT NULL COMMENT '操作权限密码',
  `financialstatementid` int(11) DEFAULT NULL COMMENT '财务报表id',
  `thirdpartypayment` varchar(45) DEFAULT NULL COMMENT '第三方支付合作公司，如微信扫一扫支付',
  `sellers` varchar(255) DEFAULT NULL COMMENT '所拥有的卖的id，以英文分号分隔',
  `shops` varchar(255) DEFAULT NULL COMMENT '所拥有的店铺的id，以英文分号分隔',
  `customers` varchar(255) NOT NULL COMMENT '所拥有的会员的id，以英文分号分隔',
  `turnover` double DEFAULT NULL COMMENT '营业额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operator`
--

LOCK TABLES `operator` WRITE;
/*!40000 ALTER TABLE `operator` DISABLE KEYS */;
INSERT INTO `operator` VALUES (2,'mmm','2','2',0,'','','','201;203;',10),(3,'京东','123','222',34,'45','56','67','78',NULL);
/*!40000 ALTER TABLE `operator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `psw` varchar(20) NOT NULL,
  `isvalidseller` enum('0','1') NOT NULL DEFAULT '0',
  `shopid` int(11) DEFAULT NULL COMMENT '暂时无店铺标志为null',
  `turnover` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=706 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (701,'齐齐','1','1',NULL,10000),(702,'万位','2','1',802,20000),(703,'二二','3','1',803,30000),(704,'仍然','4','1',804,40000),(705,'塔筒','5','1',805,50000);
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `sellerid` int(11) NOT NULL,
  `isvalidshop` enum('0','1') NOT NULL DEFAULT '0',
  `turnover` double NOT NULL DEFAULT '0',
  `goodsid` varchar(255) DEFAULT '',
  `ordersid` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=890 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

LOCK TABLES `shop` WRITE;
/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (801,'ee',701,'1',10000,'411;','609'),(802,'中子',702,'1',20000,'402;','602'),(803,'中兴',703,'1',30000,'403;','603'),(804,'华为',704,'1',40000,'404;405;','604'),(805,'宇通',705,'1',50000,'406;407;408;','605'),(807,'ww',707,'1',10000,'401;','601'),(888,'小时',123,'1',112,'6661','6662'),(889,'小时2',1234,'1',111,'222','333');
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'maiya'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-02 21:08:24
