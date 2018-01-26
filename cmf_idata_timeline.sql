/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : idata

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-25 23:40:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cmf_idata_timeline
-- ----------------------------
DROP TABLE IF EXISTS `cmf_idata_timeline`;
CREATE TABLE `cmf_idata_timeline` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `access_type` varchar(10) NOT NULL DEFAULT '' COMMENT '访问类型：pc电脑 wap移动 wechat微信',
  `year` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '年份',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别：0未知 1男 2女',
  `album` text COMMENT '图集',
  `sound` varchar(255) NOT NULL DEFAULT '' COMMENT '声音',
  `video` varchar(255) NOT NULL DEFAULT '' COMMENT '视频',
  `file` varchar(255) NOT NULL DEFAULT '' COMMENT '文件',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '文字描述',
  `content` text COMMENT '内容详情',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT 'IP',
  `line_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间线',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `modtimes` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '修改次数',
  `is_star` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '星标：0无 1一级 2二级 3三级 ……',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：-1封存 1显示 0隐藏 ',
  `more` text COMMENT '拓展',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_idata_timeline
-- ----------------------------
INSERT INTO `cmf_idata_timeline` VALUES ('1', 'pc', '2016', '第一天', '', '0', null, '', '', '', '', null, '127.0.0.1', '1516888020', '1516811055', '0', '1516888042', '0', '0', '1', null);
INSERT INTO `cmf_idata_timeline` VALUES ('2', 'pc', '2017', '第二天', '', '0', null, '', '', '', '', null, '127.0.0.1', '1516888260', '1516811321', '0', '1516888281', '0', '0', '1', null);
INSERT INTO `cmf_idata_timeline` VALUES ('3', 'pc', '2017', '泡泡', '', '0', null, '', '', '', '', null, '127.0.0.1', '1516888260', '1516887620', '0', '1516888374', '0', '0', '1', null);
INSERT INTO `cmf_idata_timeline` VALUES ('4', 'pc', '2018', '第一个红绿灯', '', '0', null, '', '', '', '', null, '127.0.0.1', '1516888380', '1516888411', '0', '1516889696', '0', '0', '1', null);
INSERT INTO `cmf_idata_timeline` VALUES ('5', 'pc', '2018', '规范', '', '0', null, '', '', '', '', null, '127.0.0.1', '1516889760', '1516889789', '0', '1516889902', '0', '0', '1', null);
INSERT INTO `cmf_idata_timeline` VALUES ('6', 'pc', '2018', '记忆', '', '0', null, '', '', '', '', null, '127.0.0.1', '1516889880', '1516889919', '0', '1516889919', '0', '0', '1', null);
