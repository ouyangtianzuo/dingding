-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2018-12-15 19:17:20
-- 服务器版本： 5.7.24-0ubuntu0.18.10.1
-- PHP 版本： 7.2.10-0ubuntu1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `manhour`
--

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

CREATE TABLE `config` (
  `config_id` int(11) UNSIGNED NOT NULL COMMENT '主键',
  `ctitle` char(255) NOT NULL COMMENT '配置标题',
  `cname` char(255) NOT NULL COMMENT '名称',
  `cvalue` char(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `description` char(255) NOT NULL DEFAULT '' COMMENT '配置描述',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0失效、1有效、2删除',
  `valid` tinyint(1) DEFAULT '1',
  `created_by` int(11) UNSIGNED NOT NULL COMMENT '类型创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_by` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '类型修改人',
  `modified_time` datetime DEFAULT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统配置表';

--
-- 转存表中的数据 `config`
--

INSERT INTO `config` (`config_id`, `ctitle`, `cname`, `cvalue`, `description`, `status`, `valid`, `created_by`, `created_time`, `modified_by`, `modified_time`) VALUES
(1, '排他登录', 'is_unique_login', '1', '1是、0否。即同一时间账号只能在一个地方登录。不允许账号在其他地方登录。', 1, 1, 1, '2018-07-19 14:27:46', 1, '2018-07-19 14:27:46'),
(2, '网站名称', 'site_name', 'PHP 解说', '', 1, 1, 1, '2018-07-19 10:46:49', 1, '2018-07-19 10:46:49'),
(3, 'PC登录超时时间(分钟)', 'pc_logout_time', '60000', '登录超时时间。距离上次最后操作时间大于当前指定时间分钟内将登录超时并退出登录', 1, 1, 1, '2018-07-19 10:46:54', 1, '2018-07-19 10:46:54'),
(9, '后台登录超时时间(分钟)', 'admin_logout_time', '60', '超时则需要重新登录', 1, 1, 1, '2018-07-19 10:46:46', 1, '2018-07-19 10:46:46');

-- --------------------------------------------------------

--
-- 表的结构 `error_log`
--

CREATE TABLE `error_log` (
  `log_id` int(11) UNSIGNED NOT NULL COMMENT '主键',
  `log_time` datetime DEFAULT NULL COMMENT '日志产生时间',
  `errcode` int(11) NOT NULL DEFAULT '0' COMMENT '错误编号',
  `content` text NOT NULL COMMENT '日志内容',
  `modified_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL COMMENT '日志创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志表';

--
-- 转存表中的数据 `error_log`
--

INSERT INTO `error_log` (`log_id`, `log_time`, `errcode`, `content`, `modified_time`, `created_time`) VALUES
(1, '2018-09-05 00:00:00', 901, 'ErrorTime:2018-09-05 14:33:12\nErrorCode:901\nErrorLog:Error Message: 登录超时,请重新登录 \nError Code: [901] \nClass Name and Method: common\\controllers\\Admin->init\nMethod Params:\nArray\n(\n)\n\nStack trace:\n#0 /data/wwwroot/www.phpjieshuo.com/library/common/controllers/Admin.php(74): common\\YCore::exception(901, \'\\xE7\\x99\\xBB\\xE5\\xBD\\x95\\xE8\\xB6\\x85\\xE6\\x97\\xB6,\\xE8\\xAF...\')\n#1 [internal function]: common\\controllers\\Admin->init()\n#2 /data/wwwroot/www.phpjieshuo.com/public/index.php(17): Yaf_Application->run()\n#3 {main}\nRequest IP:116.24.66.87\nRequest Url:http://www.phpjieshuo.com/Backend/Index/leftMenu?menu_id=3000\n\n', '2018-09-05 14:33:12', '2018-09-05 14:33:12'),
(2, '2018-09-05 00:00:00', 901, 'ErrorTime:2018-09-05 14:33:12\nErrorCode:901\nErrorLog:Error Message: 登录超时,请重新登录 \nError Code: [901] \nClass Name and Method: common\\controllers\\Admin->init\nMethod Params:\nArray\n(\n)\n\nStack trace:\n#0 /data/wwwroot/www.phpjieshuo.com/library/common/controllers/Admin.php(74): common\\YCore::exception(901, \'\\xE7\\x99\\xBB\\xE5\\xBD\\x95\\xE8\\xB6\\x85\\xE6\\x97\\xB6,\\xE8\\xAF...\')\n#1 [internal function]: common\\controllers\\Admin->init()\n#2 /data/wwwroot/www.phpjieshuo.com/public/index.php(17): Yaf_Application->run()\n#3 {main}\nRequest IP:116.24.66.87\nRequest Url:http://www.phpjieshuo.com/Backend/Index/arrow?menu_id=3000\n\n', '2018-09-05 14:33:12', '2018-09-05 14:33:12'),
(3, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:40:48\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/js/jquery-1.10.2.js\n\n', '2018-12-12 23:40:48', '2018-12-12 23:40:48'),
(4, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:40:48\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/aiwrap.png\n\n', '2018-12-12 23:40:48', '2018-12-12 23:40:48'),
(5, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:40:48\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/img/favicon.ico\n\n', '2018-12-12 23:40:48', '2018-12-12 23:40:48'),
(6, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:40:50\nErrorCode:500\nErrorLog:RedisException: Connection refused in /home/ssj/manhour/library/finger/cache/redis/Cache.php:55\nStack trace:\n#0 /home/ssj/manhour/library/finger/cache/redis/Cache.php(55): Redis->connect(\'127.0.0.1\', \'6379\')\n#1 /home/ssj/manhour/library/finger/cache/redis/Cache.php(27): finger\\cache\\redis\\Cache->connect()\n#2 /home/ssj/manhour/library/common/YCore.php(237): finger\\cache\\redis\\Cache->__construct()\n#3 /home/ssj/manhour/library/services/UserService.php(553): common\\YCore::getCache()\n#4 /home/ssj/manhour/library/services/UserService.php(161): services\\UserService::setAuthTokenLastAccessTime(1, \'df84UghWAlZTBVQ...\', \'2018-12-12 23:4...\', 1, \'2018-12-12 23:4...\')\n#5 /home/ssj/manhour/apps/controllers/Public.php(34): services\\UserService::login(\'admin\', \'123456\')\n#6 [internal function]: PublicController->loginAction()\n#7 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#8 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Public/login\n\n', '2018-12-12 23:40:50', '2018-12-12 23:40:50'),
(7, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:40:50\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-12 23:40:50', '2018-12-12 23:40:50'),
(8, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:40:50\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-12 23:40:50', '2018-12-12 23:40:50'),
(9, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:41:10\nErrorCode:500\nErrorLog:RedisException: Connection refused in /home/ssj/manhour/library/finger/cache/redis/Cache.php:55\nStack trace:\n#0 /home/ssj/manhour/library/finger/cache/redis/Cache.php(55): Redis->connect(\'127.0.0.1\', \'6379\')\n#1 /home/ssj/manhour/library/finger/cache/redis/Cache.php(27): finger\\cache\\redis\\Cache->connect()\n#2 /home/ssj/manhour/library/common/YCore.php(237): finger\\cache\\redis\\Cache->__construct()\n#3 /home/ssj/manhour/library/services/UserService.php(553): common\\YCore::getCache()\n#4 /home/ssj/manhour/library/services/UserService.php(161): services\\UserService::setAuthTokenLastAccessTime(1, \'2715BFEFUVJRVVI...\', \'2018-12-12 23:4...\', 1, \'2018-12-12 23:4...\')\n#5 /home/ssj/manhour/apps/controllers/Public.php(34): services\\UserService::login(\'admin\', \'123456\')\n#6 [internal function]: PublicController->loginAction()\n#7 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#8 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Public/login\n\n', '2018-12-12 23:41:10', '2018-12-12 23:41:10'),
(10, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:41:10\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-12 23:41:10', '2018-12-12 23:41:10'),
(11, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:41:10\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-12 23:41:10', '2018-12-12 23:41:10'),
(12, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:42:47\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/js/jquery-1.10.2.js\n\n', '2018-12-12 23:42:47', '2018-12-12 23:42:47'),
(13, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:42:47\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/aiwrap.png\n\n', '2018-12-12 23:42:47', '2018-12-12 23:42:47'),
(14, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:42:47\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/img/favicon.ico\n\n', '2018-12-12 23:42:47', '2018-12-12 23:42:47'),
(15, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:42:49\nErrorCode:500\nErrorLog:PDOException: SQLSTATE[42S02]: Base table or view not found: 1146 Table \'manhour.config\' doesn\'t exist in /home/ssj/manhour/library/finger/DbBase.php:300\nStack trace:\n#0 /home/ssj/manhour/library/finger/DbBase.php(300): PDO->prepare(\'SELECT `cname`,...\')\n#1 /home/ssj/manhour/library/models/AbstractBase.php(110): finger\\DbBase->fetchAll(Array, Array, 0, \'ORDER BY  confi...\', \'\')\n#2 /home/ssj/manhour/library/services/ConfigService.php(39): models\\AbstractBase->fetchAll(Array, Array, 0, \' config_id ASC \')\n#3 /home/ssj/manhour/library/common/YCore.php(393): services\\ConfigService::getAllConfig()\n#4 /home/ssj/manhour/library/services/UserService.php(556): common\\YCore::config(\'pc_logout_time\')\n#5 /home/ssj/manhour/library/services/UserService.php(161): services\\UserService::setAuthTokenLastAccessTime(1, \'461bCAEFVFVRBgY...\', \'2018-12-12 23:4...\', 1, \'2018-12-12 23:4...\')\n#6 /home/ssj/manhour/apps/controllers/Public.php(34): services\\UserService::login(\'admin\', \'123456\')\n#7 [internal function]: PublicController->loginAction()\n#8 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#9 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Public/login\n\n', '2018-12-12 23:42:49', '2018-12-12 23:42:49'),
(16, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:42:50\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-12 23:42:50', '2018-12-12 23:42:50'),
(17, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:42:50\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-12 23:42:50', '2018-12-12 23:42:50'),
(18, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:43:00\nErrorCode:500\nErrorLog:PDOException: SQLSTATE[42S02]: Base table or view not found: 1146 Table \'manhour.config\' doesn\'t exist in /home/ssj/manhour/library/finger/DbBase.php:300\nStack trace:\n#0 /home/ssj/manhour/library/finger/DbBase.php(300): PDO->prepare(\'SELECT `cname`,...\')\n#1 /home/ssj/manhour/library/models/AbstractBase.php(110): finger\\DbBase->fetchAll(Array, Array, 0, \'ORDER BY  confi...\', \'\')\n#2 /home/ssj/manhour/library/services/ConfigService.php(39): models\\AbstractBase->fetchAll(Array, Array, 0, \' config_id ASC \')\n#3 /home/ssj/manhour/library/common/YCore.php(393): services\\ConfigService::getAllConfig()\n#4 /home/ssj/manhour/library/services/UserService.php(556): common\\YCore::config(\'pc_logout_time\')\n#5 /home/ssj/manhour/library/services/UserService.php(161): services\\UserService::setAuthTokenLastAccessTime(1, \'0e3cCQQBB1MCVQM...\', \'2018-12-12 23:4...\', 1, \'2018-12-12 23:4...\')\n#6 /home/ssj/manhour/apps/controllers/Public.php(34): services\\UserService::login(\'admin\', \'123456\')\n#7 [internal function]: PublicController->loginAction()\n#8 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#9 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Public/login\n\n', '2018-12-12 23:43:00', '2018-12-12 23:43:00'),
(19, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:43:00\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-12 23:43:00', '2018-12-12 23:43:00'),
(20, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:43:00\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-12 23:43:00', '2018-12-12 23:43:00'),
(21, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:46:02\nErrorCode:500\nErrorLog:PDOException: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'valid\' in \'where clause\' in /home/ssj/manhour/library/finger/DbBase.php:300\nStack trace:\n#0 /home/ssj/manhour/library/finger/DbBase.php(300): PDO->prepare(\'SELECT `cname`,...\')\n#1 /home/ssj/manhour/library/models/AbstractBase.php(110): finger\\DbBase->fetchAll(Array, Array, 0, \'ORDER BY  confi...\', \'\')\n#2 /home/ssj/manhour/library/services/ConfigService.php(39): models\\AbstractBase->fetchAll(Array, Array, 0, \' config_id ASC \')\n#3 /home/ssj/manhour/library/common/YCore.php(393): services\\ConfigService::getAllConfig()\n#4 /home/ssj/manhour/library/services/UserService.php(556): common\\YCore::config(\'pc_logout_time\')\n#5 /home/ssj/manhour/library/services/UserService.php(161): services\\UserService::setAuthTokenLastAccessTime(1, \'b6b0CFZRVQQHCAV...\', \'2018-12-12 23:4...\', 1, \'2018-12-12 23:4...\')\n#6 /home/ssj/manhour/apps/controllers/Public.php(34): services\\UserService::login(\'admin\', \'123456\')\n#7 [internal function]: PublicController->loginAction()\n#8 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#9 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Public/login\n\n', '2018-12-12 23:46:02', '2018-12-12 23:46:02'),
(22, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:46:03\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-12 23:46:03', '2018-12-12 23:46:03'),
(23, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:46:03\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-12 23:46:03', '2018-12-12 23:46:03'),
(24, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:46:11\nErrorCode:500\nErrorLog:PDOException: SQLSTATE[42S22]: Column not found: 1054 Unknown column \'valid\' in \'where clause\' in /home/ssj/manhour/library/finger/DbBase.php:300\nStack trace:\n#0 /home/ssj/manhour/library/finger/DbBase.php(300): PDO->prepare(\'SELECT `cname`,...\')\n#1 /home/ssj/manhour/library/models/AbstractBase.php(110): finger\\DbBase->fetchAll(Array, Array, 0, \'ORDER BY  confi...\', \'\')\n#2 /home/ssj/manhour/library/services/ConfigService.php(39): models\\AbstractBase->fetchAll(Array, Array, 0, \' config_id ASC \')\n#3 /home/ssj/manhour/library/common/YCore.php(393): services\\ConfigService::getAllConfig()\n#4 /home/ssj/manhour/library/services/UserService.php(556): common\\YCore::config(\'pc_logout_time\')\n#5 /home/ssj/manhour/library/services/UserService.php(161): services\\UserService::setAuthTokenLastAccessTime(1, \'c9aaAVQBCQdRVgF...\', \'2018-12-12 23:4...\', 1, \'2018-12-12 23:4...\')\n#6 /home/ssj/manhour/apps/controllers/Public.php(34): services\\UserService::login(\'admin\', \'123456\')\n#7 [internal function]: PublicController->loginAction()\n#8 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#9 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Public/login\n\n', '2018-12-12 23:46:11', '2018-12-12 23:46:11'),
(25, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:46:11\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-12 23:46:11', '2018-12-12 23:46:11'),
(26, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:46:11\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-12 23:46:11', '2018-12-12 23:46:11'),
(27, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:46:52\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-12 23:46:52', '2018-12-12 23:46:52'),
(28, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:46:52\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-12 23:46:52', '2018-12-12 23:46:52'),
(29, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:46:53\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Action: There is no method favicon.icoAction in IndexController in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Index/favicon.ico\n\n', '2018-12-12 23:46:53', '2018-12-12 23:46:53'),
(30, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:47:06\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Action: There is no method favicon.icoAction in IndexController in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Index/favicon.ico\n\n', '2018-12-12 23:47:06', '2018-12-12 23:47:06'),
(31, '2018-12-12 00:00:00', 500, 'ErrorTime:2018-12-12 23:47:07\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Action: There is no method favicon.icoAction in IndexController in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Index/favicon.ico\n\n', '2018-12-12 23:47:07', '2018-12-12 23:47:07'),
(32, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:38:09\nErrorCode:500\nErrorLog:RedisException: MISCONF Redis is configured to save RDB snapshots, but it is currently not able to persist on disk. Commands that may modify the data set are disabled, because this instance is configured to report errors during writes if RDB snapshotting fails (stop-writes-on-bgsave-error option). Please check the Redis logs for details about the RDB error. in /home/ssj/manhour/library/finger/cache/redis/Cache.php:91\nStack trace:\n#0 /home/ssj/manhour/library/finger/cache/redis/Cache.php(91): Redis->setex(\'user_token_key_...\', 3600000, \'\"ddbaBFYAAAEHAl...\')\n#1 /home/ssj/manhour/library/services/UserService.php(566): finger\\cache\\redis\\Cache->set(\'user_token_key_...\', \'ddbaBFYAAAEHAlI...\', 3600000)\n#2 /home/ssj/manhour/library/services/UserService.php(161): services\\UserService::setAuthTokenLastAccessTime(1, \'ddbaBFYAAAEHAlI...\', \'2018-12-13 22:3...\', 1, \'2018-12-13 22:3...\')\n#3 /home/ssj/manhour/apps/controllers/Public.php(34): services\\UserService::login(\'admin\', \'123456\')\n#4 [internal function]: PublicController->loginAction()\n#5 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#6 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Public/login\n\n', '2018-12-13 22:38:09', '2018-12-13 22:38:09'),
(33, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:38:10\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-13 22:38:10', '2018-12-13 22:38:10'),
(34, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:38:10\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-13 22:38:10', '2018-12-13 22:38:10'),
(35, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:38:13\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/js/jquery-1.10.2.js\n\n', '2018-12-13 22:38:13', '2018-12-13 22:38:13'),
(36, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:38:13\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/aiwrap.png\n\n', '2018-12-13 22:38:13', '2018-12-13 22:38:13'),
(37, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:38:13\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/img/favicon.ico\n\n', '2018-12-13 22:38:13', '2018-12-13 22:38:13'),
(38, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:38:14\nErrorCode:500\nErrorLog:RedisException: MISCONF Redis is configured to save RDB snapshots, but it is currently not able to persist on disk. Commands that may modify the data set are disabled, because this instance is configured to report errors during writes if RDB snapshotting fails (stop-writes-on-bgsave-error option). Please check the Redis logs for details about the RDB error. in /home/ssj/manhour/library/finger/cache/redis/Cache.php:91\nStack trace:\n#0 /home/ssj/manhour/library/finger/cache/redis/Cache.php(91): Redis->setex(\'user_token_key_...\', 3600000, \'\"6319BFYHAwcDCQ...\')\n#1 /home/ssj/manhour/library/services/UserService.php(566): finger\\cache\\redis\\Cache->set(\'user_token_key_...\', \'6319BFYHAwcDCQY...\', 3600000)\n#2 /home/ssj/manhour/library/services/UserService.php(161): services\\UserService::setAuthTokenLastAccessTime(1, \'6319BFYHAwcDCQY...\', \'2018-12-13 22:3...\', 1, \'2018-12-13 22:3...\')\n#3 /home/ssj/manhour/apps/controllers/Public.php(34): services\\UserService::login(\'admin\', \'123456\')\n#4 [internal function]: PublicController->loginAction()\n#5 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#6 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Public/login\n\n', '2018-12-13 22:38:14', '2018-12-13 22:38:14'),
(39, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:38:14\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-13 22:38:14', '2018-12-13 22:38:14'),
(40, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:38:14\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-13 22:38:14', '2018-12-13 22:38:14'),
(41, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:42:08\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/js/jquery-1.10.2.js\n\n', '2018-12-13 22:42:08', '2018-12-13 22:42:08'),
(42, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:42:08\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/aiwrap.png\n\n', '2018-12-13 22:42:08', '2018-12-13 22:42:08'),
(43, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:42:08\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/img/favicon.ico\n\n', '2018-12-13 22:42:08', '2018-12-13 22:42:08'),
(44, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:42:10\nErrorCode:500\nErrorLog:RedisException: MISCONF Redis is configured to save RDB snapshots, but it is currently not able to persist on disk. Commands that may modify the data set are disabled, because this instance is configured to report errors during writes if RDB snapshotting fails (stop-writes-on-bgsave-error option). Please check the Redis logs for details about the RDB error. in /home/ssj/manhour/library/finger/cache/redis/Cache.php:91\nStack trace:\n#0 /home/ssj/manhour/library/finger/cache/redis/Cache.php(91): Redis->setex(\'user_token_key_...\', 3600000, \'\"5fddBAcIBghSB1...\')\n#1 /home/ssj/manhour/library/services/UserService.php(566): finger\\cache\\redis\\Cache->set(\'user_token_key_...\', \'5fddBAcIBghSB1E...\', 3600000)\n#2 /home/ssj/manhour/library/services/UserService.php(161): services\\UserService::setAuthTokenLastAccessTime(1, \'5fddBAcIBghSB1E...\', \'2018-12-13 22:4...\', 1, \'2018-12-13 22:4...\')\n#3 /home/ssj/manhour/apps/controllers/Public.php(34): services\\UserService::login(\'admin\', \'123456\')\n#4 [internal function]: PublicController->loginAction()\n#5 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#6 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Public/login\n\n', '2018-12-13 22:42:10', '2018-12-13 22:42:10'),
(45, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:42:10\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-13 22:42:10', '2018-12-13 22:42:10'),
(46, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:42:10\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-13 22:42:10', '2018-12-13 22:42:10'),
(47, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:42:12\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/img/favicon.ico\n\n', '2018-12-13 22:42:12', '2018-12-13 22:42:12'),
(48, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:44:56\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/js/jquery-1.10.2.js\n\n', '2018-12-13 22:44:56', '2018-12-13 22:44:56'),
(49, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:44:56\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/aiwrap.png\n\n', '2018-12-13 22:44:56', '2018-12-13 22:44:56'),
(50, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:44:56\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/img/favicon.ico\n\n', '2018-12-13 22:44:56', '2018-12-13 22:44:56'),
(51, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:49:31\nErrorCode:500\nErrorLog:RedisException: MISCONF Redis is configured to save RDB snapshots, but it is currently not able to persist on disk. Commands that may modify the data set are disabled, because this instance is configured to report errors during writes if RDB snapshotting fails (stop-writes-on-bgsave-error option). Please check the Redis logs for details about the RDB error. in /home/ssj/manhour/library/finger/cache/redis/Cache.php:91\nStack trace:\n#0 /home/ssj/manhour/library/finger/cache/redis/Cache.php(91): Redis->setex(\'user_token_key_...\', 3600000, \'\"a87cVANRAAhSCQ...\')\n#1 /home/ssj/manhour/library/services/UserService.php(566): finger\\cache\\redis\\Cache->set(\'user_token_key_...\', \'a87cVANRAAhSCQZ...\', 3600000)\n#2 /home/ssj/manhour/library/services/UserService.php(161): services\\UserService::setAuthTokenLastAccessTime(1, \'a87cVANRAAhSCQZ...\', \'2018-12-13 22:4...\', 1, \'2018-12-13 22:4...\')\n#3 /home/ssj/manhour/apps/controllers/Public.php(34): services\\UserService::login(\'admin\', \'123456\')\n#4 [internal function]: PublicController->loginAction()\n#5 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#6 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Public/login\n\n', '2018-12-13 22:49:31', '2018-12-13 22:49:31'),
(52, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:49:32\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-13 22:49:32', '2018-12-13 22:49:32'),
(53, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 22:49:32\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-13 22:49:32', '2018-12-13 22:49:32'),
(54, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:09:27\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/js/jquery-1.10.2.js\n\n', '2018-12-13 23:09:27', '2018-12-13 23:09:27'),
(55, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:09:27\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/aiwrap.png\n\n', '2018-12-13 23:09:27', '2018-12-13 23:09:27'),
(56, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:09:27\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/img/favicon.ico\n\n', '2018-12-13 23:09:27', '2018-12-13 23:09:27'),
(57, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:09:29\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-13 23:09:29', '2018-12-13 23:09:29'),
(58, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:09:29\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-13 23:09:29', '2018-12-13 23:09:29'),
(59, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:09:31\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Action: There is no method favicon.icoAction in IndexController in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Index/favicon.ico\n\n', '2018-12-13 23:09:31', '2018-12-13 23:09:31'),
(60, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:20\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/js/jquery-1.10.2.js\n\n', '2018-12-13 23:12:20', '2018-12-13 23:12:20'),
(61, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:21\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/aiwrap.png\n\n', '2018-12-13 23:12:21', '2018-12-13 23:12:21'),
(62, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:21\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/img/favicon.ico\n\n', '2018-12-13 23:12:21', '2018-12-13 23:12:21'),
(63, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:22\nErrorCode:500\nErrorLog:RedisException: Connection refused in /home/ssj/manhour/library/finger/cache/redis/Cache.php:55\nStack trace:\n#0 /home/ssj/manhour/library/finger/cache/redis/Cache.php(55): Redis->connect(\'127.0.0.1\', \'6379\')\n#1 /home/ssj/manhour/library/finger/cache/redis/Cache.php(27): finger\\cache\\redis\\Cache->connect()\n#2 /home/ssj/manhour/library/common/YCore.php(237): finger\\cache\\redis\\Cache->__construct()\n#3 /home/ssj/manhour/library/services/UserService.php(553): common\\YCore::getCache()\n#4 /home/ssj/manhour/library/services/UserService.php(161): services\\UserService::setAuthTokenLastAccessTime(1, \'96f6VQJUBQIJUgE...\', \'2018-12-13 23:1...\', 1, \'2018-12-13 23:1...\')\n#5 /home/ssj/manhour/apps/controllers/Public.php(34): services\\UserService::login(\'admin\', \'123456\')\n#6 [internal function]: PublicController->loginAction()\n#7 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#8 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Public/login\n\n', '2018-12-13 23:12:22', '2018-12-13 23:12:22'),
(64, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:22\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-13 23:12:22', '2018-12-13 23:12:22'),
(65, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:22\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-13 23:12:22', '2018-12-13 23:12:22'),
(66, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:30\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/js/jquery-1.10.2.js\n\n', '2018-12-13 23:12:30', '2018-12-13 23:12:30'),
(67, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:30\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/aiwrap.png\n\n', '2018-12-13 23:12:30', '2018-12-13 23:12:30'),
(68, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:30\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/img/favicon.ico\n\n', '2018-12-13 23:12:30', '2018-12-13 23:12:30'),
(69, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:32\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-13 23:12:32', '2018-12-13 23:12:32'),
(70, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:32\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-13 23:12:32', '2018-12-13 23:12:32'),
(71, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:33\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Action: There is no method favicon.icoAction in IndexController in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Index/favicon.ico\n\n', '2018-12-13 23:12:33', '2018-12-13 23:12:33'),
(72, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:39\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Action: There is no method viewAction in manhourController in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Manhour/View\n\n', '2018-12-13 23:12:39', '2018-12-13 23:12:39'),
(73, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:39\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-13 23:12:39', '2018-12-13 23:12:39'),
(74, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:39\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-13 23:12:39', '2018-12-13 23:12:39'),
(75, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:40\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Action: There is no method manhourAction in IndexController in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Index/Manhour/Audit\n\n', '2018-12-13 23:12:40', '2018-12-13 23:12:40'),
(76, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:40\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-13 23:12:40', '2018-12-13 23:12:40'),
(77, '2018-12-13 00:00:00', 500, 'ErrorTime:2018-12-13 23:12:40\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-13 23:12:40', '2018-12-13 23:12:40'),
(78, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 00:13:32\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/js/jquery-1.10.2.js\n\n', '2018-12-15 00:13:32', '2018-12-15 00:13:32'),
(79, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 00:13:32\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/aiwrap.png\n\n', '2018-12-15 00:13:32', '2018-12-15 00:13:32'),
(80, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 00:13:34\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/js/jquery-1.10.2.js\n\n', '2018-12-15 00:13:34', '2018-12-15 00:13:34'),
(81, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 00:13:34\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/aiwrap.png\n\n', '2018-12-15 00:13:34', '2018-12-15 00:13:34'),
(82, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 00:13:34\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/img/favicon.ico\n\n', '2018-12-15 00:13:34', '2018-12-15 00:13:34');
INSERT INTO `error_log` (`log_id`, `log_time`, `errcode`, `content`, `modified_time`, `created_time`) VALUES
(83, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 00:13:35\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-15 00:13:35', '2018-12-15 00:13:35'),
(84, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 00:13:35\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-15 00:13:35', '2018-12-15 00:13:35'),
(85, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 00:13:36\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/img/favicon.ico\n\n', '2018-12-15 00:13:36', '2018-12-15 00:13:36'),
(86, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 00:13:39\nErrorCode:500\nErrorLog:RedisException: MISCONF Redis is configured to save RDB snapshots, but it is currently not able to persist on disk. Commands that may modify the data set are disabled, because this instance is configured to report errors during writes if RDB snapshotting fails (stop-writes-on-bgsave-error option). Please check the Redis logs for details about the RDB error. in /home/ssj/manhour/library/finger/cache/redis/Cache.php:91\nStack trace:\n#0 /home/ssj/manhour/library/finger/cache/redis/Cache.php(91): Redis->setex(\'user_token_key_...\', 3600000, \'\"a800BVVWAgEDAl...\')\n#1 /home/ssj/manhour/library/services/UserService.php(566): finger\\cache\\redis\\Cache->set(\'user_token_key_...\', \'a800BVVWAgEDAlY...\', 3600000)\n#2 /home/ssj/manhour/library/services/UserService.php(161): services\\UserService::setAuthTokenLastAccessTime(1, \'a800BVVWAgEDAlY...\', \'2018-12-15 00:1...\', 1, \'2018-12-15 00:1...\')\n#3 /home/ssj/manhour/apps/controllers/Public.php(34): services\\UserService::login(\'admin\', \'123456\')\n#4 [internal function]: PublicController->loginAction()\n#5 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#6 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Public/login\n\n', '2018-12-15 00:13:39', '2018-12-15 00:13:39'),
(87, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 00:13:39\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-15 00:13:39', '2018-12-15 00:13:39'),
(88, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 00:13:39\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-15 00:13:39', '2018-12-15 00:13:39'),
(89, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 00:13:41\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/img/favicon.ico\n\n', '2018-12-15 00:13:41', '2018-12-15 00:13:41'),
(90, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 10:39:20\nErrorCode:500\nErrorLog:RedisException: MISCONF Redis is configured to save RDB snapshots, but it is currently not able to persist on disk. Commands that may modify the data set are disabled, because this instance is configured to report errors during writes if RDB snapshotting fails (stop-writes-on-bgsave-error option). Please check the Redis logs for details about the RDB error. in /home/ssj/manhour/library/finger/cache/redis/Cache.php:91\nStack trace:\n#0 /home/ssj/manhour/library/finger/cache/redis/Cache.php(91): Redis->setex(\'user_token_key_...\', 3600000, \'\"e5afCVQABFMGCA...\')\n#1 /home/ssj/manhour/library/services/UserService.php(566): finger\\cache\\redis\\Cache->set(\'user_token_key_...\', \'e5afCVQABFMGCAk...\', 3600000)\n#2 /home/ssj/manhour/library/services/UserService.php(161): services\\UserService::setAuthTokenLastAccessTime(1, \'e5afCVQABFMGCAk...\', \'2018-12-15 10:3...\', 1, \'2018-12-15 10:3...\')\n#3 /home/ssj/manhour/apps/controllers/Public.php(34): services\\UserService::login(\'admin\', \'123456\')\n#4 [internal function]: PublicController->loginAction()\n#5 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#6 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Public/login\n\n', '2018-12-15 10:39:20', '2018-12-15 10:39:20'),
(91, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 10:39:20\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-15 10:39:20', '2018-12-15 10:39:20'),
(92, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 10:39:20\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-15 10:39:20', '2018-12-15 10:39:20'),
(93, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 13:48:34\nErrorCode:500\nErrorLog:RedisException: MISCONF Redis is configured to save RDB snapshots, but it is currently not able to persist on disk. Commands that may modify the data set are disabled, because this instance is configured to report errors during writes if RDB snapshotting fails (stop-writes-on-bgsave-error option). Please check the Redis logs for details about the RDB error. in /home/ssj/manhour/library/finger/cache/redis/Cache.php:91\nStack trace:\n#0 /home/ssj/manhour/library/finger/cache/redis/Cache.php(91): Redis->setex(\'user_token_key_...\', 3600000, \'\"1912VQIDU1ZWBg...\')\n#1 /home/ssj/manhour/library/services/UserService.php(566): finger\\cache\\redis\\Cache->set(\'user_token_key_...\', \'1912VQIDU1ZWBgJ...\', 3600000)\n#2 /home/ssj/manhour/library/services/UserService.php(161): services\\UserService::setAuthTokenLastAccessTime(1, \'1912VQIDU1ZWBgJ...\', \'2018-12-15 13:4...\', 1, \'2018-12-15 13:4...\')\n#3 /home/ssj/manhour/apps/controllers/Public.php(34): services\\UserService::login(\'admin\', \'123456\')\n#4 [internal function]: PublicController->loginAction()\n#5 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#6 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Public/login\n\n', '2018-12-15 13:48:34', '2018-12-15 13:48:34'),
(94, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 13:48:34\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-15 13:48:34', '2018-12-15 13:48:34'),
(95, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 13:48:34\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-15 13:48:34', '2018-12-15 13:48:34'),
(96, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 16:55:53\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Phpmyadmin.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/phpmyadmin/index.php\n\n', '2018-12-15 16:55:53', '2018-12-15 16:55:53'),
(97, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 16:55:53\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-15 16:55:53', '2018-12-15 16:55:53'),
(98, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 16:55:53\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-15 16:55:53', '2018-12-15 16:55:53'),
(99, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 17:15:05\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/js/jquery-1.10.2.js\n\n', '2018-12-15 17:15:05', '2018-12-15 17:15:05'),
(100, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 17:15:05\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/aiwrap.png\n\n', '2018-12-15 17:15:05', '2018-12-15 17:15:05'),
(101, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 17:15:06\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/img/favicon.ico\n\n', '2018-12-15 17:15:06', '2018-12-15 17:15:06'),
(102, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 17:15:08\nErrorCode:500\nErrorLog:RedisException: Connection refused in /home/ssj/manhour/library/finger/cache/redis/Cache.php:55\nStack trace:\n#0 /home/ssj/manhour/library/finger/cache/redis/Cache.php(55): Redis->connect(\'127.0.0.1\', \'6379\')\n#1 /home/ssj/manhour/library/finger/cache/redis/Cache.php(27): finger\\cache\\redis\\Cache->connect()\n#2 /home/ssj/manhour/library/common/YCore.php(237): finger\\cache\\redis\\Cache->__construct()\n#3 /home/ssj/manhour/library/services/UserService.php(553): common\\YCore::getCache()\n#4 /home/ssj/manhour/library/services/UserService.php(161): services\\UserService::setAuthTokenLastAccessTime(1, \'2e9fUgMFBlZRBVQ...\', \'2018-12-15 17:1...\', 1, \'2018-12-15 17:1...\')\n#5 /home/ssj/manhour/apps/controllers/Public.php(34): services\\UserService::login(\'admin\', \'123456\')\n#6 [internal function]: PublicController->loginAction()\n#7 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#8 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/Index/Public/login\n\n', '2018-12-15 17:15:08', '2018-12-15 17:15:08'),
(103, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 17:15:08\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-15 17:15:08', '2018-12-15 17:15:08'),
(104, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 17:15:08\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-15 17:15:08', '2018-12-15 17:15:08'),
(105, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 19:17:06\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Phpmyadmin.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/phpmyadmin/index.php\n\n', '2018-12-15 19:17:06', '2018-12-15 19:17:06'),
(106, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 19:17:06\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg.png\n\n', '2018-12-15 19:17:06', '2018-12-15 19:17:06'),
(107, '2018-12-15 00:00:00', 500, 'ErrorTime:2018-12-15 19:17:06\nErrorCode:500\nErrorLog:Yaf_Exception_LoadFailed_Controller: Failed opening controller script /home/ssj/manhour/apps/controllers/Statics.php: No such file or directory in /home/ssj/manhour/public/index.php:17\nStack trace:\n#0 /home/ssj/manhour/public/index.php(17): Yaf_Application->run()\n#1 {main}\nRequest IP:127.0.0.1\nRequest Url:http://127.0.0.1/statics/images/backend/msg_bg.png\n\n', '2018-12-15 19:17:06', '2018-12-15 19:17:06');

-- --------------------------------------------------------

--
-- 表的结构 `project_data`
--

CREATE TABLE `project_data` (
  `project_id` int(11) NOT NULL COMMENT '项目id',
  `project_name` char(20) NOT NULL COMMENT '项目名称',
  `project_status` enum('结束','进行','挂起','') NOT NULL COMMENT '项目状态',
  `project_nickname` char(20) NOT NULL COMMENT '项目标识',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据有效性',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `username` char(20) NOT NULL COMMENT '账号',
  `password` char(32) NOT NULL COMMENT '密码',
  `salt` char(6) NOT NULL COMMENT '密码盐',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据有效性',
  `created_time` datetime NOT NULL COMMENT '注册时间/创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `salt`, `last_login_time`, `valid`, `created_time`, `modified_time`) VALUES
(1, 'admin', '2631683499fe00b07306cd34ed091056', 'ZlH4Ea', '0000-00-00 00:00:00', 1, '2018-10-06 18:33:41', '0000-00-00 00:00:00'),
(2, 'guest', '61e928ecabc6f451bbc9969ea84d6dd5', 'sHCbaY', '0000-00-00 00:00:00', 1, '2018-10-06 18:03:48', '0000-00-00 00:00:00'),
(4, 'zongsjs', 'b79374993ad5e28c2a35c615aba4fa9c', 'mw8jV8', '0000-00-00 00:00:00', 1, '2018-10-07 10:20:20', '2018-10-07 10:20:20'),
(5, 'user', '9703935336a4ffcd0c613a32751812b2', 'bKuVfC', '0000-00-00 00:00:00', 1, '2018-10-07 10:21:08', '2018-10-07 10:21:08');

-- --------------------------------------------------------

--
-- 表的结构 `user_blacklist`
--

CREATE TABLE `user_blacklist` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '主键',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户ID',
  `username` char(20) NOT NULL COMMENT '账号',
  `ban_type` smallint(1) NOT NULL COMMENT '禁用类型：1永久封禁、2临时封禁',
  `ban_start_time` datetime DEFAULT NULL COMMENT '封禁开始时间',
  `ban_end_time` datetime DEFAULT NULL COMMENT '封禁截止时间',
  `ban_reason` char(255) NOT NULL DEFAULT '' COMMENT '账号封禁原因',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '记录状态：0失效、1生效',
  `created_by` int(11) UNSIGNED NOT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_by` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '修改人',
  `modified_time` datetime DEFAULT NULL COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据有效性'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户黑名单表';

-- --------------------------------------------------------

--
-- 表的结构 `user_data`
--

CREATE TABLE `user_data` (
  `id` int(11) NOT NULL COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `department` int(2) NOT NULL COMMENT '科室',
  `workgroup` int(1) NOT NULL COMMENT '组别',
  `realname` char(10) NOT NULL COMMENT '真实姓名',
  `avatar` char(150) NOT NULL COMMENT '头像地址',
  `nickname` char(10) NOT NULL COMMENT '昵称',
  `create_project` tinyint(1) NOT NULL COMMENT '新建项目权限',
  `modify_user` tinyint(1) NOT NULL COMMENT '修改用户信息',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据有效性',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` datetime NOT NULL COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user_data`
--

INSERT INTO `user_data` (`id`, `user_id`, `department`, `workgroup`, `realname`, `avatar`, `nickname`, `create_project`, `modify_user`, `valid`, `created_time`, `modified_time`) VALUES
(1, 1, 1, 1, '孙石杰', '孙石杰', '孙石杰', 1, 1, 1, '2018-10-06 18:33:41', '2018-10-06 18:33:41'),
(2, 2, 0, 0, '孙石杰', '孙石杰', '孙石杰', 0, 1, 1, '2018-10-06 18:03:48', '2018-10-06 18:03:48'),
(3, 4, 0, 0, '', '', '', 0, 0, 1, '2018-10-07 10:20:20', '2018-10-07 10:20:20'),
(4, 5, 0, 0, '', '', '', 0, 0, 1, '2018-10-07 10:21:08', '2018-10-07 10:21:08');

-- --------------------------------------------------------

--
-- 表的结构 `user_login`
--

CREATE TABLE `user_login` (
  `id` int(11) NOT NULL COMMENT '主键ID',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户ID',
  `login_ip` char(50) NOT NULL COMMENT '登录IP',
  `login_entry` tinyint(1) NOT NULL COMMENT '登录入口：1PC、2APP、3WAP',
  `modified_time` datetime NOT NULL COMMENT '更新时间/登录时间',
  `created_time` datetime NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录历史表';

--
-- 转存表中的数据 `user_login`
--

INSERT INTO `user_login` (`id`, `user_id`, `login_ip`, `login_entry`, `modified_time`, `created_time`) VALUES
(3, 1, '127.0.0.1', 1, '2018-09-20 16:12:44', '2018-09-20 16:12:44'),
(4, 1, '127.0.0.1', 1, '2018-09-20 16:51:42', '2018-09-20 16:51:42'),
(5, 1, '127.0.0.1', 1, '2018-09-20 17:02:36', '2018-09-20 17:02:36'),
(6, 1, '127.0.0.1', 1, '2018-09-20 17:02:39', '2018-09-20 17:02:39'),
(7, 1, '127.0.0.1', 1, '2018-09-20 17:02:41', '2018-09-20 17:02:41'),
(8, 3, '127.0.0.1', 1, '2018-09-20 17:03:28', '2018-09-20 17:03:28'),
(9, 2, '127.0.0.1', 1, '2018-09-20 17:04:12', '2018-09-20 17:04:12'),
(10, 1, '127.0.0.1', 1, '2018-09-20 20:27:11', '2018-09-20 20:27:11'),
(11, 1, '127.0.0.1', 1, '2018-09-20 20:27:27', '2018-09-20 20:27:27'),
(12, 1, '127.0.0.1', 1, '2018-09-20 20:28:39', '2018-09-20 20:28:39'),
(13, 1, '127.0.0.1', 1, '2018-09-20 20:46:09', '2018-09-20 20:46:09'),
(14, 1, '127.0.0.1', 1, '2018-10-04 17:21:30', '2018-10-04 17:21:30'),
(15, 1, '127.0.0.1', 1, '2018-10-04 17:22:40', '2018-10-04 17:22:40'),
(16, 1, '127.0.0.1', 1, '2018-10-04 17:22:51', '2018-10-04 17:22:51'),
(17, 4, '127.0.0.1', 1, '2018-10-04 17:23:18', '2018-10-04 17:23:18'),
(18, 1, '127.0.0.1', 1, '2018-10-05 16:25:59', '2018-10-05 16:25:59'),
(19, 1, '127.0.0.1', 1, '2018-10-05 16:26:15', '2018-10-05 16:26:15'),
(20, 1, '127.0.0.1', 1, '2018-10-05 16:26:22', '2018-10-05 16:26:22'),
(21, 1, '127.0.0.1', 1, '2018-10-05 21:33:26', '2018-10-05 21:33:26'),
(22, 1, '127.0.0.1', 1, '2018-10-06 15:04:13', '2018-10-06 15:04:13'),
(23, 1, '127.0.0.1', 1, '2018-10-06 16:13:01', '2018-10-06 16:13:01'),
(24, 2, '127.0.0.1', 1, '2018-10-06 16:13:23', '2018-10-06 16:13:23'),
(25, 1, '127.0.0.1', 1, '2018-10-06 16:19:24', '2018-10-06 16:19:24'),
(26, 1, '127.0.0.1', 1, '2018-10-06 16:30:30', '2018-10-06 16:30:30'),
(27, 1, '127.0.0.1', 1, '2018-10-06 16:30:42', '2018-10-06 16:30:42'),
(28, 1, '127.0.0.1', 1, '2018-10-06 16:30:57', '2018-10-06 16:30:57'),
(29, 1, '127.0.0.1', 1, '2018-10-06 16:31:11', '2018-10-06 16:31:11'),
(30, 2, '127.0.0.1', 1, '2018-10-06 16:31:32', '2018-10-06 16:31:32'),
(31, 1, '127.0.0.1', 1, '2018-10-06 17:21:23', '2018-10-06 17:21:23'),
(32, 1, '127.0.0.1', 1, '2018-10-06 17:26:20', '2018-10-06 17:26:20'),
(33, 1, '127.0.0.1', 1, '2018-10-06 17:49:09', '2018-10-06 17:49:09'),
(34, 2, '127.0.0.1', 1, '2018-10-06 17:49:55', '2018-10-06 17:49:55'),
(35, 1, '127.0.0.1', 1, '2018-10-06 17:58:45', '2018-10-06 17:58:45'),
(36, 1, '127.0.0.1', 1, '2018-10-06 18:47:02', '2018-10-06 18:47:02'),
(37, 1, '127.0.0.1', 1, '2018-10-07 14:54:48', '2018-10-07 14:54:48'),
(38, 1, '127.0.0.1', 1, '2018-10-07 14:55:26', '2018-10-07 14:55:26'),
(39, 4, '127.0.0.1', 1, '2018-10-07 14:56:44', '2018-10-07 14:56:44'),
(40, 1, '127.0.0.1', 1, '2018-10-07 19:30:15', '2018-10-07 19:30:15'),
(41, 1, '10.20.11.43', 1, '2018-10-08 18:55:22', '2018-10-08 18:55:22'),
(42, 1, '127.0.0.1', 1, '2018-10-09 09:28:47', '2018-10-09 09:28:47'),
(43, 5, '127.0.0.1', 1, '2018-10-09 09:39:48', '2018-10-09 09:39:48'),
(44, 1, '127.0.0.1', 1, '2018-10-09 09:40:08', '2018-10-09 09:40:08'),
(45, 1, '127.0.0.1', 1, '2018-12-12 23:40:50', '2018-12-12 23:40:50'),
(46, 1, '127.0.0.1', 1, '2018-12-12 23:41:10', '2018-12-12 23:41:10'),
(47, 1, '127.0.0.1', 1, '2018-12-12 23:42:49', '2018-12-12 23:42:49'),
(48, 1, '127.0.0.1', 1, '2018-12-12 23:43:00', '2018-12-12 23:43:00'),
(49, 1, '127.0.0.1', 1, '2018-12-12 23:46:02', '2018-12-12 23:46:02'),
(50, 1, '127.0.0.1', 1, '2018-12-12 23:46:11', '2018-12-12 23:46:11'),
(51, 1, '127.0.0.1', 1, '2018-12-12 23:46:52', '2018-12-12 23:46:52'),
(52, 1, '127.0.0.1', 1, '2018-12-13 22:38:09', '2018-12-13 22:38:09'),
(53, 1, '127.0.0.1', 1, '2018-12-13 22:38:14', '2018-12-13 22:38:14'),
(54, 1, '127.0.0.1', 1, '2018-12-13 22:42:10', '2018-12-13 22:42:10'),
(55, 1, '127.0.0.1', 1, '2018-12-13 22:49:31', '2018-12-13 22:49:31'),
(56, 1, '127.0.0.1', 1, '2018-12-13 23:09:29', '2018-12-13 23:09:29'),
(57, 1, '127.0.0.1', 1, '2018-12-13 23:12:22', '2018-12-13 23:12:22'),
(58, 1, '127.0.0.1', 1, '2018-12-13 23:12:32', '2018-12-13 23:12:32'),
(59, 1, '127.0.0.1', 1, '2018-12-15 00:13:38', '2018-12-15 00:13:38'),
(60, 1, '127.0.0.1', 1, '2018-12-15 10:39:20', '2018-12-15 10:39:20'),
(61, 1, '127.0.0.1', 1, '2018-12-15 13:48:34', '2018-12-15 13:48:34'),
(62, 1, '127.0.0.1', 1, '2018-12-15 17:15:08', '2018-12-15 17:15:08');

--
-- 转储表的索引
--

--
-- 表的索引 `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`config_id`),
  ADD KEY `cname` (`cname`);

--
-- 表的索引 `error_log`
--
ALTER TABLE `error_log`
  ADD PRIMARY KEY (`log_id`);

--
-- 表的索引 `project_data`
--
ALTER TABLE `project_data`
  ADD PRIMARY KEY (`project_id`),
  ADD UNIQUE KEY `project_nickname` (`project_nickname`),
  ADD UNIQUE KEY `name` (`project_name`);

--
-- 表的索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- 表的索引 `user_blacklist`
--
ALTER TABLE `user_blacklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `user_id` (`user_id`);

--
-- 表的索引 `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- 表的索引 `user_login`
--
ALTER TABLE `user_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `config`
--
ALTER TABLE `config`
  MODIFY `config_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `error_log`
--
ALTER TABLE `error_log`
  MODIFY `log_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=108;

--
-- 使用表AUTO_INCREMENT `project_data`
--
ALTER TABLE `project_data`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '项目id';

--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `user_blacklist`
--
ALTER TABLE `user_blacklist`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- 使用表AUTO_INCREMENT `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `user_login`
--
ALTER TABLE `user_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID', AUTO_INCREMENT=63;

--
-- 限制导出的表
--

--
-- 限制表 `user_data`
--
ALTER TABLE `user_data`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
