SET NAMES UTF8;
DROP DATABASE IF EXISTS ola;
CREATE DATABASE	ola CHARSET=UTF8;
USE ola;
-- ----------------------------
-- Table structure for `ola_index_carousel`
-- ----------------------------
DROP TABLE IF EXISTS `ola_index_carousel`;
CREATE TABLE `ola_index_carousel` (
  `cid` int(11) NOT NULL auto_increment,
  `img` varchar(128) default NULL,
  `title` varchar(64) default NULL,
  `href` varchar(128) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ola_index_carousel
-- ----------------------------
INSERT INTO `ola_index_carousel` VALUES ('9', 'img/index/banner1.png', '轮播广告商品1', 'product_details.html?lid=28');
INSERT INTO `ola_index_carousel` VALUES ('10', 'img/index/banner2.png', '轮播广告商品2', 'product_details.html?lid=19');
INSERT INTO `ola_index_carousel` VALUES ('11', 'img/index/banner3.png', '轮播广告商品3', 'lookforward.html');
INSERT INTO `ola_index_carousel` VALUES ('12', 'img/index/banner4.png', '轮播广告商品4', 'lookforward.html');

-- ----------------------------
-- Table structure for `ola_index_product`
-- ----------------------------
DROP TABLE IF EXISTS `ola_index_product`;
CREATE TABLE `ola_index_product` (
  `pid` int(11) NOT NULL auto_increment,
  `title` varchar(64) default NULL,
  `details` varchar(128) default NULL,
  `pic` varchar(128) default NULL,
  `price` decimal(10,2) default NULL,
  `href` varchar(128) default NULL,
  `seq_recommended` tinyint(4) default NULL,
  `seq_new_arrival` tinyint(4) default NULL,
  `seq_top_sale` tinyint(4) default NULL,
  PRIMARY KEY  (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ola_index_product
-- ----------------------------
INSERT INTO `ola_index_product` VALUES ('8', 'Apple MacBook Air系列', '酷睿双核i5处理器|256GB SSD|8GB内存|英特尔HD显卡620含共享显卡内存', 'images/activity1.jpg', '6988.00', 'product_details.html?lid=1', '1', '1', '1');
INSERT INTO `ola_index_product` VALUES ('9', '小米Air 金属超轻薄', '酷睿双核i5处理器|512GB SSD|2GB内存|英特尔HD独立显卡', 'images/activity2.jpg', '3488.00', 'product_details.html?lid=5', '2', '2', '2');
INSERT INTO `ola_index_product` VALUES ('10', '联想E480C 轻薄系列', '酷睿双核i7处理器|256GB SSD|4GB内存|英特尔HD显卡680M', 'images/activity3.jpg', '5399.00', 'product_details.html?lid=9', '3', '3', '3');
INSERT INTO `ola_index_product` VALUES ('11', '华硕RX310 金属超极本', '酷睿双核i5处理器|512GB SSD|4GB内存|英特尔HD游戏级显卡', 'images/activity.jpg', '4966.00', 'product_details.html?lid=13', '4', '4', '4');



-- ----------------------------
-- Table structure for `ola_laptop_family`
-- ----------------------------
DROP TABLE IF EXISTS `ola_laptop_family`;
CREATE TABLE `ola_laptop_family` (
  `fid` int(11) NOT NULL auto_increment,
  `fname` varchar(32) default NULL,
  PRIMARY KEY  (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ola_laptop_family
-- ----------------------------
INSERT INTO `ola_laptop_family` VALUES ('1', 'AppleMacBookAir');
INSERT INTO `ola_laptop_family` VALUES ('2', '小米Air');
INSERT INTO `ola_laptop_family` VALUES ('3', 'ThinkPadE480C');
INSERT INTO `ola_laptop_family` VALUES ('4', '华硕RX310UQ');
INSERT INTO `ola_laptop_family` VALUES ('5', '联想小新700');
INSERT INTO `ola_laptop_family` VALUES ('6', '戴尔燃7000');
INSERT INTO `ola_laptop_family` VALUES ('7', '戴尔灵越15PR-5745B');
INSERT INTO `ola_laptop_family` VALUES ('8', 'ThinkPadE470 C');
INSERT INTO `ola_laptop_family` VALUES ('9', '华硕FH5900V');
INSERT INTO `ola_laptop_family` VALUES ('10', '神舟战神Z7M-KP7GT');


-- ----------------------------
-- Table structure for `ola_order`
-- ----------------------------
DROP TABLE IF EXISTS `ola_order`;
CREATE TABLE `ola_order` (
  `aid` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `address_id` int(11) default NULL,
  `status` int(11) default NULL,
  `order_time` bigint(20) default NULL,
  `pay_time` bigint(20) default NULL,
  `deliver_time` bigint(20) default NULL,
  `received_time` bigint(20) default NULL,
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ola_order
-- ----------------------------

-- ----------------------------
-- Table structure for `ola_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `ola_order_detail`;
CREATE TABLE `ola_order_detail` (
  `did` int(11) NOT NULL auto_increment,
  `order_id` int(11) default NULL,
  `product_id` int(11) default NULL,
  `count` int(11) default NULL,
  PRIMARY KEY  (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ola_order_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `ola_receiver_address`
-- ----------------------------
DROP TABLE IF EXISTS `ola_receiver_address`;
CREATE TABLE `ola_receiver_address` (
  `aid` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `receiver` varchar(16) default NULL,
  `province` varchar(16) default NULL,
  `city` varchar(16) default NULL,
  `county` varchar(16) default NULL,
  `address` varchar(128) default NULL,
  `cellphone` varchar(16) default NULL,
  `fixedphone` varchar(16) default NULL,
  `postcode` char(6) default NULL,
  `tag` varchar(16) default NULL,
  `is_default` tinyint(1) default NULL,
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ola_receiver_address
-- ----------------------------



-- ----------------------------
-- Table structure for `ola_user`
-- ----------------------------
DROP TABLE IF EXISTS `ola_user`;
CREATE TABLE `ola_user` (
  `uid` int(11) NOT NULL auto_increment,
  `uname` varchar(32) default NULL,
  `upwd` varchar(32) default NULL,
  `email` varchar(64) default NULL,
  `phone` varchar(16) default NULL,
  `avatar` varchar(128) default NULL,
  `user_name` varchar(32) default NULL,
  `gender` int(11) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ola_user
#用户表
-- ----------------------------
INSERT INTO `ola_user` VALUES ('1', 'dingding', '123456', 'ding@qq.com', '13511011000', 'img/avatar/default.png', '丁春秋', '0');
INSERT INTO `ola_user` VALUES ('2', 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '当当喵', '1');
INSERT INTO `ola_user` VALUES ('3', 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1');
INSERT INTO `ola_user` VALUES ('4', 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');



-- ----------------------------
-- Table structure for `ola_index_product2`
-- ----------------------------
DROP TABLE IF EXISTS `ola_index_product2`;
CREATE TABLE `ola_index_product2` (
  `pid` int(11) NOT NULL auto_increment,
  `pic` varchar(128) default NULL,
	`details` varchar(128) default NULL,
	`subdetails` varchar(128)	default NULL,
  `href` varchar(128) default NULL,
  `seq_recommended` tinyint(4) default NULL,
  `seq_new_arrival` tinyint(4) default NULL,
  `seq_top_sale` tinyint(4) default NULL,
  PRIMARY KEY  (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ola_index_product2
-- ----------------------------
INSERT INTO `ola_index_product2` VALUES ('1','images/2016.png','今日','推荐','introduction.html?lid=1', '1', '1', '1');
INSERT INTO `ola_index_product2` VALUES ('2','images/tj.png','真的有鱼','开年福利篇','introduction.html?lid=5', '2', '2', '2');
INSERT INTO `ola_index_product2` VALUES ('3','images/tj1.png','囤货过冬','让爱早回家','introduction.html?lid=9', '3', '3', '3');
INSERT INTO `ola_index_product2` VALUES ('4','images/tj2.png','浪漫情人节','甜甜蜜蜜','introduction.html?lid=13', '4', '4', '4');





-- ----------------------------
-- Table structure for `ola_index_product1`
-- ----------------------------
DROP TABLE IF EXISTS `ola_index_product1`;
CREATE TABLE `ola_index_product1` (
  `pid` int(11) NOT NULL auto_increment,
  `pic` varchar(128) default NULL,
  `href` varchar(128) default NULL,
  `seq_recommended` tinyint(4) default NULL,
  `seq_new_arrival` tinyint(4) default NULL,
  `seq_top_sale` tinyint(4) default NULL,
  PRIMARY KEY  (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ola_index_product1
-- ----------------------------
INSERT INTO `ola_index_product1` VALUES ('5','images/activity1.jpg','introduction.html?lid=1', '1', '1', '1');
INSERT INTO `ola_index_product1` VALUES ('6','images/activity2.jpg','introduction.html?lid=5', '2', '2', '2');
INSERT INTO `ola_index_product1` VALUES ('7','images/activity3.jpg','introduction.html?lid=9', '3', '3', '3');
INSERT INTO `ola_index_product1` VALUES ('8','images/activity.jpg','introduction.html?lid=13', '4', '4', '4');



-- ----------------------------
-- Table structure for `ola_index_product3`
-- ----------------------------
DROP TABLE IF EXISTS `ola_index_product3`;
CREATE TABLE `ola_index_product3` (
  `pid` int(11) NOT NULL auto_increment,
  `pic` varchar(128) default NULL,
	`price` double(6,2) default NULL,
	`details` varchar(128) default NULL,
  `href` varchar(128) default NULL,
  `seq_recommended` tinyint(4) default NULL,
  `seq_new_arrival` tinyint(4) default NULL,
  `seq_top_sale` tinyint(4) default NULL,
  PRIMARY KEY  (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ola_index_product3
-- ----------------------------
INSERT INTO `ola_index_product3` VALUES ('9','images/1.jpg','13.8','雪之恋风大福','introduction.html?lid=1', '1', '1', '1');
INSERT INTO `ola_index_product3` VALUES ('10','images/2.jpg','13.8','雪之恋风大福','introduction.html?lid=5', '2', '2', '2');
INSERT INTO `ola_index_product3` VALUES ('11','images/5.jpg','4.8','小优布丁','introduction.html?lid=9', '3', '3', '3');
INSERT INTO `ola_index_product3` VALUES ('12','images/3.jpg','13.8','雪之恋风大福','introduction.html?lid=13', '4', '4', '4');
INSERT INTO `ola_index_product3` VALUES ('13','images/4.jpg','13.8','雪之恋风大福','introduction.html?lid=1', '1', '1', '1');
INSERT INTO `ola_index_product3` VALUES ('14','images/5.jpg','4.8','小优布丁','introduction.html?lid=5', '2', '2', '2');







-- ----------------------------
-- Table structure for `ola_laptop`
-- ----------------------------
DROP TABLE IF EXISTS `ola_laptop`;
CREATE TABLE `ola_laptop` (
  `lid` int(11) NOT NULL auto_increment,
  `family_id` int(11) default NULL,
  `title` varchar(128) default NULL,
	`msales` int(11) default NULL,
  `sales` int(11) default NULL,
  `price` decimal(10,2) default NULL,
 #`promise` varchar(64) default NULL,
	`spec` varchar(64) default NULL,
 # `lname` varchar(32) default NULL,
 # `os` varchar(32) default NULL,
 # `memory` varchar(32) default NULL,
 # `resolution` varchar(32) default NULL,
 # `video_card` varchar(32) default NULL,
 # `cpu` varchar(32) default NULL,
 # `video_memory` varchar(32) default NULL,
 # `category` varchar(32) default NULL,
 # `disk` varchar(32) default NULL,
 # `details` varchar(1024) default NULL,
 # `shelf_time` bigint(20) default NULL,
 # `sold_count` int(11) default NULL,
 # `is_onsale` tinyint(1) default NULL,
  PRIMARY KEY  (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ola_laptop
-- ----------------------------
INSERT INTO `ola_laptop` VALUES ('1', '1', '良品铺子 手剥松子218g 坚果炒货 巴西松子','85','1500', '56.90',"原味");
INSERT INTO `ola_laptop` VALUES ('2', '1', '良品铺子 手剥松子218g 坚果炒货 巴西松子','49', '1200', '57.90',"奶油");
INSERT INTO `ola_laptop` VALUES ('3', '1', '良品铺子 手剥松子218g 坚果炒货 巴西松子','89', '1700', '58.90',"咸香");
INSERT INTO `ola_laptop` VALUES ('4', '1', '良品铺子 手剥松子218g 坚果炒货 巴西松子','94', '1900', '59.90',"炭烧");
INSERT INTO `ola_laptop` VALUES ('5', '2', '良品铺子 手剥瓜子218g 坚果炒货 巴西瓜子','125', '1000', '60.90',"原味");
INSERT INTO `ola_laptop` VALUES ('6', '2', '良品铺子 手剥瓜子218g 坚果炒货 巴西瓜子','542', '800', '61.90',"奶油");
INSERT INTO `ola_laptop` VALUES ('7', '2', '良品铺子 手剥瓜子218g 坚果炒货 巴西瓜子','358', '2000', '62.90',"咸香");
INSERT INTO `ola_laptop` VALUES ('8', '2', '良品铺子 手剥瓜子218g 坚果炒货 巴西瓜子','541', '642', '63.90',"炭烧");
INSERT INTO `ola_laptop` VALUES ('9', '3', '良品铺子 手剥瓜子218g 坚果炒货 巴西瓜子','123', '351', '64.90',"原味");
INSERT INTO `ola_laptop` VALUES ('10', '3', '良品铺子 手剥花生218g 坚果炒货 巴西花生','51', '425', '65.90',"奶油");
INSERT INTO `ola_laptop` VALUES ('11', '3', '良品铺子 手剥花生218g 坚果炒货 巴西花生','254', '874', '66.90',"咸香");
INSERT INTO `ola_laptop` VALUES ('12', '3', '良品铺子 手剥花生218g 坚果炒货 巴西花生','52' ,'374', '67.90',"炭烧");
INSERT INTO `ola_laptop` VALUES ('13', '4', '良品铺子 手剥碧根果218g 坚果炒货 巴西碧根果','97', '752', '68.90',"原味");
INSERT INTO `ola_laptop` VALUES ('14', '4', '良品铺子 手剥碧根果218g 坚果炒货 巴西碧根果','52', '985', '69.90',"奶油");
INSERT INTO `ola_laptop` VALUES ('15', '4', '良品铺子 手剥碧根果218g 坚果炒货 巴西碧根果','74', '742', '70.90',"咸香");
INSERT INTO `ola_laptop` VALUES ('16', '4', '良品铺子 手剥碧根果218g 坚果炒货 巴西碧根果','57', '427', '71.90',"炭烧");
INSERT INTO `ola_laptop` VALUES ('17', '5', '良品铺子 手剥夏威夷果218g 坚果炒货 巴西夏威夷果','79', '7582', '72.90',"原味");
INSERT INTO `ola_laptop` VALUES ('18', '5', '良品铺子 手剥夏威夷果218g 坚果炒货 巴西夏威夷果','975', '8554', '73.90',"奶油");
INSERT INTO `ola_laptop` VALUES ('19', '5', '良品铺子 手剥夏威夷果218g 坚果炒货 巴西夏威夷果','425','1458', '74.90',"咸香");



-- ----------------------------
-- Table structure for `ola_laptop_pic`
-- ----------------------------
DROP TABLE IF EXISTS `ola_laptop_pic`;
CREATE TABLE `ola_laptop_pic` (
  `pid` int(11) NOT NULL auto_increment,
  `laptop_id` int(11) default NULL,
  `sm` varchar(128) default NULL,
  `md` varchar(128) default NULL,
  `lg` varchar(128) default NULL,
  PRIMARY KEY  (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ola_laptop_pic
-- ----------------------------
INSERT INTO `ola_laptop_pic` VALUES ('1', '1', 'images/01_small.jpg', 'images/01_mid.jpg', 'images/01_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('2', '1', 'images/02_small.jpg', 'images/02_mid.jpg', 'images/02_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('3', '1', 'images/03_small.jpg', 'images/03_mid.jpg', 'images/03_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('4', '1', 'images/04_small.jpg', 'images/04_mid.jpg', 'images/04_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('5', '1', 'images/05_small.jpg', 'images/05_mid.jpg', 'images/05_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('6', '1', 'images/06_small.jpg', 'images/06_mid.jpg', 'images/06_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('7', '1', 'images/07_small.jpg', 'images/07_mid.jpg', 'images/07_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('8', '2', 'images/01_small.jpg', 'images/01_mid.jpg', 'images/01_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('9', '3', 'images/02_small.jpg', 'images/02_mid.jpg', 'images/02_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('10', '4', 'images/03_small.jpg', 'images/03_mid.jpg', 'images/03_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('11', '4', 'images/04_small.jpg', 'images/04_mid.jpg', 'images/04_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('12', '4', 'images/05_small.jpg', 'images/05_mid.jpg', 'images/05_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('13', '4', 'images/06_small.jpg', 'images/06_mid.jpg', 'images/06_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('14', '5', 'images/07_small.jpg', 'images/07_mid.jpg', 'images/07_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('15', '5', 'images/01_small.jpg', 'images/01_mid.jpg', 'images/01_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('16', '5', 'images/02_small.jpg', 'images/02_mid.jpg', 'images/02_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('17', '5', 'images/03_small.jpg', 'images/03_mid.jpg', 'images/03_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('18', '5', 'images/04_small.jpg', 'images/04_mid.jpg', 'images/04_big.jpg');
INSERT INTO `ola_laptop_pic` VALUES ('19', '5', 'images/05_small.jpg', 'images/05_mid.jpg', 'images/05_big.jpg');









-- ----------------------------
-- Table structure for `ola_shoppingcart_item`
-- ----------------------------
DROP TABLE IF EXISTS `ola_shoppingcart_item`;
CREATE TABLE `ola_shoppingcart_item` (
  `iid` int(11) NOT NULL auto_increment,
  `user_id` int(11),
  `product_id` int(11),
  `count` int(11),
  `is_checked` tinyint(1),
  PRIMARY KEY  (`iid`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ola_shoppingcart_item
-- ----------------------------
INSERT INTO `ola_shoppingcart_item` VALUES ('1', '2', '17', '1', '0');
INSERT INTO `ola_shoppingcart_item` VALUES ('2', '2', '11', '1', '0');
INSERT INTO `ola_shoppingcart_item` VALUES ('3', '3', '1', '1', '1');
INSERT INTO `ola_shoppingcart_item` VALUES ('4', '3', '3', '9', '0');
INSERT INTO `ola_shoppingcart_item` VALUES ('5', '3', '1', '1', '0');
INSERT INTO `ola_shoppingcart_item` VALUES ('6', '4', '1', '1', '1');
INSERT INTO `ola_shoppingcart_item` VALUES ('7', '4', '17', '11', '1');
INSERT INTO `ola_shoppingcart_item` VALUES ('8', '4', '13', '1', '0');
INSERT INTO `ola_shoppingcart_item` VALUES ('9', '4', '2', '1', '1');
INSERT INTO `ola_shoppingcart_item` VALUES ('10', '4', '13', '1', '1');
INSERT INTO `ola_shoppingcart_item` VALUES ('11', '4', '14', '1', '1');
INSERT INTO `ola_shoppingcart_item` VALUES ('12', '4', '1', '99997', '0');

