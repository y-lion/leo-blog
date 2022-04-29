/*
 Navicat Premium Data Transfer

 Source Server         : mysql8
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : leo_blog

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 29/04/2022 17:02:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_article
-- ----------------------------
DROP TABLE IF EXISTS `tb_article`;
CREATE TABLE `tb_article`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `des` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章描述',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_article
-- ----------------------------
INSERT INTO `tb_article` VALUES (7, '11', 'cloudleo', '<p>123123</p>', '<p>123123</p>', '2022-04-12 16:21:10');
INSERT INTO `tb_article` VALUES (8, '测试文章', 'cloudleo', '<p>点击查看文章</p>', '<p><a class=\"fr-file\" href=\"blob:http%3A//127.0.0.1/bcd06938-daed-43f0-9cfa-a725971ade75\" target=\"_blank\">1.txt</a></p><p>点击下载txt</p>', '2022-04-12 16:21:48');
INSERT INTO `tb_article` VALUES (9, '测试文章', 'cloudleo', '<p>测试文章</p>', '<p>点击<span class=\"fr-emoticon fr-deletable fr-emoticon-img\" style=\"background: url(https://cdnjs.cloudflare.com/ajax/libs/emojione/2.0.1/assets/svg/1f60d.svg);\">&nbsp;</span>&nbsp;<img src=\"blob:http://127.0.0.1/d82a851d-df88-4770-943c-308c4f492123\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p><p><br></p><p>这是一只狮子</p><p><a class=\"fr-file\" href=\"blob:http%3A//127.0.0.1/67ad8807-ff5d-4c0d-8c6c-6d7c70fee94d\" target=\"_blank\">2.txt</a></p>', '2022-04-12 16:25:20');
INSERT INTO `tb_article` VALUES (10, '测试视频', 'cloudleo', '<p><span class=\"fr-video fr-dvb fr-draggable\" contenteditable=\"false\" draggable=\"true\"><video class=\"fr-draggable\" controls=\"\" src=\"https://www.w3school.com.cn/example/html5/mov_bbb.mp4\" style=\"width: 600px;\">Your browser does not support HTML5 video.</video></span>看，动画片</p>', '<p>动画片</p>', '2022-04-12 16:29:29');
INSERT INTO `tb_article` VALUES (11, '测试', 'cloudleo', '<p>2</p>', '<p>22</p>', '2022-04-25 00:19:40');
INSERT INTO `tb_article` VALUES (17, '1', 'cloudleo', '<p><br></p><p><span class=\"fr-video fr-dvb fr-draggable\" contenteditable=\"false\" draggable=\"true\"><video class=\"fr-draggable\" controls=\"\" src=\"blob:http://127.0.0.1/3abb022d-4632-4c2e-b242-991097be08c4\" style=\"width: 600px;\">Your browser does not support HTML5 video.</video></span></p>', '<p>1</p>', '2022-04-27 04:10:14');
INSERT INTO `tb_article` VALUES (18, '1', 'cloudleo', '<p><img src=\"blob:http://127.0.0.1/2520dce8-87fd-4a7b-9a77-92f456d15825\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"></p>', '<p>1</p>', '2022-04-27 04:12:20');
INSERT INTO `tb_article` VALUES (19, '1', 'cloudleo', '<p></p><p><span class=\"fr-video fr-dvb fr-draggable\" contenteditable=\"false\" draggable=\"true\"><video class=\"fr-draggable\" controls=\"\" src=\"http://oss.cloudleo.cn/3efe82261b2e47aaa507e0b78a7be1c9.mp4\" style=\"width: 600px;\">Your browser does not support HTML5 video.</video></span></p><img src=\"http://oss.cloudleo.cn/e4222db39b384a9bb44a96172c8833f0.png\" style=\"width: 300px;\" class=\"fr-fic fr-dib\"><p></p>', '<p>1</p>', '2022-04-27 04:14:39');

-- ----------------------------
-- Table structure for tb_article_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_article_category`;
CREATE TABLE `tb_article_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `article_id` bigint(20) NOT NULL COMMENT '文章ID',
  `category_id` bigint(20) NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章&&分类关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_article_category
-- ----------------------------
INSERT INTO `tb_article_category` VALUES (10, 7, 9);
INSERT INTO `tb_article_category` VALUES (12, 8, 9);
INSERT INTO `tb_article_category` VALUES (13, 9, 9);
INSERT INTO `tb_article_category` VALUES (14, 10, 9);
INSERT INTO `tb_article_category` VALUES (15, 11, 9);
INSERT INTO `tb_article_category` VALUES (21, 17, 9);
INSERT INTO `tb_article_category` VALUES (22, 18, 9);
INSERT INTO `tb_article_category` VALUES (23, 19, 9);

-- ----------------------------
-- Table structure for tb_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_article_tag`;
CREATE TABLE `tb_article_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `article_id` bigint(20) NOT NULL COMMENT '文章ID',
  `tag_id` bigint(20) NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章&&标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_article_tag
-- ----------------------------
INSERT INTO `tb_article_tag` VALUES (11, 7, 7);
INSERT INTO `tb_article_tag` VALUES (13, 8, 5);
INSERT INTO `tb_article_tag` VALUES (14, 9, 7);
INSERT INTO `tb_article_tag` VALUES (15, 10, 7);
INSERT INTO `tb_article_tag` VALUES (16, 11, 5);
INSERT INTO `tb_article_tag` VALUES (22, 17, 7);
INSERT INTO `tb_article_tag` VALUES (23, 18, 7);
INSERT INTO `tb_article_tag` VALUES (24, 19, 7);

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES (5, 'Java');
INSERT INTO `tb_category` VALUES (6, '后端');
INSERT INTO `tb_category` VALUES (7, '前端');
INSERT INTO `tb_category` VALUES (8, '计算机基础');
INSERT INTO `tb_category` VALUES (9, '并发编程');

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `article_id` bigint(20) NULL DEFAULT NULL COMMENT '文章ID',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '给谁留言',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '留言内容',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `device` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '留言时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_link
-- ----------------------------
DROP TABLE IF EXISTS `tb_link`;
CREATE TABLE `tb_link`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接URL',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友链表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_link
-- ----------------------------
INSERT INTO `tb_link` VALUES (1, 'Blog', 'http://www.cloudleo.cn');
INSERT INTO `tb_link` VALUES (2, 'Github', 'https://github.com/cloud-leo');

-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `operation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `time` bigint(20) NULL DEFAULT NULL COMMENT '耗时(毫秒)',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作方法',
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作参数',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `location` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 148 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_log
-- ----------------------------
INSERT INTO `tb_log` VALUES (96, 'cloudleo', '新增标签', 0, 'cn.cloudleo.biz.controller.TagController.save()', NULL, '127.0.0.1', '2022-04-09 00:50:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (97, 'cloudleo', '新增标签', 0, 'cn.cloudleo.biz.controller.TagController.save()', NULL, '127.0.0.1', '2022-04-09 00:50:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (98, 'cloudleo', '新增标签', 0, 'cn.cloudleo.biz.controller.TagController.save()', NULL, '127.0.0.1', '2022-04-09 00:51:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (99, 'cloudleo', '更新标签', 0, 'cn.cloudleo.biz.controller.TagController.update()', NULL, '127.0.0.1', '2022-04-09 00:51:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (100, 'cloudleo', '新增分类', 0, 'cn.cloudleo.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2022-04-09 00:51:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (101, 'cloudleo', '新增分类', 0, 'cn.cloudleo.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2022-04-09 00:51:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (102, 'cloudleo', '新增分类', 0, 'cn.cloudleo.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2022-04-09 00:51:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (103, 'cloudleo', '新增分类', 0, 'cn.cloudleo.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2022-04-09 00:51:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (104, 'cloudleo', '新增分类', 0, 'cn.cloudleo.biz.controller.CategoryController.save()', NULL, '127.0.0.1', '2022-04-09 00:52:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (105, 'cloudleo', '更新用户', 0, 'cn.cloudleo.biz.controller.UserController.update()', ' sysUser\"SysUser(id=1, username=null, password=null, avatar=/img/avatar/default....', '127.0.0.1', '2022-04-12 15:08:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (106, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=4, title=测试文章, author=cloudleo, des=<p>这是一篇测试文章</p><p ...', '127.0.0.1', '2022-04-12 15:16:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (107, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=5, title=测试文章, author=cloudleo, des=测试, content=\\n```m...', '127.0.0.1', '2022-04-12 15:17:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (108, 'cloudleo', '删除文章', 0, 'cn.cloudleo.biz.controller.ArticleController.delete()', NULL, '127.0.0.1', '2022-04-12 15:37:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (109, 'cloudleo', '删除文章', 0, 'cn.cloudleo.biz.controller.ArticleController.delete()', NULL, '127.0.0.1', '2022-04-12 15:37:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (110, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=6, title=1, author=cloudleo, des=<div class=\\\"fr-toolb...', '127.0.0.1', '2022-04-12 15:43:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (111, 'cloudleo', '删除文章', 0, 'cn.cloudleo.biz.controller.ArticleController.delete()', NULL, '127.0.0.1', '2022-04-12 16:06:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (112, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=7, title=11, author=cloudleo, des=<p>123123</p>, conte...', '127.0.0.1', '2022-04-12 16:21:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (113, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=8, title=测试文章, author=cloudleo, des=<p>点击查看文章</p>, con...', '127.0.0.1', '2022-04-12 16:21:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (114, 'cloudleo', '更新文章', 0, 'cn.cloudleo.biz.controller.ArticleController.update()', ' sysArticle\"SysArticle(id=8, title=测试文章, author=cloudleo, des=<p>点击查看文章</p>, con...', '127.0.0.1', '2022-04-12 16:22:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (115, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=9, title=测试文章, author=cloudleo, des=<p>测试文章</p>, conte...', '127.0.0.1', '2022-04-12 16:25:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (116, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=10, title=测试视频, author=cloudleo, des=<p><span class=\\\"...', '127.0.0.1', '2022-04-12 16:29:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (117, 'cloudleo', '修改密码', 0, 'cn.cloudleo.biz.controller.UserController.updatePass()', ' sysUser\"SysUser(id=null, username=null, password=demo001, avatar=null, email=nu...', '127.0.0.1', '2022-04-24 04:18:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (118, 'cloudleo', '修改密码', 0, 'cn.cloudleo.biz.controller.UserController.updatePass()', ' sysUser\"SysUser(id=null, username=null, password=demo001, avatar=null, email=nu...', '127.0.0.1', '2022-04-24 04:18:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (119, 'cloudleo', '修改密码', 0, 'cn.cloudleo.biz.controller.UserController.updatePass()', ' sysUser\"SysUser(id=null, username=null, password=demo001, avatar=null, email=nu...', '127.0.0.1', '2022-04-24 04:19:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (120, 'cloudleo', '修改密码', 0, 'cn.cloudleo.biz.controller.UserController.updatePass()', ' sysUser\"SysUser(id=null, username=null, password=demo001, avatar=null, email=nu...', '127.0.0.1', '2022-04-24 04:21:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (121, 'cloudleo', '修改密码', 0, 'cn.cloudleo.biz.controller.UserController.updatePass()', ' sysUser\"SysUser(id=null, username=null, password=demo001, avatar=null, email=nu...', '127.0.0.1', '2022-04-24 04:21:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (122, 'cloudleo', '修改密码', 0, 'cn.cloudleo.biz.controller.UserController.updatePass()', ' sysUser\"SysUser(id=1, username=null, password=demo01, avatar=null, email=null, ...', '127.0.0.1', '2022-04-24 04:22:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (123, 'cloudleo', '修改密码', 0, 'cn.cloudleo.biz.controller.UserController.updatePass()', ' sysUser\"SysUser(id=1, username=null, password=demo01, avatar=null, email=null, ...', '127.0.0.1', '2022-04-24 04:22:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (124, 'cloudleo', '修改密码', 0, 'cn.cloudleo.biz.controller.UserController.updatePass()', ' sysUser\"SysUser(id=1, username=null, password=demo01, avatar=null, email=null, ...', '127.0.0.1', '2022-04-24 04:24:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (125, 'cloudleo', '修改密码', 0, 'cn.cloudleo.biz.controller.UserController.updatePass()', ' sysUser\"SysUser(id=1, username=null, password=demo001, avatar=null, email=null,...', '127.0.0.1', '2022-04-24 04:25:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (126, 'cloudleo', '修改密码', 0, 'cn.cloudleo.biz.controller.UserController.updatePass()', ' sysUser\"SysUser(id=1, username=null, password=demo001, avatar=null, email=null,...', '127.0.0.1', '2022-04-24 04:26:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (127, 'cloudleo', '修改密码', 0, 'cn.cloudleo.biz.controller.UserController.updatePass()', ' sysUser\"SysUser(id=1, username=null, password=demo01, avatar=null, email=null, ...', '127.0.0.1', '2022-04-24 04:27:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (128, 'cloudleo', '修改密码', 1, 'cn.cloudleo.biz.controller.UserController.updatePass()', ' sysUser\"SysUser(id=1, username=null, password=demo01, avatar=null, email=null, ...', '127.0.0.1', '2022-04-24 04:27:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (129, 'cloudleo', '修改密码', 0, 'cn.cloudleo.biz.controller.UserController.updatePass()', ' sysUser\"SysUser(id=1, username=null, password=21b6f7af61ede50010212494bccc2338,...', '127.0.0.1', '2022-04-24 04:28:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (130, 'cloudleo', '删除登录日志', 0, 'cn.cloudleo.biz.controller.LoginLogController.delete()', NULL, '127.0.0.1', '2022-04-24 04:29:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (131, 'cloudleo', '删除所有登录日志', 0, 'cn.cloudleo.biz.controller.LoginLogController.delAll()', NULL, '127.0.0.1', '2022-04-24 04:39:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (132, 'cloudleo', '删除所有登录日志', 0, 'cn.cloudleo.biz.controller.LoginLogController.delAll()', NULL, '127.0.0.1', '2022-04-24 04:40:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (133, 'cloudleo', '删除所有登录日志', 0, 'cn.cloudleo.biz.controller.LoginLogController.delAll()', NULL, '127.0.0.1', '2022-04-24 04:40:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (134, 'cloudleo', '删除所有登录日志', 0, 'cn.cloudleo.biz.controller.LoginLogController.delAll()', NULL, '127.0.0.1', '2022-04-24 04:41:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (135, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=11, title=测试, author=cloudleo, des=<p>2</p>, content=<...', '127.0.0.1', '2022-04-25 00:19:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (136, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=12, title=1, author=cloudleo, des=<p><img src=\\\"http:/...', '127.0.0.1', '2022-04-25 00:44:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (137, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=13, title=测试, author=cloudleo, des=<p><span class=\\\"fr...', '127.0.0.1', '2022-04-25 00:48:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (138, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=14, title=demo01, author=cloudleo, des=<p><a class=\\\"f...', '127.0.0.1', '2022-04-26 04:23:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (139, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=15, title=1, author=cloudleo, des=<p><a class=\\\"fr-fil...', '127.0.0.1', '2022-04-26 04:27:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (140, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=16, title=1, author=cloudleo, des=<p><a class=\\\"fr-fil...', '127.0.0.1', '2022-04-26 04:27:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (141, 'cloudleo', '删除文章', 0, 'cn.cloudleo.biz.controller.ArticleController.delete()', NULL, '127.0.0.1', '2022-04-26 04:28:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (142, 'cloudleo', '删除文章', 0, 'cn.cloudleo.biz.controller.ArticleController.delete()', NULL, '127.0.0.1', '2022-04-26 04:28:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (143, 'cloudleo', '删除文章', 0, 'cn.cloudleo.biz.controller.ArticleController.delete()', NULL, '127.0.0.1', '2022-04-26 04:28:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (144, 'cloudleo', '删除文章', 0, 'cn.cloudleo.biz.controller.ArticleController.delete()', NULL, '127.0.0.1', '2022-04-26 04:28:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (145, 'cloudleo', '删除文章', 0, 'cn.cloudleo.biz.controller.ArticleController.delete()', NULL, '127.0.0.1', '2022-04-26 04:28:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (146, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=17, title=1, author=cloudleo, des=<p><br></p><p><span ...', '127.0.0.1', '2022-04-27 04:10:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (147, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=18, title=1, author=cloudleo, des=<p><img src=\\\"blob:h...', '127.0.0.1', '2022-04-27 04:12:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `tb_log` VALUES (148, 'cloudleo', '新增文章', 0, 'cn.cloudleo.biz.controller.ArticleController.add()', ' sysArticle\"SysArticle(id=19, title=1, author=cloudleo, des=<p></p><p><span clas...', '127.0.0.1', '2022-04-27 04:14:39', '内网IP|0|0|内网IP|内网IP');

-- ----------------------------
-- Table structure for tb_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_login_log`;
CREATE TABLE `tb_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录地点',
  `create_time` datetime NULL DEFAULT NULL COMMENT '登录时间',
  `device` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录设备',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_login_log
-- ----------------------------
INSERT INTO `tb_login_log` VALUES (139, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-24 15:21:56', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (140, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-24 22:44:53', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (141, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-24 23:32:15', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (142, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-25 00:19:15', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (143, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-25 00:21:08', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (144, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-25 00:24:44', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (145, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-25 00:31:51', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (146, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-25 00:43:45', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (147, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-26 04:23:26', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (148, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-26 04:27:05', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (149, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-27 04:09:13', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (150, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-27 04:14:16', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (151, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-27 04:16:06', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (152, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-29 15:32:46', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (153, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-29 15:43:51', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (154, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-29 15:46:16', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (155, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-29 15:48:48', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (156, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-29 15:51:02', 'Chrome 10 -- Windows 10');
INSERT INTO `tb_login_log` VALUES (157, 'cloudleo', '127.0.0.1', '内网IP|0|0|内网IP|内网IP', '2022-04-29 16:10:41', 'Chrome 10 -- Windows 10');

-- ----------------------------
-- Table structure for tb_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE `tb_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_tag
-- ----------------------------
INSERT INTO `tb_tag` VALUES (5, '随笔');
INSERT INTO `tb_tag` VALUES (6, '文章');
INSERT INTO `tb_tag` VALUES (7, '复盘');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `des` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, 'cloudleo', '21b6f7af61ede50010212494bccc2338', '/img/avatar/default.png', 'bestshay.gg@gmail.com', '多决策 少执着', '2020-06-27 16:55:05');

SET FOREIGN_KEY_CHECKS = 1;
