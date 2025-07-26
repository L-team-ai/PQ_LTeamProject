/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : localhost:3306
 Source Schema         : two hours

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 26/07/2025 17:01:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options`  (
  `option_id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `num` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `is_answer` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`option_id`) USING BTREE,
  INDEX `subject_id`(`subject_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES (9, 3, 1, 'IDEA', 0);
INSERT INTO `options` VALUES (10, 3, 2, 'PyCharm', 0);
INSERT INTO `options` VALUES (11, 3, 3, 'Vue', 0);
INSERT INTO `options` VALUES (12, 3, 4, 'Visual Studio', 1);
INSERT INTO `options` VALUES (13, 4, 1, '使用个人账号直接提交代码', 0);
INSERT INTO `options` VALUES (14, 4, 2, 'fork团队账号下的项目', 1);
INSERT INTO `options` VALUES (15, 4, 3, '克隆项目到本地的云存储', 0);
INSERT INTO `options` VALUES (16, 4, 4, '通过公司服务器共享', 0);
INSERT INTO `options` VALUES (17, 5, 1, '7月9日', 0);
INSERT INTO `options` VALUES (18, 5, 2, '今晚', 0);
INSERT INTO `options` VALUES (19, 5, 3, '7月11日前', 1);
INSERT INTO `options` VALUES (20, 5, 4, '下周', 0);
INSERT INTO `options` VALUES (21, 6, 1, 'Python', 0);
INSERT INTO `options` VALUES (22, 6, 2, 'C++', 0);
INSERT INTO `options` VALUES (23, 6, 3, 'Verilog', 1);
INSERT INTO `options` VALUES (24, 6, 4, 'Java', 0);
INSERT INTO `options` VALUES (25, 7, 1, 'MATLAB', 0);
INSERT INTO `options` VALUES (26, 7, 2, 'Eclipse', 0);
INSERT INTO `options` VALUES (27, 7, 3, 'Vivado', 1);
INSERT INTO `options` VALUES (28, 7, 4, 'Visual Studio', 0);
INSERT INTO `options` VALUES (29, 8, 1, '操作数', 0);
INSERT INTO `options` VALUES (30, 8, 2, '运算类型', 1);
INSERT INTO `options` VALUES (31, 8, 3, '输入设备', 0);
INSERT INTO `options` VALUES (32, 8, 4, '显示方式', 0);
INSERT INTO `options` VALUES (41, 1, 1, 'AAA', 1);
INSERT INTO `options` VALUES (42, 1, 2, 'BBB', 0);
INSERT INTO `options` VALUES (43, 1, 3, 'CCC', 0);
INSERT INTO `options` VALUES (44, 1, 4, 'DDD', 0);
INSERT INTO `options` VALUES (45, 2, 1, 'EEE', 0);
INSERT INTO `options` VALUES (46, 2, 2, 'FFF', 0);
INSERT INTO `options` VALUES (47, 2, 3, 'GGG', 1);

-- ----------------------------
-- Table structure for th_admin
-- ----------------------------
DROP TABLE IF EXISTS `th_admin`;
CREATE TABLE `th_admin`  (
  `admin_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '管理员工号',
  `password` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `telephone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话号码',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_admin
-- ----------------------------
INSERT INTO `th_admin` VALUES ('admin', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', '10000001111');
INSERT INTO `th_admin` VALUES ('root', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', '10000001112');

-- ----------------------------
-- Table structure for th_answer
-- ----------------------------
DROP TABLE IF EXISTS `th_answer`;
CREATE TABLE `th_answer`  (
  `answer_id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int NULL DEFAULT NULL,
  `subject_type` int NULL DEFAULT NULL COMMENT '对应题目类型',
  `subject_id` int NULL DEFAULT NULL COMMENT '对应题目id',
  `subject_num` int NULL DEFAULT NULL COMMENT '对应题目序号',
  `user_id` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '答题用户id',
  `answer_num` int NULL DEFAULT NULL COMMENT '对应选择/填空的项数目',
  `answer` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户答案',
  `score` int NULL DEFAULT NULL COMMENT '用户所获分数',
  PRIMARY KEY (`answer_id`) USING BTREE,
  INDEX `subject_id`(`subject_id` ASC) USING BTREE,
  INDEX `exam_id`(`exam_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `th_answer_ibfk_3` FOREIGN KEY (`exam_id`) REFERENCES `th_exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `th_answer_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `th_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 592 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_answer
-- ----------------------------
INSERT INTO `th_answer` VALUES (298, 1, 1, 1, 1, 'stu023', 1, '1', 0);
INSERT INTO `th_answer` VALUES (299, 1, 1, 2, 2, 'stu023', 1, '3', 4);
INSERT INTO `th_answer` VALUES (300, 1, 1, 3, 3, 'stu023', 1, '7', 6);
INSERT INTO `th_answer` VALUES (301, 1, 1, 8, 4, 'stu023', 5, '', 0);
INSERT INTO `th_answer` VALUES (302, 1, 1, 6, 5, 'stu023', 1, '1', 5);
INSERT INTO `th_answer` VALUES (303, 1, 2, 1, 6, 'stu023', 3, '', 15);
INSERT INTO `th_answer` VALUES (304, 1, 2, 2, 7, 'stu023', 1, '', 0);
INSERT INTO `th_answer` VALUES (305, 1, 2, 3, 8, 'stu023', 3, '', 2);
INSERT INTO `th_answer` VALUES (306, 1, 3, 1, 9, 'stu023', 1, '1', 3);
INSERT INTO `th_answer` VALUES (307, 1, 3, 2, 10, 'stu023', 1, '1', 0);
INSERT INTO `th_answer` VALUES (308, 1, 3, 3, 11, 'stu023', 1, '1', 3);
INSERT INTO `th_answer` VALUES (309, 1, 4, 1, 12, 'stu023', 1, '<p>略</p>\n', 6);
INSERT INTO `th_answer` VALUES (310, 1, 4, 2, 13, 'stu023', 1, '<p>略</p>\n', 1);
INSERT INTO `th_answer` VALUES (311, 1, 4, 3, 14, 'stu023', 1, '<p>略</p>\n', 12);
INSERT INTO `th_answer` VALUES (312, 1, 2, 6, 15, 'stu023', 4, '', 3);
INSERT INTO `th_answer` VALUES (313, 1, 1, 1, 1, 'stu013', 1, '4', 4);
INSERT INTO `th_answer` VALUES (314, 1, 1, 2, 2, 'stu013', 1, '3', 4);
INSERT INTO `th_answer` VALUES (315, 1, 1, 3, 3, 'stu013', 1, '7', 6);
INSERT INTO `th_answer` VALUES (316, 1, 1, 8, 4, 'stu013', 5, '', 6);
INSERT INTO `th_answer` VALUES (317, 1, 1, 6, 5, 'stu013', 1, '1', 5);
INSERT INTO `th_answer` VALUES (318, 1, 2, 1, 6, 'stu013', 3, '', 15);
INSERT INTO `th_answer` VALUES (319, 1, 2, 2, 7, 'stu013', 1, '', 5);
INSERT INTO `th_answer` VALUES (320, 1, 2, 3, 8, 'stu013', 3, '', 6);
INSERT INTO `th_answer` VALUES (321, 1, 3, 1, 9, 'stu013', 1, '1', 3);
INSERT INTO `th_answer` VALUES (322, 1, 3, 2, 10, 'stu013', 1, '0', 3);
INSERT INTO `th_answer` VALUES (323, 1, 3, 3, 11, 'stu013', 1, '1', 3);
INSERT INTO `th_answer` VALUES (324, 1, 4, 1, 12, 'stu013', 1, '<p>略</p>\n', 12);
INSERT INTO `th_answer` VALUES (325, 1, 4, 2, 13, 'stu013', 1, '<p>略</p>\n', 12);
INSERT INTO `th_answer` VALUES (326, 1, 4, 3, 14, 'stu013', 1, '<p>略</p>\n', 12);
INSERT INTO `th_answer` VALUES (327, 1, 2, 6, 15, 'stu013', 4, '', 3);
INSERT INTO `th_answer` VALUES (328, 1, 1, 1, 1, 'stu033', 1, '4', 4);
INSERT INTO `th_answer` VALUES (329, 1, 1, 2, 2, 'stu033', 1, '3', 4);
INSERT INTO `th_answer` VALUES (330, 1, 1, 3, 3, 'stu033', 1, '7', 6);
INSERT INTO `th_answer` VALUES (331, 1, 1, 8, 4, 'stu033', 5, '', 0);
INSERT INTO `th_answer` VALUES (332, 1, 1, 6, 5, 'stu033', 1, '1', 5);
INSERT INTO `th_answer` VALUES (333, 1, 2, 1, 6, 'stu033', 3, '', 15);
INSERT INTO `th_answer` VALUES (334, 1, 2, 2, 7, 'stu033', 1, '', 5);
INSERT INTO `th_answer` VALUES (335, 1, 2, 3, 8, 'stu033', 3, '', 6);
INSERT INTO `th_answer` VALUES (336, 1, 3, 1, 9, 'stu033', 1, '1', 3);
INSERT INTO `th_answer` VALUES (337, 1, 3, 2, 10, 'stu033', 1, '0', 3);
INSERT INTO `th_answer` VALUES (338, 1, 3, 3, 11, 'stu033', 1, '1', 3);
INSERT INTO `th_answer` VALUES (339, 1, 4, 1, 12, 'stu033', 1, '<p>略</p>\n', 12);
INSERT INTO `th_answer` VALUES (340, 1, 4, 2, 13, 'stu033', 1, '<p>略</p>\n', 12);
INSERT INTO `th_answer` VALUES (341, 1, 4, 3, 14, 'stu033', 1, '<p>略</p>\n', 5);
INSERT INTO `th_answer` VALUES (342, 1, 2, 6, 15, 'stu033', 4, '', 3);
INSERT INTO `th_answer` VALUES (343, 1, 1, 1, 1, 'tea002', 1, '2', 0);
INSERT INTO `th_answer` VALUES (344, 1, 1, 2, 2, 'tea002', 1, '2', 0);
INSERT INTO `th_answer` VALUES (345, 1, 1, 3, 3, 'tea002', 1, '7', 6);
INSERT INTO `th_answer` VALUES (346, 1, 1, 8, 4, 'tea002', 5, '', 6);
INSERT INTO `th_answer` VALUES (347, 1, 1, 6, 5, 'tea002', 1, '3', 0);
INSERT INTO `th_answer` VALUES (348, 1, 2, 1, 6, 'tea002', 3, '', 15);
INSERT INTO `th_answer` VALUES (349, 1, 2, 2, 7, 'tea002', 1, '', 5);
INSERT INTO `th_answer` VALUES (350, 1, 2, 3, 8, 'tea002', 3, '', 0);
INSERT INTO `th_answer` VALUES (351, 1, 3, 1, 9, 'tea002', 1, '1', 3);
INSERT INTO `th_answer` VALUES (352, 1, 3, 2, 10, 'tea002', 1, '0', 3);
INSERT INTO `th_answer` VALUES (353, 1, 3, 3, 11, 'tea002', 1, '1', 3);
INSERT INTO `th_answer` VALUES (354, 1, 4, 1, 12, 'tea002', 1, '<p>0</p>\n', 12);
INSERT INTO `th_answer` VALUES (355, 1, 4, 2, 13, 'tea002', 1, '<p>0</p>\n', 12);
INSERT INTO `th_answer` VALUES (356, 1, 4, 3, 14, 'tea002', 1, '<p>0</p>\n', 8);
INSERT INTO `th_answer` VALUES (357, 1, 2, 6, 15, 'tea002', 4, '', 0);
INSERT INTO `th_answer` VALUES (358, 1, 1, 1, 1, 'tea004', 1, '3', 0);
INSERT INTO `th_answer` VALUES (359, 1, 1, 2, 2, 'tea004', 1, '3', 4);
INSERT INTO `th_answer` VALUES (360, 1, 1, 3, 3, 'tea004', 1, '7', 6);
INSERT INTO `th_answer` VALUES (361, 1, 1, 8, 4, 'tea004', 5, '', 0);
INSERT INTO `th_answer` VALUES (362, 1, 1, 6, 5, 'tea004', 1, '1', 5);
INSERT INTO `th_answer` VALUES (363, 1, 2, 1, 6, 'tea004', 3, '', 10);
INSERT INTO `th_answer` VALUES (364, 1, 2, 2, 7, 'tea004', 1, '', 0);
INSERT INTO `th_answer` VALUES (365, 1, 2, 3, 8, 'tea004', 3, '', 2);
INSERT INTO `th_answer` VALUES (366, 1, 3, 1, 9, 'tea004', 1, '0', 0);
INSERT INTO `th_answer` VALUES (367, 1, 3, 2, 10, 'tea004', 1, '1', 0);
INSERT INTO `th_answer` VALUES (368, 1, 3, 3, 11, 'tea004', 1, '1', 3);
INSERT INTO `th_answer` VALUES (369, 1, 4, 1, 12, 'tea004', 1, '<p>no</p>\n', 12);
INSERT INTO `th_answer` VALUES (370, 1, 4, 2, 13, 'tea004', 1, '<p>略</p>\n', 6);
INSERT INTO `th_answer` VALUES (371, 1, 4, 3, 14, 'tea004', 1, '<p>略</p>\n', 12);
INSERT INTO `th_answer` VALUES (372, 1, 2, 6, 15, 'tea004', 4, '', 2);
INSERT INTO `th_answer` VALUES (407, 1, 1, 1, 1, 'root', 1, '1', 0);
INSERT INTO `th_answer` VALUES (408, 1, 1, 2, 2, 'root', 1, '2', 0);
INSERT INTO `th_answer` VALUES (409, 1, 1, 3, 3, 'root', 1, '6', 0);
INSERT INTO `th_answer` VALUES (410, 1, 1, 8, 4, 'root', 5, '', 0);
INSERT INTO `th_answer` VALUES (411, 1, 1, 6, 5, 'root', 1, '2', 0);
INSERT INTO `th_answer` VALUES (412, 1, 2, 1, 6, 'root', 3, '', 0);
INSERT INTO `th_answer` VALUES (413, 1, 2, 2, 7, 'root', 1, '', 0);
INSERT INTO `th_answer` VALUES (414, 1, 2, 3, 8, 'root', 3, '', 0);
INSERT INTO `th_answer` VALUES (415, 1, 3, 1, 9, 'root', 1, '0', 0);
INSERT INTO `th_answer` VALUES (416, 1, 3, 2, 10, 'root', 1, '0', 3);
INSERT INTO `th_answer` VALUES (417, 1, 3, 3, 11, 'root', 1, '0', 0);
INSERT INTO `th_answer` VALUES (418, 1, 4, 1, 12, 'root', 1, '', 0);
INSERT INTO `th_answer` VALUES (419, 1, 4, 2, 13, 'root', 1, '', 0);
INSERT INTO `th_answer` VALUES (420, 1, 4, 3, 14, 'root', 1, '', 0);
INSERT INTO `th_answer` VALUES (421, 1, 2, 6, 15, 'root', 4, '', 0);
INSERT INTO `th_answer` VALUES (422, 2, 3, 5, 1, 'root', 1, '1', 5);
INSERT INTO `th_answer` VALUES (423, 1, 1, 1, 1, 'user1', 1, '1', 0);
INSERT INTO `th_answer` VALUES (424, 1, 1, 2, 2, 'user1', 1, '2', 0);
INSERT INTO `th_answer` VALUES (425, 1, 1, 3, 3, 'user1', 1, '6', 0);
INSERT INTO `th_answer` VALUES (426, 1, 1, 8, 4, 'user1', 5, '', 0);
INSERT INTO `th_answer` VALUES (427, 1, 1, 6, 5, 'user1', 1, '3', 0);
INSERT INTO `th_answer` VALUES (428, 1, 2, 1, 6, 'user1', 3, '', 0);
INSERT INTO `th_answer` VALUES (429, 1, 2, 2, 7, 'user1', 1, '', 0);
INSERT INTO `th_answer` VALUES (430, 1, 2, 3, 8, 'user1', 3, '', 0);
INSERT INTO `th_answer` VALUES (431, 1, 3, 1, 9, 'user1', 1, '0', 0);
INSERT INTO `th_answer` VALUES (432, 1, 3, 2, 10, 'user1', 1, '0', 3);
INSERT INTO `th_answer` VALUES (433, 1, 3, 3, 11, 'user1', 1, '0', 0);
INSERT INTO `th_answer` VALUES (434, 1, 4, 1, 12, 'user1', 1, '', 0);
INSERT INTO `th_answer` VALUES (435, 1, 4, 2, 13, 'user1', 1, '', 0);
INSERT INTO `th_answer` VALUES (436, 1, 4, 3, 14, 'user1', 1, '', 0);
INSERT INTO `th_answer` VALUES (437, 1, 2, 6, 15, 'user1', 4, '', 0);
INSERT INTO `th_answer` VALUES (438, 1, 1, 1, 1, 'user2', 1, '1', 0);
INSERT INTO `th_answer` VALUES (439, 1, 1, 2, 2, 'user2', 1, '1', 0);
INSERT INTO `th_answer` VALUES (440, 1, 1, 3, 3, 'user2', 1, '7', 6);
INSERT INTO `th_answer` VALUES (441, 1, 1, 8, 4, 'user2', 5, '', 0);
INSERT INTO `th_answer` VALUES (442, 1, 1, 6, 5, 'user2', 1, '2', 0);
INSERT INTO `th_answer` VALUES (443, 1, 2, 1, 6, 'user2', 3, '', 0);
INSERT INTO `th_answer` VALUES (444, 1, 2, 2, 7, 'user2', 1, '', 0);
INSERT INTO `th_answer` VALUES (445, 1, 2, 3, 8, 'user2', 3, '', 0);
INSERT INTO `th_answer` VALUES (446, 1, 3, 1, 9, 'user2', 1, '0', 0);
INSERT INTO `th_answer` VALUES (447, 1, 3, 2, 10, 'user2', 1, '0', 3);
INSERT INTO `th_answer` VALUES (448, 1, 3, 3, 11, 'user2', 1, '0', 0);
INSERT INTO `th_answer` VALUES (449, 1, 4, 1, 12, 'user2', 1, '', 0);
INSERT INTO `th_answer` VALUES (450, 1, 4, 2, 13, 'user2', 1, '', 0);
INSERT INTO `th_answer` VALUES (451, 1, 4, 3, 14, 'user2', 1, '', 0);
INSERT INTO `th_answer` VALUES (452, 1, 2, 6, 15, 'user2', 4, '', 0);
INSERT INTO `th_answer` VALUES (453, 27, 1, 20, 1, 'stu003', 1, '1', 5);
INSERT INTO `th_answer` VALUES (454, 1, 1, 1, 1, 'sdu001', 1, '1', 0);
INSERT INTO `th_answer` VALUES (455, 1, 1, 2, 2, 'sdu001', 1, '2', 0);
INSERT INTO `th_answer` VALUES (456, 1, 1, 3, 3, 'sdu001', 1, '5', 0);
INSERT INTO `th_answer` VALUES (457, 1, 1, 8, 4, 'sdu001', 5, '', 0);
INSERT INTO `th_answer` VALUES (458, 1, 1, 6, 5, 'sdu001', 1, '2', 0);
INSERT INTO `th_answer` VALUES (459, 1, 2, 1, 6, 'sdu001', 3, '', 0);
INSERT INTO `th_answer` VALUES (460, 1, 2, 2, 7, 'sdu001', 1, '', 0);
INSERT INTO `th_answer` VALUES (461, 1, 2, 3, 8, 'sdu001', 3, '', 0);
INSERT INTO `th_answer` VALUES (462, 1, 3, 1, 9, 'sdu001', 1, '1', 3);
INSERT INTO `th_answer` VALUES (463, 1, 3, 2, 10, 'sdu001', 1, '1', 0);
INSERT INTO `th_answer` VALUES (464, 1, 3, 3, 11, 'sdu001', 1, '1', 3);
INSERT INTO `th_answer` VALUES (465, 1, 4, 1, 12, 'sdu001', 1, '<p>11111111111111</p>\n', 3);
INSERT INTO `th_answer` VALUES (466, 1, 4, 2, 13, 'sdu001', 1, '<p>111111111111111111</p>\n', 9);
INSERT INTO `th_answer` VALUES (467, 1, 4, 3, 14, 'sdu001', 1, '<p>111111111111111</p>\n', 5);
INSERT INTO `th_answer` VALUES (468, 1, 2, 6, 15, 'sdu001', 4, '', 0);
INSERT INTO `th_answer` VALUES (469, 1, 1, 1, 1, 'sdu345', 1, '1', 0);
INSERT INTO `th_answer` VALUES (470, 1, 1, 2, 2, 'sdu345', 1, '2', 0);
INSERT INTO `th_answer` VALUES (471, 1, 1, 3, 3, 'sdu345', 1, '5', 0);
INSERT INTO `th_answer` VALUES (472, 1, 1, 8, 4, 'sdu345', 5, '', 0);
INSERT INTO `th_answer` VALUES (473, 1, 1, 6, 5, 'sdu345', 1, '3', 0);
INSERT INTO `th_answer` VALUES (474, 1, 2, 1, 6, 'sdu345', 3, '', 0);
INSERT INTO `th_answer` VALUES (475, 1, 2, 2, 7, 'sdu345', 1, '', 0);
INSERT INTO `th_answer` VALUES (476, 1, 2, 3, 8, 'sdu345', 3, '', 0);
INSERT INTO `th_answer` VALUES (477, 1, 3, 1, 9, 'sdu345', 1, '0', 0);
INSERT INTO `th_answer` VALUES (478, 1, 3, 2, 10, 'sdu345', 1, '0', 3);
INSERT INTO `th_answer` VALUES (479, 1, 3, 3, 11, 'sdu345', 1, '0', 0);
INSERT INTO `th_answer` VALUES (480, 1, 4, 1, 12, 'sdu345', 1, '', 0);
INSERT INTO `th_answer` VALUES (481, 1, 4, 2, 13, 'sdu345', 1, '', 0);
INSERT INTO `th_answer` VALUES (482, 1, 4, 3, 14, 'sdu345', 1, '', 0);
INSERT INTO `th_answer` VALUES (483, 1, 2, 6, 15, 'sdu345', 4, '', 0);
INSERT INTO `th_answer` VALUES (484, 1, 1, 1, 1, 'sdu346', 1, '2', 0);
INSERT INTO `th_answer` VALUES (485, 1, 1, 2, 2, 'sdu346', 1, '4', 0);
INSERT INTO `th_answer` VALUES (486, 1, 1, 3, 3, 'sdu346', 1, '5', 0);
INSERT INTO `th_answer` VALUES (487, 1, 1, 8, 4, 'sdu346', 5, '', 0);
INSERT INTO `th_answer` VALUES (488, 1, 1, 6, 5, 'sdu346', 1, '3', 0);
INSERT INTO `th_answer` VALUES (489, 1, 2, 1, 6, 'sdu346', 3, '', 0);
INSERT INTO `th_answer` VALUES (490, 1, 2, 2, 7, 'sdu346', 1, '', 0);
INSERT INTO `th_answer` VALUES (491, 1, 2, 3, 8, 'sdu346', 3, '', 0);
INSERT INTO `th_answer` VALUES (492, 1, 3, 1, 9, 'sdu346', 1, '0', 0);
INSERT INTO `th_answer` VALUES (493, 1, 3, 2, 10, 'sdu346', 1, '0', 3);
INSERT INTO `th_answer` VALUES (494, 1, 3, 3, 11, 'sdu346', 1, '0', 0);
INSERT INTO `th_answer` VALUES (495, 1, 4, 1, 12, 'sdu346', 1, '', 6);
INSERT INTO `th_answer` VALUES (496, 1, 4, 2, 13, 'sdu346', 1, '', 3);
INSERT INTO `th_answer` VALUES (497, 1, 4, 3, 14, 'sdu346', 1, '', 5);
INSERT INTO `th_answer` VALUES (498, 1, 2, 6, 15, 'sdu346', 4, '', 0);
INSERT INTO `th_answer` VALUES (499, 1, 1, 1, 1, 'sdu788', 1, '2', 0);
INSERT INTO `th_answer` VALUES (500, 1, 1, 2, 2, 'sdu788', 1, '2', 0);
INSERT INTO `th_answer` VALUES (501, 1, 1, 3, 3, 'sdu788', 1, '6', 0);
INSERT INTO `th_answer` VALUES (502, 1, 1, 8, 4, 'sdu788', 5, '', 0);
INSERT INTO `th_answer` VALUES (503, 1, 1, 6, 5, 'sdu788', 1, '2', 0);
INSERT INTO `th_answer` VALUES (504, 1, 2, 1, 6, 'sdu788', 3, '', 0);
INSERT INTO `th_answer` VALUES (505, 1, 2, 2, 7, 'sdu788', 1, '', 0);
INSERT INTO `th_answer` VALUES (506, 1, 2, 3, 8, 'sdu788', 3, '', 0);
INSERT INTO `th_answer` VALUES (507, 1, 3, 1, 9, 'sdu788', 1, '1', 3);
INSERT INTO `th_answer` VALUES (508, 1, 3, 2, 10, 'sdu788', 1, '1', 0);
INSERT INTO `th_answer` VALUES (509, 1, 3, 3, 11, 'sdu788', 1, '0', 0);
INSERT INTO `th_answer` VALUES (510, 1, 4, 1, 12, 'sdu788', 1, '<p><strong>41242342342334234234234234<sup>23423432</sup></strong></p>\n', 8);
INSERT INTO `th_answer` VALUES (511, 1, 4, 2, 13, 'sdu788', 1, '<p>423423423423423423</p>\n', 3);
INSERT INTO `th_answer` VALUES (512, 1, 4, 3, 14, 'sdu788', 1, '<p>423423423423423</p>\n', 1);
INSERT INTO `th_answer` VALUES (513, 1, 2, 6, 15, 'sdu788', 4, '', 0);
INSERT INTO `th_answer` VALUES (514, 1, 1, 1, 1, 'sdu143', 1, '1', 0);
INSERT INTO `th_answer` VALUES (515, 1, 1, 2, 2, 'sdu143', 1, '3', 4);
INSERT INTO `th_answer` VALUES (516, 1, 1, 3, 3, 'sdu143', 1, '5', 0);
INSERT INTO `th_answer` VALUES (517, 1, 1, 8, 4, 'sdu143', 5, '', 0);
INSERT INTO `th_answer` VALUES (518, 1, 1, 6, 5, 'sdu143', 1, '2', 0);
INSERT INTO `th_answer` VALUES (519, 1, 2, 1, 6, 'sdu143', 3, '', 0);
INSERT INTO `th_answer` VALUES (520, 1, 2, 2, 7, 'sdu143', 1, '', 0);
INSERT INTO `th_answer` VALUES (521, 1, 2, 3, 8, 'sdu143', 3, '', 0);
INSERT INTO `th_answer` VALUES (522, 1, 3, 1, 9, 'sdu143', 1, '1', 3);
INSERT INTO `th_answer` VALUES (523, 1, 3, 2, 10, 'sdu143', 1, '0', 3);
INSERT INTO `th_answer` VALUES (524, 1, 3, 3, 11, 'sdu143', 1, '0', 0);
INSERT INTO `th_answer` VALUES (525, 1, 4, 1, 12, 'sdu143', 1, '<p>3123213</p>\n', 1);
INSERT INTO `th_answer` VALUES (526, 1, 4, 2, 13, 'sdu143', 1, '<p>3213123</p>\n', 2);
INSERT INTO `th_answer` VALUES (527, 1, 4, 3, 14, 'sdu143', 1, '<p>3123123</p>\n', 7);
INSERT INTO `th_answer` VALUES (528, 1, 2, 6, 15, 'sdu143', 4, '', 0);
INSERT INTO `th_answer` VALUES (529, 1, 1, 1, 1, 'sdu122', 1, '2', 0);
INSERT INTO `th_answer` VALUES (530, 1, 1, 2, 2, 'sdu122', 1, '2', 0);
INSERT INTO `th_answer` VALUES (531, 1, 1, 3, 3, 'sdu122', 1, '5', 0);
INSERT INTO `th_answer` VALUES (532, 1, 1, 8, 4, 'sdu122', 5, '', 0);
INSERT INTO `th_answer` VALUES (533, 1, 1, 6, 5, 'sdu122', 1, '3', 0);
INSERT INTO `th_answer` VALUES (534, 1, 2, 1, 6, 'sdu122', 3, '', 0);
INSERT INTO `th_answer` VALUES (535, 1, 2, 2, 7, 'sdu122', 1, '', 0);
INSERT INTO `th_answer` VALUES (536, 1, 2, 3, 8, 'sdu122', 3, '', 0);
INSERT INTO `th_answer` VALUES (537, 1, 3, 1, 9, 'sdu122', 1, '1', 3);
INSERT INTO `th_answer` VALUES (538, 1, 3, 2, 10, 'sdu122', 1, '0', 3);
INSERT INTO `th_answer` VALUES (539, 1, 3, 3, 11, 'sdu122', 1, '0', 0);
INSERT INTO `th_answer` VALUES (540, 1, 4, 1, 12, 'sdu122', 1, '<p>3123123123123123123</p>\n', 8);
INSERT INTO `th_answer` VALUES (541, 1, 4, 2, 13, 'sdu122', 1, '<p>3122222222222222</p>\n', 1);
INSERT INTO `th_answer` VALUES (542, 1, 4, 3, 14, 'sdu122', 1, '<p>32111111111</p>\n', 7);
INSERT INTO `th_answer` VALUES (543, 1, 2, 6, 15, 'sdu122', 4, '', 0);
INSERT INTO `th_answer` VALUES (544, 1, 1, 1, 1, 'stu101', 1, '1', 0);
INSERT INTO `th_answer` VALUES (545, 1, 1, 2, 2, 'stu101', 1, '3', 4);
INSERT INTO `th_answer` VALUES (546, 1, 1, 3, 3, 'stu101', 1, '7', 6);
INSERT INTO `th_answer` VALUES (547, 1, 1, 8, 4, 'stu101', 5, '', 0);
INSERT INTO `th_answer` VALUES (548, 1, 1, 6, 5, 'stu101', 1, '3', 0);
INSERT INTO `th_answer` VALUES (549, 1, 2, 1, 6, 'stu101', 3, '', 0);
INSERT INTO `th_answer` VALUES (550, 1, 2, 2, 7, 'stu101', 1, '', 0);
INSERT INTO `th_answer` VALUES (551, 1, 2, 3, 8, 'stu101', 3, '', 0);
INSERT INTO `th_answer` VALUES (552, 1, 3, 1, 9, 'stu101', 1, '0', 0);
INSERT INTO `th_answer` VALUES (553, 1, 3, 2, 10, 'stu101', 1, '1', 0);
INSERT INTO `th_answer` VALUES (554, 1, 3, 3, 11, 'stu101', 1, '0', 0);
INSERT INTO `th_answer` VALUES (555, 1, 4, 1, 12, 'stu101', 1, '<p>3123123</p>\n', 2);
INSERT INTO `th_answer` VALUES (556, 1, 4, 2, 13, 'stu101', 1, '<p>312321</p>\n', 1);
INSERT INTO `th_answer` VALUES (557, 1, 4, 3, 14, 'stu101', 1, '<p>3213213</p>\n', 5);
INSERT INTO `th_answer` VALUES (558, 1, 2, 6, 15, 'stu101', 4, '', 0);
INSERT INTO `th_answer` VALUES (559, 1, 1, 1, 1, 'yy234', 1, '2', 0);
INSERT INTO `th_answer` VALUES (560, 1, 1, 2, 2, 'yy234', 1, '2', 0);
INSERT INTO `th_answer` VALUES (561, 1, 1, 3, 3, 'yy234', 1, '7', 6);
INSERT INTO `th_answer` VALUES (562, 1, 1, 8, 4, 'yy234', 5, '', 0);
INSERT INTO `th_answer` VALUES (563, 1, 1, 6, 5, 'yy234', 1, '1', 5);
INSERT INTO `th_answer` VALUES (564, 1, 2, 1, 6, 'yy234', 3, '', 0);
INSERT INTO `th_answer` VALUES (565, 1, 2, 2, 7, 'yy234', 1, '', 0);
INSERT INTO `th_answer` VALUES (566, 1, 2, 3, 8, 'yy234', 3, '', 0);
INSERT INTO `th_answer` VALUES (567, 1, 3, 1, 9, 'yy234', 1, '0', 0);
INSERT INTO `th_answer` VALUES (568, 1, 3, 2, 10, 'yy234', 1, '1', 0);
INSERT INTO `th_answer` VALUES (569, 1, 3, 3, 11, 'yy234', 1, '1', 3);
INSERT INTO `th_answer` VALUES (570, 1, 4, 1, 12, 'yy234', 1, '<p>3213123123123123123</p>\n', 5);
INSERT INTO `th_answer` VALUES (571, 1, 4, 2, 13, 'yy234', 1, '<p>321333333333</p>\n', 2);
INSERT INTO `th_answer` VALUES (572, 1, 4, 3, 14, 'yy234', 1, '<p>33333333333333</p>\n', 3);
INSERT INTO `th_answer` VALUES (573, 1, 2, 6, 15, 'yy234', 4, '', 0);
INSERT INTO `th_answer` VALUES (574, 37, 1, 31, 1, 'li908', 5, '', 0);
INSERT INTO `th_answer` VALUES (575, 37, 1, 32, 2, 'li908', 1, '1', 5);
INSERT INTO `th_answer` VALUES (576, 39, 1, 33, 1, 'stu023', 1, '2', 5);
INSERT INTO `th_answer` VALUES (587, 64, 1, 1, 1, 'XJC666', 1, '3', 0);
INSERT INTO `th_answer` VALUES (588, 64, 1, 2, 2, 'XJC666', 1, '3', 0);
INSERT INTO `th_answer` VALUES (589, 64, 1, 3, 3, 'XJC666', 1, '4', 0);
INSERT INTO `th_answer` VALUES (590, 64, 1, 4, 4, 'XJC666', 1, '1', 0);
INSERT INTO `th_answer` VALUES (591, 64, 1, 5, 5, 'XJC666', 1, '2', 5);

-- ----------------------------
-- Table structure for th_answer_option
-- ----------------------------
DROP TABLE IF EXISTS `th_answer_option`;
CREATE TABLE `th_answer_option`  (
  `option_id` int NOT NULL AUTO_INCREMENT,
  `answer_id` int NULL DEFAULT NULL COMMENT '对应答案的id',
  `num` int NULL DEFAULT NULL COMMENT '对应题目项的序号',
  `answer` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '选择或填空的答案',
  `score` int NULL DEFAULT NULL COMMENT '用户所获分数',
  PRIMARY KEY (`option_id`) USING BTREE,
  INDEX `answer_id`(`answer_id` ASC) USING BTREE,
  CONSTRAINT `th_answer_option_ibfk_1` FOREIGN KEY (`answer_id`) REFERENCES `th_answer` (`answer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 579 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_answer_option
-- ----------------------------
INSERT INTO `th_answer_option` VALUES (298, 301, 1, '1', NULL);
INSERT INTO `th_answer_option` VALUES (299, 301, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (300, 301, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (301, 301, 4, '0', NULL);
INSERT INTO `th_answer_option` VALUES (302, 301, 5, '0', NULL);
INSERT INTO `th_answer_option` VALUES (303, 303, 1, '名可名', NULL);
INSERT INTO `th_answer_option` VALUES (304, 303, 2, '无名天地之始', NULL);
INSERT INTO `th_answer_option` VALUES (305, 303, 3, '有名万物之母', NULL);
INSERT INTO `th_answer_option` VALUES (306, 304, 1, '千门万户曈曈日日日不对哈哈哈', NULL);
INSERT INTO `th_answer_option` VALUES (307, 305, 1, 'Exam', NULL);
INSERT INTO `th_answer_option` VALUES (308, 305, 2, 'Test', NULL);
INSERT INTO `th_answer_option` VALUES (309, 305, 3, 'shiyan', NULL);
INSERT INTO `th_answer_option` VALUES (310, 312, 2, '不飞', NULL);
INSERT INTO `th_answer_option` VALUES (311, 312, 3, '外围机处理方式', NULL);
INSERT INTO `th_answer_option` VALUES (312, 312, 4, '通道控制方式', NULL);
INSERT INTO `th_answer_option` VALUES (313, 312, 5, '程序中断方式', NULL);
INSERT INTO `th_answer_option` VALUES (314, 316, 1, '1', NULL);
INSERT INTO `th_answer_option` VALUES (315, 316, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (316, 316, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (317, 316, 4, '1', NULL);
INSERT INTO `th_answer_option` VALUES (318, 316, 5, '1', NULL);
INSERT INTO `th_answer_option` VALUES (319, 318, 1, '名可名', NULL);
INSERT INTO `th_answer_option` VALUES (320, 318, 2, '无名天地之始', NULL);
INSERT INTO `th_answer_option` VALUES (321, 318, 3, '有名万物之母', NULL);
INSERT INTO `th_answer_option` VALUES (322, 319, 1, '千门万户曈曈日', NULL);
INSERT INTO `th_answer_option` VALUES (323, 320, 1, 'exam', NULL);
INSERT INTO `th_answer_option` VALUES (324, 320, 2, 'Test', NULL);
INSERT INTO `th_answer_option` VALUES (325, 320, 3, '实验', NULL);
INSERT INTO `th_answer_option` VALUES (326, 327, 2, '程序中断方式        ', NULL);
INSERT INTO `th_answer_option` VALUES (327, 327, 3, '直接存储器存取方式', NULL);
INSERT INTO `th_answer_option` VALUES (328, 327, 4, '通道控制方式', NULL);
INSERT INTO `th_answer_option` VALUES (329, 327, 5, '外围机处理方式', NULL);
INSERT INTO `th_answer_option` VALUES (330, 331, 1, '0', NULL);
INSERT INTO `th_answer_option` VALUES (331, 331, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (332, 331, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (333, 331, 4, '1', NULL);
INSERT INTO `th_answer_option` VALUES (334, 331, 5, '1', NULL);
INSERT INTO `th_answer_option` VALUES (335, 333, 1, '   名可名   ', NULL);
INSERT INTO `th_answer_option` VALUES (336, 333, 2, '   无名天地之始', NULL);
INSERT INTO `th_answer_option` VALUES (337, 333, 3, '有名万物之母   ', NULL);
INSERT INTO `th_answer_option` VALUES (338, 334, 1, '千门万户曈曈日', NULL);
INSERT INTO `th_answer_option` VALUES (339, 335, 1, 'exam', NULL);
INSERT INTO `th_answer_option` VALUES (340, 335, 2, 'Test', NULL);
INSERT INTO `th_answer_option` VALUES (341, 335, 3, '实验    ', NULL);
INSERT INTO `th_answer_option` VALUES (342, 342, 2, '外围机处理方式', NULL);
INSERT INTO `th_answer_option` VALUES (343, 342, 3, '程序中断方式', NULL);
INSERT INTO `th_answer_option` VALUES (344, 342, 4, '直接存储器存取方式', NULL);
INSERT INTO `th_answer_option` VALUES (345, 342, 5, '程序中断方式', NULL);
INSERT INTO `th_answer_option` VALUES (346, 346, 1, '1', NULL);
INSERT INTO `th_answer_option` VALUES (347, 346, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (348, 346, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (349, 346, 4, '1', NULL);
INSERT INTO `th_answer_option` VALUES (350, 346, 5, '1', NULL);
INSERT INTO `th_answer_option` VALUES (351, 348, 1, '名可名', NULL);
INSERT INTO `th_answer_option` VALUES (352, 348, 2, '无名天地之始', NULL);
INSERT INTO `th_answer_option` VALUES (353, 348, 3, '有名万物之母', NULL);
INSERT INTO `th_answer_option` VALUES (354, 349, 1, '千门万户曈曈日', NULL);
INSERT INTO `th_answer_option` VALUES (355, 350, 1, '顶顶顶顶', NULL);
INSERT INTO `th_answer_option` VALUES (356, 350, 2, '三生三世', NULL);
INSERT INTO `th_answer_option` VALUES (357, 350, 3, '少时诵诗书', NULL);
INSERT INTO `th_answer_option` VALUES (358, 357, 2, '123', NULL);
INSERT INTO `th_answer_option` VALUES (359, 357, 3, '123', NULL);
INSERT INTO `th_answer_option` VALUES (360, 357, 4, '123', NULL);
INSERT INTO `th_answer_option` VALUES (361, 357, 5, '456', NULL);
INSERT INTO `th_answer_option` VALUES (362, 361, 1, '1', NULL);
INSERT INTO `th_answer_option` VALUES (363, 361, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (364, 361, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (365, 361, 4, '0', NULL);
INSERT INTO `th_answer_option` VALUES (366, 361, 5, '0', NULL);
INSERT INTO `th_answer_option` VALUES (367, 363, 1, '名可名', NULL);
INSERT INTO `th_answer_option` VALUES (368, 363, 2, '无名天地之始', NULL);
INSERT INTO `th_answer_option` VALUES (369, 363, 3, '有名万物之母嗯', NULL);
INSERT INTO `th_answer_option` VALUES (370, 364, 1, '毕设成绩就要出', NULL);
INSERT INTO `th_answer_option` VALUES (371, 365, 1, 'exam', NULL);
INSERT INTO `th_answer_option` VALUES (372, 365, 2, '实验', NULL);
INSERT INTO `th_answer_option` VALUES (373, 365, 3, 'Test', NULL);
INSERT INTO `th_answer_option` VALUES (374, 372, 2, '直接存储器存取方式', NULL);
INSERT INTO `th_answer_option` VALUES (375, 372, 3, '外围机处理方式', NULL);
INSERT INTO `th_answer_option` VALUES (376, 372, 4, '1234134', NULL);
INSERT INTO `th_answer_option` VALUES (377, 372, 5, '1234322423', NULL);
INSERT INTO `th_answer_option` VALUES (393, 410, 1, '0', NULL);
INSERT INTO `th_answer_option` VALUES (394, 410, 2, '0', NULL);
INSERT INTO `th_answer_option` VALUES (395, 410, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (396, 410, 4, '1', NULL);
INSERT INTO `th_answer_option` VALUES (397, 410, 5, '0', NULL);
INSERT INTO `th_answer_option` VALUES (398, 412, 1, '', NULL);
INSERT INTO `th_answer_option` VALUES (399, 412, 2, '', NULL);
INSERT INTO `th_answer_option` VALUES (400, 412, 3, '', NULL);
INSERT INTO `th_answer_option` VALUES (401, 413, 1, '', NULL);
INSERT INTO `th_answer_option` VALUES (402, 414, 1, '', NULL);
INSERT INTO `th_answer_option` VALUES (403, 414, 2, '', NULL);
INSERT INTO `th_answer_option` VALUES (404, 414, 3, '', NULL);
INSERT INTO `th_answer_option` VALUES (405, 421, 2, '', NULL);
INSERT INTO `th_answer_option` VALUES (406, 421, 3, '', NULL);
INSERT INTO `th_answer_option` VALUES (407, 421, 4, '', NULL);
INSERT INTO `th_answer_option` VALUES (408, 421, 5, '', NULL);
INSERT INTO `th_answer_option` VALUES (409, 426, 1, '0', NULL);
INSERT INTO `th_answer_option` VALUES (410, 426, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (411, 426, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (412, 426, 4, '0', NULL);
INSERT INTO `th_answer_option` VALUES (413, 426, 5, '1', NULL);
INSERT INTO `th_answer_option` VALUES (414, 428, 1, '', NULL);
INSERT INTO `th_answer_option` VALUES (415, 428, 2, '', NULL);
INSERT INTO `th_answer_option` VALUES (416, 428, 3, '', NULL);
INSERT INTO `th_answer_option` VALUES (417, 429, 1, '', NULL);
INSERT INTO `th_answer_option` VALUES (418, 430, 1, '', NULL);
INSERT INTO `th_answer_option` VALUES (419, 430, 2, '', NULL);
INSERT INTO `th_answer_option` VALUES (420, 430, 3, '', NULL);
INSERT INTO `th_answer_option` VALUES (421, 437, 2, '', NULL);
INSERT INTO `th_answer_option` VALUES (422, 437, 3, '', NULL);
INSERT INTO `th_answer_option` VALUES (423, 437, 4, '', NULL);
INSERT INTO `th_answer_option` VALUES (424, 437, 5, '', NULL);
INSERT INTO `th_answer_option` VALUES (425, 441, 1, '0', NULL);
INSERT INTO `th_answer_option` VALUES (426, 441, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (427, 441, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (428, 441, 4, '1', NULL);
INSERT INTO `th_answer_option` VALUES (429, 441, 5, '0', NULL);
INSERT INTO `th_answer_option` VALUES (430, 443, 1, '', NULL);
INSERT INTO `th_answer_option` VALUES (431, 443, 2, '', NULL);
INSERT INTO `th_answer_option` VALUES (432, 443, 3, '', NULL);
INSERT INTO `th_answer_option` VALUES (433, 444, 1, '', NULL);
INSERT INTO `th_answer_option` VALUES (434, 445, 1, '', NULL);
INSERT INTO `th_answer_option` VALUES (435, 445, 2, '', NULL);
INSERT INTO `th_answer_option` VALUES (436, 445, 3, '', NULL);
INSERT INTO `th_answer_option` VALUES (437, 452, 2, '', NULL);
INSERT INTO `th_answer_option` VALUES (438, 452, 3, '', NULL);
INSERT INTO `th_answer_option` VALUES (439, 452, 4, '', NULL);
INSERT INTO `th_answer_option` VALUES (440, 452, 5, '', NULL);
INSERT INTO `th_answer_option` VALUES (441, 457, 1, '0', NULL);
INSERT INTO `th_answer_option` VALUES (442, 457, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (443, 457, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (444, 457, 4, '1', NULL);
INSERT INTO `th_answer_option` VALUES (445, 457, 5, '0', NULL);
INSERT INTO `th_answer_option` VALUES (446, 459, 1, '1', NULL);
INSERT INTO `th_answer_option` VALUES (447, 459, 2, '2', NULL);
INSERT INTO `th_answer_option` VALUES (448, 459, 3, '3', NULL);
INSERT INTO `th_answer_option` VALUES (449, 460, 1, '1', NULL);
INSERT INTO `th_answer_option` VALUES (450, 461, 1, '2', NULL);
INSERT INTO `th_answer_option` VALUES (451, 461, 2, '4', NULL);
INSERT INTO `th_answer_option` VALUES (452, 461, 3, '5', NULL);
INSERT INTO `th_answer_option` VALUES (453, 468, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (454, 468, 3, '2', NULL);
INSERT INTO `th_answer_option` VALUES (455, 468, 4, '4', NULL);
INSERT INTO `th_answer_option` VALUES (456, 468, 5, '3', NULL);
INSERT INTO `th_answer_option` VALUES (457, 472, 1, '0', NULL);
INSERT INTO `th_answer_option` VALUES (458, 472, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (459, 472, 3, '0', NULL);
INSERT INTO `th_answer_option` VALUES (460, 472, 4, '1', NULL);
INSERT INTO `th_answer_option` VALUES (461, 472, 5, '0', NULL);
INSERT INTO `th_answer_option` VALUES (462, 474, 1, '', NULL);
INSERT INTO `th_answer_option` VALUES (463, 474, 2, '', NULL);
INSERT INTO `th_answer_option` VALUES (464, 474, 3, '', NULL);
INSERT INTO `th_answer_option` VALUES (465, 475, 1, '', NULL);
INSERT INTO `th_answer_option` VALUES (466, 476, 1, '', NULL);
INSERT INTO `th_answer_option` VALUES (467, 476, 2, '', NULL);
INSERT INTO `th_answer_option` VALUES (468, 476, 3, '', NULL);
INSERT INTO `th_answer_option` VALUES (469, 483, 2, '', NULL);
INSERT INTO `th_answer_option` VALUES (470, 483, 3, '', NULL);
INSERT INTO `th_answer_option` VALUES (471, 483, 4, '', NULL);
INSERT INTO `th_answer_option` VALUES (472, 483, 5, '', NULL);
INSERT INTO `th_answer_option` VALUES (473, 487, 1, '0', NULL);
INSERT INTO `th_answer_option` VALUES (474, 487, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (475, 487, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (476, 487, 4, '0', NULL);
INSERT INTO `th_answer_option` VALUES (477, 487, 5, '0', NULL);
INSERT INTO `th_answer_option` VALUES (478, 489, 1, '', NULL);
INSERT INTO `th_answer_option` VALUES (479, 489, 2, '', NULL);
INSERT INTO `th_answer_option` VALUES (480, 489, 3, '', NULL);
INSERT INTO `th_answer_option` VALUES (481, 490, 1, '', NULL);
INSERT INTO `th_answer_option` VALUES (482, 491, 1, '', NULL);
INSERT INTO `th_answer_option` VALUES (483, 491, 2, '', NULL);
INSERT INTO `th_answer_option` VALUES (484, 491, 3, '', NULL);
INSERT INTO `th_answer_option` VALUES (485, 498, 2, '', NULL);
INSERT INTO `th_answer_option` VALUES (486, 498, 3, '', NULL);
INSERT INTO `th_answer_option` VALUES (487, 498, 4, '', NULL);
INSERT INTO `th_answer_option` VALUES (488, 498, 5, '', NULL);
INSERT INTO `th_answer_option` VALUES (489, 502, 1, '0', NULL);
INSERT INTO `th_answer_option` VALUES (490, 502, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (491, 502, 3, '0', NULL);
INSERT INTO `th_answer_option` VALUES (492, 502, 4, '1', NULL);
INSERT INTO `th_answer_option` VALUES (493, 502, 5, '1', NULL);
INSERT INTO `th_answer_option` VALUES (494, 504, 1, '2', NULL);
INSERT INTO `th_answer_option` VALUES (495, 504, 2, '2', NULL);
INSERT INTO `th_answer_option` VALUES (496, 504, 3, '4', NULL);
INSERT INTO `th_answer_option` VALUES (497, 505, 1, '3', NULL);
INSERT INTO `th_answer_option` VALUES (498, 506, 1, '1', NULL);
INSERT INTO `th_answer_option` VALUES (499, 506, 2, '4', NULL);
INSERT INTO `th_answer_option` VALUES (500, 506, 3, '4', NULL);
INSERT INTO `th_answer_option` VALUES (501, 513, 2, '4', NULL);
INSERT INTO `th_answer_option` VALUES (502, 513, 3, '4', NULL);
INSERT INTO `th_answer_option` VALUES (503, 513, 4, '4', NULL);
INSERT INTO `th_answer_option` VALUES (504, 513, 5, '4', NULL);
INSERT INTO `th_answer_option` VALUES (505, 517, 1, '0', NULL);
INSERT INTO `th_answer_option` VALUES (506, 517, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (507, 517, 3, '0', NULL);
INSERT INTO `th_answer_option` VALUES (508, 517, 4, '1', NULL);
INSERT INTO `th_answer_option` VALUES (509, 517, 5, '0', NULL);
INSERT INTO `th_answer_option` VALUES (510, 519, 1, '123', NULL);
INSERT INTO `th_answer_option` VALUES (511, 519, 2, '3123', NULL);
INSERT INTO `th_answer_option` VALUES (512, 519, 3, '312321', NULL);
INSERT INTO `th_answer_option` VALUES (513, 520, 1, '3123123', NULL);
INSERT INTO `th_answer_option` VALUES (514, 521, 1, '312321', NULL);
INSERT INTO `th_answer_option` VALUES (515, 521, 2, '3123', NULL);
INSERT INTO `th_answer_option` VALUES (516, 521, 3, '3123', NULL);
INSERT INTO `th_answer_option` VALUES (517, 528, 2, '312', NULL);
INSERT INTO `th_answer_option` VALUES (518, 528, 3, '312', NULL);
INSERT INTO `th_answer_option` VALUES (519, 528, 4, '3', NULL);
INSERT INTO `th_answer_option` VALUES (520, 528, 5, '1', NULL);
INSERT INTO `th_answer_option` VALUES (521, 532, 1, '0', NULL);
INSERT INTO `th_answer_option` VALUES (522, 532, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (523, 532, 3, '0', NULL);
INSERT INTO `th_answer_option` VALUES (524, 532, 4, '1', NULL);
INSERT INTO `th_answer_option` VALUES (525, 532, 5, '1', NULL);
INSERT INTO `th_answer_option` VALUES (526, 534, 1, '21', NULL);
INSERT INTO `th_answer_option` VALUES (527, 534, 2, '21', NULL);
INSERT INTO `th_answer_option` VALUES (528, 534, 3, '21', NULL);
INSERT INTO `th_answer_option` VALUES (529, 535, 1, '2', NULL);
INSERT INTO `th_answer_option` VALUES (530, 536, 1, '2', NULL);
INSERT INTO `th_answer_option` VALUES (531, 536, 2, '4', NULL);
INSERT INTO `th_answer_option` VALUES (532, 536, 3, '4', NULL);
INSERT INTO `th_answer_option` VALUES (533, 543, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (534, 543, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (535, 543, 4, '1', NULL);
INSERT INTO `th_answer_option` VALUES (536, 543, 5, '1', NULL);
INSERT INTO `th_answer_option` VALUES (537, 547, 1, '0', NULL);
INSERT INTO `th_answer_option` VALUES (538, 547, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (539, 547, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (540, 547, 4, '0', NULL);
INSERT INTO `th_answer_option` VALUES (541, 547, 5, '0', NULL);
INSERT INTO `th_answer_option` VALUES (542, 549, 1, '1', NULL);
INSERT INTO `th_answer_option` VALUES (543, 549, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (544, 549, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (545, 550, 1, '3', NULL);
INSERT INTO `th_answer_option` VALUES (546, 551, 1, '3', NULL);
INSERT INTO `th_answer_option` VALUES (547, 551, 2, '3', NULL);
INSERT INTO `th_answer_option` VALUES (548, 551, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (549, 558, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (550, 558, 3, '3', NULL);
INSERT INTO `th_answer_option` VALUES (551, 558, 4, '3', NULL);
INSERT INTO `th_answer_option` VALUES (552, 558, 5, '3', NULL);
INSERT INTO `th_answer_option` VALUES (553, 562, 1, '0', NULL);
INSERT INTO `th_answer_option` VALUES (554, 562, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (555, 562, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (556, 562, 4, '0', NULL);
INSERT INTO `th_answer_option` VALUES (557, 562, 5, '0', NULL);
INSERT INTO `th_answer_option` VALUES (558, 564, 1, '1', NULL);
INSERT INTO `th_answer_option` VALUES (559, 564, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (560, 564, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (561, 565, 1, '1', NULL);
INSERT INTO `th_answer_option` VALUES (562, 566, 1, '1', NULL);
INSERT INTO `th_answer_option` VALUES (563, 566, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (564, 566, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (565, 573, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (566, 573, 3, '1', NULL);
INSERT INTO `th_answer_option` VALUES (567, 573, 4, '1', NULL);
INSERT INTO `th_answer_option` VALUES (568, 573, 5, '1', NULL);
INSERT INTO `th_answer_option` VALUES (569, 574, 1, '0', NULL);
INSERT INTO `th_answer_option` VALUES (570, 574, 2, '1', NULL);
INSERT INTO `th_answer_option` VALUES (571, 574, 3, '0', NULL);
INSERT INTO `th_answer_option` VALUES (572, 574, 4, '0', NULL);
INSERT INTO `th_answer_option` VALUES (573, 574, 5, '0', NULL);

-- ----------------------------
-- Table structure for th_chapter
-- ----------------------------
DROP TABLE IF EXISTS `th_chapter`;
CREATE TABLE `th_chapter`  (
  `chapter_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL COMMENT '所在课程号',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `views` int NULL DEFAULT 0,
  `likes` int NULL DEFAULT 0,
  `chapter_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`chapter_id`) USING BTREE,
  INDEX `reforcourse`(`course_id` ASC) USING BTREE,
  CONSTRAINT `th_chapter_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `th_course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 217 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_chapter
-- ----------------------------
INSERT INTO `th_chapter` VALUES (1, 1, '窗外', 56, 17, '/files/user/root/chapter/chapter_2022_05_04083513137.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (2, 1, '休闲', 12, 2, '/files/user/root/chapter/chapter_2022_05_04083552266.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (3, 1, '工作', 10, 3, '/files/user/root/chapter/chapter_2022_05_04083614181.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (4, 1, '加班', 6, 2, '/files/user/root/chapter/chapter_2022_05_04083641467.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (181, 7, '第一章 Java课程简介', 46, 9, '/files/user/stu023/chapter/chapter_2023_07_09174923895.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (182, 7, '第二章 ASCII编码', 14, 6, '/files/user/stu023/chapter/chapter_2023_07_09175043122.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (183, 7, '第三章 关键字和标志符', 5, 0, '/files/user/stu023/chapter/chapter_2023_07_09175104068.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (184, 7, '第四章 面向对象进阶介绍', 2, 1, '/files/user/stu023/chapter/chapter_2023_07_09175414525.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (185, 2, '第一章 计算机发展历史', 7, 1, '/files/user/root/chapter/chapter_2023_07_11210439514.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (186, 2, '第二章 计算机启动过程', 1, 0, '/files/user/root/chapter/chapter_2023_07_11210511015.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (187, 2, '第三章 计算机内存', 0, 0, '/files/user/root/chapter/chapter_2023_07_11210530996.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (188, 2, '第四章 计算机指令', 0, 0, '/files/user/root/chapter/chapter_2023_07_11210548792.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (189, 2, '第五章 静态链接', 0, 0, '/files/user/root/chapter/chapter_2023_07_11210605627.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (191, 3, '第一章 微机组成', 0, 0, '/files/user/root/chapter/chapter_2023_07_11211157325.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (192, 3, '第二章 CPU内部结构', 1, 0, '/files/user/root/chapter/chapter_2023_07_11211213942.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (193, 3, '第三章 堆栈', 0, 0, '/files/user/root/chapter/chapter_2023_07_11211227491.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (194, 3, '第四章 时序与总线操作', 0, 0, '/files/user/root/chapter/chapter_2023_07_11211243906.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (195, 3, '第五章 存储和地址空间', 0, 0, '/files/user/root/chapter/chapter_2023_07_11211828258.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (196, 4, '01 单片机结构', 1, 0, '/files/user/root/chapter/chapter_2023_07_11212510147.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (197, 4, '02 单片机性能', 0, 0, '/files/user/root/chapter/chapter_2023_07_11212522642.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (198, 4, '03 JD51型单片机实验', 0, 0, '/files/user/root/chapter/chapter_2023_07_11212535701.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (199, 4, '04 硬件功能', 0, 0, '/files/user/root/chapter/chapter_2023_07_11212546527.mp4', '2023-12-27 00:35:47');
INSERT INTO `th_chapter` VALUES (200, 3, '01-课程内容介绍.mp4', 0, 0, '/files/user/root/chapter/chapter_2024_02_01111323141.mp4', '2024-02-01 03:13:25');
INSERT INTO `th_chapter` VALUES (205, 58, '01-课程内容介绍.mp4', 0, 0, '/files/user/stu023/chapter/chapter_2024_02_01171643371.mp4', '2024-02-01 09:16:46');
INSERT INTO `th_chapter` VALUES (206, 59, '第一章', 1, 0, '/files/user/stu023/chapter/chapter_2024_02_01172846940.mp4', '2024-02-01 09:28:55');
INSERT INTO `th_chapter` VALUES (210, 8, '6 - What If I Want to Move Faster.mp4', 0, 0, '/files/user/stu023/chapter/chapter_2024_03_26025751376.mp4', '2024-03-25 18:57:53');
INSERT INTO `th_chapter` VALUES (212, 7, '6 - What If I Want to Move Faster.mp4', 1, 0, '/files/user/stu023/chapter/chapter_2024_08_05042926776.mp4', '2024-08-04 20:29:29');
INSERT INTO `th_chapter` VALUES (213, 7, '测试要素', 1, 1, '/files/user/stu023/chapter/chapter_2024_09_14104443831.mp4', '2024-09-14 14:44:55');
INSERT INTO `th_chapter` VALUES (214, 7, '测试流程', 1, 1, '/files/user/stu023/chapter/chapter_2024_09_21233638322.mp4', '2024-09-21 15:36:48');
INSERT INTO `th_chapter` VALUES (215, 7, '09-课程内容介绍.mp4', 1, 0, '/files/user/stu023/chapter/chapter_2024_09_22025250310.mp4', '2024-09-21 18:52:57');
INSERT INTO `th_chapter` VALUES (216, 7, '12-课程内容介绍.mp4', 1, 0, '/files/user/stu023/chapter/chapter_2025_02_12203914785.mp4', '2025-02-12 12:39:23');

-- ----------------------------
-- Table structure for th_chapter_like_records
-- ----------------------------
DROP TABLE IF EXISTS `th_chapter_like_records`;
CREATE TABLE `th_chapter_like_records`  (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `chapter_id` int NULL DEFAULT NULL,
  `user_id` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `discussion_id`(`chapter_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `th_chapter_like_records_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `th_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `th_chapter_like_records_ibfk_3` FOREIGN KEY (`chapter_id`) REFERENCES `th_chapter` (`chapter_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_chapter_like_records
-- ----------------------------
INSERT INTO `th_chapter_like_records` VALUES (39, 3, 'stu023');
INSERT INTO `th_chapter_like_records` VALUES (40, 2, 'stu023');
INSERT INTO `th_chapter_like_records` VALUES (42, 1, 'stu023');
INSERT INTO `th_chapter_like_records` VALUES (43, 4, 'stu023');
INSERT INTO `th_chapter_like_records` VALUES (44, 3, 'stu013');
INSERT INTO `th_chapter_like_records` VALUES (45, 4, 'stu013');
INSERT INTO `th_chapter_like_records` VALUES (61, 181, 'stu022');
INSERT INTO `th_chapter_like_records` VALUES (62, 182, 'stu022');
INSERT INTO `th_chapter_like_records` VALUES (63, 181, 'stu013');
INSERT INTO `th_chapter_like_records` VALUES (64, 1, 'stu003');
INSERT INTO `th_chapter_like_records` VALUES (66, 3, 'stu003');
INSERT INTO `th_chapter_like_records` VALUES (67, 185, 'stu023');
INSERT INTO `th_chapter_like_records` VALUES (68, 184, 'stu003');
INSERT INTO `th_chapter_like_records` VALUES (69, 2, 'stu003');
INSERT INTO `th_chapter_like_records` VALUES (70, 182, 'user2');
INSERT INTO `th_chapter_like_records` VALUES (71, 181, 'stu003');
INSERT INTO `th_chapter_like_records` VALUES (72, 181, 'sdu001');
INSERT INTO `th_chapter_like_records` VALUES (73, 181, 'sdu345');
INSERT INTO `th_chapter_like_records` VALUES (74, 182, 'sdu346');
INSERT INTO `th_chapter_like_records` VALUES (75, 182, 'sdu788');
INSERT INTO `th_chapter_like_records` VALUES (76, 213, 'sdu788');
INSERT INTO `th_chapter_like_records` VALUES (77, 182, 'sdu143');
INSERT INTO `th_chapter_like_records` VALUES (78, 214, 'sdu143');
INSERT INTO `th_chapter_like_records` VALUES (79, 182, 'sdu122');
INSERT INTO `th_chapter_like_records` VALUES (80, 181, 'stu101');
INSERT INTO `th_chapter_like_records` VALUES (81, 181, 'li908');
INSERT INTO `th_chapter_like_records` VALUES (83, 181, 'yy234');
INSERT INTO `th_chapter_like_records` VALUES (84, 181, 'yh123');

-- ----------------------------
-- Table structure for th_choice
-- ----------------------------
DROP TABLE IF EXISTS `th_choice`;
CREATE TABLE `th_choice`  (
  `subject_id` int NOT NULL AUTO_INCREMENT COMMENT '选择题id',
  `content` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '题目',
  `answer_num` int NULL DEFAULT NULL COMMENT '答案个数',
  `analysis` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '答案解析',
  `score` int NULL DEFAULT NULL COMMENT '分值',
  PRIMARY KEY (`subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5146986 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_choice
-- ----------------------------
INSERT INTO `th_choice` VALUES (1, '计算机网络的主要目的是什么？', 4, '无解析', 5);
INSERT INTO `th_choice` VALUES (2, 'OSI七层模型中，从下到上的第一层是什么？', 4, '无解析', 5);
INSERT INTO `th_choice` VALUES (3, 'TCP/IP协议采用几层结构？', 4, '无解析，嗯，确实没有', 6);
INSERT INTO `th_choice` VALUES (4, '路由器工作在OSI模型的哪一层？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (5, '交换机工作在OSI模型的哪一层？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (6, 'HTTP协议属于OSI模型的哪一层？', 4, '存储器的带宽指单位时间内从存储器进出信息的最大数量', 5);
INSERT INTO `th_choice` VALUES (7, 'HTTP协议的默认端口号是多少？', 4, '无解析', 4);
INSERT INTO `th_choice` VALUES (8, 'HTTPS协议的默认端口号是多少？', 4, '<p>也没解析</p>\n', 6);
INSERT INTO `th_choice` VALUES (9, 'IPv4地址的长度是多少位？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (10, 'IPv6地址的长度是多少位？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (11, '<p>中国共产党的诞生日期</p>\n', 4, '<p>1921浙江嘉兴南湖</p>\n', 5);
INSERT INTO `th_choice` VALUES (13, '<p>一道选择</p>\n', 4, '<p>解析</p>\n', 5);
INSERT INTO `th_choice` VALUES (14, '<p>1+1</p>\n', 4, '', 5);
INSERT INTO `th_choice` VALUES (15, '<p>111</p>\n', 4, '', 5);
INSERT INTO `th_choice` VALUES (16, '<p>1-1</p>\n', 4, '<p>333</p>\n', 5);
INSERT INTO `th_choice` VALUES (17, '<p>7878</p>\n', 4, '', 5);
INSERT INTO `th_choice` VALUES (18, '<p>int时Java8大数据类型</p>\n', 4, '<p>是</p>\n', 5);
INSERT INTO `th_choice` VALUES (19, '<p>1-1=？</p>\n', 4, '<p>hgf</p>\n', 5);
INSERT INTO `th_choice` VALUES (20, '<p>1-1=</p>\n', 4, '<p>212121212</p>\n', 5);
INSERT INTO `th_choice` VALUES (21, '<p>1-1=？</p>\n', 4, '<p>0</p>\n', 5);
INSERT INTO `th_choice` VALUES (22, '<p>1-1=</p>\n', 5, '<p>8</p>\n', 5);
INSERT INTO `th_choice` VALUES (23, '<p>1-1</p>\n', 4, '', 5);
INSERT INTO `th_choice` VALUES (24, '<p>下列哪些是正确的</p>\n', 4, '', 5);
INSERT INTO `th_choice` VALUES (25, '<p>1111111111111</p>\n', 4, '<p>1111111</p>\n', 5);
INSERT INTO `th_choice` VALUES (26, '<p>111111</p>\n', 4, '<p>3123123123</p>\n', 5);
INSERT INTO `th_choice` VALUES (27, '<p>1-1=？</p>\n', 4, '', 5);
INSERT INTO `th_choice` VALUES (28, '<p>1-1</p>\n', 4, '', 5);
INSERT INTO `th_choice` VALUES (29, '<p>1-1</p>\n', 4, '', 5);
INSERT INTO `th_choice` VALUES (30, '<p>7-9</p>\n', 4, '<p>1</p>\n', 5);
INSERT INTO `th_choice` VALUES (31, '<p>WOSHISHEI</p>\n', 5, '', 5);
INSERT INTO `th_choice` VALUES (32, '', 4, '', 5);
INSERT INTO `th_choice` VALUES (33, '', 4, '<p>EQWE</p>\n', 5);
INSERT INTO `th_choice` VALUES (34, '<p>测试题</p>\n', 4, '', 5);
INSERT INTO `th_choice` VALUES (35, '<p>题目示例</p>\n', 4, '', 5);
INSERT INTO `th_choice` VALUES (100, '以下关于由顶点和边组成的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (101, '以下关于有向图和无向图的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (102, '以下关于遍历算法的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (103, '以下关于时间复杂度的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (104, '以下关于空间复杂度的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (105, '以下关于常见复杂度的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (106, '以下关于冒泡排序的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (107, '以下关于快速排序的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (108, '以下关于归并排序的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (109, '以下关于堆排序的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (110, '以下关于VPN的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (111, '以下关于RIP的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (112, '以下关于OSPF的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (113, '以下关于BGP的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (114, '以下关于变量的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (115, '以下关于函数的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (116, '以下关于循环的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (117, '以下关于条件语句的描述，哪一项是正确的？', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (2496401, 'Central Processing Unit', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (2496452, 'Computer Processing Unit', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (2496493, 'Central Program Unit', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (2496534, 'Computer Program Unit', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (2496585, '硬件部分包括：', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (3362501, 'Central Processing Unit', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (3362622, 'Computer Processing Unit', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (3362663, 'Central Program Unit', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (3362704, 'Computer Program Unit', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (3362725, '硬件部分包括：', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (5146781, 'Central Processing Unit', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (5146842, 'Computer Processing Unit', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (5146883, 'Central Program Unit', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (5146934, 'Computer Program Unit', 4, NULL, 5);
INSERT INTO `th_choice` VALUES (5146985, '硬件部分包括：', 4, NULL, 5);

-- ----------------------------
-- Table structure for th_choice_option
-- ----------------------------
DROP TABLE IF EXISTS `th_choice_option`;
CREATE TABLE `th_choice_option`  (
  `option_id` int NOT NULL AUTO_INCREMENT COMMENT '选项id',
  `subject_id` int NULL DEFAULT NULL COMMENT '选择题id',
  `num` int NULL DEFAULT NULL COMMENT '序号',
  `content` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  `is_answer` bit(1) NULL DEFAULT NULL COMMENT '0-不是答案 1-是答案',
  PRIMARY KEY (`option_id`) USING BTREE,
  INDEX `subject_id`(`subject_id` ASC) USING BTREE,
  CONSTRAINT `th_choice_option_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `th_choice` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 616 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_choice_option
-- ----------------------------
INSERT INTO `th_choice_option` VALUES (101, 11, 1, '1921-7-1', b'1');
INSERT INTO `th_choice_option` VALUES (102, 11, 2, '1921-8-1', b'0');
INSERT INTO `th_choice_option` VALUES (103, 11, 3, '1921-9-1', b'0');
INSERT INTO `th_choice_option` VALUES (104, 11, 5, '1921-12-10', b'0');
INSERT INTO `th_choice_option` VALUES (115, 13, 3, '123', b'0');
INSERT INTO `th_choice_option` VALUES (116, 13, 4, '234', b'1');
INSERT INTO `th_choice_option` VALUES (117, 13, 5, '234', b'0');
INSERT INTO `th_choice_option` VALUES (118, 13, 8, '44432', b'0');
INSERT INTO `th_choice_option` VALUES (119, 14, 1, '2', b'1');
INSERT INTO `th_choice_option` VALUES (120, 14, 2, '3', b'0');
INSERT INTO `th_choice_option` VALUES (121, 14, 3, '4', b'0');
INSERT INTO `th_choice_option` VALUES (122, 14, 4, '5', b'0');
INSERT INTO `th_choice_option` VALUES (123, 15, 1, '1', b'1');
INSERT INTO `th_choice_option` VALUES (124, 15, 2, '1', b'0');
INSERT INTO `th_choice_option` VALUES (125, 15, 3, '1', b'0');
INSERT INTO `th_choice_option` VALUES (126, 15, 4, '1', b'0');
INSERT INTO `th_choice_option` VALUES (127, 16, 1, '0', b'1');
INSERT INTO `th_choice_option` VALUES (128, 16, 2, '96', b'0');
INSERT INTO `th_choice_option` VALUES (129, 16, 3, '97', b'0');
INSERT INTO `th_choice_option` VALUES (130, 16, 4, '977', b'0');
INSERT INTO `th_choice_option` VALUES (131, 17, 1, '878', b'1');
INSERT INTO `th_choice_option` VALUES (132, 17, 2, '568', b'0');
INSERT INTO `th_choice_option` VALUES (133, 17, 3, '5', b'0');
INSERT INTO `th_choice_option` VALUES (134, 17, 4, '8', b'0');
INSERT INTO `th_choice_option` VALUES (135, 18, 1, '是', b'1');
INSERT INTO `th_choice_option` VALUES (136, 18, 2, '不是', b'0');
INSERT INTO `th_choice_option` VALUES (137, 18, 3, '不知道', b'0');
INSERT INTO `th_choice_option` VALUES (138, 18, 4, '0', b'0');
INSERT INTO `th_choice_option` VALUES (139, 19, 1, '0', b'1');
INSERT INTO `th_choice_option` VALUES (140, 19, 2, '1', b'0');
INSERT INTO `th_choice_option` VALUES (141, 19, 3, '245', b'0');
INSERT INTO `th_choice_option` VALUES (142, 19, 4, '78', b'0');
INSERT INTO `th_choice_option` VALUES (143, 20, 1, '0', b'1');
INSERT INTO `th_choice_option` VALUES (144, 20, 2, '3', b'0');
INSERT INTO `th_choice_option` VALUES (145, 20, 3, '4', b'0');
INSERT INTO `th_choice_option` VALUES (146, 20, 4, '5', b'0');
INSERT INTO `th_choice_option` VALUES (147, 21, 1, '4', b'0');
INSERT INTO `th_choice_option` VALUES (148, 21, 2, '0', b'1');
INSERT INTO `th_choice_option` VALUES (149, 21, 3, '6', b'0');
INSERT INTO `th_choice_option` VALUES (150, 21, 4, '7', b'0');
INSERT INTO `th_choice_option` VALUES (151, 22, 1, '0', b'1');
INSERT INTO `th_choice_option` VALUES (152, 22, 2, '0', b'1');
INSERT INTO `th_choice_option` VALUES (153, 22, 3, '7', b'0');
INSERT INTO `th_choice_option` VALUES (154, 22, 4, '8', b'0');
INSERT INTO `th_choice_option` VALUES (155, 22, 5, '8', b'0');
INSERT INTO `th_choice_option` VALUES (156, 23, 1, '4', b'0');
INSERT INTO `th_choice_option` VALUES (157, 23, 2, '0', b'1');
INSERT INTO `th_choice_option` VALUES (158, 23, 3, '8', b'0');
INSERT INTO `th_choice_option` VALUES (159, 23, 4, '8', b'0');
INSERT INTO `th_choice_option` VALUES (160, 24, 1, '1', b'1');
INSERT INTO `th_choice_option` VALUES (161, 24, 2, '1', b'1');
INSERT INTO `th_choice_option` VALUES (162, 24, 3, '1', b'1');
INSERT INTO `th_choice_option` VALUES (163, 24, 4, '0', b'0');
INSERT INTO `th_choice_option` VALUES (164, 25, 1, '1', b'1');
INSERT INTO `th_choice_option` VALUES (165, 25, 2, '4', b'0');
INSERT INTO `th_choice_option` VALUES (166, 25, 3, '5', b'0');
INSERT INTO `th_choice_option` VALUES (167, 25, 4, '6', b'0');
INSERT INTO `th_choice_option` VALUES (168, 26, 1, '1', b'1');
INSERT INTO `th_choice_option` VALUES (169, 26, 2, '1', b'1');
INSERT INTO `th_choice_option` VALUES (170, 26, 3, '1', b'1');
INSERT INTO `th_choice_option` VALUES (171, 26, 4, '5', b'0');
INSERT INTO `th_choice_option` VALUES (172, 27, 1, '3', b'0');
INSERT INTO `th_choice_option` VALUES (173, 27, 2, '0', b'1');
INSERT INTO `th_choice_option` VALUES (174, 27, 3, '3', b'0');
INSERT INTO `th_choice_option` VALUES (175, 27, 4, '5', b'0');
INSERT INTO `th_choice_option` VALUES (176, 30, 1, '-2', b'1');
INSERT INTO `th_choice_option` VALUES (177, 30, 2, '1', b'1');
INSERT INTO `th_choice_option` VALUES (178, 30, 3, '5', b'0');
INSERT INTO `th_choice_option` VALUES (179, 30, 4, '6', b'0');
INSERT INTO `th_choice_option` VALUES (180, 31, 1, 'asdasdas', b'1');
INSERT INTO `th_choice_option` VALUES (181, 31, 2, 'dddd', b'1');
INSERT INTO `th_choice_option` VALUES (182, 31, 3, '', b'0');
INSERT INTO `th_choice_option` VALUES (183, 31, 4, '', b'0');
INSERT INTO `th_choice_option` VALUES (184, 31, 5, '', b'0');
INSERT INTO `th_choice_option` VALUES (185, 32, 1, 'sdasdasdas', b'1');
INSERT INTO `th_choice_option` VALUES (186, 32, 2, 'dasdasdasdas', b'0');
INSERT INTO `th_choice_option` VALUES (187, 32, 3, '', b'0');
INSERT INTO `th_choice_option` VALUES (188, 32, 4, '', b'0');
INSERT INTO `th_choice_option` VALUES (189, 33, 1, '1', b'0');
INSERT INTO `th_choice_option` VALUES (190, 33, 2, '2', b'1');
INSERT INTO `th_choice_option` VALUES (191, 33, 3, '3', b'0');
INSERT INTO `th_choice_option` VALUES (192, 33, 4, '4', b'0');
INSERT INTO `th_choice_option` VALUES (201, 34, 1, '111', b'1');
INSERT INTO `th_choice_option` VALUES (202, 34, 2, '222', b'0');
INSERT INTO `th_choice_option` VALUES (203, 34, 3, '333', b'0');
INSERT INTO `th_choice_option` VALUES (204, 34, 4, '444', b'0');
INSERT INTO `th_choice_option` VALUES (216, 35, 1, '111', b'1');
INSERT INTO `th_choice_option` VALUES (217, 35, 2, '222', b'0');
INSERT INTO `th_choice_option` VALUES (218, 35, 3, '333若44', b'0');
INSERT INTO `th_choice_option` VALUES (219, 35, 4, '444', b'0');
INSERT INTO `th_choice_option` VALUES (324, 114, 1, '变量：存储数据的容器', b'1');
INSERT INTO `th_choice_option` VALUES (325, 114, 2, '条件语句：根据条件执行不同代码的结构', b'0');
INSERT INTO `th_choice_option` VALUES (326, 114, 3, 'HTTP协议：网页浏览使用的协议，默认端口80', b'0');
INSERT INTO `th_choice_option` VALUES (327, 114, 4, '应用软件：满足用户特定需求的程序，如Office、浏览器', b'0');
INSERT INTO `th_choice_option` VALUES (328, 115, 1, '函数：执行特定任务的代码块', b'1');
INSERT INTO `th_choice_option` VALUES (329, 115, 2, 'HTTPS协议：安全的HTTP协议，默认端口443', b'0');
INSERT INTO `th_choice_option` VALUES (330, 115, 3, '数据库是存储和管理数据的系统', b'0');
INSERT INTO `th_choice_option` VALUES (331, 115, 4, 'DNS：将域名转换为IP地址的系统', b'0');
INSERT INTO `th_choice_option` VALUES (332, 116, 1, '循环：重复执行代码的结构', b'1');
INSERT INTO `th_choice_option` VALUES (333, 116, 2, '主板：连接各个硬件组件的电路板', b'0');
INSERT INTO `th_choice_option` VALUES (334, 116, 3, '硬盘：永久存储数据和程序', b'0');
INSERT INTO `th_choice_option` VALUES (335, 116, 4, '应用软件：满足用户特定需求的程序，如Office、浏览器', b'0');
INSERT INTO `th_choice_option` VALUES (336, 117, 1, '应用软件：满足用户特定需求的程序，如Office、浏览器', b'0');
INSERT INTO `th_choice_option` VALUES (337, 117, 2, '内存（RAM）：临时存储正在运行的程序和数据', b'0');
INSERT INTO `th_choice_option` VALUES (338, 117, 3, '条件语句：根据条件执行不同代码的结构', b'1');
INSERT INTO `th_choice_option` VALUES (339, 117, 4, '数据库是存储和管理数据的系统', b'0');
INSERT INTO `th_choice_option` VALUES (380, 110, 1, 'VPN：虚拟专用网络', b'1');
INSERT INTO `th_choice_option` VALUES (381, 110, 2, '将域名解析为IP地址', b'0');
INSERT INTO `th_choice_option` VALUES (382, 110, 3, '分层的分布式数据库系统', b'0');
INSERT INTO `th_choice_option` VALUES (383, 110, 4, 'SSH：安全外壳协议，默认端口22', b'0');
INSERT INTO `th_choice_option` VALUES (384, 111, 1, '默认端口：53', b'0');
INSERT INTO `th_choice_option` VALUES (385, 111, 2, 'RIP：距离向量路由协议', b'1');
INSERT INTO `th_choice_option` VALUES (386, 111, 3, 'SSL/TLS：传输层安全协议', b'0');
INSERT INTO `th_choice_option` VALUES (387, 111, 4, 'SSH：安全外壳协议，默认端口22', b'0');
INSERT INTO `th_choice_option` VALUES (388, 112, 1, 'OSPF：链路状态路由协议', b'1');
INSERT INTO `th_choice_option` VALUES (389, 112, 2, 'BGP：边界网关协议，用于互联网路由', b'0');
INSERT INTO `th_choice_option` VALUES (390, 112, 3, 'SSL/TLS：传输层安全协议', b'0');
INSERT INTO `th_choice_option` VALUES (391, 112, 4, '将域名解析为IP地址', b'0');
INSERT INTO `th_choice_option` VALUES (392, 113, 1, 'RIP：距离向量路由协议', b'0');
INSERT INTO `th_choice_option` VALUES (393, 113, 2, '分层的分布式数据库系统', b'0');
INSERT INTO `th_choice_option` VALUES (394, 113, 3, '将域名解析为IP地址', b'0');
INSERT INTO `th_choice_option` VALUES (395, 113, 4, 'BGP：边界网关协议，用于互联网路由', b'1');
INSERT INTO `th_choice_option` VALUES (436, 100, 1, '时间复杂度：算法执行时间与输入规模的关系', b'0');
INSERT INTO `th_choice_option` VALUES (437, 100, 2, '堆排序：时间复杂度O(n log n)，不稳定排序', b'0');
INSERT INTO `th_choice_option` VALUES (438, 100, 3, '由顶点和边组成', b'1');
INSERT INTO `th_choice_option` VALUES (439, 100, 4, '空间复杂度：算法占用内存与输入规模的关系', b'0');
INSERT INTO `th_choice_option` VALUES (440, 101, 1, '有向图和无向图', b'1');
INSERT INTO `th_choice_option` VALUES (441, 101, 2, '快速排序：平均时间复杂度O(n log n)，不稳定排序', b'0');
INSERT INTO `th_choice_option` VALUES (442, 101, 3, '归并排序：时间复杂度O(n log n)，稳定排序', b'0');
INSERT INTO `th_choice_option` VALUES (443, 101, 4, '由顶点和边组成', b'0');
INSERT INTO `th_choice_option` VALUES (444, 102, 1, '有向图和无向图', b'0');
INSERT INTO `th_choice_option` VALUES (445, 102, 2, '遍历算法：深度优先搜索（DFS）、广度优先搜索（BFS）', b'1');
INSERT INTO `th_choice_option` VALUES (446, 102, 3, '时间复杂度：算法执行时间与输入规模的关系', b'0');
INSERT INTO `th_choice_option` VALUES (447, 102, 4, '由顶点和边组成', b'0');
INSERT INTO `th_choice_option` VALUES (448, 103, 1, '时间复杂度：算法执行时间与输入规模的关系', b'1');
INSERT INTO `th_choice_option` VALUES (449, 103, 2, '冒泡排序：时间复杂度O(n²)，稳定排序', b'0');
INSERT INTO `th_choice_option` VALUES (450, 103, 3, '有向图和无向图', b'0');
INSERT INTO `th_choice_option` VALUES (451, 103, 4, '遍历算法：深度优先搜索（DFS）、广度优先搜索（BFS）', b'0');
INSERT INTO `th_choice_option` VALUES (452, 104, 1, '空间复杂度：算法占用内存与输入规模的关系', b'1');
INSERT INTO `th_choice_option` VALUES (453, 104, 2, '时间复杂度：算法执行时间与输入规模的关系', b'0');
INSERT INTO `th_choice_option` VALUES (454, 104, 3, '有向图和无向图', b'0');
INSERT INTO `th_choice_option` VALUES (455, 104, 4, '由顶点和边组成', b'0');
INSERT INTO `th_choice_option` VALUES (456, 105, 1, '常见复杂度：O(1)、O(log n)、O(n)、O(n log n)、O(n²)', b'1');
INSERT INTO `th_choice_option` VALUES (457, 105, 2, '冒泡排序：时间复杂度O(n²)，稳定排序', b'0');
INSERT INTO `th_choice_option` VALUES (458, 105, 3, '快速排序：平均时间复杂度O(n log n)，不稳定排序', b'0');
INSERT INTO `th_choice_option` VALUES (459, 105, 4, '归并排序：时间复杂度O(n log n)，稳定排序', b'0');
INSERT INTO `th_choice_option` VALUES (460, 106, 1, '空间复杂度：算法占用内存与输入规模的关系', b'0');
INSERT INTO `th_choice_option` VALUES (461, 106, 2, '有向图和无向图', b'0');
INSERT INTO `th_choice_option` VALUES (462, 106, 3, '快速排序：平均时间复杂度O(n log n)，不稳定排序', b'0');
INSERT INTO `th_choice_option` VALUES (463, 106, 4, '冒泡排序：时间复杂度O(n²)，稳定排序', b'1');
INSERT INTO `th_choice_option` VALUES (464, 107, 1, '由顶点和边组成', b'0');
INSERT INTO `th_choice_option` VALUES (465, 107, 2, '有向图和无向图', b'0');
INSERT INTO `th_choice_option` VALUES (466, 107, 3, '堆排序：时间复杂度O(n log n)，不稳定排序', b'0');
INSERT INTO `th_choice_option` VALUES (467, 107, 4, '快速排序：平均时间复杂度O(n log n)，不稳定排序', b'1');
INSERT INTO `th_choice_option` VALUES (468, 108, 1, '冒泡排序：时间复杂度O(n²)，稳定排序', b'0');
INSERT INTO `th_choice_option` VALUES (469, 108, 2, '归并排序：时间复杂度O(n log n)，稳定排序', b'1');
INSERT INTO `th_choice_option` VALUES (470, 108, 3, '时间复杂度：算法执行时间与输入规模的关系', b'0');
INSERT INTO `th_choice_option` VALUES (471, 108, 4, '由顶点和边组成', b'0');
INSERT INTO `th_choice_option` VALUES (472, 109, 1, '由顶点和边组成', b'0');
INSERT INTO `th_choice_option` VALUES (473, 109, 2, '快速排序：平均时间复杂度O(n log n)，不稳定排序', b'0');
INSERT INTO `th_choice_option` VALUES (474, 109, 3, '有向图和无向图', b'0');
INSERT INTO `th_choice_option` VALUES (475, 109, 4, '堆排序：时间复杂度O(n log n)，不稳定排序', b'1');
INSERT INTO `th_choice_option` VALUES (516, 1, 1, '玩游戏', b'0');
INSERT INTO `th_choice_option` VALUES (517, 1, 2, '资源共享和信息传递', b'1');
INSERT INTO `th_choice_option` VALUES (518, 1, 3, '存储数据', b'0');
INSERT INTO `th_choice_option` VALUES (519, 1, 4, '打印文档', b'0');
INSERT INTO `th_choice_option` VALUES (520, 2, 1, '应用层', b'0');
INSERT INTO `th_choice_option` VALUES (521, 2, 2, '物理层', b'1');
INSERT INTO `th_choice_option` VALUES (522, 2, 3, '网络层', b'0');
INSERT INTO `th_choice_option` VALUES (523, 2, 4, '传输层', b'0');
INSERT INTO `th_choice_option` VALUES (524, 3, 1, '五层', b'0');
INSERT INTO `th_choice_option` VALUES (525, 3, 2, '七层', b'0');
INSERT INTO `th_choice_option` VALUES (526, 3, 3, '四层', b'1');
INSERT INTO `th_choice_option` VALUES (527, 3, 4, '三层', b'0');
INSERT INTO `th_choice_option` VALUES (528, 4, 1, '物理层', b'0');
INSERT INTO `th_choice_option` VALUES (529, 4, 2, '数据链路层', b'0');
INSERT INTO `th_choice_option` VALUES (530, 4, 3, '网络层', b'1');
INSERT INTO `th_choice_option` VALUES (531, 4, 4, '传输层', b'0');
INSERT INTO `th_choice_option` VALUES (532, 5, 1, '物理层', b'0');
INSERT INTO `th_choice_option` VALUES (533, 5, 2, '数据链路层', b'1');
INSERT INTO `th_choice_option` VALUES (534, 5, 3, '网络层', b'0');
INSERT INTO `th_choice_option` VALUES (535, 5, 4, '应用层', b'0');
INSERT INTO `th_choice_option` VALUES (536, 6, 1, '应用层', b'1');
INSERT INTO `th_choice_option` VALUES (537, 6, 2, '传输层', b'0');
INSERT INTO `th_choice_option` VALUES (538, 6, 3, '网络层', b'0');
INSERT INTO `th_choice_option` VALUES (539, 6, 4, '表示层', b'0');
INSERT INTO `th_choice_option` VALUES (540, 7, 1, '80', b'1');
INSERT INTO `th_choice_option` VALUES (541, 7, 2, '443', b'0');
INSERT INTO `th_choice_option` VALUES (542, 7, 3, '21', b'0');
INSERT INTO `th_choice_option` VALUES (543, 7, 4, '25', b'0');
INSERT INTO `th_choice_option` VALUES (544, 8, 1, '80', b'0');
INSERT INTO `th_choice_option` VALUES (545, 8, 2, '443', b'1');
INSERT INTO `th_choice_option` VALUES (546, 8, 3, '8080', b'0');
INSERT INTO `th_choice_option` VALUES (547, 8, 4, '22', b'0');
INSERT INTO `th_choice_option` VALUES (548, 9, 1, '32位', b'1');
INSERT INTO `th_choice_option` VALUES (549, 9, 2, '64位', b'0');
INSERT INTO `th_choice_option` VALUES (550, 9, 3, '128位', b'0');
INSERT INTO `th_choice_option` VALUES (551, 9, 4, '16位', b'0');
INSERT INTO `th_choice_option` VALUES (552, 10, 1, '32位', b'0');
INSERT INTO `th_choice_option` VALUES (553, 10, 2, '64位', b'0');
INSERT INTO `th_choice_option` VALUES (554, 10, 3, '128位', b'1');
INSERT INTO `th_choice_option` VALUES (555, 10, 4, '256位', b'0');
INSERT INTO `th_choice_option` VALUES (556, 3362501, 1, '正确选项', b'1');
INSERT INTO `th_choice_option` VALUES (557, 3362501, 2, '选项B', b'0');
INSERT INTO `th_choice_option` VALUES (558, 3362501, 3, '选项C', b'0');
INSERT INTO `th_choice_option` VALUES (559, 3362501, 4, '选项D', b'0');
INSERT INTO `th_choice_option` VALUES (560, 3362622, 1, '选项A', b'0');
INSERT INTO `th_choice_option` VALUES (561, 3362622, 2, '正确选项', b'1');
INSERT INTO `th_choice_option` VALUES (562, 3362622, 3, '选项C', b'0');
INSERT INTO `th_choice_option` VALUES (563, 3362622, 4, '选项D', b'0');
INSERT INTO `th_choice_option` VALUES (564, 3362663, 1, '选项A', b'0');
INSERT INTO `th_choice_option` VALUES (565, 3362663, 2, '选项B', b'0');
INSERT INTO `th_choice_option` VALUES (566, 3362663, 3, '正确选项', b'1');
INSERT INTO `th_choice_option` VALUES (567, 3362663, 4, '选项D', b'0');
INSERT INTO `th_choice_option` VALUES (568, 3362704, 1, '选项A', b'0');
INSERT INTO `th_choice_option` VALUES (569, 3362704, 2, '选项B', b'0');
INSERT INTO `th_choice_option` VALUES (570, 3362704, 3, '选项C', b'0');
INSERT INTO `th_choice_option` VALUES (571, 3362704, 4, '正确选项', b'1');
INSERT INTO `th_choice_option` VALUES (572, 3362725, 1, '正确选项', b'1');
INSERT INTO `th_choice_option` VALUES (573, 3362725, 2, '选项B', b'0');
INSERT INTO `th_choice_option` VALUES (574, 3362725, 3, '选项C', b'0');
INSERT INTO `th_choice_option` VALUES (575, 3362725, 4, '选项D', b'0');
INSERT INTO `th_choice_option` VALUES (576, 5146781, 1, '正确选项', b'1');
INSERT INTO `th_choice_option` VALUES (577, 5146781, 2, '选项B', b'0');
INSERT INTO `th_choice_option` VALUES (578, 5146781, 3, '选项C', b'0');
INSERT INTO `th_choice_option` VALUES (579, 5146781, 4, '选项D', b'0');
INSERT INTO `th_choice_option` VALUES (580, 5146842, 1, '选项A', b'0');
INSERT INTO `th_choice_option` VALUES (581, 5146842, 2, '正确选项', b'1');
INSERT INTO `th_choice_option` VALUES (582, 5146842, 3, '选项C', b'0');
INSERT INTO `th_choice_option` VALUES (583, 5146842, 4, '选项D', b'0');
INSERT INTO `th_choice_option` VALUES (584, 5146883, 1, '选项A', b'0');
INSERT INTO `th_choice_option` VALUES (585, 5146883, 2, '选项B', b'0');
INSERT INTO `th_choice_option` VALUES (586, 5146883, 3, '正确选项', b'1');
INSERT INTO `th_choice_option` VALUES (587, 5146883, 4, '选项D', b'0');
INSERT INTO `th_choice_option` VALUES (588, 5146934, 1, '选项A', b'0');
INSERT INTO `th_choice_option` VALUES (589, 5146934, 2, '选项B', b'0');
INSERT INTO `th_choice_option` VALUES (590, 5146934, 3, '选项C', b'0');
INSERT INTO `th_choice_option` VALUES (591, 5146934, 4, '正确选项', b'1');
INSERT INTO `th_choice_option` VALUES (592, 5146985, 1, '正确选项', b'1');
INSERT INTO `th_choice_option` VALUES (593, 5146985, 2, '选项B', b'0');
INSERT INTO `th_choice_option` VALUES (594, 5146985, 3, '选项C', b'0');
INSERT INTO `th_choice_option` VALUES (595, 5146985, 4, '选项D', b'0');
INSERT INTO `th_choice_option` VALUES (596, 2496401, 1, '正确选项', b'1');
INSERT INTO `th_choice_option` VALUES (597, 2496401, 2, '选项B', b'0');
INSERT INTO `th_choice_option` VALUES (598, 2496401, 3, '选项C', b'0');
INSERT INTO `th_choice_option` VALUES (599, 2496401, 4, '选项D', b'0');
INSERT INTO `th_choice_option` VALUES (600, 2496452, 1, '选项A', b'0');
INSERT INTO `th_choice_option` VALUES (601, 2496452, 2, '正确选项', b'1');
INSERT INTO `th_choice_option` VALUES (602, 2496452, 3, '选项C', b'0');
INSERT INTO `th_choice_option` VALUES (603, 2496452, 4, '选项D', b'0');
INSERT INTO `th_choice_option` VALUES (604, 2496493, 1, '选项A', b'0');
INSERT INTO `th_choice_option` VALUES (605, 2496493, 2, '选项B', b'0');
INSERT INTO `th_choice_option` VALUES (606, 2496493, 3, '正确选项', b'1');
INSERT INTO `th_choice_option` VALUES (607, 2496493, 4, '选项D', b'0');
INSERT INTO `th_choice_option` VALUES (608, 2496534, 1, '选项A', b'0');
INSERT INTO `th_choice_option` VALUES (609, 2496534, 2, '选项B', b'0');
INSERT INTO `th_choice_option` VALUES (610, 2496534, 3, '选项C', b'0');
INSERT INTO `th_choice_option` VALUES (611, 2496534, 4, '正确选项', b'1');
INSERT INTO `th_choice_option` VALUES (612, 2496585, 1, '正确选项', b'1');
INSERT INTO `th_choice_option` VALUES (613, 2496585, 2, '选项B', b'0');
INSERT INTO `th_choice_option` VALUES (614, 2496585, 3, '选项C', b'0');
INSERT INTO `th_choice_option` VALUES (615, 2496585, 4, '选项D', b'0');

-- ----------------------------
-- Table structure for th_course
-- ----------------------------
DROP TABLE IF EXISTS `th_course`;
CREATE TABLE `th_course`  (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_start` bit(1) NULL DEFAULT NULL COMMENT '1真0假',
  `is_public` bit(1) NULL DEFAULT NULL COMMENT '1真0假',
  `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `describes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`) USING BTREE,
  INDEX `courseforuser`(`user_id` ASC) USING BTREE,
  CONSTRAINT `courseforuser` FOREIGN KEY (`user_id`) REFERENCES `th_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_course
-- ----------------------------
INSERT INTO `th_course` VALUES (1, '自然语言处理', 'root', b'1', b'1', '/files/user/root/cover/cover_2024_08_05035215299.png', '自然语言处理(natural language processing, NLP)是人工智能的一个重要分支，研究算法如何自动的理解和生成人类语言。近些年，自然语言处理受到了越来越多的关注，从智能检索到智能翻译、智能音箱、GPT等模型的影响十分广泛。\n自然语言处理背后的基本技术是机器学习，自然语言的特性使得自然语言处理领域的机器学习技术具有自身的重要特点，而这些特点，也为整个机器学习领域的发展提供了重要贡献。理解自然语言处理背后的机器学习基础，为深入理解语言处理技术，灵活应', '2024-07-27 00:35:47');
INSERT INTO `th_course` VALUES (2, '算法设计与分析', 'root', b'1', b'1', '/files/user/root/cover/cover_2024_08_05035843440.png', '从辗转相除法到割圆术，从算盘到电子计算机，算法在人类文明发展中始终扮演着重要角色。如今，有计算的地方，就有算法的身影。从网上购物到出行规划，从工作学习到休闲娱乐，算法无所不在,已融入到人们生活的方方面面。\n\n本课程是面向计算机和信息技术相关专业本科生的核心专业课，同时适合对算法的基础知识有学习需求的相关从业人员。课程汇聚了北航计算机学院顶级的算法授课团队，不但讲授分而治之、动态规划和贪心策略等经典算法技术，而且以产教融合的方式邀请阿里巴巴等互联网公司副总裁、ACM国际大学生程', '2024-07-27 00:35:47');
INSERT INTO `th_course` VALUES (3, '人工智能', 'root', b'1', b'1', '/files/user/root/cover/cover_2024_08_05040004699.png', '人工智能(Artificial Intelligence，简称AI)是以机器为载体所展示出来的人类智能，因此人工智能也被称为机器智能(Machine Intelligence)。对人类智能的模拟可通过以符号主义为核心的逻辑推理、以问题求解为核心的探询搜索、以数据驱动为核心的机器学习、以行为主义为核心的强化学习和以博弈对抗为核心的决策智能等方法来实现。\n\n    本课程成体系介绍人工智能的基本概念和基础算法，可帮助学习者掌握人工智能脉络体系，体会具能、使能和赋能，从算法层面对人', '2024-07-27 00:35:47');
INSERT INTO `th_course` VALUES (4, '大数据算法', 'root', b'1', b'1', '/files/user/root/cover/cover_2024_08_05035421633.png', '大数据算法这门课程旨在通过讲授一些大数据上基本算法设计思想，包括概率算法、I/O有效算法和并行算法，让听课的同学们接触到和传统算法课程不一样的算法设计与分析思路，并且以最新的研究成果为导向，让参与这门课程学习的同学了解大数据算法的前沿知识。通过这门课程的学习，同学可以掌握大数据算法设计的基本思想，并通过本门课程的作业，掌握大数据算法设计与分析的技术。', '2024-07-27 00:35:47');
INSERT INTO `th_course` VALUES (5, '计算系统的局限性', 'root', b'1', b'1', '/files/user/root/cover/cover_2022_05_10140023701.png', '设计电子电路', '2024-07-27 00:35:47');
INSERT INTO `th_course` VALUES (7, '软件测试', 'stu023', b'0', b'1', '/files/user/stu023/cover/cover_2024_08_05040348910.png', '本课程为普通高校师生（多层次）与社会学习者而开设。课程既为在校学生获得软件测试专业技能较高的‘入门’水平或继续深造奠基，也为软件测试从业者提升职业能力服务。\n\n本课程定位于软件测试/软件开发工程师，为学习培养从事软件测试各项工作而应具备的专业技能而设立具体目标。\n\n本课程涵盖软件测试基础理论、经典测试技术、各软件领域应用场景的测试策略及测试过程，以及测试工程的实践共五个部分。课程内容覆盖面广、层次多样、内涵丰富，并尽力体现‘与时俱进’。\n\n本课程突出MOOC特点，依据软件测试', '2024-07-27 00:35:47');
INSERT INTO `th_course` VALUES (8, '数据结构', 'stu023', b'1', b'0', '/files/user/stu023/cover/cover_2024_07_13142738935.jpg', 'hello,数据结构', '2024-07-27 00:35:47');
INSERT INTO `th_course` VALUES (9, '计算机组成原理', 'tea002', b'1', b'0', '/files/user/tea002/cover/cover_2022_05_10144537956.png', '学习物理知识', '2024-07-27 00:35:47');
INSERT INTO `th_course` VALUES (58, '大数据', 'stu023', b'1', b'1', '/files/user/stu023/cover/cover_2024_07_13142749722.jpg', '', '2024-02-01 09:16:10');
INSERT INTO `th_course` VALUES (59, '单机骗', 'stu023', b'1', b'1', '/files/user/stu023/cover/cover_2024_07_13142757723.png', '', '2024-02-01 09:28:08');
INSERT INTO `th_course` VALUES (60, '大数据', 'stu003', b'1', b'1', '/files/user/stu003/cover/cover_2024_02_26011920286.jpg', '2121212121', '2024-02-25 17:19:24');
INSERT INTO `th_course` VALUES (62, '设计思维', 'root', b'1', b'1', '/files/user/root/cover/cover_2024_08_05042740935.png', '1', '2024-08-04 20:27:56');
INSERT INTO `th_course` VALUES (63, 'Java程序设计', 'sdu788', b'1', b'1', '/files/user/sdu788/cover/cover_2024_09_14105132018.png', '1111111111111111111111111111', '2024-09-14 14:51:46');
INSERT INTO `th_course` VALUES (64, '算法', 'stu023', b'1', b'1', '/files/user/stu023/cover/cover_2024_09_21233526521.png', '11111111111', '2024-09-21 15:35:30');
INSERT INTO `th_course` VALUES (65, '算法进阶', 'stu023', b'1', b'1', '/files/user/stu023/cover/cover_2024_09_22025148716.png', '111111111111111111111111111', '2024-09-21 18:51:57');
INSERT INTO `th_course` VALUES (66, 'JAVA进阶', 'stu023', b'1', b'1', '/files/user/stu023/cover/cover_2024_12_27184533210.jpeg', '111111111111111', '2024-12-27 10:45:36');
INSERT INTO `th_course` VALUES (67, '1', 'XJC666', b'1', b'1', '/imgs/course/default.jpg', '', '2025-07-10 12:00:00');

-- ----------------------------
-- Table structure for th_course_user
-- ----------------------------
DROP TABLE IF EXISTS `th_course_user`;
CREATE TABLE `th_course_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL COMMENT '课程id',
  `user_id` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id',
  `res_dl_num` int NULL DEFAULT 0 COMMENT '资源下载数',
  `discussion_create_num` int NULL DEFAULT 0 COMMENT '讨论创建数',
  `chapter_view_time` int NULL DEFAULT 0 COMMENT '章节观看时长',
  `chapter_view_num` int NULL DEFAULT 0 COMMENT '章节观看次数',
  `reply_num` int NULL DEFAULT 0 COMMENT '发表回复数',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cuforcourse`(`course_id` ASC) USING BTREE,
  INDEX `cuforuser`(`user_id` ASC) USING BTREE,
  CONSTRAINT `cuforcourse` FOREIGN KEY (`course_id`) REFERENCES `th_course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cuforuser` FOREIGN KEY (`user_id`) REFERENCES `th_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 306 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_course_user
-- ----------------------------
INSERT INTO `th_course_user` VALUES (6, 4, 'stu023', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (8, 5, 'stu023', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (14, 1, 'stu003', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (15, 1, 'stu033', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (16, 1, 'stu043', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (78, 1, 'stu013', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (88, 1, 'stu023', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (108, 2, 'stu013', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (109, 4, 'stu013', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (110, 3, 'stu013', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (111, 5, 'stu013', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (118, 1, 'tea001', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (119, 2, 'tea001', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (120, 3, 'tea001', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (121, 4, 'tea001', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (122, 5, 'tea001', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (124, 1, 'tea002', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (125, 2, 'tea002', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (127, 1, 'tea003', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (128, 2, 'tea003', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (130, 1, 'tea004', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (131, 2, 'tea004', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (133, 4, 'tea004', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (134, 3, 'tea004', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (135, 5, 'tea004', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (139, 2, 'stu033', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (140, 3, 'stu033', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (141, 4, 'stu033', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (142, 5, 'stu033', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (156, 1, 'stu022', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (157, 2, 'stu022', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (158, 3, 'stu022', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (159, 4, 'stu022', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (160, 5, 'stu022', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (162, 7, 'stu022', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (166, 7, 'root', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (168, 7, 'stu023', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (169, 1, 'root123', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (170, 2, 'root123', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (171, 3, 'root123', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (172, 4, 'root123', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (173, 5, 'root123', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (174, 1, 'stu016', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (175, 2, 'stu016', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (176, 3, 'stu016', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (177, 4, 'stu016', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (178, 5, 'stu016', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (179, 7, 'stu016', 0, 0, 0, 0, 0, '2023-12-25 09:26:07');
INSERT INTO `th_course_user` VALUES (186, 1, 'user1', 0, 0, 0, 0, 0, '2024-02-01 09:10:44');
INSERT INTO `th_course_user` VALUES (187, 2, 'user1', 0, 0, 0, 0, 0, '2024-02-01 09:10:44');
INSERT INTO `th_course_user` VALUES (188, 3, 'user1', 0, 0, 0, 0, 0, '2024-02-01 09:10:44');
INSERT INTO `th_course_user` VALUES (189, 4, 'user1', 0, 0, 0, 0, 0, '2024-02-01 09:10:44');
INSERT INTO `th_course_user` VALUES (190, 5, 'user1', 0, 0, 0, 0, 0, '2024-02-01 09:10:44');
INSERT INTO `th_course_user` VALUES (191, 7, 'user1', 0, 0, 0, 0, 0, '2024-02-01 09:11:12');
INSERT INTO `th_course_user` VALUES (192, 58, 'user1', 0, 0, 0, 0, 0, '2024-02-01 09:17:19');
INSERT INTO `th_course_user` VALUES (193, 1, 'user2', 0, 0, 0, 0, 0, '2024-02-01 09:23:04');
INSERT INTO `th_course_user` VALUES (194, 2, 'user2', 0, 0, 0, 0, 0, '2024-02-01 09:23:04');
INSERT INTO `th_course_user` VALUES (195, 3, 'user2', 0, 0, 0, 0, 0, '2024-02-01 09:23:04');
INSERT INTO `th_course_user` VALUES (196, 4, 'user2', 0, 0, 0, 0, 0, '2024-02-01 09:23:04');
INSERT INTO `th_course_user` VALUES (197, 5, 'user2', 0, 0, 0, 0, 0, '2024-02-01 09:23:04');
INSERT INTO `th_course_user` VALUES (199, 59, 'user2', 0, 0, 0, 0, 0, '2024-02-01 09:29:32');
INSERT INTO `th_course_user` VALUES (200, 2, 'stu003', 0, 0, 0, 0, 0, '2024-02-25 17:09:14');
INSERT INTO `th_course_user` VALUES (201, 1, 'sdu001', 0, 0, 0, 0, 0, '2024-03-25 19:01:01');
INSERT INTO `th_course_user` VALUES (202, 2, 'sdu001', 0, 0, 0, 0, 0, '2024-03-25 19:01:01');
INSERT INTO `th_course_user` VALUES (203, 3, 'sdu001', 0, 0, 0, 0, 0, '2024-03-25 19:01:01');
INSERT INTO `th_course_user` VALUES (204, 4, 'sdu001', 0, 0, 0, 0, 0, '2024-03-25 19:01:01');
INSERT INTO `th_course_user` VALUES (205, 5, 'sdu001', 0, 0, 0, 0, 0, '2024-03-25 19:01:01');
INSERT INTO `th_course_user` VALUES (206, 7, 'sdu001', 0, 0, 0, 0, 0, '2024-03-25 19:02:09');
INSERT INTO `th_course_user` VALUES (207, 1, 'stu567', 0, 0, 0, 0, 0, '2024-08-04 19:56:29');
INSERT INTO `th_course_user` VALUES (208, 2, 'stu567', 0, 0, 0, 0, 0, '2024-08-04 19:56:29');
INSERT INTO `th_course_user` VALUES (209, 3, 'stu567', 0, 0, 0, 0, 0, '2024-08-04 19:56:29');
INSERT INTO `th_course_user` VALUES (210, 4, 'stu567', 0, 0, 0, 0, 0, '2024-08-04 19:56:29');
INSERT INTO `th_course_user` VALUES (211, 5, 'stu567', 0, 0, 0, 0, 0, '2024-08-04 19:56:29');
INSERT INTO `th_course_user` VALUES (212, 1, 'sdu345', 0, 0, 0, 0, 0, '2024-08-04 20:15:02');
INSERT INTO `th_course_user` VALUES (213, 2, 'sdu345', 0, 0, 0, 0, 0, '2024-08-04 20:15:02');
INSERT INTO `th_course_user` VALUES (214, 3, 'sdu345', 0, 0, 0, 0, 0, '2024-08-04 20:15:02');
INSERT INTO `th_course_user` VALUES (215, 4, 'sdu345', 0, 0, 0, 0, 0, '2024-08-04 20:15:02');
INSERT INTO `th_course_user` VALUES (216, 5, 'sdu345', 0, 0, 0, 0, 0, '2024-08-04 20:15:02');
INSERT INTO `th_course_user` VALUES (219, 1, 'sdu346', 0, 0, 0, 0, 0, '2024-08-04 20:23:09');
INSERT INTO `th_course_user` VALUES (220, 2, 'sdu346', 0, 0, 0, 0, 0, '2024-08-04 20:23:09');
INSERT INTO `th_course_user` VALUES (221, 3, 'sdu346', 0, 0, 0, 0, 0, '2024-08-04 20:23:09');
INSERT INTO `th_course_user` VALUES (222, 4, 'sdu346', 0, 0, 0, 0, 0, '2024-08-04 20:23:09');
INSERT INTO `th_course_user` VALUES (223, 5, 'sdu346', 0, 0, 0, 0, 0, '2024-08-04 20:23:09');
INSERT INTO `th_course_user` VALUES (226, 3, 'stu023', 0, 0, 0, 0, 0, '2024-08-05 13:42:51');
INSERT INTO `th_course_user` VALUES (227, 2, 'stu023', 0, 0, 0, 0, 0, '2024-08-05 13:42:54');
INSERT INTO `th_course_user` VALUES (228, 62, 'stu023', 0, 0, 0, 0, 0, '2024-08-05 13:42:59');
INSERT INTO `th_course_user` VALUES (229, 1, 'sdu988', 0, 0, 0, 0, 0, '2024-09-14 14:21:50');
INSERT INTO `th_course_user` VALUES (230, 2, 'sdu988', 0, 0, 0, 0, 0, '2024-09-14 14:21:50');
INSERT INTO `th_course_user` VALUES (231, 3, 'sdu988', 0, 0, 0, 0, 0, '2024-09-14 14:21:50');
INSERT INTO `th_course_user` VALUES (232, 4, 'sdu988', 0, 0, 0, 0, 0, '2024-09-14 14:21:50');
INSERT INTO `th_course_user` VALUES (233, 5, 'sdu988', 0, 0, 0, 0, 0, '2024-09-14 14:21:50');
INSERT INTO `th_course_user` VALUES (234, 7, 'sdu988', 0, 0, 0, 0, 0, '2024-09-14 14:30:35');
INSERT INTO `th_course_user` VALUES (235, 1, 'sdu899', 0, 0, 0, 0, 0, '2024-09-14 14:33:17');
INSERT INTO `th_course_user` VALUES (236, 2, 'sdu899', 0, 0, 0, 0, 0, '2024-09-14 14:33:17');
INSERT INTO `th_course_user` VALUES (237, 3, 'sdu899', 0, 0, 0, 0, 0, '2024-09-14 14:33:17');
INSERT INTO `th_course_user` VALUES (238, 4, 'sdu899', 0, 0, 0, 0, 0, '2024-09-14 14:33:17');
INSERT INTO `th_course_user` VALUES (239, 5, 'sdu899', 0, 0, 0, 0, 0, '2024-09-14 14:33:17');
INSERT INTO `th_course_user` VALUES (240, 1, 'sdu788', 0, 0, 0, 0, 0, '2024-09-14 14:37:09');
INSERT INTO `th_course_user` VALUES (241, 2, 'sdu788', 0, 0, 0, 0, 0, '2024-09-14 14:37:10');
INSERT INTO `th_course_user` VALUES (242, 3, 'sdu788', 0, 0, 0, 0, 0, '2024-09-14 14:37:10');
INSERT INTO `th_course_user` VALUES (243, 4, 'sdu788', 0, 0, 0, 0, 0, '2024-09-14 14:37:10');
INSERT INTO `th_course_user` VALUES (244, 5, 'sdu788', 0, 0, 0, 0, 0, '2024-09-14 14:37:10');
INSERT INTO `th_course_user` VALUES (245, 7, 'sdu788', 0, 0, 0, 0, 0, '2024-09-14 14:38:28');
INSERT INTO `th_course_user` VALUES (246, 1, 'sdu7888', 0, 0, 0, 0, 0, '2024-09-14 15:38:38');
INSERT INTO `th_course_user` VALUES (247, 2, 'sdu7888', 0, 0, 0, 0, 0, '2024-09-14 15:38:38');
INSERT INTO `th_course_user` VALUES (248, 3, 'sdu7888', 0, 0, 0, 0, 0, '2024-09-14 15:38:38');
INSERT INTO `th_course_user` VALUES (249, 4, 'sdu7888', 0, 0, 0, 0, 0, '2024-09-14 15:38:38');
INSERT INTO `th_course_user` VALUES (250, 5, 'sdu7888', 0, 0, 0, 0, 0, '2024-09-14 15:38:38');
INSERT INTO `th_course_user` VALUES (251, 7, 'sdu7888', 0, 0, 0, 0, 0, '2024-09-14 15:38:52');
INSERT INTO `th_course_user` VALUES (252, 1, 'sdu143', 0, 0, 0, 0, 0, '2024-09-21 15:27:44');
INSERT INTO `th_course_user` VALUES (253, 2, 'sdu143', 0, 0, 0, 0, 0, '2024-09-21 15:27:44');
INSERT INTO `th_course_user` VALUES (254, 3, 'sdu143', 0, 0, 0, 0, 0, '2024-09-21 15:27:44');
INSERT INTO `th_course_user` VALUES (255, 4, 'sdu143', 0, 0, 0, 0, 0, '2024-09-21 15:27:44');
INSERT INTO `th_course_user` VALUES (256, 5, 'sdu143', 0, 0, 0, 0, 0, '2024-09-21 15:27:44');
INSERT INTO `th_course_user` VALUES (257, 7, 'sdu143', 0, 0, 0, 0, 0, '2024-09-21 15:28:53');
INSERT INTO `th_course_user` VALUES (258, 1, 'sdu122', 0, 0, 0, 0, 0, '2024-09-21 18:42:12');
INSERT INTO `th_course_user` VALUES (259, 2, 'sdu122', 0, 0, 0, 0, 0, '2024-09-21 18:42:12');
INSERT INTO `th_course_user` VALUES (260, 3, 'sdu122', 0, 0, 0, 0, 0, '2024-09-21 18:42:12');
INSERT INTO `th_course_user` VALUES (261, 4, 'sdu122', 0, 0, 0, 0, 0, '2024-09-21 18:42:12');
INSERT INTO `th_course_user` VALUES (262, 5, 'sdu122', 0, 0, 0, 0, 0, '2024-09-21 18:42:12');
INSERT INTO `th_course_user` VALUES (263, 7, 'sdu122', 0, 0, 0, 0, 0, '2024-09-21 18:45:21');
INSERT INTO `th_course_user` VALUES (264, 7, 'stu567', 0, 0, 0, 0, 0, '2024-12-27 10:10:13');
INSERT INTO `th_course_user` VALUES (265, 1, 'stu101', 0, 0, 0, 0, 0, '2024-12-27 10:32:49');
INSERT INTO `th_course_user` VALUES (266, 2, 'stu101', 0, 0, 0, 0, 0, '2024-12-27 10:32:49');
INSERT INTO `th_course_user` VALUES (267, 3, 'stu101', 0, 0, 0, 0, 0, '2024-12-27 10:32:49');
INSERT INTO `th_course_user` VALUES (268, 4, 'stu101', 0, 0, 0, 0, 0, '2024-12-27 10:32:50');
INSERT INTO `th_course_user` VALUES (269, 5, 'stu101', 0, 0, 0, 0, 0, '2024-12-27 10:32:50');
INSERT INTO `th_course_user` VALUES (270, 7, 'stu101', 0, 0, 0, 0, 0, '2024-12-27 10:34:19');
INSERT INTO `th_course_user` VALUES (271, 66, 'stu101', 0, 0, 0, 0, 0, '2024-12-27 10:46:09');
INSERT INTO `th_course_user` VALUES (272, 4, 'stu003', 0, 0, 0, 0, 0, '2025-02-12 12:05:28');
INSERT INTO `th_course_user` VALUES (273, 58, 'stu003', 0, 0, 0, 0, 0, '2025-02-12 12:05:31');
INSERT INTO `th_course_user` VALUES (274, 66, 'stu003', 0, 0, 0, 0, 0, '2025-02-12 12:05:38');
INSERT INTO `th_course_user` VALUES (275, 62, 'stu003', 0, 0, 0, 0, 0, '2025-02-12 12:05:47');
INSERT INTO `th_course_user` VALUES (276, 1, 'li908', 0, 0, 0, 0, 0, '2025-02-12 12:18:56');
INSERT INTO `th_course_user` VALUES (277, 2, 'li908', 0, 0, 0, 0, 0, '2025-02-12 12:18:56');
INSERT INTO `th_course_user` VALUES (278, 3, 'li908', 0, 0, 0, 0, 0, '2025-02-12 12:18:56');
INSERT INTO `th_course_user` VALUES (279, 4, 'li908', 0, 0, 0, 0, 0, '2025-02-12 12:18:56');
INSERT INTO `th_course_user` VALUES (280, 5, 'li908', 0, 0, 0, 0, 0, '2025-02-12 12:18:56');
INSERT INTO `th_course_user` VALUES (281, 7, 'li908', 0, 0, 0, 0, 0, '2025-02-12 12:20:03');
INSERT INTO `th_course_user` VALUES (282, 1, 'yy234', 0, 0, 0, 0, 0, '2025-02-12 12:29:36');
INSERT INTO `th_course_user` VALUES (283, 2, 'yy234', 0, 0, 0, 0, 0, '2025-02-12 12:29:36');
INSERT INTO `th_course_user` VALUES (284, 3, 'yy234', 0, 0, 0, 0, 0, '2025-02-12 12:29:36');
INSERT INTO `th_course_user` VALUES (285, 4, 'yy234', 0, 0, 0, 0, 0, '2025-02-12 12:29:36');
INSERT INTO `th_course_user` VALUES (286, 5, 'yy234', 0, 0, 0, 0, 0, '2025-02-12 12:29:36');
INSERT INTO `th_course_user` VALUES (287, 7, 'yy234', 0, 0, 0, 0, 0, '2025-02-12 12:30:27');
INSERT INTO `th_course_user` VALUES (288, 1, 'yh123', 0, 0, 0, 0, 0, '2025-07-08 15:11:05');
INSERT INTO `th_course_user` VALUES (289, 2, 'yh123', 0, 0, 0, 0, 0, '2025-07-08 15:11:05');
INSERT INTO `th_course_user` VALUES (290, 3, 'yh123', 0, 0, 0, 0, 0, '2025-07-08 15:11:05');
INSERT INTO `th_course_user` VALUES (291, 4, 'yh123', 0, 0, 0, 0, 0, '2025-07-08 15:11:05');
INSERT INTO `th_course_user` VALUES (292, 5, 'yh123', 0, 0, 0, 0, 0, '2025-07-08 15:11:05');
INSERT INTO `th_course_user` VALUES (293, 7, 'yh123', 0, 0, 0, 0, 0, '2025-07-08 15:11:19');
INSERT INTO `th_course_user` VALUES (294, 1, '1111', 0, 0, 0, 0, 0, '2025-07-09 15:00:31');
INSERT INTO `th_course_user` VALUES (295, 2, '1111', 0, 0, 0, 0, 0, '2025-07-09 15:00:31');
INSERT INTO `th_course_user` VALUES (296, 3, '1111', 0, 0, 0, 0, 0, '2025-07-09 15:00:31');
INSERT INTO `th_course_user` VALUES (297, 4, '1111', 0, 0, 0, 0, 0, '2025-07-09 15:00:31');
INSERT INTO `th_course_user` VALUES (298, 5, '1111', 0, 0, 0, 0, 0, '2025-07-09 15:00:31');
INSERT INTO `th_course_user` VALUES (299, 1, 'XJC666', 0, 0, 0, 0, 0, '2025-07-10 11:59:00');
INSERT INTO `th_course_user` VALUES (300, 2, 'XJC666', 0, 0, 0, 0, 0, '2025-07-10 11:59:00');
INSERT INTO `th_course_user` VALUES (301, 3, 'XJC666', 0, 0, 0, 0, 0, '2025-07-10 11:59:00');
INSERT INTO `th_course_user` VALUES (302, 4, 'XJC666', 0, 0, 0, 0, 0, '2025-07-10 11:59:00');
INSERT INTO `th_course_user` VALUES (303, 5, 'XJC666', 0, 0, 0, 0, 0, '2025-07-10 11:59:00');
INSERT INTO `th_course_user` VALUES (304, 59, 'XJC666', 0, 0, 0, 0, 0, '2025-07-10 12:08:05');
INSERT INTO `th_course_user` VALUES (305, 7, 'XJC666', 0, 0, 0, 0, 0, '2025-07-21 11:19:01');

-- ----------------------------
-- Table structure for th_discussion
-- ----------------------------
DROP TABLE IF EXISTS `th_discussion`;
CREATE TABLE `th_discussion`  (
  `discussion_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `user_id` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `hits` int NULL DEFAULT NULL,
  `likes` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`discussion_id`) USING BTREE,
  INDEX `disforcourse`(`course_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `disforcourse` FOREIGN KEY (`course_id`) REFERENCES `th_course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `th_discussion_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `th_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_discussion
-- ----------------------------
INSERT INTO `th_discussion` VALUES (19, 7, 'stu023', '讨论区文本测试', '<p>等你，在雨中，在造虹的雨中</p>\n\n<p>蝉声沉落，蛙声升起</p>\n\n<p>一池的红莲如红焰，在雨中</p>\n\n<p>你来不来都一样，竟感觉</p>\n\n<p>每朵莲都像你</p>\n\n<p>尤其隔着黄昏，隔着这样的细雨</p>\n\n<p>永恒，刹那，刹那，永恒</p>\n\n<p>等你，在时间之外，</p>\n\n<p>在时间之内，等你，在刹那，在永恒</p>\n\n<p>如果你的手在我的手里，此刻</p>\n\n<p>如果你的清芬</p>\n\n<p>在我的鼻孔，我会说，小情人</p>\n\n<p>诺，这只手应该采莲，在吴宫</p>\n\n<p>这只手应该</p>\n\n<p>摇一柄桂桨，在木兰舟中</p>\n\n<p>一颗星悬在科学馆的飞檐</p>\n\n<p>耳坠子一般的悬着</p>\n\n<p>瑞士表说都七点了。忽然你走来</p>\n\n<p>步雨后的红莲，翩翩，你走来</p>\n\n<p>像一首小令</p>\n\n<p>从一则爱情的典故里你走来</p>\n\n<p>从姜白石的词里，有韵地，你走来</p>\n', 11, 1, '2024-07-27 04:19:04');
INSERT INTO `th_discussion` VALUES (20, 7, 'stu023', '讨论区图片测试', '<p><img alt=\"\" height=\"416\" src=\"/files/user/stu023/ckeditor/ckeditor_2023_07_10122222973.jpg\" width=\"680\" /></p>\n', 6, 0, '2024-07-27 04:19:04');
INSERT INTO `th_discussion` VALUES (21, 7, 'stu022', '学生发布讨论测试', '<div>这是占位文本&nbsp;这是占位文本&nbsp;这是占位文本&nbsp;这是占位文本</div>\n\n<div>这是占位文本&nbsp;这是占位文本&nbsp;这是占位文本&nbsp;这是占位文本</div>\n\n<div>这是占位文本&nbsp;这是占位文本&nbsp;这是占位文本&nbsp;这是占位文本</div>\n\n<div>这是占位文本&nbsp;这是占位文本&nbsp;这是占位文本&nbsp;这是占位文本</div>\n', 10, 1, '2024-07-27 04:19:04');
INSERT INTO `th_discussion` VALUES (22, 7, 'stu013', '栈和队列', '<div>在线性表中，栈和队列是我们要掌握的重要知识点，关于这两者的区别，大家可以在下面说说自己的看法吗</div>\n\n<p><img alt=\"\" height=\"306\" src=\"/files/user/stu013/ckeditor/ckeditor_2023_07_11103122185.jpg\" width=\"642\" /></p>\n', 36, 8, '2024-07-27 04:19:04');
INSERT INTO `th_discussion` VALUES (23, 2, 'stu023', '主存中的动态RAM和静态RAM', '<p><span style=\"font-size:18px\">计算机中的RAM为了提高读写效率，会分出静态RAM和动态RAM；</span></p>\n\n<p><span style=\"font-size:18px\">两种RAM在组成元件和速度等方面都有不同，大家来说说自己的看法吧。</span></p>\n\n<ul>\n	<li><span style=\"font-size:16px\">主存：DRAM，一般由电容组成，读取速度较慢，但功耗低，价格便宜</span></li>\n	<li><span style=\"font-size:16px\">缓存：SRAM，一般有触发器组成，读取速度快，同时成本高，功耗高。</span></li>\n</ul>\n', 4, 0, '2024-07-27 04:19:04');
INSERT INTO `th_discussion` VALUES (24, 2, 'stu023', '计算机系统的性能指标', '<p>衡量计算机性能的指标有很多，比如：</p>\n\n<ul>\n	<li>基本字长</li>\n	<li>数据传输率</li>\n	<li>外频</li>\n	<li>主频</li>\n	<li>功耗</li>\n</ul>\n\n<p>请大家就这方面，谈谈自己的理解</p>\n', 3, 0, '2024-07-27 04:19:04');
INSERT INTO `th_discussion` VALUES (25, 7, 'stu023', '2222222222222', '<p>2222222222222222222222222</p>\n', 4, 1, '2024-07-27 22:36:46');
INSERT INTO `th_discussion` VALUES (26, 7, 'stu023', '534534', '<p>4534543534</p>\n', 4, 1, '2024-07-27 22:48:54');
INSERT INTO `th_discussion` VALUES (27, 7, 'stu023', '如何学习测试', '<p>1111111</p>\n', 1, 0, '2024-02-01 03:21:53');
INSERT INTO `th_discussion` VALUES (28, 7, 'stu023', '1+1+1？', '<p>fasfas</p>\n', 0, 0, '2024-02-01 09:13:52');
INSERT INTO `th_discussion` VALUES (29, 59, 'stu023', '1414', '<p>1471741</p>\n', 3, 1, '2024-02-01 09:30:17');
INSERT INTO `th_discussion` VALUES (30, 7, 'stu023', '什么是python', '<p>什么是python</p>\n', 3, 1, '2024-02-25 17:14:14');
INSERT INTO `th_discussion` VALUES (31, 7, 'stu023', '什么是测试', '<p>1</p>\n', 0, 0, '2024-03-25 19:09:26');
INSERT INTO `th_discussion` VALUES (32, 7, 'stu023', '软件测试的意义', '<p>11111111111111</p>\n', 6, 2, '2024-08-04 20:31:01');
INSERT INTO `th_discussion` VALUES (33, 7, 'stu023', '222222222222222222', '<p><strong>222222222222222222222222222222</strong></p>\n', 1, 0, '2024-09-14 14:46:40');
INSERT INTO `th_discussion` VALUES (34, 7, 'stu023', '1', '<p>1</p>\n', 2, 0, '2024-09-21 15:38:04');
INSERT INTO `th_discussion` VALUES (35, 7, 'stu023', '31232', '<p>312321321</p>\n', 2, 0, '2024-09-21 18:53:59');
INSERT INTO `th_discussion` VALUES (36, 7, 'stu023', '1323213', '<p>23213123213</p>\n', 2, 1, '2024-12-27 10:40:54');
INSERT INTO `th_discussion` VALUES (39, 3, 'XJC666', '1121', '<p>1331</p>\n', 1, 0, '2025-07-10 12:10:56');
INSERT INTO `th_discussion` VALUES (40, 3, 'yh123', 'TEST', '<p>AD A DAD ADA DA DAD AA</p>\n', 0, 0, '2025-07-10 12:20:08');
INSERT INTO `th_discussion` VALUES (41, 7, 'XJC666', '浙师大', '<p>阿斯顿撒旦</p>\n', 1, 0, '2025-07-25 03:23:38');

-- ----------------------------
-- Table structure for th_discussion_like_records
-- ----------------------------
DROP TABLE IF EXISTS `th_discussion_like_records`;
CREATE TABLE `th_discussion_like_records`  (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `discussion_id` int NULL DEFAULT NULL,
  `user_id` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `discussion_id`(`discussion_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `th_discussion_like_records_ibfk_1` FOREIGN KEY (`discussion_id`) REFERENCES `th_discussion` (`discussion_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `th_discussion_like_records_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `th_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_discussion_like_records
-- ----------------------------
INSERT INTO `th_discussion_like_records` VALUES (28, 22, 'stu013');
INSERT INTO `th_discussion_like_records` VALUES (30, 19, 'root');
INSERT INTO `th_discussion_like_records` VALUES (31, 25, 'root');
INSERT INTO `th_discussion_like_records` VALUES (32, 22, 'root');
INSERT INTO `th_discussion_like_records` VALUES (33, 29, 'user2');
INSERT INTO `th_discussion_like_records` VALUES (34, 22, 'stu003');
INSERT INTO `th_discussion_like_records` VALUES (35, 30, 'stu003');
INSERT INTO `th_discussion_like_records` VALUES (36, 26, 'sdu345');
INSERT INTO `th_discussion_like_records` VALUES (37, 22, 'sdu345');
INSERT INTO `th_discussion_like_records` VALUES (38, 22, 'sdu346');
INSERT INTO `th_discussion_like_records` VALUES (39, 32, 'sdu788');
INSERT INTO `th_discussion_like_records` VALUES (40, 22, 'sdu143');
INSERT INTO `th_discussion_like_records` VALUES (41, 22, 'sdu122');
INSERT INTO `th_discussion_like_records` VALUES (42, 32, 'stu101');
INSERT INTO `th_discussion_like_records` VALUES (43, 36, 'stu101');
INSERT INTO `th_discussion_like_records` VALUES (44, 21, 'li908');
INSERT INTO `th_discussion_like_records` VALUES (45, 22, 'yy234');

-- ----------------------------
-- Table structure for th_exam
-- ----------------------------
DROP TABLE IF EXISTS `th_exam`;
CREATE TABLE `th_exam`  (
  `exam_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NULL DEFAULT NULL COMMENT '所属课程',
  `author_id` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者-管理/老师',
  `type` int NULL DEFAULT NULL COMMENT '1-小测 2-作业 3-考试',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `detail` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '说明',
  `not_order` int NULL DEFAULT NULL COMMENT '打乱题序',
  `begin_date` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_date` datetime NULL DEFAULT NULL COMMENT '截止时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`exam_id`) USING BTREE,
  INDEX `course_id`(`course_id` ASC) USING BTREE,
  INDEX `author_id`(`author_id` ASC) USING BTREE,
  CONSTRAINT `th_exam_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `th_course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_exam
-- ----------------------------
INSERT INTO `th_exam` VALUES (1, 7, '1807004023', 3, '第一周测试', '<p>测试内容：进制转换和数据类型</p>\n', 1, '2025-02-08 04:19:04', '2025-02-09 16:00:00', '2023-12-27 08:46:06');
INSERT INTO `th_exam` VALUES (2, 7, '1807004023', 3, '第二周测试', '<p>测试内容：循环结构和判断结构</p>\n', 1, '2024-09-12 04:19:04', '2024-09-15 16:00:00', '2023-12-27 08:46:06');
INSERT INTO `th_exam` VALUES (20, 7, 'stu023', 3, '考试功能测试', '<p>测试人：Jczone</p>\n\n<p>测试时间：20230713</p>\n\n<p>测试结果：Success！</p>\n', 0, '2024-09-12 04:19:04', '2024-09-15 16:00:00', '2023-12-29 21:31:10');
INSERT INTO `th_exam` VALUES (21, 7, 'stu023', 3, '期末考试', '<p>111111111111</p>\n', 0, '2024-09-12 04:19:04', '2024-09-15 16:00:00', '2023-12-29 21:30:39');
INSERT INTO `th_exam` VALUES (22, 7, 'stu023', 3, '444', '<p>44444444</p>\n', 0, '2024-09-12 04:19:04', '2024-09-15 16:00:00', '2023-12-29 21:33:03');
INSERT INTO `th_exam` VALUES (23, 7, 'stu023', 3, '期末模拟', '<p>1</p>\n', 1, '2024-09-12 04:19:04', '2024-09-15 16:00:00', '2023-12-29 22:38:15');
INSERT INTO `th_exam` VALUES (24, 7, 'stu023', 3, '87878', '<p>7878787</p>\n', 1, '2024-09-12 04:19:04', '2024-09-15 16:00:00', '2023-12-29 22:50:07');
INSERT INTO `th_exam` VALUES (25, 7, 'stu023', 3, '期末2', '<p>1</p>\n', 1, '2024-09-12 04:19:04', '2024-09-15 16:00:00', '2024-02-01 09:14:32');
INSERT INTO `th_exam` VALUES (26, 59, 'stu023', 3, '期末考试', '<p>1</p>\n', 1, '2024-09-12 04:19:04', '2024-09-15 16:00:00', '2024-02-01 09:31:32');
INSERT INTO `th_exam` VALUES (27, 7, 'stu023', 3, '开学测试', '<p>11111111111</p>\n', 1, '2024-09-12 04:19:04', '2024-09-15 16:00:00', '2024-02-25 17:16:00');
INSERT INTO `th_exam` VALUES (28, 8, 'stu023', 3, '数据结构考试', '', 1, '2024-09-12 04:19:04', '2024-09-15 16:00:00', '2024-03-25 18:37:21');
INSERT INTO `th_exam` VALUES (29, 7, 'stu023', 3, '期中检测', '<p>1</p>\n', 1, '2024-09-12 04:19:04', '2024-09-15 16:00:00', '2024-03-25 19:10:02');
INSERT INTO `th_exam` VALUES (31, 7, 'stu023', 3, '测试结课考试', '<p>11111111111111</p>\n', 1, '2024-09-15 04:00:00', '2024-09-16 04:00:00', '2024-09-14 14:48:59');
INSERT INTO `th_exam` VALUES (32, 7, 'stu023', 3, '结课考试3', '<p>1111111</p>\n', 1, '2024-09-22 16:00:00', '2024-09-24 16:00:00', '2024-09-21 15:39:18');
INSERT INTO `th_exam` VALUES (33, 7, 'stu023', 3, '123', '<p>123</p>\n', 1, '2024-09-23 16:00:00', '2024-09-25 16:00:00', '2024-09-21 18:54:53');
INSERT INTO `th_exam` VALUES (34, 7, 'stu023', 3, '结课考试了', '<p>3213213123</p>\n', 1, '2024-12-27 16:00:00', '2024-12-30 16:00:00', '2024-12-27 10:42:14');
INSERT INTO `th_exam` VALUES (35, 7, 'stu023', 3, '测验', '<p>11111111</p>\n', 1, '2025-02-12 16:00:00', '2025-02-14 16:00:00', '2025-02-12 12:42:36');
INSERT INTO `th_exam` VALUES (36, 7, 'li908', 3, 'QWEQWEQ2E', '', 1, '2025-07-10 16:00:00', '2025-08-20 16:00:00', '2025-07-11 12:41:30');
INSERT INTO `th_exam` VALUES (37, 7, 'li908', 3, 'DASDASD', '<p>DSADASDASDASDSA</p>\n', 1, '2025-07-09 16:00:00', '2025-07-10 16:00:00', '2025-07-11 12:45:15');
INSERT INTO `th_exam` VALUES (38, 7, 'stu023', 3, 'WQE ', '', 0, '2025-07-14 16:00:00', '2025-08-11 16:00:00', '2025-07-21 07:38:43');
INSERT INTO `th_exam` VALUES (39, 7, 'stu023', 3, 'SDADA', '', 0, '2025-07-20 16:00:00', '2025-08-06 16:00:00', '2025-07-21 11:25:45');
INSERT INTO `th_exam` VALUES (40, 8, 'stu023', 3, 'test', '', 0, '2025-07-21 16:00:00', '2025-07-31 16:00:00', '2025-07-21 10:49:50');
INSERT INTO `th_exam` VALUES (59, 7, 'stu023', 3, 'generated_quiz', '从TXT文件自动生成的考试', 1, '2025-07-24 07:39:16', '2025-07-31 07:39:16', '2025-07-24 07:39:16');
INSERT INTO `th_exam` VALUES (60, 7, 'stu023', 3, '123', '自动生成的考试', 1, '2025-07-24 13:05:36', '2025-07-31 13:05:36', '2025-07-24 13:05:36');
INSERT INTO `th_exam` VALUES (61, 7, 'stu023', 3, '123', '自动生成的考试', 1, '2025-07-24 13:08:34', '2025-07-31 13:08:34', '2025-07-24 13:08:34');
INSERT INTO `th_exam` VALUES (62, 7, 'stu023', 3, '123', '自动生成的考试', 1, '2025-07-24 13:20:49', '2025-07-31 13:20:49', '2025-07-24 13:20:49');
INSERT INTO `th_exam` VALUES (63, 7, 'stu023', 3, 'generated_quiz', '从TXT文件自动生成的考试', 1, '2025-07-25 03:10:59', '2025-08-01 03:10:59', '2025-07-25 03:10:59');
INSERT INTO `th_exam` VALUES (64, 7, 'stu023', 3, '小测', '从PDF文件自动生成的考试', 1, '2025-07-25 03:13:35', '2025-07-25 03:16:35', '2025-07-25 03:21:28');

-- ----------------------------
-- Table structure for th_experiment
-- ----------------------------
DROP TABLE IF EXISTS `th_experiment`;
CREATE TABLE `th_experiment`  (
  `experiment_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`experiment_id`) USING BTREE,
  INDEX `course_id`(`course_id` ASC) USING BTREE,
  CONSTRAINT `th_experiment_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `th_course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_experiment
-- ----------------------------
INSERT INTO `th_experiment` VALUES (27, 7, '实验一 最大子序列交替和', '23417_任务书.docx', '2023-12-28 08:46:20');
INSERT INTO `th_experiment` VALUES (28, 7, '实验二 最长回文子串', '69435_任务书.docx', '2023-12-28 08:46:20');
INSERT INTO `th_experiment` VALUES (29, 7, '5674745', '49361_4154ca73-a703-4063-8664-cda1ff273d3e.jpg', '2023-12-29 22:49:11');
INSERT INTO `th_experiment` VALUES (30, 7, '两数之和', '50870_2.xlsx', '2024-02-01 09:14:12');
INSERT INTO `th_experiment` VALUES (31, 59, '反转链表', '43891_2.xlsx', '2024-02-01 09:30:56');
INSERT INTO `th_experiment` VALUES (32, 7, '反转链表', '11679_2.xlsx', '2024-02-25 17:15:13');
INSERT INTO `th_experiment` VALUES (33, 7, '111', '02742_微信图片_20240805034949.png', '2024-08-04 20:31:44');
INSERT INTO `th_experiment` VALUES (34, 7, '三叔之和', '33496_微信图片_20240805035013.png', '2024-09-14 14:47:31');
INSERT INTO `th_experiment` VALUES (35, 7, '贪吃蛇，2.16前完成', '00606_环境.docx', '2025-02-12 12:41:45');
INSERT INTO `th_experiment` VALUES (36, 7, '123213', '76313_计算机网络.pdf', '2025-07-25 03:26:18');

-- ----------------------------
-- Table structure for th_filling
-- ----------------------------
DROP TABLE IF EXISTS `th_filling`;
CREATE TABLE `th_filling`  (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '题目',
  `answer_num` int NULL DEFAULT NULL COMMENT '答案数/填空数',
  `analysis` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '解析',
  `score` int NULL DEFAULT NULL COMMENT '分值',
  `is_order` bit(1) NULL DEFAULT NULL COMMENT '是否有序1',
  `is_capital` bit(1) NULL DEFAULT NULL COMMENT '是否大写1',
  PRIMARY KEY (`subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_filling
-- ----------------------------
INSERT INTO `th_filling` VALUES (1, '<p>道可道，非常道，______，非常名。______，________。</p>\n', 3, '无解析', 15, b'1', b'0');
INSERT INTO `th_filling` VALUES (2, '春风送暖入屠苏，_______。', 1, '无解析', 5, b'0', b'0');
INSERT INTO `th_filling` VALUES (3, '_____,______,______', 3, '无解析', 6, b'1', b'1');
INSERT INTO `th_filling` VALUES (5, '<p>影响流水线性能的因素主要有哪几种？请简要加以说明</p>\n', 3, '<p>无解析</p>\n', 6, b'1', b'1');
INSERT INTO `th_filling` VALUES (6, '<p>输入输出设备数据传送控制方式有五种，比如程序查询方式、_____、_____、_____、_____、</p>\n', 4, '<p>加油</p>\n', 4, b'0', b'0');
INSERT INTO `th_filling` VALUES (7, '<p>1-1</p>\n', 1, '', 5, b'0', b'0');

-- ----------------------------
-- Table structure for th_filling_blank
-- ----------------------------
DROP TABLE IF EXISTS `th_filling_blank`;
CREATE TABLE `th_filling_blank`  (
  `blank_id` int NOT NULL AUTO_INCREMENT COMMENT '空数id',
  `subject_id` int NULL DEFAULT NULL COMMENT '填空题id',
  `num` int NULL DEFAULT NULL COMMENT '序号',
  `content` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`blank_id`) USING BTREE,
  INDEX `subject_id`(`subject_id` ASC) USING BTREE,
  CONSTRAINT `th_filling_blank_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `th_filling` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_filling_blank
-- ----------------------------
INSERT INTO `th_filling_blank` VALUES (7, 5, 1, '结构相关：是当多条指令进入流水线后，硬件资源满足不了指令重叠执行的要求时产生的。不同指令争用同一功能部件产生资源冲突');
INSERT INTO `th_filling_blank` VALUES (8, 5, 2, '数据相关：是指令在流水线中重叠执行时，当后继指令需要用到前面指令的执行结果时发生的。可能改变对操作数的读写访问顺序');
INSERT INTO `th_filling_blank` VALUES (9, 5, 3, '控制相关：是当流水线遇到分支指令和其它改变PC值的指令时引起的。');
INSERT INTO `th_filling_blank` VALUES (23, 2, 1, '千门万户曈曈日');
INSERT INTO `th_filling_blank` VALUES (24, 3, 1, 'exam');
INSERT INTO `th_filling_blank` VALUES (25, 3, 2, 'Test');
INSERT INTO `th_filling_blank` VALUES (26, 3, 3, '实验');
INSERT INTO `th_filling_blank` VALUES (27, 1, 1, '名可名');
INSERT INTO `th_filling_blank` VALUES (28, 1, 2, '无名天地之始');
INSERT INTO `th_filling_blank` VALUES (29, 1, 3, '有名万物之母');
INSERT INTO `th_filling_blank` VALUES (30, 6, 2, '程序中断方式');
INSERT INTO `th_filling_blank` VALUES (31, 6, 3, '直接存储器存取方式');
INSERT INTO `th_filling_blank` VALUES (32, 6, 4, '通道控制方式');
INSERT INTO `th_filling_blank` VALUES (33, 6, 5, '外围机处理方式');
INSERT INTO `th_filling_blank` VALUES (34, 7, 1, '1');

-- ----------------------------
-- Table structure for th_notice
-- ----------------------------
DROP TABLE IF EXISTS `th_notice`;
CREATE TABLE `th_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '通知序号',
  `course_id` int NOT NULL COMMENT '课程号',
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `hits` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`notice_id`) USING BTREE,
  INDEX `noticeforcourse`(`course_id` ASC) USING BTREE,
  CONSTRAINT `noticeforcourse` FOREIGN KEY (`course_id`) REFERENCES `th_course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_notice
-- ----------------------------
INSERT INTO `th_notice` VALUES (2, 2, '第一周作业 总线', '<p style=\"margin-left:40px\"><span style=\"font-size:20px\">请大家把今天学习的总线知识好好整理，做好笔记，及时复习，加油！</span></p>\n', 42, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (3, 3, '微机原理与汇编作业发布', '<p>第三章的实验作业已上传课堂</p>\n', 12, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (4, 4, '课程设计', '<p>请大家结合本学期学习的课程，利用单片机的相关知识，设计一个小型定时器，要求：</p>\n\n<ul>\n	<li>能够显示时间和日期</li>\n	<li>能够设置闹钟</li>\n	<li>秒表功能</li>\n	<li>计时器功能</li>\n</ul>\n', 52, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (5, 5, '计算体系课堂小结', '本次课堂我们学习了计算体系的相关知识，请大家务必要在课下多多练习，及时复习，加油！', 23, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (6, 9, '大学物理实验通知', '大学物理：本周的实验报告没有交的同学抓紧时间了', 28, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (8, 8, '数据结构实验通知', '数据结构：本周的实验报告没有交的同学抓紧时间了', 55, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (43, 1, '萌新指南', '<h1 style=\"text-align:center\"><span style=\"font-size:26px\">首次登录请先完善您的个人信息&nbsp; *n_n*</span></h1>\n\n<p><span style=\"font-size:20px\">欢迎来到用户主页，在这里您可以：</span></p>\n\n<p><strong><span style=\"font-size:20px\">一、添加喜欢的课程</span></strong></p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:20px\">点击&ldquo;添加课程&rdquo;选择想加入的课程，只能加入公开和开放的课程哦。</span></p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:20px\">什么是公开和开放呢：</span></p>\n\n<ul>\n	<li><span style=\"font-size:20px\">公开的课程大家可以直接加入学习，使用课程中全部的资料和数据。</span></li>\n	<li><span style=\"font-size:20px\">开放是指课程刚被创建，审核通过且内容合格的课程。</span></li>\n	<li><span style=\"font-size:20px\">所以私有和关闭的课程是无法正常加入的哦。</span></li>\n</ul>\n\n<p><strong><span style=\"font-size:20px\">二、创建自己的课程</span></strong></p>\n\n<p><span style=\"font-size:20px\">&nbsp; &nbsp; &nbsp; &nbsp;在&ldquo;我的课程&rdquo;选项卡中点击创建课程，我们给您的课程提供了默认封面，您也可以选择自己上传，推荐上传体积小于1M、尺寸比例1:1.8左右的封面哦。</span></p>\n\n<p><strong><span style=\"font-size:20px\">三、查看课程通知</span></strong></p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:20px\">顶部轮播图区域会默认展示您所加入课程的最新通知，至多展示8条，更多通知请点击顶部消息中心查看。</span></p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:20px\">点击轮播图，可以查看通知详情，或者在轮播图区域滚动，也可以直接查看通知。</span></p>\n\n<p><span style=\"font-size:20px\"><strong>四、修改个人信息</strong></span></p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:20px\">点击顶部头像，可以在修改个人信息窗口中编辑您的姓名，联系方式，密保等内容，或者更换您的头像。</span></p>\n', 547, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (47, 1, '学生指南', '<p><span style=\"font-size:20px\">作为学生，您可以：</span></p>\n\n<p><strong><span style=\"font-size:20px\">一、加入课程学习</span></strong></p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:20px\">点击添加课程，查找想要学习的课程，加入后即可开始学习。</span></p>\n\n<p><span style=\"font-size:20px\">&nbsp;<strong>二、在课程中您可以</strong></span></p>\n\n<ul>\n	<li><span style=\"font-size:20px\">查看课程视频，给视频点赞、评论</span></li>\n	<li><span style=\"font-size:20px\">查看课程通知</span></li>\n	<li><span style=\"font-size:20px\">下载老师上传的资料</span></li>\n	<li><span style=\"font-size:20px\">参与课程讨论，自己发布讨论</span></li>\n	<li><span style=\"font-size:20px\">查看实验并上传报告</span></li>\n	<li><span style=\"font-size:20px\">参与考试，答题并查看成绩</span></li>\n</ul>\n\n<p><strong><span style=\"font-size:20px\">三、退出课程</span></strong></p>\n\n<p><span style=\"font-size:20px\">&nbsp; &nbsp; &nbsp; &nbsp;点击课程选项卡的右下角的退出课程，来离开课程。</span></p>\n', 8, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (48, 2, '第一周测试 计算机系统', '<p style=\"margin-left:40px\"><span style=\"font-size:20px\">本周的组成原理测试已经发布，请大家及时查看！</span></p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:20px\">本次测试内容包括：</span></p>\n\n<ul>\n	<li style=\"margin-left: 80px;\"><span style=\"font-size:20px\">​​一、计算机系统概述​​</span></li>\n	<li style=\"margin-left: 80px;\"><span style=\"font-size:20px\">​​二、计算机系统的组成​​</span></li>\n	<li style=\"margin-left: 80px;\"><span style=\"font-size:20px\">​​三、计算机硬件的性能指标​​</span></li>\n	<li style=\"margin-left: 80px;\"><span style=\"font-size:20px\">​​四、计算机的发展​​</span></li>\n</ul>\n', 3, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (53, 1, '教师指南', '<p><span style=\"font-size:20px\">作为教师，您可以：</span></p>\n\n<p><strong><span style=\"font-size:20px\">一、发布课程</span></strong></p>\n\n<div><span style=\"font-size:20px\">在我的课程选项卡中，点击创建课程，为课程设置封面和简介后，就可以创建课程啦。</span></div>\n\n<div><span style=\"font-size:20px\">新课程创建后，默认为公开权限，即所有用户都可加入。您可以点击课程封面进入后台，在侧边栏中点击课程封面，进入课程简介和封面修改页面，点击滑块来变更权限。注意，新创建的课程需等待管理员审核，故课程会显示关闭标签。待审核通过后，该课程就会被展示在系统首页啦！</span></div>\n\n<p><span style=\"font-size:20px\">&nbsp;<strong>二、在课程中，您可以</strong></span></p>\n\n<ul>\n	<li><span style=\"font-size:20px\">上传章节视频，编辑，删除视频，参加视频下的评论，删除不恰当的评论</span></li>\n	<li><span style=\"font-size:20px\">发布，编辑，删除课程内的通知</span></li>\n	<li><span style=\"font-size:20px\">上传，下载，批量管理课程内的课件</span></li>\n	<li><span style=\"font-size:20px\">发布课程讨论，参与讨论并能删除不恰当的回复</span></li>\n	<li><span style=\"font-size:20px\">发布实验并上传任务书，下载学生提交的实验报告</span></li>\n	<li><span style=\"font-size:20px\">发布考试并编辑题目，修改考试时间，阅卷并查看学生成绩</span></li>\n</ul>\n\n<p><strong><span style=\"font-size:20px\">三、管理课程人员</span></strong></p>\n\n<p><span style=\"font-size:20px\">&nbsp; &nbsp; &nbsp; &nbsp;在课程管理中，您可以查看所有课程内学生的学习记录，并能够下载记录到本地，同时也可以删除违反规定的用户。</span></p>\n\n<p>&nbsp;</p>\n', 4, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (54, 7, '短文本测试', '<p>这里是测试文本</p>\n\n<p>测试员：梁教授</p>\n\n<p>测试结果：success</p>\n\n<p>测试时间：20240711</p>\n', 3, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (55, 7, '长文本测试', '<p>朋友你好，由于项目开发时间较早，受当时开发者能力的限制（菜），里面存在一些bug和可优化部分没有处理（会处理的，最近在找工作..），以下是测试中发现的一些问题，提供给你参考：</p>\n\n<h3>1. 用户主页（UserMainPage）</h3>\n\n<ul>\n	<li>\n	<p><strong>缺少分页</strong>：加入课程以及课程卡片展示区域，都没有做分页查询，如果系统中课程数量很多，</p>\n	</li>\n</ul>\n\n<h3>1. 章节页面（ChapterTab/StuChapterTab）</h3>\n\n<ul>\n	<li>\n	<p><strong>数字遮挡</strong>：小卡片上浏览量和播放量没有做分级，采用固定布局时，数字太长会被图标遮挡；</p>\n	</li>\n	<li>\n	<p><strong>章节删除失败</strong>：章节封面使用video组件展示，虽然禁用了播放等操作，但只要位于该页面，服务器文件将一直处于open状态，导致用户删除视频时，文件删除操作失败（数据库可以成功删除），形成无法索引到的&ldquo;死数据&rdquo;；</p>\n	</li>\n</ul>\n\n<h3>2. 视频播放页面（ChapterView/StuChapterView）</h3>\n\n<ul>\n	<li>\n	<p><strong>刷播放量</strong>：当前策略为用户进入播放页面5秒后，该视频增加1点播放量。实际上这个时间太短，采用百分比时长更合适，但这需要读取到视频时长；</p>\n	</li>\n</ul>\n\n<h3>3. 关于代码</h3>\n\n<p>项目中有些代码，书写不一定规范，甚至有些看起来很蠢，已知的一些问题如下，恳请包容~</p>\n\n<ul>\n	<li>\n	<p><strong>数据泄露</strong>：数据传递时没有封装专门的DTO，而是直接使用POJO，导致关键信息被泄露；</p>\n	</li>\n	<li>\n	<p><strong>冗余查询</strong>：数据存入数据库后，没有直接用返回的ID，而是通过数据内容查询新插入的记录，从而获取ID，这在考试部分较为常见；</p>\n	</li>\n	<li>\n	<p><strong>冗余条件</strong>：部分数据更新没有采用UpdateWrapper，而是使用了service.update(pojo,queryWrapper)方法完成，不够简洁。实际上可以采用updateById或者UpdateWrapper来封装更新条件。</p>\n	</li>\n</ul>\n\n<h3>4. 关于时间</h3>\n\n<ul>\n	<li>\n	<p><strong>过度显示</strong>：系统中的时间有些地方是全显示，即具体到时分秒，有些地方则只显示到日期，这在某些地方可能并不合理，比如评论区中的评论，没有必要展示到秒等等；</p>\n	</li>\n	<li>\n	<p><strong>时区错误</strong>：另一个关于时间的问题，是数据库中的时区和前端显示的时区不匹配，这不影响前端，但在数据库中查看数据，会发现时间比真实时间少8个小时；</p>\n	</li>\n</ul>\n', 6, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (56, 7, '图片通知测试', '<p><img alt=\"\" height=\"360\" src=\"/files/user/stu023/ckeditor/ckeditor_2023_07_11213720647.jpg\" width=\"644\" /></p>\n', 3, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (57, 7, '表格和格式测试', '<h3>Dos命令</h3>\n\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:500px\">\n	<tbody>\n		<tr>\n			<th>功能</th>\n			<th>指令</th>\n			<th>示例</th>\n		</tr>\n		<tr>\n			<td style=\"text-align:center\">查看当前目录</td>\n			<td style=\"text-align:center\">dir</td>\n			<td style=\"text-align:center\">dir d:\\com\\main</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:center\">切换到其他盘</td>\n			<td style=\"text-align:center\">cd /D</td>\n			<td style=\"text-align:center\">cd /D c:</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:center\">切换到当前盘其他目录</td>\n			<td style=\"text-align:center\">cd</td>\n			<td style=\"text-align:center\">（绝对路径）cd d:\\com\\main</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:center\">切换到当前盘其他目录</td>\n			<td style=\"text-align:center\">cd</td>\n			<td style=\"text-align:center\">（相对路径）cd ..\\com\\main</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:center\">切换到上一级</td>\n			<td style=\"text-align:center\">cd ..</td>\n			<td style=\"text-align:center\">&nbsp;</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:center\">切换到根目录</td>\n			<td style=\"text-align:center\">cd \\</td>\n			<td style=\"text-align:center\">&nbsp;</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:center\">查看指定目录下子级目录（树）</td>\n			<td style=\"text-align:center\">tree</td>\n			<td style=\"text-align:center\">tree d:\\com\\main</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:center\">清屏</td>\n			<td style=\"text-align:center\">cls</td>\n			<td style=\"text-align:center\">cls</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:center\">退出</td>\n			<td style=\"text-align:center\">exit</td>\n			<td style=\"text-align:center\">exit</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:center\">创建目录</td>\n			<td style=\"text-align:center\">md</td>\n			<td style=\"text-align:center\">md 目录名</td>\n		</tr>\n		<tr>\n			<td style=\"text-align:center\">删除目录（目录必须为空）</td>\n			<td style=\"text-align:center\">rd</td>\n			<td style=\"text-align:center\">rd 目录名</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>相对路径：从当前目录开始定位形成的路径</p>\n\n<p>绝对路径：从顶级目录开始定位形成的路径</p>\n\n<p>help：查看当前指令的帮助信息（如：help cd）</p>\n', 4, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (58, 2, '第二周测试内容 主存储器', '<h5>存储器</h5>\n\n<ul>\n	<li>功能：存储数据和数字化后的程序，以二进制代码来表示。</li>\n	<li>存储单元：在存储器中保存一个n位二进制数的n个存储电路，组成一个存储单元。</li>\n	<li>地址：存储器由许多存储单元组成，每个存储单元的编号，成为地址。</li>\n	<li>存储容量：存储器所有存储单元的总数。</li>\n	<li>内存储器：即主存，一种用来存放<strong>直接</strong>为CPU提供服务的程序和数据存储器。（U盘）</li>\n	<li>外存储器：即辅存，为计算机配备的存储容量很大的辅助存储器。（磁盘存储器、光盘存储器）</li>\n</ul>\n', 0, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (59, 2, '第三周测试内容 输入输出设备', '<h5>输入/输出设备&nbsp;</h5>\n\n<ul>\n	<li><strong>功能</strong>：执行输入/输出信息的转换.</li>\n	<li><strong>输入时</strong>：原始信息----&gt;二进制代码，送入主机。</li>\n	<li><strong>输出时</strong>：处理结果（二进制代码）----&gt;用户能够直接感知的形式（字符、图像、声音），并输出给用户</li>\n</ul>\n', 0, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (63, 3, '课程目标', '<p>本课程需要大家掌握：</p>\n\n<ul>\n	<li>微型计算机的基本工作原理</li>\n	<li>汇编语言程序设计方法</li>\n	<li>微型计算机接口技术</li>\n</ul>\n\n<div>建立微型计算机系统的整体概念，形成微机系统软硬件开发的初步能力</div>\n', 0, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (64, 3, '课程主要内容', '<ol>\n	<li>微机系统的组成</li>\n	<li>计算机中的编码、数制及其转换</li>\n	<li>无符号二进制数的运算</li>\n	<li>算术运算和逻辑运算</li>\n	<li>运算中的溢出</li>\n	<li>机器数的表示及运算</li>\n	<li>基本逻辑门及译码器</li>\n</ol>\n', 0, '2024-07-27 21:58:38');
INSERT INTO `th_notice` VALUES (65, 7, '111111111', '<p>111</p>\n', 0, '2023-12-29 22:48:23');
INSERT INTO `th_notice` VALUES (66, 7, '考试通知', '<p>111111111111111</p>\n', 0, '2024-02-01 03:21:13');
INSERT INTO `th_notice` VALUES (68, 59, '12121', '<p>4545</p>\n', 0, '2024-02-01 09:29:19');
INSERT INTO `th_notice` VALUES (71, 7, '11111113', '<p>huwewedwe</p>\n', 2, '2024-08-04 20:30:17');
INSERT INTO `th_notice` VALUES (72, 7, '停课通知', '<p>1</p>\n', 0, '2024-09-14 14:45:46');
INSERT INTO `th_notice` VALUES (73, 7, '1', '<p>1111111111111111</p>\n', 0, '2024-09-21 15:37:27');
INSERT INTO `th_notice` VALUES (74, 7, '12313123', '<p>312321</p>\n', 1, '2024-09-21 18:53:20');
INSERT INTO `th_notice` VALUES (75, 7, '考试通知', '<p>3213213</p>\n', 1, '2024-12-27 10:40:06');
INSERT INTO `th_notice` VALUES (76, 7, '开课通知', '<p>开课通知</p>\n', 1, '2025-02-12 12:39:54');
INSERT INTO `th_notice` VALUES (77, 7, '1111', '<p>&nbsp;111</p>\n', 0, '2025-07-25 03:25:49');

-- ----------------------------
-- Table structure for th_notice_adm
-- ----------------------------
DROP TABLE IF EXISTS `th_notice_adm`;
CREATE TABLE `th_notice_adm`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '通知序号',
  `admin_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '管理员账号',
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `hits` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`notice_id`) USING BTREE,
  INDEX `pcreator_id`(`admin_id` ASC) USING BTREE,
  CONSTRAINT `th_notice_adm_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `th_admin` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_notice_adm
-- ----------------------------
INSERT INTO `th_notice_adm` VALUES (1, 'root', '期末考试通知', '<ul style=\"margin-left:40px\">\n	<li><span style=\"font-size:20px\">课程名称：毛泽东思想和中国特色社会主义理论体系概论（2018年版） </span></li>\n	<li><span style=\"font-size:20px\">考试名称：2021-22学年（第二学期）期末考试 </span></li>\n	<li><span style=\"font-size:20px\">考试时间：06-21 08:33 至 06-21 11:05 </span></li>\n	<li><span style=\"font-size:20px\">考试时长：150分钟 考试形式：自主考试</span></li>\n</ul>\n', 198, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (2, 'root', '实践作业通知', '<p><span style=\"font-size:20px\">&nbsp; &nbsp; &nbsp; &nbsp;实践作业是期末成绩的一个重要组成部分，本学期实践作业已发布。自定题目写一篇关于抗疫的论文，如抗疫的经验和启示、从抗疫看中国制度优势、抗疫中的&ldquo;最美逆行者&rdquo;、抗疫体现中国精神等等。要求：手写在信纸或A4纸上，3000字，两周内完成，从学习通提交。（注意提交的截止时间6月20日晚上十一点）</span></p>\n', 57, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (3, 'root', '《离散数学》课程介绍', '<p>离散数学是计算机学科的经典核心基础课程。</p>\n\n<p>课程内容主要包括集合论，数理逻辑，关系理论，图论相关内容，为进一步学习计算机科学的基本理论和方法以及之后的专业课打下良好的基础。通过这门课程的学习，将会培养学生的抽象思维能力，逻辑推理能力，缜密概括能力以及分析和解决实际问题的能力。</p>\n\n<p>离散数学的学习，为其后续课程（如数据结构、操作系统、计算机网络、编译理论、数字逻辑理论、数据库系统、算法分析、系统结构、人工智能等）的学习打下坚实的理论基础。 这门课程的理论性较强，知识点比较多，但均&ldquo;有迹可循，有法可依&rdquo;，因而完成这门课程的学习并非很难。我们通过对课程内容的合理安排（&ldquo;营养均衡&rdquo;），每一讲的精心调配（&ldquo;正餐&rdquo;），课后习题的专业配套（&ldquo;甜点&rdquo;），为在线学习用户提供了学习离散数学课程的一种新形式。</p>\n', 34, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (5, 'root', '成绩单打印通知', '<ul>\n	<li><span style=\"font-family:SimSun\"><span style=\"font-size:20px\">各班长： 为满足疫情防控形势下的教学运行与管理需求，现面向学生开通&ldquo;学生成绩单&rdquo;打印功能。学生登录&ldquo;教学管理信息服务平台&rdquo;，点击&ldquo;信息查询-学生成绩总表打印&rdquo;即可查询或打印个人成绩单，成绩单制表人显示&ldquo;学生学号&rdquo;。 请周知！</span></span></li>\n	<li><span style=\"font-family:SimSun\"><span style=\"font-size:20px\">各班长： 为满足疫情防控形势下的教学运行与管理需求，现面向学生开通&ldquo;学生成绩单&rdquo;打印功能。学生登录&ldquo;教学管理信息服务平台&rdquo;，点击&ldquo;信息查询-学生成绩总表打印&rdquo;即可查询或打印个人成绩单，成绩单制表人显示&ldquo;学生学号&rdquo;。 请周知！ </span></span></li>\n	<li><span style=\"font-family:SimSun\"><span style=\"font-size:20px\">各班长： 为满足疫情防控形势下的教学运行与管理需求，现面向学生开通&ldquo;学生成绩单&rdquo;打印功能。学生登录&ldquo;教学管理信息服务平台&rdquo;，点击&ldquo;信息查询-学生成绩总表打印&rdquo;即可查询或打印个人成绩单，成绩单制表人显示&ldquo;学生学号&rdquo;。 请周知！</span></span></li>\n	<li><span style=\"font-family:SimSun\"><span style=\"font-size:20px\">各班长： 为满足疫情防控形势下的教学运行与管理需求，现面向学生开通&ldquo;学生成绩单&rdquo;打印功能。学生登录&ldquo;教学管理信息服务平台&rdquo;，点击&ldquo;信息查询-学生成绩总表打印&rdquo;即可查询或打印个人成绩单，成绩单制表人显示&ldquo;学生学号&rdquo;。 请周知！</span></span></li>\n	<li><span style=\"font-family:SimSun\"><span style=\"font-size:20px\">各班长： 为满足疫情防控形势下的教学运行与管理需求，现面向学生开通&ldquo;学生成绩单&rdquo;打印功能。学生登录&ldquo;教学管理信息服务平台&rdquo;，点击&ldquo;信息查询-学生成绩总表打印&rdquo;即可查询或打印个人成绩单，成绩单制表人显示&ldquo;学生学号&rdquo;。 请周知！</span></span></li>\n	<li><span style=\"font-family:SimSun\"><span style=\"font-size:20px\">各班长： 为满足疫情防控形势下的教学运行与管理需求，现面向学生开通&ldquo;学生成绩单&rdquo;打印功能。学生登录&ldquo;教学管理信息服务平台&rdquo;，点击&ldquo;信息查询-学生成绩总表打印&rdquo;即可查询或打印个人成绩单，成绩单制表人显示&ldquo;学生学号&rdquo;。 请周知！</span></span></li>\n	<li><span style=\"font-family:SimSun\"><span style=\"font-size:20px\">各班长： 为满足疫情防控形势下的教学运行与管理需求，现面向学生开通&ldquo;学生成绩单&rdquo;打印功能。学生登录&ldquo;教学管理信息服务平台&rdquo;，点击&ldquo;信息查询-学生成绩总表打印&rdquo;即可查询或打印个人成绩单，成绩单制表人显示&ldquo;学生学号&rdquo;。 请周知！</span></span></li>\n	<li><span style=\"font-family:SimSun\"><span style=\"font-size:20px\">各班长： 为满足疫情防控形势下的教学运行与管理需求，现面向学生开通&ldquo;学生成绩单&rdquo;打印功能。学生登录&ldquo;教学管理信息服务平台&rdquo;，点击&ldquo;信息查询-学生成绩总表打印&rdquo;即可查询或打印个人成绩单，成绩单制表人显示&ldquo;学生学号&rdquo;。 请周知！</span></span></li>\n</ul>\n', 12, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (6, 'root', '人才构成通知', '<p style=\"margin-left:40px\">学院聚焦落实&ldquo;人才优先&rdquo;发展方针，统筹&ldquo;三支人才队伍&rdquo;建设，不断深化人才体制机制改革创新，全面激发人才活力和创造力。在不断地改革创新中，坚持服务战略、统筹兼顾，多措并举，全面培养和加快人才梯队建设，加大人才引进，以实现人才优化配置，培养造就了一支具有国际水平的专业人才队伍。 　　</p>\n\n<p style=\"margin-left:40px\">截至2022年，学院教职工总数近1000人，平均年龄36.5岁，硕士及以上学历人员接近总数的三分之二，专业技术人员超过职工总数的一半。拥有多名研究生导师、中核集团青年人才、中国同辐技术带头人及培养对象。</p>\n', 5, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (7, 'root', '《数据结构与算法》', '<p>教学目标（需明确各教学环节对人才培养目标的贡献）</p>\n\n<p>知识贡献：</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;掌握线性表、栈、队列、二叉树、树、图等基本数据结构的概念；掌握各类数据结构中元素的增加、修改、删除、查找等基本操作的算法流程；掌握二叉树、二叉检索树、高度平衡二叉树、堆、树等非线性数据结构的基本性质；掌握顺序查找、二分查找两种常见的线性表检索方法；掌握插入排序、选择排序、冒泡排序、快速排序、归并排序、堆排序等常见的排序方法；理解文件管理的概念，掌握常见的外排序算法；掌握图的基本概念、图的存储方法和实现方法，理解图的遍历、最短路径、最小生成树等方面的常用算法。 能力贡献：通过学习数据结构与算法的基本概念和基本原理，增强学生对抽象数据类型的理解能力；通过用C++编程语言实现数据结构和算法，增强学生的程序设计能力；掌握基本的算法分析技术，增强对算法流程和程序实现的分析能力；通过分析数据结构与算法的应用案例、上机练习以及数据结构与算法应用设计，培养学生利用所学知识解决具体问题的能力和创新能力。 素质贡献：在理论学习、编程实现、算法应用等各个环节中，养成认真、踏实、细心的良好习惯，提升专业素养。</p>\n', 7, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (8, 'root', '人员构成通知', '<p style=\"text-align:center\"><span style=\"color:#000000\"><span style=\"font-size:24px\"><span style=\"background-color:#ecf0f1\">首次登录请先完善您的个人信息&nbsp; *n_n*</span></span></span></p>\n\n<p><span style=\"font-size:20px\">您可以：</span></p>\n\n<p><span style=\"font-size:20px\">一、添加喜欢的课程</span></p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:20px\">点击&ldquo;添加课程&rdquo;选择想加入的课程，只能加入公开和开放的课程哦。</span></p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:20px\">什么是公开和开放呢：</span></p>\n\n<ul>\n	<li><span style=\"font-size:20px\">公开的课程大家可以直接加入学习，使用课程中全部的资料和数据。</span></li>\n	<li><span style=\"font-size:20px\">开放是指课程刚被创建，审核通过且内容合格的课程。</span></li>\n	<li><span style=\"font-size:20px\">所以私有和关闭的课程是无法正常加入的哦。</span></li>\n</ul>\n\n<p><span style=\"font-size:20px\">二、创建自己的课程</span></p>\n\n<p><span style=\"font-size:20px\">&nbsp; &nbsp; &nbsp; &nbsp;在&ldquo;我的课程&rdquo;选项卡中点击创建课程，我们给您的课程提供了默认封面，您也可以选择自己上传，推荐上传体积小于1M、尺寸比例1:1.8左右的封面哦。</span></p>\n<p style=\"text-align:center\"><span style=\"color:#000000\"><span style=\"font-size:24px\"><span style=\"background-color:#ecf0f1\">首次登录请先完善您的个人信息&nbsp; *n_n*</span></span></span></p>\n\n<p><span style=\"font-size:20px\">您可以：</span></p>\n\n<p><span style=\"font-size:20px\">一、添加喜欢的课程</span></p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:20px\">点击&ldquo;添加课程&rdquo;选择想加入的课程，只能加入公开和开放的课程哦。</span></p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:20px\">什么是公开和开放呢：</span></p>\n\n<ul>\n	<li><span style=\"font-size:20px\">公开的课程大家可以直接加入学习，使用课程中全部的资料和数据。</span></li>\n	<li><span style=\"font-size:20px\">开放是指课程刚被创建，审核通过且内容合格的课程。</span></li>\n	<li><span style=\"font-size:20px\">所以私有和关闭的课程是无法正常加入的哦。</span></li>\n</ul>\n\n<p><span style=\"font-size:20px\">二、创建自己的课程</span></p>\n\n<p><span style=\"font-size:20px\">&nbsp; &nbsp; &nbsp; &nbsp;在&ldquo;我的课程&rdquo;选项卡中点击创建课程，我们给您的课程提供了默认封面，您也可以选择自己上传，推荐上传体积小于1M、尺寸比例1:1.8左右的封面哦。</span></p>\n<p style=\"text-align:center\"><span style=\"color:#000000\"><span style=\"font-size:24px\"><span style=\"background-color:#ecf0f1\">首次登录请先完善您的个人信息&nbsp; *n_n*</span></span></span></p>\n\n<p><span style=\"font-size:20px\">您可以：</span></p>\n\n<p><span style=\"font-size:20px\">一、添加喜欢的课程</span></p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:20px\">点击&ldquo;添加课程&rdquo;选择想加入的课程，只能加入公开和开放的课程哦。</span></p>\n\n<p style=\"margin-left:40px\"><span style=\"font-size:20px\">什么是公开和开放呢：</span></p>\n\n<ul>\n	<li><span style=\"font-size:20px\">公开的课程大家可以直接加入学习，使用课程中全部的资料和数据。</span></li>\n	<li><span style=\"font-size:20px\">开放是指课程刚被创建，审核通过且内容合格的课程。</span></li>\n	<li><span style=\"font-size:20px\">所以私有和关闭的课程是无法正常加入的哦。</span></li>\n</ul>\n\n<p><span style=\"font-size:20px\">二、创建自己的课程</span></p>\n\n<p><span style=\"font-size:20px\">&nbsp; &nbsp; &nbsp; &nbsp;在&ldquo;我的课程&rdquo;选项卡中点击创建课程，我们给您的课程提供了默认封面，您也可以选择自己上传，推荐上传体积小于1M、尺寸比例1:1.8左右的封面哦。</span></p>\n', 223, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (9, 'root', '关于本学期通识基础选修实体课的选课结课及开课通知', '<p>各学院、各位同学：</p>\n\n<p>&nbsp; &nbsp; &nbsp; 本学期通识基础选修实体课的选课阶段已结束，共16个课堂的选课人数大于20人，可以正常开课。除此之外的其他课堂停开，已选停开课堂的同学可以继续选网络课。</p>\n', 21, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (10, 'root', '关于2021-2022学年春季学期通识基础选修课的选课通知', '<p>各学院、各位同学：</p>\n\n<p>&nbsp;2021-2022学年春季学期通识基础选修课开始在网上进行选课，请同学们仔细阅读并严格遵守，在规定时间内进行选课和学习。各学院要鼓励学生积极选修《中国共产党历史》课程，推动学生学史明理、学史增信、学史崇德、学史力行。</p>\n\n<p>一、选修课类型 通识基础选修课包括校内实体课和网络平台课两部分课程，根据培养计划规定，学生在校期间要修满8学分的通识基础选修课，相同课程不重复计算学分。建议学生每学期根据课业负重情况选课。</p>\n\n<p>二、选课对象 选课对象为2021级、2020级、2019级、2018级以及2017级（五年制专业）。 2021级、2020级学生同一类别选课不超过2学分（中华传统、世界文明、当代社会、文艺审美、生命探索、科技创新六类素质教育课程）。</p>\n', 24, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (12, 'root', '关于2022-2023学年秋季学期专业选修课补选的通知', '<p>各相关学院：</p>\n\n<p>因2022-2023学年秋季学期专业选修课部分课堂选课人数未达规定人数，相关课程已停开，停开课程清单详见附件。</p>\n\n<p>专业选修课补选工作安排在2022年7月27日17时&mdash;7月28日17时进行，在之前选课阶段漏选、错选的学生以及选择了上述停开课程的可以继续在剩余开设课程中选课，请材料、电气、信计、土木、环工、文法、外语、体育、国教、物电、艺术、生医学院通知相关学生及时选课，确保在规定时间内完成补选任务。</p>\n\n<p>教务处</p>\n', 77, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (13, 'root', '《沟通与交流》 通知', '<p>一、基本信息（必填项）</p>\n\n<p>课程代码：【2030230】</p>\n\n<p>课程学分：【2】</p>\n\n<p>面向专业：【19级秘书专业】</p>\n\n<p>课程性质：专业必修课</p>\n\n<p>开课院系：新闻传播学院 使用教材：贾朝莉，罗春芳，《管理沟通》 湖南师范大学出版社 2017年5月</p>\n\n<p>参考教材：</p>\n\n<p>1、惠亚爱，沟通技巧，人民邮电出版社，2008年03月</p>\n\n<p>2、 徐宪光，《商务沟通》，外语教学与研究出版社，2001</p>\n\n<p>3、 （美）黑贝尔斯，威沃尔；李业昆 译，《有效沟通》，华夏出版社，2001.11 4、 王磊，《管理沟通》，石油工业出版社，2001.1</p>\n\n<p>二、课程简介</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp; 现代社会，人们之间的交际广度和频率度不断加大，人际沟通能力成为人们生活和工作的重要手段，社交的礼仪形象能有效地展现一个人的素养、学识、风度和魅力。《沟通与交流》即是一门训练学生口语交际能力和礼仪基础的课程，旨在能过本课程的教学和训练，使学生掌握口语交际的基本技巧和社交礼仪的基本知识，以适应未来工作、学习和生活的需要，并为人际沟通能力和社交礼仪的进一步提高奠定良好的基础。 教学活动主要通过课堂讲授、音像教学、情景演示等形式进行，注重学生职业素质和沟通能力的培养。</p>\n\n<p>三、选课建议</p>\n\n<p>&nbsp; &nbsp; &nbsp; 该课程适合传播专业、新闻专业、广告专业或秘书专业二、三年级学生学习。</p>\n', 55, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (15, 'admin', '形势与政策专题教学大纲', '<p>一、课程的性质、目的和任务</p>\n\n<p>1、课程性质：本课程属于公共思想政治必修课。</p>\n\n<p>2、课程目的：通过本课程的教学，使学生了解国内外的重大时事，全面认识和正确理解党的基本路线、重大方针和政策，认清形势和任务，掌握时代的脉搏，激发爱国主义精神，增强民主自信心和社会责任感，珍惜和维护国家稳定的大局，为建设有中国特色的社会主义而奋发学习、健康成长。</p>\n\n<p>3、课程任务：紧密结合国内外形势，紧密结合学生的思想实际，通过适时地进行形势政策、世界政治经济与国际关系基本知识的教育，帮助学生开阔视野，及时了解和正确对待国内外重大时事，使学生在改革开放的环境下有坚定的立场、有较强的分析能力和适应能力。</p>\n\n<p>二、课程教学的基本要求</p>\n\n<p>坚持以习近平新时代中国特色社会主义思想为指导，针对学生关注的热点问题和思想特点，帮助学生认清国内外形势，教育和引导学生全面准确地理解党的路线、方针和政策，坚定在中国共产党领导下走建设有中国特色社会主义道路的信心和决心，积极投身改革开放和中华民族伟大复兴的事业中来。</p>\n\n<p>&nbsp;</p>\n', 46, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (16, 'root', '《马克思主义基本原理概论》课程教学大纲', '<p>总 学 时：54</p>\n\n<p>学 分：3（其中理论教学2学分，实践教学1学分）</p>\n\n<p>适用专业：全校各本科专业</p>\n\n<p>先修课程：思想道德修养与法律基础；中国近现代史纲要</p>\n\n<p>一、课程的目的与任务 《马克思主义基本原理概论》是高校思想政治理论课程体系的主干课程，其内容包括：马克思主义哲学、政治经济学和科学社会主义三个组成部分。本课程的目的是对学生进行系统的马克思主义理论教育，帮助学生掌握马克思主义的世界观和方法论，树立马克思主义的人生观和价值观，学会用马克思主义的世界观和方法论观察和分析问题，培养和提高学生运用马克思主义理论分析和解决实际问题的能力。为学生确立建设有中国特色社会主义的理想信念，自觉地坚持党的基本理论、基本路线和基本纲领打下扎实的理论基础。</p>\n\n<p>二、课程的基本要求 《马克思主义哲学原理概论》是从整体上来介绍马克思主义基本理论的课程。通过本课程的学习，要使大学生完整地把握马克思主义的基本理论，使学生认识到马克思主义是科学的世界观和方法论，是我们从事社会主义革命和社会主义建设指导思想和理论基础。要求学生掌握和了解马克思主义哲学、马克思主义政治经济学以及科学社会主义的基本理论，在实践中学会运用马克思主义的基本原理认识和分析各种社会实际问题，正确认识人类社会的本质、社会发展动力和社会发展基本规律，正确认识资本主义和社会主义在其发展过程中出现的各种新情况、新问题，认识社会主义代替资本主义的历史必然性，从而坚定对社会主义和共产主义的信念。</p>\n\n<p>三、与其他课程的联系和分工 《马克思主义基本原理概论》与《近现代史纲要》、《毛泽东思想和中国特色社会主义理论体系概论》、《思想道德修养与法律基础》等几门课程一起构成马克思主义政治理论课。这些课程的共同任务是对青年学生进行马克思主义基本原理和基本理论的教育，帮助学生树立正确的世界观和人生观，坚定对社会主义和共产主义的信念。《马克思主义基本原理概论》在这些课程中起着理论基础的作用，为学生正确学习和理解其他政治理论课提供科学的世界观和方法论。</p>\n', 39, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (18, 'root', '《思想道德修养与法律基础》课程教学大纲', '<p>一、课程基本情况</p>\n\n<p>1.课程编号：my0100101</p>\n\n<p>2.课程中文名称：思想道德修养与法律基础 课程英文名称：CultivationofEthicsandFundamentalsofLaw</p>\n\n<p>3.课程总学时：54</p>\n\n<p>4.课程学分：3</p>\n\n<p>5.课程类型：公共必修课 6.开课单位：马克思主义学院基础教研室</p>\n\n<p>7.适用专业：所有本、专科专业 8.必修课程：无</p>\n\n<p>9.课程负责人：王茝</p>\n\n<p>二、教学目的和要求</p>\n\n<p>1.课程说明： 《思想道德修养与法律基础》是大学生的公共基础必修课程，其教学对象是高等院校的全体本、专科学生，是帮助大学生树立正确的世界观、人生观、价值观、道德观和法制观的重要课程。</p>\n\n<p>2.教学目的： 《思想道德修养与法律基础》是帮助大学生明是非、知荣辱、辨美丑，启迪大家求真、向善、爱美的课程；是帮助大学生正确处理理想与现实、个人与集体、竞争与合作、权利与义务、自由与纪律、友谊与爱情、学习与工作等关系，树立正确的世界观、人生观、价值观、道德观和法制观的课程；是引导大学生不断提高自我修养，促进自身德智体美劳全面发展课程。</p>\n\n<p>3.教学要求：</p>\n\n<p style=\"margin-left:40px\">（1）该课程要以社会主义核心价值观教育和社会主义法治观教育为主线，以爱国主义、社会主义、集体主义教育为核心来展开课堂教学。</p>\n\n<p style=\"margin-left:40px\">（2）教学要达到科学性、思想性、创新性、针对性和实践性的统一。</p>\n\n<p style=\"margin-left:40px\">（3）教学方式可灵活多样。如：理论教学、案例教学、课堂互动、多媒体教学和第二课堂的实践教学等。</p>\n\n<p style=\"margin-left:40px\">（4）学习成绩评定应注重科学性、合理性。注意把学生的学习态度、平时成绩、卷面成绩、实践成绩等方面结合起来。</p>\n', 12, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (19, 'root', '《数据结构》', '<p>课程名称：数据结构&nbsp; &nbsp; 课程编码：7085431&nbsp; &nbsp; 课程学分：3学分</p>\n\n<p>课程学时：48学时&nbsp; &nbsp; &nbsp; &nbsp;适用专业：计算机科学与技术</p>\n\n<p>先修课程：C程序设计，离散数学&nbsp; &nbsp;课程类别：专业必修课</p>\n\n<p>一、课程简介与目标</p>\n\n<p>本课程的授课对象为计算机科学与技术专业学生，课程属性为专业基础必修课。 该课程作为一门重要的专业基础课程，所讨论的知识内容和技术方法，无论对进一步 学习计算机专业的其他课程，还是对从事软件开发，都起着重要的作用，不仅为操作 系统、编译原理、数据库原理等后继课程提供必要的知识基础，同时也为从事软件开 发提供了必要的技能训练。 通过本课程的学习，使学生了解数据对象的特性，学会数据组织的方法，以及各种类型数据的处理方法，同时培养学生良好的程序设计技能。</p>\n\n<p>1.&nbsp; 课程支撑的毕业要求</p>\n\n<ul>\n	<li>能面向计算系统和过程，选择或建立适当的描述模型。</li>\n	<li>能运用基本原理，借助文献研究，分析过程的影响因素，获得有效结论。</li>\n	<li>能够针对计算机专业的一般性工程问题设计出计算机应用系统的方案，构 建系统框架，能够针对关键问题选择合理算法或方法。</li>\n</ul>\n\n<p>2.&nbsp; 课程拟达到的教学目标 本课程主要讨论计算机中非数值数据的处理问题，针对数据对象的特性、数据的组织方法和处理方法展开讨论，使学生的专业基本技能和综合运用能力得到提升。</p>\n\n<p>本课程具体教学目标为：</p>\n\n<p>目标 1：掌握数据结构的相关概念，理解计算机处理非数值数据问题的基本原理 和处理方法，掌握实际问题到不同数据类型数据的抽象过程和处理方法；</p>\n\n<p>目标 2：理解线性表、树、图各种数据类型的特性，掌握不同类型数据的基本存 储方法，以及各基本操作的实现算法，并能应用在实际系统设计中；</p>\n\n<p>目标 3：能够结合数学、离散数学等相关理论实现各种类型数据的操作，建立算 法效率评价意识，掌握算法评价方法，并能在解决实际问题中提出不同的解决方案， 分析优化得到相对较好的实现方法；</p>\n\n<p>目标 4：理解查找、排序基本方法在系统级的应用，能够综合所学知识解决系统 级问题；</p>\n\n<p>目标 5：较全面理解计算机处理数据的基本方法，能够运用数据分析、数据组织 存储、以及数据处理算法等方法，对实际问题进行分析和处理，并能得到有效结果。 课程思政目标：通过计算思维能力和基本工程素养的培养，培育学生精益求精的 工匠精神以及专业技术人员所具有社会责任感和职业道德。</p>\n', 112, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (20, 'root', '《计算机网络》', '<p><strong>【课程目的】</strong></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;本课程的教学目的是使学生掌握计算机网络的基础理论、基本原理、基本技术，掌握计算机网络的体系结构和典型网络协议，理解典型网络设备的工作原理，了解典型网络设备的组成和特点，能够运用计算机网络的基本概念、基本原理和基本方法进行网络系统的分析、设计和应用，为学习其他课程以及从事计算机网络的研究、开发、管理和使用打下坚实的基础。</p>\n\n<p><strong>【课程内容简介】</strong></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;《计算机网络》主要讲述网络运行原理、数据通讯模型和一些成熟的网络技术。着重介绍了数据通讯模型，网络的分层体系结构，主要的网络协议，局域网、广域网和网络互连的原理、技术和设备，各种网络服务的内部运行原理和应用，网络安全，网络发展方向和趋势等内容。全课程以讲述网络和通讯技术的基本原理、基本概念和基本技术为主。</p>\n\n<p><strong>【教学要求】</strong></p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;网络技术日新月异，通过本课程的教学，使学生对计算机网络从整体上有一个较清晰的了解，了解计算机网络的基本概念，了解网络新技术的新发展，从网络层次结构模型的应用层到物理层来对计算机网络体系结构进行描述，掌握计算机网络各层协议的基本工作原理及其所采用的技术，对当前计算机网络的主要种类和常用的网络协议有较清晰的概念，学会计算机网络的一些基本设计方法。通过本课程，还要掌握网络技术的学习方法，为以后从事相关的应用和科研工作打下坚实的基础。 本课程总学时为54学时 ，其中课堂讲授44学时，实验（实践）10学时。</p>\n', 258, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (21, 'root', '《计算机组成原理 》', '<p>《计算机组成原理 》教学大纲 Principles of Computer Composition</p>\n\n<p style=\"margin-left:40px\">课程编码：12A03031 学分：3&nbsp; 课程类别：专业基础课</p>\n\n<p style=\"margin-left:40px\">计划学时：48 其中讲课：48 实验或实践：0</p>\n\n<p style=\"margin-left:40px\">上机：0 适用专业：计算机科学与技术（软件外包方向）</p>\n\n<p style=\"margin-left:40px\">推荐教材： 唐朔飞，《计算机组成原理（第2版）》，高等教育出版社，2008年</p>\n\n<p style=\"margin-left:40px\">参考书目： 1.白中英，《计算机组成原理（第4版）》，科学出版社，2008年 2.蒋本珊编著，《计算机组成原理》（第2版）》，清华大学出版社，2008年</p>\n\n<p>课程的教学目的与任务</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp;本课程的教学目的是通过理论学习使学生系统地掌握计算机的组成部分和内部运行机理，为学生进一步学习计算机专业的后续课程打下坚实的基础。课程的主要任务是使学生掌握组成计算机的基本部件即存储器、运算器、控制器、输入输出系统和连接它们之间的系统总线的构成、组织方式和工作原理，以及部件和单元的设计思想，并以控制流和数据流为主线，将计算机的各大部件联系起来，使学生建立计算机整机概念并主动探索计算机内部的庞杂架构及其如何自动工作的原理，为计算机专业知识体系的建立打下扎实的理论基础。</p>\n\n<p>课程的基本要求</p>\n\n<p>1、 通过课程的学习，应掌握计算机计算机系统的结构原理，掌握数据的表示、转换和运算机理；</p>\n\n<p>2、 掌握程序和数据在计算机中的存储原理；掌握计算机的指令系统；</p>\n\n<p>3、 掌握CPU工作原理，程序运行过程，掌握接口技术与原理和常见外部设备的基本结构与工作原理。 各章节授课内容、教学方法及学时分配建议</p>\n', 99, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (22, 'root', '系统公告测试', '<p>测试文案</p>\n', 0, '2024-07-27 16:46:06');
INSERT INTO `th_notice_adm` VALUES (24, 'admin', '2023通知测试', '<p>这里是通知内容</p>\n', 0, '2024-07-27 16:46:06');

-- ----------------------------
-- Table structure for th_paper
-- ----------------------------
DROP TABLE IF EXISTS `th_paper`;
CREATE TABLE `th_paper`  (
  `paper_id` int NOT NULL AUTO_INCREMENT COMMENT '试卷id',
  `exam_id` int NULL DEFAULT NULL COMMENT '所属任务id',
  `subject_type` int NULL DEFAULT NULL COMMENT '1-选择 2-填空 3-判断 4-简答',
  `subject_id` int NULL DEFAULT NULL COMMENT '题目id',
  `subject_num` int NULL DEFAULT NULL COMMENT '题目序号',
  PRIMARY KEY (`paper_id`) USING BTREE,
  INDEX `subject_id`(`subject_id` ASC) USING BTREE,
  INDEX `exam_id`(`exam_id` ASC) USING BTREE,
  CONSTRAINT `th_paper_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `th_exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 233 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_paper
-- ----------------------------
INSERT INTO `th_paper` VALUES (1, 1, 1, 1, 1);
INSERT INTO `th_paper` VALUES (2, 1, 1, 2, 2);
INSERT INTO `th_paper` VALUES (3, 1, 1, 3, 3);
INSERT INTO `th_paper` VALUES (4, 1, 2, 1, 6);
INSERT INTO `th_paper` VALUES (5, 1, 2, 2, 7);
INSERT INTO `th_paper` VALUES (6, 1, 2, 3, 8);
INSERT INTO `th_paper` VALUES (7, 1, 3, 1, 9);
INSERT INTO `th_paper` VALUES (8, 1, 3, 2, 10);
INSERT INTO `th_paper` VALUES (9, 1, 3, 3, 11);
INSERT INTO `th_paper` VALUES (10, 1, 4, 1, 12);
INSERT INTO `th_paper` VALUES (11, 1, 4, 2, 13);
INSERT INTO `th_paper` VALUES (12, 1, 4, 3, 14);
INSERT INTO `th_paper` VALUES (17, 1, 1, 6, 5);
INSERT INTO `th_paper` VALUES (20, 2, 3, 5, 1);
INSERT INTO `th_paper` VALUES (21, 1, 1, 8, 4);
INSERT INTO `th_paper` VALUES (22, 1, 2, 6, 15);
INSERT INTO `th_paper` VALUES (28, 22, 1, 14, 1);
INSERT INTO `th_paper` VALUES (29, 22, 1, 15, 2);
INSERT INTO `th_paper` VALUES (30, 23, 1, 16, 1);
INSERT INTO `th_paper` VALUES (31, 24, 1, 17, 1);
INSERT INTO `th_paper` VALUES (32, 25, 1, 18, 1);
INSERT INTO `th_paper` VALUES (33, 26, 1, 19, 1);
INSERT INTO `th_paper` VALUES (34, 27, 1, 20, 1);
INSERT INTO `th_paper` VALUES (35, 29, 1, 21, 1);
INSERT INTO `th_paper` VALUES (36, 29, 1, 22, 2);
INSERT INTO `th_paper` VALUES (39, 31, 1, 25, 1);
INSERT INTO `th_paper` VALUES (40, 31, 1, 26, 2);
INSERT INTO `th_paper` VALUES (41, 31, 3, 6, 3);
INSERT INTO `th_paper` VALUES (42, 31, 4, 4, 4);
INSERT INTO `th_paper` VALUES (43, 34, 1, 27, 1);
INSERT INTO `th_paper` VALUES (44, 34, 2, 7, 2);
INSERT INTO `th_paper` VALUES (45, 34, 1, 30, 3);
INSERT INTO `th_paper` VALUES (46, 34, 3, 7, 4);
INSERT INTO `th_paper` VALUES (47, 34, 4, 5, 5);
INSERT INTO `th_paper` VALUES (48, 37, 1, 31, 1);
INSERT INTO `th_paper` VALUES (49, 37, 1, 32, 2);
INSERT INTO `th_paper` VALUES (50, 39, 1, 33, 1);
INSERT INTO `th_paper` VALUES (51, 40, 1, 34, 1);
INSERT INTO `th_paper` VALUES (52, 39, 1, 35, 2);
INSERT INTO `th_paper` VALUES (198, 59, 1, 1, 1);
INSERT INTO `th_paper` VALUES (199, 59, 1, 2, 2);
INSERT INTO `th_paper` VALUES (200, 59, 1, 3, 3);
INSERT INTO `th_paper` VALUES (201, 59, 1, 4, 4);
INSERT INTO `th_paper` VALUES (202, 59, 1, 5, 5);
INSERT INTO `th_paper` VALUES (203, 59, 1, 6, 6);
INSERT INTO `th_paper` VALUES (204, 59, 1, 7, 7);
INSERT INTO `th_paper` VALUES (205, 59, 1, 8, 8);
INSERT INTO `th_paper` VALUES (206, 59, 1, 9, 9);
INSERT INTO `th_paper` VALUES (207, 59, 1, 10, 10);
INSERT INTO `th_paper` VALUES (208, 60, 1, 3362501, 1);
INSERT INTO `th_paper` VALUES (209, 60, 1, 3362622, 2);
INSERT INTO `th_paper` VALUES (210, 60, 1, 3362663, 3);
INSERT INTO `th_paper` VALUES (211, 60, 1, 3362704, 4);
INSERT INTO `th_paper` VALUES (212, 60, 1, 3362725, 5);
INSERT INTO `th_paper` VALUES (213, 61, 1, 5146781, 1);
INSERT INTO `th_paper` VALUES (214, 61, 1, 5146842, 2);
INSERT INTO `th_paper` VALUES (215, 61, 1, 5146883, 3);
INSERT INTO `th_paper` VALUES (216, 61, 1, 5146934, 4);
INSERT INTO `th_paper` VALUES (217, 61, 1, 5146985, 5);
INSERT INTO `th_paper` VALUES (218, 62, 1, 2496401, 1);
INSERT INTO `th_paper` VALUES (219, 62, 1, 2496452, 2);
INSERT INTO `th_paper` VALUES (220, 62, 1, 2496493, 3);
INSERT INTO `th_paper` VALUES (221, 62, 1, 2496534, 4);
INSERT INTO `th_paper` VALUES (222, 62, 1, 2496585, 5);
INSERT INTO `th_paper` VALUES (223, 63, 1, 1, 1);
INSERT INTO `th_paper` VALUES (224, 63, 1, 2, 2);
INSERT INTO `th_paper` VALUES (225, 63, 1, 3, 3);
INSERT INTO `th_paper` VALUES (226, 63, 1, 4, 4);
INSERT INTO `th_paper` VALUES (227, 63, 1, 5, 5);
INSERT INTO `th_paper` VALUES (228, 64, 1, 1, 1);
INSERT INTO `th_paper` VALUES (229, 64, 1, 2, 2);
INSERT INTO `th_paper` VALUES (230, 64, 1, 3, 3);
INSERT INTO `th_paper` VALUES (231, 64, 1, 4, 4);
INSERT INTO `th_paper` VALUES (232, 64, 1, 5, 5);

-- ----------------------------
-- Table structure for th_question_answer
-- ----------------------------
DROP TABLE IF EXISTS `th_question_answer`;
CREATE TABLE `th_question_answer`  (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '题目',
  `answer` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '答案',
  `analysis` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '解析',
  `score` int NULL DEFAULT NULL COMMENT '分值',
  PRIMARY KEY (`subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_question_answer
-- ----------------------------
INSERT INTO `th_question_answer` VALUES (1, '试说明循环冗余校验码的校验原理', '循环冗余校验码的生成步骤：①确定校验位的位数 r\n\n                                                      ②写出信息多项式 M(x)\n\n                                                      ③将信息多项式左移 r 位，得到 M(x)·x^r\n\n                                                      ④用 M(x)·x^r 除以生成多项式 G(x)，得到 r 位校验位\n\n                                                      ⑤M(x)·x^r+R(x) 得到CRC码\n\n     检验原理：根据余数判出错位，取反纠错。', '无解析', 12);
INSERT INTO `th_question_answer` VALUES (2, '在写操作时，要考虑Cache和主存的数据一致性的问题，试说明写回法和写直达法的区别', ' 写回法（拷回法）：写操作时只把数据写入Cache而不写入主存（减少了主存的写操作次数），写操作时间=访Cache时间。但当（读操作且Cache已满时）Cache数据被替换出来时才写回主存，增加了Cache复杂性。\n\n     写直达法（存直达法）：写操作时数据既写入Cache又写入主存，写操作时间=访存时间，它能随时保证主存与Cache的数据始终一致，但增加了访存次数。（读操作时不涉及对主存的写操作，更新策划较容易实现。）\r\n', '无解析', 12);
INSERT INTO `th_question_answer` VALUES (3, '设某计算机采用微程序控制器，试说明微程序控制器的基本工作原理（即CPU执行指令时的操作过程）', '首先将用户程序的首地址送到PC，然后进入\n\n      取指阶段：①将取指周期微程序首地址M→CMAR\n\n                        ②取微指令：将对应控存M地址单元中的第一条微指令读到控存数据寄存器中，记为CM(CMAR)→CMDR\n\n                        ③产生微操作指令：第一条微指令的操作控制字段中为“1”的各位发出控制信号，如PC→MAR、I→R，命令主存    接收程序首地址并进行读操作。\n\n                        ④形成下一条微指令的地址：此微指令的顺序控制字段指出了下一条微指令的地址为M+1，将M+1送至CMAR，即Ad(CMDR)→CMAR\n\n                        ⑤取下一条微指令：将对应控存M+1地址单元中的第二条微指令读到CMDR中，即CM(CMAR)→CMDR\n\n                        ⑥产生微操作指令：由第二条微指令的操作控制字段中对应“1”的各位发出控制信号，如M(MAR)→MDR使对应主存2000H地址单元中的第一条机器指令从主存中读出，送至MDR中。\n\n                        ⑦形成下一条微指令地址：将第二条微指令下地址字段指出的地址M+2送至CMAR，即Ad(CMDR)→CMAR\n\n      执行阶段：①取数指令微程序首地址的形成：当取数指令存入IR后，其操作码OP(IR)直接送到微地址形成部件，该部件的输出即为取数指令微程序的首地址P，且将P送至CMAR，记作OP(IR)→微地址形成部件→CMAR\n\n                        ②取微指令：将对应控存P地址单元中的微指令读到CMDR中，记为CM(CMAR)→CMDR\n\n                        ③产生为操作命令：由微指令操作控制字段中对应“1”的各位发出控制信号，如Ad(IR)→MAR、I→R，命令主存读操作数。\n\n                        ④形成下一条微指令地址：将此条微指令下地址字段指出的P+1送至CMAR，即Ad(CMDR)→CMAR', '无解析', 12);
INSERT INTO `th_question_answer` VALUES (4, '<p>11111111111</p>\n', '<p>11111111111</p>\n', '<p>1111111111111111111</p>\n', 10);
INSERT INTO `th_question_answer` VALUES (5, '<p>1111111</p>\n', '<p>1</p>\n', '', 10);

-- ----------------------------
-- Table structure for th_reply
-- ----------------------------
DROP TABLE IF EXISTS `th_reply`;
CREATE TABLE `th_reply`  (
  `reply_id` int NOT NULL AUTO_INCREMENT,
  `discussion_id` int NULL DEFAULT NULL,
  `chapter_id` int NULL DEFAULT NULL,
  `from_uid` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `to_uid` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`reply_id`) USING BTREE,
  INDEX `rfordiscusssion`(`discussion_id` ASC) USING BTREE,
  INDEX `rforuser`(`from_uid` ASC) USING BTREE,
  INDEX `to_uid`(`to_uid` ASC) USING BTREE,
  INDEX `chapter_id`(`chapter_id` ASC) USING BTREE,
  CONSTRAINT `rforuser` FOREIGN KEY (`from_uid`) REFERENCES `th_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `th_reply_ibfk_1` FOREIGN KEY (`discussion_id`) REFERENCES `th_discussion` (`discussion_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `th_reply_ibfk_2` FOREIGN KEY (`chapter_id`) REFERENCES `th_chapter` (`chapter_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_reply
-- ----------------------------
INSERT INTO `th_reply` VALUES (78, 19, NULL, 'stu023', NULL, '<p>发布者回复测试</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (79, 19, NULL, 'stu023', NULL, '<p>发布者带图回复测试</p>\n\n<p><img alt=\"\" height=\"114\" src=\"/files/user/stu023/ckeditor/ckeditor_2023_07_10122049887.png\" width=\"128\" /></p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (80, 20, NULL, 'stu023', NULL, '<h1>富文本测试</h1>\n\n<h2><span style=\"color:#2ecc71\"><span style=\"background-color:#f1c40f\">富文本测试</span></span></h2>\n\n<h3><em><strong><u>富文本测试</u></strong></em></h3>\n\n<h4>富文本测试</h4>\n\n<h5>富文本测试</h5>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (81, 21, NULL, 'stu022', NULL, '<p>学生发布者回复测试1</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (82, 21, NULL, 'stu022', NULL, '<p>学生发布者回复测试2</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (83, 21, NULL, 'stu022', NULL, '<p>学生发布者回复测试3</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (84, 21, NULL, 'stu022', NULL, '<p>带图回复测试</p>\n\n<p><img alt=\"\" height=\"85\" src=\"/files/user/stu022/ckeditor/ckeditor_2023_07_10123126611.jpg\" width=\"109\" /></p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (85, 20, NULL, 'stu022', NULL, '<p>学生发布回复测试1</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (86, 20, NULL, 'stu022', NULL, '<p>学生发布带图回复测试</p>\n\n<p><img alt=\"\" height=\"140\" src=\"/files/user/stu022/ckeditor/ckeditor_2023_07_10123350101.jpg\" width=\"155\" /></p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (87, 19, NULL, 'stu022', NULL, '<p>学生编辑回复测试1</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (88, 19, NULL, 'stu022', 'stu023', '<p>学生评论回复测试1</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (89, 19, NULL, 'stu022', 'stu023', '<p>学生评论回复测试2</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (90, NULL, 181, 'stu022', NULL, '<p>学生发表评论测试</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (91, NULL, 181, 'stu022', NULL, '<p>学生发表带图评论测试</p>\n\n<p><img alt=\"\" height=\"108\" src=\"/files/user/stu022/ckeditor/ckeditor_2023_07_10124429244.jpg\" width=\"131\" /></p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (92, NULL, 182, 'stu022', NULL, '<p>学生点赞测试</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (93, NULL, 181, 'stu013', NULL, '<p>学生发表评论测试</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (94, NULL, 181, 'stu013', 'stu022', '<p>学生回复评论测试</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (95, 19, NULL, 'stu013', NULL, '<p>学生编辑回复测试2</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (96, 19, NULL, 'stu013', 'stu022', '<p>学生评论回复测试3</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (97, 21, NULL, 'stu013', 'stu022', '<p>学生评论回复测试1</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (98, 22, NULL, 'stu013', NULL, '<div>栈与队列的相同点：</div>\n\n<div>1.都是线性结构。</div>\n\n<div>2.插入操作都是限定在表尾进行。</div>\n\n<div>3.都可以通过顺序结构和链式结构实现。、</div>\n\n<div>4.插入与删除的时间复杂度都是O（1），在空间复杂度上两者也一样。</div>\n\n<div>5.多链栈和多链队列的管理模式可以相同。</div>\n\n<div>栈与队列的不同点：</div>\n\n<div>1.删除数据元素的位置不同，栈的删除操作在表尾进行，队列的删除操作在表头进行。</div>\n\n<div>2.应用场景不同；常见栈的应用场景包括括号问题的求解，表达式的转换和求值，函数调用和递归实现，深度优先搜索遍历等；常见的队列的应用场景包括计算机系统中各种资源的管理，消息缓冲器的管理和广度优先搜索遍历等。</div>\n\n<div>3.顺序栈能够实现多栈空间共享，而顺序队列不能。</div>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (99, NULL, 182, 'stu013', NULL, '<p>学生评论测试</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (100, NULL, 182, 'stu013', 'stu022', '<p>学生回复测试</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (101, NULL, 181, 'root', NULL, '<p>加油哦！</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (102, NULL, 1, 'stu003', NULL, '<p>姐姐好好看</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (103, 22, NULL, 'stu003', NULL, '<p>栈（Stack）:是限定仅在表尾进行插入和删除操作的线性表。<br />\n&emsp;&emsp;我们把允许插入和删除的一端称为栈顶（top），另一端称为栈底（bottom），不含任何元素的栈称为空栈。栈又称为后进先出（Last In First Out）的线性表，简称LIFO结构。<br />\n&emsp;&emsp;理解栈的定义需要注意：<br />\n&emsp;&emsp;首先他是一个线性表，也就是说，栈元素具有线性关系，即前驱后继关系。只不过它是一种特殊的线性表而已。定义中说是在线性表的表尾进行插入和删除操作，这里表尾是指栈顶，而不是栈底。<br />\n&emsp;&emsp;它的特殊之处就在于限制了这个线性表的插入和删除位置，它始终只在栈顶进行。这也就使得：栈底是固定的，最先进栈的只能在栈底。</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (104, NULL, 185, 'stu023', NULL, '<p>说的好</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (105, 23, NULL, 'stu023', NULL, '<p>冯诺依曼结构是把指令和数据以同等的方式保存在存储器当中，chache也是一种存储器，而现代计算机有的时候是把指令cache和控制cache分开（比如MIPS），这个和指令执行的控制方式有关。这样做避免在流水过程中造成资源冲突。</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (106, NULL, 183, 'stu013', NULL, '<p>收获很大！</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (107, 24, NULL, 'stu013', NULL, '<p>对对对</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (108, 22, NULL, 'stu003', NULL, '<p>111111111111111111111111111111111111</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (109, 22, NULL, 'stu003', 'stu013', '<p>ferfwefew</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (110, NULL, 184, 'stu003', NULL, '<p>grgergregergeffdg</p>\n', '2024-07-27 04:20:14');
INSERT INTO `th_reply` VALUES (111, 19, NULL, 'root', NULL, '<p>555555555555555555555</p>\n', '2023-12-29 22:28:20');
INSERT INTO `th_reply` VALUES (112, 19, NULL, 'root', NULL, '<p>GERGERGREGRE</p>\n', '2023-12-29 22:33:34');
INSERT INTO `th_reply` VALUES (113, 25, NULL, 'root', NULL, '<p>11111111111111</p>\n', '2023-12-29 22:37:01');
INSERT INTO `th_reply` VALUES (114, 25, NULL, 'root', NULL, '<p>534T4545Y54G</p>\n', '2023-12-29 22:45:08');
INSERT INTO `th_reply` VALUES (115, 26, NULL, 'stu003', NULL, '<p>wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww</p>\n', '2024-01-13 09:28:46');
INSERT INTO `th_reply` VALUES (116, NULL, 181, 'user1', NULL, '<p>bucuo</p>\n', '2024-02-01 09:17:42');
INSERT INTO `th_reply` VALUES (117, 22, NULL, 'user1', NULL, '<p>不知道</p>\n', '2024-02-01 09:18:30');
INSERT INTO `th_reply` VALUES (118, NULL, 182, 'user2', NULL, '<p>4545454</p>\n', '2024-02-01 09:25:03');
INSERT INTO `th_reply` VALUES (119, NULL, 182, 'user2', 'stu013', '<p>1212121</p>\n', '2024-02-01 09:25:09');
INSERT INTO `th_reply` VALUES (120, 22, NULL, 'user2', NULL, '<p>KIUKIKI</p>\n', '2024-02-01 09:25:55');
INSERT INTO `th_reply` VALUES (121, 22, NULL, 'user2', 'stu013', '<p>IULIULIU</p>\n', '2024-02-01 09:26:04');
INSERT INTO `th_reply` VALUES (122, NULL, 206, 'stu023', NULL, '<p>fsdfsdf</p>\n', '2024-02-01 09:29:08');
INSERT INTO `th_reply` VALUES (123, 29, NULL, 'user2', NULL, '<p>dsadsa</p>\n', '2024-02-01 09:30:30');
INSERT INTO `th_reply` VALUES (124, NULL, 181, 'stu003', NULL, '<p>12121213131</p>\n', '2024-02-25 17:09:51');
INSERT INTO `th_reply` VALUES (125, NULL, 181, 'stu003', 'user1', '<p>3123123123</p>\n', '2024-02-25 17:09:56');
INSERT INTO `th_reply` VALUES (126, 22, NULL, 'stu003', NULL, '<p>d3e3e3e3</p>\n', '2024-02-25 17:10:48');
INSERT INTO `th_reply` VALUES (127, 22, NULL, 'stu003', 'user2', '<p>dddede</p>\n', '2024-02-25 17:10:54');
INSERT INTO `th_reply` VALUES (129, 30, NULL, 'stu003', NULL, '<p>dsadfsadsa</p>\n', '2024-02-25 17:14:29');
INSERT INTO `th_reply` VALUES (130, NULL, 181, 'stu023', NULL, '<p>111111111111111</p>\n', '2024-03-23 02:32:21');
INSERT INTO `th_reply` VALUES (131, NULL, 1, 'sdu001', NULL, '<p>312312312312</p>\n', '2024-03-25 19:01:56');
INSERT INTO `th_reply` VALUES (132, NULL, 181, 'sdu001', NULL, '<p>34234234</p>\n', '2024-03-25 19:02:26');
INSERT INTO `th_reply` VALUES (133, 30, NULL, 'sdu001', NULL, '<p>24234234234234</p>\n', '2024-03-25 19:03:04');
INSERT INTO `th_reply` VALUES (134, 22, NULL, 'sdu001', NULL, '<p>32423423423432</p>\n', '2024-03-25 19:03:11');
INSERT INTO `th_reply` VALUES (135, 22, NULL, 'sdu001', 'stu003', '<p>4234234234324</p>\n', '2024-03-25 19:03:15');
INSERT INTO `th_reply` VALUES (136, NULL, 181, 'sdu345', NULL, '<p>4234132412343214</p>\n', '2024-08-04 20:17:23');
INSERT INTO `th_reply` VALUES (137, NULL, 181, 'sdu345', 'stu022', '<p>4213432142314</p>\n', '2024-08-04 20:17:29');
INSERT INTO `th_reply` VALUES (138, 26, NULL, 'sdu345', NULL, '<p>gfugudsg</p>\n', '2024-08-04 20:18:15');
INSERT INTO `th_reply` VALUES (139, 22, NULL, 'sdu345', 'stu003', '<p>rwerweqerwqereqw</p>\n', '2024-08-04 20:18:24');
INSERT INTO `th_reply` VALUES (140, NULL, 182, 'sdu346', NULL, '<p>4213412342314231</p>\n', '2024-08-04 20:24:51');
INSERT INTO `th_reply` VALUES (141, NULL, 182, 'sdu346', 'stu022', '<p>42341234123</p>\n', '2024-08-04 20:24:56');
INSERT INTO `th_reply` VALUES (142, 22, NULL, 'sdu346', NULL, '<p>534534534543</p>\n', '2024-08-04 20:25:35');
INSERT INTO `th_reply` VALUES (143, 22, NULL, 'sdu346', 'stu013', '<p>5324252345</p>\n', '2024-08-04 20:25:44');
INSERT INTO `th_reply` VALUES (144, NULL, 212, 'sdu346', NULL, '<p>111111</p>\n', '2024-08-04 20:29:53');
INSERT INTO `th_reply` VALUES (145, NULL, 182, 'sdu788', NULL, '<p>3123213123213</p>\n', '2024-09-14 14:39:06');
INSERT INTO `th_reply` VALUES (146, NULL, 182, 'sdu788', 'sdu346', '<p>3213123123123123</p>\n', '2024-09-14 14:39:18');
INSERT INTO `th_reply` VALUES (147, 32, NULL, 'sdu788', NULL, '<p>13124234234234234234234</p>\n', '2024-09-14 14:39:57');
INSERT INTO `th_reply` VALUES (148, 32, NULL, 'sdu788', NULL, '<p>4234234234</p>\n', '2024-09-14 14:40:12');
INSERT INTO `th_reply` VALUES (149, 22, NULL, 'sdu788', NULL, '<p>432423432423432</p>\n', '2024-09-14 14:40:28');
INSERT INTO `th_reply` VALUES (150, NULL, 213, 'sdu788', NULL, '<p>321312321</p>\n', '2024-09-14 14:45:18');
INSERT INTO `th_reply` VALUES (151, NULL, 182, 'sdu143', NULL, '<p>31231231231</p>\n', '2024-09-21 15:29:33');
INSERT INTO `th_reply` VALUES (152, NULL, 182, 'sdu143', 'sdu788', '<p>312321321</p>\n', '2024-09-21 15:29:40');
INSERT INTO `th_reply` VALUES (153, 22, NULL, 'sdu143', 'sdu788', '<p>423423432442134123423</p>\n', '2024-09-21 15:30:53');
INSERT INTO `th_reply` VALUES (154, NULL, 214, 'sdu143', NULL, '<p>1231232</p>\n', '2024-09-21 15:37:14');
INSERT INTO `th_reply` VALUES (155, NULL, 182, 'sdu122', NULL, '<p>3123213213</p>\n', '2024-09-21 18:45:51');
INSERT INTO `th_reply` VALUES (156, NULL, 182, 'sdu122', 'sdu143', '<p>312321321</p>\n', '2024-09-21 18:45:58');
INSERT INTO `th_reply` VALUES (157, 22, NULL, 'sdu122', NULL, '<p>322143124234324</p>\n', '2024-09-21 18:46:31');
INSERT INTO `th_reply` VALUES (158, 22, NULL, 'sdu122', 'sdu788', '<p>3123213123</p>\n', '2024-09-21 18:46:43');
INSERT INTO `th_reply` VALUES (159, NULL, 181, 'stu101', NULL, '<p>312312312312321321</p>\n', '2024-12-27 10:34:55');
INSERT INTO `th_reply` VALUES (160, 32, NULL, 'stu101', NULL, '<p>31232133123123</p>\n', '2024-12-27 10:35:25');
INSERT INTO `th_reply` VALUES (161, 36, NULL, 'stu101', NULL, '<p>312312321<img alt=\"laugh\" height=\"23\" src=\"http://localhost/ckeditor/plugins/smiley/images/teeth_smile.png\" title=\"laugh\" width=\"23\" /></p>\n', '2024-12-27 10:41:08');
INSERT INTO `th_reply` VALUES (162, NULL, 181, 'li908', NULL, '<p>312312321321</p>\n', '2025-02-12 12:20:54');
INSERT INTO `th_reply` VALUES (163, NULL, 181, 'li908', 'stu101', '<p>32132131231213</p>\n', '2025-02-12 12:21:01');
INSERT INTO `th_reply` VALUES (164, 21, NULL, 'li908', NULL, '<p>11111111111</p>\n', '2025-02-12 12:21:58');
INSERT INTO `th_reply` VALUES (165, NULL, 181, 'yy234', NULL, '<p>34324324</p>\n', '2025-02-12 12:31:18');
INSERT INTO `th_reply` VALUES (166, NULL, 181, 'yy234', NULL, '<p>看不到</p>\n', '2025-02-12 12:31:25');
INSERT INTO `th_reply` VALUES (167, 22, NULL, 'yy234', NULL, '<p>42423412423123</p>\n', '2025-02-12 12:32:24');
INSERT INTO `th_reply` VALUES (168, NULL, 196, 'XJC666', NULL, '<p>哇噻噻好厉害</p>\n', '2025-07-10 12:01:27');
INSERT INTO `th_reply` VALUES (169, NULL, 196, 'XJC666', NULL, '<p>111111</p>\n', '2025-07-10 12:01:37');
INSERT INTO `th_reply` VALUES (170, NULL, 181, 'stu023', 'yy234', '<p>sad</p>\n', '2025-07-11 12:32:17');
INSERT INTO `th_reply` VALUES (171, NULL, 181, 'XJC666', 'stu023', '<p>嘎嘎</p>\n', '2025-07-25 03:23:14');

-- ----------------------------
-- Table structure for th_report
-- ----------------------------
DROP TABLE IF EXISTS `th_report`;
CREATE TABLE `th_report`  (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `experiment_id` int NULL DEFAULT NULL,
  `user_id` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`report_id`) USING BTREE,
  INDEX `experiment_id`(`experiment_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `th_report_ibfk_1` FOREIGN KEY (`experiment_id`) REFERENCES `th_experiment` (`experiment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `th_report_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `th_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_report
-- ----------------------------
INSERT INTO `th_report` VALUES (31, 28, 'stu023', '86503_测试数据.docx', '2023-12-29 14:33:08');
INSERT INTO `th_report` VALUES (32, 27, 'stu023', '94330_测试数据.docx', '2023-12-29 14:33:08');
INSERT INTO `th_report` VALUES (33, 28, 'stu016', NULL, '2023-12-29 14:33:08');
INSERT INTO `th_report` VALUES (34, 27, 'stu016', NULL, '2023-12-29 14:33:08');
INSERT INTO `th_report` VALUES (35, 28, 'stu013', '98361_实验报告.docx', '2023-12-29 14:33:08');
INSERT INTO `th_report` VALUES (36, 27, 'stu013', NULL, '2023-12-29 14:33:08');
INSERT INTO `th_report` VALUES (37, 28, 'stu003', NULL, '2023-12-29 14:33:08');
INSERT INTO `th_report` VALUES (38, 27, 'stu003', NULL, '2023-12-29 14:33:08');
INSERT INTO `th_report` VALUES (39, 27, 'root', '35213_bk1.jpg', '2023-12-29 21:33:52');
INSERT INTO `th_report` VALUES (40, 28, 'root', NULL, '2023-12-29 21:33:52');
INSERT INTO `th_report` VALUES (41, 29, 'root', NULL, '2023-12-29 23:06:02');
INSERT INTO `th_report` VALUES (42, 29, 'stu003', '69590_新建 Microsoft Word 文档 (2).docx', '2024-01-09 10:55:09');
INSERT INTO `th_report` VALUES (43, 30, 'user1', '22751_2.xlsx', '2024-02-01 09:18:32');
INSERT INTO `th_report` VALUES (44, 29, 'user1', NULL, '2024-02-01 09:18:32');
INSERT INTO `th_report` VALUES (45, 27, 'user1', NULL, '2024-02-01 09:18:32');
INSERT INTO `th_report` VALUES (46, 28, 'user1', NULL, '2024-02-01 09:18:32');
INSERT INTO `th_report` VALUES (47, 30, 'user2', NULL, '2024-02-01 09:26:11');
INSERT INTO `th_report` VALUES (48, 29, 'user2', NULL, '2024-02-01 09:26:11');
INSERT INTO `th_report` VALUES (49, 27, 'user2', '85313_2.xlsx', '2024-02-01 09:26:12');
INSERT INTO `th_report` VALUES (50, 28, 'user2', NULL, '2024-02-01 09:26:12');
INSERT INTO `th_report` VALUES (51, 31, 'user2', '70166_2.xlsx', '2024-02-01 09:31:02');
INSERT INTO `th_report` VALUES (52, 30, 'stu003', NULL, '2024-02-25 17:10:58');
INSERT INTO `th_report` VALUES (53, 32, 'stu003', NULL, '2024-02-25 17:15:18');
INSERT INTO `th_report` VALUES (54, 32, 'stu023', NULL, '2024-03-23 00:52:25');
INSERT INTO `th_report` VALUES (55, 30, 'stu023', NULL, '2024-03-23 00:52:25');
INSERT INTO `th_report` VALUES (56, 29, 'stu023', NULL, '2024-03-23 00:52:25');
INSERT INTO `th_report` VALUES (57, 32, 'sdu001', '25155_2.xlsx', '2024-03-25 19:03:19');
INSERT INTO `th_report` VALUES (58, 30, 'sdu001', NULL, '2024-03-25 19:03:19');
INSERT INTO `th_report` VALUES (59, 29, 'sdu001', NULL, '2024-03-25 19:03:19');
INSERT INTO `th_report` VALUES (60, 27, 'sdu001', NULL, '2024-03-25 19:03:19');
INSERT INTO `th_report` VALUES (61, 28, 'sdu001', NULL, '2024-03-25 19:03:19');
INSERT INTO `th_report` VALUES (62, 32, 'sdu345', '30958_未标题-1.jpg', '2024-08-04 20:18:29');
INSERT INTO `th_report` VALUES (63, 30, 'sdu345', NULL, '2024-08-04 20:18:29');
INSERT INTO `th_report` VALUES (64, 29, 'sdu345', NULL, '2024-08-04 20:18:29');
INSERT INTO `th_report` VALUES (65, 27, 'sdu345', NULL, '2024-08-04 20:18:29');
INSERT INTO `th_report` VALUES (66, 28, 'sdu345', NULL, '2024-08-04 20:18:29');
INSERT INTO `th_report` VALUES (67, 32, 'sdu346', NULL, '2024-08-04 20:25:47');
INSERT INTO `th_report` VALUES (68, 30, 'sdu346', NULL, '2024-08-04 20:25:47');
INSERT INTO `th_report` VALUES (69, 29, 'sdu346', NULL, '2024-08-04 20:25:47');
INSERT INTO `th_report` VALUES (70, 27, 'sdu346', '63474_微信图片_20240805035017.png', '2024-08-04 20:25:47');
INSERT INTO `th_report` VALUES (71, 28, 'sdu346', NULL, '2024-08-04 20:25:47');
INSERT INTO `th_report` VALUES (72, 33, 'sdu346', NULL, '2024-08-04 20:31:51');
INSERT INTO `th_report` VALUES (73, 33, 'stu023', NULL, '2024-08-05 13:44:25');
INSERT INTO `th_report` VALUES (74, 33, 'sdu988', NULL, '2024-09-14 14:30:39');
INSERT INTO `th_report` VALUES (75, 32, 'sdu988', NULL, '2024-09-14 14:30:39');
INSERT INTO `th_report` VALUES (76, 30, 'sdu988', NULL, '2024-09-14 14:30:39');
INSERT INTO `th_report` VALUES (77, 29, 'sdu988', NULL, '2024-09-14 14:30:39');
INSERT INTO `th_report` VALUES (78, 27, 'sdu988', NULL, '2024-09-14 14:30:39');
INSERT INTO `th_report` VALUES (79, 28, 'sdu988', NULL, '2024-09-14 14:30:39');
INSERT INTO `th_report` VALUES (80, 33, 'sdu788', NULL, '2024-09-14 14:40:36');
INSERT INTO `th_report` VALUES (81, 32, 'sdu788', NULL, '2024-09-14 14:40:36');
INSERT INTO `th_report` VALUES (82, 30, 'sdu788', NULL, '2024-09-14 14:40:36');
INSERT INTO `th_report` VALUES (83, 29, 'sdu788', NULL, '2024-09-14 14:40:36');
INSERT INTO `th_report` VALUES (84, 27, 'sdu788', '61502_微信图片_20240907045422.png', '2024-09-14 14:40:36');
INSERT INTO `th_report` VALUES (85, 28, 'sdu788', NULL, '2024-09-14 14:40:36');
INSERT INTO `th_report` VALUES (86, 34, 'sdu788', '68262_微信图片_20240201110001.png', '2024-09-14 14:47:36');
INSERT INTO `th_report` VALUES (87, 34, 'sdu7888', NULL, '2024-09-14 15:39:12');
INSERT INTO `th_report` VALUES (88, 33, 'sdu7888', NULL, '2024-09-14 15:39:12');
INSERT INTO `th_report` VALUES (89, 32, 'sdu7888', NULL, '2024-09-14 15:39:12');
INSERT INTO `th_report` VALUES (90, 30, 'sdu7888', NULL, '2024-09-14 15:39:12');
INSERT INTO `th_report` VALUES (91, 29, 'sdu7888', NULL, '2024-09-14 15:39:12');
INSERT INTO `th_report` VALUES (92, 27, 'sdu7888', NULL, '2024-09-14 15:39:12');
INSERT INTO `th_report` VALUES (93, 28, 'sdu7888', NULL, '2024-09-14 15:39:12');
INSERT INTO `th_report` VALUES (94, 34, 'sdu143', NULL, '2024-09-21 15:30:55');
INSERT INTO `th_report` VALUES (95, 33, 'sdu143', NULL, '2024-09-21 15:30:55');
INSERT INTO `th_report` VALUES (96, 32, 'sdu143', '77128_微信图片_20240201110001.png', '2024-09-21 15:30:55');
INSERT INTO `th_report` VALUES (97, 30, 'sdu143', NULL, '2024-09-21 15:30:55');
INSERT INTO `th_report` VALUES (98, 29, 'sdu143', NULL, '2024-09-21 15:30:55');
INSERT INTO `th_report` VALUES (99, 27, 'sdu143', NULL, '2024-09-21 15:30:55');
INSERT INTO `th_report` VALUES (100, 28, 'sdu143', NULL, '2024-09-21 15:30:55');
INSERT INTO `th_report` VALUES (101, 34, 'sdu122', NULL, '2024-09-21 18:46:45');
INSERT INTO `th_report` VALUES (102, 33, 'sdu122', NULL, '2024-09-21 18:46:45');
INSERT INTO `th_report` VALUES (103, 32, 'sdu122', '32614_1024x1024bb.png', '2024-09-21 18:46:46');
INSERT INTO `th_report` VALUES (104, 30, 'sdu122', NULL, '2024-09-21 18:46:46');
INSERT INTO `th_report` VALUES (105, 29, 'sdu122', NULL, '2024-09-21 18:46:46');
INSERT INTO `th_report` VALUES (106, 27, 'sdu122', NULL, '2024-09-21 18:46:46');
INSERT INTO `th_report` VALUES (107, 28, 'sdu122', NULL, '2024-09-21 18:46:46');
INSERT INTO `th_report` VALUES (108, 34, 'stu101', NULL, '2024-12-27 10:35:26');
INSERT INTO `th_report` VALUES (109, 33, 'stu101', NULL, '2024-12-27 10:35:26');
INSERT INTO `th_report` VALUES (110, 32, 'stu101', '44943_481c4b47453b9fb7b5e41498b2c96315.jpeg', '2024-12-27 10:35:26');
INSERT INTO `th_report` VALUES (111, 30, 'stu101', NULL, '2024-12-27 10:35:26');
INSERT INTO `th_report` VALUES (112, 29, 'stu101', NULL, '2024-12-27 10:35:26');
INSERT INTO `th_report` VALUES (113, 27, 'stu101', NULL, '2024-12-27 10:35:26');
INSERT INTO `th_report` VALUES (114, 28, 'stu101', NULL, '2024-12-27 10:35:26');
INSERT INTO `th_report` VALUES (115, 34, 'li908', NULL, '2025-02-12 12:22:12');
INSERT INTO `th_report` VALUES (116, 33, 'li908', NULL, '2025-02-12 12:22:12');
INSERT INTO `th_report` VALUES (117, 32, 'li908', NULL, '2025-02-12 12:22:12');
INSERT INTO `th_report` VALUES (118, 30, 'li908', '69920_6aa5dbf56a7722430ebec96c528ad80b.jpeg', '2025-02-12 12:22:12');
INSERT INTO `th_report` VALUES (119, 29, 'li908', NULL, '2025-02-12 12:22:12');
INSERT INTO `th_report` VALUES (120, 27, 'li908', NULL, '2025-02-12 12:22:12');
INSERT INTO `th_report` VALUES (121, 28, 'li908', NULL, '2025-02-12 12:22:12');
INSERT INTO `th_report` VALUES (122, 34, 'yy234', NULL, '2025-02-12 12:32:37');
INSERT INTO `th_report` VALUES (123, 33, 'yy234', '98082_【行业】2024全球人形机器人企业画像与能力评估-觅途咨询.pdf', '2025-02-12 12:32:37');
INSERT INTO `th_report` VALUES (124, 32, 'yy234', NULL, '2025-02-12 12:32:37');
INSERT INTO `th_report` VALUES (125, 30, 'yy234', NULL, '2025-02-12 12:32:37');
INSERT INTO `th_report` VALUES (126, 29, 'yy234', NULL, '2025-02-12 12:32:37');
INSERT INTO `th_report` VALUES (127, 27, 'yy234', NULL, '2025-02-12 12:32:37');
INSERT INTO `th_report` VALUES (128, 28, 'yy234', NULL, '2025-02-12 12:32:37');
INSERT INTO `th_report` VALUES (129, 35, 'yy234', NULL, '2025-02-12 12:41:49');
INSERT INTO `th_report` VALUES (130, 35, 'yh123', '38902_QQ图片20230101014430.jpg', '2025-07-08 15:11:51');
INSERT INTO `th_report` VALUES (131, 34, 'yh123', NULL, '2025-07-08 15:11:51');
INSERT INTO `th_report` VALUES (132, 33, 'yh123', NULL, '2025-07-08 15:11:51');
INSERT INTO `th_report` VALUES (133, 32, 'yh123', NULL, '2025-07-08 15:11:51');
INSERT INTO `th_report` VALUES (134, 30, 'yh123', NULL, '2025-07-08 15:11:51');
INSERT INTO `th_report` VALUES (135, 29, 'yh123', NULL, '2025-07-08 15:11:51');
INSERT INTO `th_report` VALUES (136, 27, 'yh123', NULL, '2025-07-08 15:11:51');
INSERT INTO `th_report` VALUES (137, 28, 'yh123', NULL, '2025-07-08 15:11:51');
INSERT INTO `th_report` VALUES (138, 31, 'XJC666', NULL, '2025-07-10 12:08:20');
INSERT INTO `th_report` VALUES (139, 35, 'root', NULL, '2025-07-10 12:38:18');
INSERT INTO `th_report` VALUES (140, 34, 'root', NULL, '2025-07-10 12:38:19');
INSERT INTO `th_report` VALUES (141, 33, 'root', NULL, '2025-07-10 12:38:19');
INSERT INTO `th_report` VALUES (142, 32, 'root', NULL, '2025-07-10 12:38:19');
INSERT INTO `th_report` VALUES (143, 30, 'root', NULL, '2025-07-10 12:38:19');
INSERT INTO `th_report` VALUES (144, 35, 'stu023', '23430_QQ图片20230101014430.jpg', '2025-07-10 12:46:56');
INSERT INTO `th_report` VALUES (145, 34, 'stu023', NULL, '2025-07-10 12:46:56');
INSERT INTO `th_report` VALUES (146, 35, 'li908', NULL, '2025-07-11 12:39:15');
INSERT INTO `th_report` VALUES (147, 35, 'XJC666', NULL, '2025-07-21 11:19:17');
INSERT INTO `th_report` VALUES (148, 34, 'XJC666', NULL, '2025-07-21 11:19:17');
INSERT INTO `th_report` VALUES (149, 33, 'XJC666', NULL, '2025-07-21 11:19:17');
INSERT INTO `th_report` VALUES (150, 32, 'XJC666', NULL, '2025-07-21 11:19:17');
INSERT INTO `th_report` VALUES (151, 30, 'XJC666', NULL, '2025-07-21 11:19:17');
INSERT INTO `th_report` VALUES (152, 29, 'XJC666', NULL, '2025-07-21 11:19:17');
INSERT INTO `th_report` VALUES (153, 27, 'XJC666', NULL, '2025-07-21 11:19:17');
INSERT INTO `th_report` VALUES (154, 28, 'XJC666', NULL, '2025-07-21 11:19:17');

-- ----------------------------
-- Table structure for th_resource
-- ----------------------------
DROP TABLE IF EXISTS `th_resource`;
CREATE TABLE `th_resource`  (
  `resource_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL COMMENT '所在课程号',
  `resource_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `resource_size` double NULL DEFAULT NULL,
  `download_num` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`resource_id`) USING BTREE,
  INDEX `reforcourse`(`course_id` ASC) USING BTREE,
  CONSTRAINT `reforcourse` FOREIGN KEY (`course_id`) REFERENCES `th_course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 348 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_resource
-- ----------------------------
INSERT INTO `th_resource` VALUES (302, 7, '84420_提问的智慧.pdf', 401.90625, 3, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (303, 7, '20012_Maven配置.md', 0.576171875, 14, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (304, 7, '28597_Java注解.md', 4.36328125, 47, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (306, 7, '69798_User.java', 0.810546875, 21, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (315, 7, '70728_Doc文件测试.docx', 16.142578125, 9, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (317, 7, '76458_Excel文件测试.xlsx', 8.974609375, 33, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (320, 7, '93817_无限-头像.png', 100.65625, 8, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (322, 7, '16889_PPT文件测试.pptx', 33.353515625, 20, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (323, 7, '16889_Git学习笔记.md', 10.1337890625, 28, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (324, 7, '16889_雷霆之怒告白神器.vbs', 2.5615234375, 11, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (325, 2, '16890_第02讲+计算机的发展及应用.ppt', 1067, 0, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (326, 2, '16890_第01讲+计算机系统概论.ppt', 715, 0, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (327, 2, '16890_第4讲-4+辅助存储器.ppt', 1007.5, 0, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (328, 2, '16890_第4讲-3+存储器3.ppt', 1320, 0, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (329, 2, '16890_第3讲 数值及运算.pptx', 1965.1826171875, 0, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (330, 2, '16890_第4讲-1+存储器1.ppt', 5091.5, 0, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (331, 2, '16890_第07讲-1+控制单元的功能.ppt', 1485, 0, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (332, 2, '16890_第05讲+指令系统.ppt', 2131, 0, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (333, 2, '16890_第06讲+CPU+的结构和功能.ppt', 4820.5, 0, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (334, 2, '16890_第07讲-2+控制单元的设计.ppt', 2276, 0, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (335, 2, '16890_第00章+上课之前.ppt', 356.5, 0, '2023-12-30 10:28:04');
INSERT INTO `th_resource` VALUES (337, 59, '99899_2.xlsx', 10.978515625, 0, '2024-02-01 09:30:00');
INSERT INTO `th_resource` VALUES (338, 7, '16035_2.xlsx', 10.978515625, 1, '2024-02-25 17:13:36');
INSERT INTO `th_resource` VALUES (339, 7, '52692_2.xlsx', 10.978515625, 1, '2024-03-25 19:09:13');
INSERT INTO `th_resource` VALUES (340, 7, '75694_微信图片_20240805035020.png', 533.837890625, 0, '2024-09-14 14:46:16');
INSERT INTO `th_resource` VALUES (341, 7, '65097_微信图片_20240201105835.jpg', 410.630859375, 0, '2024-09-21 15:37:45');
INSERT INTO `th_resource` VALUES (342, 7, '14118_微信图片_20240907045413.png', 1877.880859375, 1, '2024-09-21 18:53:34');
INSERT INTO `th_resource` VALUES (343, 7, '27051_64333b59597b9e744d38bedc26be622f.jpeg', 154.083984375, 0, '2024-12-27 10:40:27');
INSERT INTO `th_resource` VALUES (344, 7, '14325_【行业】2024全球人形机器人企业画像与能力评估-觅途咨询.pdf', 4730.650390625, 0, '2025-02-12 12:40:15');
INSERT INTO `th_resource` VALUES (345, 7, '20373_后端.rar', 5746.1064453125, 2, '2025-02-12 12:40:21');
INSERT INTO `th_resource` VALUES (346, 7, '25694_计算机网络.pdf', 2708.0029296875, 0, '2025-07-25 03:25:26');
INSERT INTO `th_resource` VALUES (347, 7, '56682_计算机基础知识.txt', 1.22265625, 0, '2025-07-25 03:25:57');

-- ----------------------------
-- Table structure for th_rotation_img
-- ----------------------------
DROP TABLE IF EXISTS `th_rotation_img`;
CREATE TABLE `th_rotation_img`  (
  `img_id` int NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`img_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_rotation_img
-- ----------------------------
INSERT INTO `th_rotation_img` VALUES (1, 'imgs/index/bk1.jpg', '知行合一', '致力于理论与实践的统一', '为天地立心，为生民立命，为往圣继绝学，为万世开太平', '2023-12-29 08:52:52');
INSERT INTO `th_rotation_img` VALUES (2, 'imgs/index/bk2.jpg', '数据结构与算法', '授课老师 图灵 48学时', '数据结构是计算机存储、组织数据的方式', '2023-12-29 08:52:52');
INSERT INTO `th_rotation_img` VALUES (3, 'imgs/index/bk3.jpg', '计算机组成原理', '授课老师 马斯克 76学时', '计算机组成原理主要讨论计算机单机系统的组成原理及其内部工作机制', '2023-12-29 08:52:52');
INSERT INTO `th_rotation_img` VALUES (4, 'imgs/index/bk4.jpg', '微机原理与汇编', '授课老师  64学时', '包括：微型计算机系统概述、微处理器与总线、汇编语言程序设计、半导体存储器、可编程并行数字接口', '2023-12-29 08:52:52');
INSERT INTO `th_rotation_img` VALUES (5, 'imgs/index/bk5.jpg', '操作系统', '授课老师 赵雪梅 48学时', '操作系统是一组主管并控制计算机操作、运用和运行硬件、软件资源和提供公共服务来组织用户交互的相互关联的系统软件程序。', '2023-12-29 08:52:52');
INSERT INTO `th_rotation_img` VALUES (6, 'imgs/index/bk6.jpg', '编译原理', '授课老师 周学渊 48学时', '编译原理即是对高级程序语言进行翻译的一门科学技术', '2023-12-29 08:52:52');

-- ----------------------------
-- Table structure for th_score
-- ----------------------------
DROP TABLE IF EXISTS `th_score`;
CREATE TABLE `th_score`  (
  `score_id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int NULL DEFAULT NULL COMMENT '考试id',
  `user_id` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学号',
  `score` int NULL DEFAULT NULL COMMENT '学生总分',
  `objective_score` int NULL DEFAULT NULL COMMENT '客观题总分',
  `is_checked` bit(1) NULL DEFAULT NULL COMMENT '试卷已判',
  `system_checked` bit(1) NULL DEFAULT NULL COMMENT '系统评分',
  PRIMARY KEY (`score_id`) USING BTREE,
  INDEX `exam_id`(`exam_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `th_score_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `th_exam` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `th_score_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `th_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_score
-- ----------------------------
INSERT INTO `th_score` VALUES (7, 1, 'stu023', 60, 41, b'1', b'1');
INSERT INTO `th_score` VALUES (8, 1, 'stu013', 99, 63, b'1', b'1');
INSERT INTO `th_score` VALUES (9, 1, 'stu033', 86, 57, b'1', b'1');
INSERT INTO `th_score` VALUES (10, 1, 'tea002', 73, 41, b'1', b'1');
INSERT INTO `th_score` VALUES (11, 1, 'tea004', 62, 32, b'1', b'1');
INSERT INTO `th_score` VALUES (12, 1, 'root', 0, 3, b'0', b'1');
INSERT INTO `th_score` VALUES (13, 2, 'root', 0, 5, b'0', b'1');
INSERT INTO `th_score` VALUES (14, 1, 'user1', 0, 3, b'0', b'1');
INSERT INTO `th_score` VALUES (15, 1, 'user2', 0, 9, b'0', b'1');
INSERT INTO `th_score` VALUES (16, 27, 'stu003', 0, 5, b'0', b'1');
INSERT INTO `th_score` VALUES (17, 1, 'sdu001', 23, 6, b'1', b'1');
INSERT INTO `th_score` VALUES (18, 1, 'sdu345', 0, 3, b'0', b'1');
INSERT INTO `th_score` VALUES (19, 1, 'sdu346', 17, 3, b'1', b'1');
INSERT INTO `th_score` VALUES (20, 1, 'sdu788', 15, 3, b'1', b'1');
INSERT INTO `th_score` VALUES (21, 1, 'sdu143', 20, 10, b'1', b'1');
INSERT INTO `th_score` VALUES (22, 1, 'sdu122', 22, 6, b'1', b'1');
INSERT INTO `th_score` VALUES (23, 1, 'stu101', 18, 10, b'1', b'1');
INSERT INTO `th_score` VALUES (24, 1, 'yy234', 24, 14, b'1', b'1');
INSERT INTO `th_score` VALUES (25, 37, 'li908', 0, 5, b'0', b'1');
INSERT INTO `th_score` VALUES (26, 39, 'stu023', 0, 5, b'0', b'1');
INSERT INTO `th_score` VALUES (28, 64, 'XJC666', 0, 5, b'0', b'1');

-- ----------------------------
-- Table structure for th_true_false
-- ----------------------------
DROP TABLE IF EXISTS `th_true_false`;
CREATE TABLE `th_true_false`  (
  `subject_id` int NOT NULL AUTO_INCREMENT COMMENT '判断题id',
  `content` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '题目',
  `answer` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '0-错误 1-正确',
  `analysis` varchar(2047) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '答案解析',
  `score` int NULL DEFAULT NULL,
  PRIMARY KEY (`subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_true_false
-- ----------------------------
INSERT INTO `th_true_false` VALUES (1, '冯·诺依曼计算机中指令和数据均以二进制形式存放在存储器中，CPU区分它们的依据是指令周期的不同阶段', '1', '无解析', 3);
INSERT INTO `th_true_false` VALUES (2, '某计算机的Cache共有16块，采用2路组相联映射方式（即每组2块）。每个主存块大小为32字节，按字节编址。主存129号单元所在主存块应装入到的Cache组号是2', '0', '无解析', 3);
INSERT INTO `th_true_false` VALUES (3, '某机器字长16位，主存按字节编址，转移指令采用相对寻址，由两个字节组成，第一字节为操作码字段，第二字节为相对位移量字段。假定取指令时，每取一个字节PC自动加1。若某转移指令所在主存地址为2000H，相对位移量字段的内容为06H，则该转移指令成功转移后的目标地址是2008H', '1', '无解析', 3);
INSERT INTO `th_true_false` VALUES (5, '<p>星辰是我的好朋友吗？</p>\n', '1', '<p>因为星辰是我好朋友a</p>\n', 5);
INSERT INTO `th_true_false` VALUES (6, '<p>1111111111111</p>\n', '1', '<p>11111</p>\n', 5);
INSERT INTO `th_true_false` VALUES (7, '<p>对吗</p>\n', '1', '', 5);

-- ----------------------------
-- Table structure for th_user
-- ----------------------------
DROP TABLE IF EXISTS `th_user`;
CREATE TABLE `th_user`  (
  `user_id` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id用于登陆',
  `password` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `telephone` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `question1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父亲名称',
  `answer1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '母亲名称',
  `question2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '自定义问题',
  `answer2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '答案',
  `user_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像路径',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of th_user
-- ----------------------------
INSERT INTO `th_user` VALUES ('1111', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', '1111', NULL, NULL, NULL, NULL, NULL, NULL, '/imgs/user/default.jpg');
INSERT INTO `th_user` VALUES ('li908', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'li908', NULL, NULL, NULL, NULL, NULL, NULL, '/files/user/li908/avatar/avatar_2025_02_12202812564.jpg');
INSERT INTO `th_user` VALUES ('root', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', '吴教授', '10000000001', '10000000001@163.com', 'tan45°=', '1', '长风破浪会有时', '直挂云帆济沧海', '/files/user/root/avatar/avatar_2024_07_13142457992.jpg');
INSERT INTO `th_user` VALUES ('root123', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'root123', NULL, NULL, NULL, NULL, NULL, NULL, '/imgs/user/default.jpg');
INSERT INTO `th_user` VALUES ('sdu001', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'sdu001', NULL, NULL, NULL, NULL, NULL, NULL, '/files/user/sdu001/avatar/avatar_2024_03_26030751081.jpg');
INSERT INTO `th_user` VALUES ('sdu122', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'sdu122', '321', '3213', '21', '12', '21', '12', '/files/user/sdu122/avatar/avatar_2024_09_22024458654.png');
INSERT INTO `th_user` VALUES ('sdu143', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'sdu143', '312321', '312312', '1', '1', '1', '1', '/files/user/sdu143/avatar/avatar_2024_09_21232831730.png');
INSERT INTO `th_user` VALUES ('sdu345', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'sdu345', NULL, NULL, NULL, NULL, NULL, NULL, '/files/user/sdu345/avatar/avatar_2024_08_05041612380.jpg');
INSERT INTO `th_user` VALUES ('sdu346', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'sdu346', NULL, NULL, NULL, NULL, NULL, NULL, '/files/user/sdu346/avatar/avatar_2024_08_05042355170.png');
INSERT INTO `th_user` VALUES ('sdu788', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'sdu788', '3123123', '312312312', '1', '2', '2', '3', '/files/user/sdu788/avatar/avatar_2024_09_14103755760.jpg');
INSERT INTO `th_user` VALUES ('sdu7888', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'sdu7888', NULL, NULL, NULL, NULL, NULL, NULL, '/files/user/sdu7888/avatar/avatar_2024_09_21231925616.png');
INSERT INTO `th_user` VALUES ('sdu899', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'sdu899', NULL, NULL, NULL, NULL, NULL, NULL, '/files/user/sdu899/avatar/avatar_2024_09_14103534392.png');
INSERT INTO `th_user` VALUES ('sdu988', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'sdu988', NULL, NULL, NULL, NULL, NULL, NULL, '/imgs/user/default.jpg');
INSERT INTO `th_user` VALUES ('stu003', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', '章北海', '10000000002', '10000000002@163.com', 'tan45°=', '1', '长风破浪会有时', '直挂云帆济沧海', '/files/user/stu003/avatar/avatar_2025_02_12200427793.jpg');
INSERT INTO `th_user` VALUES ('stu013', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', '林诗情', '10000000003', '10000000003@163.com', 'tan45°=', '1', '长风破浪会有时', '直挂云帆济沧海', '/files/user/stu013/avatar/avatar_2022_05_07194806019.jpg');
INSERT INTO `th_user` VALUES ('stu016', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'stu016', NULL, NULL, NULL, NULL, NULL, NULL, '/imgs/user/default.jpg');
INSERT INTO `th_user` VALUES ('stu022', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', '温喆月', '10000000004', '10000000004@163.com', 'tan45°=', '1', '长风破浪会有时', '直挂云帆济沧海', '/imgs/user/default.jpg');
INSERT INTO `th_user` VALUES ('stu023', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', '梁教授', '10000000005', '10000000005@163.com', 'tan45°=', '1', '长风破浪会有时', '直挂云帆济沧海', '/files/user/stu023/avatar/avatar_2024_09_21231751399.png');
INSERT INTO `th_user` VALUES ('stu033', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', '何温祥', '10000000006', '10000000006@163.com', 'tan45°=', '1', '长风破浪会有时', '直挂云帆济沧海', '/imgs/user/default.jpg');
INSERT INTO `th_user` VALUES ('stu043', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', '张玉婷', '10000000007', '10000000007@163.com', 'tan45°=', '1', '长风破浪会有时', '直挂云帆济沧海', '/files/user/stu033/avatar/cover_2022_04_16113139130.png');
INSERT INTO `th_user` VALUES ('stu101', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'stu101', '312321', '3123123', '3213123', '123123', '12312', '3123', '/files/user/stu101/avatar/avatar_2024_12_27183354551.jpg');
INSERT INTO `th_user` VALUES ('stu567', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'stu567', NULL, NULL, NULL, NULL, NULL, NULL, '/imgs/user/default.jpg');
INSERT INTO `th_user` VALUES ('tea001', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', '李定波', '10000000008', '10000000008@163.com', 'tan45°=', '1', '长风破浪会有时', '直挂云帆济沧海', '/files/user/tea001/avatar/avatar_2022_05_02104618854.jpg');
INSERT INTO `th_user` VALUES ('tea002', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', '张禹乐', '10000000009', '10000000009@163.com', 'tan45°=', '1', '长风破浪会有时', '直挂云帆济沧海', '/imgs/user/default.jpg');
INSERT INTO `th_user` VALUES ('tea003', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', '鱼智慧', '10000000010', '10000000010@163.com', 'tan45°=', '1', '长风破浪会有时', '直挂云帆济沧海', '/files/user/tea003/avatar/avatar_2022_05_10155314836.jpg');
INSERT INTO `th_user` VALUES ('tea004', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', '陈泓长', '10000000011', '10000000011@163.com', 'tan45°=', '1', '长风破浪会有时', '直挂云帆济沧海', '/files/user/tea004/avatar/avatar_2022_05_10154440583.jpg');
INSERT INTO `th_user` VALUES ('user1', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'user1', '11111111111', '11111', '1', '1', '1', '1', '/imgs/user/default.jpg');
INSERT INTO `th_user` VALUES ('user2', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'user2', NULL, NULL, NULL, NULL, NULL, NULL, '/files/user/user2/avatar/avatar_2024_02_01172328767.png');
INSERT INTO `th_user` VALUES ('XJC666', '66abacf99e8f188a5e7a7a882bdf9b3f16349f2e33c3715de40c35119770fe74', 'XJC666', NULL, NULL, NULL, NULL, NULL, NULL, '/imgs/user/default.jpg');
INSERT INTO `th_user` VALUES ('yh123', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'yh123', NULL, NULL, NULL, NULL, NULL, NULL, '/imgs/user/default.jpg');
INSERT INTO `th_user` VALUES ('yy234', '299bbc6453f96d5cb3e91f389a2df191748fb32623c293eeabec236f3184c468', 'yy234', NULL, NULL, NULL, NULL, NULL, NULL, '/files/user/yy234/avatar/avatar_2025_02_12203015714.jpg');

-- ----------------------------
-- View structure for th_course_user_view
-- ----------------------------
DROP VIEW IF EXISTS `th_course_user_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `th_course_user_view` AS select `th_course_user`.`id` AS `id`,`th_course_user`.`course_id` AS `course_id`,`th_course_user`.`user_id` AS `user_id`,`th_course_user`.`res_dl_num` AS `res_dl_num`,`th_course_user`.`discussion_create_num` AS `discussion_create_num`,`th_course_user`.`chapter_view_time` AS `chapter_view_time`,`th_course_user`.`chapter_view_num` AS `chapter_view_num`,`th_course_user`.`reply_num` AS `reply_num`,`th_user`.`username` AS `username`,`th_user`.`user_avatar` AS `user_avatar`,`th_course_user`.`create_time` AS `create_time` from (`th_course_user` join `th_user` on((`th_course_user`.`user_id` = `th_user`.`user_id`)));

-- ----------------------------
-- View structure for th_course_view
-- ----------------------------
DROP VIEW IF EXISTS `th_course_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `th_course_view` AS select `th_course`.`course_id` AS `course_id`,`th_course`.`course_name` AS `course_name`,`th_course`.`user_id` AS `user_id`,`th_course`.`is_start` AS `is_start`,`th_course`.`is_public` AS `is_public`,`th_course`.`cover_img` AS `cover_img`,`th_course`.`describes` AS `describes`,`th_course`.`create_time` AS `create_time`,`th_user`.`username` AS `username` from (`th_course` join `th_user` on((`th_course`.`user_id` = `th_user`.`user_id`)));

-- ----------------------------
-- View structure for th_discussion_view
-- ----------------------------
DROP VIEW IF EXISTS `th_discussion_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `th_discussion_view` AS select `th_discussion`.`discussion_id` AS `discussion_id`,`th_discussion`.`course_id` AS `course_id`,`th_discussion`.`user_id` AS `user_id`,`th_discussion`.`title` AS `title`,`th_discussion`.`content` AS `content`,`th_discussion`.`hits` AS `hits`,`th_discussion`.`likes` AS `likes`,`th_discussion`.`create_time` AS `create_time`,`th_user`.`username` AS `username`,`th_user`.`user_avatar` AS `user_avatar` from (`th_discussion` join `th_user` on((`th_discussion`.`user_id` = `th_user`.`user_id`)));

-- ----------------------------
-- View structure for th_notice_view
-- ----------------------------
DROP VIEW IF EXISTS `th_notice_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `th_notice_view` AS select `th_notice`.`notice_id` AS `notice_id`,`th_notice`.`course_id` AS `course_id`,`th_notice`.`title` AS `title`,`th_notice`.`content` AS `content`,`th_notice`.`hits` AS `hits`,`th_notice`.`create_time` AS `create_time`,`th_user`.`username` AS `username` from ((`th_notice` join `th_course` on((`th_notice`.`course_id` = `th_course`.`course_id`))) join `th_user` on((`th_course`.`user_id` = `th_user`.`user_id`)));

-- ----------------------------
-- View structure for th_reply_view
-- ----------------------------
DROP VIEW IF EXISTS `th_reply_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `th_reply_view` AS select `th_reply`.`reply_id` AS `reply_id`,`th_reply`.`discussion_id` AS `discussion_id`,`th_reply`.`from_uid` AS `from_uid`,`th_reply`.`to_uid` AS `to_uid`,`th_reply`.`content` AS `content`,`th_reply`.`create_time` AS `create_time`,`uf`.`username` AS `from_username`,`ut`.`username` AS `to_username`,`uf`.`user_avatar` AS `from_user_avatar`,`th_reply`.`chapter_id` AS `chapter_id` from ((`th_reply` left join `th_user` `uf` on((`uf`.`user_id` = `th_reply`.`from_uid`))) left join `th_user` `ut` on((`ut`.`user_id` = `th_reply`.`to_uid`)));

-- ----------------------------
-- View structure for th_test
-- ----------------------------
DROP VIEW IF EXISTS `th_test`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `th_test` AS select `th_course`.`course_id` AS `course_id`,`th_course`.`course_name` AS `course_name`,`th_course`.`user_id` AS `user_id`,`th_course`.`is_start` AS `is_start`,`th_course`.`is_public` AS `is_public`,`th_course`.`cover_img` AS `cover_img`,`th_course`.`describes` AS `describes`,`th_course`.`create_time` AS `create_time`,`th_user`.`username` AS `username` from (`th_course` join `th_user` on((`th_course`.`user_id` = `th_user`.`user_id`)));

SET FOREIGN_KEY_CHECKS = 1;
