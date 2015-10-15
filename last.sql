/*
Navicat MySQL Data Transfer

Source Server         : 本机Mysql
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : isearch2

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2015-08-25 21:57:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `analyticstoken`
-- ----------------------------
DROP TABLE IF EXISTS `analyticstoken`;
CREATE TABLE `analyticstoken` (
  `USERUUID` varchar(255) COLLATE utf8_bin NOT NULL,
  `RANDOMUUID` varchar(255) COLLATE utf8_bin NOT NULL,
  `TOKENWORD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIMES` int(11) DEFAULT NULL,
  PRIMARY KEY (`RANDOMUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of analyticstoken
-- ----------------------------
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f506e4c014f5072ae81000d', 'code', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f5557e9014f555f0ca70006', '各国', '2');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f5557e9014f555f0cbb0007', '共产党', '2');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f55dd34014f55de9a0a0004', '六级', '3');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f55dd34014f55de9a200005', '成绩', '3');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f55dd34014f55df2dc80009', '词频', '5');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f55dd34014f55df2de7000a', '统计', '5');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f58f3d8014f58f4f6ee0003', 'google', '2');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f58f3d8014f58f5c82f0007', '指针', '3');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f58ff3c014f58ffa1740003', '函数', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cb4f44b56d014f44b5da070001', '上海', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cb4f44b56d014f44b5da4b0002', '大学', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cb4f44b56d014f44b5fb940004', '法律', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f4882ee014f4886d006000e', '政治', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f48d7890a0006', '菊花', '2');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cb4f48cb76014f48f4068b000d', '法律', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cb4f48cb76014f49046bc70011', '法律', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f528b0d880012', '企鹅', '3');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f52914144001a', '动物', '11');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cb4f52ef73014f52f05d2e0001', '法律', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cb4f52ef73014f52f08f4f0003', '法律', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f538dce014f5540abf50010', '花', '2');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cb4f538dce014f554f75eb001c', '法律', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cb4f538dce014f554f76c6001e', '法律', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f555b2dc6000a', '沙漠', '7');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f556511d1002d', '郁金香', '2');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cb4f557608014f557629c20001', '法律', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55fd6a650033', '水母', '3');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f633628c50033', '考', '2');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f633628cd0034', '拉', '2');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f89692d0011', '音乐', '107');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8a06650014', '用作', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8a06750015', '壁纸', '5');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8a46ce0018', '法律', '43');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8a7138001b', '艺术', '45');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8a7a2d001d', '分类法', '2');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8b90f7001f', 'c', '143');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8b91070020', '语言', '134');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8ba4770022', '上海', '3');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8ba4870023', '大学', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8bc0500025', '婚姻法', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8be9df0027', '滕', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8be9df0028', '怡', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8be9ef0029', '飞', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8c0599002b', '张', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8c0599002c', '明', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8c05a9002d', '虎', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1fc9bb770039', '算法', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f1f856f014f206b6139003e', '法律', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f1f856f014f20d43f7c0054', '法律', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f45de156c0007', 'c', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f45de15790008', '语言', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f45f7ebda000a', 'c', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f45f7ebed000b', '语言', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f45f886d8000d', 'c', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f45f886e9000e', '语言', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f45fb451a0010', 'c', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f45fb45290011', '语言', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f4636d3f50013', 'c', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f4636d4050014', '语言', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f4989cee80036', '法律', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f498a8c300038', 'c', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f498a8c5f0039', '语言', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f498de3af003b', 'c', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f498de3bf003c', '语言', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f4e0335dd004a', 'c', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f4e033608004b', '语言', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f4e0336a1004e', 'c', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f4e0336e0004f', '语言', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f4e037ea50052', 'c', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f4e037ebe0053', '语言', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f4e05186f0057', 'c', '1');
INSERT INTO `analyticstoken` VALUES ('', '8a8104cc4f45d73f014f4ed1d8ac0075', 'sfsd', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ada12da4f343ba3014f3457522c0005', '的', '3');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ada12da4f34752c014f3477bae30008', 'le', '1');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8ada62824f1056d0014f1058d4440006', 'c', '42');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8ada62824f1056d0014f1058d4580007', '语言', '23');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8ada62824f105af5014f106e3528000a', '算法', '8');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8ada62824f105af5014f106e353a000b', '设计', '6');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8ada62824f105af5014f10755718000e', '分析', '5');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8ada62824f105af5014f10776cee0011', '雨', '1');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8ada62824f105af5014f10776d000012', '涵', '1');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8ada62824f105af5014f107c2e610018', '上海', '5');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8ada62824f105af5014f107dd7e0001b', '与', '3');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8ada62824f105af5014f10d7a0540021', '算', '2');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8ada62824f105af5014f10d7a0670022', '噶', '2');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8ada62824f105af5014f10d82cb90025', '哑巴', '1');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8ada62824f11727e014f1173cba90009', '法律', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8adab44e4f352329014f3524ce3f0005', '了', '1');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8adac1864f173ebb014f174457530006', '的', '8');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8adac1864f174925014f17542b64001b', '大学', '1');
INSERT INTO `analyticstoken` VALUES ('5e1da71cbbfc4c16a6cb49ddf110a2ab', '8adac1864f174925014f177b43ef0036', '才', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ae3cf894f4f2cb4014f4f31d5020006', '动态', '1');
INSERT INTO `analyticstoken` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ae3cf894f4f2cb4014f4f31d5180007', '规划', '1');

-- ----------------------------
-- Table structure for `history`
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `USERUUID` varchar(255) COLLATE utf8_bin NOT NULL,
  `RANDOMUUID` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `SEARCHDATE` datetime DEFAULT NULL,
  `IP` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CONTENTS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ADDRESS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROVINCE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `X` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Y` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`RANDOMUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f45dce1014f45e29cd00004', '2015-08-19 20:15:23', '0:0:0:0:0:0:0:1', 'C ', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f45dce1014f45e2c6910005', '2015-08-19 20:15:34', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f45dce1014f45e2f9090006', '2015-08-19 20:15:47', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f45dce1014f45e2f9150007', '2015-08-19 20:15:47', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f4daa09014f4dabe6770004', '2015-08-21 08:32:35', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f4daa09014f4dac28680006', '2015-08-21 08:32:52', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f4daa09014f4dac90c60007', '2015-08-21 08:33:19', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f4daf4a014f4db049a20003', '2015-08-21 08:37:23', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f4daf4a014f4db0c5f10005', '2015-08-21 08:37:55', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f4dbe38014f4dbf15210003', '2015-08-21 08:53:33', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f4dbe38014f4dbffaaa0004', '2015-08-21 08:54:31', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f4dda41014f4e0166690001', '2015-08-21 10:05:59', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f4dda41014f4e03aa5b0004', '2015-08-21 10:08:27', '0:0:0:0:0:0:0:1', 'c ', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f4dda41014f4e03ec190005', '2015-08-21 10:08:44', '0:0:0:0:0:0:0:1', 'c ', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f5009e2014f500b50820004', '2015-08-21 19:36:03', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f5009e2014f501a4b600005', '2015-08-21 19:52:25', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f5009e2014f501d861b0006', '2015-08-21 19:55:56', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f5009e2014f5022a6280009', '2015-08-21 20:01:32', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f5009e2014f5022e027000a', '2015-08-21 20:01:47', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f506e4c014f506fa64b0003', '2015-08-21 21:25:38', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f506e4c014f507034520008', '2015-08-21 21:26:15', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f506e4c014f50707bc6000a', '2015-08-21 21:26:33', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f506e4c014f5072ae56000c', '2015-08-21 21:28:57', '0:0:0:0:0:0:0:1', 'code', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f506e4c014f50732104000e', '2015-08-21 21:29:26', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f506e4c014f5074d3090010', '2015-08-21 21:31:18', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f507781014f507aba3c0001', '2015-08-21 21:37:44', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f507781014f507b7ffe0003', '2015-08-21 21:38:35', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f507781014f507dc29f0004', '2015-08-21 21:41:03', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f507781014f507e78780009', '2015-08-21 21:41:50', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f507781014f507edf3a000c', '2015-08-21 21:42:16', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f507781014f507f6c3f000d', '2015-08-21 21:42:52', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f507781014f507ff9280010', '2015-08-21 21:43:28', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f507781014f508041fe0012', '2015-08-21 21:43:47', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f507781014f508070c00013', '2015-08-21 21:43:59', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f507781014f50815e5c0014', '2015-08-21 21:44:59', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f5557e9014f5559076a0003', '2015-08-22 20:19:02', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f5557e9014f5559f73d0004', '2015-08-22 20:20:03', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f5557e9014f555f0c9b0005', '2015-08-22 20:25:37', '0:0:0:0:0:0:0:1', '各国共产党', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f5557e9014f5563bf890008', '2015-08-22 20:30:44', '0:0:0:0:0:0:0:1', '各国共产党', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f5567e4014f5568dbed0003', '2015-08-22 20:36:19', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f5567e4014f5569a9da0004', '2015-08-22 20:37:12', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f55dd34014f55de99c60003', '2015-08-22 22:44:56', '0:0:0:0:0:0:0:1', '六级成绩', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f55dd34014f55dee8200006', '2015-08-22 22:45:16', '0:0:0:0:0:0:0:1', '六级成绩', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f55dd34014f55def72e0007', '2015-08-22 22:45:20', '0:0:0:0:0:0:0:1', '六级成绩', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f55dd34014f55df2dbc0008', '2015-08-22 22:45:34', '0:0:0:0:0:0:0:1', '词频统计', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f55dd34014f55df5e4d000b', '2015-08-22 22:45:46', '0:0:0:0:0:0:0:1', '词频统计', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f55dd34014f55ec9f18000d', '2015-08-22 23:00:15', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f58f3d8014f58f4f6de0002', '2015-08-23 13:08:13', '0:0:0:0:0:0:0:1', 'google', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f58f3d8014f58f514f70004', '2015-08-23 13:08:21', '0:0:0:0:0:0:0:1', 'google', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f58f3d8014f58f5c8290006', '2015-08-23 13:09:07', '0:0:0:0:0:0:0:1', '指针', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f58f3d8014f58f6a45d0008', '2015-08-23 13:10:03', '0:0:0:0:0:0:0:1', '指针', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f58f3d8014f58f6f0e00009', '2015-08-23 13:10:23', '0:0:0:0:0:0:0:1', '指针', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f58ff3c014f58ffa1480002', '2015-08-23 13:19:52', '0:0:0:0:0:0:0:1', '函数', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f58ff3c014f5900875a0006', '2015-08-23 13:20:51', '0:0:0:0:0:0:0:1', '词频统计', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f58ff3c014f5900b97c0007', '2015-08-23 13:21:04', '0:0:0:0:0:0:0:1', '词频统计', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '297e511f4f58ff3c014f590119550008', '2015-08-23 13:21:28', '0:0:0:0:0:0:0:1', '词频统计', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f4490ec014f4493ddef000b', '2015-08-19 14:09:43', '10.90.9.105', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f4490ec014f449470fd000c', '2015-08-19 14:10:23', '10.90.9.105', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f4490ec014f4494b737000d', '2015-08-19 14:10:41', '10.90.9.105', '的', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f4490ec014f449525da000e', '2015-08-19 14:11:09', '10.90.9.105', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f4490ec014f44969d65000f', '2015-08-19 14:12:45', '10.90.9.105', '上海', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f4490ec014f44973fff0010', '2015-08-19 14:13:24', '10.90.9.105', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f44b56d014f44b5d9a40000', '2015-08-19 14:46:52', '0:0:0:0:0:0:0:1', '上海大学', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f44b56d014f44b5fb8f0003', '2015-08-19 14:47:01', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f44b56d014f44b78bfc0006', '2015-08-19 14:48:41', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f44b839014f44ba7e640003', '2015-08-19 14:51:57', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f44b839014f44bd8b440005', '2015-08-19 14:55:17', '58.198.123.120', 'C语言', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f44b839014f44c02b7e0006', '2015-08-19 14:58:09', '58.198.123.120', '法律', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f4882ee014f48863d8a000a', '2015-08-20 08:33:19', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f4882ee014f4886c3f9000c', '2015-08-20 08:33:56', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f4882ee014f4886d002000d', '2015-08-20 08:33:59', '0:0:0:0:0:0:0:1', '政治_法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f4882ee014f48a357a20014', '2015-08-20 09:05:08', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f4882ee014f48a400d60016', '2015-08-20 09:05:52', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f4882ee014f48a5c3170019', '2015-08-20 09:07:47', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f48d5ed0f0001', '2015-08-20 10:00:23', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f48d68c310003', '2015-08-20 10:01:04', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f48d789060005', '2015-08-20 10:02:09', '0:0:0:0:0:0:0:1', '菊花', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f48d7c31f0008', '2015-08-20 10:02:24', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f48ebe8040009', '2015-08-20 10:24:24', '0:0:0:0:0:0:0:1', '法律 ', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f48f02d2d000a', '2015-08-20 10:29:04', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f48f0b909000b', '2015-08-20 10:29:39', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f48cb76014f48f40679000c', '2015-08-20 10:33:16', '10.99.79.9', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f4902c61a000f', '2015-08-20 10:49:23', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f48cb76014f49046bc20010', '2015-08-20 10:51:11', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f48cb76014f4904bf100012', '2015-08-20 10:51:32', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f48cb76014f4904d4340013', '2015-08-20 10:51:37', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f48cb76014f490511b00014', '2015-08-20 10:51:53', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f48cb76014f49051abc0015', '2015-08-20 10:51:55', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f49066fc00018', '2015-08-20 10:53:23', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f49076cc6001c', '2015-08-20 10:54:27', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f48cb76014f49bcf602001d', '2015-08-20 14:12:45', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f48cb76014f49be0ba6001e', '2015-08-20 14:13:55', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f48cb76014f49be0bdc001f', '2015-08-20 14:13:54', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f49bee0a10021', '2015-08-20 14:14:50', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f49e468950023', '2015-08-20 14:55:50', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f48cb76014f4a525c880026', '2015-08-20 16:55:56', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f48cb76014f4a525e7d0027', '2015-08-20 16:55:56', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f4a5321ad0029', '2015-08-20 16:56:46', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f4a5373a7002a', '2015-08-20 16:57:07', '0:0:0:0:0:0:0:1', '菊花', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f4da17b2c002d', '2015-08-21 08:21:13', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f48cb76014f4da1e1700032', '2015-08-21 08:21:39', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f48cb76014f4da227c00033', '2015-08-21 08:21:57', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f50614a740035', '2015-08-21 21:09:57', '10.90.120.90', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f48cb76014f50928fbd0036', '2015-08-21 22:03:44', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f48cb76014f5092916a0037', '2015-08-21 22:03:47', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f48cb76014f5093d3d0003a', '2015-08-21 22:05:09', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f509890f70001', '2015-08-21 22:10:20', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f5098b6ee0003', '2015-08-21 22:10:30', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f50991cd90005', '2015-08-21 22:10:56', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f509928140006', '2015-08-21 22:10:59', '0:0:0:0:0:0:0:1', 'Cè¯­è¨', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f50997dbc0007', '2015-08-21 22:11:21', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f50a902060008', '2015-08-21 22:28:17', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f50a90d6a0009', '2015-08-21 22:28:20', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f50a91460000a', '2015-08-21 22:28:22', '0:0:0:0:0:0:0:1', '分类法', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f50a95b22000b', '2015-08-21 22:28:40', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f528a289c000f', '2015-08-22 07:13:50', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f528b0d840011', '2015-08-22 07:14:49', '0:0:0:0:0:0:0:1', '企鹅', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f528f8b370014', '2015-08-22 07:19:43', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f528fc8ad0016', '2015-08-22 07:19:59', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f529080e00017', '2015-08-22 07:20:43', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f529141410019', '2015-08-22 07:21:35', '0:0:0:0:0:0:0:1', '动物', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f5291f346001b', '2015-08-22 07:22:21', '0:0:0:0:0:0:0:1', '动物', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f52e76241001d', '2015-08-22 08:55:40', '10.90.141.81', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f52e76d49001e', '2015-08-22 08:55:43', '10.90.141.81', 'Cè¯­è¨', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f52e81154001f', '2015-08-22 08:56:25', '10.90.141.81', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f509842014f52e81d550020', '2015-08-22 08:56:28', '10.90.141.81', 'æ³å¾', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f52edd6014f52ee455e0001', '2015-08-22 09:03:11', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f52edd6014f52ee5b160002', '2015-08-22 09:03:17', '0:0:0:0:0:0:0:1', 'æ³å¾', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f52edd6014f52eecdf70003', '2015-08-22 09:03:46', '0:0:0:0:0:0:0:1', 'æ³å¾', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f52ef73014f52f05c9a0000', '2015-08-22 09:05:28', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f52ef73014f52f08f440002', '2015-08-22 09:05:41', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f52ef73014f52f1da440005', '2015-08-22 09:07:06', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f52ef73014f52f2b9a10007', '2015-08-22 09:08:03', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f52ef73014f52f2c6df0008', '2015-08-22 09:08:06', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f530da8014f5346d1000001', '2015-08-22 10:39:53', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f530da8014f5346ed990002', '2015-08-22 10:40:01', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f538dce014f5397a8240001', '2015-08-22 12:08:12', '10.99.79.9', ' 音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f538dce014f5399df970004', '2015-08-22 12:10:37', '10.99.79.9', ' 音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f538dce014f53dc9f9f0005', '2015-08-22 13:23:31', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f538dce014f53dca1de0006', '2015-08-22 13:23:32', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f538dce014f53dcb1290007', '2015-08-22 13:23:36', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f538dce014f553f61b90009', '2015-08-22 19:51:00', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f538dce014f553fa1e3000b', '2015-08-22 19:51:18', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f538dce014f553ffefe000d', '2015-08-22 19:51:42', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f538dce014f5540abf1000f', '2015-08-22 19:52:26', '0:0:0:0:0:0:0:1', '花', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f538dce014f55410c010012', '2015-08-22 19:52:50', '0:0:0:0:0:0:0:1', '花', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f538dce014f55488f850013', '2015-08-22 20:01:03', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f538dce014f5548bcf10015', '2015-08-22 20:01:14', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f538dce014f5548c3590016', '2015-08-22 20:01:16', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f538dce014f55491a1e0017', '2015-08-22 20:01:38', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f538dce014f5549535a0018', '2015-08-22 20:01:53', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f538dce014f554b65b20019', '2015-08-22 20:04:09', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f538dce014f554cf168001a', '2015-08-22 20:05:50', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f538dce014f554f75eb001b', '2015-08-22 20:08:35', '10.90.195.86', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f538dce014f554f76b6001d', '2015-08-22 20:08:35', '10.90.195.86', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f538dce014f5550ca9f0020', '2015-08-22 20:10:02', '10.90.195.86', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555157014f555185e20000', '2015-08-22 20:10:50', '10.90.195.86', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555157014f5551def70001', '2015-08-22 20:11:13', '10.90.195.86', '音乐‘', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555157014f5551ecfb0002', '2015-08-22 20:11:17', '10.90.195.86', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f5554b7220001', '2015-08-22 20:14:19', '10.90.195.86', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555441014f55596aae0002', '2015-08-22 20:19:27', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555441014f5559fd110003', '2015-08-22 20:20:05', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555441014f555a37ab0005', '2015-08-22 20:20:20', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f555aa3f80007', '2015-08-22 20:20:48', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f555b2dc00009', '2015-08-22 20:21:23', '0:0:0:0:0:0:0:1', '沙漠', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f555b75a9000b', '2015-08-22 20:21:41', '0:0:0:0:0:0:0:1', '沙漠', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f555d3d7f000c', '2015-08-22 20:23:38', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f555d6670000e', '2015-08-22 20:23:49', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f555db1ea000f', '2015-08-22 20:24:08', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f555de32a0011', '2015-08-22 20:24:20', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555441014f555eb4210012', '2015-08-22 20:25:14', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555441014f555ee9440014', '2015-08-22 20:25:28', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555441014f555fb5940015', '2015-08-22 20:26:20', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555441014f555fe1220017', '2015-08-22 20:26:31', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555441014f5560af360019', '2015-08-22 20:27:24', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555441014f5560dd53001b', '2015-08-22 20:27:36', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f55614838001d', '2015-08-22 20:28:03', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555441014f55621008001e', '2015-08-22 20:28:53', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555441014f55626b83001f', '2015-08-22 20:29:18', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555441014f55629cea0021', '2015-08-22 20:29:30', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f5562f9620023', '2015-08-22 20:29:54', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f5562ffae0024', '2015-08-22 20:29:55', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555441014f556385960025', '2015-08-22 20:30:30', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555441014f5563e63e0026', '2015-08-22 20:30:54', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f555441014f55641bc90028', '2015-08-22 20:31:08', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f556474a7002a', '2015-08-22 20:31:31', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f556511ce002c', '2015-08-22 20:32:11', '0:0:0:0:0:0:0:1', '郁金香', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f555441014f55655cae002e', '2015-08-22 20:32:30', '0:0:0:0:0:0:0:1', '郁金香', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f5576295c0000', '2015-08-22 20:50:51', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f557fd6880003', '2015-08-22 21:01:25', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f558005480005', '2015-08-22 21:01:37', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f558088ed0006', '2015-08-22 21:02:11', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f5580bb3f0008', '2015-08-22 21:02:24', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f557608014f55810b77000a', '2015-08-22 21:02:45', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f558234fa000c', '2015-08-22 21:04:01', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f558264a7000e', '2015-08-22 21:04:13', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f5582fc7e0010', '2015-08-22 21:04:52', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f558359f00012', '2015-08-22 21:05:16', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f5583b5fe0013', '2015-08-22 21:05:39', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f5583b64c0014', '2015-08-22 21:05:39', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f5583e59b0016', '2015-08-22 21:05:51', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f557608014f5584480e0018', '2015-08-22 21:06:17', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f5584fe300019', '2015-08-22 21:07:03', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f55852af2001b', '2015-08-22 21:07:15', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f557608014f558571b2001d', '2015-08-22 21:07:33', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f5585e75c001e', '2015-08-22 21:08:03', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f558611cb0020', '2015-08-22 21:08:14', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f5586f28a0022', '2015-08-22 21:09:11', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f5587419c0023', '2015-08-22 21:09:32', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f558742310024', '2015-08-22 21:09:32', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f55876c7a0026', '2015-08-22 21:09:43', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f5588ca8a0028', '2015-08-22 21:11:12', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f5588f7b9002a', '2015-08-22 21:11:24', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f558a1081002c', '2015-08-22 21:12:36', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f558a67b0002d', '2015-08-22 21:12:58', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f558a9722002f', '2015-08-22 21:13:10', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f557608014f558b4d1a0031', '2015-08-22 21:13:57', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f557608014f558b795e0033', '2015-08-22 21:14:08', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f55a95b650035', '2015-08-22 21:46:46', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f55a984940037', '2015-08-22 21:46:57', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f55bf73420039', '2015-08-22 22:10:54', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f55bfa6db003b', '2015-08-22 22:11:08', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f557608014f55bff923003d', '2015-08-22 22:11:29', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f55c1030b003e', '2015-08-22 22:12:37', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f55c134e00040', '2015-08-22 22:12:49', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f55c36c720041', '2015-08-22 22:15:15', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f557608014f55c39d7e0043', '2015-08-22 22:15:27', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f557608014f55c3e96c0045', '2015-08-22 22:15:47', '0:0:0:0:0:0:0:1', '法律', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f557608014f55c46ed10047', '2015-08-22 22:16:21', '0:0:0:0:0:0:0:1', '动物', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f557608014f55c53f880048', '2015-08-22 22:17:14', '0:0:0:0:0:0:0:1', '动物', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f557608014f55ce3b870049', '2015-08-22 22:27:03', '0:0:0:0:0:0:0:1', '动物', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f557608014f55d00b65004a', '2015-08-22 22:29:02', '0:0:0:0:0:0:0:1', '动物', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f557608014f55d22930004c', '2015-08-22 22:31:21', '10.90.195.86', '动物', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55e85ff90014', '2015-08-22 22:55:36', '0:0:0:0:0:0:0:1', '音乐 ', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55e86c750015', '2015-08-22 22:55:40', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55e93e440018', '2015-08-22 22:56:33', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55ee37830019', '2015-08-22 23:01:59', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55ee7006001b', '2015-08-22 23:02:14', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f55e4ba014f55ef4f9a001c', '2015-08-22 23:03:11', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f55e4ba014f55efed62001e', '2015-08-22 23:03:51', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f55e4ba014f55f01b1c0020', '2015-08-22 23:04:03', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f55e4ba014f55f0f57c0021', '2015-08-22 23:04:59', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f55e4ba014f55f121d50023', '2015-08-22 23:05:10', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55f90c890025', '2015-08-22 23:13:48', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55f90c890026', '2015-08-22 23:13:49', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55f90c940027', '2015-08-22 23:13:45', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55f90d050028', '2015-08-22 23:13:49', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55f92b800029', '2015-08-22 23:13:57', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55fa20ba002b', '2015-08-22 23:15:00', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55fa465e002c', '2015-08-22 23:15:10', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55fc02ce002d', '2015-08-22 23:17:03', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55fc2caf002e', '2015-08-22 23:17:14', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55fccc88002f', '2015-08-22 23:17:55', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55fcf54f0030', '2015-08-22 23:18:05', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f55fd6a610032', '2015-08-22 23:18:35', '0:0:0:0:0:0:0:1', '水母', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f5602aa420034', '2015-08-22 23:24:19', '0:0:0:0:0:0:0:1', '水母', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f5602aead0035', '2015-08-22 23:24:20', '0:0:0:0:0:0:0:1', '水母', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f560702010036', '2015-08-22 23:29:04', '0:0:0:0:0:0:0:1', '水母', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f588d7c260039', '2015-08-23 11:15:11', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f5d711c64003c', '2015-08-24 10:02:18', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f5d729cbd003d', '2015-08-24 10:03:56', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f55e4ba014f5d760ebd003e', '2015-08-24 10:07:42', '0:0:0:0:0:0:0:1', '动物', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f62e16f014f62e1e9f70001', '2015-08-25 11:23:37', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f62e16f014f62e5b4680002', '2015-08-25 11:27:45', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f62e16f014f63158e4a0004', '2015-08-25 12:20:01', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f62e16f014f6315e73b0005', '2015-08-25 12:20:24', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f62e16f014f631645a80007', '2015-08-25 12:20:48', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f62e16f014f631663600008', '2015-08-25 12:20:56', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f62e16f014f6316648c0009', '2015-08-25 12:20:56', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f62e16f014f631712c6000b', '2015-08-25 12:21:41', '0:0:0:0:0:0:0:1', '动物', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f62e16f014f63177d29000c', '2015-08-25 12:22:08', '0:0:0:0:0:0:0:1', '动物', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f62e16f014f631781f3000d', '2015-08-25 12:22:09', '0:0:0:0:0:0:0:1', '动物', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f62e16f014f631e24a9000e', '2015-08-25 12:29:24', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f6324863e0006', '2015-08-25 12:36:22', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f632487b50007', '2015-08-25 12:36:23', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f632761b20019', '2015-08-25 12:39:29', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f632787e9001b', '2015-08-25 12:39:39', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f6329e846001c', '2015-08-25 12:42:13', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f632110014f632a73f0001e', '2015-08-25 12:42:51', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f632110014f632aeb2d001f', '2015-08-25 12:43:21', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f632110014f632aebd90020', '2015-08-25 12:43:21', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f632110014f632b1e080022', '2015-08-25 12:43:34', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f632b69dd0024', '2015-08-25 12:43:54', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f632c052c0026', '2015-08-25 12:44:33', '0:0:0:0:0:0:0:1', '沙漠', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f632c5a940027', '2015-08-25 12:44:55', '0:0:0:0:0:0:0:1', '沙漠', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f632c61d20028', '2015-08-25 12:44:57', '0:0:0:0:0:0:0:1', '沙漠', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f632110014f632cf0800029', '2015-08-25 12:45:34', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f632110014f632d1ea3002a', '2015-08-25 12:45:45', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f632110014f632d6f3e002c', '2015-08-25 12:46:06', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f632110014f632d9f3b002e', '2015-08-25 12:46:18', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f632de73a0030', '2015-08-25 12:46:37', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f633628c20032', '2015-08-25 12:55:38', '0:0:0:0:0:0:0:1', '考拉', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f6336802c0035', '2015-08-25 12:56:00', '0:0:0:0:0:0:0:1', '考拉', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f633850c80036', '2015-08-25 12:57:59', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f63393ac80038', '2015-08-25 12:58:59', '0:0:0:0:0:0:0:1', '企鹅', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f63397c890039', '2015-08-25 12:59:16', '0:0:0:0:0:0:0:1', '企鹅', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f633c9109003a', '2015-08-25 13:02:38', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f633cbf0f003c', '2015-08-25 13:02:50', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f632110014f633d3b0e003d', '2015-08-25 13:03:21', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f632110014f633d689d003f', '2015-08-25 13:03:33', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f633da9ba0041', '2015-08-25 13:03:50', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f632110014f633e67430042', '2015-08-25 13:04:36', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f632110014f633e684c0043', '2015-08-25 13:04:38', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f632110014f633eac580044', '2015-08-25 13:04:56', '0:0:0:0:0:0:0:1', '音乐 ', null, null, null, null);
INSERT INTO `history` VALUES ('', '8a8104cb4f632110014f633ed5e20046', '2015-08-25 13:05:06', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f633f16820048', '2015-08-25 13:05:23', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f633f9cff004a', '2015-08-25 13:05:57', '0:0:0:0:0:0:0:1', '沙漠', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cb4f632110014f633fddec004b', '2015-08-25 13:06:14', '0:0:0:0:0:0:0:1', '沙漠', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f89690e0010', '2015-08-11 09:32:23', '10.90.111.113', '音乐', null, '北京', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8a06650013', '2015-08-10 09:33:03', '10.90.111.113', '用作壁纸', null, '北京', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8a46bf0017', '2015-08-09 09:33:20', '10.90.111.113', '法律', null, '北京', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8a61fc0019', '2015-08-08 09:33:27', '10.90.111.113', '音乐', null, '北京', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8a7128001a', '2015-08-08 09:33:31', '10.90.111.113', '艺术', null, '北京', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8a7a2d001c', '2015-08-08 09:33:33', '10.90.111.113', '分类法', null, '上海', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8b90f7001e', '2015-08-09 09:34:44', '10.90.111.113', 'C语言', null, '上海', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8ba4770021', '2015-08-10 09:34:49', '10.90.111.113', '上海大学', null, '上海', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8bc0410024', '2015-08-12 09:34:57', '10.90.111.113', '婚姻法', null, '上海', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8be9d00026', '2015-08-10 09:35:07', '10.90.111.113', '滕怡飞', null, '上海', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1f8c058a002a', '2015-08-10 09:35:14', '10.90.111.113', '张明虎', null, '上海', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1fc8f08b0035', '2015-08-12 10:41:45', '202.120.119.6', '法律', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1fc916df0036', '2015-08-12 10:41:56', '202.120.119.6', '音乐', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1fc9bb670038', '2015-08-12 10:42:38', '202.120.119.6', '算法', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f1fc9ff3a003a', '2015-08-12 10:42:56', '202.120.119.6', 'C语言', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f204ae86f003c', '2015-08-12 13:03:44', '202.120.119.6', '壁纸', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('', '8a8104cc4f1f856f014f206b612a003d', '2015-08-12 13:39:12', '202.120.119.6', '法律', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('', '8a8104cc4f1f856f014f206b82cd003f', '2015-08-12 13:39:21', '202.120.119.6', '音乐', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('', '8a8104cc4f1f856f014f206b97850040', '2015-08-12 13:39:26', '202.120.119.6', '艺术', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('', '8a8104cc4f1f856f014f206bb12d0041', '2015-08-12 13:39:33', '202.120.119.6', '壁纸', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f206c107b0043', '2015-08-12 13:39:57', '202.120.119.6', '壁纸', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f206c92850045', '2015-08-12 13:40:30', '202.120.119.6', '壁纸', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f206e4f7d0047', '2015-08-12 13:42:24', '202.120.119.6', '法律', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f206e83b60048', '2015-08-12 13:42:38', '202.120.119.6', '音乐', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f206eabee0049', '2015-08-12 13:42:48', '202.120.119.6', 'C语言', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f20a5ce07004c', '2015-08-12 14:43:01', '58.198.123.120', '上海', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f20bcceaa004d', '2015-08-12 15:08:09', '58.198.123.120', '法律', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f20bd4697004f', '2015-08-12 15:08:39', '58.198.123.120', '音乐', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f20be21b80051', '2015-08-12 15:09:35', '58.198.123.120', '壁纸', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f20be6c9d0052', '2015-08-12 15:09:55', '58.198.123.120', 'C语言', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('', '8a8104cc4f1f856f014f20d43f5d0053', '2015-08-12 15:33:45', '58.198.123.120', '法律', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f20d460250055', '2015-08-12 15:33:53', '58.198.123.120', '法律', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f20d4884e0056', '2015-08-12 15:34:04', '58.198.123.120', '音乐', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('', '8a8104cc4f1f856f014f20d48b980057', '2015-08-12 15:34:04', '58.198.123.120', '音乐', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f20d4d42c0058', '2015-08-12 15:34:23', '58.198.123.120', '法律', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('', '8a8104cc4f1f856f014f20d50b420059', '2015-08-12 15:34:37', '58.198.123.120', '音乐', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f20d5dbf8005c', '2015-08-12 15:35:31', '58.198.123.120', 'C语言', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f1f856f014f20d93ece0060', '2015-08-12 15:39:12', '58.198.123.120', '法律', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f45d91a300004', '2015-08-19 20:05:00', '153.36.109.146', '法律', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f45d940550005', '2015-08-19 20:05:10', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('', '8a8104cc4f45d73f014f45de155c0006', '2015-08-19 20:10:26', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('', '8a8104cc4f45d73f014f45f7ebd00009', '2015-08-19 20:38:38', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('', '8a8104cc4f45d73f014f45f886ce000c', '2015-08-19 20:39:19', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('', '8a8104cc4f45d73f014f45fb450d000f', '2015-08-19 20:42:19', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('', '8a8104cc4f45d73f014f4636d3e70012', '2015-08-19 21:47:22', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f48ee47200017', '2015-08-20 10:26:59', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f48f2c3500018', '2015-08-20 10:31:50', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f48f2cd890019', '2015-08-20 10:31:56', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f48f4bc92001a', '2015-08-20 10:34:03', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f48f4f52c001c', '2015-08-20 10:34:17', '153.36.109.146', '法律 ', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f48f60a26001d', '2015-08-20 10:35:28', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f48f7b699001e', '2015-08-20 10:37:18', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f48fb4c4d001f', '2015-08-20 10:41:13', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f48fee2100020', '2015-08-20 10:45:08', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4904421b0021', '2015-08-20 10:51:00', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4907321d0022', '2015-08-20 10:54:12', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f49075f5a0023', '2015-08-20 10:54:24', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f490cda7d0024', '2015-08-20 11:00:23', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4910f8e80025', '2015-08-20 11:04:53', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f49113d1e0026', '2015-08-20 11:05:11', '153.36.109.146', 'C语言', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f491447ba0027', '2015-08-20 11:08:30', '0:0:0:0:0:0:0:1', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f491787380028', '2015-08-20 11:12:03', '0:0:0:0:0:0:0:1', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f49187f340029', '2015-08-20 11:13:06', '0:0:0:0:0:0:0:1', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f49194c2b002a', '2015-08-20 11:13:59', '0:0:0:0:0:0:0:1', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f49199a72002b', '2015-08-20 11:14:19', '0:0:0:0:0:0:0:1', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4919d62e002c', '2015-08-20 11:14:34', '0:0:0:0:0:0:0:1', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f491a2222002d', '2015-08-20 11:14:54', '0:0:0:0:0:0:0:1', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f491a592d002e', '2015-08-20 11:15:08', '0:0:0:0:0:0:0:1', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f491d3aa30031', '2015-08-20 11:18:16', '0:0:0:0:0:0:0:1', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f491d972f0032', '2015-08-20 11:18:40', '0:0:0:0:0:0:0:1', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f491e605b0033', '2015-08-20 11:19:31', '0:0:0:0:0:0:0:1', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('', '8a8104cc4f45d73f014f4989ced90035', '2015-08-20 13:16:52', '10.90.183.222', '法律', null, '河南省', null, null);
INSERT INTO `history` VALUES ('', '8a8104cc4f45d73f014f498a8c300037', '2015-08-20 13:17:41', '10.90.183.222', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('', '8a8104cc4f45d73f014f498de3a3003a', '2015-08-20 13:21:20', '0:0:0:0:0:0:0:1', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4db3ab820041', '2015-08-21 08:41:05', '10.90.42.230', '法律', null, '河南省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4dc05ea90043', '2015-08-21 08:54:57', '10.90.42.230', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4df62e930046', '2015-08-21 09:53:44', '0:0:0:0:0:0:0:1', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('', '8a8104cc4f45d73f014f4e02774e0047', '2015-08-21 10:07:09', '10.90.42.230', '音乐', null, '河南省', null, null);
INSERT INTO `history` VALUES ('', '8a8104cc4f45d73f014f4e0335c40049', '2015-08-21 10:07:54', '10.90.42.230', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e033655004c', '2015-08-21 10:07:57', '0:0:0:0:0:0:0:1', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('', '8a8104cc4f45d73f014f4e03368f004d', '2015-08-21 10:07:58', '10.90.42.230', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e03634c0050', '2015-08-21 10:08:09', '0:0:0:0:0:0:0:1', 'C语言', null, '河南省', null, null);
INSERT INTO `history` VALUES ('', '8a8104cc4f45d73f014f4e037e9c0051', '2015-08-21 10:08:16', '10.90.42.230', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e039c410054', '2015-08-21 10:08:24', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e03ea850055', '2015-08-21 10:08:44', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('', '8a8104cc4f45d73f014f4e0518630056', '2015-08-21 10:10:01', '10.99.79.9', 'C', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e0b12050058', '2015-08-21 10:16:32', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e0b538d0059', '2015-08-21 10:16:49', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e0bbd4f005a', '2015-08-21 10:17:16', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e0c0118005b', '2015-08-21 10:17:34', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e0c53b0005c', '2015-08-21 10:17:55', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e0d88ba005d', '2015-08-21 10:19:14', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e0d9bb3005e', '2015-08-21 10:19:19', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e0dadf5005f', '2015-08-21 10:19:23', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e0e3a6d0060', '2015-08-21 10:19:59', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e0e544d0061', '2015-08-21 10:20:06', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e0e5f320062', '2015-08-21 10:20:09', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e19f1d20063', '2015-08-21 10:32:47', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e2798360064', '2015-08-21 10:47:42', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e2897de0065', '2015-08-21 10:48:47', '0:0:0:0:0:0:0:1', 'C语言', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4e8a03b00071', '2015-08-21 12:35:11', '10.90.120.90', 'C ', null, '湖北省', null, null);
INSERT INTO `history` VALUES ('', '8a8104cc4f45d73f014f4ed1d89f0074', '2015-08-21 13:53:39', '0:0:0:0:0:0:0:1', 'sfsd', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4f38f2ed0077', '2015-08-21 15:46:16', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4fb1896c007a', '2015-08-21 17:57:59', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4fb20ef8007b', '2015-08-21 17:58:33', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4fb2b115007c', '2015-08-21 17:59:15', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f4fb2c7d5007d', '2015-08-21 17:59:21', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f5002c45c007f', '2015-08-21 19:26:43', '10.90.120.90', 'C ', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f5015c6c40081', '2015-08-21 19:47:29', '0:0:0:0:0:0:0:1', 'c', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f50168b730082', '2015-08-21 19:48:19', '0:0:0:0:0:0:0:1', 'c', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f50171a560083', '2015-08-21 19:48:55', '0:0:0:0:0:0:0:1', 'c', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f5017ac050084', '2015-08-21 19:49:33', '0:0:0:0:0:0:0:1', 'c', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f501b43ac0086', '2015-08-21 19:53:28', '0:0:0:0:0:0:0:1', 'c', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f501bb2be0087', '2015-08-21 19:53:57', '0:0:0:0:0:0:0:1', 'c', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f501c1e6b0088', '2015-08-21 19:54:24', '0:0:0:0:0:0:0:1', 'c', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f45d73f014f502608e3008a', '2015-08-21 20:05:14', '0:0:0:0:0:0:0:1', 'c', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f505454014f5054a9e90001', '2015-08-21 20:56:10', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f64b29a014f64ba535c001d', '2015-08-25 19:59:37', '0:0:0:0:0:0:0:1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f64b29a014f64ba6efc001e', '2015-08-25 19:59:44', '0:0:0:0:0:0:0:1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8a8104cc4f64b29a014f64bbd6de0025', '2015-08-25 20:01:16', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ada12da4f343ba3014f345752070004', '2015-08-16 10:29:42', '0:0:0:0:0:0:0:1', '的', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ada12da4f34752c014f34775fe20004', '2015-08-16 11:04:43', '0:0:0:0:0:0:0:1', '的', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ada12da4f34752c014f3477883e0005', '2015-08-16 11:04:53', '0:0:0:0:0:0:0:1', 'C语言', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ada12da4f34752c014f3477a89f0006', '2015-08-16 11:05:01', '0:0:0:0:0:0:0:1', '的', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ada12da4f34752c014f3477badc0007', '2015-08-16 11:05:06', '0:0:0:0:0:0:0:1', 'le', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ada12da4f34752c014f3477c6010009', '2015-08-16 11:05:09', '0:0:0:0:0:0:0:1', 'a', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ada12da4f34752c014f3477d210000a', '2015-08-16 11:05:12', '0:0:0:0:0:0:0:1', '了', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8adab44e4f352329014f35247fe90003', '2015-08-16 14:13:49', '0:0:0:0:0:0:0:1', '的', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8adab44e4f352329014f3524ce380004', '2015-08-16 14:14:09', '0:0:0:0:0:0:0:1', '了', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ae3cf894f4dfad2014f4dfef4ba000c', '2015-08-21 10:03:18', '127.0.0.1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ae3cf894f4dfad2014f4e001e16000e', '2015-08-21 10:04:35', '127.0.0.1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8ae3cf894f4dfad2014f4e005f03000f', '2015-08-21 10:04:51', '127.0.0.1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8ae3cf894f4dfad2014f4e04ec840011', '2015-08-21 10:09:50', '127.0.0.1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ae3cf894f4e0c6f014f4e1145560001', '2015-08-21 10:23:19', '127.0.0.1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ae3cf894f4e0c6f014f4e1291100002', '2015-08-21 10:24:44', '127.0.0.1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ae3cf894f4e0c6f014f4e133daa0003', '2015-08-21 10:25:28', '127.0.0.1', '艺术', null, null, null, null);
INSERT INTO `history` VALUES ('', '8ae3cf894f4f2cb4014f4f2e73760000', '2015-08-21 15:34:47', '127.0.0.1', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('', '8ae3cf894f4f2cb4014f4f300bf30001', '2015-08-21 15:36:33', '10.99.79.9', '音乐', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ae3cf894f4f2cb4014f4f31d4ec0005', '2015-08-21 15:38:30', '10.99.79.9', '动态规划', null, null, null, null);
INSERT INTO `history` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', '8ae3cf894f651f28014f65254b3f0001', '2015-08-25 21:56:27', '127.0.0.1', '音乐', null, null, null, null);

-- ----------------------------
-- Table structure for `loginlog`
-- ----------------------------
DROP TABLE IF EXISTS `loginlog`;
CREATE TABLE `loginlog` (
  `RANDOMUUID` varchar(255) COLLATE utf8_bin NOT NULL,
  `USERUUID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOGINDATE` datetime DEFAULT NULL,
  `IP` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BROWSER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ADDRESS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROVINCE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `X` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Y` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`RANDOMUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of loginlog
-- ----------------------------
INSERT INTO `loginlog` VALUES ('297e511f4f4daa09014f4daa589b0000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 08:30:53', '218.28.191.50', null, null, null, '河南省', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f4daa09014f4dae8c620008', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 08:35:29', '218.28.191.50', null, null, null, '河南省', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f4daf4a014f4dafa8ac0000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 08:36:42', '218.28.191.50', null, null, null, '河南省', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f4dbe38014f4dbe78e90000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 08:52:52', '218.28.191.50', null, null, null, '河南省', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f4dcd38014f4dcd56660000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 09:09:07', '218.28.191.50', null, null, null, '河南省', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f4dd085014f4dd0b4170000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 09:12:47', '218.28.191.50', null, null, null, '河南省', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f4dd165014f4dd1964c0000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 09:13:45', '218.28.191.50', null, null, null, '河南省', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f4dd7fa014f4dd831f00000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 09:20:58', '218.28.191.50', null, null, null, '河南省', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f4dda41014f4dda5b700000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 09:23:20', '218.28.191.50', null, null, null, '河南省', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f4dda41014f4e036a2e0002', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 10:08:11', '58.135.255.244', null, null, null, '北京市', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f4e0aa7014f4e0ac18f0001', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 10:16:12', '58.135.255.244', null, null, null, '北京市', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f4e8e87014f4e8eb9140000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 12:40:20', '58.135.255.244', null, null, null, '北京市', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f4e9372014f4e93d1170000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 12:45:54', '58.135.255.244', null, null, null, '北京市', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f4e9f8e014f4e9fb3ef0000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 12:58:53', '58.135.255.244', null, null, null, '北京市', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f4e9f8e014f4ed361010001', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 13:55:20', '58.135.255.244', null, null, null, '北京市', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f5009e2014f500a7f780000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 19:35:07', '58.135.255.244', null, null, null, '北京市', null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f5851ba014f58ca1bc10000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-23 12:21:24', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f58d5a5014f58d63a6e0000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-23 12:34:39', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f58da11014f58da44100000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-23 12:39:03', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f58e12b014f58e1fa9f0000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-23 12:47:29', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f58f3d8014f58f4485f0000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-23 13:07:28', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('297e511f4f58ff3c014f58ff64940000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-23 13:19:36', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('297ebe0e4f24fd4a014f24fde8680000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-26 10:57:43', '58.199.132.30', '', '', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('297ebe0e4f24fd4a014f25a7d1d40001', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-26 14:03:18', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f24fd4a014f26d515ed0002', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-26 19:32:22', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f24fd4a014f26e0fe550003', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-13 19:45:22', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f26f2c9014f27045f2d0000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-26 20:24:02', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f26f2c9014f2708f5110001', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-25 20:29:01', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f26f2c9014f270a00df0002', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-25 20:30:11', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f26f2c9014f270c057f0003', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-25 20:32:22', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f26f2c9014f27a2b3230004', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-24 23:16:57', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f26f2c9014f27cc67030005', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-24 00:02:30', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f29ad26014f29ad4a390000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-24 08:47:46', '58.199.134.246', '', '', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('297ebe0e4f29ad26014f29df895b0001', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-23 09:42:39', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f29ad26014f2a0f72490002', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-23 10:34:58', '202.120.121.117', '', '', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('297ebe0e4f29ad26014f2a6b427b0003', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-23 12:15:16', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f29ad26014f2b0528020004', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-14 15:03:21', '58.199.131.130', '', '', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('297ebe0e4f29ad26014f2b51cf310005', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-14 16:27:05', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f2b5534014f2b5545c50000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-14 16:30:53', '58.199.131.130', '', '', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('297ebe0e4f2b5534014f2b57dda50001', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-14 16:33:43', '101.94.164.124', '', '', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('297ebe0e4f2b5534014f2b584f6a0002', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-14 16:34:12', '101.94.164.124', '', '', 'CN|上海|上海|None|CHINANET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('297ebe0e4f2b5534014f2b5ac8260003', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-14 16:36:53', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f3039d6014f303a3ceb0000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-15 15:19:26', '58.199.132.4', '', '', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('297ebe0e4f303bb5014f303bef990000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-15 15:21:18', '58.199.132.4', '', '', 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('297ebe0e4f303bb5014f307ca7680001', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-15 16:32:00', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f303bb5014f314a90700002', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-15 20:16:53', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f303bb5014f3ff274010003', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-18 16:34:58', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f40056a014f434b81e50000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-19 08:11:05', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f435e4c014f435e8c720000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-19 08:31:53', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f4361ad014f4364644a0000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-19 08:38:16', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('297ebe0e4f4370de014f437225a60000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-19 08:53:17', '153.36.109.146', '', '', 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `loginlog` VALUES ('8a8104cb4f44b839014f44bd58de0004', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-19 14:55:02', '58.198.123.120', null, null, 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('8a8104cb4f4882ee014f488356bf0000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-20 08:30:11', '0:0:0:0:0:0:0:1', null, null, null, '上海市', null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f4882ee014f48a483ec0017', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-20 09:06:25', '0:0:0:0:0:0:0:1', null, null, null, '上海市', null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f48cb76014f48cc154c0000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-20 09:49:38', '0:0:0:0:0:0:0:1', null, null, null, '上海市', null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f48cb76014f48f45956000e', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-20 10:33:37', '10.99.79.9', null, null, null, '上海市', null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f48cb76014f49053a560016', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-20 10:52:03', '58.48.64.27', null, null, null, '湖北省', null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f48cb76014f49be3dbd0020', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-20 14:14:09', '58.48.64.27', null, null, null, '湖北省', null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f48cb76014f49e43baa0022', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-20 14:55:38', '58.48.64.27', null, null, null, '湖北省', null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f48cb76014f4a52d1bc0028', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-20 16:56:26', '58.48.64.27', null, null, null, '湖北省', null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f48cb76014f4da143ba002c', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 08:20:58', '58.48.64.27', null, null, null, '湖北省', null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f48cb76014f5061295e0034', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 21:09:48', '58.48.64.27', null, null, null, '湖北省', null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f48cb76014f509372bb0038', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 22:04:45', '58.48.64.27', null, null, null, '湖北省', null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f509842014f50986cda0000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 22:10:11', '58.48.64.27', null, null, null, '湖北省', null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f509842014f52892656000e', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-22 07:12:44', '58.48.64.27', null, null, null, '湖北省', null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f509842014f528bf5920013', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-22 07:15:48', '58.48.64.27', null, null, null, '湖北省', null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f509842014f52e6f00f001c', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-22 08:55:11', '58.48.64.27', null, null, null, '湖北省', null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f52edd6014f52ee1fe40000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-22 09:03:01', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f557608014f55d0a6f7004b', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-22 22:29:42', '10.90.195.86', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f55e38b014f55e3b4590000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-22 22:50:28', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f55e4ba014f55e521900000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-22 22:52:04', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f55e4ba014f55f143580024', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-22 23:05:19', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f55e4ba014f5855240a0037', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-23 10:13:39', '10.90.157.52', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f55e4ba014f588d5a490038', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-23 11:15:03', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f55e4ba014f5d6fd960003a', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-24 10:00:55', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f55e4ba014f5d6fd970003b', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-24 10:00:54', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f62e16f014f62e1c7d20000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-25 11:23:28', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f62e16f014f62e683e40003', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-25 11:28:38', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f62e16f014f631618130006', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-25 12:20:36', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f632110014f632166970000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-25 12:32:57', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f632110014f632b4b050023', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-25 12:43:46', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f632110014f632dc910002f', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-25 12:46:29', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f632110014f633d8e870040', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-25 13:03:43', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cb4f632110014f633ef6590047', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-25 13:05:15', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cc4f1f856f014f1fbf7e5c0034', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-12 10:31:27', '202.120.119.6', null, null, 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('8a8104cc4f1f856f014f204abc61003b', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-12 13:03:32', '202.120.119.6', null, null, 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('8a8104cc4f1f856f014f206bf2130042', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-12 13:39:49', '202.120.119.6', null, null, 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('8a8104cc4f1f856f014f20a5ac26004b', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-12 14:42:53', '58.198.123.120', null, null, 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('8a8104cc4f1f856f014f20d5b057005a', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-12 15:35:19', '58.198.123.120', null, null, 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('8a8104cc4f1f856f014f20d5d332005b', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-12 15:35:28', '58.198.123.120', null, null, 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('8a8104cc4f1f856f014f20d60c6a005d', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-12 15:35:43', '58.198.123.120', null, null, 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('8a8104cc4f1f856f014f20d7d5ff005e', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-12 15:37:40', '58.198.123.120', null, null, 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('8a8104cc4f1f856f014f20d7e29c005f', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-12 15:37:43', '58.198.123.120', null, null, 'CN|上海|上海|None|CERNET|0|0', '上海市', '121.48789949', '31.24916171');
INSERT INTO `loginlog` VALUES ('8a8104cc4f45d73f014f45d7986e0000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-19 20:03:21', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cc4f45d73f014f48ecb7ea0016', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-20 10:25:17', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cc4f45d73f014f48f4cd14001b', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-20 10:34:07', '10.99.79.9', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8a8104cc4f45d73f014f5025df3c0089', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 20:05:03', '0:0:0:0:0:0:0:1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8ae3cf894f4f2cb4014f4f3103550003', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-21 15:37:36', '10.99.79.9', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8ae3cf894f650d14014f650dd0430000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-25 21:30:48', '127.0.0.1', null, null, null, null, null, null);
INSERT INTO `loginlog` VALUES ('8ae3cf894f651f28014f651f63230000', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2015-08-25 21:50:00', '127.0.0.1', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `manageinfo`
-- ----------------------------
DROP TABLE IF EXISTS `manageinfo`;
CREATE TABLE `manageinfo` (
  `RANDOMUUID` varchar(255) COLLATE utf8_bin NOT NULL,
  `SERVERNUM` int(11) DEFAULT NULL,
  `PORT` int(11) DEFAULT NULL,
  `PAGEMAXSIZE` int(11) DEFAULT NULL,
  `TOTALHITS` int(11) DEFAULT NULL,
  `SEARCHMAXITEM` int(11) DEFAULT NULL,
  `DEFAULTCAPACITY` int(11) DEFAULT NULL,
  `LOGINLOGMAXSIZE` int(11) DEFAULT NULL,
  `RESOURCEMANAGERLOGMAXSIZE` int(11) DEFAULT NULL,
  `DEFAULTPERMISSIONLEVEL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DOWNLOADNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAILACCOUNTUSERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAILACCOUNTPASSWORD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAILACCOUNTSMTPHOST` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`RANDOMUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of manageinfo
-- ----------------------------
INSERT INTO `manageinfo` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cd', '1', '4700', '10', '500', '500', '2097152', '10', '10', '01', 'ISearch/Download', 'zhangminghu@163.com', 'xiaohu012607', 'smtp.163.com');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `PERMISSIONID` varchar(255) COLLATE utf8_bin NOT NULL,
  `PERMISSIONNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PERMISSIONNOTE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`PERMISSIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('297e511f4f439cf4014f439cf8950006', 'logAnalysis', '查看全网日志分析');
INSERT INTO `permission` VALUES ('297e511f4f439cf4014f439cf8950007', 'modifySystemParam', '修改系统参数');
INSERT INTO `permission` VALUES ('297e511f4f439cf4014f439cf8950009', 'commonAnalysis', '普通用户操作');

-- ----------------------------
-- Table structure for `resourcemanagerlog`
-- ----------------------------
DROP TABLE IF EXISTS `resourcemanagerlog`;
CREATE TABLE `resourcemanagerlog` (
  `RANDOMUUID` varchar(255) COLLATE utf8_bin NOT NULL,
  `FILEUUID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USERUUID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPECODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FILENAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOADDATE` datetime DEFAULT NULL,
  `REMARK` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IP` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `BROWSER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ADDRESS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROVINCE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `X` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `Y` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`RANDOMUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of resourcemanagerlog
-- ----------------------------
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f4daa09014f4daaa8260001', '629d74d418104a14b145c2801ba475f1', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '1 排列组合、母函数、整数拆分2014.ppt', '2015-08-21 08:31:14', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f4daa09014f4dab92e80002', '64204168f33549179a88d15907308edb', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH6 函数.ppt', '2015-08-21 08:32:14', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f4daa09014f4dabc1b00003', '866459b4bff641daaa9d132ac80ea579', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH7 指针.ppt', '2015-08-21 08:32:26', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f4daa09014f4dabf59a0005', '866459b4bff641daaa9d132ac80ea579', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', 'CH7 指针.ppt', '2015-08-21 08:32:39', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f4daf4a014f4dafd7250001', '9ace11758aab4f65a0306c8e5050ef7b', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH8 结构体、联合与枚举.ppt', '2015-08-21 08:36:54', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f4daf4a014f4daffc000002', 'dab7d78493734a35adcedc56dc625a44', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH2 集成环境的使用.ppt', '2015-08-21 08:37:03', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f4daf4a014f4db0605d0004', 'dab7d78493734a35adcedc56dc625a44', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', 'CH2 集成环境的使用.ppt', '2015-08-21 08:37:29', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f4dbe38014f4dbed2650001', 'f5098f93c8514f798a5ee581869b2a95', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH6 函数.ppt', '2015-08-21 08:53:15', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f4dbe38014f4dbeec520002', '83e655b735ce4b628c8590ada8e79de4', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH9 文件.ppt', '2015-08-21 08:53:22', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f4dda41014f4e038cf40003', '7b8bb228a25a4986bbe621651f6cd364', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '142C导学.ppt', '2015-08-21 10:08:20', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f4e0aa7014f4e0ab4fb0000', '7b8bb228a25a4986bbe621651f6cd364', null, 'DOWNLOAD', '142C导学.ppt', '2015-08-21 10:16:09', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f5009e2014f500ae3b10002', '4bd2a93829fd46938d581d1a27d170fe', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH8 结构体、联合与枚举.ppt', '2015-08-21 19:35:35', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f5009e2014f500b0ab80003', '7c24daaa685a4c9a991f339509b1cdae', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH9 文件.ppt', '2015-08-21 19:35:45', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f5009e2014f50224b0e0007', '58c7eb1ef7a24e0a8159f4933e749991', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH8 结构体、联合与枚举.ppt', '2015-08-21 20:01:09', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f5009e2014f50225ff60008', '6fb109c934a04a6e8dc76e3edac7e71c', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH9 文件.ppt', '2015-08-21 20:01:14', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f506e4c014f506f01d90001', '311c7f8a73224b1593f5eb348e9b01fb', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '142C导学.ppt', '2015-08-21 21:24:56', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f506e4c014f506f25870002', '303500d58e5c4a44a3c85e751438693e', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH6 函数.ppt', '2015-08-21 21:25:05', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f506e4c014f506fd0260004', '8f4580ab724c40069c6e86cdd46122a9', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH8 结构体、联合与枚举.ppt', '2015-08-21 21:25:49', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f506e4c014f506fe6c00005', 'f364b31ad60c4386bd8d9db970c134b2', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '动态规划DP 7.29.ppt', '2015-08-21 21:25:55', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f506e4c014f506ffec60006', 'e2ccc9a7cc0942b5bfc8aa62ce5ca7a7', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '第七章.ppt', '2015-08-21 21:26:01', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f506e4c014f507022220007', '4c3c2573b63c4313abcf44759889ab79', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '动态规划DP 7.31.ppt', '2015-08-21 21:26:10', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f507781014f507e18a90005', '2e692718cf2340a2844ecc435910963a', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '142C导学.ppt', '2015-08-21 21:41:25', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f507781014f507e32070006', '6734132e8b6246709b299cd7cd7d140f', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH7 指针.ppt', '2015-08-21 21:41:32', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f507781014f507e4f3a0007', '9f4ead5043d64a48811829caa1fd3cbb', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '第二章   C 语言语句.ppt', '2015-08-21 21:41:39', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f507781014f507e67d70008', '7c66d5daa9b14710a6e91f7211c804da', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '第九章.ppt', '2015-08-21 21:41:45', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f507781014f507eac38000a', 'fcb21f9ad8a44ddd991a4f9ffda42859', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '动态规划DP 7.31.ppt', '2015-08-21 21:42:03', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f507781014f507ecdb0000b', '155047f2c0ec499fae6050645992a7c8', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH6 函数.ppt', '2015-08-21 21:42:12', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f507781014f507fc457000e', 'bb3c2cdeb5ed4f9cb82444d99982536a', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '第三章 程序设计基础.ppt', '2015-08-21 21:43:15', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f507781014f507fe710000f', '88ac89f228d9423c8c9cb6f6469be20d', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '计算机文化基础课程要求.doc', '2015-08-21 21:43:24', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f507781014f508029b90011', 'dacdff5cf7874cc5a076b41464499036', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH1 C程序设计基础.ppt', '2015-08-21 21:43:41', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f530830014f5308dc740001', 'ebef993a765d41a28f65eee8a45aa636', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '词频统计.png', '2015-08-22 09:32:14', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f530830014f53093e1e0002', 'd978ccb87e5948748aa4125b18084cc2', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'C++_1112学年秋季考试说明文档.doc', '2015-08-22 09:32:39', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f530830014f538544830004', '387c510d196f48e5ad53fae9c04bb938', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '词频统计.png', '2015-08-22 11:48:07', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f530830014f538a117f0005', '639833cb0c67461a8875bd2d4fb770f3', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '词频统计.png', '2015-08-22 11:53:21', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f5557e9014f55586ecc0001', '2e08dc3bd74a4076a31c7b44ec111d26', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '142C导学.ppt', '2015-08-22 20:18:23', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f5557e9014f55588a700002', '87dad48f58c84241946729c8eacd67c4', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH6 函数.ppt', '2015-08-22 20:18:30', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f5567e4014f55683a040001', 'f41210ff009e4c57895d2752ab394f4c', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH5 数组和字符串.ppt', '2015-08-22 20:35:38', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f5567e4014f55684fd50002', 'c53a47ee892842f896b3527142144f1c', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH6 函数.ppt', '2015-08-22 20:35:44', null, '58.199.132.30', null, 'CN|上海|上海|None|CERNET|0|0', '上海市', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f55dd34014f55ddc6fe0001', '16a903a57dd24305804e1a0221f23c24', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '词频统计.png', '2015-08-22 22:44:02', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f55dd34014f55de02310002', 'e578d39a02b644c88fde9442e9c07a5b', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '六级成绩.png', '2015-08-22 22:44:17', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f55dd34014f55ec2f4e000c', '8a64f0659d9544ea94c4136b01c39906', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '1 排列组合、母函数、整数拆分2014.ppt', '2015-08-22 22:59:46', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f55dd34014f55eef72b000e', '0b1e3ea1a17e40fe90d5cc3e0259323a', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '1 排列组合、母函数、整数拆分2014.ppt', '2015-08-22 23:02:48', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f55dd34014f55eff3cc000f', '15cada7df7a745b68fca86b111120428', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '1 排列组合、母函数、整数拆分2014.ppt', '2015-08-22 23:03:53', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f55dd34014f55f01a090010', '5b842b034d8141cfa249ad60006fa73d', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH7 指针.ppt', '2015-08-22 23:04:03', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f55dd34014f55f1de990011', '03b81926fab14ba798da09635c98a5b5', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '1 排列组合、母函数、整数拆分2014.ppt', '2015-08-22 23:05:59', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f5851ba014f58cbccc50001', '3d42c3e4c1564a9c988b09b3c03ab6a0', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '滕怡飞.txt', '2015-08-23 12:23:15', null, '153.36.109.146', null, 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', '117.18810662', '34.27155343');
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f58d5a5014f58d69cb00001', '77e409dae0f841f9b76315a9a9f51700', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '飞飞.txt', '2015-08-23 12:35:04', null, '153.36.109.146', null, 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f58da11014f58daa90e0001', 'b35d8a24881f4344bd3db0e540a71f3a', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'changes.docx', '2015-08-23 12:39:29', null, '153.36.109.146', null, 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f58e12b014f58e2a4710001', '2b88b11418f74aa8b1a9798f90fa4a5c', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '最佳实践.png', '2015-08-23 12:48:12', null, '153.36.109.146', null, 'CN|江苏|徐州|None|UNICOM|0|0CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f58f3d8014f58f47fde0001', '4d3d50170fac4757aaad7fa3cbb5a4e4', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'google.jpg', '2015-08-23 13:07:43', null, '153.36.109.146', null, 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f58f3d8014f58f590260005', '4e51e984a8d240989d78910b8e86688b', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH7 指针.ppt', '2015-08-23 13:08:52', null, '153.36.109.146', null, 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f58ff3c014f58ff80800001', '731900858cb44ab2a47456ba3d7b73cb', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH6 函数.ppt', '2015-08-23 13:19:44', null, '153.36.109.146', null, 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f58ff3c014f58ffdfe90004', '731900858cb44ab2a47456ba3d7b73cb', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', 'CH6 函数.ppt', '2015-08-23 13:20:08', null, '153.36.109.146', null, 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('297e511f4f58ff3c014f59006d5c0005', '71d5a99c3eb4472eaf325924fc9bc3ea', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '词频统计.png', '2015-08-23 13:20:44', null, '153.36.109.146', null, 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4490ec014f449155ed0001', '0efbad0b5ed24cf39792e987db600da8', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '142C导学.ppt', '2015-08-19 14:07:00', null, '153.36.109.146', null, 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4490ec014f44916e8a0002', '3d916217ab0743f3897d7cea345371a0', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH3 数据类型、运算符、表达式和常用输入输出函数.ppt', '2015-08-19 14:07:06', null, '153.36.109.146', null, 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4490ec014f4491855c0003', '27e87065087241e7b7aaf9b08f719694', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH9 文件.ppt', '2015-08-19 14:07:12', null, '153.36.109.146', null, 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4490ec014f4491a9140004', 'b9b8b6914b654420a7ba6c1ea802daaf', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '3案例.doc', '2015-08-19 14:07:21', null, '153.36.109.146', null, 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4490ec014f4491bf700005', 'd3565f28677645648d408f9a9b701e50', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '7律师主持调解工作技巧和方法.doc', '2015-08-19 14:07:27', null, '153.36.109.146', null, 'CN|江苏|徐州|None|UNICOM|0|0', '江苏省', null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4490ec014f4491d88d0006', '3d405788612e47ca899632bf860662c8', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'ABC分类法.txt', '2015-08-19 14:07:33', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4490ec014f4491f8310007', '018c3c5bcf4e453aab71441de3cf7ab8', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '法律.xls', '2015-08-19 14:07:41', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4490ec014f449216750008', 'fb7893136bac414f95a5cfa648cd2cae', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '拆迁问题的法律谈判技巧讲义.pdf', '2015-08-19 14:07:49', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4490ec014f44922e660009', '3e3cb9e44ac54c6dbf7c982026579c26', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '政治.txt', '2015-08-19 14:07:55', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4490ec014f44924e2f000a', 'adea285f132a4ab288f5f93214787830', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '政治法律.txt', '2015-08-19 14:08:03', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f44b839014f44b8acc70001', '27e87065087241e7b7aaf9b08f719694', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', 'CH9 文件.ppt', '2015-08-19 14:49:58', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f44b839014f44c038890007', '3e3cb9e44ac54c6dbf7c982026579c26', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '政治.txt', '2015-08-19 14:58:12', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f48846e110001', '8efffd3c9c604b71a137ba3645d5227e', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '142C导学.ppt', '2015-08-20 08:31:23', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f48848d6c0002', 'f162bcdb882d471dbc4fbdcc72cf6a3b', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH7 指针.ppt', '2015-08-20 08:31:31', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f4884d6a60003', '8efffd3c9c604b71a137ba3645d5227e', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '142C导学.ppt', '2015-08-20 08:31:49', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f48852e1a0004', 'd189cd8679834ccea3b6e6485453617a', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '3案例.doc', '2015-08-20 08:32:12', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f48855e4b0005', '0b0d71838a0241bda56fe8fde36a4a25', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '法律.xls', '2015-08-20 08:32:24', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f48858be40006', '11224c541cc644188c756bb102dffe2c', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '法律咨询.xls', '2015-08-20 08:32:36', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f4885b5270007', '3b6e0d8f2af14389884b88103f32e4bb', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '法律.doc', '2015-08-20 08:32:46', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f4885de720008', 'b38b4d2b58ec431fb8ed8bca9670d8da', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '分类法.txt', '2015-08-20 08:32:57', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f488616630009', '4c08e0b3c6114427af8c3d38c65f3943', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '婚姻法解释三的理解与适用.docx', '2015-08-20 08:33:11', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f4886500d000b', '3b6e0d8f2af14389884b88103f32e4bb', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '法律.doc', '2015-08-20 08:33:26', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f488719bd000f', '6d29973b91414e7b8a0754fce9618858', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '电影音乐赏析.doc', '2015-08-20 08:34:18', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f488736220010', '5ea012e2f3e443f8b3541a82384cc446', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '影视后期制作软件有哪些？.docx', '2015-08-20 08:34:25', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f48875a540011', 'ddac733670694b079175c281d889bb91', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '影视鉴赏答案.doc', '2015-08-20 08:34:34', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f488785950012', '86ab9482e0a347488c91361a27ac5d71', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '影视文化对当代大学生思想道德的影响及对策.doc', '2015-08-20 08:34:45', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f4888458b0013', '2cb8f97b6d404abe88a1a0830d8dca23', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '影视鉴赏习题及答案.doc', '2015-08-20 08:35:34', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f48a3730a0015', '0b0d71838a0241bda56fe8fde36a4a25', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '法律.xls', '2015-08-20 09:05:16', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f4882ee014f48a51db40018', '8efffd3c9c604b71a137ba3645d5227e', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '142C导学.ppt', '2015-08-20 09:07:05', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f48cb76014f48d605030002', '11224c541cc644188c756bb102dffe2c', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '法律咨询.xls', '2015-08-20 10:00:30', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f48cb76014f48d73d9a0004', '7418f2bdebf849259db28728ace97a96', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'Chrysanthemum.jpg', '2015-08-20 10:01:50', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f48cb76014f48d791fd0007', '7418f2bdebf849259db28728ace97a96', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', 'Chrysanthemum.jpg', '2015-08-20 10:02:11', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f48cb76014f49055dd80017', '8efffd3c9c604b71a137ba3645d5227e', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '142C导学.ppt', '2015-08-20 10:52:13', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f48cb76014f4906f93f0019', '0847cda16c5f4d73a538ef95a741fd24', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH7 指针.ppt', '2015-08-20 10:53:58', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f48cb76014f4907244b001a', '3555fe3e1464453eb769fee88bd3aef8', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '第七章.ppt', '2015-08-20 10:54:09', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f48cb76014f49074dc0001b', '79d14ba9c6944b8cba948ec2dbd77483', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '第一章.ppt', '2015-08-20 10:54:20', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f48cb76014f49e470e40024', 'f162bcdb882d471dbc4fbdcc72cf6a3b', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', 'CH7 指针.ppt', '2015-08-20 14:55:52', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f48cb76014f49e4a5670025', '8efffd3c9c604b71a137ba3645d5227e', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '142C导学.ppt', '2015-08-20 14:56:05', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f48cb76014f4da181d7002e', '6d29973b91414e7b8a0754fce9618858', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-21 08:21:14', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f48cb76014f4da18ceb002f', 'b38b4d2b58ec431fb8ed8bca9670d8da', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '分类法.txt', '2015-08-21 08:21:17', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f48cb76014f4da195290030', 'ddac733670694b079175c281d889bb91', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '影视鉴赏答案.doc', '2015-08-21 08:21:19', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f48cb76014f4da19bec0031', '0b0d71838a0241bda56fe8fde36a4a25', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '法律.xls', '2015-08-21 08:21:21', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f48cb76014f509392280039', '6d29973b91414e7b8a0754fce9618858', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-21 22:04:53', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f509842014f528af3f30010', '67bd5fed5ec844b685bc9bf146157012', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'Penguins.jpg', '2015-08-22 07:14:42', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f509842014f528fa89c0015', '6d29973b91414e7b8a0754fce9618858', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 07:19:51', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f509842014f529115c40018', 'b477121cee424d98b714f904e2e5bfa9', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'Koala.jpg', '2015-08-22 07:21:24', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f538dce014f539823a90002', 'b38b4d2b58ec431fb8ed8bca9670d8da', null, 'DOWNLOAD', '分类法.txt', '2015-08-22 12:08:43', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f538dce014f553f7c48000a', '6d29973b91414e7b8a0754fce9618858', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 19:51:08', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f538dce014f55408eff000e', '1d35753bb6e64648949e6f2c4fa085af', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'Hydrangeas.jpg', '2015-08-22 19:52:18', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f538dce014f5540c4bd0011', '1d35753bb6e64648949e6f2c4fa085af', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', 'Hydrangeas.jpg', '2015-08-22 19:52:32', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f538dce014f5548a98b0014', '6d29973b91414e7b8a0754fce9618858', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 20:01:09', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f555441014f555a117c0004', '6d29973b91414e7b8a0754fce9618858', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 20:20:10', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f555441014f555b165d0008', '869d32bc52684fbfb17a3400429149de', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'Desert.jpg', '2015-08-22 20:21:17', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f555441014f555d523d000d', '6d29973b91414e7b8a0754fce9618858', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 20:23:43', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f555441014f555dc6110010', '6d29973b91414e7b8a0754fce9618858', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 20:24:13', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f555441014f555ecbff0013', '6d29973b91414e7b8a0754fce9618858', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 20:25:20', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f555441014f555fc6c10016', '6d29973b91414e7b8a0754fce9618858', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 20:26:24', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f555441014f5560c22f001a', '86ab9482e0a347488c91361a27ac5d71', null, 'DOWNLOAD', '影视文化对当代大学生思想道德的影响及对策.doc', '2015-08-22 20:27:29', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f555441014f55627f460020', '2cb8f97b6d404abe88a1a0830d8dca23', null, 'DOWNLOAD', '影视鉴赏习题及答案.doc', '2015-08-22 20:29:23', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f555441014f5563fbca0027', '6d29973b91414e7b8a0754fce9618858', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 20:31:00', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f555441014f5564fd1f002b', 'cae5cecc96b046abb529c7b25c2b69a9', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'Tulips.jpg', '2015-08-22 20:32:06', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f557608014f557fe76f0004', '6d29973b91414e7b8a0754fce9618858', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 21:01:30', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f557608014f558099f20007', '6d29973b91414e7b8a0754fce9618858', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 21:02:16', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f557608014f55817b79000b', '46f0888fe0224865afaf3d8d9f805dd1', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'Penguins.jpg', '2015-08-22 21:03:13', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f557608014f558243d9000d', '6d29973b91414e7b8a0754fce9618858', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 21:04:05', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f557608014f55830abd0011', '6d29973b91414e7b8a0754fce9618858', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 21:04:55', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f557608014f5583c9390015', '6d29973b91414e7b8a0754fce9618858', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 21:05:44', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f557608014f5585132e001a', '2cb8f97b6d404abe88a1a0830d8dca23', null, 'DOWNLOAD', '影视鉴赏习题及答案.doc', '2015-08-22 21:07:09', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f557608014f558b5bfc0032', '6d29973b91414e7b8a0754fce9618858', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 21:14:01', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f557608014f55a96b9a0036', '6d29973b91414e7b8a0754fce9618858', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 21:46:51', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f557608014f55bf8526003a', '6d29973b91414e7b8a0754fce9618858', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 22:10:59', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f557608014f55c11766003f', '6d29973b91414e7b8a0754fce9618858', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 22:12:42', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f557608014f55c37c8b0042', '6d29973b91414e7b8a0754fce9618858', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 22:15:19', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f557608014f55c457d80046', '59380b00fbdb4479b26198bd89db3254', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'Koala.jpg', '2015-08-22 22:16:15', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f557608014f55d235dc004d', 'b477121cee424d98b714f904e2e5bfa9', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', 'Koala.jpg', '2015-08-22 22:31:24', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f557608014f55d24019004e', '59380b00fbdb4479b26198bd89db3254', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', 'Koala.jpg', '2015-08-22 22:31:26', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f55e38b014f55e3e5c20001', '4d724e159a8a4d2ebf0388a13b750a42', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '1 排列组合、母函数、整数拆分2014.ppt', '2015-08-22 22:50:43', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f55e4ba014f55e81a240013', 'ec405037f4e74bc8b560c1f2b9b9466a', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '19交通事故.doc', '2015-08-22 22:55:19', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f55e4ba014f55e8c4fc0016', 'b13c75af196445b2889f0185cff40772', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '法律咨询.xls', '2015-08-22 22:56:02', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f55e4ba014f55e9133f0017', 'ddf60b387a124543902894eac99a5313', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '婚姻.xls', '2015-08-22 22:56:22', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f55e4ba014f55ee5028001a', 'b81c4e44d20746c78693ff0c1aba7bf7', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '花样年华音乐分析.txt', '2015-08-22 23:02:06', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f55e4ba014f55ef658a001d', '27e79f3c9f024565b73bfc52a367e68d', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 23:03:17', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f55e4ba014f55f00147001f', 'b81c4e44d20746c78693ff0c1aba7bf7', null, 'DOWNLOAD', '花样年华音乐分析.txt', '2015-08-22 23:03:56', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f55e4ba014f55f107000022', '27e79f3c9f024565b73bfc52a367e68d', null, 'DOWNLOAD', '电影音乐赏析.doc', '2015-08-22 23:05:03', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f55e4ba014f55fd5a730031', 'e98b6b99d5624b2d92b76f22331b7c8e', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'Jellyfish.jpg', '2015-08-22 23:18:31', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f62e16f014f6316ed2f000a', '683d2b8fc43947e2910e5d16a7fe201d', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'Hydrangeas.jpg', '2015-08-25 12:21:31', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f632198640001', '63a0d062d4f44691b422c30635a2770d', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH1 C程序设计基础.ppt', '2015-08-25 12:33:10', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f6321a2d90002', '63a0d062d4f44691b422c30635a2770d', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', 'CH1 C程序设计基础.ppt', '2015-08-25 12:33:13', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f6323ee610003', 'b4fd29b31a05457cb254a4f8a9b17176', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH2 集成环境的使用.ppt', '2015-08-25 12:35:43', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f632408350004', '2ad83a32be764acfb9c7a47dc7eaf273', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH3 数据类型、运算符、表达式和常用输入输出函数.ppt', '2015-08-25 12:35:50', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f632426530005', '4940340d0e2b4deb873b237b0851c367', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH5 数组和字符串.ppt', '2015-08-25 12:35:58', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f6324d10a0008', '6cb5525363744d019d8d1ebc6f6caa44', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH6 函数.ppt', '2015-08-25 12:36:41', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f6324f0dc0009', '71c63b38d9894247a55cc9d6c4f42125', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH8 结构体、联合与枚举.ppt', '2015-08-25 12:36:49', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f63250ebc000a', 'ce73629e2df143b0aad7ad11b2c8f57f', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH9 文件.ppt', '2015-08-25 12:36:57', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f63252caf000b', '9f07befd860b4b8fb7353b4339dc8c10', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '第九章.ppt', '2015-08-25 12:37:05', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f63254e94000c', '246af1f89f374b51b37904c0f01cb004', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '第三章 程序设计基础.ppt', '2015-08-25 12:37:13', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f632575b7000d', '7bdac39227104afb84ee9f7bbd5edea3', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '3案例.doc', '2015-08-25 12:37:23', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f63258fb1000e', '75b91bbcac2d444ca9627166348c073d', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '8民事诉讼案技巧.doc', '2015-08-25 12:37:30', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f6325b742000f', '427fa10ba88f4b8f86aff44e0e4f1adb', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '电影音乐赏析.doc', '2015-08-25 12:37:40', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f6325d0730010', 'c9473102f4b142eea1b062e3f99ffc74', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '花样年华音乐分析.txt', '2015-08-25 12:37:47', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f6325fa660011', '8c145ffaf1a14bfe9a45ebf6519dd0ef', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '影视后期常用软件大集合.docx', '2015-08-25 12:37:57', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f6326355e0012', '7484bab893fd4427b7fec80473b26d88', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '影视音乐鉴赏论文电影音乐鉴赏论文.pdf', '2015-08-25 12:38:13', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f6326629e0013', '21af578b41214e1ca01b58bd63116e17', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '中国影视文化传播的现状和发展.doc', '2015-08-25 12:38:24', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f6326a08e0014', 'f575b1971d4745698318058bda00525f', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '中华学生百科全书：影视艺术.pdf', '2015-08-25 12:38:40', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f6326bfb80015', '4b934abe5ad548d8b45fd5ea34fc13db', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '人人影视新闻组考核稿20130602.pdf', '2015-08-25 12:38:48', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f6326f1800016', 'bfb7ad6eff4e4d638bcccc2a918398e8', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '法律.xls', '2015-08-25 12:39:01', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f632712b70017', 'afe0cb50bbf2453b8a064f1cf414b62e', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '法律.txt', '2015-08-25 12:39:09', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f63273ba60018', '5d756f99478c40769a35b303a163cba3', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '婚姻.xls', '2015-08-25 12:39:20', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f63276d2d001a', '7484bab893fd4427b7fec80473b26d88', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '影视音乐鉴赏论文电影音乐鉴赏论文.pdf', '2015-08-25 12:39:32', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f6329f73b001d', '7484bab893fd4427b7fec80473b26d88', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '影视音乐鉴赏论文电影音乐鉴赏论文.pdf', '2015-08-25 12:42:19', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f632afd330021', '7484bab893fd4427b7fec80473b26d88', null, 'DOWNLOAD', '影视音乐鉴赏论文电影音乐鉴赏论文.pdf', '2015-08-25 12:43:26', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f632bef4a0025', '973d7f404a2a45d4b92c829cc8e0289e', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'Desert.jpg', '2015-08-25 12:44:28', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f632d2d83002b', '7484bab893fd4427b7fec80473b26d88', null, 'DOWNLOAD', '影视音乐鉴赏论文电影音乐鉴赏论文.pdf', '2015-08-25 12:45:49', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f632d8179002d', '7484bab893fd4427b7fec80473b26d88', null, 'DOWNLOAD', '影视音乐鉴赏论文电影音乐鉴赏论文.pdf', '2015-08-25 12:46:11', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f6336062e0031', 'ec9e427fd09e4890835f8d7c4e7b991a', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'Koala.jpg', '2015-08-25 12:55:29', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f6339290d0037', '81991641162a4eaeabd6d09cd88307af', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'Penguins.jpg', '2015-08-25 12:58:55', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f633ca139003b', '7484bab893fd4427b7fec80473b26d88', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '影视音乐鉴赏论文电影音乐鉴赏论文.pdf', '2015-08-25 13:02:42', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f633d4e4a003e', '7484bab893fd4427b7fec80473b26d88', null, 'DOWNLOAD', '影视音乐鉴赏论文电影音乐鉴赏论文.pdf', '2015-08-25 13:03:26', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f633ebb650045', '7484bab893fd4427b7fec80473b26d88', null, 'DOWNLOAD', '影视音乐鉴赏论文电影音乐鉴赏论文.pdf', '2015-08-25 13:05:00', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cb4f632110014f633f8e710049', 'c53e0e69455646d08db4b0fbec4265a0', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'Desert.jpg', '2015-08-25 13:05:54', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f6ac9014f1f7083290001', '1edbc83e91e741628a5ba870cfd2c9f1', 'a74a8999464d41999cece786d1846912', 'UPLOAD', '142C导学.ppt', '2015-08-11 09:05:11', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f875ca00001', 'd98dbdd935ac42998c10b8c0e510d47a', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH6 函数.ppt', '2015-08-10 09:30:09', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f8775ac0002', 'ad064a68af1d4f0495d5a6024808b5ac', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH9 文件.ppt', '2015-08-10 09:30:15', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f87979d0003', 'e5d1f773783c4b3582851134f01cf6d8', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'GUIDE1027使用说明.pdf', '2015-08-09 09:30:24', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f87b2da0004', '60dc05555e6f421e9f909995d8b4031d', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '基础DS--最短路.ppt', '2015-08-07 09:30:31', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f87e2df0005', '61477bef37bc429d9fe23f20e26615a4', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '《婚姻法司法解释三》的理解与适用 最高人民法院 吴晓芳法官.docx', '2015-08-08 09:30:43', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f8800f90006', '2e680b029c594e67b53032349438fcd8', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '9 证据质证（终）060714.doc', '2015-08-12 09:30:51', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f881fbf0007', '57460763d5764af9a7f17b1621e5d7b6', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '分类法.txt', '2015-08-10 09:30:59', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f884ae40008', '8dd395029cdf44d89229eb2f27aeaf33', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '婚姻.xls', '2015-08-07 09:31:10', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f8879050009', '902e20d9ef3046489069a07d0064f0d9', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '政治法律.docx', '2015-08-05 09:31:22', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f889a6a000a', 'd1874b3559a94fefa77f15d74800ae10', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '政治法律知识的.txt', '2015-08-09 09:31:30', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f88c5be000b', '54c396b8951b4bdf963c192d86c1ac42', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '北京大学《影视鉴赏》课件.ppt', '2015-08-10 09:31:41', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f88dddf000c', '8e1ed9541a33404cb60eb53cedcd26f1', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '影视后期制作软件.doc', '2015-08-08 09:31:48', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f8906c3000d', '5874d65f22264722a314a98d00234d08', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '中华学生百科全书：影视艺术.pdf', '2015-08-10 09:31:58', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f8929bd000e', '717005da1da8413ca733242c75d11e59', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '电影音乐赏析.doc', '2015-08-10 09:32:07', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f8949db000f', '910a7addaf344c36b71e057a193b6783', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '中国影视文化传播的现状和发展.doc', '2015-08-10 09:32:15', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f89ddb00012', 'fef9e3dbd477409dbf696daeff8da150', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '11569.jpg', '2015-08-10 09:32:53', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1f8a0fc70016', 'fef9e3dbd477409dbf696daeff8da150', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '11569.jpg', '2015-08-11 09:33:06', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f1fc92d9a0037', '902e20d9ef3046489069a07d0064f0d9', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '政治法律.docx', '2015-08-12 10:42:02', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f206c16640044', 'fef9e3dbd477409dbf696daeff8da150', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '11569.jpg', '2015-08-12 13:39:59', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f206db9080046', 'fef9e3dbd477409dbf696daeff8da150', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '11569.jpg', '2015-08-12 13:41:46', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f206f4b48004a', '2e680b029c594e67b53032349438fcd8', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '9 证据质证（终）060714.doc', '2015-08-12 13:43:29', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f20bcf75f004e', '61477bef37bc429d9fe23f20e26615a4', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '《婚姻法司法解释三》的理解与适用 最高人民法院 吴晓芳法官.docx', '2015-08-12 15:08:19', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f20be07940050', 'fc566a6ae51949dc98c69b6dce3e03ad', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '102910-106.jpg', '2015-08-12 15:09:29', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f1f856f014f20e148e90061', '57460763d5764af9a7f17b1621e5d7b6', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '分类法.txt', '2015-08-12 15:47:59', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f45d73f014f45d8766b0001', '82d8a77522d7444e9a513247e6a0e6aa', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '142C导学.ppt', '2015-08-19 20:04:18', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f45d73f014f45d893260002', 'b8308a66f4c64579ba7aba9bdc0a280f', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH6 函数.ppt', '2015-08-19 20:04:26', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f45d73f014f45d8e13c0003', '6a2455ce9dfd485499e9634e851e1c5e', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH8 结构体、联合与枚举.ppt', '2015-08-19 20:04:46', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f45d73f014f491a996e002f', '82d8a77522d7444e9a513247e6a0e6aa', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '142C导学.ppt', '2015-08-20 11:15:24', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f45d73f014f491a997c0030', '82d8a77522d7444e9a513247e6a0e6aa', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '142C导学.ppt', '2015-08-20 11:15:24', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f45d73f014f49358a280034', '6a2455ce9dfd485499e9634e851e1c5e', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', 'CH8 结构体、联合与枚举.ppt', '2015-08-20 11:44:50', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b452070001', 'b0a9ca944e2a49809b46a640a4f146c4', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH1 C程序设计基础.ppt', '2015-08-25 19:53:03', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b46c070002', '963118094bf94c64b5fdc61c5b9392f3', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH2 集成环境的使用.ppt', '2015-08-25 19:53:10', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b487fa0003', '6aaf7d89be9042d3a71420822110fbef', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH3 数据类型、运算符、表达式和常用输入输出函数.ppt', '2015-08-25 19:53:17', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b4abb30004', '4d2ca228a3c7442d89caf3164b5c9109', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH5 数组和字符串.ppt', '2015-08-25 19:53:26', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b4d6c10005', '0b71210ed6fb455abd05b8adf39cbaf7', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'CH7 指针.ppt', '2015-08-25 19:53:37', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b4f7a90006', 'da931884b7d549ff999c5bad57d2337a', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '第二章   C 语言语句.ppt', '2015-08-25 19:53:46', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b516120007', '5c317e5bdd2749bebd484df30ccb869b', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '第三章 程序设计基础.ppt', '2015-08-25 19:53:53', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b5469c0008', '21b90f9ed0f94f62b4b4e420e8797b80', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '3案例.doc', '2015-08-25 19:54:06', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b564910009', '3cde9c3257684391aa5dfc4b81a49d38', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '8民事诉讼案技巧.doc', '2015-08-25 19:54:13', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b5865b000a', '2f5ae60ba5e54a85aa3daac595225ad3', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '14“默示同意，明示反对”的合法性.doc', '2015-08-25 19:54:22', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b5a8e1000b', '40a2f58ef4584dc3995da9109598056f', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '18医疗纠纷.doc', '2015-08-25 19:54:31', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b5d0f4000c', 'dcc6b18585e94f58898bc436bc6e6863', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '19交通事故.doc', '2015-08-25 19:54:41', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b602bf000d', '8bf24bc686e846f0b57df48ad870e728', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '16婚姻家庭典型案例办案流程与法律运用详解讲义.doc', '2015-08-25 19:54:54', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b63eae000e', '4b72f63e810e46fdb47966fc98adece8', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '20如何办理劳动争议案件.doc', '2015-08-25 19:55:09', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b66779000f', '2ccb1be4d46c46d3963071a842e6468f', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '1年薪从0到12万：实习律师的成长之路.doc', '2015-08-25 19:55:20', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b6c81a0010', 'd7e6ead558214f6eae37a22c2bf9d5c5', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'HTML讲义.ppt', '2015-08-25 19:55:40', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b70b520011', '9f86863215194ff4937699797bc87648', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '课程简介.ppt', '2015-08-25 19:56:02', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b745eb0012', '88432b20622342afa25fc2a799bfac3c', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'BaMnO3.pdf', '2015-08-25 19:56:17', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b84dc00013', 'fd6d0d3b95054e78afc272efa7c2304f', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', 'RFeO3.pdf', '2015-08-25 19:57:24', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b8b7730014', '4c17139309744438ae081e7b611e2b84', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '人人影视新闻组考核稿20130602.pdf', '2015-08-25 19:57:51', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b8ea4a0015', '601a6c8c89a642f99ad08afa92bb4fc2', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '影视特效镜头跟踪-目录.pdf', '2015-08-25 19:58:04', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b910380016', '1db9973bf2604f9fb5f21f7efb82d97a', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '中华学生百科全书：影视艺术.pdf', '2015-08-25 19:58:14', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b952770017', '08d7b41febab4e45954734387e272393', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '影视音乐鉴赏论文电影音乐鉴赏论文.pdf', '2015-08-25 19:58:31', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b973fb0018', 'f822e31df1db47b9b73a4c1700e4e300', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '电影音乐赏析.doc', '2015-08-25 19:58:40', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b98bb50019', '2f50744a15be42f3beeecc9afa262ea8', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '花样年华音乐分析.txt', '2015-08-25 19:58:46', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b9ccb1001a', 'a70df49305d646dfa6526743ec97fa35', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '影视后期制作软件有哪些？.docx', '2015-08-25 19:59:02', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64b9f79f001b', '81fd189049354972ad2f699c0722f60d', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '影视鉴赏习题及答案.doc', '2015-08-25 19:59:13', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64ba2c2f001c', 'd7ceeebdb8f74b7195948b615745eb77', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '影视文化对当代大学生思想道德的影响及对策.doc', '2015-08-25 19:59:27', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64baa9f9001f', '7899cd5853684aef8b2ad44d73707e7b', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '拉玛西亚影视学院.doc', '2015-08-25 19:59:59', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64badd150020', 'd43ba5ecebaf4ab5b47c01c6e208be80', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '2011秋季学期考场安排-1103.xls', '2015-08-25 20:00:12', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64baf6f70021', 'f82a02ccebd549c79510a6fac0af4a08', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '00864094程序设计(C++).xls', '2015-08-25 20:00:19', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64bb3f5f0022', '110242380f4b44c998a7c6455f0a2f52', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '政治法律.txt', '2015-08-25 20:00:37', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64bb63b60023', 'ca511e8eac254296b84e00af559625dc', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '婚姻.xls', '2015-08-25 20:00:46', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8a8104cc4f64b29a014f64bb8d3f0024', '4f102f1f6b404fad9399d79f6c130e22', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '法律咨询.xls', '2015-08-25 20:00:57', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8ae3cf894f4dfad2014f4e0004fa000d', 'a6d8ed93029944d59b3fda8cc6e4913a', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', '花样年华音乐分析.txt', '2015-08-21 10:04:28', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8ae3cf894f4dfad2014f4e0064e80010', 'bfabf1cc4e9e4c7b87e5e09091d89c3a', null, 'DOWNLOAD', '影视音乐鉴赏论文电影音乐鉴赏论文.pdf', '2015-08-21 10:04:53', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8ae3cf894f4f2cb4014f4f30526d0002', 'bfabf1cc4e9e4c7b87e5e09091d89c3a', null, 'DOWNLOAD', '影视音乐鉴赏论文电影音乐鉴赏论文.pdf', '2015-08-21 15:36:51', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8ae3cf894f4f2cb4014f4f31a38b0004', 'd05e2a6451c246bfbb8696b2e1b1efbc', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'UPLOAD', '动态规划DP 7.29.ppt', '2015-08-21 15:38:17', null, null, null, null, null, null, null);
INSERT INTO `resourcemanagerlog` VALUES ('8ae3cf894f650d14014f650deaeb0001', 'b0a9ca944e2a49809b46a640a4f146c4', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'DOWNLOAD', 'CH1 C程序设计基础.ppt', '2015-08-25 21:30:55', null, '127.0.0.1', null, null, null, null, null);

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ROLEID` varchar(255) COLLATE utf8_bin NOT NULL,
  `ROLENAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ROLENOTE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ROLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('297e511f4f439cf4014f439cf80b0000', 'COMMON_USER', null);
INSERT INTO `role` VALUES ('297e511f4f439cf4014f439cf8950001', 'COMMON_ADMIN', null);
INSERT INTO `role` VALUES ('297e511f4f439cf4014f439cf8a40002', 'SUPER_ADMIN', null);

-- ----------------------------
-- Table structure for `role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `ROLEID` varchar(255) COLLATE utf8_bin NOT NULL,
  `PERMISSIONID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ROLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('297e511f4f439cf4014f439cf80b0000', '297e511f4f439cf4014f439cf8950009');
INSERT INTO `role_permission` VALUES ('297e511f4f439cf4014f439cf8950001', '297e511f4f439cf4014f439cf8950006');
INSERT INTO `role_permission` VALUES ('297e511f4f439cf4014f439cf8a40002', '297e511f4f439cf4014f439cf8950007');

-- ----------------------------
-- Table structure for `searchserver`
-- ----------------------------
DROP TABLE IF EXISTS `searchserver`;
CREATE TABLE `searchserver` (
  `RANDOMUUID` varchar(255) COLLATE utf8_bin NOT NULL,
  `SERVERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SERVERIP` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RENARK` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`RANDOMUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of searchserver
-- ----------------------------
INSERT INTO `searchserver` VALUES ('8a8104cc4f1f856f014f1f8bc0410025', 'ip0', '127.0.0.1', '本机服务器');

-- ----------------------------
-- Table structure for `stopwords`
-- ----------------------------
DROP TABLE IF EXISTS `stopwords`;
CREATE TABLE `stopwords` (
  `ID` varchar(255) COLLATE utf8_bin NOT NULL,
  `WORDS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of stopwords
-- ----------------------------
INSERT INTO `stopwords` VALUES ('8ae3cf894f158076014f15807e3c0000', '的');
INSERT INTO `stopwords` VALUES ('8ae3cf894f158076014f15807f430001', '了');
INSERT INTO `stopwords` VALUES ('8ae3cf894f158076014f15807f530002', '之');
INSERT INTO `stopwords` VALUES ('8ae3cf894f158076014f15807f530003', '乎');
INSERT INTO `stopwords` VALUES ('8ae3cf894f158076014f15807f620004', '也');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `USERUUID` varchar(255) COLLATE utf8_bin NOT NULL,
  `USERNAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEX` bit(1) DEFAULT NULL,
  `ORGANIZATIONS` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PHONENUMBER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REGISTERDATE` datetime DEFAULT NULL,
  `LASTLOGINDATE` datetime DEFAULT NULL,
  `DEADLINEDATE` datetime DEFAULT NULL,
  `LOGINVALIDATECODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SALT` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REGISTERVALIDATECODE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PERMISSIONLEVEL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ISVERIFIED` bit(1) DEFAULT NULL,
  `MAXCAPACITY` int(11) DEFAULT NULL,
  `USEDCAPACITY` int(11) DEFAULT NULL,
  `NOTTRACK` bit(1) DEFAULT NULL,
  PRIMARY KEY (`USERUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('0e14a08eb6f64cfebd7053c9f1fe86cc', 'admin', '', '上海大学', 'kangududefengjing@126.com', null, '2015-08-12 09:10:56', null, '2015-08-13 09:10:56', null, 'ba23494c1c2ddaf9', 'c014480dace79f23df007b583aefe76ca3830a52', '408b745f4d7d1859c6bdcb35ab8f5a8c4401d3ef', '2000', '', '2097152', '0', '');
INSERT INTO `user` VALUES ('6631c02ae3c54be3a080938c5a73120a', 'commonAdmin', '', '上海大学', '1262475866@qq.com', null, '2015-08-19 10:45:34', null, '2015-08-20 10:45:34', null, 'e5b14737b50c3295', 'aa51b74ea3040d3146ae820e766855fa3a24cad7', '46e17d14424d1cde3fac1a49b73d1fc7864e406a', '2000', '', '2097152', '0', '');
INSERT INTO `user` VALUES ('ee683d95b40b4e1a895352c805124995', 'commonUser', '', 'shu', 'true', null, '2015-08-23 10:10:20', null, '2015-08-24 10:10:20', null, 'a07a448ad5a60dcf', 'fcdb32d2563de8d60e5674e9f351b18aa4a26857', '8ee243b433627cdec744e95df24adde376689022', '2097152', '', '2097152', '0', '');

-- ----------------------------
-- Table structure for `userfile`
-- ----------------------------
DROP TABLE IF EXISTS `userfile`;
CREATE TABLE `userfile` (
  `FILEUUID` varchar(255) COLLATE utf8_bin NOT NULL,
  `USERUUID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FILENAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FILESIZE` int(11) DEFAULT NULL,
  `FILEREMARK` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ISPUBLIC` bit(1) DEFAULT NULL,
  `ISNEEDPWD` bit(1) DEFAULT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MD5` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`FILEUUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of userfile
-- ----------------------------
INSERT INTO `userfile` VALUES ('07aaf980565141ebbdc15400ead3c5c9', '0e14a08eb6f64cfebd7053c9f1fe86cc', '上海-奖项.xlsx', '45', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('0847cda16c5f4d73a538ef95a741fd24', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH7 指针.ppt', '227', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('08d7b41febab4e45954734387e272393', '0e14a08eb6f64cfebd7053c9f1fe86cc', '影视音乐鉴赏论文电影音乐鉴赏论文.pdf', '162', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('0b71210ed6fb455abd05b8adf39cbaf7', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH7 指针.ppt', '227', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('0fa453c6b863437698855c4888431d7b', '0e14a08eb6f64cfebd7053c9f1fe86cc', '142C导学.ppt', '233', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('110242380f4b44c998a7c6455f0a2f52', '0e14a08eb6f64cfebd7053c9f1fe86cc', '政治法律.txt', '2', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('1d35753bb6e64648949e6f2c4fa085af', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'Hydrangeas.jpg', '581', '花', '', '', null, null);
INSERT INTO `userfile` VALUES ('1db9973bf2604f9fb5f21f7efb82d97a', '0e14a08eb6f64cfebd7053c9f1fe86cc', '中华学生百科全书：影视艺术.pdf', '143', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('21af578b41214e1ca01b58bd63116e17', '0e14a08eb6f64cfebd7053c9f1fe86cc', '中国影视文化传播的现状和发展.doc', '38', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('21b90f9ed0f94f62b4b4e420e8797b80', '0e14a08eb6f64cfebd7053c9f1fe86cc', '3案例.doc', '55', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('246af1f89f374b51b37904c0f01cb004', '0e14a08eb6f64cfebd7053c9f1fe86cc', '第三章 程序设计基础.ppt', '803', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('251062f76d5a40e1b2f8af79e329283b', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH8 结构体、联合与枚举.ppt', '187', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('27e87065087241e7b7aaf9b08f719694', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH9 文件.ppt', '75', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('2ad83a32be764acfb9c7a47dc7eaf273', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH3 数据类型、运算符、表达式和常用输入输出函数.ppt', '271', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('2b2426cb493441f783fae607795ae5d5', '0e14a08eb6f64cfebd7053c9f1fe86cc', '8 庭审抗辩（二审）061211.doc', '68', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('2b88b11418f74aa8b1a9798f90fa4a5c', '0e14a08eb6f64cfebd7053c9f1fe86cc', '最佳实践.png', '26', '最佳实践', '', '', null, null);
INSERT INTO `userfile` VALUES ('2ccb1be4d46c46d3963071a842e6468f', '0e14a08eb6f64cfebd7053c9f1fe86cc', '1年薪从0到12万：实习律师的成长之路.doc', '95', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('2e680b029c594e67b53032349438fcd8', '0e14a08eb6f64cfebd7053c9f1fe86cc', '9 证据质证（终）060714.doc', '51', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('2f421841f3024e49aebe84f563e2059d', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH5 数组和字符串.ppt', '176', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('2f50744a15be42f3beeecc9afa262ea8', '0e14a08eb6f64cfebd7053c9f1fe86cc', '花样年华音乐分析.txt', '11', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('2f5ae60ba5e54a85aa3daac595225ad3', '0e14a08eb6f64cfebd7053c9f1fe86cc', '14“默示同意，明示反对”的合法性.doc', '35', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('303500d58e5c4a44a3c85e751438693e', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH6 函数.ppt', '226', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('3555fe3e1464453eb769fee88bd3aef8', '0e14a08eb6f64cfebd7053c9f1fe86cc', '第七章.ppt', '908', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('3b6e0d8f2af14389884b88103f32e4bb', '0e14a08eb6f64cfebd7053c9f1fe86cc', '法律.doc', '40', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('3cde9c3257684391aa5dfc4b81a49d38', '0e14a08eb6f64cfebd7053c9f1fe86cc', '8民事诉讼案技巧.doc', '355', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('40a2f58ef4584dc3995da9109598056f', '0e14a08eb6f64cfebd7053c9f1fe86cc', '18医疗纠纷.doc', '89', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('427fa10ba88f4b8f86aff44e0e4f1adb', '0e14a08eb6f64cfebd7053c9f1fe86cc', '电影音乐赏析.doc', '29', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('46f0888fe0224865afaf3d8d9f805dd1', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'Penguins.jpg', '759', '企鹅', '', '', null, null);
INSERT INTO `userfile` VALUES ('4940340d0e2b4deb873b237b0851c367', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH5 数组和字符串.ppt', '176', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('4b72f63e810e46fdb47966fc98adece8', '0e14a08eb6f64cfebd7053c9f1fe86cc', '20如何办理劳动争议案件.doc', '57', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('4b934abe5ad548d8b45fd5ea34fc13db', '0e14a08eb6f64cfebd7053c9f1fe86cc', '人人影视新闻组考核稿20130602.pdf', '489', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('4c17139309744438ae081e7b611e2b84', '0e14a08eb6f64cfebd7053c9f1fe86cc', '人人影视新闻组考核稿20130602.pdf', '489', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('4d2ca228a3c7442d89caf3164b5c9109', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH5 数组和字符串.ppt', '176', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('4d3d50170fac4757aaad7fa3cbb5a4e4', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'google.jpg', '119', 'google', '', '', null, null);
INSERT INTO `userfile` VALUES ('4e51e984a8d240989d78910b8e86688b', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH7 指针.ppt', '227', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('4f102f1f6b404fad9399d79f6c130e22', '0e14a08eb6f64cfebd7053c9f1fe86cc', '法律咨询.xls', '517', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('5003e681e4e847da91f750f344f791ee', '0e14a08eb6f64cfebd7053c9f1fe86cc', '上海-奖项.xlsx', '45', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('579642d4f9c24fe9a365fb0464417d87', '0e14a08eb6f64cfebd7053c9f1fe86cc', '第二章   C 语言语句.ppt', '1377', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('5874d65f22264722a314a98d00234d08', '0e14a08eb6f64cfebd7053c9f1fe86cc', '中华学生百科全书：影视艺术.pdf', '143', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('59380b00fbdb4479b26198bd89db3254', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'Koala.jpg', '762', '动物', '', '', null, null);
INSERT INTO `userfile` VALUES ('5c317e5bdd2749bebd484df30ccb869b', '0e14a08eb6f64cfebd7053c9f1fe86cc', '第三章 程序设计基础.ppt', '803', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('5d756f99478c40769a35b303a163cba3', '0e14a08eb6f64cfebd7053c9f1fe86cc', '婚姻.xls', '299', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('5f1240e4e7f54c36a824389aafa1c59b', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'GUIDE1027使用说明.pdf', '1701', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('601a6c8c89a642f99ad08afa92bb4fc2', '0e14a08eb6f64cfebd7053c9f1fe86cc', '影视特效镜头跟踪-目录.pdf', '214', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('63a0d062d4f44691b422c30635a2770d', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH1 C程序设计基础.ppt', '64', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('67bd5fed5ec844b685bc9bf146157012', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'Penguins.jpg', '759', '企鹅', '', '', null, null);
INSERT INTO `userfile` VALUES ('683d2b8fc43947e2910e5d16a7fe201d', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'Hydrangeas.jpg', '581', '动物', '', '', null, null);
INSERT INTO `userfile` VALUES ('6a2455ce9dfd485499e9634e851e1c5e', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH8 结构体、联合与枚举.ppt', '187', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('6aaf7d89be9042d3a71420822110fbef', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH3 数据类型、运算符、表达式和常用输入输出函数.ppt', '271', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('6cb5525363744d019d8d1ebc6f6caa44', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH6 函数.ppt', '226', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('6fb109c934a04a6e8dc76e3edac7e71c', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH9 文件.ppt', '75', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('71c63b38d9894247a55cc9d6c4f42125', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH8 结构体、联合与枚举.ppt', '187', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('71d5a99c3eb4472eaf325924fc9bc3ea', '0e14a08eb6f64cfebd7053c9f1fe86cc', '词频统计.png', '35', '词频统计', '', '', null, null);
INSERT INTO `userfile` VALUES ('731900858cb44ab2a47456ba3d7b73cb', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH6 函数.ppt', '226', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('7484bab893fd4427b7fec80473b26d88', '0e14a08eb6f64cfebd7053c9f1fe86cc', '影视音乐鉴赏论文电影音乐鉴赏论文.pdf', '162', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('75b91bbcac2d444ca9627166348c073d', '0e14a08eb6f64cfebd7053c9f1fe86cc', '8民事诉讼案技巧.doc', '355', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('7899cd5853684aef8b2ad44d73707e7b', '0e14a08eb6f64cfebd7053c9f1fe86cc', '拉玛西亚影视学院.doc', '123', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('79d14ba9c6944b8cba948ec2dbd77483', '0e14a08eb6f64cfebd7053c9f1fe86cc', '第一章.ppt', '1581', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('7bdac39227104afb84ee9f7bbd5edea3', '0e14a08eb6f64cfebd7053c9f1fe86cc', '3案例.doc', '55', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('7c24daaa685a4c9a991f339509b1cdae', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH9 文件.ppt', '75', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('81fd189049354972ad2f699c0722f60d', '0e14a08eb6f64cfebd7053c9f1fe86cc', '影视鉴赏习题及答案.doc', '88', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('83e655b735ce4b628c8590ada8e79de4', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH9 文件.ppt', '75', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('8500e49d6fbd4f43a9b371ab1accdde3', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH5 数组和字符串.ppt', '176', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('866459b4bff641daaa9d132ac80ea579', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH7 指针.ppt', '227', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('869d32bc52684fbfb17a3400429149de', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'Desert.jpg', '826', '沙漠', '', '', null, null);
INSERT INTO `userfile` VALUES ('87dad48f58c84241946729c8eacd67c4', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH6 函数.ppt', '226', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('88432b20622342afa25fc2a799bfac3c', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'BaMnO3.pdf', '279', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('88ac89f228d9423c8c9cb6f6469be20d', '0e14a08eb6f64cfebd7053c9f1fe86cc', '计算机文化基础课程要求.doc', '54', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('8bf24bc686e846f0b57df48ad870e728', '0e14a08eb6f64cfebd7053c9f1fe86cc', '16婚姻家庭典型案例办案流程与法律运用详解讲义.doc', '131', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('8c145ffaf1a14bfe9a45ebf6519dd0ef', '0e14a08eb6f64cfebd7053c9f1fe86cc', '影视后期常用软件大集合.docx', '18', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('8dd395029cdf44d89229eb2f27aeaf33', '0e14a08eb6f64cfebd7053c9f1fe86cc', '婚姻.xls', '299', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('963118094bf94c64b5fdc61c5b9392f3', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH2 集成环境的使用.ppt', '258', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('9f07befd860b4b8fb7353b4339dc8c10', '0e14a08eb6f64cfebd7053c9f1fe86cc', '第九章.ppt', '1191', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('9f4ead5043d64a48811829caa1fd3cbb', '0e14a08eb6f64cfebd7053c9f1fe86cc', '第二章   C 语言语句.ppt', '1377', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('9f86863215194ff4937699797bc87648', '0e14a08eb6f64cfebd7053c9f1fe86cc', '课程简介.ppt', '945', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('a70df49305d646dfa6526743ec97fa35', '0e14a08eb6f64cfebd7053c9f1fe86cc', '影视后期制作软件有哪些？.docx', '249', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('a76c1208e9a443c4956dc1dedb82c83f', '0e14a08eb6f64cfebd7053c9f1fe86cc', '上海-奖项.xlsx', '45', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('afe0cb50bbf2453b8a064f1cf414b62e', '0e14a08eb6f64cfebd7053c9f1fe86cc', '法律.txt', '36', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('b0a9ca944e2a49809b46a640a4f146c4', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH1 C程序设计基础.ppt', '64', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('b35d8a24881f4344bd3db0e540a71f3a', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'changes.docx', '211', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('b477121cee424d98b714f904e2e5bfa9', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'Koala.jpg', '762', '动物', '', '', null, null);
INSERT INTO `userfile` VALUES ('b4fd29b31a05457cb254a4f8a9b17176', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH2 集成环境的使用.ppt', '258', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('bb3c2cdeb5ed4f9cb82444d99982536a', '0e14a08eb6f64cfebd7053c9f1fe86cc', '第三章 程序设计基础.ppt', '803', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('bfb7ad6eff4e4d638bcccc2a918398e8', '0e14a08eb6f64cfebd7053c9f1fe86cc', '法律.xls', '619', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('c53a47ee892842f896b3527142144f1c', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH6 函数.ppt', '226', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('c9473102f4b142eea1b062e3f99ffc74', '0e14a08eb6f64cfebd7053c9f1fe86cc', '花样年华音乐分析.txt', '11', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('ca511e8eac254296b84e00af559625dc', '0e14a08eb6f64cfebd7053c9f1fe86cc', '婚姻.xls', '299', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('cae5cecc96b046abb529c7b25c2b69a9', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'Tulips.jpg', '606', '郁金香', '', '', null, null);
INSERT INTO `userfile` VALUES ('ce73629e2df143b0aad7ad11b2c8f57f', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH9 文件.ppt', '75', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('d05e2a6451c246bfbb8696b2e1b1efbc', '0e14a08eb6f64cfebd7053c9f1fe86cc', '动态规划DP 7.29.ppt', '180', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('d3565f28677645648d408f9a9b701e50', '0e14a08eb6f64cfebd7053c9f1fe86cc', '7律师主持调解工作技巧和方法.doc', '118', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('d43ba5ecebaf4ab5b47c01c6e208be80', '0e14a08eb6f64cfebd7053c9f1fe86cc', '2011秋季学期考场安排-1103.xls', '29', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('d7ceeebdb8f74b7195948b615745eb77', '0e14a08eb6f64cfebd7053c9f1fe86cc', '影视文化对当代大学生思想道德的影响及对策.doc', '20', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('d7e6ead558214f6eae37a22c2bf9d5c5', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'HTML讲义.ppt', '633', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('d932785828ae400a9c0387ca43500668', '0e14a08eb6f64cfebd7053c9f1fe86cc', '上海-奖项.xlsx', '45', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('da931884b7d549ff999c5bad57d2337a', '0e14a08eb6f64cfebd7053c9f1fe86cc', '第二章   C 语言语句.ppt', '1377', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('dab7d78493734a35adcedc56dc625a44', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH2 集成环境的使用.ppt', '258', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('dacdff5cf7874cc5a076b41464499036', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'CH1 C程序设计基础.ppt', '64', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('dcc6b18585e94f58898bc436bc6e6863', '0e14a08eb6f64cfebd7053c9f1fe86cc', '19交通事故.doc', '128', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('e5d1f773783c4b3582851134f01cf6d8', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'GUIDE1027使用说明.pdf', '1701', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('f575b1971d4745698318058bda00525f', '0e14a08eb6f64cfebd7053c9f1fe86cc', '中华学生百科全书：影视艺术.pdf', '143', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('f822e31df1db47b9b73a4c1700e4e300', '0e14a08eb6f64cfebd7053c9f1fe86cc', '电影音乐赏析.doc', '29', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('f82a02ccebd549c79510a6fac0af4a08', '0e14a08eb6f64cfebd7053c9f1fe86cc', '00864094程序设计(C++).xls', '44', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('f8c69d05e0d64552839bcbf6d2517061', '0e14a08eb6f64cfebd7053c9f1fe86cc', '计算机文化基础课程要求.doc', '54', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('fb7893136bac414f95a5cfa648cd2cae', '0e14a08eb6f64cfebd7053c9f1fe86cc', '拆迁问题的法律谈判技巧讲义.pdf', '118', null, '', '', null, null);
INSERT INTO `userfile` VALUES ('fd6d0d3b95054e78afc272efa7c2304f', '0e14a08eb6f64cfebd7053c9f1fe86cc', 'RFeO3.pdf', '3981', null, '', '', null, null);

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `ROLEID` varchar(255) COLLATE utf8_bin NOT NULL,
  `USERUUID` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `RANDOMUUID` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ROLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('297e511f4f439cf4014f439cf8950001', '6631c02ae3c54be3a080938c5a73120a', '297e511f4f439cf4014f489cf8a40002');
INSERT INTO `user_role` VALUES ('297e511f4f439cf4014f439cf8a40002', '0e14a08eb6f64cfebd7053c9f1fe86cc', '0e14a08eb6f64cfebd7053c9f1fe8656');
