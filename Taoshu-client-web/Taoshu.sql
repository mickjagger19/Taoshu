create database taobaostyle;

use taobaostyle;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `guestbook`;
CREATE TABLE `guestbook`  (
  `g_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言表主键',
  `g_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言内容',
  `g_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '留言时间',
  `g_support` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点赞数',
  `g_states` int(1) NULL DEFAULT NULL COMMENT '1可用，0不可用',
  `u_id` int(11) NULL DEFAULT NULL COMMENT '留言的账户id',
  `gc_id` int(11) NULL DEFAULT NULL COMMENT 'G_CLASS_id',
  PRIMARY KEY (`g_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of guestbook
-- ----------------------------
INSERT INTO `guestbook` VALUES (1, '留言内容', '2019-01-03 14:47:53', '11', 1, 1, 1);
INSERT INTO `guestbook` VALUES (2, '我也是来测试的啊┭┮﹏┭┮  QAQ、', '2019-01-03 15:49:15', '25', 1, 2, 2);
INSERT INTO `guestbook` VALUES (3, 'sddddddddddddddd', '2019-01-07 12:22:37', '22', 1, 1, 3);
INSERT INTO `guestbook` VALUES (4, 'qqqqqqqqqqqq', '2019-01-07 12:22:41', '1', 1, 1, 4);
INSERT INTO `guestbook` VALUES (5, '233333', '2019-01-07 12:23:59', '2', 1, 1, 3);
INSERT INTO `guestbook` VALUES (6, '4444444444444445555555555555566666666666', '2019-01-07 12:30:26', '0', 1, 1, 4);


DROP TABLE IF EXISTS `guestbook_class`;
CREATE TABLE `guestbook_class`  (
  `gc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `gc_class` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`gc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


INSERT INTO `guestbook_class` VALUES (1, 'primary');
INSERT INTO `guestbook_class` VALUES (2, 'success');
INSERT INTO `guestbook_class` VALUES (3, 'info');
INSERT INTO `guestbook_class` VALUES (4, 'warning');
INSERT INTO `guestbook_class` VALUES (5, 'danger');

-- ----------------------------
-- Table structure for history_info
-- 浏览历史
-- ----------------------------
DROP TABLE IF EXISTS `history_info`;
CREATE TABLE `history_info`  (
  `h_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '历史纪录表id',
  `g_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  `u_id` int(11) NULL DEFAULT NULL COMMENT '历史纪录所属账户id',
  `p_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `h_states` int(1) NULL DEFAULT NULL COMMENT '状态码：1可用，0不可用',
  PRIMARY KEY (`h_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of history_info
-- ----------------------------
INSERT INTO `history_info` VALUES (1, '2019-01-03 17:53:32', 1, 31, 1);
INSERT INTO `history_info` VALUES (2, '2019-01-04 17:39:24', 1, 32, 1);
INSERT INTO `history_info` VALUES (3, '2019-01-04 17:39:37', 1, 33, 1);
INSERT INTO `history_info` VALUES (4, '2019-01-07 18:01:49', 5, 23, 1);
INSERT INTO `history_info` VALUES (5, '2019-01-07 18:01:53', 5, 24, 1);
INSERT INTO `history_info` VALUES (6, '2019-01-07 18:02:00', 5, 21, 1);
-- Table structure for newaddress
-- 地址
-- ----------------------------
DROP TABLE IF EXISTS `newaddress`;
CREATE TABLE `newaddress`  (
  `na_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新建地址id',
  `na_province` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `na_city` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `na_district` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '县/区',
  `na_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人名字',
  `na_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人电话',
  `particular_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `na_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  `u_id` int(11) NULL DEFAULT NULL COMMENT '账户id',
  `na_states` int(1) NULL DEFAULT NULL COMMENT '状态码：1可用，0不可用',
  PRIMARY KEY (`na_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of newaddress
-- ----------------------------
INSERT INTO `newaddress` VALUES (1, '江西省', '抚州市', '金溪县', 'mimi', '18756665555', '马猴烧酒', '2019-01-03 17:05:29', 1, 1);
INSERT INTO `newaddress` VALUES (2, '浙江', '金华', '义乌市', 'kokm', '15845654127', '详细地址', '2019-01-03 17:04:50', 1, 1);
INSERT INTO `newaddress` VALUES (3, '浙江', '金华', '义乌市', 'naji', '15845654127', '村子里最高的茅草屋', '2019-01-03 17:04:31', 2, 1);
INSERT INTO `newaddress` VALUES (4, '浙江', '金华', '义乌市', 'humo', '15845654127', '详细地址', '2019-01-03 17:04:32', 2, 1);
INSERT INTO `newaddress` VALUES (5, '222222', '北京市市辖区', '东城区', '222222', '222222', NULL, '2019-01-07 14:45:14', 1, NULL);
INSERT INTO `newaddress` VALUES (6, '34444', '九江市', '彭泽县', '567', '4567', NULL, '2019-01-07 17:34:34', 4, NULL);
INSERT INTO `newaddress` VALUES (7, '河南省', '周口市', '商水县', 'qwer', '4396', '0.0', '2019-01-07 17:51:22', 5, 1);

-- Table structure for orderform
-- 订单
-- ----------------------------
DROP TABLE IF EXISTS `orderform`;
CREATE TABLE `orderform`  (
  `o_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单主键',
  `o_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  `o_pcounts` int(11) NULL DEFAULT NULL COMMENT '订单中商品数量',
  `o_sum` double(11, 2) NULL DEFAULT NULL COMMENT '订单总额',
  `u_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `na_id` int(11) NULL DEFAULT NULL COMMENT '地址id',
  `o_states` int(1) NULL DEFAULT NULL COMMENT '状态码：1可用，0不可用',
  PRIMARY KEY (`o_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderform
-- ----------------------------
INSERT INTO `orderform` VALUES (2, '2019-01-03 17:29:20', 2, 23.00, 1, 2, 1);
INSERT INTO `orderform` VALUES (6, '2019-01-07 17:28:59', 2, 466.00, 1, 5, 1);
INSERT INTO `orderform` VALUES (7, '2019-01-07 17:34:37', 1, 233.00, 4, 5, 1);
INSERT INTO `orderform` VALUES (9, '2019-01-07 17:51:47', 1, 2333.00, 5, 7, 1);
INSERT INTO `orderform` VALUES (10, '2019-01-07 17:51:47', 2, 44.00, 5, 7, 1);
INSERT INTO `orderform` VALUES (11, '2019-01-07 17:52:09', 1, 233.00, 5, 7, 1);

-- ----------------------------
-- Table structure for orderfrom_product
-- ----------------------------
DROP TABLE IF EXISTS `orderfrom_product`;
CREATE TABLE `orderfrom_product`  (
  `op_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单和商品中间表主键',
  `o_id` int(11) NULL DEFAULT NULL COMMENT '订单表id',
  `p_id` int(11) NULL DEFAULT NULL COMMENT '商品表id',
  PRIMARY KEY (`op_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderfrom_product
-- ----------------------------
INSERT INTO `orderfrom_product` VALUES (1, 1, 31);
INSERT INTO `orderfrom_product` VALUES (2, 1, 32);
INSERT INTO `orderfrom_product` VALUES (3, 6, 22);
INSERT INTO `orderfrom_product` VALUES (4, 7, 22);
INSERT INTO `orderfrom_product` VALUES (5, 8, 68);
INSERT INTO `orderfrom_product` VALUES (6, 9, 54);
INSERT INTO `orderfrom_product` VALUES (7, 10, 61);
INSERT INTO `orderfrom_product` VALUES (8, 11, 21);

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品表主键',
  `p_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `p_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品类型',
  `p_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片所在路径',
  `p_oriprice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品原价',
  `p_price` double(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `p_stock` int(11) NULL DEFAULT NULL COMMENT '商品剩余量',
  `p_intro` varchar(255) NULL DEFAULT NULL COMMENT '商品剩余量',
  `p_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '商品上架时间',
  FULLTEXT (p_name,p_intro),
  PRIMARY KEY (`p_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for shoppingcar
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcar`;
CREATE TABLE `shoppingcar`  (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车表主键',
  `s_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '加入购物车的时间',
  `p_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `u_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `s_pcounts` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `s_states` int(2) NULL DEFAULT NULL COMMENT '1可用，2结算中，0不可用',
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shoppingcar
-- ----------------------------
INSERT INTO `shoppingcar` VALUES (2, '2019-01-06 20:35:27', 31, 2, 1, 1);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表主键',
  `u_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `u_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号',
  `u_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `u_level` int(1) NULL DEFAULT NULL COMMENT '1普通会员，2高级会员，0管理员',
  `u_balance` double(11, 2) NULL DEFAULT NULL COMMENT '账户余额',
  `u_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Email',
  `u_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `u_states` int(1) NULL DEFAULT NULL COMMENT '1可用，0不可用',
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, '管理员', 'admin', '123456', 0, 222.00, '23456@qq.com', '13378541254', 1);
INSERT INTO `user_info` VALUES (2, '小明同学', 'xiaoming', '123456', 1, 0.00, '999@qq.com', '12345678901', 1);
INSERT INTO `user_info` VALUES (3, '第一个测试', 'abcabc', 'abcabc', 1, 0.00, '123@qq.com', '13758258278', 1);
INSERT INTO `user_info` VALUES (4, '这是测试1', 'test123', '123456', 1, 0.00, '1251@qq.com', '13777777777', 1);
INSERT INTO `user_info` VALUES (5, '测试2', 'test1234', '123456', 1, 0.00, '123@qq.com', '13888888888', 1);

SET FOREIGN_KEY_CHECKS = 1;
