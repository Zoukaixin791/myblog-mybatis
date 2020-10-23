/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 23/10/2020 11:29:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appreciation` bit(1) NOT NULL COMMENT '赞赏开启',
  `commentabled` bit(1) NOT NULL COMMENT '评论开启',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `first_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首图',
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标记',
  `published` bit(1) NOT NULL COMMENT '发布',
  `recommend` bit(1) NOT NULL COMMENT '推荐',
  `share_statement` bit(1) NOT NULL COMMENT '版权开启',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `views` int(11) NULL DEFAULT NULL COMMENT '浏览次数',
  `type_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `comment_count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK292449gwg5yf7ocdlmswv9w4j`(`type_id`) USING BTREE,
  INDEX `FK8ky5rrsxh01nkhctmo7d48p82`(`user_id`) USING BTREE,
  CONSTRAINT `FK292449gwg5yf7ocdlmswv9w4j` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK8ky5rrsxh01nkhctmo7d48p82` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES (4, b'1', b'1', '# SpringMVC实现原理及详解\r\n## Spring MVC框架简介\r\nSpring MVC是什么呢？它是属于SpringFrameWork的后续产品，已经融合在Spring Web Flow里面。 Spring的MVC框架主要由DispatcherServlet、处理器映射器、处理器(控制器)、视图解析器、视图组成。\r\n\r\nSpringMVC框架是以请求为驱动，围绕Servlet设计，将请求发给控制器，然后通过模型对象，分派器来展示请求结果视图。其中核心类是DispatcherServlet，它是一个Servlet，顶层是实现的Servlet接口。\r\n\r\n## SpringMVC使用\r\n需要在web.xml中配置DispatcherServlet。并且需要配置spring监听器ContextLoaderListener\r\n```xml\r\n       <--配置spring监听器ContextLoaderListener-->\r\n <listener>\r\n            <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>\r\n        </listener>  \r\n        <--配置前端控制器DispatcherServlet-->      \r\n        <servlet>\r\n		<servlet-name>springmvc</servlet-name>\r\n		<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>\r\n                <!-- 如果不设置init-param标签，则必须在/WEB-INF/下创建xxx-servlet.xml文件，其中xxx是servlet-name中配置的名称。  -->\r\n                <init-param>\r\n			<param-name>contextConfigLocation</param-name>\r\n			<param-value>classpath:spring/springmvc-servlet.xml</param-value>\r\n		</init-param>\r\n		<load-on-startup>1</load-on-startup>\r\n	</servlet>\r\n	<servlet-mapping>\r\n		<servlet-name>springmvc</servlet-name>\r\n		<url-pattern>/</url-pattern>\r\n	</servlet-mapping>\r\n\r\n```\r\n## Spring MVC原理图\r\n[![在这里插入图片描述](https://img-blog.csdnimg.cn/20200311164239721.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTM5MTI3Mw==,size_16,color_FFFFFF,t_70 \"在这里插入图片描述\")](http://https://img-blog.csdnimg.cn/20200311164239721.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTM5MTI3Mw==,size_16,color_FFFFFF,t_70 \"在这里插入图片描述\")\r\n\r\n## 流程说明\r\n1、 用户发送请求至前端控制器DispatcherServlet。\r\n\r\n2、 DispatcherServlet收到请求调用HandlerMapping处理器映射器。\r\n\r\n3、处理器映射器找到具体的处理器，生成处理器对象及处理器拦截器一并返回给DispatcherServlet。\r\n\r\n4、 DispatcherServlet调用HandlerAdapter处理器适配器。\r\n\r\n5、 HandlerAdapter经过适配调用具体的处理器。（Controller,也叫后端控制器）\r\n\r\n6、 Controller执行完成返回ModelAndView。\r\n\r\n7、 HandlerAdapter将controller执行结果ModelAndView返回给DispatcherServlet。\r\n\r\n8、 DispatcherServlet将ModelAndView传给ViewReslover视图解析器。\r\n\r\n9、 ViewReslover解析后返回具体View。\r\n\r\n10、DispatcherServlet根据View进行渲染视图。\r\n\r\n11、 DispatcherServlet响应用户，DispatcherServlet也是整个Spring MVC的核心，它负责接收HTTP请求组织协调Spring MVC的各个组成部分\r\n\r\n## SpringMVC组件\r\n**1、DispatcherServlet**：前端控制器。用户请求到达前端控制器，它就相当于mvc模式中的c，dispatcherServlet是整个流程控制的中心，由它调用其它组件处理用户的请求，dispatcherServlet的存在降低了组件之间的耦合性,系统扩展性提高。由框架实现\r\n\r\n**2、HandlerMapping**：处理器映射器。HandlerMapping负责根据用户请求的url找到Handler即处理器，springmvc提供了不同的映射器实现不同的映射方式，根据一定的规则去查找,例如：xml配置方式，实现接口方式，注解方式等。由框架实现\r\n\r\n**3、Handler**：处理器。Handler 是继DispatcherServlet前端控制器的后端控制器，在DispatcherServlet的控制下Handler对具体的用户请求进行处理。由于Handler涉及到具体的用户业务请求，所以一般情况需要程序员根据业务需求开发Handler。\r\n\r\n**4、HandlAdapter**：处理器适配器。通过HandlerAdapter对处理器进行执行，这是适配器模式的应用，通过扩展适配器可以对更多类型的处理器进行执行。由框架实现。\r\n\r\n**5、ModelAndView**：是springmvc的封装对象，将model和view封装在一起。\r\n\r\n**6、ViewResolver**：视图解析器。ViewResolver负责将处理结果生成View视图，ViewResolver首先根据逻辑视图名解析成物理视图名即具体的页面地址，再生成View视图对象，最后对View进行渲染将处理结果通过页面展示给用户。\r\n\r\n**7、View**：是springmvc的封装对象，是一个接口, springmvc框架提供了很多的View视图类型，包括：jspview，pdfview,jstlView、freemarkerView、pdfView等。一般情况下需要通过页面标签或页面模版技术将模型数据通过页面展示给用户，需要由程序员根据业务需求开发具体的页面。\r\n\r\n## 核心架构的具体流程步骤如下：\r\n1、首先用户发送请求——>DispatcherServlet，前端控制器收到请求后自己不进行处理，而是委托给其他的解析器进行处理，作为统一访问点，进行全局的流程控制；\r\n\r\n2、DispatcherServlet——>HandlerMapping， HandlerMapping 将会把请求映射为HandlerExecutionChain 对象（包含一个Handler 处理器（页面控制器）对象、多个HandlerInterceptor 拦截器）对象，通过这种策略模式，很容易添加新的映射策略；\r\n\r\n3、DispatcherServlet——>HandlerAdapter，HandlerAdapter 将会把处理器包装为适配器，从而支持多种类型的处理器，即适配器设计模式的应用，从而很容易支持很多类型的处理器；\r\n\r\n4、HandlerAdapter——>处理器功能处理方法的调用，HandlerAdapter 将会根据适配的结果调用真正的处理器的功能处理方法，完成功能处理；并返回一个ModelAndView 对象（包含模型数据、逻辑视图名）；\r\n\r\n5、ModelAndView的逻辑视图名——> ViewResolver， ViewResolver 将把逻辑视图名解析为具体的View，通过这种策略模式，很容易更换其他视图技术；\r\n\r\n6、View——>渲染，View会根据传进来的Model模型数据进行渲染，此处的Model实际是一个Map数据结构，因此很容易支持其他视图技术；\r\n\r\n7、返回控制权给DispatcherServlet，由DispatcherServlet返回响应给用户，到此一个流程结束。', '2020-10-14 15:32:19', 'Spring MVC是什么呢？它是属于SpringFrameWork的后续产品，已经融合在Spring Web Flow里面。 Spring的MVC框架主要由DispatcherServlet、处理器映射器、处理器(控制器)、视图解析器、视图组成。', 'https://img-blog.csdnimg.cn/20200311164239721.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NTM5MTI3Mw==,size_16,color_FFFFFF,t_70', '', b'1', b'1', b'1', 'SpringMVC实现原理及详解！！！', '2020-10-14 17:09:43', 7, 3, 1, 0);
INSERT INTO `t_blog` VALUES (5, b'1', b'1', 'Git是一个开源的分布式版本控制系统，用于敏捷高效地处理任何或小或大的项目；Git 是 Linus Torvalds 为了帮助管理 Linux 内核开发而开发的一个开放源码的版本控制软件；Git与常用的版本控制工具 CVS, Subversion 等不同，它采用了分布式版本库的方式，不必服务器端软件支持。\r\n> ####  命令总结\r\n \r\n     1 . ===== 初始化文件 =====\r\n     git init  \r\n    \r\n     2 . ===== 关联远程仓库 =====\r\n     git config --global user.name \"\"\r\n     git config --global user.email \"\"\r\n    \r\n     3 . ===== 创建SSH key =====\r\n     ssh-keygen -t rsa -C 123456@qq.com\r\n    \r\n     4 . ===== 查看仓库配置 =====\r\n     git config -list\r\n    \r\n     5 . ===== 克隆远程仓库 =====\r\n     git clone https://github.com/xxxxx/xxx.git\r\n    \r\n     6 . ===== 本地与Github关联 =====\r\n     git remote add origin https://github.com/xxxxx/xxx.git\r\n    \r\n     7 . ===== 本地与Gitee关联 =====\r\n     git remote set-url --add origin https://gitee.com/xxxxx/xxx.git\r\n    \r\n     8 . ===== 创建一个文件 =====\r\n     touch xxx.html，创建了一个xxx.html的文件\r\n    \r\n     9 . ===== 查看改动状态 =====\r\n     git status -s \r\n    -s表示short，输出两列标记，第一列是对staging区域而言,第二列是对working目录而言\r\n    \r\n     10 . ===== 创建本地分支 =====\r\n     git checkout -b dev ，创建一个dev的本地开发分支\r\n    \r\n     11 . ===== 查看分支 =====\r\n     git branch -a 或者 git branch\r\n    \r\n     12 . ===== 切换分支 =====\r\n     git checkout master ，切换到master分支\r\n    \r\n     13 . ===== 合并分支 =====\r\n     git merge dev ，先切换到主分支master，然后合并开发分支dev\r\n    \r\n     14 . ===== 拉取远程分支master / dev =====\r\n     git pull origin master / dev\r\n    \r\n     15 . ===== 推送本地到远程master =====\r\n     git push origin master  或者  git push -u origin master\r\n    \r\n     16 . ===== 查看推送状态 ======\r\n     git remote -v\r\n    \r\n     17 . ===== 查看日志 ======\r\n     git log 或者 git relog 查看历史版本，方便回退\r\n     git log --oneline --number: 每条log只显示一行,显示number条\r\n     git log --oneline --graph: 可以图形化地表示出分支合并历史.\r\n     git log branchname 可以显示特定分支的log.\r\n     git log --oneline branch1 ^branch2,可以查看在分支1,却不在分支2中的提交.^表示排除这个 \r\n     分支(Window下要给^branch2加上引号).\r\n     git log --author=[author name] 可以指定作者的提交历史.\r\n     git log --since --before --until --after 根据提交时间筛选log\r\n     git reflog   查看历史版本，方便查找回退的版本号\r\n    \r\n     18 . ===== 回退版本 ======\r\n     git reset --hard ^ 或者 git reset --hard xxxxx版本号\r\n    \r\n     19 . ===== 提交改动文件 ======\r\n     git add . 或者 git add xxx.html\r\n    \r\n     20 . ===== 提交改动备注 ======\r\n     git commit -m \"xxxx修改\"\r\n    \r\n     21 . ===== 启动本地服务 ======\r\n     cd /d/xxxxx/xxxxx/  切换到目录\r\n     php artisan serve   启动服务\r\n     \r\n     22 . ===== 上传文件到服务器 ======\r\n     scp index.zip root@17.52.255.3:/usr/share/nginx/html\r\n> ####  基本使用\r\n \r\n     1: Github创建一个仓库(如果有请省略)\r\n    \r\n     2: 复制仓库https链接 如https://github.com/Jensonhui/你的仓库名.git\r\n    \r\n     3: 本地新建一个文件夹，右键鼠标选择[ git Bash Here ]\r\n    \r\n     4: git clone 复制的仓库https链接\r\n    \r\n     5: 本地会多出一个文件夹，与github仓库名称一致；接下来把你的项目文件粘贴到这个文件夹中\r\n    \r\n     6: 然后到终端执行命令： cd 刚刚生成的文件夹(与github仓库同名)\r\n    \r\n     7: git add .  // 全部提交\r\n    \r\n     8: git commit -m \"first commit\"  // 提交备注\r\n    \r\n     9: git push -u origin master   // 提交项目到github仓库，这里可能需要输入账户、密码\r\n    \r\n    此时，一个新的项目就提交到远程仓库了，接下来就是在本地创建一个分支，开始你的代码之旅~\r\n    \r\n> ####  分支管理\r\n\r\n     背景：项目由多人共同参与开发时\r\n    \r\n     开发：克隆远程仓库到本地，新建本地开发分支，开发完成后合并到master，然后推送到远程\r\n    \r\n     常用命令：\r\n     git clone https://github.com/xxxx/xxx.git   克隆远程仓库到本地\r\n     git checkout -b dev   新建本地开发分支\r\n     git status   查看改动文件\r\n     git add .   提交全部文件\r\n     git commit -m\"\"   添加改动标记\r\n     git branch   查看当前分支\r\n     git checkout master   切换到主分支master\r\n     git pull origin master   拉取远程主分支代码\r\n     git merge dev   合并本地开发分支到master\r\n     git push origin master   推送本地到远程master\r\n     git checkout dev   切换到本地开发分支\r\n    \r\n     =========== 如果粗心忘记先拉去后合并，且还没有提交 ===========\r\n    \r\n     第一种方式：查看提交记录，回退到之前版本：\r\n     git log ;\r\n     git reset --hard xxxxx\r\n    \r\n     第二种方式：将远程拉取到本地，使用git stash pop\r\n     git stash   将本地代码stash到仓库\r\n     git pull   拉取远程代码\r\n     git stash pop   将仓库代码合并到本地最新代码\r\n     git add .\r\n     git commit -m\"\"\r\n     git pull origin master\r\n     git push origin master\r\n> #### 强制更新\r\n\r\n放弃本地修改，强制更新远端代码\r\n\r\n    1 . 指令是下载远程仓库最新内容，不做合并 \r\n    git fetch --all  \r\n    \r\n    2 . 指令把HEAD指向master最新版本\r\n    git reset --hard origin/master\r\n    \r\n    3 . 重新拉取更新\r\n    git pull', '2020-10-14 17:27:53', 'Git是一个开源的分布式版本控制系统，用于敏捷高效地处理任何或小或大的项目；Git 是 Linus Torvalds 为了帮助管理 Linux 内核开发而开发的一个开放源码的版本控制软件；Git与常用的版本控制工具 CVS, Subversion 等不同，它采用了分布式版本库的方式，不必服务器端软件支持。', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3404785910,683938159&fm=26&gp=0.jpg', '', b'1', b'1', b'1', 'Git常用命令总结', '2020-10-23 03:27:26', 7, 6, 1, 2);

-- ----------------------------
-- Table structure for t_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_tags`;
CREATE TABLE `t_blog_tags`  (
  `blogs_id` bigint(20) NOT NULL,
  `tags_id` bigint(20) NOT NULL,
  INDEX `FK5feau0gb4lq47fdb03uboswm8`(`tags_id`) USING BTREE,
  INDEX `FKh4pacwjwofrugxa9hpwaxg6mr`(`blogs_id`) USING BTREE,
  CONSTRAINT `FK5feau0gb4lq47fdb03uboswm8` FOREIGN KEY (`tags_id`) REFERENCES `t_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKh4pacwjwofrugxa9hpwaxg6mr` FOREIGN KEY (`blogs_id`) REFERENCES `t_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_blog_tags
-- ----------------------------
INSERT INTO `t_blog_tags` VALUES (4, 1);
INSERT INTO `t_blog_tags` VALUES (4, 8);
INSERT INTO `t_blog_tags` VALUES (4, 9);
INSERT INTO `t_blog_tags` VALUES (4, 17);
INSERT INTO `t_blog_tags` VALUES (4, 20);
INSERT INTO `t_blog_tags` VALUES (4, 21);
INSERT INTO `t_blog_tags` VALUES (5, 19);
INSERT INTO `t_blog_tags` VALUES (5, 21);
INSERT INTO `t_blog_tags` VALUES (5, 22);

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_comment` bit(1) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `blog_id` bigint(20) NULL DEFAULT NULL,
  `parent_comment_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (3, b'1', 'https://unsplash.it/100/100?image=1005', 'sdad', '2020-10-23 03:29:23', 'keyxin791@yeah.net', '邹凯鑫', 5, -1);
INSERT INTO `t_comment` VALUES (4, b'1', 'https://unsplash.it/100/100?image=1005', 'asdasd', '2020-10-23 03:29:30', '18236789287@163.com', 'sdsad', 5, 3);

-- ----------------------------
-- Table structure for t_friend
-- ----------------------------
DROP TABLE IF EXISTS `t_friend`;
CREATE TABLE `t_friend`  (
  `id` bigint(20) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `blog_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blog_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_friend
-- ----------------------------
INSERT INTO `t_friend` VALUES (00000000000000000001, 'sd ', 'sdsa ', 'sd as ', '2020-10-23 03:21:24');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` bigint(20) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `parent_message_id` bigint(20) NULL DEFAULT NULL,
  `admin_message` bit(1) NULL DEFAULT NULL,
  `parent_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES (00000000000000000001, 'admin', '675104182@qq.com', 'sda  d', NULL, '2020-10-23 11:11:31', NULL, NULL, NULL);
INSERT INTO `t_message` VALUES (00000000000000000002, '邹凯鑫', 'keyxin791@yeah.net', 'sd ', 'https://unsplash.it/100/100?image=1005', '2020-10-23 03:24:18', -1, b'1', NULL);
INSERT INTO `t_message` VALUES (00000000000000000003, 'ds', '18236789287@163.com', 'afsf', 'https://unsplash.it/100/100?image=1005', '2020-10-23 03:24:25', 2, b'1', NULL);

-- ----------------------------
-- Table structure for t_picture
-- ----------------------------
DROP TABLE IF EXISTS `t_picture`;
CREATE TABLE `t_picture`  (
  `id` bigint(20) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `picture_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_picture
-- ----------------------------
INSERT INTO `t_picture` VALUES (00000000000000000001, 'sa', 'sad', 'sd as ', 'ada');

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (1, 'java');
INSERT INTO `t_tag` VALUES (4, 'MySQL');
INSERT INTO `t_tag` VALUES (5, '数据库');
INSERT INTO `t_tag` VALUES (6, 'MongoDB');
INSERT INTO `t_tag` VALUES (7, 'Oracle');
INSERT INTO `t_tag` VALUES (8, 'web');
INSERT INTO `t_tag` VALUES (9, '服务器');
INSERT INTO `t_tag` VALUES (10, 'Nginx');
INSERT INTO `t_tag` VALUES (11, 'Centos7');
INSERT INTO `t_tag` VALUES (12, 'Linux');
INSERT INTO `t_tag` VALUES (13, '前端');
INSERT INTO `t_tag` VALUES (14, 'Javascript');
INSERT INTO `t_tag` VALUES (15, '排序');
INSERT INTO `t_tag` VALUES (16, '设计模式');
INSERT INTO `t_tag` VALUES (17, '后端');
INSERT INTO `t_tag` VALUES (18, '多线程');
INSERT INTO `t_tag` VALUES (19, 'Git');
INSERT INTO `t_tag` VALUES (20, '核心技术');
INSERT INTO `t_tag` VALUES (21, '框架');
INSERT INTO `t_tag` VALUES (22, 'Docker');
INSERT INTO `t_tag` VALUES (23, 'window');
INSERT INTO `t_tag` VALUES (24, '邮箱');
INSERT INTO `t_tag` VALUES (25, 'Redis');

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_type
-- ----------------------------
INSERT INTO `t_type` VALUES (1, 'java');
INSERT INTO `t_type` VALUES (3, 'SpringMVC');
INSERT INTO `t_type` VALUES (5, 'Mysql');
INSERT INTO `t_type` VALUES (6, '版本控制工具');
INSERT INTO `t_type` VALUES (7, 'SpringBoot');
INSERT INTO `t_type` VALUES (8, 'Tomcat');
INSERT INTO `t_type` VALUES (9, 'dubbo');
INSERT INTO `t_type` VALUES (10, 'Redis');
INSERT INTO `t_type` VALUES (11, 'Linux');
INSERT INTO `t_type` VALUES (12, 'maven');
INSERT INTO `t_type` VALUES (13, 'mybatis');
INSERT INTO `t_type` VALUES (14, 'Spring');
INSERT INTO `t_type` VALUES (15, 'zookeeper');
INSERT INTO `t_type` VALUES (16, '小鱼端账户授权模块');
INSERT INTO `t_type` VALUES (17, '取消账户授权');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'https://unsplash.it/100/100?image=1005', NULL, 'keyxin791@yeah.net', '邹凯鑫', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, 'admin');

SET FOREIGN_KEY_CHECKS = 1;
