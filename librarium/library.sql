/*
SQLyog Trial v13.1.6 (64 bit)
MySQL - 8.0.17 : Database - springdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*CREATE DATABASE /*!32312 IF NOT EXISTS*//*`libera` /*!40100 /*DEFAULT CHARACTER SET utf8 */ /*!80016 /*DEFAULT ENCRYPTION='N' */

/*USE `springdb`;*/

/* SET FOREIGN_KEY_CHECKS = 0; */
/*Table structure for table `admin_menu` */
DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `path` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '路径',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '名称',
  `name_zh` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '中文名称',
  `icon_cls` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图标路径或名称',
  `component` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '组件路径',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admin_menu` */

insert  into `admin_menu`(`id`,`path`,`name`,`name_zh`,`icon_cls`,`component`,`parent_id`) values
(1,'/admin','AdminIndex','首页','el-icon-s-home','AdminIndex',0),
(2,'/admin/dashboard','DashboardAdmin','运行情况',NULL,'dashboard/admin/index',1),
(3,'/admin','User','用户管理','el-icon-user','AdminIndex',0),
(4,'/admin','Content','内容管理','el-icon-tickets','AdminIndex',0),
(5,'/admin/user/profile','profile','个人信息','el-icon-solid-user','user/SingleUser',1),
(6,'/admin/user/profiles','Profiles','用户信息',NULL,'user/UserProfile',3),
(7,'/admin/user/role','Role','角色配置',NULL,'user/Role',3),
(8,'/admin/content/book','BookManagement','图书管理',NULL,'content/BookManagement',4),
(9,'/admin/content/banner','BannerManagement','座位管理',NULL,'content/BannerManagement',4),
(10,'/admin/content/article','ArticleManagement','公告管理',NULL,'content/ArticleManagement',4),
(17,'/admin/user/book','bookReturn','归还图书','el-icon-tickets','user/BorrowedBooks',1),
(18,'/admin/record','Record','借阅记录',NULL,'user/OrderRecord',3),
(19,'/admin/return','Return','归还记录',NULL,'user/ReturnRecord',3),
(20,'/admin/user/commenteditor','CommentEditor','留言服务',NULL,'user/CommentEditor',1),
(21,'/admin/user/SingleReturnRecord','SingleReturnRecord','个人借阅情况',NULL,'user/SingleReturnRecord',1),
(22,'/admin/content/CommentManagement','CommentManagement','留言管理',NULL,'content/CommentManagement',4),
(23,'/admin/user/singleComment','SingleComment','个人留言',NULL,'user/SingleComment',1),
(24,'/admin/user/singlestar','StarredBooks','收藏管理',NULL,'user/StarredBooks',1);
/*Table structure for table `admin_permission` */

DROP TABLE IF EXISTS `admin_permission`;

CREATE TABLE `admin_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限名称',
  `desc_` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限说明',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权限路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `admin_permission` */

insert  into `admin_permission`(`id`,`name`,`desc_`,`url`) values
(1,'users_management','用户管理','/api/admin/user'),
(2,'roles_management','角色管理','/api/admin/role'),
(3,'content_management','内容管理','/api/admin/content');

/*Table structure for table `admin_role` */

DROP TABLE IF EXISTS `admin_role`;

CREATE TABLE `admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
  `name_zh` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '中文名称',
  `enabled` tinyint(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `admin_role` */

insert  into `admin_role`(`id`,`name`,`name_zh`,`enabled`) values
(1,'sysAdmin','系统管理员',1),
(2,'contentManager','内容管理员',0),
(3,'visitor','访客',1),
(9,'test','测试角色',1);

/*Table structure for table `admin_role_menu` */

DROP TABLE IF EXISTS `admin_role_menu`;

CREATE TABLE `admin_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `rid` int(11) DEFAULT NULL COMMENT '角色编号',
  `mid` int(11) DEFAULT NULL COMMENT '导航编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admin_role_menu` */

insert  into `admin_role_menu`(`id`,`rid`,`mid`) values
(19,4,1),
(20,4,2),
(37,9,1),
(38,9,2),
(39,9,5),
(40,9,17),
(41,1,1),
(42,1,2),
(43,1,5),
(44,1,17),
(45,1,3),
(46,1,6),
(47,1,7),
(48,1,4),
(49,1,8),
(50,1,9),
(51,1,10),
(105,2,1),
(106,2,2),
(107,2,5),
(108,2,17),
(109,2,4),
(110,2,8),
(111,2,9),
(112,2,10),
(113,3,1),
(114,3,2),
(115,3,5),
(116,3,17);

/*Table structure for table `admin_role_permission` */

DROP TABLE IF EXISTS `admin_role_permission`;

CREATE TABLE `admin_role_permission` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `rid` int(20) DEFAULT NULL COMMENT '角色编号',
  `pid` int(20) DEFAULT NULL COMMENT '权限编号',
  PRIMARY KEY (`id`),
  KEY `fk_role_permission_role_1` (`rid`),
  KEY `fk_role_permission_permission_1` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

/*Data for the table `admin_role_permission` */

insert  into `admin_role_permission`(`id`,`rid`,`pid`) values
(83,5,3),
(86,9,1),
(87,1,1),
(88,1,2),
(89,1,3),
(99,2,3);

/*Table structure for table `admin_user_role` */

DROP TABLE IF EXISTS `admin_user_role`;

CREATE TABLE `admin_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` int(11) DEFAULT NULL COMMENT '用户编号',
  `rid` int(11) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`),
  KEY `fk_operator_role_operator_1` (`uid`),
  KEY `fk_operator_role_role_1` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

/*Data for the table `admin_user_role` */

insert  into `admin_user_role`(`id`,`uid`,`rid`) values
(39,2,3),
(40,2,9),
(42,24,3),
(44,1,1),
(45,28,3),
(46,3,2),
(47,25,3);

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书编号',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '封面（路径）',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图书名称',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '作者',
  `date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '出版时间',
  `press` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '出版社',
  `abs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '摘要',
  `cid` int(11) DEFAULT NULL COMMENT '分类编号',
  PRIMARY KEY (`id`),
  KEY `fk_book_category_on_cid` (`cid`),
  CONSTRAINT `fk_book_category_on_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`id`,`cover`,`title`,`author`,`date`,`press`,`abs`,`cid`) values
(1,'https://i.loli.net/2019/04/10/5cadaa0d0759b.jpg','且在人间','余秀华','2019-2-1','湖南文艺出版社','诗人余秀华中篇小说首次结集出版。\r\n\r\n        《且在人间》——以余秀华为生活原型，讲述一个残疾女人悲苦倔强、向死而生的故事。\r\n\r\n        女主人公周玉生活在乡村，患有“脑瘫”，她几乎被所有人漠视，甚至被整个社会抛弃，但是她渴望被当成一个普通的健康人,而不是带着怜悯或不屑，她只要求平等。爱情的缺 失，家庭的不幸，生活的种种际遇让周玉用诗歌的方式把 情感抒发出来，最终她用诗歌创作出了一个文学的世界，得到了人们的认可。',2),
(2,'https://i.loli.net/2019/04/10/5cada7e73d601.jpg','三体','刘慈欣',' 2008-1','重庆出版社','文化大革命如火如荼进行的同时。军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的命运。地球文明向宇宙发出的第一声啼鸣，以太阳为中心，以光速向宇宙深处飞驰……\r\n\r\n四光年外，“三体文明”正苦苦挣扎——三颗无规则运行的太阳主导下的百余次毁灭与重生逼迫他们逃离母星。而恰在此时。他们接收到了地球发来的信息。在运用超技术锁死地球人的基础科学之后。三体人庞大的宇宙舰队开始向地球进发……\r\n\r\n人类的末日悄然来临。',2),
(32,'https://i.loli.net/2019/04/10/5cada99bd8ca5.jpg','叙事的虚构性','[美] 海登·怀特 ','2019-3','南京大学出版社','海登•怀特被誉为人类伟大的思想家之一。从1973年出版具有里程碑意义的专著《元史学》以来，怀特的作品对于历史学、文学研究、人类学、哲学、艺术史、电影传媒研究等将叙事学作为关注焦点的学科而言意义非凡。\n\n本书由罗伯特•多兰作序，他巧妙地将怀特重要但难得一见的文章汇集成册，研究探讨他关于历史书写和叙事的革命性理论。怀特的这些文章大多采用论文体，内容涉及多位思想家，探讨诸多主题，文笔犀利，语言优美。\n\n《叙事的虚构性》追溯怀特重要思想的演变轨迹，是历史编纂学者和学习者、历史理论和文学研究学者们的重要读物。',3),
(35,'https://i.loli.net/2019/04/10/5cada940e206a.jpg','圣母','[日]秋吉理香子 ','2019-3','新星出版社','一起男童被害案搅得蓝出市人心惶惶。\n\n好不容易怀孕生产的保奈美抱紧年幼的孩子，立誓要不惜任何代价保护她。\n\n男人是在孩子出生后才成为父亲的，但女人，是从小生命来到体内的那一瞬间起，就是母亲了。患有不孕症的保奈美是经历过艰辛的治疗过程才终于有了孩子的，她不允许这起命案威胁到宝贵的孩子！\n\n母亲，就是要消除所有对子女的威胁，每一位母亲都应肩负这样的使命，这是神圣的天职！',1),
(37,'https://i.loli.net/2019/04/10/5cada8986e13a.jpg','奢侈与逸乐','[英]马克辛·伯格','2019-3','中国工人出版社','本书探讨了十八世纪英国新式、时尚的消费品的发明、制造和购买。',3),
(38,'https://i.loli.net/2019/04/10/5cada8b8a3a17.jpg','忧伤动物','[德]莫妮卡·马龙 ','2019-4','漓江出版社','“忧伤动物”(animal triste)这个词组取自一句最早可以追溯到亚里士多德时代的拉丁语名言，即“欢爱后，每个动物都忧伤不已”（Post coitum omne animal triste est）。无疑，这部冠以如此标题的小说让人有不祥的预感并暗示着宿命的思想。小说的女主人公是位近乎百岁的老人。在多年前有意斩断了与外界的一切联系之后，在她的后半生里，她唯一能做的就是或躺或坐在“印着鲜红、艳绿和深紫色的大花”、让人想起“食肉植物的花朵”的床单上，追忆几十年前她和自己...',1),
(54,'https://i.loli.net/2019/04/10/5cada9d9d23a6.jpg','爱界','[英] 费伊·韦尔登 ','2019-3-1','人民文学出版社','去不去爱，爱的界限何在，一直是普拉克西丝的人生课题。\n\n年迈的她独自待在肮脏而昏暗的地下室里，想写回忆录，可她该写些什么呢？是写父母未婚同居生下了她，她还年幼天真无邪时，母女就遭父亲抛弃？还是写她曾经或是主动或是被动地成了未婚同居者、妻子、情人、母亲、后母？还是写她两年的牢狱生活？她想描绘二十世纪女性的众生相，想记录女性群体在情感、灵魂和思想方面所处的三重困境，想道出女性之间的大爱如何铸成姐妹之谊。',3),
(55,'https://i.loli.net/2019/04/10/5cada824c7119.jpg','密室中的旅行','[美] 保罗·奥斯特 ','2019-3','九州出版社','一旦被抛进这个世界，我们就永远不会消失，即使造物者已经死去。\n\n.\n\n布兰克先生发现自己被囚禁在一个陌生的房间里，对过去的身份和经历一无所知。桌上有四叠六英寸厚的文稿，其中有一份未完待续的囚犯自述；还有一叠似曾相识的照片，照片中的人物将逐一登场。他续写了那个囚犯的故事，却发现自己正在经历的一切也早已被记录在文稿中……',1),
(59,'https://i.loli.net/2019/04/10/5cada87fd5c72.jpg','基本穿搭','[日]大山旬 ','2019-3','四川人民出版社','对穿衣搭配感到不耐烦，认为时尚很麻烦，穿什么都可以或者对衣服有着自己的想法但不够自信，本书就是为这样的人而准备的穿衣指南。不需要追随瞬息万变的时尚潮流，也不需要烦恼色彩搭配，只要掌握最低限度的知识和备齐常规单品，谁都能完成清爽得体的 80分搭配。',4),
(60,'https://i.loli.net/2019/04/10/5cada976927da.jpg','冒牌人生','陈思安','2019-4','四川文艺出版社','《冒牌人生》收录了十篇短篇小说。十个故事分别以城市中的怪人为主角，他们默默无闻地生存在城市主流生活的边缘地带：或是等待手术的性别认同障碍者，或是武艺高强而深藏不露的夜市摊主，或是卧底追凶的底层保安，或是甘于...',1),
(61,'https://i.loli.net/2019/04/10/5cada9202d970.jpg','战争哀歌','[越]保宁 ','2019-4','湖南文艺出版社','《战争哀歌》超越了战争，战争是它的背景，它的内核是关于逝去的青春，关于美和伤痛！\n\n一场突如其来的战争打碎了阿坚和阿芳这对年轻情侣的生活，在血肉横飞的战争中，主人公阿坚成了幸存者，但战争带来的伤痛还远远没有平息。那些经历仍旧萦绕在阿坚的生活之中，被战争毁灭的不仅 仅是阿坚， 阿芳也遭遇了难以想象的梦魇。时间越长，阿坚越觉得自己不是活着，而是被困在这人世间。',1),
(62,'https://i.loli.net/2019/04/10/5cada9c852298.jpg','胡椒的全球史','[美] 玛乔丽·谢弗 ','2019-3','上海三联出版社','看似不起眼的胡椒，却是家家餐桌必备。在中世纪时，更是欧洲达官显贵们的最爱、财富与地位的象征。黑胡椒原产于印度，距离欧洲各港口有十万八千里之远，取之向来不易。商人们对其供应来源不遗余力的追寻，成为世界史上一股重要的推动力量，促成全球贸易的兴起，重新划定了世界经济版图。',2),
(63,'https://i.loli.net/2019/04/10/5cada962c287c.jpg','与病对话','胡冰霜','2019-3-31','北京联合出版公司','一部融合科普性与趣味性、兼具心理学与哲学意味的医学散文。\n\n一位满怀仁心的资深医者对几十年行医生涯的回望与省思。\n\n全书以真实的病例和鲜活的故事贯穿始终，作者从一位全科医生、心理学者的视角观察、解读疾病与患者身心之关系，厘清大众对诸多常见疾病的误解...',1),
(64,'https://i.loli.net/2019/04/10/5cada858e6019.jpg','上帝笑了99次','[英]彼得·凯弗','2019-2','北京联合出版公司','一只美洲羊驼会坠入爱河吗？机器人能变成人吗？怎样才能不赢得公主青睐？人类一思考，上帝就发笑。在99个奇妙、怪诞、滑稽的问题背后，其实是99个烧脑的哲学、道德、法律领域的经典悖论，也是99道极富挑战性的大思考测试。本书内容覆盖了大多数常见哲学话题，包括形而上学、逻辑学、伦理学、语言哲学、政治哲学、自我认知、人际关系、美学、存在主义等，还配有20多幅漫画插图。在锻炼思维之外，本书也能帮我们建立个性化的哲学知识体系。',3),
(65,'https://i.loli.net/2019/04/10/5cada8e1aa892.jpg','互联网算法','[美] 菲斯曼等 ','2019-4','江西人民出版社','只要你租过房子、上网买过东西、自己经营过企业，那么你就处在商业变革的前线。在这场变革中，亚马逊、谷歌、优步等不同以往的企业取得了史无前例的成功，而促成这场变革的不只是科技进步，还有经济学思想。\n\n在这本趣味横生的书中，我们会看到，经济思想的革命远比科技革命更宏大。从谷歌广告的算法，到网上购物规避欺诈，都要依靠经济学家建立的经济模型，甚至连互联网公司...',6),
(66,'https://i.loli.net/2019/04/10/5cada9ec514c9.jpg','七侯笔录','马伯庸','2019-4-15','湖南文艺出版社','一个关于文化的离奇故事，一段关于文人的壮丽传说。\n\n几千年来，每一位风华绝代的文人墨客辞世之时，都会让自己的灵魂寄寓在一管毛笔之中。他们身躯虽去，才华永存，这些伟大的精神凝为性情不一的笔灵，深藏于世间，只为一句“不教天下才情付诸东流”的誓言。其中最伟大的七位古人，他们所凝聚的七管笔灵，被称为“管城七侯”。\n\n一位不学无术的现代少年，无意中邂逅了李白的青莲笔，命运就此与千年之前的诗仙交织一处，并为他开启了一个叫作笔冢的神秘世界。',3),
(67,'https://i.loli.net/2019/04/10/5cada9870c2ab.jpg','中心与边缘','[美] 希尔斯','2019-3','译林出版社','美国著名社会学家爱德华·希尔斯的主要研究成果包括他对“克里斯玛”、“中心”和“边缘”等概念的解释，以及他对“大众社会”一词的修正，这些研究对分析政治和文化领导力以及社会凝聚力具有重要价值。本书对希尔斯数十载社会理论研究进行了全面而详细的总结，为解释与探究当代社会的结构与变化提供了极具科学性的参考依据。',3),
(68,'https://i.loli.net/2019/04/10/5cad643643d4c.jpg','水浒群星闪耀时','李黎','2019-4','上海文艺出版社','本书以众所周知的梁山英雄为写作对象，重点书写其上山后、招安前的日常生活，涉及他们的喜怒哀乐、同类中人、乡愁怀旧、未来憧憬、命运追问等。书中涉及宋江、武松、鲁智深、李俊、燕青等等耳熟能详的人物而显得有些“改编”与水浒研究的意味，但鉴于所有人物皆为虚构，本书稿的内容是虚构之上的虚构，旨在宏大叙事的语境下突出个人的细微之处和命运感。',1),
(69,'https://i.loli.net/2019/04/10/5cad63931ce27.jpg','谋杀狄更斯','[美] 丹·西蒙斯 ','2019-4','上海文艺出版社','“狄更斯的那场意外灾难发生在1865年6月9日，那列搭载他的成功、平静、理智、手稿与情妇的火车一路飞驰，迎向铁道上的裂隙，突然触目惊心地坠落了。”',1),
(70,'https://i.loli.net/2019/04/10/5cad63f99f519.jpg','像艺术家一样思考','[英] 威尔·贡培兹','2019-4','湖南美术出版社','归纳成就艺术大师的 10 个关键词\n\n揭示大师们的创作秘辛\n\n凝聚 BBC 艺术频道主编威尔·贡培兹职业生涯的所见、所知、所想\n\n·\n\n威尔·贡培兹是你能遇到的最好的老师\n\n——《卫报》',3);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL COMMENT '分类编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`) values
(1,'文学'),
(2,'流行'),
(3,'文化'),
(4,'生活'),
(5,'经管'),
(6,'科技');

/*Table structure for table `jotter_article` */

DROP TABLE IF EXISTS `jotter_article`;

CREATE TABLE `jotter_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告编号',
  `article_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '公告名称',
  `article_content_html` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '公告内容（HTML格式）',
  `article_content_md` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '公告内容（MD格式）',
  `article_abstract` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '内容摘要',
  `article_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '公告封面（路径）',
  `article_date` datetime DEFAULT NULL COMMENT '编辑时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `jotter_article` */

/*insert  into `jotter_article`(`id`,`article_title`,`article_content_html`,`article_content_md`,`article_abstract`,`article_cover`,`article_date`) values*/

/*Table structure for table `starred` */
DROP TABLE IF EXISTS `starred`;

CREATE TABLE `starred` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `uid` int(11) DEFAULT NULL COMMENT '用户编号',
  `bid` int(11) DEFAULT NULL COMMENT '图书编号',
  `time` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'null' COMMENT '收藏日期',
   PRIMARY KEY (`id`),
   KEY `uid` (`uid`),
   KEY `bid` (`bid`)
)ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

/*Table structure for table `ordered` */

DROP TABLE IF EXISTS `ordered`;

CREATE TABLE `ordered` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '借阅编号',
  `uid` int(11) DEFAULT NULL COMMENT '用户编号',
  `bid` int(11) DEFAULT NULL COMMENT '图书编号',
  `time` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'null' COMMENT '借阅日期',
  `duetime` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'null' COMMENT '应还日期',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `bid` (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

/*Data for the table `ordered` */

insert  into `ordered`(`id`,`uid`,`bid`,`time`,`duetime`) values
(50,24,109,'null','null'),
(53,28,70,'null','null'),
(56,28,109,'null','null'),
(94,1,69,'2020年5月14日  13:57:42','2020年8月14日  13:57:42'),
(95,1,68,'2020年5月14日  13:57:44','2020年8月14日  13:57:44'),
(97,25,70,'2020年5月14日  22:23:03','2020年8月14日  22:23:03'),
(98,25,64,'2020年5月14日  22:23:50','2020年8月14日  22:23:50'),
(99,25,59,'2020年5月14日  22:23:12','2020年8月14日  22:23:12'),
(100,25,37,'2020年5月14日  22:23:15','2020年8月14日  22:23:15'),
(101,25,1,'2020年5月14日  22:23:20','2020年8月14日  22:23:20'),
(102,2,65,'2020年5月14日  22:24:24','2020年8月14日  22:24:24'),
(103,2,63,'2020年5月14日  22:24:26','2020年8月14日  22:24:26'),
(104,2,68,'2020年5月14日  22:24:28','2020年8月14日  22:24:28'),
(107,1,2,'2020年5月15日  10:09:51','2020年8月15日  10:09:51'),
(109,1,70,'2020年5月30日  11:28:19','2020年8月30日  11:28:19'),
(110,1,63,'2020年5月30日  12:50:54','2020年8月30日  12:50:54');

/*Table structure for table `returned` */

DROP TABLE IF EXISTS `returned`;

CREATE TABLE `returned` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `uid` int(11) DEFAULT NULL COMMENT '用户编号',
  `bid` int(11) DEFAULT NULL COMMENT '图书编号',
  `duetime` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'null' COMMENT '应还日期',
  `time` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'null' COMMENT '归还时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `returned` */

insert  into `returned`(`id`,`uid`,`bid`,`duetime`,`time`) values
(13,2,32,'2020年3月14日  13:58:58','2020年5月14日  21:58:58'),
(14,3,70,'2020年6月14日  21:59:10','2020年5月14日  21:59:10'),
(15,3,69,'2020年5月16日  21:59:03','2020年5月14日  21:59:03'),
(16,25,70,'2020年5月13日  11:59:06','2020年5月14日  21:59:06'),
(17,25,69,'2020年5月15日  21:59:08','2020年5月14日  21:59:08'),
(18,1,70,'2020年4月14日  22:18:43','2020年5月14日  22:18:43'),
(19,1,63,'2020年5月31日  22:14:39','2020年5月29日  22:14:39'),
(20,1,70,'2020年5月30日  10:28:08','2020年5月30日  11:28:08'),
(21,1,64,'2020年5月29日  12:06:41','2020年5月30日  12:06:41'),
(22,2,32,'2020年5月30日  12:18:15','2020年5月30日  12:15:15');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `username` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加盐值',
  `name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `enabled` tinyint(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`salt`,`name`,`phone`,`email`,`enabled`) values
(1,'admin','36c0d3ecb357040aff69e0db25c41fb0','/MPdPrsMc7PV7hYATAbILw==','系统管理员','15616258555','springdb@fudan.edu.cn',1),
(2,'test','ee67f703c63c09207a2aa82feb86e723','laluHHt9MauEDVEI2cSzUQ==','测试用户','15376258066','123456789@qq.com',1),
(3,'editor','8583a2d965d6159edbf65c82d871fa3e','MZTe7Qwf9QgXBXrZzTIqJQ==','编辑',NULL,NULL,1),
(25,'visitor','f2aa782914b93d35fd2dd19bdf3a7778','YtRri1YvnlVcLxYQtml7NQ==','ahmatjan',NULL,NULL,1);
/*Table structure for table `comment` */
DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
    `username` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '用户昵称',
    `uid` int(11)  COMMENT '用户编号',
    `comment_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '评论标题',
    `comment_content_html` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '评论内容（HTML格式）',
    `comment_content_md` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '评论内容（MD格式）',
    `time` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'null' COMMENT '最新评论时间',
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_comment_on_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/* Table structure for table `seat` */
DROP TABLE IF EXISTS `seat`;

CREATE TABLE `seat` (
                        `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
                        `sid` int(11) NOT NULL COMMENT '座位编号',
                        `state` int(11) DEFAULT 1 COMMENT '座位状态',
                        PRIMARY KEY (`id`),
                        KEY `fk_seat_on_state` (`state`),
                        CONSTRAINT `fk_seat_on_state` FOREIGN KEY (`state`) REFERENCES `seat_stat`(`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into `seat` (`id`, `sid`, `state`) VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,1),
(5,5,2),
(6,6,1),
(7,7,2),
(8,8,3),
(9,9,1),
(10,10,2),
(11,11,1),
(12,12,2),
(13,13,3),
(14,14,1),
(15,15,2),
(16,16,1),
(17,17,2),
(18,18,3),
(19,19,1),
(20,20,2),
(21,21,1),
(22,22,2),
(23,23,3),
(24,24,1),
(25,25,2);

/* Table structure for table `seat_stat` */
DROP TABLE IF EXISTS `seat_stat`;

CREATE TABLE `seat_stat` (
                             `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '状态编号',
                             `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '名称',
                             `name_zh` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '中文名称',
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into `seat_stat` (`id`, `name`, `name_zh`) VALUES
(1,'available','空闲'),
(2,'occupied' ,'已占'),
(3,'broken', '维修中');

/* The view */
CREATE OR REPLACE VIEW seat_view AS
SELECT seat.id,seat.sid,seat_stat.name,seat_stat.name_zh
from seat,seat_stat WHERE seat.state=seat_stat.id;

/* Trigger */
CREATE TRIGGER order_trigger after delete on `user` FOR EACH ROW
begin
    DELETE FROM `ordered` WHERE OLD.id=ordered.uid;
end;

/* Procedure */
CREATE PROCEDURE free_num(OUT s integer)
BEGIN
    SELECT COUNT(*) INTO s FROM seat WHERE seat.state = 1;
end;

/* Function */
set global log_bin_trust_function_creators=1;

CREATE FUNCTION order_num(bid integer)
    returns integer
begin
    declare num integer default 0;
    SELECT COUNT(*) INTO num
    FROM ordered
    WHERE ordered.bid=bid;
    return num;
end;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
