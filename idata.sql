/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : idata

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-01-17 12:17:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cmf_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `cmf_admin_menu`;
CREATE TABLE `cmf_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(15) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parent_id`),
  KEY `model` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';

-- ----------------------------
-- Records of cmf_admin_menu
-- ----------------------------
INSERT INTO `cmf_admin_menu` VALUES ('1', '0', '0', '1', '200', 'admin', 'Plugin', 'default', '', '插件管理', 'cloud', '插件管理');
INSERT INTO `cmf_admin_menu` VALUES ('2', '1', '1', '1', '1', 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理');
INSERT INTO `cmf_admin_menu` VALUES ('3', '2', '1', '0', '10000', 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理');
INSERT INTO `cmf_admin_menu` VALUES ('4', '2', '2', '0', '10000', 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序');
INSERT INTO `cmf_admin_menu` VALUES ('5', '2', '1', '0', '10000', 'admin', 'Hook', 'sync', '', '同步钩子', '', '同步钩子');
INSERT INTO `cmf_admin_menu` VALUES ('6', '0', '0', '1', '0', 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口');
INSERT INTO `cmf_admin_menu` VALUES ('7', '6', '1', '1', '40', 'admin', 'Link', 'index', '', '友情链接', '', '友情链接管理');
INSERT INTO `cmf_admin_menu` VALUES ('8', '7', '1', '0', '10000', 'admin', 'Link', 'add', '', '添加友情链接', '', '添加友情链接');
INSERT INTO `cmf_admin_menu` VALUES ('9', '7', '2', '0', '10000', 'admin', 'Link', 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('10', '7', '1', '0', '10000', 'admin', 'Link', 'edit', '', '编辑友情链接', '', '编辑友情链接');
INSERT INTO `cmf_admin_menu` VALUES ('11', '7', '2', '0', '10000', 'admin', 'Link', 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('12', '7', '2', '0', '10000', 'admin', 'Link', 'delete', '', '删除友情链接', '', '删除友情链接');
INSERT INTO `cmf_admin_menu` VALUES ('13', '7', '2', '0', '10000', 'admin', 'Link', 'listOrder', '', '友情链接排序', '', '友情链接排序');
INSERT INTO `cmf_admin_menu` VALUES ('14', '7', '2', '0', '10000', 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏');
INSERT INTO `cmf_admin_menu` VALUES ('15', '6', '1', '1', '10', 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置');
INSERT INTO `cmf_admin_menu` VALUES ('16', '15', '2', '0', '10000', 'admin', 'Mailer', 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('17', '15', '1', '0', '10000', 'admin', 'Mailer', 'template', '', '邮件模板', '', '邮件模板');
INSERT INTO `cmf_admin_menu` VALUES ('18', '15', '2', '0', '10000', 'admin', 'Mailer', 'templatePost', '', '邮件模板提交', '', '邮件模板提交');
INSERT INTO `cmf_admin_menu` VALUES ('19', '15', '1', '0', '10000', 'admin', 'Mailer', 'test', '', '邮件发送测试', '', '邮件发送测试');
INSERT INTO `cmf_admin_menu` VALUES ('20', '6', '1', '0', '200', 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理');
INSERT INTO `cmf_admin_menu` VALUES ('21', '20', '1', '0', '10000', 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表');
INSERT INTO `cmf_admin_menu` VALUES ('22', '20', '1', '0', '10000', 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加');
INSERT INTO `cmf_admin_menu` VALUES ('23', '20', '2', '0', '10000', 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('24', '20', '1', '0', '10000', 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑');
INSERT INTO `cmf_admin_menu` VALUES ('25', '20', '2', '0', '10000', 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('26', '20', '2', '0', '10000', 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除');
INSERT INTO `cmf_admin_menu` VALUES ('27', '20', '2', '0', '10000', 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序');
INSERT INTO `cmf_admin_menu` VALUES ('28', '20', '1', '0', '10000', 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单');
INSERT INTO `cmf_admin_menu` VALUES ('29', '6', '1', '1', '20', 'admin', 'Nav', 'index', '', '导航管理', '', '导航管理');
INSERT INTO `cmf_admin_menu` VALUES ('30', '29', '1', '0', '10000', 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航');
INSERT INTO `cmf_admin_menu` VALUES ('31', '29', '2', '0', '10000', 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('32', '29', '1', '0', '10000', 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航');
INSERT INTO `cmf_admin_menu` VALUES ('33', '29', '2', '0', '10000', 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('34', '29', '2', '0', '10000', 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航');
INSERT INTO `cmf_admin_menu` VALUES ('35', '29', '1', '0', '10000', 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单');
INSERT INTO `cmf_admin_menu` VALUES ('36', '35', '1', '0', '10000', 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单');
INSERT INTO `cmf_admin_menu` VALUES ('37', '35', '2', '0', '10000', 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('38', '35', '1', '0', '10000', 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单');
INSERT INTO `cmf_admin_menu` VALUES ('39', '35', '2', '0', '10000', 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('40', '35', '2', '0', '10000', 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单');
INSERT INTO `cmf_admin_menu` VALUES ('41', '35', '2', '0', '10000', 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序');
INSERT INTO `cmf_admin_menu` VALUES ('42', '1', '1', '1', '2', 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表');
INSERT INTO `cmf_admin_menu` VALUES ('43', '42', '2', '0', '10000', 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用');
INSERT INTO `cmf_admin_menu` VALUES ('44', '42', '1', '0', '10000', 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置');
INSERT INTO `cmf_admin_menu` VALUES ('45', '42', '2', '0', '10000', 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交');
INSERT INTO `cmf_admin_menu` VALUES ('46', '42', '2', '0', '10000', 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装');
INSERT INTO `cmf_admin_menu` VALUES ('47', '42', '2', '0', '10000', 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新');
INSERT INTO `cmf_admin_menu` VALUES ('48', '42', '2', '0', '10000', 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件');
INSERT INTO `cmf_admin_menu` VALUES ('49', '109', '0', '1', '1', 'admin', 'User', 'default', '', '管理组', '', '管理组');
INSERT INTO `cmf_admin_menu` VALUES ('50', '49', '1', '1', '10000', 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理');
INSERT INTO `cmf_admin_menu` VALUES ('51', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色');
INSERT INTO `cmf_admin_menu` VALUES ('52', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交');
INSERT INTO `cmf_admin_menu` VALUES ('53', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色');
INSERT INTO `cmf_admin_menu` VALUES ('54', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交');
INSERT INTO `cmf_admin_menu` VALUES ('55', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色');
INSERT INTO `cmf_admin_menu` VALUES ('56', '50', '1', '0', '10000', 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限');
INSERT INTO `cmf_admin_menu` VALUES ('57', '50', '2', '0', '10000', 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交');
INSERT INTO `cmf_admin_menu` VALUES ('58', '0', '1', '0', '10000', 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站');
INSERT INTO `cmf_admin_menu` VALUES ('59', '58', '2', '0', '1', 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原');
INSERT INTO `cmf_admin_menu` VALUES ('60', '58', '2', '0', '2', 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除');
INSERT INTO `cmf_admin_menu` VALUES ('61', '6', '1', '1', '140', 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理');
INSERT INTO `cmf_admin_menu` VALUES ('62', '61', '1', '0', '10000', 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则');
INSERT INTO `cmf_admin_menu` VALUES ('63', '61', '2', '0', '10000', 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交');
INSERT INTO `cmf_admin_menu` VALUES ('64', '61', '1', '0', '10000', 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑');
INSERT INTO `cmf_admin_menu` VALUES ('65', '61', '2', '0', '10000', 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交');
INSERT INTO `cmf_admin_menu` VALUES ('66', '61', '2', '0', '10000', 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除');
INSERT INTO `cmf_admin_menu` VALUES ('67', '61', '2', '0', '10000', 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用');
INSERT INTO `cmf_admin_menu` VALUES ('68', '61', '2', '0', '10000', 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用');
INSERT INTO `cmf_admin_menu` VALUES ('69', '61', '2', '0', '10000', 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序');
INSERT INTO `cmf_admin_menu` VALUES ('70', '61', '1', '0', '10000', 'admin', 'Route', 'select', '', '选择URL', '', '选择URL');
INSERT INTO `cmf_admin_menu` VALUES ('71', '6', '1', '1', '0', 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息');
INSERT INTO `cmf_admin_menu` VALUES ('72', '71', '2', '0', '10000', 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交');
INSERT INTO `cmf_admin_menu` VALUES ('73', '6', '1', '0', '100', 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改');
INSERT INTO `cmf_admin_menu` VALUES ('74', '73', '2', '0', '10000', 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交');
INSERT INTO `cmf_admin_menu` VALUES ('75', '6', '1', '1', '60', 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置');
INSERT INTO `cmf_admin_menu` VALUES ('76', '75', '2', '0', '10000', 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交');
INSERT INTO `cmf_admin_menu` VALUES ('77', '6', '1', '0', '10000', 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存');
INSERT INTO `cmf_admin_menu` VALUES ('78', '6', '1', '1', '30', 'admin', 'Slide', 'index', '', '幻灯片管理', '', '幻灯片管理');
INSERT INTO `cmf_admin_menu` VALUES ('79', '78', '1', '0', '10000', 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片');
INSERT INTO `cmf_admin_menu` VALUES ('80', '78', '2', '0', '10000', 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交');
INSERT INTO `cmf_admin_menu` VALUES ('81', '78', '1', '0', '10000', 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片');
INSERT INTO `cmf_admin_menu` VALUES ('82', '78', '2', '0', '10000', 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交');
INSERT INTO `cmf_admin_menu` VALUES ('83', '78', '2', '0', '10000', 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片');
INSERT INTO `cmf_admin_menu` VALUES ('84', '78', '1', '0', '10000', 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表');
INSERT INTO `cmf_admin_menu` VALUES ('85', '84', '1', '0', '10000', 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加');
INSERT INTO `cmf_admin_menu` VALUES ('86', '84', '2', '0', '10000', 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交');
INSERT INTO `cmf_admin_menu` VALUES ('87', '84', '1', '0', '10000', 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑');
INSERT INTO `cmf_admin_menu` VALUES ('88', '84', '2', '0', '10000', 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交');
INSERT INTO `cmf_admin_menu` VALUES ('89', '84', '2', '0', '10000', 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除');
INSERT INTO `cmf_admin_menu` VALUES ('90', '84', '2', '0', '10000', 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏');
INSERT INTO `cmf_admin_menu` VALUES ('91', '84', '2', '0', '10000', 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示');
INSERT INTO `cmf_admin_menu` VALUES ('92', '84', '2', '0', '10000', 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序');
INSERT INTO `cmf_admin_menu` VALUES ('93', '6', '1', '1', '70', 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储');
INSERT INTO `cmf_admin_menu` VALUES ('94', '93', '2', '0', '10000', 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交');
INSERT INTO `cmf_admin_menu` VALUES ('95', '6', '1', '1', '150', 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理');
INSERT INTO `cmf_admin_menu` VALUES ('96', '95', '1', '0', '10000', 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板');
INSERT INTO `cmf_admin_menu` VALUES ('97', '95', '2', '0', '10000', 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板');
INSERT INTO `cmf_admin_menu` VALUES ('98', '95', '2', '0', '10000', 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装');
INSERT INTO `cmf_admin_menu` VALUES ('99', '95', '2', '0', '10000', 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新');
INSERT INTO `cmf_admin_menu` VALUES ('100', '95', '2', '0', '10000', 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板');
INSERT INTO `cmf_admin_menu` VALUES ('101', '95', '1', '0', '10000', 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板');
INSERT INTO `cmf_admin_menu` VALUES ('102', '95', '1', '0', '10000', 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置');
INSERT INTO `cmf_admin_menu` VALUES ('103', '95', '1', '0', '10000', 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表');
INSERT INTO `cmf_admin_menu` VALUES ('104', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑');
INSERT INTO `cmf_admin_menu` VALUES ('105', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('106', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除');
INSERT INTO `cmf_admin_menu` VALUES ('107', '95', '2', '0', '10000', 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('108', '95', '1', '0', '10000', 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源');
INSERT INTO `cmf_admin_menu` VALUES ('109', '0', '0', '1', '100', 'user', 'AdminIndex', 'default', '', '用户管理', 'group', '用户管理');
INSERT INTO `cmf_admin_menu` VALUES ('110', '49', '1', '1', '10000', 'admin', 'User', 'index', '', '管理员', '', '管理员管理');
INSERT INTO `cmf_admin_menu` VALUES ('111', '110', '1', '0', '10000', 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加');
INSERT INTO `cmf_admin_menu` VALUES ('112', '110', '2', '0', '10000', 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交');
INSERT INTO `cmf_admin_menu` VALUES ('113', '110', '1', '0', '10000', 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑');
INSERT INTO `cmf_admin_menu` VALUES ('114', '110', '2', '0', '10000', 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交');
INSERT INTO `cmf_admin_menu` VALUES ('115', '110', '1', '0', '10000', 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改');
INSERT INTO `cmf_admin_menu` VALUES ('116', '110', '2', '0', '10000', 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交');
INSERT INTO `cmf_admin_menu` VALUES ('117', '110', '2', '0', '10000', 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除');
INSERT INTO `cmf_admin_menu` VALUES ('118', '110', '2', '0', '10000', 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员');
INSERT INTO `cmf_admin_menu` VALUES ('119', '110', '2', '0', '10000', 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员');
INSERT INTO `cmf_admin_menu` VALUES ('120', '0', '0', '1', '300', 'portal', 'AdminIndex', 'default', '', '门户管理', 'th', '门户管理');
INSERT INTO `cmf_admin_menu` VALUES ('121', '120', '1', '1', '1', 'portal', 'AdminArticle', 'index', '', '文章管理', '', '文章列表');
INSERT INTO `cmf_admin_menu` VALUES ('122', '121', '1', '0', '10000', 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章');
INSERT INTO `cmf_admin_menu` VALUES ('123', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交');
INSERT INTO `cmf_admin_menu` VALUES ('124', '121', '1', '0', '10000', 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章');
INSERT INTO `cmf_admin_menu` VALUES ('125', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交');
INSERT INTO `cmf_admin_menu` VALUES ('126', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除');
INSERT INTO `cmf_admin_menu` VALUES ('127', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布');
INSERT INTO `cmf_admin_menu` VALUES ('128', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶');
INSERT INTO `cmf_admin_menu` VALUES ('129', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐');
INSERT INTO `cmf_admin_menu` VALUES ('130', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序');
INSERT INTO `cmf_admin_menu` VALUES ('131', '120', '1', '1', '2', 'portal', 'AdminCategory', 'index', '', '分类管理', '', '文章分类列表');
INSERT INTO `cmf_admin_menu` VALUES ('132', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类');
INSERT INTO `cmf_admin_menu` VALUES ('133', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交');
INSERT INTO `cmf_admin_menu` VALUES ('134', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类');
INSERT INTO `cmf_admin_menu` VALUES ('135', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交');
INSERT INTO `cmf_admin_menu` VALUES ('136', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框');
INSERT INTO `cmf_admin_menu` VALUES ('137', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序');
INSERT INTO `cmf_admin_menu` VALUES ('138', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类');
INSERT INTO `cmf_admin_menu` VALUES ('139', '120', '1', '1', '3', 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理');
INSERT INTO `cmf_admin_menu` VALUES ('140', '139', '1', '0', '10000', 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面');
INSERT INTO `cmf_admin_menu` VALUES ('141', '139', '2', '0', '10000', 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交');
INSERT INTO `cmf_admin_menu` VALUES ('142', '139', '1', '0', '10000', 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面');
INSERT INTO `cmf_admin_menu` VALUES ('143', '139', '2', '0', '10000', 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交');
INSERT INTO `cmf_admin_menu` VALUES ('144', '139', '2', '0', '10000', 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面');
INSERT INTO `cmf_admin_menu` VALUES ('145', '120', '1', '1', '4', 'portal', 'AdminTag', 'index', '', '文章标签', '', '文章标签');
INSERT INTO `cmf_admin_menu` VALUES ('146', '145', '1', '0', '10000', 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签');
INSERT INTO `cmf_admin_menu` VALUES ('147', '145', '2', '0', '10000', 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交');
INSERT INTO `cmf_admin_menu` VALUES ('148', '145', '2', '0', '10000', 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态');
INSERT INTO `cmf_admin_menu` VALUES ('149', '145', '2', '0', '10000', 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签');
INSERT INTO `cmf_admin_menu` VALUES ('150', '0', '1', '0', '10000', 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表');
INSERT INTO `cmf_admin_menu` VALUES ('151', '150', '2', '0', '10000', 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件');
INSERT INTO `cmf_admin_menu` VALUES ('152', '109', '0', '1', '2', 'user', 'AdminIndex', 'default1', '', '用户组', '', '用户组');
INSERT INTO `cmf_admin_menu` VALUES ('153', '152', '1', '1', '10000', 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户');
INSERT INTO `cmf_admin_menu` VALUES ('154', '153', '2', '0', '10000', 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑');
INSERT INTO `cmf_admin_menu` VALUES ('155', '153', '2', '0', '10000', 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用');
INSERT INTO `cmf_admin_menu` VALUES ('156', '152', '1', '1', '10000', 'user', 'AdminOauth', 'index', '', '第三方用户', '', '第三方用户');
INSERT INTO `cmf_admin_menu` VALUES ('157', '156', '2', '0', '10000', 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定');
INSERT INTO `cmf_admin_menu` VALUES ('158', '6', '1', '1', '130', 'user', 'AdminUserAction', 'index', '', '用户操作管理', '', '用户操作管理');
INSERT INTO `cmf_admin_menu` VALUES ('159', '158', '1', '0', '10000', 'user', 'AdminUserAction', 'edit', '', '编辑用户操作', '', '编辑用户操作');
INSERT INTO `cmf_admin_menu` VALUES ('160', '158', '2', '0', '10000', 'user', 'AdminUserAction', 'editPost', '', '编辑用户操作提交', '', '编辑用户操作提交');
INSERT INTO `cmf_admin_menu` VALUES ('161', '158', '1', '0', '10000', 'user', 'AdminUserAction', 'sync', '', '同步用户操作', '', '同步用户操作');
INSERT INTO `cmf_admin_menu` VALUES ('162', '0', '0', '1', '10', 'lol', 'AdminIndex', 'default', '', '游戏', 'gamepad', 'lol');
INSERT INTO `cmf_admin_menu` VALUES ('163', '162', '1', '1', '1', 'lol', 'AdminIndex', 'index', '', '数据中心', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('164', '162', '1', '1', '2', 'lol', 'AdminHero', 'index', '', '英雄大全', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('165', '162', '1', '1', '3', 'lol', 'AdminMode', 'index', '', '游戏模式', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('166', '162', '1', '1', '4', 'lol', 'AdminZone', 'index', '', '大区数据', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('167', '162', '1', '1', '5', 'lol', 'AdminMatch', 'index', '', '我的比赛', '', '我的大乱斗');
INSERT INTO `cmf_admin_menu` VALUES ('168', '162', '1', '1', '6', 'lol', 'AdminAnalyze', 'index', '', '数据分析', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('169', '162', '1', '1', '7', 'lol', 'AdminExcel', 'index', '', '导入导出', '', 'import and export');
INSERT INTO `cmf_admin_menu` VALUES ('170', '162', '1', '1', '8', 'lol', 'AdminPlay', 'index', '', '直播录像', '', '直播和录像');
INSERT INTO `cmf_admin_menu` VALUES ('171', '0', '0', '1', '20', 'idata', 'AdminIndex', 'default', '', 'iData', 'key', '我的数据');
INSERT INTO `cmf_admin_menu` VALUES ('172', '171', '1', '1', '10000', 'idata', 'AdminIndex', 'index', '', '数据中心', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('173', '171', '1', '1', '10000', 'idata', 'AdminIndex', 'f511', '', 'F511', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('174', '6', '1', '1', '110', 'admin', 'DbBackup', 'index', '', '数据库管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('175', '6', '1', '1', '120', 'admin', 'District', 'index', '', '地区管理', '', '');

-- ----------------------------
-- Table structure for cmf_asset
-- ----------------------------
DROP TABLE IF EXISTS `cmf_asset`;
CREATE TABLE `cmf_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

-- ----------------------------
-- Records of cmf_asset
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of cmf_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_rule`;
CREATE TABLE `cmf_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(15) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';

-- ----------------------------
-- Records of cmf_auth_rule
-- ----------------------------
INSERT INTO `cmf_auth_rule` VALUES ('1', '1', 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('2', '1', 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('3', '1', 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('4', '1', 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', '');
INSERT INTO `cmf_auth_rule` VALUES ('5', '1', 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('6', '1', 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('7', '1', 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('8', '1', 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('9', '1', 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('10', '1', 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('11', '1', 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('12', '1', 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES ('13', '1', 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', '');
INSERT INTO `cmf_auth_rule` VALUES ('14', '1', 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('15', '1', 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('16', '1', 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('17', '1', 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', '');
INSERT INTO `cmf_auth_rule` VALUES ('18', '1', 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('19', '1', 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('20', '1', 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('21', '1', 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('22', '1', 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('23', '1', 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('24', '1', 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('25', '1', 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('26', '1', 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('27', '1', 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('28', '1', 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', '');
INSERT INTO `cmf_auth_rule` VALUES ('29', '1', 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('30', '1', 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', '');
INSERT INTO `cmf_auth_rule` VALUES ('31', '1', 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('32', '1', 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', '');
INSERT INTO `cmf_auth_rule` VALUES ('33', '1', 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('34', '1', 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('35', '1', 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('36', '1', 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('37', '1', 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('38', '1', 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('39', '1', 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('40', '1', 'admin', 'admin_url', 'admin/Plugin/default', '', '插件管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('41', '1', 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('42', '1', 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', '');
INSERT INTO `cmf_auth_rule` VALUES ('43', '1', 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('44', '1', 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('45', '1', 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', '');
INSERT INTO `cmf_auth_rule` VALUES ('46', '1', 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', '');
INSERT INTO `cmf_auth_rule` VALUES ('47', '1', 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', '');
INSERT INTO `cmf_auth_rule` VALUES ('48', '1', 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('49', '1', 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', '');
INSERT INTO `cmf_auth_rule` VALUES ('50', '1', 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('51', '1', 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', '');
INSERT INTO `cmf_auth_rule` VALUES ('52', '1', 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('53', '1', 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', '');
INSERT INTO `cmf_auth_rule` VALUES ('54', '1', 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', '');
INSERT INTO `cmf_auth_rule` VALUES ('55', '1', 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('56', '1', 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', '');
INSERT INTO `cmf_auth_rule` VALUES ('57', '1', 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', '');
INSERT INTO `cmf_auth_rule` VALUES ('58', '1', 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('59', '1', 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', '');
INSERT INTO `cmf_auth_rule` VALUES ('60', '1', 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', '');
INSERT INTO `cmf_auth_rule` VALUES ('61', '1', 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('62', '1', 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('63', '1', 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('64', '1', 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('65', '1', 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', '');
INSERT INTO `cmf_auth_rule` VALUES ('66', '1', 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', '');
INSERT INTO `cmf_auth_rule` VALUES ('67', '1', 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('68', '1', 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', '');
INSERT INTO `cmf_auth_rule` VALUES ('69', '1', 'admin', 'admin_url', 'admin/Setting/default', '', '设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('70', '1', 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', '');
INSERT INTO `cmf_auth_rule` VALUES ('71', '1', 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('72', '1', 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', '');
INSERT INTO `cmf_auth_rule` VALUES ('73', '1', 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('74', '1', 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('75', '1', 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('76', '1', 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', '');
INSERT INTO `cmf_auth_rule` VALUES ('77', '1', 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('78', '1', 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES ('79', '1', 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('80', '1', 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES ('81', '1', 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('82', '1', 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES ('83', '1', 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('84', '1', 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('85', '1', 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('86', '1', 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('87', '1', 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('88', '1', 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('89', '1', 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES ('90', '1', 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', '');
INSERT INTO `cmf_auth_rule` VALUES ('91', '1', 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('92', '1', 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', '');
INSERT INTO `cmf_auth_rule` VALUES ('93', '1', 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('94', '1', 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('95', '1', 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('96', '1', 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('97', '1', 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', '');
INSERT INTO `cmf_auth_rule` VALUES ('98', '1', 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', '');
INSERT INTO `cmf_auth_rule` VALUES ('99', '1', 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('100', '1', 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('101', '1', 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('102', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('103', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('104', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('105', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('106', '1', 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('107', '1', 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', '');
INSERT INTO `cmf_auth_rule` VALUES ('108', '1', 'admin', 'admin_url', 'admin/User/default', '', '管理组', '');
INSERT INTO `cmf_auth_rule` VALUES ('109', '1', 'admin', 'admin_url', 'admin/User/index', '', '管理员', '');
INSERT INTO `cmf_auth_rule` VALUES ('110', '1', 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('111', '1', 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('112', '1', 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('113', '1', 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('114', '1', 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', '');
INSERT INTO `cmf_auth_rule` VALUES ('115', '1', 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('116', '1', 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('117', '1', 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', '');
INSERT INTO `cmf_auth_rule` VALUES ('118', '1', 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', '');
INSERT INTO `cmf_auth_rule` VALUES ('119', '1', 'portal', 'admin_url', 'portal/AdminArticle/index', '', '文章管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('120', '1', 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', '');
INSERT INTO `cmf_auth_rule` VALUES ('121', '1', 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('122', '1', 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', '');
INSERT INTO `cmf_auth_rule` VALUES ('123', '1', 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('124', '1', 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('125', '1', 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', '');
INSERT INTO `cmf_auth_rule` VALUES ('126', '1', 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', '');
INSERT INTO `cmf_auth_rule` VALUES ('127', '1', 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', '');
INSERT INTO `cmf_auth_rule` VALUES ('128', '1', 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('129', '1', 'portal', 'admin_url', 'portal/AdminCategory/index', '', '分类管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('130', '1', 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', '');
INSERT INTO `cmf_auth_rule` VALUES ('131', '1', 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('132', '1', 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', '');
INSERT INTO `cmf_auth_rule` VALUES ('133', '1', 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('134', '1', 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', '');
INSERT INTO `cmf_auth_rule` VALUES ('135', '1', 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('136', '1', 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', '');
INSERT INTO `cmf_auth_rule` VALUES ('137', '1', 'portal', 'admin_url', 'portal/AdminIndex/default', '', '门户管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('138', '1', 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('139', '1', 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', '');
INSERT INTO `cmf_auth_rule` VALUES ('140', '1', 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('141', '1', 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', '');
INSERT INTO `cmf_auth_rule` VALUES ('142', '1', 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('143', '1', 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', '');
INSERT INTO `cmf_auth_rule` VALUES ('144', '1', 'portal', 'admin_url', 'portal/AdminTag/index', '', '文章标签', '');
INSERT INTO `cmf_auth_rule` VALUES ('145', '1', 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', '');
INSERT INTO `cmf_auth_rule` VALUES ('146', '1', 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('147', '1', 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', '');
INSERT INTO `cmf_auth_rule` VALUES ('148', '1', 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', '');
INSERT INTO `cmf_auth_rule` VALUES ('149', '1', 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('150', '1', 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', '');
INSERT INTO `cmf_auth_rule` VALUES ('151', '1', 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('152', '1', 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', '');
INSERT INTO `cmf_auth_rule` VALUES ('153', '1', 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', '');
INSERT INTO `cmf_auth_rule` VALUES ('154', '1', 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', '');
INSERT INTO `cmf_auth_rule` VALUES ('155', '1', 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', '');
INSERT INTO `cmf_auth_rule` VALUES ('156', '1', 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', '');
INSERT INTO `cmf_auth_rule` VALUES ('157', '1', 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', '');
INSERT INTO `cmf_auth_rule` VALUES ('158', '1', 'user', 'admin_url', 'user/AdminUserAction/index', '', '用户操作管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('159', '1', 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', '');
INSERT INTO `cmf_auth_rule` VALUES ('160', '1', 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('161', '1', 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', '');
INSERT INTO `cmf_auth_rule` VALUES ('162', '1', 'lol', 'admin_url', 'lol/AdminIndex/default', '', '游戏', '');
INSERT INTO `cmf_auth_rule` VALUES ('163', '1', 'lol', 'admin_url', 'lol/AdminIndex/index', '', '数据中心', '');
INSERT INTO `cmf_auth_rule` VALUES ('164', '1', 'lol', 'admin_url', 'lol/AdminHero/index', '', '英雄大全', '');
INSERT INTO `cmf_auth_rule` VALUES ('165', '1', 'lol', 'admin_url', 'lol/AdminMode/index', '', '游戏模式', '');
INSERT INTO `cmf_auth_rule` VALUES ('166', '1', 'lol', 'admin_url', 'lol/AdminZone/index', '', '大区数据', '');
INSERT INTO `cmf_auth_rule` VALUES ('167', '1', 'lol', 'admin_url', 'lol/AdminMatch/index', '', '我的比赛', '');
INSERT INTO `cmf_auth_rule` VALUES ('168', '1', 'lol', 'admin_url', 'lol/AdminAnalyze/index', '', '数据分析', '');
INSERT INTO `cmf_auth_rule` VALUES ('169', '1', 'lol', 'admin_url', 'lol/AdminExcel/index', '', '导入导出', '');
INSERT INTO `cmf_auth_rule` VALUES ('170', '1', 'lol', 'admin_url', 'lol/AdminPlay/index', '', '直播录像', '');
INSERT INTO `cmf_auth_rule` VALUES ('171', '1', 'idata', 'admin_url', 'idata/AdminIndex/default', '', 'iData', '');
INSERT INTO `cmf_auth_rule` VALUES ('172', '1', 'idata', 'admin_url', 'idata/AdminIndex/index', '', '数据中心', '');
INSERT INTO `cmf_auth_rule` VALUES ('173', '1', 'idata', 'admin_url', 'idata/AdminIndex/f511', '', 'F511', '');
INSERT INTO `cmf_auth_rule` VALUES ('174', '1', 'admin', 'admin_url', 'admin/DbBackup/index', '', '数据库管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('175', '1', 'admin', 'admin_url', 'admin/District/index', '', '地区管理', '');

-- ----------------------------
-- Table structure for cmf_comment
-- ----------------------------
DROP TABLE IF EXISTS `cmf_comment`;
CREATE TABLE `cmf_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text COMMENT '评论内容',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`object_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parent_id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `createtime` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of cmf_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_hook
-- ----------------------------
DROP TABLE IF EXISTS `cmf_hook`;
CREATE TABLE `cmf_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';

-- ----------------------------
-- Records of cmf_hook
-- ----------------------------
INSERT INTO `cmf_hook` VALUES ('1', '1', '0', '应用初始化', 'app_init', 'cmf', '应用初始化');
INSERT INTO `cmf_hook` VALUES ('2', '1', '0', '应用开始', 'app_begin', 'cmf', '应用开始');
INSERT INTO `cmf_hook` VALUES ('3', '1', '0', '模块初始化', 'module_init', 'cmf', '模块初始化');
INSERT INTO `cmf_hook` VALUES ('4', '1', '0', '控制器开始', 'action_begin', 'cmf', '控制器开始');
INSERT INTO `cmf_hook` VALUES ('5', '1', '0', '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤');
INSERT INTO `cmf_hook` VALUES ('6', '1', '0', '应用结束', 'app_end', 'cmf', '应用结束');
INSERT INTO `cmf_hook` VALUES ('7', '1', '0', '日志write方法', 'log_write', 'cmf', '日志write方法');
INSERT INTO `cmf_hook` VALUES ('8', '1', '0', '输出结束', 'response_end', 'cmf', '输出结束');
INSERT INTO `cmf_hook` VALUES ('9', '1', '0', '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化');
INSERT INTO `cmf_hook` VALUES ('10', '1', '0', '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化');
INSERT INTO `cmf_hook` VALUES ('11', '1', '1', '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码');
INSERT INTO `cmf_hook` VALUES ('12', '3', '0', '模板 body标签开始', 'body_start', '', '模板 body标签开始');
INSERT INTO `cmf_hook` VALUES ('13', '3', '0', '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前');
INSERT INTO `cmf_hook` VALUES ('14', '3', '0', '模板底部开始', 'footer_start', '', '模板底部开始');
INSERT INTO `cmf_hook` VALUES ('15', '3', '0', '模板底部开始之前', 'before_footer', '', '模板底部开始之前');
INSERT INTO `cmf_hook` VALUES ('16', '3', '0', '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前');
INSERT INTO `cmf_hook` VALUES ('17', '3', '0', '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前');
INSERT INTO `cmf_hook` VALUES ('18', '3', '0', '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始');
INSERT INTO `cmf_hook` VALUES ('19', '3', '0', '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前');
INSERT INTO `cmf_hook` VALUES ('20', '3', '0', '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始');
INSERT INTO `cmf_hook` VALUES ('21', '3', '0', '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前');
INSERT INTO `cmf_hook` VALUES ('22', '3', '1', '评论区', 'comment', '', '评论区');
INSERT INTO `cmf_hook` VALUES ('23', '3', '1', '留言区', 'guestbook', '', '留言区');
INSERT INTO `cmf_hook` VALUES ('24', '2', '0', '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘');
INSERT INTO `cmf_hook` VALUES ('25', '4', '0', '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前');
INSERT INTO `cmf_hook` VALUES ('26', '4', '0', '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前');
INSERT INTO `cmf_hook` VALUES ('27', '2', '0', '后台登录页面', 'admin_login', 'admin', '后台登录页面');
INSERT INTO `cmf_hook` VALUES ('28', '1', '1', '前台模板切换', 'switch_theme', 'cmf', '前台模板切换');
INSERT INTO `cmf_hook` VALUES ('29', '3', '0', '主要内容之后', 'after_content', '', '主要内容之后');
INSERT INTO `cmf_hook` VALUES ('30', '2', '0', '文章显示之前', 'portal_before_assign_article', 'portal', '文章显示之前');
INSERT INTO `cmf_hook` VALUES ('31', '2', '0', '后台文章保存之后', 'portal_admin_after_save_article', 'portal', '后台文章保存之后');

-- ----------------------------
-- Table structure for cmf_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_hook_plugin`;
CREATE TABLE `cmf_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(30) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';

-- ----------------------------
-- Records of cmf_hook_plugin
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_link
-- ----------------------------
DROP TABLE IF EXISTS `cmf_link`;
CREATE TABLE `cmf_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `link_visible` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表';

-- ----------------------------
-- Records of cmf_link
-- ----------------------------
INSERT INTO `cmf_link` VALUES ('1', '1', '1', '8', 'thinkcmf官网', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '');
INSERT INTO `cmf_link` VALUES ('2', '1', '0', '1', '', 'http://www.wowlothar.cn/', 'Lothar', '', '_blank', '');
INSERT INTO `cmf_link` VALUES ('3', '1', '0', '2', '', 'http://i.wowlothar.cn/', '爱数据', '', '_blank', '');

-- ----------------------------
-- Table structure for cmf_lol_hero
-- ----------------------------
DROP TABLE IF EXISTS `cmf_lol_hero`;
CREATE TABLE `cmf_lol_hero` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '英雄ID',
  `hchampion` varchar(30) NOT NULL DEFAULT '' COMMENT '英雄称号',
  `hname` varchar(30) NOT NULL DEFAULT '' COMMENT '英雄中文名',
  `hcname` varchar(150) NOT NULL DEFAULT '' COMMENT '英雄别名',
  `oldername` varchar(255) NOT NULL DEFAULT '' COMMENT '曾用名',
  `engchampion` varchar(50) NOT NULL DEFAULT '' COMMENT '英雄英文称号',
  `engname` varchar(50) NOT NULL DEFAULT '' COMMENT '英雄英文名',
  `hvoucher` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '点券',
  `hgold` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `hposition` varchar(100) NOT NULL DEFAULT '' COMMENT '英雄定位：多重定位',
  `region` varchar(50) NOT NULL DEFAULT '' COMMENT '《英雄联盟》宇宙所属地区',
  `wpct` decimal(2,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '胜率(Winning Percentage)',
  `ban_rate` decimal(2,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'Ban选率',
  `debut_rate` decimal(2,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '登场率',
  `hatk` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '攻击',
  `hdefense` tinyint(3) NOT NULL DEFAULT '0' COMMENT '防御',
  `hmagic` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '魔法',
  `hard` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '难度',
  `real_damage` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '真实伤害： 0否 1是',
  `displacement` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '位移：0没有 1一段位移 2二段位移 3三段',
  `strong_control` tinyint(1) unsigned NOT NULL COMMENT '硬控：0无 1一个 2两个 3三个 4四个 5五个',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text COMMENT '详情',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布日期',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '置顶',
  `is_rec` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推荐：0否 1是',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态：0暂封 1发布',
  `more` text COMMENT '扩展',
  `list_order` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '排序：从小到大',
  PRIMARY KEY (`id`),
  KEY `idx1` (`hchampion`,`hname`,`hcname`,`oldername`(191)),
  KEY `idx2` (`hvoucher`),
  KEY `idx3` (`hgold`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COMMENT='英雄联盟英雄表';

-- ----------------------------
-- Records of cmf_lol_hero
-- ----------------------------
INSERT INTO `cmf_lol_hero` VALUES ('1', '不祥之刃', '卡特琳娜', '会旋转的莲花', '', '', '', '2500', '3150', '杀手,法师', '1', '0.00', '0.00', '0.00', '4', '3', '9', '5', '0', '0', '0', '', '刺客', '', '1472492823', '0', '1509810928', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('2', '亡灵战神', '赛恩', '', '亡灵勇士', '', '', '2000', '1350', '坦克,战士', '3', '0.00', '0.00', '0.00', '5', '8', '3', '5', '0', '0', '0', '', 'AD变坦克', '2016大改版，AD变Tank；', '1472574603', '0', '1494516865', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('3', '众星之子', '索拉卡', '奶妈', '', '', '', '1000', '450', '法师,控场', '1', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '', '', '1472575356', '0', '1472923848', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('4', '光辉女郎', '拉克丝', '大元素使', '', '', '', '2500', '3150', '法师', '21', '0.00', '0.00', '0.00', '0', '0', '8', '0', '0', '0', '0', '', '', '', '1472575434', '0', '1491197648', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('5', '兽灵行者', '乌迪尔', '', '野兽之灵', '', '', '2500', '3150', '坦克,战士', '22', '0.00', '0.00', '0.00', '8', '7', '4', '5', '0', '0', '0', '', '', '', '1472575543', '0', '1473009681', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('6', '冰晶凤凰', '艾尼维亚', '冰鸟,凤凰', '', '', '', '3500', '4800', '法师,控场', '22', '0.00', '0.00', '0.00', '1', '4', '10', '10', '0', '0', '0', '', '', '2016大招改版', '1472575604', '0', '1494517095', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('7', '卡牌大师', '崔斯特', '卡牌', '', '', '', '3000', '4800', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472575838', '0', '1509810949', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('8', '祖安怒兽', '沃里克', '', '嗜血猎手', '', '', '2500', '3150', '坦克,战士', '', '0.00', '0.00', '0.00', '9', '5', '3', '3', '0', '0', '0', '', '暂无...', '201704大改版，机动性更强；', '1472575865', '0', '1494518384', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('9', '圣锤之毅', '波比', '', '钢铁大使', '', '', '1000', '450', '坦克', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '2017大改', '1472575882', '0', '1509811060', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('10', '堕落天使', '莫甘娜', '', '', '', '', '2000', '1350', '法师,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472575897', '0', '1509811049', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('11', '大发明家', '黑默丁格', '大头', '', '', '', '2500', '3150', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472575923', '0', '1509811037', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('12', '审判天使', '凯尔', '', '', '', '', '1000', '450', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472575940', '0', '1509811028', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('13', '寒冰射手', '艾希', '', '', '', '', '1000', '450', '', '', '0.00', '0.00', '0.00', '8', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472575955', '0', '1472746480', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('14', '痛苦之拥', '伊芙琳', '寡妇', '寡妇制造者', '', '', '2000', '1350', '杀手', '', '0.00', '0.00', '0.00', '4', '4', '7', '7', '0', '0', '0', '', '暂无...', '201710大改。S7赛季', '1472575974', '0', '1509808337', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('15', '德玛西亚之力', '盖伦', '大宝剑', '', '', '', '1000', '3150', '', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576002', '0', '1472576002', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('16', '德邦总管', '赵信', '菊花信', '', '', '', '2500', '3150', '战士,杀手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '201710大改动，有无敌', '1472576042', '0', '1509811008', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('17', '恶魔小丑', '萨科', '小丑,戏法', '', '', '', '2000', '4800', '杀手', '', '0.00', '0.00', '0.00', '8', '4', '6', '9', '0', '0', '0', '', '暂无...', '暂无...', '1472576056', '0', '1509810964', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('18', '战争之王', '潘森', '斯巴达', '', '', '', '1500', '3150', '战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576078', '0', '1509810978', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('19', '战争女神', '希维尔', '轮子妈', '', '', '', '1000', '450', '射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576101', '0', '1473009041', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('20', '披甲龙龟', '拉莫斯', '', '', '', '', '2500', '3150', '坦克,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576115', '0', '1509811092', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('21', '探险家', '伊泽瑞尔', '小帅哥，EZ，ez', '', '', '', '3000', '4800', '射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576140', '0', '1509810863', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('22', '无极剑圣', '易', '易大师', '', '', '', '1000', '450', '', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576153', '0', '1472576153', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('23', '时光守护者', '基兰', '时光老头', '', '', '', '1000', '450', '法师,控场', '', '0.00', '0.00', '0.00', '2', '5', '8', '4', '0', '0', '0', '', '暂无...', '暂无...', '1472576172', '0', '1473010062', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('24', '暗影之拳', '阿卡丽', '', '', '', '', '2500', '3150', '杀手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576187', '0', '1509811163', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('25', '暮光之眼', '慎', '', '', '', '', '2500', '3150', '坦克', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576199', '0', '1473008902', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('26', '末日使者', '费德提克', '末日', '', '', '', '2000', '1350', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576214', '0', '1473007566', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('27', '武器大师', '贾克斯', '', '', '', '', '2500', '3150', '战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576225', '0', '1509811143', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('28', '殇之木乃伊', '阿木木', '', '', '', '', '2000', '1350', '坦克,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576252', '0', '1509811135', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('29', '沙漠死神', '内瑟斯', '狗头,大狗', '', '', '', '2500', '3150', '坦克,战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576267', '0', '1473008363', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('30', '深渊巨口', '克格莫', '大嘴', '', '', '', '2000', '4800', '射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576279', '0', '1473008003', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('31', '炼金术士', '辛吉德', '', '', '', '', '2000', '1350', '战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576344', '0', '1509811308', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('32', '熔岩巨兽', '墨菲特', '石头人', '', '', '', '1000', '1350', '坦克,战士,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576360', '0', '1509811181', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('33', '牛头酋长', '阿利斯塔', '老牛,牛哥', '', '', '', '1000', '1350', '坦克,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576393', '0', '1509811267', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('34', '狂战士', '奥拉夫', '', '', '', '', '1500', '3150', '战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576416', '0', '1473008462', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('35', '狂暴之心', '凯南', '电耗子', '', '', '', '2500', '4800', '杀手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576431', '0', '1509811289', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('36', '狂野女猎手', '奈德丽', '豹女', '', '', '', '3500', '6300', '杀手,法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576445', '0', '1472973179', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('37', '猩红收割者', '弗拉基米尔', '吸血鬼,大姨妈', '', '', '', '2500', '3150', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576459', '0', '1473009872', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('38', '琴瑟仙女', '娑娜', '琴女', '', '', '', '2500', '3150', '法师,控场', '', '0.00', '0.00', '0.00', '5', '2', '8', '1', '0', '0', '0', '', '暂无...', '暂无...', '1472576481', '0', '1473009145', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('39', '瓦洛兰之盾', '塔里克', '', '宝石骑士', '', '', '1500', '3150', '战士,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '2016大改', '1472576502', '0', '1509811110', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('40', '瘟疫之源', '图奇', '老鼠', '', '', '', '3000', '4800', '射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576568', '0', '1473009608', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('41', '祖安狂人', '蒙多', '', '', '', '', '2000', '1350', '坦克', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576583', '0', '1509811190', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('42', '符文法师', '瑞兹', '', '流浪法师', '', '', '1000', '450', '战士,法师', '', '0.00', '0.00', '0.00', '2', '2', '10', '3', '0', '0', '0', '', '暂无...', '2016大改', '1472576602', '0', '1509811238', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('43', '策士统领', '斯维因', '乌鸦', '', '', '', '3000', '4800', '战士,法师', '', '0.00', '0.00', '0.00', '2', '6', '9', '5', '0', '0', '0', '', '暂无...', '暂无...', '1472576621', '0', '1473009220', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('44', '英勇投弹手', '库奇', '飞机', '', '', '', '3500', '6300', '射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576639', '0', '1509811226', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('45', '蒸汽机器人', '布里茨', '机器人', '', '', '', '2500', '3150', '坦克,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576654', '0', '1509811220', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('46', '虚空先知', '马尔扎哈', '', '', '', '', '3000', '4800', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576672', '0', '1473008189', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('47', '虚空恐惧', '科加斯', '大虫子', '', '', '', '1500', '3150', '坦克,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576683', '0', '1509811208', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('48', '虚空行者', '卡萨丁', '', '', '', '', '2500', '3150', '杀手,法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576697', '0', '1509811126', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('49', '蛮族之王', '泰达米尔', '蛮王,蛮子,蛮三刀', '', '', '', '3500', '4800', '战士,杀手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576709', '0', '1509811643', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('50', '赏金猎人', '厄运小姐', '女枪', '', '', '', '2500', '3150', '射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576721', '0', '1472972491', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('51', '迅捷斥候', '提莫', '蘑菇,提百万', '', '', '', '3500', '6300', '杀手,法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576749', '0', '1509811613', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('52', '邪恶小法师', '维迦', '小法', '', '', '', '2000', '1350', '法师,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576773', '0', '1509811591', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('53', '酒桶', '古拉加斯', '胖子', '', '', '', '2500', '3150', '坦克,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '2016大改', '1472576794', '0', '1509811579', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('54', '铁铠冥魂', '莫德凯撒', '', '金属大师', '', '', '1500', '3150', '战士,法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '2016大改', '1472576816', '0', '1509811547', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('55', '雪人骑士', '努努', '雪人', '', '', '', '1000', '450', '', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576835', '0', '1472576835', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('56', '风暴之怒', '迦娜', '风女', '', '', '', '2000', '1350', '法师,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576869', '0', '1473007729', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('57', '首领之傲', '厄加特', '', '', '', '', '1000', '1350', '战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '2017大改', '1472576883', '0', '1509808475', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('58', '麦林炮手', '崔丝塔娜', '小炮,火枪手', '', '', '', '1000', '1350', '射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576896', '0', '1509811520', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('59', '黑暗之女', '安妮', '火女', '', '', '', '2000', '4800', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576911', '0', '1509811495', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('60', '刀锋意志', '艾瑞莉亚', '女刀', '', '', '', '4000', '6300', '战士,杀手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576925', '0', '1473007699', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('61', '巨魔之王', '特朗德尔', '', '诅咒巨魔', '', '', '2500', '3150', '坦克,战士', '', '0.00', '0.00', '0.00', '7', '6', '2', '5', '0', '0', '0', '', '暂无...', '暂无...', '1472576943', '0', '1473009532', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('62', '诡术妖姬', '乐芙兰', '妖姬', '', '', '', '2500', '4800', '杀手,法师', '', '0.00', '0.00', '0.00', '1', '4', '10', '9', '0', '0', '0', '', '暂无...', '暂无...', '1472576955', '0', '1473008055', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('63', '魔蛇之拥', '卡西奥佩娅', '蛇女', '', '', '', '2500', '6300', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576971', '0', '1473007403', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('64', '天启者', '卡尔玛', '扇子妈', '', '', '', '2500', '3150', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472576993', '0', '1473007849', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('65', '扭曲树精', '茂凯', '大树', '', '', '', '3000', '4800', '坦克,法师', '', '0.00', '0.00', '0.00', '3', '7', '6', '3', '0', '0', '0', '', '暂无...', '201705更新，偏向于控制了，与之同改的有猪妹、扎克。', '1472577010', '0', '1494516453', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('66', '皮城女警', '凯特琳', '女警', '', '', '', '3000', '6300', '射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577046', '0', '1509811446', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('67', '荒漠屠夫', '雷克顿', '鳄鱼', '', '', '', '3000', '4800', '战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577063', '0', '1473008583', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('68', '德玛西亚皇子', '嘉文四世', '皇子', '', '', '', '3000', '4800', '战士,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577076', '0', '1509811431', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('69', '复仇焰魂', '布兰德', '火男', '', '', '', '2000', '4800', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577102', '0', '1473007351', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('70', '机械公敌', '兰博', '', '', '', '', '3000', '4800', '战士,法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577124', '0', '1473008676', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('71', '永恒梦魇', '魔腾', '梦魇', '', '', '', '3000', '4800', '战士,杀手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577151', '0', '1509811413', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('72', '盲僧', '李青', '瞎子,龙虾', '', '', '', '3000', '4800', '战士,杀手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577165', '0', '1509811392', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('73', '暗夜猎手', '薇恩', 'VN', '', '', '', '3000', '4800', '杀手,射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577177', '0', '1509811373', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('74', '发条魔灵', '奥利安娜', '发条', '', '', '', '3000', '6300', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577195', '0', '1509811363', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('75', '掘墓者', '约里克', '', '', '', '', '2500', '3150', '坦克,战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577211', '0', '1509811346', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('76', '齐天大圣', '孙悟空', '猴子', '', '', '', '4500', '6300', '战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577230', '0', '1509811334', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('77', '曙光女神', '蕾欧娜', '日女', '', '', '', '3000', '4800', '坦克,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577242', '0', '1473008088', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('78', '水晶先锋', '斯卡纳', '蝎子', '', '', '', '2500', '3150', '战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577254', '0', '1473009075', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('79', '刀锋之影', '泰隆', '男刀', '', '', '', '4500', '6300', '战士,杀手', '', '0.00', '0.00', '0.00', '9', '3', '1', '7', '0', '0', '0', '', '暂无...', '201704大改版，可以翻墙、翻障碍物；', '1472577263', '0', '1494517189', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('80', '放逐之刃', '锐雯', '兔女郎', '', '', '', '4500', '6300', '战士,杀手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577274', '0', '1473008658', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('81', '法外狂徒', '格雷福斯', '男枪', '', '', '', '4500', '6300', '战士,射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577284', '0', '1509811670', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('82', '龙血武姬', '希瓦娜', '龙女', '', '', '', '3500', '4800', '战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577297', '0', '1509811657', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('83', '潮汐海灵', '菲兹', '小鱼人', '', '', '', '4500', '6300', '', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577311', '0', '1472577311', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('84', '远古巫灵', '泽拉斯', '棺材,特斯拉', '', '', '', '2500', '4800', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577325', '0', '1509811713', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('85', '雷霆咆哮', '沃利贝尔', '狗熊', '', '', '', '3500', '4800', '坦克,战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577338', '0', '1509811727', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('86', '九尾妖狐', '阿狸', '狐狸', '', '', '', '3500', '6300', '杀手,法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577370', '0', '1509811742', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('87', '机械先驱', '维克托', '三只手', '', '', '', '2500', '4800', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577388', '0', '1509811750', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('88', '北地之怒', '瑟庄妮', '猪女,猪妹', '凛冬之怒', '', '', '3500', '4800', '坦克,战士', '', '0.00', '0.00', '0.00', '5', '7', '6', '4', '0', '0', '0', '', '暂无...', '201705更新，偏向于控制了，与之同改的有大树、扎克。', '1472577398', '0', '1494516373', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('89', '爆破鬼才', '吉格斯', '爆破', '', '', '', '4500', '6300', '法师,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577419', '0', '1473010002', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('90', '深海泰坦', '诺提勒斯', '泰坦', '', '', '', '3500', '4800', '坦克,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577434', '0', '1473008386', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('91', '无双剑姬', '菲奥娜', '剑姬', '', '', '', '4500', '6300', '杀手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577445', '0', '1509811785', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('92', '仙灵女巫', '璐璐', '', '', '', '', '4500', '6300', '控场', '', '0.00', '0.00', '0.00', '3', '3', '6', '7', '0', '0', '0', '', '暂无...', '', '1472577454', '0', '1516026952', '1', '1', '1', '{\"thumbnail\":\"\"}', '0');
INSERT INTO `cmf_lol_hero` VALUES ('93', '战争之影', '赫卡里姆', '人马', '', '', '', '4500', '6300', '战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577467', '0', '1509811798', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('94', '惩戒之箭', '韦鲁斯', '', '', '', '', '4500', '6300', '射手', '', '0.00', '0.00', '0.00', '7', '3', '4', '6', '0', '0', '0', '', '暂无...', '暂无...', '1472577486', '0', '1473009768', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('95', '诺克萨斯之手', '德莱厄斯', '诺手,斧头哥,小学生之手', '', '', '', '4500', '6300', '战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577493', '0', '1509811811', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('96', '荣耀行刑官', '德莱文', '', '', '', '', '4500', '6300', '射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577510', '0', '1509811829', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('97', '未来守护者', '杰斯', '大帅哥', '', '', '', '3500', '6300', '战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577527', '0', '1509810695', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('98', '荆棘之兴', '婕拉', '', '', '', '', '3500', '4800', '法师,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577541', '0', '1473010088', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('99', '皎月女神', '黛安娜', '皎月', '', '', '', '4500', '6300', '杀手,法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577551', '0', '1473007467', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('100', '傲之追猎者', '雷恩加尔', '狮子狗', '', '', '', '4500', '6300', '战士,杀手', '', '0.00', '0.00', '0.00', '7', '4', '2', '8', '0', '0', '0', '', '暂无...', '2017大改版；', '1472577593', '0', '1494516996', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('101', '暗黑元首', '辛德拉', '玩球的', '', '', '', '4500', '6300', '杀手,法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577605', '0', '1509810646', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('102', '虚空掠夺者', '卡兹克', '螳螂', '', '', '', '4500', '6300', '杀手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577613', '0', '1509810653', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('103', '蜘蛛女皇', '伊莉丝', '蜘蛛', '', '', '', '3000', '4800', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577630', '0', '1473007522', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('104', '影流之主', '劫', '', '', '', '', '4500', '6300', '杀手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577642', '0', '1473009983', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('105', '唤潮鲛姬', '娜美', '', '', '', '', '3500', '4800', '法师,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577663', '0', '1473008325', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('106', '皮城执法官', '蔚', '拳姐', '', '', '', '4500', '6300', '战士,杀手', '', '0.00', '0.00', '0.00', '8', '5', '3', '5', '0', '0', '0', '', '暂无...', '暂无...', '1472577678', '0', '1472923387', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('107', '魂锁典狱长', '锤石', '', '', '', '', '4500', '6300', '战士,控场', '', '0.00', '0.00', '0.00', '5', '6', '6', '7', '0', '0', '0', '', '暂无...', '暂无...', '1472577696', '0', '1473009452', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('108', '德玛西亚之翼', '奎因', '鸟人', '', '', '', '4500', '6300', '射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577719', '0', '1473008537', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('109', '生化魔人', '扎克', '泥巴', '', '', '', '3000', '4800', '坦克,控场', '', '0.00', '0.00', '0.00', '3', '7', '7', '8', '0', '0', '0', '', '暂无...', '201705更新，偏向于控制了，与之同改的有大树、猪妹。', '1472577739', '0', '1509810567', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('110', '冰霜女巫', '丽桑卓', '冰女', '', '', '', '3000', '6300', '法师,控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577752', '0', '1473008110', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('111', '圣枪游侠', '卢锡安', '奥巴马，机关枪', '', '', '', '4500', '6300', '射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577764', '0', '1509810551', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('112', '暴走萝莉', '金克丝', '', '', '', '', '4500', '6300', '射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577773', '0', '1473007806', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('113', '疾风剑豪', '亚索', '小日本', '', '', '', '4500', '6300', '杀手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577781', '0', '1509810514', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('114', '虚空之眼', '维克兹', '大眼怪', '', '', '', '4500', '6300', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472577789', '0', '1509810482', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('115', '佛雷尔卓德之心', '布隆', '胡子大叔', '', '', '', '4500', '6300', '坦克,控场', '22', '0.00', '0.00', '0.00', '3', '8', '3', '4', '0', '0', '0', '', '', '暂无...', '1472577863', '0', '1509810499', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('116', '迷失之牙', '纳尔', '', '', '', '', '4500', '6300', '战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472578171', '0', '1509810490', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('117', '沙漠皇帝', '阿兹尔', '沙皇', '', '', '', '4500', '6300', '法师,控场', '', '0.00', '0.00', '0.00', '6', '5', '8', '9', '0', '0', '0', '', '暂无...', '暂无...', '1472578188', '0', '1509810467', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('118', '复仇之矛', '卡莉丝塔', '滑板鞋', '', '', '', '4500', '6300', '射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472578249', '0', '1509810423', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('119', '虚空遁地兽', '雷克塞', '钻地兽', '', '', '', '4500', '6300', '战士', '', '0.00', '0.00', '0.00', '8', '5', '2', '3', '0', '0', '0', '', '暂无...', '暂无...', '1472578281', '0', '1472918975', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('120', '星界游神', '巴德', '', '', '', '', '4500', '6300', '控场', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472578296', '0', '1509810411', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('121', '时间刺客', '艾克', '', '', '', '', '4500', '6300', '杀手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472578310', '0', '1509810404', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('122', '河流之王', '塔姆·肯奇', '蛤蟆,蟾蜍', '', '', '', '4500', '6300', '坦克,控场', '', '0.00', '0.00', '0.00', '3', '8', '6', '5', '0', '0', '0', '', '暂无...', '暂无...', '1472578324', '0', '1509810397', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('123', '海洋之灾', '普朗克', '船长', '', '', '', '2500', '3150', '战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472578352', '0', '1509810380', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('124', '永猎双子', '千珏', '', '', '', '', '4500', '6300', '射手', '', '0.00', '0.00', '0.00', '8', '2', '2', '4', '0', '0', '0', '', '暂无...', '暂无...', '1472578371', '0', '1473007968', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('125', '海兽祭司', '俄洛伊', '老女人', '', '', '', '4500', '6300', '战士', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472578408', '0', '1509810358', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('126', '戏命师', '烬', '', '', '', '', '4500', '6300', '射手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472578432', '0', '1509810347', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('127', '正义巨像', '加里奥', '石像鬼', '哨兵之殇', '', '', '2000', '3150', '坦克,法师', '', '0.00', '0.00', '0.00', '1', '9', '6', '5', '0', '0', '0', '', '暂无...', '201704 大改版，之前“哨兵之殇”的称谓现在改成“正义巨像”。', '1472578452', '0', '1494516645', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('128', '死亡颂唱着', '卡尔萨斯', '死歌', '', '', '', '3000', '4800', '法师', '', '0.00', '0.00', '0.00', '0', '0', '8', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472578469', '0', '1472749057', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('129', '暗裔剑魔', '亚托克斯', '剑魔', '', '', '', '4500', '6300', '战士,杀手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472578481', '0', '1509810304', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('130', '铸星龙王', '奥瑞利安 ▪ 索尔', '龙王', '', '', '', '4500', '6300', '法师', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '暂无...', '暂无...', '1472578606', '0', '1509810296', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('131', '岩雀', '塔莉垭', '', '', '', '', '4500', '6300', '法师,控场', '', '0.00', '0.00', '0.00', '1', '7', '8', '5', '0', '0', '0', '', '暂无...', '暂无...', '1472578712', '0', '1494517409', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('132', '暴怒骑士', '克烈', '', '', '', '', '4500', '6300', '坦克,战士,控场', '', '0.00', '0.00', '0.00', '8', '2', '2', '7', '0', '0', '0', '', '暂无...', '暂无...', '1472578730', '0', '1494517488', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('133', '翠神', '艾翁', '树人,小菊', '', '', '', '4500', '6300', '控场', '', '0.00', '0.00', '0.00', '3', '5', '7', '7', '0', '0', '0', '', '', '', '1494517331', '0', '1509810274', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('134', '青钢影', '卡蜜尔', '', '', '', '', '4500', '6300', '战士,杀手,控场', '', '0.00', '0.00', '0.00', '8', '6', '3', '4', '0', '0', '0', '', '', '', '1494517653', '0', '1509810265', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('135', '逆羽', '霞', '', '', '', '', '4500', '6300', '射手', '', '0.00', '0.00', '0.00', '10', '6', '1', '5', '0', '0', '0', '', '情侣英雄', '201704与幻翎-洛同时上架，与 幻翎-洛 是情侣英雄；', '1494517746', '0', '1494518257', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('136', '幻翎', '洛', '', '', '', '', '4500', '6300', '控场', '', '0.00', '0.00', '0.00', '2', '4', '7', '5', '0', '0', '0', '', '情侣英雄', '201704与幻羽-霞同时上架，与 幻羽-霞 是情侣英雄；', '1494518200', '0', '1494518200', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('137', '影流之镰', '凯隐', '', '', '', '', '4500', '6300', '战士,杀手', '', '0.00', '0.00', '0.00', '0', '0', '0', '0', '0', '0', '0', '', '', '2017-07-18上架，跟 劫 是什么关系？', '1501516072', '0', '1509810243', '0', '0', '1', null, '0');
INSERT INTO `cmf_lol_hero` VALUES ('138', '山隐之焰', '奥恩', '', '', '', '', '4500', '6300', '战士,控场', '', '0.00', '0.00', '0.00', '5', '6', '3', '5', '0', '0', '0', '', '', '2017出场，自己可在店外买装备，使队友在商店提升装备属性。', '1509810064', '0', '1509812790', '0', '0', '1', null, '50');

-- ----------------------------
-- Table structure for cmf_lol_match
-- ----------------------------
DROP TABLE IF EXISTS `cmf_lol_match`;
CREATE TABLE `cmf_lol_match` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '比赛ID',
  `mode_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '游戏模式ID',
  `region_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '大区ID',
  `hero_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '玩家使用的英雄ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `player` varchar(50) NOT NULL DEFAULT '' COMMENT '玩家名',
  `result` tinyint(1) unsigned NOT NULL DEFAULT '3' COMMENT '比赛结果： 0失败  1胜利 ',
  `eval` varchar(10) NOT NULL DEFAULT '' COMMENT '游戏评分 , 满分5颗星',
  `kills` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '击杀次数',
  `die` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '死亡次数',
  `assist` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '助攻次数',
  `s_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '游戏开始时间',
  `duration` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '游戏时长(分钟）',
  `description` varchar(255) NOT NULL DEFAULT '暂无……' COMMENT '描述',
  `content` text COMMENT '详情',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态：0隐藏 1显示',
  `more` text COMMENT '扩展',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序：从小到大',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COMMENT='比赛记录表';

-- ----------------------------
-- Records of cmf_lol_match
-- ----------------------------
INSERT INTO `cmf_lol_match` VALUES ('1', '4', '0', '28', '0', 'Luosa', '1', '', '3', '10', '23', '1472914740', '19', '团控无敌！', '从这里开始...', '1472987251', '1472990378', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('2', '4', '0', '18', '0', 'Luosa', '0', '', '11', '13', '28', '1472825400', '30', '', '从这里开始...', '1472987567', '1472987567', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('3', '3', '0', '33', '0', 'Luosa', '1', '', '16', '4', '17', '1472827500', '38', '', '', '1472990685', '1473005139', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('4', '4', '0', '114', '0', 'Luosa', '0', '', '8', '8', '34', '1472996640', '27', '', '', '1473004849', '1473004868', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('5', '4', '0', '26', '0', 'Luosa', '0', '', '11', '17', '31', '1472650380', '36', '恐惧着', '', '1473006940', '1473587446', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('6', '4', '0', '21', '0', 'Luosa', '0', '', '0', '0', '0', '1473577800', '28', '', '', '1473594369', '1473594369', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('7', '4', '0', '123', '0', 'Luosa', '0', '', '0', '0', '0', '1473576300', '20', '', '', '1473594370', '1473594370', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('8', '4', '0', '49', '0', 'Luosa', '0', '', '0', '0', '0', '1473574200', '30', '', '', '1473594371', '1473594371', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('9', '4', '0', '63', '0', 'Luosa', '0', '', '0', '0', '0', '1473566580', '21', '', '', '1473594372', '1473594372', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('10', '4', '0', '100', '0', 'Luosa', '1', '', '0', '0', '0', '1473564780', '20', '', '', '1473594373', '1473594373', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('11', '4', '0', '19', '0', 'Luosa', '1', '', '0', '0', '0', '1473562920', '21', '', '', '1473594374', '1473594374', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('12', '4', '0', '53', '0', 'Luosa', '1', '', '0', '0', '0', '1473517860', '27', '', '', '1473594375', '1473594375', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('13', '4', '0', '56', '0', 'Luosa', '0', '', '0', '0', '0', '1473516360', '20', '', '', '1473594376', '1473594376', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('14', '4', '0', '94', '0', 'Luosa', '0', '', '0', '0', '0', '1473514740', '22', '', '', '1473594377', '1473594377', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('15', '4', '0', '29', '0', 'Luosa', '0', '', '0', '0', '0', '1473427920', '21', '', '', '1473594378', '1473594378', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('16', '4', '0', '31', '0', 'Luosa', '1', '', '0', '0', '0', '1473426240', '0', '', '', '1473594379', '1473594379', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('17', '4', '0', '1', '0', 'Luosa', '1', '', '0', '0', '0', '1473423660', '19', '', '', '1473594380', '1473594380', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('18', '4', '0', '75', '0', 'Luosa', '1', '', '0', '0', '0', '1473255360', '27', '', '', '1473594381', '1473594381', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('19', '4', '0', '114', '0', 'Luosa', '1', '', '0', '0', '0', '1473166980', '19', '', '', '1473594382', '1473594382', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('20', '4', '0', '61', '0', 'Luosa', '1', '', '0', '0', '0', '1473091380', '27', '', '', '1473594383', '1473594383', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('21', '4', '0', '20', '0', 'Luosa', '1', '', '0', '0', '0', '1473076440', '19', '', '', '1473594384', '1473594384', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('22', '4', '0', '75', '0', 'Luosa', '0', '', '0', '0', '0', '1472648880', '20', '', '', '1473594385', '1473594385', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('23', '4', '0', '101', '0', 'Luosa', '1', '', '0', '0', '0', '1472567700', '22', '', '', '1473594386', '1473594386', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('24', '4', '0', '123', '0', 'Luosa', '1', '', '0', '0', '0', '1472479860', '14', '', '', '1473594387', '1473594387', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('25', '4', '0', '87', '0', 'Luosa', '0', '', '0', '0', '0', '1472478000', '22', '', '', '1473594388', '1473594388', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('26', '4', '0', '21', '0', 'Luosa', '1', '', '0', '0', '0', '1472476380', '23', '', '', '1473594389', '1473594389', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('27', '4', '0', '60', '0', 'Luosa', '0', '', '0', '0', '0', '1472385240', '25', '', '', '1473594390', '1473594390', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('28', '4', '0', '114', '0', 'Luosa', '0', '', '0', '0', '0', '1472218320', '34', '', '', '1473594391', '1473594391', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('29', '4', '0', '81', '0', 'Luosa', '0', '', '0', '0', '0', '1472211960', '17', '', '', '1473594392', '1473594392', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('30', '4', '0', '31', '0', 'Luosa', '1', '', '0', '0', '0', '1471965480', '22', '', '', '1473594393', '1473594393', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('31', '4', '0', '39', '0', 'Luosa', '0', '', '0', '0', '0', '1471876320', '25', '', '', '1473594394', '1473594394', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('32', '4', '0', '53', '0', 'Luosa', '1', '', '0', '0', '0', '1471792560', '17', '', '', '1473594395', '1473594395', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('33', '4', '0', '21', '0', 'Luosa', '0', '', '0', '0', '0', '1471789680', '19', '', '', '1473594396', '1473594396', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('34', '4', '0', '34', '0', 'Luosa', '1', '', '0', '0', '0', '1471778220', '23', '', '', '1473594397', '1473594397', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('35', '4', '0', '10', '0', 'Luosa', '0', '', '0', '0', '0', '1471709100', '26', '', '', '1473594398', '1473594398', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('36', '4', '0', '91', '0', 'Luosa', '1', '', '0', '0', '0', '1471619400', '25', '', '', '1473594399', '1473594399', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('37', '4', '0', '36', '0', 'Luosa', '1', '', '0', '0', '0', '1471443120', '36', '', '', '1473594400', '1473594400', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('38', '4', '0', '5', '0', 'Luosa', '1', '', '0', '0', '0', '1471441080', '26', '', '', '1473594401', '1473594401', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('39', '4', '0', '119', '0', 'Luosa', '1', '', '0', '0', '0', '1471439580', '20', '', '', '1473594402', '1473594402', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('40', '4', '0', '73', '0', 'Luosa', '1', '', '0', '0', '0', '1471270380', '20', '', '', '1473594403', '1473594403', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('41', '4', '0', '61', '0', 'Luosa', '0', '', '0', '0', '0', '1471268520', '26', '', '', '1473594404', '1473594404', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('42', '4', '0', '13', '0', 'Luosa', '0', '', '0', '0', '0', '1471184580', '26', '', '', '1473594405', '1473594405', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('43', '4', '0', '39', '0', 'Luosa', '0', '', '0', '0', '0', '1471183260', '16', '', '', '1473594406', '1473594406', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('44', '4', '0', '34', '0', 'Luosa', '1', '', '0', '0', '0', '1471108920', '23', '', '', '1473594407', '1473594407', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('45', '4', '0', '30', '0', 'Luosa', '1', '', '0', '0', '0', '1471094520', '27', '', '', '1473594408', '1473594408', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('46', '4', '0', '37', '0', 'Luosa', '1', '', '0', '0', '0', '1471008360', '29', '', '', '1473594409', '1473594409', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('47', '4', '0', '48', '0', 'Luosa', '0', '', '0', '0', '0', '1470922140', '25', '', '', '1473594410', '1473594410', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('48', '4', '0', '46', '0', 'Luosa', '1', '', '0', '0', '0', '1470839880', '20', '', '', '1473594411', '1473594411', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('49', '4', '0', '84', '0', 'Luosa', '1', '', '0', '0', '0', '1470758400', '0', '', '', '1473594412', '1473594412', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('50', '4', '0', '9', '0', 'Luosa', '1', '', '0', '0', '0', '1470758400', '0', '', '', '1473594413', '1473594413', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('51', '4', '0', '27', '0', 'Luosa', '1', '', '0', '0', '0', '1470758400', '0', '', '', '1473594414', '1473594414', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('52', '4', '0', '127', '0', 'Luosa', '1', '', '0', '0', '0', '1470758400', '0', '', '', '1473594415', '1473594415', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('53', '4', '0', '11', '0', 'Luosa', '1', '', '0', '0', '0', '1470758400', '0', '', '', '1473594416', '1473594416', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('54', '4', '0', '30', '0', 'Luosa', '1', '', '0', '0', '0', '1470758400', '0', '', '', '1473594417', '1473594417', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('55', '4', '0', '76', '0', 'Luosa', '0', '', '0', '0', '0', '1470672000', '0', '', '', '1473594418', '1473594418', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('56', '4', '0', '105', '0', 'Luosa', '1', '', '0', '0', '0', '1470499200', '0', '', '', '1473594419', '1473594419', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('57', '4', '0', '21', '0', 'Luosa', '0', '', '0', '0', '0', '1470499200', '0', '', '', '1473594420', '1473594420', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('58', '4', '0', '19', '0', 'Luosa', '0', '', '0', '0', '0', '1470572460', '28', '', '', '1473594421', '1473594421', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('59', '4', '0', '45', '0', 'Luosa', '1', '', '0', '0', '0', '1470568500', '25', '', '', '1473594422', '1473594422', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('60', '4', '0', '87', '0', 'Luosa', '0', '', '0', '0', '0', '1470566700', '25', '', '', '1473594423', '1473594423', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('61', '4', '0', '112', '0', 'Luosa', '0', '', '0', '0', '0', '1470500700', '20', '', '', '1473594424', '1473594424', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('62', '4', '0', '87', '0', 'Luosa', '1', '', '0', '0', '0', '1470499440', '17', '', '', '1473594425', '1473594425', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('63', '4', '0', '112', '0', 'Luosa', '0', '', '0', '0', '0', '1470497580', '24', '', '', '1473594426', '1473594426', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('64', '4', '0', '18', '0', 'Luosa', '0', '', '0', '0', '0', '1470412800', '0', '', '', '1473594427', '1473594427', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('65', '4', '0', '10', '0', 'Luosa', '1', '', '0', '0', '0', '1470494100', '15', '', '', '1473594428', '1473594428', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('66', '4', '0', '99', '0', 'Luosa', '0', '', '0', '0', '0', '1470412800', '0', '', '', '1473594429', '1473594429', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('67', '4', '0', '84', '0', 'Luosa', '0', '', '0', '0', '0', '1470491220', '16', '', '', '1473594430', '1473594430', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('68', '4', '0', '106', '0', 'Luosa', '0', '', '0', '0', '0', '1470230460', '29', '', '', '1473594431', '1473594431', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('69', '4', '0', '125', '0', 'Luosa', '1', '', '0', '0', '0', '1470067200', '0', '', '', '1473594432', '1473594432', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('70', '4', '0', '26', '0', 'Luosa', '0', '', '0', '0', '0', '1470067200', '0', '', '', '1473594433', '1473594433', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('71', '4', '0', '87', '0', 'Luosa', '0', '', '0', '0', '0', '1470067200', '0', '', '', '1473594434', '1473594434', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('72', '4', '0', '34', '0', 'Luosa', '0', '', '0', '0', '0', '1469894400', '0', '', '', '1473594435', '1473594435', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('73', '4', '0', '71', '0', 'Luosa', '0', '', '0', '0', '0', '1469894400', '0', '', '', '1473594436', '1473594436', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('74', '4', '0', '12', '0', 'Luosa', '0', '', '0', '0', '0', '1469894400', '0', '', '', '1473594437', '1473594437', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('75', '4', '0', '84', '0', 'Luosa', '0', '', '0', '0', '0', '1469894400', '0', '', '', '1473594438', '1473594438', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('76', '4', '0', '32', '0', 'Luosa', '0', '', '0', '0', '0', '1469894400', '0', '', '', '1473594439', '1473594439', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('77', '4', '0', '8', '0', 'Luosa', '1', '', '0', '0', '0', '1469894400', '0', '', '', '1473594440', '1473594440', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('78', '4', '0', '58', '0', 'Luosa', '0', '', '0', '0', '0', '1469894400', '0', '', '', '1473594441', '1473594441', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('79', '4', '0', '128', '0', 'Luosa', '0', '', '0', '0', '0', '1469894400', '0', '', '', '1473594442', '1473594442', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('80', '4', '0', '77', '0', 'Luosa', '0', '', '0', '0', '0', '1469894400', '0', '', '', '1473594443', '1473594443', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('81', '4', '0', '77', '0', 'Luosa', '0', '', '0', '0', '0', '1469808000', '0', '', '', '1473594444', '1473594444', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('82', '4', '0', '105', '0', 'Luosa', '0', '', '0', '0', '0', '1469548800', '0', '', '', '1473594445', '1473594445', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('83', '4', '0', '26', '0', 'Luosa', '1', '', '0', '0', '0', '1469462400', '0', '', '', '1473594446', '1473594446', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('84', '4', '0', '6', '0', 'Luosa', '0', '', '0', '0', '0', '1469376000', '0', '', '', '1473594447', '1473594447', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('85', '4', '0', '120', '0', 'Luosa', '0', '', '0', '0', '0', '1469376000', '0', '', '', '1473594448', '1473594448', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('86', '4', '0', '30', '0', 'Luosa', '0', '', '0', '0', '0', '1469376000', '0', '', '', '1473594449', '1473594449', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('87', '4', '0', '31', '0', 'Luosa', '1', '', '0', '0', '0', '1469289600', '0', '', '', '1473594450', '1473594450', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('88', '4', '0', '97', '0', 'Luosa', '1', '', '0', '0', '0', '1469289600', '0', '', '', '1473594451', '1473594451', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('89', '4', '0', '48', '0', 'Luosa', '0', '', '0', '0', '0', '1469203200', '0', '', '', '1473594452', '1473594452', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('90', '4', '0', '113', '0', 'Luosa', '1', '', '0', '0', '0', '1468944000', '0', '', '', '1473594453', '1473594453', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('91', '4', '0', '12', '0', 'Luosa', '0', '', '0', '0', '0', '1468857600', '0', '', '', '1473594454', '1473594454', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('92', '4', '0', '19', '0', 'Luosa', '0', '', '0', '0', '0', '1468857600', '0', '', '', '1473594455', '1473594455', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('93', '4', '0', '59', '0', 'Luosa', '1', '', '0', '0', '0', '1468771200', '0', '', '', '1473594456', '1473594456', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('94', '4', '0', '21', '0', 'Luosa', '0', '', '0', '0', '0', '1468771200', '0', '', '', '1473594457', '1473594457', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('95', '4', '0', '37', '0', 'Luosa', '0', '', '0', '0', '0', '1468771200', '0', '', '', '1473594458', '1473594458', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('96', '4', '0', '94', '0', 'Luosa', '0', '', '0', '0', '0', '1468771200', '0', '', '', '1473594459', '1473594459', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('97', '4', '0', '97', '0', 'Luosa', '0', '', '0', '0', '0', '1468771200', '0', '', '', '1473594460', '1473594460', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('98', '4', '0', '50', '0', 'Luosa', '0', '', '0', '0', '0', '1468684800', '0', '', '', '1473594461', '1473594461', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('99', '4', '0', '69', '0', 'Luosa', '0', '', '0', '0', '0', '1468512000', '0', '', '', '1473594462', '1473594462', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('100', '4', '0', '95', '0', 'Luosa', '0', '', '0', '0', '0', '1468512000', '0', '', '', '1473594463', '1473594463', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('101', '4', '0', '90', '0', 'Luosa', '1', '', '0', '0', '0', '1468425600', '0', '', '', '1473594464', '1473594464', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('102', '4', '0', '90', '0', 'Luosa', '1', '', '0', '0', '0', '1468339200', '0', '', '', '1473594465', '1473594465', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('103', '4', '0', '107', '0', 'Luosa', '1', '', '0', '0', '0', '1468252800', '0', '', '', '1473594466', '1473594466', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('104', '4', '0', '86', '0', 'Luosa', '1', '', '0', '0', '0', '1468166400', '0', '', '', '1473594467', '1473594467', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('105', '4', '0', '10', '0', 'Luosa', '1', '', '0', '0', '0', '1468080000', '0', '', '', '1473594468', '1473594468', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('106', '4', '0', '92', '0', 'Luosa', '1', '', '0', '0', '0', '1468080000', '0', '', '', '1473594469', '1473594469', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('107', '4', '0', '58', '0', 'Luosa', '1', '', '0', '0', '0', '1468080000', '0', '', '', '1473594470', '1473594470', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('108', '4', '0', '128', '0', 'Luosa', '0', '', '0', '0', '0', '1467907200', '0', '', '', '1473594471', '1473594471', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('109', '4', '0', '12', '0', 'Luosa', '0', '', '0', '0', '0', '1467820800', '0', '', '', '1473594472', '1473594472', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('110', '4', '0', '2', '0', 'Luosa', '0', '', '0', '0', '0', '1467820800', '0', '', '', '1473594473', '1473594473', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('111', '4', '0', '89', '0', 'Luosa', '0', '', '0', '0', '0', '1467734400', '0', '', '', '1473594474', '1473594474', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('112', '4', '0', '29', '0', 'Luosa', '0', '', '0', '0', '0', '1467734400', '0', '', '', '1473594475', '1473594475', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('113', '4', '0', '101', '0', 'Luosa', '0', '', '0', '0', '0', '1467734400', '0', '', '', '1473594476', '1473594476', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('114', '4', '0', '68', '0', 'Luosa', '0', '', '0', '0', '0', '1467648000', '0', '', '', '1473594477', '1473594477', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('115', '4', '0', '103', '0', 'Luosa', '0', '', '0', '0', '0', '1467648000', '0', '', '', '1473594478', '1473594478', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('116', '4', '0', '69', '0', 'Luosa', '0', '', '0', '0', '0', '1467648000', '0', '', '', '1473594479', '1473594479', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('117', '4', '0', '105', '0', 'Luosa', '1', '', '0', '0', '0', '1467297720', '23', '', '', '1473594480', '1473594480', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('118', '4', '0', '61', '0', 'Luosa', '0', '', '0', '0', '0', '1466870400', '0', '', '', '1473594481', '1473594481', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('119', '4', '0', '17', '0', 'Luosa', '1', '', '0', '0', '0', '1466870400', '0', '', '', '1473594482', '1473594482', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('120', '4', '0', '87', '0', 'Luosa', '0', '', '0', '0', '0', '1466870400', '0', '', '', '1473594483', '1473594483', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('121', '4', '0', '63', '0', 'Luosa', '1', '', '0', '0', '0', '1466870400', '0', '', '', '1473594484', '1473594484', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('122', '4', '0', '99', '0', 'Luosa', '0', '', '0', '0', '0', '1466870400', '0', '', '', '1473594485', '1473594485', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('123', '4', '0', '101', '0', 'Luosa', '0', '', '0', '0', '0', '1466784000', '0', '', '', '1473594486', '1473594486', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('124', '4', '0', '13', '0', 'Luosa', '0', '', '0', '0', '0', '1466784000', '0', '', '', '1473594487', '1473594487', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('125', '4', '0', '86', '0', 'Luosa', '1', '', '0', '0', '0', '1466092800', '0', '', '', '1473594488', '1473594488', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('126', '4', '0', '84', '0', 'Luosa', '0', '', '0', '0', '0', '1465920000', '0', '', '', '1473594489', '1473594489', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('127', '4', '0', '49', '0', 'Luosa', '0', '', '0', '0', '0', '1465920000', '0', '', '', '1473594490', '1473594490', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('128', '4', '0', '51', '0', 'Luosa', '1', '', '0', '0', '0', '1465833600', '0', '', '', '1473594491', '1473594491', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('129', '4', '0', '87', '0', 'Luosa', '1', '', '0', '0', '0', '1465833600', '0', '', '', '1473594492', '1473594492', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('130', '4', '0', '56', '0', 'Luosa', '1', '', '0', '0', '0', '1465747200', '0', '', '', '1473594493', '1473594493', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('131', '4', '0', '61', '0', 'Luosa', '1', '', '0', '0', '0', '1465228800', '0', '', '', '1473594495', '1473594495', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('132', '4', '0', '127', '0', 'Luosa', '0', '', '0', '0', '0', '1465228800', '0', '', '', '1473594496', '1473594496', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('133', '4', '0', '60', '0', 'Luosa', '0', '', '0', '0', '0', '1465228800', '0', '', '', '1473594497', '1473594497', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('134', '4', '0', '103', '0', 'Luosa', '0', '', '0', '0', '0', '1465142400', '0', '', '', '1473594498', '1473594498', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('135', '4', '0', '17', '0', 'Luosa', '0', '', '0', '0', '0', '1465142400', '0', '', '', '1473594499', '1473594499', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('136', '4', '0', '36', '0', 'Luosa', '0', '', '0', '0', '0', '1465142400', '0', '', '', '1473594500', '1473594500', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('137', '4', '0', '52', '0', 'Luosa', '0', '', '0', '0', '0', '1465142400', '0', '', '', '1473594501', '1473594501', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('138', '4', '0', '121', '0', 'Luosa', '0', '', '0', '0', '0', '1464969600', '0', '', '', '1473594502', '1473594502', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('139', '4', '0', '57', '0', 'Luosa', '0', '', '0', '0', '0', '1464883200', '0', '', '', '1473594503', '1473594503', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('140', '4', '0', '127', '0', 'Luosa', '0', '', '0', '0', '0', '1464796800', '0', '', '', '1473594504', '1473594504', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('141', '4', '0', '98', '0', 'Luosa', '0', '', '0', '0', '0', '1464796800', '0', '', '', '1473594505', '1473594505', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('142', '4', '0', '94', '0', 'Luosa', '1', '', '0', '0', '0', '1464710400', '0', '', '', '1473594506', '1473594506', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('143', '4', '0', '122', '0', 'Luosa', '0', '', '0', '0', '0', '1464624000', '0', '', '', '1473594507', '1473594507', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('144', '4', '0', '47', '0', 'Luosa', '1', '', '0', '0', '0', '1464537600', '0', '', '', '1473594508', '1473594508', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('145', '4', '0', '58', '0', 'Luosa', '1', '', '0', '0', '0', '1464451200', '0', '', '', '1473594509', '1473594509', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('146', '4', '0', '23', '0', 'Luosa', '1', '', '0', '0', '0', '1464451200', '0', '', '', '1473594510', '1473594510', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('147', '4', '0', '46', '0', 'Luosa', '0', '', '0', '0', '0', '1464192000', '0', '', '', '1473594511', '1473594511', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('148', '4', '0', '48', '0', 'Luosa', '1', '', '0', '0', '0', '1464105600', '0', '', '', '1473594512', '1473594512', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('149', '4', '0', '93', '0', 'Luosa', '0', '', '0', '0', '0', '1464105600', '0', '', '', '1473594513', '1473594513', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('150', '4', '0', '16', '0', 'Luosa', '1', '', '0', '0', '0', '1464105600', '0', '', '', '1473594514', '1473594514', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('151', '4', '0', '119', '0', 'Luosa', '0', '', '0', '0', '0', '1464105600', '0', '', '', '1473594515', '1473594515', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('152', '4', '0', '5', '0', 'Luosa', '0', '', '0', '0', '0', '1464019200', '0', '', '', '1473594516', '1473594516', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('153', '4', '0', '84', '0', 'Luosa', '1', '', '0', '0', '0', '1463932800', '0', '', '', '1473594517', '1473594517', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('154', '4', '0', '40', '0', 'Luosa', '0', '', '0', '0', '0', '1463932800', '0', '', '', '1473594518', '1473594518', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('155', '4', '0', '74', '0', 'Luosa', '0', '', '0', '0', '0', '1463932800', '0', '', '', '1473594519', '1473594519', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('156', '4', '0', '15', '0', 'Luosa', '0', '', '0', '0', '0', '1463932800', '0', '', '', '1473594520', '1473594520', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('157', '4', '0', '121', '0', 'Luosa', '0', '', '0', '0', '0', '1463932800', '0', '', '', '1473594521', '1473594521', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('158', '4', '0', '33', '0', 'Luosa', '0', '', '0', '0', '0', '1463932800', '0', '', '', '1473594522', '1473594522', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('159', '4', '0', '15', '0', 'Luosa', '1', '', '0', '0', '0', '1463846400', '0', '', '', '1473594523', '1473594523', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('160', '4', '0', '70', '0', 'Luosa', '0', '', '0', '0', '0', '1463846400', '0', '', '', '1473594524', '1473594524', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('161', '4', '0', '37', '0', 'Luosa', '1', '', '0', '0', '0', '1463846400', '0', '', '', '1473594525', '1473594525', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('162', '4', '0', '57', '0', 'Luosa', '1', '', '0', '0', '0', '1463760000', '0', '', '', '1473594526', '1473594526', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('163', '4', '0', '95', '0', 'Luosa', '0', '', '0', '0', '0', '1463760000', '0', '', '', '1473594527', '1473594527', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('164', '4', '0', '71', '0', 'Luosa', '1', '', '0', '0', '0', '1463760000', '0', '', '', '1473594528', '1473594528', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('165', '4', '0', '19', '0', 'Luosa', '1', '', '0', '0', '0', '1463760000', '0', '', '', '1473594529', '1473594529', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('166', '4', '0', '116', '0', 'Luosa', '0', '', '0', '0', '0', '1463065800', '22', '', '', '1473594530', '1473594530', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('167', '4', '0', '125', '0', 'Luosa', '0', '', '0', '0', '0', '1462982400', '0', '', '', '1473594531', '1473594531', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('168', '4', '0', '75', '0', 'Luosa', '1', '', '0', '0', '0', '1462896000', '0', '', '', '1473594532', '1473594532', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('169', '4', '0', '51', '0', 'Luosa', '0', '', '0', '0', '0', '1462723200', '0', '', '', '1473594533', '1473594533', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('170', '4', '0', '49', '0', 'Luosa', '0', '', '0', '0', '0', '1462723200', '0', '', '', '1473594534', '1473594534', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('171', '4', '0', '100', '0', 'Luosa', '1', '', '0', '0', '0', '1473596160', '0', '', '', '1473594535', '1473594535', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('172', '4', '0', '123', '0', 'Luosa', '1', '', '0', '0', '0', '1462377600', '0', '', '', '1473594536', '1473594536', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('173', '4', '0', '94', '0', 'Luosa', '0', '', '0', '0', '0', '1462291200', '0', '', '', '1473594537', '1473594537', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('174', '4', '0', '41', '0', 'Luosa', '0', '', '0', '0', '0', '1462291200', '0', '', '', '1473594538', '1473594538', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('175', '4', '0', '10', '0', 'Luosa', '1', '', '0', '0', '0', '1462204800', '0', '', '', '1473594539', '1473594539', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('176', '4', '0', '52', '0', 'Luosa', '1', '', '0', '0', '0', '1462005600', '19', '', '', '1473594540', '1473594540', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('177', '4', '0', '72', '0', 'Luosa', '1', '', '0', '0', '0', '1461772800', '0', '', '', '1473594541', '1473594541', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('178', '4', '0', '47', '0', 'Luosa', '0', '', '0', '0', '0', '1461686400', '0', '', '', '1473594542', '1473594542', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('179', '4', '0', '73', '0', 'Luosa', '0', '', '0', '0', '0', '1461686400', '0', '', '', '1473594543', '1473594543', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('180', '4', '0', '88', '0', 'Luosa', '1', '', '0', '0', '0', '1461686400', '0', '', '', '1473594544', '1473594544', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('181', '4', '0', '10', '0', 'Luosa', '0', '', '0', '0', '0', '1461427200', '0', '', '', '1473594545', '1473594545', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('182', '4', '0', '84', '0', 'Luosa', '0', '', '0', '0', '0', '1461427200', '0', '', '', '1473594546', '1473594546', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('183', '4', '0', '86', '0', 'Luosa', '1', '', '0', '0', '0', '1461168000', '0', '', '', '1473594547', '1473594547', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('184', '4', '0', '60', '0', 'Luosa', '0', '', '0', '0', '0', '1460995200', '0', '', '', '1473594548', '1473594548', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('185', '4', '0', '24', '0', 'Luosa', '0', '', '0', '0', '0', '1460995200', '0', '', '', '1473594549', '1473594549', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('186', '4', '0', '76', '0', 'Luosa', '1', '', '0', '0', '0', '1460908800', '0', '', '', '1473594550', '1473594550', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('187', '4', '0', '101', '0', 'Luosa', '0', '', '0', '0', '0', '1460908800', '0', '', '', '1473594551', '1473594551', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('188', '4', '0', '17', '0', 'Luosa', '0', '', '0', '0', '0', '1460822400', '0', '', '', '1473594552', '1473594552', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('189', '4', '0', '48', '0', 'Luosa', '1', '', '0', '0', '0', '1460563200', '0', '', '', '1473594553', '1473594553', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('190', '4', '0', '30', '0', 'Luosa', '0', '', '0', '0', '0', '1460563200', '0', '', '', '1473594554', '1473594554', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('191', '4', '0', '112', '0', 'Luosa', '1', '', '0', '0', '0', '1460563200', '0', '', '', '1473594555', '1473594555', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('192', '4', '0', '42', '0', 'Luosa', '0', '', '0', '0', '0', '1460476800', '0', '', '', '1473594556', '1473594556', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('193', '4', '0', '92', '0', 'Luosa', '0', '', '0', '0', '0', '1460390400', '0', '', '', '1473594557', '1473594557', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('194', '4', '0', '89', '0', 'Luosa', '0', '', '0', '0', '0', '1460304000', '0', '', '', '1473594558', '1473594558', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('195', '4', '0', '47', '0', 'Luosa', '1', '', '0', '0', '0', '1460217600', '0', '', '', '1473594559', '1473594559', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('196', '4', '0', '69', '0', 'Luosa', '0', '', '0', '0', '0', '1460131200', '0', '', '', '1473594560', '1473594560', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('197', '4', '0', '18', '0', 'Luosa', '0', '', '0', '0', '0', '1460044800', '0', '', '', '1473594561', '1473594561', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('198', '4', '0', '76', '0', 'Luosa', '1', '', '0', '0', '0', '1459910700', '17', '', '', '1473594562', '1473594562', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('199', '4', '0', '109', '0', 'Luosa', '1', '', '0', '0', '0', '1459872000', '0', '', '', '1473594563', '1473594563', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('200', '4', '0', '105', '0', 'Luosa', '0', '', '0', '0', '0', '1459785600', '0', '', '', '1473594564', '1473594564', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('201', '4', '0', '38', '0', 'Luosa', '0', '', '0', '0', '0', '1459785600', '0', '', '', '1473594565', '1473594565', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('202', '4', '0', '76', '0', 'Luosa', '1', '', '0', '0', '0', '1459780680', '23', '', '', '1473594566', '1473594566', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('203', '4', '0', '73', '0', 'Luosa', '1', '', '0', '0', '0', '1459612800', '0', '', '', '1473594567', '1473594567', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('204', '4', '0', '62', '0', 'Luosa', '0', '', '0', '0', '0', '1459612800', '0', '', '', '1473594568', '1473594568', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('205', '4', '0', '21', '0', 'Luosa', '0', '', '0', '0', '0', '1459526400', '0', '', '', '1473594569', '1473594569', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('206', '4', '0', '16', '0', 'Luosa', '1', '', '0', '0', '0', '1459440000', '0', '', '', '1473594570', '1473594570', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('207', '4', '0', '116', '0', 'Luosa', '1', '', '0', '0', '0', '1459353600', '0', '', '', '1473594571', '1473594571', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('208', '4', '0', '34', '0', 'Luosa', '0', '', '0', '0', '0', '1459353600', '0', '', '', '1473594572', '1473594572', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('209', '4', '0', '18', '0', 'Luosa', '1', '', '0', '0', '0', '1459345500', '25', '', '', '1473594573', '1473594573', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('210', '4', '0', '114', '0', 'Luosa', '0', '', '0', '0', '0', '1459267200', '0', '', '', '1473594574', '1473594574', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('211', '4', '0', '114', '0', 'Luosa', '1', '', '0', '0', '0', '1459094400', '0', '', '', '1473594575', '1473594575', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('212', '4', '0', '71', '0', 'Luosa', '1', '', '0', '0', '0', '1459008000', '0', '', '', '1473594576', '1473594576', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('213', '4', '0', '13', '0', 'Luosa', '0', '', '0', '0', '0', '1459008000', '0', '', '', '1473594577', '1473594577', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('214', '4', '0', '31', '0', 'Luosa', '0', '', '0', '0', '0', '1459008000', '0', '', '', '1473594578', '1473594578', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('215', '4', '0', '25', '0', 'Luosa', '0', '', '0', '0', '0', '1458921600', '0', '', '', '1473594579', '1473594579', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('216', '4', '0', '107', '0', 'Luosa', '0', '', '0', '0', '0', '1458921600', '0', '', '', '1473594580', '1473594580', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('217', '4', '0', '20', '0', 'Luosa', '1', '', '0', '0', '0', '1458921600', '0', '', '', '1473594581', '1473594581', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('218', '4', '0', '9', '0', 'Luosa', '1', '', '0', '0', '0', '1458921600', '0', '', '', '1473594582', '1473594582', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('219', '4', '0', '22', '0', 'Luosa', '1', '', '0', '0', '0', '1458921600', '0', '', '', '1473594583', '1473594583', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('220', '4', '0', '15', '0', 'Luosa', '1', '', '0', '0', '0', '1458921600', '0', '', '', '1473594584', '1473594584', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('221', '4', '0', '69', '0', 'Luosa', '1', '', '0', '0', '0', '1458835200', '0', '', '', '1473594585', '1473594585', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('222', '4', '0', '84', '0', 'Luosa', '1', '', '0', '0', '0', '1458835200', '0', '', '', '1473594586', '1473594586', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('223', '4', '0', '123', '0', 'Luosa', '0', '', '0', '0', '0', '1461427200', '0', '', '', '1473594587', '1473594587', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('224', '4', '0', '127', '0', 'Luosa', '1', '', '0', '0', '0', '1458662400', '0', '', '', '1473594588', '1473594588', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('225', '4', '0', '112', '0', 'Luosa', '1', '', '0', '0', '0', '1458653820', '28', '', '', '1473594589', '1473594589', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('226', '4', '0', '11', '0', 'Luosa', '0', '', '0', '0', '0', '1458403200', '0', '', '', '1473594590', '1473594590', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('227', '4', '0', '63', '0', 'Luosa', '1', '', '0', '0', '0', '1458403200', '0', '', '', '1473594591', '1473594591', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('228', '4', '0', '72', '0', 'Luosa', '0', '', '0', '0', '0', '1458403200', '0', '', '', '1473594592', '1473594592', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('229', '4', '0', '107', '0', 'Luosa', '0', '', '0', '0', '0', '1458403200', '0', '', '', '1473594593', '1473594593', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('230', '4', '0', '19', '0', 'Luosa', '0', '', '0', '0', '0', '1458403200', '0', '', '', '1473594594', '1473594594', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('231', '4', '0', '109', '0', 'Luosa', '1', '', '0', '0', '0', '1458403200', '0', '', '', '1473594595', '1473594595', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('232', '4', '0', '68', '0', 'Luosa', '1', '', '0', '0', '0', '1458392940', '16', '', '', '1473594596', '1473594596', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('233', '4', '0', '12', '0', 'Luosa', '1', '', '0', '0', '0', '1458316800', '0', '', '', '1473594597', '1473594597', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('234', '4', '0', '14', '0', 'Luosa', '0', '', '0', '0', '0', '1458144000', '0', '', '', '1473594598', '1473594598', '1', null, '0');
INSERT INTO `cmf_lol_match` VALUES ('235', '4', '0', '18', '0', 'Luosa', '1', '', '0', '0', '0', '1458057600', '0', '', '', '1473594599', '1473594599', '1', null, '0');

-- ----------------------------
-- Table structure for cmf_lol_match_details
-- ----------------------------
DROP TABLE IF EXISTS `cmf_lol_match_details`;
CREATE TABLE `cmf_lol_match_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `match_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '比赛记录ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `more` text COMMENT '扩展数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='游戏详情表';

-- ----------------------------
-- Records of cmf_lol_match_details
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_lol_mode
-- ----------------------------
DROP TABLE IF EXISTS `cmf_lol_mode`;
CREATE TABLE `cmf_lol_mode` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '游戏模式ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '类型：',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '模式名',
  `alternate` varchar(255) NOT NULL DEFAULT '' COMMENT '备用',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `content` text COMMENT '详情',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态',
  `more` text COMMENT '扩展',
  `list_order` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '排序：从小打大',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='英雄联盟游戏模式';

-- ----------------------------
-- Records of cmf_lol_mode
-- ----------------------------
INSERT INTO `cmf_lol_mode` VALUES ('1', '0', '匹配赛', '自选模式', '', '', '', '2016', '2017', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('2', '0', '排位赛', '征召模式', '', '', '现在分为多种了：灵活排位（与之前一样）、单排/双排、季前赛', '2016', '2017', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('3', '0', '人机模式', '', '', '', '', '2016', '2016', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('4', '0', '极地大乱斗', '随机', '', '', '地图：嚎哭深渊\r\n匹配模式：随机', '2016', '2017', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('5', '0', '扭曲丛林', '3V3模式', '', '', '确切来说，扭曲丛林是一张经典对战模式的游戏地图，而不是游戏模式。', '2016', '2017', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('6', '0', '自定义模式\r\n', '', '', '', '', '2016', '2016', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('7', '1', '互选征召', '', '', '', '让我们互相给对方选英雄吧！', '2016', '2017', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('8', '1', '大对决', '', '', '', '', '2016', '2016', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('9', '1', '末日人机', '超变态AI', '', '', '末日人机又叫末日人工智能，是英雄联盟一个全新的游戏模式，独立于原有的经典对战模式。点击客户端的PLAY按钮，选择人机对战，即可看到到末日人机的入口。你的召唤师等级必须大于或等于10级才能够参与该模式。\r\n末日人机分为三个难度，分别为一星、二星、五星，只有在挑战过低难度的末日人机后，才能挑战更高难度。\r\n\r\n\r\n开放时间：\r\n2014年7月31日 ~ 2014年8月10日\r\n2016年10月28日18:00 ~ 2016年11月7日11:00\r\n2017年6月02日 10:00 ~ 2017年6月15日 2', '2016', '2017', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('10', '1', '无限火力', '', '', '', 'CD达到80%，近战提升100%攻击速度，远程提升50%攻击速度。这些值都是默认的。', '2016', '2017', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('11', '1', '克隆大作战', '', '', '', '来十只猴子上天怎么样', '2016', '2017', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('12', '1', '六杀模式', '', '', '', '', '2016', '2016', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('13', '1', '飞升争夺战', '', '', '', '中间那不是棺材吗？', '2016', '2017', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('14', '1', '魂罗大乱斗', '', '', '', '', '2016', '2016', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('15', '1', '枢纽攻防', '', '', '', '', '2016', '2016', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('16', '0', '血月杀', '速战速决', '', '2017年9月1日18:00 - 2017年9月4日10:00', '献祭游魂，恶魔先锋以及敌方英雄来获得分数和恶魔烙印增益效果，这将让你进入潜行状态，猎杀你的敌人。 ', '2017', '2017', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('17', '0', '无限乱斗', '一次玩个够', '', '2017\r\n7月18日~7月21日和7月24日-7月28日的18:00-24:00\r\n7月22日~23日、7月29日~30日的全天\r\n7月31日的18:00~24:00。\r\n8月15日~8月28日,每天的中午12:00到凌晨4:00。', '与无限火力不同的是它是随机的。', '2017', '2017', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('18', '0', '峡谷大乱斗', '限时模式', '', '', '使用一个随机选择到的英雄来打爆对线的敌人，冲进史诗级的五对五团战，然后摧毁敌方的水晶枢纽。', '2017', '2017', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('19', '0', '死兆星：奇点', '限时模式', '', '', '在这个发生在星界废墟的快节奏回合制3V3模式中使用锤石去将灵魂喂给死兆星，以触发奇点。', '2017', '2017', '0', null, '0');
INSERT INTO `cmf_lol_mode` VALUES ('20', '0', '怪兽入侵', '限时模式', '', '2017年9月8日~2017年9月26日23:59', '见证全新而神秘的星之守护者来临，参与全新的怪兽入侵游戏模式，来保护你的城市免受一系列魔物们的攻击。从2017年9月8日~2017年9月26日23:59，组建你的五人小队，在这个PVE模式下保卫星光。通过完成怪兽入侵模式的任务，赢取星光徽章。你可以用这些徽章来打造全新的初之际守卫以及海克斯科技神秘英雄(永久随机英雄)。所有星之守护者皮肤将可免费使用。', '2017', '2017', '0', null, '0');

-- ----------------------------
-- Table structure for cmf_lol_region
-- ----------------------------
DROP TABLE IF EXISTS `cmf_lol_region`;
CREATE TABLE `cmf_lol_region` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '地区id',
  `nettype` varchar(50) NOT NULL DEFAULT '' COMMENT '网络类型：电信、网通、移动、全区',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'REGIONS地区名字',
  `mark` varchar(50) NOT NULL DEFAULT '' COMMENT '牌号：一、二、三、、、',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态',
  `more` text COMMENT '扩展数据',
  `list_order` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '排序：从小到大',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='英雄联盟游戏大区表';

-- ----------------------------
-- Records of cmf_lol_region
-- ----------------------------
INSERT INTO `cmf_lol_region` VALUES ('1', '电信', '艾欧尼亚', '一', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('2', '电信', '祖安', '二', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('3', '电信', '诺克萨斯', '三', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('4', '电信', '班德尔城', '四', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('5', '电信', '皮尔沃特夫', '五', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('6', '电信', '战争学院', '六', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('7', '电信', '巨神峰', '七', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('8', '电信', '雷瑟守备', '八', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('9', '电信', '钢铁烈阳', '九', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('10', '电信', '裁决之地', '十', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('11', '电信', '黑色玫瑰', '十一', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('12', '电信', '暗影岛', '十二', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('13', '电信', '均衡教派', '十三', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('14', '电信', '水晶之痕', '十四', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('15', '电信', '影流', '十五', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('16', '电信', '守望之海', '十六', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('17', '电信', '征服之海', '十七', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('18', '电信', '卡拉曼达', '十八', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('19', '电信', '皮城警备', '十九', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('20', '网通', '比尔吉沃特', '一', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('21', '网通', '德玛西亚', '二', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('22', '网通', '弗雷尔卓德', '三', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('23', '网通', '无畏先锋', '四', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('24', '网通', '恕瑞玛', '五', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('25', '网通', '扭曲丛林', '六', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('26', '网通', '巨龙之巢', '七', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('27', '其他', '教育网专区', '一', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('28', '其他', '男爵领域', '一', '0', '', '0');
INSERT INTO `cmf_lol_region` VALUES ('98', '', '', '', '0', '符文之地', '0');
INSERT INTO `cmf_lol_region` VALUES ('99', '', '', '', '0', '虚空之地', '0');

-- ----------------------------
-- Table structure for cmf_nav
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav`;
CREATE TABLE `cmf_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航位置表';

-- ----------------------------
-- Records of cmf_nav
-- ----------------------------
INSERT INTO `cmf_nav` VALUES ('1', '1', '主导航', '主导航');
INSERT INTO `cmf_nav` VALUES ('2', '0', '底部导航', '');

-- ----------------------------
-- Table structure for cmf_nav_menu
-- ----------------------------
DROP TABLE IF EXISTS `cmf_nav_menu`;
CREATE TABLE `cmf_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航菜单表';

-- ----------------------------
-- Records of cmf_nav_menu
-- ----------------------------
INSERT INTO `cmf_nav_menu` VALUES ('1', '1', '0', '1', '0', '首页', '', 'home', '', '0-1');

-- ----------------------------
-- Table structure for cmf_option
-- ----------------------------
DROP TABLE IF EXISTS `cmf_option`;
CREATE TABLE `cmf_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- ----------------------------
-- Records of cmf_option
-- ----------------------------
INSERT INTO `cmf_option` VALUES ('7', '1', 'site_info', '{\"site_name\":\"iData\",\"site_seo_title\":\"iData\",\"site_seo_keywords\":\"iData,lol,wowlothar,\\u6570\\u636e\",\"site_seo_description\":\"iData\\u6570\\u636e\\u4e2d\\u5fc3\",\"site_icp\":\"\\u7696ICP\\u590716020301\\u53f7\",\"site_admin_email\":\"915273691@qq.com\",\"site_analytics\":\"\",\"urlmode\":\"1\",\"html_suffix\":\"\",\"site_logo\":\"\",\"site_copyright\":\"CopyRight 2016-2017  wowlothar.cn ,All Rights Reserved\",\"site_tel\":\"\",\"site_addr\":\"\"}');
INSERT INTO `cmf_option` VALUES ('8', '1', 'smtp_setting', '{\"from_name\":\"lothar\",\"from\":\"wowlothar@foxmail.com\",\"host\":\"smtp.qq.com\",\"smtp_secure\":\"\",\"port\":\"25\",\"username\":\"915273691@qq.com\",\"password\":\"w756409185\"}');
INSERT INTO `cmf_option` VALUES ('9', '1', 'cmf_settings', '{\"open_registration\":\"0\",\"banned_usernames\":\"\"}');
INSERT INTO `cmf_option` VALUES ('10', '1', 'cdn_settings', '{\"cdn_static_root\":\"\"}');
INSERT INTO `cmf_option` VALUES ('11', '1', 'admin_settings', '{\"admin_password\":\"\",\"admin_style\":\"flatadmin\"}');

-- ----------------------------
-- Table structure for cmf_plugin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_plugin`;
CREATE TABLE `cmf_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='插件表';

-- ----------------------------
-- Records of cmf_plugin
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_portal_category
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_category`;
CREATE TABLE `cmf_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章分类表';

-- ----------------------------
-- Records of cmf_portal_category
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_portal_category_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_category_post`;
CREATE TABLE `cmf_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

-- ----------------------------
-- Records of cmf_portal_category_post
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_portal_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_post`;
CREATE TABLE `cmf_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `post_parent` (`parent_id`),
  KEY `post_author` (`user_id`),
  KEY `post_date` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表';

-- ----------------------------
-- Records of cmf_portal_post
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_portal_tag
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_tag`;
CREATE TABLE `cmf_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章标签表';

-- ----------------------------
-- Records of cmf_portal_tag
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_portal_tag_post
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_tag_post`;
CREATE TABLE `cmf_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';

-- ----------------------------
-- Records of cmf_portal_tag_post
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `cmf_recycle_bin`;
CREATE TABLE `cmf_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站';

-- ----------------------------
-- Records of cmf_recycle_bin
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_role
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role`;
CREATE TABLE `cmf_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of cmf_role
-- ----------------------------
INSERT INTO `cmf_role` VALUES ('1', '0', '1', '1329633709', '1329633709', '0', '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO `cmf_role` VALUES ('2', '0', '1', '1329633709', '1329633709', '0', '普通管理员', '权限由最高管理员分配！');

-- ----------------------------
-- Table structure for cmf_role_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of cmf_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_route
-- ----------------------------
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';

-- ----------------------------
-- Records of cmf_route
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_slide
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide`;
CREATE TABLE `cmf_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片表';

-- ----------------------------
-- Records of cmf_slide
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_slide_item
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide_item`;
CREATE TABLE `cmf_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '链接打开方式',
  PRIMARY KEY (`id`),
  KEY `slide_cid` (`slide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片子项表';

-- ----------------------------
-- Records of cmf_slide_item
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_theme
-- ----------------------------
DROP TABLE IF EXISTS `cmf_theme`;
CREATE TABLE `cmf_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_theme
-- ----------------------------
INSERT INTO `cmf_theme` VALUES ('19', '0', '0', '0', '0', 'simpleboot3', 'simpleboot3', '1.0.2', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF模板', 'ThinkCMF默认模板');

-- ----------------------------
-- Table structure for cmf_theme_file
-- ----------------------------
DROP TABLE IF EXISTS `cmf_theme_file`;
CREATE TABLE `cmf_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_theme_file
-- ----------------------------
INSERT INTO `cmf_theme_file` VALUES ('105', '0', '10', 'simpleboot3', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"name\":\"hot_articles_category_id\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"name\":\"hot_articles_category_id\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '');
INSERT INTO `cmf_theme_file` VALUES ('106', '0', '10', 'simpleboot3', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '');
INSERT INTO `cmf_theme_file` VALUES ('107', '0', '5', 'simpleboot3', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '');
INSERT INTO `cmf_theme_file` VALUES ('108', '0', '10', 'simpleboot3', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '');
INSERT INTO `cmf_theme_file` VALUES ('109', '0', '10', 'simpleboot3', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '');
INSERT INTO `cmf_theme_file` VALUES ('110', '0', '10', 'simpleboot3', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '');
INSERT INTO `cmf_theme_file` VALUES ('111', '1', '0', 'simpleboot3', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', '');
INSERT INTO `cmf_theme_file` VALUES ('112', '1', '1', 'simpleboot3', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"Lothar\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '');

-- ----------------------------
-- Table structure for cmf_third_party_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_third_party_user`;
CREATE TABLE `cmf_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方用户表';

-- ----------------------------
-- Records of cmf_third_party_user
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_user
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user`;
CREATE TABLE `cmf_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of cmf_user
-- ----------------------------
INSERT INTO `cmf_user` VALUES ('1', '1', '0', '0', '1516162154', '2', '0', '1515924076', '1', 'lothar', '###f48cdfebc5d072d46677f0146165d88c', 'lothar', '915273691@qq.com', '', '', '', '127.0.0.1', '', '', '');

-- ----------------------------
-- Table structure for cmf_user_action
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_action`;
CREATE TABLE `cmf_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表';

-- ----------------------------
-- Records of cmf_user_action
-- ----------------------------
INSERT INTO `cmf_user_action` VALUES ('1', '1', '0', '1', '1', '1', '用户登录', 'login', 'user', '');

-- ----------------------------
-- Table structure for cmf_user_action_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_action_log`;
CREATE TABLE `cmf_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问记录表';

-- ----------------------------
-- Records of cmf_user_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_favorite`;
CREATE TABLE `cmf_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的描述',
  `table_name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';

-- ----------------------------
-- Records of cmf_user_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_user_login_attempt
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_login_attempt`;
CREATE TABLE `cmf_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';

-- ----------------------------
-- Records of cmf_user_login_attempt
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_score_log`;
CREATE TABLE `cmf_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作积分等奖励日志表';

-- ----------------------------
-- Records of cmf_user_score_log
-- ----------------------------
INSERT INTO `cmf_user_score_log` VALUES ('1', '1', '1516016302', 'login', '1', '0');
INSERT INTO `cmf_user_score_log` VALUES ('2', '1', '1516159095', 'login', '1', '0');

-- ----------------------------
-- Table structure for cmf_user_token
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_token`;
CREATE TABLE `cmf_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of cmf_user_token
-- ----------------------------
INSERT INTO `cmf_user_token` VALUES ('3', '1', '1531546279', '1515994279', 'd1d1169bdc2675c3e5b3f2b83fcd9a19d1d1169bdc2675c3e5b3f2b83fcd9a19', 'web');

-- ----------------------------
-- Table structure for cmf_verification_code
-- ----------------------------
DROP TABLE IF EXISTS `cmf_verification_code`;
CREATE TABLE `cmf_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表';

-- ----------------------------
-- Records of cmf_verification_code
-- ----------------------------

-- ----------------------------
-- Table structure for cmf_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `cmf_visit_log`;
CREATE TABLE `cmf_visit_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `obj_type` varchar(50) NOT NULL DEFAULT '' COMMENT '对象类型：pc电脑 wap移动端 wechat微信',
  `obj_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '对象ID',
  `total` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '同一IP同一设备一天内访问次数',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT 'ID地址',
  `ipaddr` text COMMENT 'json_encode转化的地址',
  `ipaddrVar` text COMMENT 'implode打散的数组',
  `agent` text COMMENT '代理',
  `agent_md5` varchar(32) NOT NULL DEFAULT '' COMMENT '代理MD5加密码',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '新增时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx1` (`create_time`,`ip`,`agent`(20))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='站点访问日志';

-- ----------------------------
-- Records of cmf_visit_log
-- ----------------------------
INSERT INTO `cmf_visit_log` VALUES ('1', '0', 'pc', '0', '12', '127.0.0.1', '\"\\u672c\\u5730\"', '本地', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '9d6e5576531c38953e05804e13fa8e74', '1516157120', '1516162613');
