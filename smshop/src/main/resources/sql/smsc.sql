/*
SQLyog Professional v12.5.1 (64 bit)
MySQL - 8.0.25 : Database - smsc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`smsc` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `smsc`;

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='管理员';

/*Data for the table `admins` */

insert  into `admins`(`id`,`username`,`password`) values 
(1,'admin','123456'),
(2,'777','123456'),
(3,'111','123456'),
(4,'qiu','123456'),
(8,'222','123456'),
(9,'333','123456'),
(10,'444','123456');

/*Table structure for table `carts` */

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `amount` int NOT NULL DEFAULT '0' COMMENT '数量',
  `good_id` int NOT NULL COMMENT '商品ID',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='购物车';

/*Data for the table `carts` */

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `intro` varchar(255) DEFAULT NULL COMMENT '介绍',
  `spec` varchar(255) DEFAULT NULL COMMENT '规格',
  `price` int DEFAULT '0' COMMENT '价格',
  `stock` int DEFAULT '0' COMMENT '库存',
  `sales` int DEFAULT '0' COMMENT '销量',
  `content` text COMMENT '详情',
  `type_id` int DEFAULT '1' COMMENT '分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='商品';

/*Data for the table `goods` */

insert  into `goods`(`id`,`cover`,`name`,`intro`,`spec`,`price`,`stock`,`sales`,`content`,`type_id`) values 
(1,'/upload/1-1.jpg','四川耙耙柑 酸甜甘香 柔嫩多汁','皮薄易剥 肉质软嫩','约500g',13,9,2,'',1),
(2,'/upload/1-2.jpg','红心火龙果','','750g-1kg/两个',28,10,2,'',1),
(3,'/upload/1-3.jpg','皇冠梨 松软多汁','果肉甘甜 细腻无渣','约500g',9,10,3,'',1),
(4,'/upload/1-4.jpg','西州蜜瓜','果肉厚质 中心橘红','约1kg-1.5kg 一个',30,7,7,'',1),
(5,'/upload/1-5.jpg','小台芒果 自然生长 生态种植','皮薄核小 果肉丰厚','约500g',26,8,7,'',1),
(6,'/upload/1-6.jpg','栖霞苹果 爽脆清甜','肉质紧密 味道甘甜','约550g/2个',9,2,14,'',1),
(7,'/upload/1-7.jpg','龙眼/桂圆 新鲜水果 汁多味甜','增强记忆 消除疲劳','约500g',18,10,7,'',1),
(8,'/upload/1-8.jpg','广西百香果 香气浓郁 甜酸可口','果香浓郁 搭配蜂蜜更美味','2颗/份',5,10,8,'',1),
(9,'/upload/1-9.jpg','美早樱桃 果大核小 饱满均匀','堪比车厘子的美味','约300g/盒',36,10,9,'',1),
(10,'/upload/1-10.jpg','智利红提 珍贵品种 品质上等','紧实爆汁 果肉新鲜','约500g',18,10,10,'',1),
(11,'/upload/1-11.jpg','尖椒 烧烤食材 新鲜蔬菜','农家种植 健康饮食','约300g',5,10,0,'',1),
(12,'/upload/1-12.jpg','荷兰瓜 生态种植 自然生长','颜色翠绿，鲜嫩爽脆','约300g',5,10,0,'',1),
(13,'/upload/1-13.jpg','小白菜 清脆鲜嫩 清甜回甘','农家种植 找回儿时味道','约500g',10,10,0,'',1),
(14,'/upload/1-14.jpg','菠菜 口感鲜嫩 入口清香','不催熟 生长周期长','约300g',12,10,0,'',1),
(15,'/upload/2-1.jpg','福成尚品前腱子',NULL,'1000g',99,10,0,'',2),
(16,'/upload/2-2.jpg','牦牛精肉2斤+ 牦牛肋排2斤','自然生长','2kg',226,10,0,'',2),
(17,'/upload/2-3.jpg','巴美草香猪后臀尖 原味原香','精致美味，解锁味觉记忆','约500g',32,10,0,'',2),
(18,'/upload/2-4.jpg','农畉猪肉-猪脊骨 肉厚骨细','骨鲜髓足','约500g',13,10,0,'',2),
(19,'/upload/2-5.jpg','一品江村黄鸡','味道鲜美，口感软嫩弹滑','约1kg',46,10,0,'',2),
(20,'/upload/2-6.jpg','正大单冻鸡翅根 精选种鸡','富有弹性','约1kg',35,10,0,'',2),
(21,'/upload/3-1.jpg','五梁红有机种植 大米','五常市有机大米','5kg',68,10,0,'',3),
(22,'/upload/3-2.jpg','五常大米珠光黄',NULL,'5kg',60,10,0,'',3),
(23,'/upload/3-3.jpg','五得利强筋雪花小麦粉',NULL,'2.5kg',32,10,0,'',3),
(24,'/upload/3-4.jpg','香满园美味富强小麦粉',NULL,'5kg',21,10,0,'',3),
(25,'/upload/3-5.jpg','老农帝国 黑豆 自然成熟',NULL,'2.5kg',82,10,0,'',3),
(26,'/upload/3-6.jpg','中畅佳禾 大麦 自然生长',NULL,'400g',59,10,0,'',3),
(27,'/upload/4-1.jpg','百威啤酒 经典灌装 小麦醇正拉罐',NULL,'500ml*3',26,10,0,'',4),
(28,'/upload/4-2.jpg','Perrier巴黎水天然含气矿泉水 开启生活新方式','天然气泡','330ml',9,10,0,'',4),
(29,'/upload/4-3.jpg','吉吉黑糖',NULL,'玫瑰花味180g',23,9,1,'',4),
(30,'/upload/4-4.jpg','北冰洋汽水','桔汁汽水330ml',NULL,5,10,0,'',4),
(31,'/upload/4-5.jpg','每日C葡萄柚汁',NULL,'300ml',6,10,0,'',4),
(32,'/upload/4-6.jpg','即品坚果 台湾甄选 颗颗饱满','留存水果本真 有滋有味','56g',12,5,5,'',6),
(33,'/upload/1-1.jpg','2134214','3141324','234',43214,4321,0,'',17),
(34,'/upload/2-1.jpg','福成尚品前腱子','','1000g',99,10,0,'',6),
(35,'/upload/2-2.jpg','牦牛精肉2斤+ 牦牛肋排2斤','自然生长','2kg',226,10,0,'',5),
(36,'/upload/2-3.jpg','巴美草香猪后臀尖 原味原香','精致美味，解锁味觉记忆','约500g',32,10,0,'',5),
(37,'/upload/2-4.jpg','农畉猪肉-猪脊骨 肉厚骨细','骨鲜髓足','约500g',13,10,0,'',5),
(38,'/upload/2-5.jpg','一品江村黄鸡','味道鲜美，口感软嫩弹滑','约1kg',46,10,0,'',5),
(39,'/upload/2-6.jpg','正大单冻鸡翅根 精选种鸡','富有弹性','约1kg',35,10,0,'',5),
(40,'/upload/1-1.jpg','测试','测试','1',1,1,0,'123',4),
(41,'/upload/1-1.jpg','111','222','333',123,666,0,'2',4),
(42,'/upload/1-1.jpg','gubeizhumeng','22','111',22,22,0,'111',4),
(43,'/upload/1-1.jpg','计算机冷链物流aaaaa','333','3',33,3,0,'333',4),
(44,'/upload/1-1.jpg','冰淇淋','1','1',2,1,0,'1',4),
(45,'/upload/1-1.jpg','shf','ewae','213',212,211,0,'222',5),
(46,'/upload/1-1.jpg','333','333','333',333,333,0,NULL,17),
(47,'/upload/1-1.jpg','111','11','11',111,111,0,'111111',5),
(48,'/upload/1-1.jpg','321','fagg','dsfsh',1,1,0,'1',5),
(49,'/upload/1-1.jpg','fsh','67','4523',45,45,0,'3ddasgav',17),
(50,'/upload/1-1.jpg','1','1','1',1,1,0,'1',5),
(51,'/upload/1-1.jpg','2','2','2',2,2,0,'2',5),
(52,'/upload/1-1.jpg','3','3','3',3,3,0,'3',5),
(53,'/upload/1-1.jpg','4','4','4',4,4,0,'4',6),
(54,'/upload/1-1.jpg','5','5','5',5,5,0,'5',17),
(55,'/upload/1-1.jpg','3546','314','3124',34,34,0,'fasdfasdf',17),
(56,'/upload/1-1.jpg','0','0','0',0,0,0,'0',6),
(57,'/upload/1-1.jpg','9','9','9',9,9,0,'9',6),
(58,'/upload/1-1.jpg','134','2341','321',231,3,0,'23',6),
(59,'/upload/1-1.jpg','1234','111','111',111,111,0,'1',17),
(60,'/upload/1-1.jpg','1324','432','431',1243,32,0,'421432',4);

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `price` int NOT NULL DEFAULT '0' COMMENT '购买时价格',
  `amount` int NOT NULL DEFAULT '0' COMMENT '购买数量',
  `order_id` int NOT NULL DEFAULT '0' COMMENT '订单ID',
  `good_id` int NOT NULL DEFAULT '0' COMMENT '商品ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='订单项';

/*Data for the table `items` */

insert  into `items`(`id`,`price`,`amount`,`order_id`,`good_id`) values 
(1,26,1,1,5),
(2,30,1,1,4),
(3,13,1,1,1),
(4,23,1,2,29),
(5,12,2,3,32),
(6,9,2,4,6),
(7,26,1,4,5),
(8,9,4,5,6),
(9,12,2,6,32),
(10,30,2,6,4),
(11,9,1,6,6),
(12,12,1,7,32),
(13,9,1,7,6),
(14,9,1,8,6),
(15,12,1,8,32),
(16,26,1,8,5),
(17,46,1,8,19),
(18,13,1,8,1),
(26,9,5,28,6),
(27,12,6,28,32),
(28,26,5,28,5),
(29,46,1,28,19),
(30,13,3,28,1),
(31,9,1,28,3),
(32,9,5,29,6),
(33,12,6,29,32),
(34,13,3,29,1),
(35,9,1,30,3),
(36,9,1,30,6),
(37,32,1,31,17),
(38,9,1,31,3),
(39,12,1,31,32),
(40,18,2,31,10),
(41,36,1,31,9),
(42,9,1,32,3),
(43,26,1,33,5),
(44,10,1,33,13),
(45,9,1,34,3),
(46,9,1,34,6),
(47,9,1,35,3),
(48,9,1,36,3),
(49,9,1,37,6);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `total` int NOT NULL DEFAULT '0' COMMENT '订单金额',
  `amount` int NOT NULL DEFAULT '0' COMMENT '商品总数',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '订单状态(1未付款/2已付款/3已发货/4已完成)',
  `paytype` tinyint NOT NULL DEFAULT '0' COMMENT '支付方式 (1微信/2支付宝)',
  `name` varchar(255) DEFAULT NULL COMMENT '收货人',
  `phone` varchar(255) DEFAULT NULL COMMENT '收货电话',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `systime` datetime DEFAULT NULL COMMENT '下单时间',
  `user_id` int NOT NULL DEFAULT '0' COMMENT '下单用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='订单';

/*Data for the table `orders` */

insert  into `orders`(`id`,`total`,`amount`,`status`,`paytype`,`name`,`phone`,`address`,`systime`,`user_id`) values 
(1,69,3,2,1,'七哥宝宝宝宝宝宝宝','123456789','上海浦东新区','2020-04-19 00:07:48',1),
(2,23,1,3,2,'七哥宝宝宝宝宝宝宝','123456789','上海浦东新区','2020-05-25 15:54:33',1),
(3,24,1,1,1,'七哥宝宝宝宝宝宝宝','123456789','上海浦东新区','2022-08-12 11:01:07',1),
(4,44,2,3,3,'张三','13311112222','aaa','2020-05-29 10:38:19',5),
(5,36,1,4,2,'七哥宝宝宝宝宝宝宝','123456789','上海浦东新区','2020-05-29 14:13:39',1),
(6,93,3,2,1,'密码123456','123456789abc','湖南浦东新区','2021-06-11 10:56:20',1),
(7,21,2,1,3,'密码123456','123456789abc','湖南浦东新区','2021-06-11 17:15:22',1),
(8,106,5,2,2,'密码123456','123456789abc','湖南浦东新区','2022-07-12 15:56:18',1),
(28,341,6,1,1,'密码123456','123456789abc','湖南浦东新区','2022-08-12 14:46:31',1),
(29,156,3,1,1,'密码123456','123456789abc','湖南浦东新区','2022-08-12 14:47:41',1),
(32,9,1,4,2,'密码123456','123456789abc','湖南浦东新区','2022-08-12 15:06:51',1),
(34,18,2,4,1,'密码123456','123456789abc','湖南浦东新区','2022-08-15 09:30:15',1),
(35,9,1,2,1,'密码123456','123456789abcd','湖南浦东新区','2022-08-16 09:59:02',1);

/*Table structure for table `tops` */

DROP TABLE IF EXISTS `tops`;

CREATE TABLE `tops` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL DEFAULT '1' COMMENT '推荐类型(1今日推荐)',
  `good_id` int NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='推荐商品';

/*Data for the table `tops` */

insert  into `tops`(`id`,`type`,`good_id`) values 
(3,1,3),
(6,1,6),
(8,1,32),
(40,1,22),
(42,1,17),
(43,1,19),
(44,1,9),
(45,1,12),
(46,1,14),
(48,1,1),
(49,1,2),
(51,1,25);

/*Table structure for table `types` */

DROP TABLE IF EXISTS `types`;

CREATE TABLE `types` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `num` int DEFAULT '0' COMMENT '排序号 (从小到大)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='分类';

/*Data for the table `types` */

insert  into `types`(`id`,`name`,`num`) values 
(1,'生态果蔬',1),
(2,'肉禽蛋奶',2),
(3,'米面粮油',3),
(4,'休闲零食',4),
(5,'玩具',5),
(6,'户外用品',6),
(17,'qiu',1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '收货人',
  `phone` varchar(255) DEFAULT NULL COMMENT '收货电话',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='用户';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`name`,`phone`,`address`) values 
(1,'user','123456','密码123456','123456789abc','湖南浦东新区111'),
(2,'77','123456','小宝宝','12315','黑龙江漠河'),
(3,'88','123456','大宝贝','10010','海南西沙群岛'),
(4,'99','123456','哈哈哈','10086','新疆阿拉善'),
(5,'zhangsan','123456','张三','13311112222','aaa'),
(6,'qiu','123456','QIU','111222333444','111222'),
(7,'111','123456','111','111','111'),
(9,'333','123456','333','333','333'),
(10,'444','123456','4441','4442','4443'),
(11,'555','123456','555','555','555'),
(12,'666','123456','666','666','666'),
(13,'777','123456','777','777','777');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
