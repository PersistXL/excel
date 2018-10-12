/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : localhost:3306
 Source Schema         : excel

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 22/04/2018 21:13:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for excel_column_name
-- ----------------------------
DROP TABLE IF EXISTS `excel_column_name`;
CREATE TABLE `excel_column_name`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `columnName` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for excel_data
-- ----------------------------
DROP TABLE IF EXISTS `excel_data`;
CREATE TABLE `excel_data`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `column1` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `column2` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `column3` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `column4` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `column5` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `column6` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `column7` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `column8` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `column9` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `column10` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
