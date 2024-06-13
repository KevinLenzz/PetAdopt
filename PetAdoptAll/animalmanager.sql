/*
 Navicat Premium Data Transfer

 Source Server         : learning
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : localhost:3306
 Source Schema         : animalmanager

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 08/06/2024 23:42:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adoption
-- ----------------------------
DROP TABLE IF EXISTS `adoption`;
CREATE TABLE `adoption`  (
  `petCode` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userCode` int NOT NULL,
  `applyTime` datetime NOT NULL,
  `adptState` enum('未审核','已通过','未通过') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`petCode`, `userCode`) USING BTREE,
  INDEX `uC-uC3`(`userCode` ASC) USING BTREE,
  CONSTRAINT `uC-uC3` FOREIGN KEY (`userCode`) REFERENCES `user` (`userCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adoption
-- ----------------------------
INSERT INTO `adoption` VALUES ('1', 1, '2024-06-06 14:00:04', '已通过');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `employeeCode` int NOT NULL,
  `eplyName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `isManager` bit(1) NOT NULL,
  PRIMARY KEY (`employeeCode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'sdfsdf', '1', b'1');
INSERT INTO `employee` VALUES (2, 'sffds', '2', b'0');

-- ----------------------------
-- Table structure for employeetrack
-- ----------------------------
DROP TABLE IF EXISTS `employeetrack`;
CREATE TABLE `employeetrack`  (
  `employeeCode` int NOT NULL,
  `track` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `stepTime` datetime NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employeetrack
-- ----------------------------
INSERT INTO `employeetrack` VALUES (1, '确认订单：6', '2024-06-08 22:18:44');
INSERT INTO `employeetrack` VALUES (1, '确认订单：6', '2024-06-08 22:18:44');
INSERT INTO `employeetrack` VALUES (1, '设置订单到货：6', '2024-06-08 22:18:46');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `itemCode` int NOT NULL AUTO_INCREMENT,
  `itemName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `itemType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `sales` int NOT NULL,
  PRIMARY KEY (`itemCode`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES (1, 'a', 'sss', 2.00, 2);
INSERT INTO `item` VALUES (2, 'd', 'ddd', 44.00, 3);
INSERT INTO `item` VALUES (4, 'sdds', 'ddsds', 10.00, 0);
INSERT INTO `item` VALUES (7, 'eret', 'rr', 10.00, 1);
INSERT INTO `item` VALUES (8, 'wer', 'weewr', 22.00, 0);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `orderCode` int NOT NULL AUTO_INCREMENT,
  `userCode` int NOT NULL,
  `targetAddress` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `orderTime` datetime NOT NULL,
  `orderState` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`orderCode`) USING BTREE,
  INDEX `uC-uC2`(`userCode` ASC) USING BTREE,
  CONSTRAINT `uC-uC2` FOREIGN KEY (`userCode`) REFERENCES `user` (`userCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (6, 1, 'aaa', '2024-06-06 20:21:33', '订单已到货');
INSERT INTO `order` VALUES (8, 1, '2', '2024-06-08 09:53:48', '商家未确认');
INSERT INTO `order` VALUES (10, 1, 'sfdsdf', '2024-06-08 23:33:54', '商家未确认');

-- ----------------------------
-- Table structure for orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`  (
  `orderCode` int NOT NULL,
  `itemCode` int NOT NULL,
  `amount` int NOT NULL,
  INDEX `iC-iC`(`itemCode` ASC) USING BTREE,
  INDEX `oC-oC`(`orderCode` ASC) USING BTREE,
  CONSTRAINT `iC-iC` FOREIGN KEY (`itemCode`) REFERENCES `item` (`itemCode`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `oC-oC` FOREIGN KEY (`orderCode`) REFERENCES `order` (`orderCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES (6, 2, 2);
INSERT INTO `orderdetail` VALUES (8, 2, 3);
INSERT INTO `orderdetail` VALUES (6, 2, 3);
INSERT INTO `orderdetail` VALUES (10, 2, 1);
INSERT INTO `orderdetail` VALUES (10, 7, 1);

-- ----------------------------
-- Table structure for pet
-- ----------------------------
DROP TABLE IF EXISTS `pet`;
CREATE TABLE `pet`  (
  `petCode` int NOT NULL AUTO_INCREMENT,
  `petName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `breed` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `activeArea` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `profile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `isAdoptable` bit(1) NOT NULL,
  `isNeutered` bit(1) NOT NULL,
  `stateCode` int NULL DEFAULT NULL,
  PRIMARY KEY (`petCode`) USING BTREE,
  INDEX `s-s`(`stateCode` ASC) USING BTREE,
  CONSTRAINT `s-s` FOREIGN KEY (`stateCode`) REFERENCES `petstate` (`stateCode`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pet
-- ----------------------------
INSERT INTO `pet` VALUES (1, 'dfdf', 'df', 'df', 'df', b'1', b'1', 14);
INSERT INTO `pet` VALUES (5, 'sffs', 'sdf', 'sdf', 'sdffds', b'0', b'1', 15);

-- ----------------------------
-- Table structure for petstate
-- ----------------------------
DROP TABLE IF EXISTS `petstate`;
CREATE TABLE `petstate`  (
  `stateCode` int NOT NULL AUTO_INCREMENT,
  `userCode` int NULL DEFAULT NULL,
  `updateTime` datetime NOT NULL,
  `imageURL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `position` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`stateCode`) USING BTREE,
  INDEX `uC-uC`(`userCode` ASC) USING BTREE,
  CONSTRAINT `uC-uC` FOREIGN KEY (`userCode`) REFERENCES `user` (`userCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of petstate
-- ----------------------------
INSERT INTO `petstate` VALUES (1, 1, '2024-06-19 10:32:31', 'bg1.jpg', 'ds');
INSERT INTO `petstate` VALUES (2, 1, '2024-06-13 12:01:14', 'bg1.jpg', '222');
INSERT INTO `petstate` VALUES (11, 1, '2024-06-08 21:43:29', '屏幕截图 2024-01-03 180637.png', '23324');
INSERT INTO `petstate` VALUES (12, 1, '2024-06-08 21:44:30', '屏幕截图 2024-01-03 180637.png', '234');
INSERT INTO `petstate` VALUES (13, 1, '2024-06-08 21:45:02', '屏幕截图 2024-01-03 180637.png', 'werwe');
INSERT INTO `petstate` VALUES (14, 1, '2024-06-08 21:46:06', '屏幕截图 2024-01-03 180637.png', 'werwe');
INSERT INTO `petstate` VALUES (15, 1, '2024-06-08 21:57:40', 'bg2.jpg', 'aa');

-- ----------------------------
-- Table structure for review
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review`  (
  `itemCode` int NOT NULL,
  `rate` decimal(3, 1) NOT NULL,
  `userName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pushTime` datetime NOT NULL,
  INDEX `iC-iC3`(`itemCode` ASC) USING BTREE,
  CONSTRAINT `iC-iC3` FOREIGN KEY (`itemCode`) REFERENCES `item` (`itemCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of review
-- ----------------------------
INSERT INTO `review` VALUES (2, 1.0, 'aaa', 'fdsf', '2024-06-20 14:00:02');
INSERT INTO `review` VALUES (2, 0.5, 'aaa111', '2', '2024-06-08 14:36:27');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userCode` int NOT NULL AUTO_INCREMENT,
  `usName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `grade` enum('1','2','3','4','5','6','7') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `gender` enum('男','女') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telephone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `registerDate` datetime NOT NULL,
  `pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`userCode`) USING BTREE,
  UNIQUE INDEX `usName`(`usName` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'aaa111', '3', '男', '13333333333', '2024-06-05 17:14:55', '1');

-- ----------------------------
-- Triggers structure for table employee
-- ----------------------------
DROP TRIGGER IF EXISTS `ClearUselessTrack`;
delimiter ;;
CREATE TRIGGER `ClearUselessTrack` BEFORE DELETE ON `employee` FOR EACH ROW BEGIN
	DELETE FROM employeetrack WHERE employeetrack.employeeCode=old.employeeCode;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table pet
-- ----------------------------
DROP TRIGGER IF EXISTS `ClearUseLessState`;
delimiter ;;
CREATE TRIGGER `ClearUseLessState` BEFORE DELETE ON `pet` FOR EACH ROW BEGIN
	DELETE FROM petstate WHERE petstate.stateCode=old.stateCode;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
