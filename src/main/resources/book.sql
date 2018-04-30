/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : book

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 30/04/2018 12:08:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_bigimg
-- ----------------------------
DROP TABLE IF EXISTS `t_bigimg`;
CREATE TABLE `t_bigimg`  (
  `id` bigint(50) NOT NULL,
  `item_id` bigint(50) NULL DEFAULT NULL,
  `img` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE,
  CONSTRAINT `t_bigimg_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `t_item` (`item_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bigimg
-- ----------------------------
INSERT INTO `t_bigimg` VALUES (152490430495045, 1111, '1524904303801680,', '镜头里的世界名校');
INSERT INTO `t_bigimg` VALUES (152490456759208, 1205, '1524904565757228,', '人生因孤独而丰盛');
INSERT INTO `t_bigimg` VALUES (152490494720693, 1206, '1524904946092846,', '思维简史：从丛林到宇宙');

-- ----------------------------
-- Table structure for t_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart`  (
  `cart_id` bigint(50) NOT NULL,
  `user_id` bigint(50) NOT NULL,
  `cartdata` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `t_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_cart
-- ----------------------------
INSERT INTO `t_cart` VALUES (152488701356205, 1, '[]');
INSERT INTO `t_cart` VALUES (152491428504243, 2, '[]');
INSERT INTO `t_cart` VALUES (152491441822112, 3, '[]');
INSERT INTO `t_cart` VALUES (152491450257384, 4, '[]');
INSERT INTO `t_cart` VALUES (152491456326229, 5, '[]');
INSERT INTO `t_cart` VALUES (152491462785082, 6, '[]');
INSERT INTO `t_cart` VALUES (152491471765386, 7, '[]');
INSERT INTO `t_cart` VALUES (152491500907119, 8, '[]');
INSERT INTO `t_cart` VALUES (152491511273236, 9, '[]');

-- ----------------------------
-- Table structure for t_item
-- ----------------------------
DROP TABLE IF EXISTS `t_item`;
CREATE TABLE `t_item`  (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `auther` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `itemdesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(50, 2) NULL DEFAULT NULL,
  `num` int(20) NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` bigint(20) NULL DEFAULT NULL,
  `status` int(50) NULL DEFAULT 1,
  `created` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `updated` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sold` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`item_id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  CONSTRAINT `t_item_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `t_itemcat` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1220 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_item
-- ----------------------------
INSERT INTO `t_item` VALUES (1101, '山本（精装 贾平凹2018年新作）', '贾平凹 著', '一部震撼人心的民间秘史，一部描绘秦岭的百科全书。一条龙脉，横亘在那里，提携了黄河长江，统领着北方南方。这就是秦岭，中国*伟大的山。', 44.30, 997, '1524903051800952,1524903051800270,1524903051802817,', 152490269430513, 1, '2018/04/28-16:10:52', '2018/04/28-16:10:52', 3);
INSERT INTO `t_item` VALUES (1110, '小王子三部曲', '[法] 圣-埃克苏佩里 著，金祎 徐丽松 缪咏华 译', '一直以来，我们只读了《小王子》的三分之一！《小王子》只是三部曲的终篇，它的前传《风沙星辰》《夜间飞行》埋藏着《小王子》真正的深层意义。只有阅读完整的《小王子三部曲》，才能真正读懂《小王子》。读客出品', 72.40, 1000, '1524902942234894,1524902942234593,1524902942242604,', 152490269430513, 1, '2018/04/28-16:09:04', '2018/04/28-16:09:04', 0);
INSERT INTO `t_item` VALUES (1111, '镜头里的世界名校', '周成刚', '镜头里的世界名校 新东方CEO周成刚聚焦世界名校风采影像集', 60.20, 995, '1524883821840464,1524883821840822,1524883821840881,1524883821840389,1524883821880426,1524883821895126,', 152488338188474, 1, '2018/04/28-10:50:28', '2018/04/28-11:20:11', 10);
INSERT INTO `t_item` VALUES (1112, '教育部新编语文教材八年级下册推荐阅读', '傅雷，朱光潜', '教育部新编语文教材八年级下册推荐阅读，《傅雷家书》《钢铁是怎样炼成的》《给青年的十二封信》《名人传》', 81.70, 1000, '1524887586397384,1524887586398621,1524887586403010,1524887586490008,', 152488338188474, 1, '2018/04/28-11:53:08', '2018/04/28-11:53:08', 0);
INSERT INTO `t_item` VALUES (1113, '星火英语 英语四级真题试卷', '汪开虎', '星火英语 英语四级真题试卷 2018年6月全真试题+标准模拟 词汇写作翻译听力阅读口语', 36.80, 998, '1524888036929073,1524888036937085,1524888036937874,', 152488338188474, 1, '2018/04/28-12:00:38', '2018/04/28-12:00:38', 2);
INSERT INTO `t_item` VALUES (1114, '基金从业资格考试教材', '基金从业资格考试命题研究中心', '基金从业资格考试教材2018 大途官方正版：证券投资基金基础知识+基金法律法规 职业道德 教材+模拟预测试卷 赠速记手册（实收共6册）', 72.20, 998, '1524888139501830,1524888139500024,1524888139506658,', 152488338188474, 1, '2018/04/28-12:02:20', '2018/04/28-12:02:20', 2);
INSERT INTO `t_item` VALUES (1115, '朝花夕拾', '鲁迅 著，卢沉 绘', '朝花夕拾/中小学生必读丛书-教育部推荐新课标同步课外阅读 红星照耀中国，新课标助力成长，教育部推荐新课标同步课外阅读', 13.20, 998, '1524888325668519,1524888325676560,1524888325676593,1524888325676216,', 152488338188474, 1, '2018/04/28-12:05:27', '2018/04/28-12:05:27', 2);
INSERT INTO `t_item` VALUES (1116, '英语语法看这本就够了大全集', '24.90', '英语语法看这本就够了大全集', 24.90, 999, '1524888521912719,1524888521924982,1524888521929279,', 152488338188474, 1, '2018/04/28-12:08:43', '2018/04/28-12:08:43', 1);
INSERT INTO `t_item` VALUES (1117, '亲近母语 日有所诵 第五版', '薛瑞萍，徐冬梅，邱凤莲 编', '儿童诵读品牌亲近母语，新闻出版总署百种推荐优秀图书之一；全新版本；拼音标注、超过1500万的孩子使用', 12.40, 997, '1524889715619898,', 152488338188474, 1, '2018/04/28-12:10:31', '2018/04/28-12:34:33', 3);
INSERT INTO `t_item` VALUES (1118, '五三 2019A版 高考物理', '曲一线 著', '五三 2019A版 高考物理（新课标专用）5年高考3年模拟 曲一线科学备考 你的坚持，终将美好。2018高考加油！', 49.60, 999, '1524888725461326,1524888725461203,', 152488338188474, 1, '2018/04/28-12:12:06', '2018/04/28-12:12:06', 1);
INSERT INTO `t_item` VALUES (1119, '后来的我们', '刘若英，英儿工作室 著', '京东专享导演签名版。刘若英执导的电影《后来的我们》同名作品，收录作者全新创作的18篇随笔以及电影原著小说，转变中蜕变，为梦想，为心爱。张一白、井柏然、周冬雨、李屏宾倾情推荐。', 35.10, 1000, '1524902785394203,1524902785428581,', 152490269430513, 1, '2018/04/28-16:06:26', '2018/04/28-16:06:26', 0);
INSERT INTO `t_item` VALUES (1200, '山本', '贾平凹 著', '一个发生在乱世时期的互为知己般的绝美爱情； 一部写尽人间纠结苦痛和欲望，瞻远未来的现代启示录； 《山本》，当代中国集叛逆性、创造精神和广泛影响力于一身的作家——贾平凹的全新旷世奇书！', 38.40, 1000, '1524903229711212,1524903229711139,', 152490269430513, 1, '2018/04/28-16:13:55', '2018/04/28-16:13:55', 0);
INSERT INTO `t_item` VALUES (1201, '边城（纪念版）', '沈从文 著', '1. 精选10篇沈从文具“人性美”的小说代表作，新修订纪念典藏版！ 　　2. 一首哀婉凄美的田园牧歌，美得让人神往，脆弱得令人心疼…… 　　3. 现代版《桃花源记》，重寻湘西世界的自由朴野之美。 　　4. 琉璃般透明的世界，守护着人性中的至真、至善与至美。 　　5. 平凡中显现伟大、琐碎中透露深刻的边地故事，涤荡出琉璃般的纯粹与凄美。', 15.60, 999, '1524903360800569,1524903360806657,1524903360806669,', 152490269430513, 1, '2018/04/28-16:16:06', '2018/04/28-16:16:06', 1);
INSERT INTO `t_item` VALUES (1202, '浮生六记（汪涵推荐，全译本，畅销150万册）', '沈复 著，张佳玮 译', '“我们要学会用美的眼光，去发现周遭的一切。”《人民日报》推荐书目，京东图书2017年度十大畅销书，畅销150万册。白话精心译述，民国本精校原文欣赏，更好读懂中国挚美经典！', 22.00, 997, '1524903659884019,1524903659884187,1524903659889750,', 152490269430513, 1, '2018/04/28-16:21:01', '2018/04/28-16:21:01', 3);
INSERT INTO `t_item` VALUES (1203, '瓦尔登湖（李继宏导读注释版）', '[美] 亨利.戴维.梭罗 著，李继宏 译', '清华大学校长邱勇推荐。159年来《瓦尔登湖》中文译本。百万畅销书《小王子》《追风筝的人》《与神对话》译者李继宏译作。', 28.40, 999, '1524903782956957,1524903782972720,1524903782972225,', 152490269430513, 1, '2018/04/28-16:23:09', '2018/04/28-16:23:09', 1);
INSERT INTO `t_item` VALUES (1204, '我们仨/杨绛作品', '杨绛 著', '一百零五岁的杨绛，以简洁而沉重的语言，回忆了女儿钱瑗、丈夫钱钟书，一家三口那些快乐而艰难、爱与痛的日子。故事证明：家庭是人生的庇护所。', 12.20, 1000, '1524903948454155,1524903948460355,', 152490269430513, 1, '2018/04/28-16:25:54', '2018/04/28-16:25:54', 0);
INSERT INTO `t_item` VALUES (1205, '人生因孤独而丰盛', '周国平 著', '人生因孤独而丰盛', 32.10, 998, '1524904551141079,1524904551147524,1524904551147054,', 152490269430513, 1, '2018/04/28-16:35:52', '2018/04/28-16:35:52', 2);
INSERT INTO `t_item` VALUES (1206, '思维简史：从丛林到宇宙', '伦纳德蒙洛迪诺 著，龚瑞 译', '霍金推荐！吴军、万维钢作序推荐！《时间简史》第二作者为你讲述人类“认知升级”的千年历程', 51.00, 999, '1524904928382438,1524904928382571,1524904928389136,1524904928389935,', 152490464804366, 1, '2018/04/28-16:42:09', '2018/04/28-16:42:09', 1);
INSERT INTO `t_item` VALUES (1207, '高效前端：Web高效编程与优化实践', '李银城 著', '知乎著名前端专栏作者/前端类话题优秀答主/人人网资深前端工程师经验总结，从技能修炼和思想提升2个维度总结出34个高效编程和应用优化的实践方法', 71.80, 999, '1524905055007030,', 152490464804366, 1, '2018/04/28-16:44:16', '2018/04/28-16:44:16', 1);
INSERT INTO `t_item` VALUES (1208, 'BBC全新4K海洋百科：蓝色星球II', '[英] 詹姆斯.霍尼伯内，马克.布朗罗 著', '蓝色星球2历时5年制作，125次探险，全球39个国家，6000小时水下拍摄！尖端科技装备，全程4K高清，抵达深海禁区！众多首次发现，刷新认知！自然纪录片之父大卫?爱登堡作序推荐！', 118.00, 1000, '1524905484778596,1524905484849970,1524905484849680,1524905484849340,1524905484850282,', 152490464804366, 1, '2018/04/28-16:51:26', '2018/04/28-16:51:26', 0);
INSERT INTO `t_item` VALUES (1209, '三磅宇宙与神奇心智 2017中国好书获奖作品', '顾凡及 著', '“2017中国好书”，《读书》栏目主持人李潘推荐，陈宜张院士倾情作序。', 37.80, 1000, '1524905570710207,1524905570710560,1524905570710594,', 152490464804366, 1, '2018/04/28-16:52:51', '2018/04/28-16:52:51', 0);
INSERT INTO `t_item` VALUES (1210, '寻找薛定谔的猫：量子物理的奇异世界', '[英] 约翰·格里宾 著，张广才 等 译', '这只不死不活的猫总是像噩梦一样让物理学家们不得安宁……  全面论述了量子理论的基本概念，并赋予那些无限复杂又伤脑筋的实验以生机，使我们可以毫不费力地把握现代量子力学之迷。', 22.00, 996, '1524905861393559,1524905861393413,1524905861393811,', 152490464804366, 1, '2018/04/28-16:57:42', '2018/04/28-16:57:42', 4);
INSERT INTO `t_item` VALUES (1211, '13次时空穿梭之旅（精装）', '科林·斯图尔特（Colin Stuart） 著，孙亚飞 译', '《人民日报》推荐阅读，英国皇家科学院年度新作，欧洲现象级科普读物，跟随久负盛名的科学家穿越100多年的科学探索历程，开启1881年至今的人类太空梦想与科学探索', 40.60, 1000, '1524905978656691,1524905978656364,1524905978656053,', 152490464804366, 1, '2018/04/28-16:59:40', '2018/04/28-16:59:40', 0);
INSERT INTO `t_item` VALUES (1212, '码书 编码与解码的战争', '[英] 西蒙.辛格（Simon Singh） 著，刘燕芬 译', '世界著名科普作家西蒙·辛格经典力作 3000年来，人类智慧的另类对决', 51.00, 998, '1524906119029186,1524906119029640,1524906119029386,', 152490464804366, 1, '2018/04/28-17:02:00', '2018/04/28-17:02:00', 2);
INSERT INTO `t_item` VALUES (1213, '给孩子讲相对论：让孩子轻松读懂爱因斯坦的伟大理论', '李淼，王爽 著', '马云、徐小平、罗振宇的“私享课”老师，畅销科普《给孩子讲量子力学》作者、大物理学家李淼教授带孩子轻松读懂相对论，刘慈欣、吴国盛诚挚推荐', 26.80, 1000, '1524906232632250,', 152490464804366, 1, '2018/04/28-17:03:53', '2018/04/28-17:03:53', 0);
INSERT INTO `t_item` VALUES (1214, '纽约 一座超级城市是如何运转的', '[美] 凯特·阿歇尔 著，潘文捷 译', '一本解读繁华都市运转奥秘的百科全书，每个对世界心怀好奇的人都值得拥有，知乎大V联袂推荐', 126.00, 999, '1524906437590332,1524906437591611,1524906437590177,', 152490464804366, 1, '2018/04/28-17:07:18', '2018/04/28-17:07:18', 1);
INSERT INTO `t_item` VALUES (1215, '中国科幻基石丛书·三体（套装1-3册）', '刘慈欣 著', '亚洲首位雨果奖得主 十届银河奖得主 中国科幻大师巨作 万千科幻迷翘首以待，获2015科幻文坛荣誉“雨果奖”', 64.20, 999, '1524908087379124,1524908087382542,', 152490802593293, 1, '2018/04/28-17:34:52', '2018/04/28-17:34:52', 1);
INSERT INTO `t_item` VALUES (1216, '银河帝国全套1-15册', '艾萨克阿西莫夫著 叶李华译', '正版包邮 银河帝国全套1-15册 基地七部曲+机器人五部曲+帝国三部曲 阿西莫夫外国科幻小说书籍', 328.00, 1000, '1524908224172993,1524908224172758,1524908224172951,', 152490802593293, 1, '2018/04/28-17:37:05', '2018/04/28-17:37:05', 0);
INSERT INTO `t_item` VALUES (1217, '沙丘：伟大的《沙丘》系列1-3', '[美] 弗兰克·赫伯特（Frank Herbert） 著，潘振华，苏益群，张建光 校', '伟大的《沙丘》系列，每个“不可不读”的书单上都有《沙丘》！雨果奖、星云奖双奖作品，摘得轨迹杂志“20世纪科幻小说”桂冠！人类每次正视自己的渺小，都是自身的一次巨大进步。读客出品', 87.50, 999, '1524908336578061,1524908336578303,1524908336578501,', 152490802593293, 1, '2018/04/28-17:38:57', '2018/04/28-17:38:57', 1);
INSERT INTO `t_item` VALUES (1218, '虫.中国获奖科幻文学大系', '刘慈欣 等 著', '北京天文馆、北京UFO研究会联袂举荐：科幻文学“银河奖”获奖作品系列，中国的“阿西莫夫”2015年“中国好书”及雨果奖得主，《三体》作者刘慈欣领衔，中国科幻群星，历届银河奖得主共同打造中国科幻新纪元！', 112.80, 1000, '1524908427904671,', 152490802593293, 1, '2018/04/28-17:40:28', '2018/04/28-17:40:28', 0);
INSERT INTO `t_item` VALUES (1219, '星际远征+变型战争+生存实验+流浪地球', '刘慈欣 王晋康 何夕 著', '星际远征+变型战争+生存实验+流浪地球 共4册 科幻小说 刘慈欣 王晋康 何夕', 88.00, 999, '1524908524330598,1524908524338422,1524908524344777,', 152490802593293, 1, '2018/04/28-17:42:05', '2018/04/28-17:42:05', 1);

-- ----------------------------
-- Table structure for t_itemcat
-- ----------------------------
DROP TABLE IF EXISTS `t_itemcat`;
CREATE TABLE `t_itemcat`  (
  `id` bigint(50) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_itemcat
-- ----------------------------
INSERT INTO `t_itemcat` VALUES (152488338188474, '教育', '2018/04/28-10:43:01');
INSERT INTO `t_itemcat` VALUES (152490269430513, '文学', '2018/04/28-16:04:54');
INSERT INTO `t_itemcat` VALUES (152490464804366, '科技', '2018/04/28-16:37:28');
INSERT INTO `t_itemcat` VALUES (152490802593293, '科幻小说', '2018/04/28-17:33:45');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `order_id` bigint(50) NULL DEFAULT NULL,
  `user_id` bigint(50) NULL DEFAULT NULL,
  `price` double(20, 2) NULL DEFAULT NULL,
  `phone` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (152489165391791, 1, 60.00, '12345678901', '四川雅安四川农业大学\r\n', '2018/04/28-13:00:53');
INSERT INTO `t_order` VALUES (152490956251824, 1, 37.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-17:59:22');
INSERT INTO `t_order` VALUES (152491434723375, 2, 60.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:19:07');
INSERT INTO `t_order` VALUES (152491436976579, 2, 25.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:19:29');
INSERT INTO `t_order` VALUES (152491439218100, 2, 12.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:19:52');
INSERT INTO `t_order` VALUES (152491442068540, 3, 12.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:20:20');
INSERT INTO `t_order` VALUES (152491443870884, 3, 50.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:20:38');
INSERT INTO `t_order` VALUES (152491447285230, 3, 13.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:21:12');
INSERT INTO `t_order` VALUES (152491450543554, 4, 44.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:21:45');
INSERT INTO `t_order` VALUES (152491452086128, 4, 28.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:22:00');
INSERT INTO `t_order` VALUES (152491453497375, 4, 12.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:22:14');
INSERT INTO `t_order` VALUES (152491456529237, 5, 51.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:22:45');
INSERT INTO `t_order` VALUES (152491458482058, 5, 22.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:23:04');
INSERT INTO `t_order` VALUES (152491460310806, 5, 13.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:23:23');
INSERT INTO `t_order` VALUES (152491462977227, 6, 22.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:23:49');
INSERT INTO `t_order` VALUES (152491465306295, 6, 22.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:24:13');
INSERT INTO `t_order` VALUES (152491466842897, 6, 51.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:24:28');
INSERT INTO `t_order` VALUES (152491468701403, 6, 126.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:24:47');
INSERT INTO `t_order` VALUES (152491471911663, 7, 72.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:25:19');
INSERT INTO `t_order` VALUES (152491473409245, 7, 60.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:25:34');
INSERT INTO `t_order` VALUES (152491475338111, 7, 87.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:25:53');
INSERT INTO `t_order` VALUES (152491491543786, 7, 22.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:28:35');
INSERT INTO `t_order` VALUES (152491501078118, 8, 72.20, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:30:10');
INSERT INTO `t_order` VALUES (152491503788487, 8, 64.20, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:30:37');
INSERT INTO `t_order` VALUES (152491506283608, 8, 51.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:31:02');
INSERT INTO `t_order` VALUES (152491508838886, 8, 32.10, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:31:28');
INSERT INTO `t_order` VALUES (152491511575616, 9, 44.30, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:31:55');
INSERT INTO `t_order` VALUES (152491513742095, 9, 32.10, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:32:17');
INSERT INTO `t_order` VALUES (152491515652347, 9, 22.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:32:36');
INSERT INTO `t_order` VALUES (152491517181103, 9, 22.00, '12345678901', '四川雅安四川农业大学', '2018/04/28-19:32:51');
INSERT INTO `t_order` VALUES (152492776106967, 1, 36.80, '12345678901', '四川雅安四川农业大学', '2018/04/28-23:02:41');
INSERT INTO `t_order` VALUES (152492778369845, 1, 72.20, '12345678901', '四川雅安四川农业大学', '2018/04/28-23:03:03');
INSERT INTO `t_order` VALUES (152492780851579, 1, 60.20, '12345678901', '四川雅安四川农业大学', '2018/04/28-23:03:28');
INSERT INTO `t_order` VALUES (152498565278159, 1, 15.60, '12345678901', '四川雅安四川农业大学', '2018/04/29-15:07:32');
INSERT INTO `t_order` VALUES (152505525968503, 1, 88.00, '12345678901', '四川雅安四川农业大学', '2018/04/30-10:27:39');
INSERT INTO `t_order` VALUES (152505670330937, 8, 22.00, '12345678901', '四川雅安四川农业大学', '2018/04/30-10:51:43');

-- ----------------------------
-- Table structure for t_orderdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_orderdetail`;
CREATE TABLE `t_orderdetail`  (
  `id` bigint(50) NOT NULL,
  `order_id` bigint(50) NULL DEFAULT NULL,
  `user_id` bigint(50) NULL DEFAULT NULL,
  `item_id` bigint(50) NULL DEFAULT NULL,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rate` float(5, 2) NULL DEFAULT NULL,
  `comment` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `comment_date` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `t_orderdetail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`order_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_orderdetail_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `t_item` (`item_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `t_orderdetail_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_orderdetail
-- ----------------------------
INSERT INTO `t_orderdetail` VALUES (152489165395063, 152489165391791, 1, 1111, 'yang', 1, 60.00, '镜头里的世界名校', 3.00, '顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-13:01:03');
INSERT INTO `t_orderdetail` VALUES (152490956257666, 152490956251824, 1, 1113, 'yang', 1, 37.00, '星火英语 英语四级真题试卷', 4.00, '顶顶顶顶顶顶顶顶顶顶', '2018/04/28-18:00:42');
INSERT INTO `t_orderdetail` VALUES (152491434735810, 152491434723375, 2, 1111, 'test', 1, 60.00, '镜头里的世界名校', 3.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:19:17');
INSERT INTO `t_orderdetail` VALUES (152491436987208, 152491436976579, 2, 1116, 'test', 1, 25.00, '英语语法看这本就够了大全集', 3.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:19:39');
INSERT INTO `t_orderdetail` VALUES (152491439222708, 152491439218100, 2, 1117, 'test', 1, 12.00, '亲近母语 日有所诵 第五版', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶的', '2018/04/28-19:20:02');
INSERT INTO `t_orderdetail` VALUES (152491442073923, 152491442068540, 3, 1117, 'test1', 1, 12.00, '亲近母语 日有所诵 第五版', 3.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶的', '2018/04/28-19:20:31');
INSERT INTO `t_orderdetail` VALUES (152491443875100, 152491443870884, 3, 1118, 'test1', 1, 50.00, '五三 2019A版 高考物理', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶的', '2018/04/28-19:20:46');
INSERT INTO `t_orderdetail` VALUES (152491447288294, 152491447285230, 3, 1115, 'test1', 1, 13.00, '朝花夕拾', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶的', '2018/04/28-19:21:22');
INSERT INTO `t_orderdetail` VALUES (152491450560593, 152491450543554, 4, 1101, 'test2', 1, 44.00, '山本（精装 贾平凹2018年新作）', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:21:52');
INSERT INTO `t_orderdetail` VALUES (152491452091179, 152491452086128, 4, 1203, 'test2', 1, 28.00, '瓦尔登湖（李继宏导读注释版）', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:22:07');
INSERT INTO `t_orderdetail` VALUES (152491453500150, 152491453497375, 4, 1117, 'test2', 1, 12.00, '亲近母语 日有所诵 第五版', 3.50, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:22:22');
INSERT INTO `t_orderdetail` VALUES (152491456534692, 152491456529237, 5, 1206, 'test3', 1, 51.00, '思维简史：从丛林到宇宙', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:22:54');
INSERT INTO `t_orderdetail` VALUES (152491458485997, 152491458482058, 5, 1210, 'test3', 1, 22.00, '寻找薛定谔的猫：量子物理的奇异世界', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:23:11');
INSERT INTO `t_orderdetail` VALUES (152491460316094, 152491460310806, 5, 1115, 'test3', 1, 13.00, '朝花夕拾', 3.50, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:23:32');
INSERT INTO `t_orderdetail` VALUES (152491462981622, 152491462977227, 6, 1210, 'test4', 1, 22.00, '寻找薛定谔的猫：量子物理的奇异世界', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:23:58');
INSERT INTO `t_orderdetail` VALUES (152491465308558, 152491465306295, 6, 1202, 'test4', 1, 22.00, '浮生六记（汪涵推荐，全译本，畅销150万册）', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:24:20');
INSERT INTO `t_orderdetail` VALUES (152491466847441, 152491466842897, 6, 1212, 'test4', 1, 51.00, '码书 编码与解码的战争', 3.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:24:36');
INSERT INTO `t_orderdetail` VALUES (152491468704202, 152491468701403, 6, 1214, 'test4', 1, 126.00, '纽约 一座超级城市是如何运转的', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:24:57');
INSERT INTO `t_orderdetail` VALUES (152491471914300, 152491471911663, 7, 1207, 'test5', 1, 72.00, '高效前端：Web高效编程与优化实践', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:25:26');
INSERT INTO `t_orderdetail` VALUES (152491473412243, 152491473409245, 7, 1111, 'test5', 1, 60.00, '镜头里的世界名校', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:25:40');
INSERT INTO `t_orderdetail` VALUES (152491475344560, 152491475338111, 7, 1217, 'test5', 1, 87.00, '沙丘：伟大的《沙丘》系列1-3', 2.50, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:26:00');
INSERT INTO `t_orderdetail` VALUES (152491491546504, 152491491543786, 7, 1202, 'test5', 1, 22.00, '浮生六记（汪涵推荐，全译本，畅销150万册）', 3.00, '顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:28:48');
INSERT INTO `t_orderdetail` VALUES (152491501088092, 152491501078118, 8, 1114, 'test6', 1, 72.20, '基金从业资格考试教材', 3.50, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:30:18');
INSERT INTO `t_orderdetail` VALUES (152491503793807, 152491503788487, 8, 1215, 'test6', 1, 64.20, '中国科幻基石丛书·三体（套装1-3册）', 5.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:30:46');
INSERT INTO `t_orderdetail` VALUES (152491506287233, 152491506283608, 8, 1212, 'test6', 1, 51.00, '码书 编码与解码的战争', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:31:08');
INSERT INTO `t_orderdetail` VALUES (152491508841831, 152491508838886, 8, 1205, 'test6', 1, 32.10, '人生因孤独而丰盛', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:31:34');
INSERT INTO `t_orderdetail` VALUES (152491511578671, 152491511575616, 9, 1101, 'test7', 1, 44.30, '山本（精装 贾平凹2018年新作）', 1.50, '顶顶顶顶顶顶顶顶顶顶顶顶订单', '2018/04/28-19:32:05');
INSERT INTO `t_orderdetail` VALUES (152491513745454, 152491513742095, 9, 1205, 'test7', 1, 32.10, '人生因孤独而丰盛', 3.50, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:32:23');
INSERT INTO `t_orderdetail` VALUES (152491515657711, 152491515652347, 9, 1210, 'test7', 1, 22.00, '寻找薛定谔的猫：量子物理的奇异世界', 3.50, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:32:44');
INSERT INTO `t_orderdetail` VALUES (152491517183358, 152491517181103, 9, 1202, 'test7', 1, 22.00, '浮生六记（汪涵推荐，全译本，畅销150万册）', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-19:32:58');
INSERT INTO `t_orderdetail` VALUES (152492776109567, 152492776106967, 1, 1113, 'yang', 1, 36.80, '星火英语 英语四级真题试卷', 3.50, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-23:02:54');
INSERT INTO `t_orderdetail` VALUES (152492778374158, 152492778369845, 1, 1114, 'yang', 1, 72.20, '基金从业资格考试教材', 4.50, '顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-23:03:09');
INSERT INTO `t_orderdetail` VALUES (152492780855301, 152492780851579, 1, 1111, 'yang', 1, 60.20, '镜头里的世界名校', 4.50, '顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/28-23:03:38');
INSERT INTO `t_orderdetail` VALUES (152498565284414, 152498565278159, 1, 1201, 'yang', 1, 15.60, '边城（纪念版）', 3.50, '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/29-15:09:27');
INSERT INTO `t_orderdetail` VALUES (152505525974229, 152505525968503, 1, 1219, 'yang', 1, 88.00, '星际远征+变型战争+生存实验+流浪地球', 4.00, '顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018/04/30-10:27:50');
INSERT INTO `t_orderdetail` VALUES (152505670333396, 152505670330937, 8, 1210, 'test6', 1, 22.00, '寻找薛定谔的猫：量子物理的奇异世界', 4.00, '顶顶顶顶顶顶顶顶顶顶顶', '2018/04/30-10:51:52');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` bigint(50) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'yang', 'quentinyy@gmail.com', '12345', '12345678901', '四川雅安四川农业大学');
INSERT INTO `t_user` VALUES (2, 'test', 'test@test.com', '12345', '12345678901', '四川雅安四川农业大学');
INSERT INTO `t_user` VALUES (3, 'test1', 'test@test.com', '12345', '12345678901', '四川雅安四川农业大学');
INSERT INTO `t_user` VALUES (4, 'test2', 'test@test.com', '12345', '12345678901', '四川雅安四川农业大学');
INSERT INTO `t_user` VALUES (5, 'test3', 'test@test.com', '12345', '12345678901', '四川雅安四川农业大学');
INSERT INTO `t_user` VALUES (6, 'test4', 'test@test.com', '12345', '12345678901', '四川雅安四川农业大学');
INSERT INTO `t_user` VALUES (7, 'test5', 'test@test.com', '12345', '12345678901', '四川雅安四川农业大学');
INSERT INTO `t_user` VALUES (8, 'test6', 'test@test.com', '12345', '12345678901', '四川雅安四川农业大学');
INSERT INTO `t_user` VALUES (9, 'test7', 'test@test.com', '12345', '12345678901', '四川雅安四川农业大学');

-- ----------------------------
-- View structure for data
-- ----------------------------
DROP VIEW IF EXISTS `data`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `data` AS select `t_orderdetail`.`user_id` AS `user_id`,`t_orderdetail`.`item_id` AS `item_id`,`t_orderdetail`.`rate` AS `rate`,`t_order`.`date` AS `time` from (`t_orderdetail` join `t_order` on((`t_orderdetail`.`order_id` = `t_order`.`order_id`)));

SET FOREIGN_KEY_CHECKS = 1;
