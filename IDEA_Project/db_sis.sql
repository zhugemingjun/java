/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : db_sis

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 05/10/2020 20:22:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_
-- ----------------------------
DROP TABLE IF EXISTS `admin_`;
CREATE TABLE `admin_`  (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `phone_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_
-- ----------------------------
INSERT INTO `admin_` VALUES (3, '特朗普', '123456', '圣地垭口', '15107732319', '管理员');
INSERT INTO `admin_` VALUES (4, 'staff', '123456', 'China', '15107732318', '员工');
INSERT INTO `admin_` VALUES (5, '川建国同志', '123456', '川建国', '15107732317', '管理员');
INSERT INTO `admin_` VALUES (6, 'admin', '123456', '川建国', '15107732316', '管理员');
INSERT INTO `admin_` VALUES (10, 'admin1', '123456', '诸葛明君', '15107732319', '管理员');
INSERT INTO `admin_` VALUES (11, 'admin10', '123456', '老党', '15107732317', '管理员');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `sno` int(20) NOT NULL COMMENT '员工ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '员工姓名',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '员工性别',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '员工职位',
  `phone_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `enroldate` date DEFAULT NULL COMMENT '入职时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES (3, '诸葛明君', '男', '总裁', '15107732319', '2020-10-04');
INSERT INTO `staff` VALUES (4, '诸葛明军', '女', '财务总监', '15107732319', '2020-10-04');
INSERT INTO `staff` VALUES (6, '哈哈哈', '女', 'python开发师', '15107732319', '2020-10-04');
INSERT INTO `staff` VALUES (7, '诸葛明君', '男', '总裁', '15107732319', '2020-10-01');
INSERT INTO `staff` VALUES (10, '诸葛明君', '男', '总裁', '15107732319', '2020-10-03');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `sno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hometown` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `enroldate` date DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (2, '2019010101', '刘琦', '男', '广东广州', '2018-06-06', '公艺术设计学院', 'liuqi@163.com', '13423432688');
INSERT INTO `student` VALUES (3, '2019010102', '孙晓峰', '男', '广西南宁', '2016-03-04', '新闻传播学院', 'sunxf@163.com', '13623432674');
INSERT INTO `student` VALUES (4, '2019010103', '周迅', '女', '广东惠州', '2018-09-12', '外国语学院', 'zhouxun@163.com', '13423312658');
INSERT INTO `student` VALUES (5, '2019010108', '张慧芳', '女', '广东中山', '2014-12-30', '新闻传播学院', 'huifang@163.com', '13423432645');
INSERT INTO `student` VALUES (6, '1761300128', '诸葛明君', '男', '桂林', '2020-09-25', '计算机科学与技术学院', '1328949166@qq.com', '15107732319');
INSERT INTO `student` VALUES (7, '3', '诸葛明君', '男', NULL, '2020-10-01', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for wage
-- ----------------------------
DROP TABLE IF EXISTS `wage`;
CREATE TABLE `wage`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `sno` int(255) NOT NULL COMMENT '员工ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '员工姓名',
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '员工职位',
  `year` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '年',
  `month` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '月',
  `basic_wage` double(255, 0) DEFAULT NULL COMMENT '基本工资（底薪）',
  `subsidy` double(255, 0) DEFAULT NULL COMMENT '绩效',
  `bonus` double(255, 0) DEFAULT NULL COMMENT '奖金',
  `tax` double(255, 0) DEFAULT NULL COMMENT '税收',
  `real_wage` double(255, 0) DEFAULT NULL COMMENT '实际工资',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wage
-- ----------------------------
INSERT INTO `wage` VALUES (2, 7, '诸葛明君', '财务总监', '2011年', '2月', 1500, 400, 300, 400, 1600);
INSERT INTO `wage` VALUES (3, 7, '诸葛明军', '总裁', '2012年', '1月', 70, 400, 300, 400, 1600);
INSERT INTO `wage` VALUES (4, 6, '诸葛明君', '财务总监', '2010年', '1月', 1500, 400, 300, 400, 1600);
INSERT INTO `wage` VALUES (5, 4, '诸葛xx', '财务总监', '2011年', '1月', 1500, 400, 300, 400, 1600);
INSERT INTO `wage` VALUES (6, 4, '诸葛mingx', '财务主管', '2011年', '3月', 1500, 400, 300, 400, 1600);
INSERT INTO `wage` VALUES (7, 10, '诸葛明军', '财务总监', '2012年', '1月', 3000, 1000, 1000, 450, 4550);
INSERT INTO `wage` VALUES (8, 4, '诸葛明君', '技术主管', '2011年', '1月', 4000, -500, 0, 0, 3500);

SET FOREIGN_KEY_CHECKS = 1;
