/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50162
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2016-03-27 23:53:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_books
-- ----------------------------
DROP TABLE IF EXISTS `tb_books`;
CREATE TABLE `tb_books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `bookCount` int(10) unsigned NOT NULL,
  `author` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_books
-- ----------------------------
INSERT INTO `tb_books` VALUES ('3', '笑傲江湖', '99', '2', '金庸');
INSERT INTO `tb_books` VALUES ('4', '倚天屠龙记', '100', '1', '金庸');
INSERT INTO `tb_books` VALUES ('5', '白发魔女传', '88', '3', '梁羽生');
