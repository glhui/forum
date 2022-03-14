/*
Navicat MySQL Data Transfer

Source Server         : aliyun
Source Server Version : 50732
Source Host           : 121.196.167.199:3306
Source Database       : anime_bbs

Target Server Type    : MYSQL
Target Server Version : 50732
File Encoding         : 65001

Date: 2021-03-09 13:37:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `username` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='管理员表';

-- ----------------------------
-- Records of t_admin
-- ----------------------------

-- ----------------------------
-- Table structure for t_good
-- ----------------------------
DROP TABLE IF EXISTS `t_good`;
CREATE TABLE `t_good` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '礼品名称',
  `price` double(10,0) DEFAULT NULL COMMENT '价值',
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `image` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `remark` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `points` int(11) DEFAULT '0' COMMENT '所需积分',
  `status` int(1) DEFAULT '1' COMMENT '1=上架中，2=下架中',
  `deleted` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='积分物品表';

-- ----------------------------
-- Records of t_good
-- ----------------------------
INSERT INTO `t_good` VALUES ('53f3d2a05ab712a36b32384124b2f356', ' 未来有你·初音未来2017上海演唱会门票', '699', '5', '/images/5046db7e-a316-4508-a0cd-1b8ca963df53.jpeg', '0', '100', '1', '0');
INSERT INTO `t_good` VALUES ('cb2d5a4dda81b21506f961ede4a62dff', '初音傻fufu', '666', '96', '/images/f80d71f6-e77d-4ad7-baa1-028b4f0ee962.jpeg', '你当我是便宜货啊', '233', '1', '0');

-- ----------------------------
-- Table structure for t_image_path
-- ----------------------------
DROP TABLE IF EXISTS `t_image_path`;
CREATE TABLE `t_image_path` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `type` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `tableId` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `imagePath` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图片表';

-- ----------------------------
-- Records of t_image_path
-- ----------------------------

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `userId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `goodId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '物品id',
  `points` int(11) DEFAULT NULL COMMENT '所需积分',
  `receiver` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人',
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '联系方式',
  `address` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '地址',
  `delivery` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '快递名称',
  `deliveryNo` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '快递单号',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `status` int(1) DEFAULT '1' COMMENT '1=待发货 2=待收货 3=完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='积分物品订单表';

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('689ae206694d2e070a4627ae12e35c2e', '999', '53f3d2a05ab712a36b32384124b2f356', '100', '张三', '13726452983', '冼沙', '中通快递', 'ZT-451-223-445', '', '2');
INSERT INTO `t_order` VALUES ('cd46b354a979a0513d5544f863a76db5', '6032e20a36c868729d56f2ef4e74f1d3', 'cb2d5a4dda81b21506f961ede4a62dff', '233', '帕秋莉', '13722233344', '幻想乡16区1号', '圆通快递', 'YT-0123-456', '最最最能吃大米的fufu', '3');

-- ----------------------------
-- Table structure for t_post
-- ----------------------------
DROP TABLE IF EXISTS `t_post`;
CREATE TABLE `t_post` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `categoryId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '分类id',
  `plateId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '板块id',
  `userId` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `postContent` mediumtext COLLATE utf8_bin,
  `title` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `hotNums` int(11) DEFAULT '0' COMMENT '浏览量',
  `adopted` int(1) DEFAULT NULL COMMENT '1可采纳，2不可采纳，3已被采纳',
  `adoptedPoints` int(11) DEFAULT NULL COMMENT '采纳积分',
  `status` int(11) DEFAULT '0' COMMENT '0=待审核 1=审核通过 2=审核不通过',
  `deleted` int(1) DEFAULT '0',
  `likeNums` int(11) DEFAULT '0',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `createTime` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='帖子表';

-- ----------------------------
-- Records of t_post
-- ----------------------------
INSERT INTO `t_post` VALUES ('2786440f4cd74d08bf60a2b476cec666', '999', '999', '888', 0x3C703E52543C2F703E, '先有鸡还是先有蛋?', '0', '1', '5', '0', '0', '0', '', '2021-02-28 16:26:59');
INSERT INTO `t_post` VALUES ('3808c3acc3b445f7a0751f6e53bcde5a', '999', '999', '3', 0x3C703E52543C2F703E, '进击的巨人S2', '0', '1', '10', '0', '0', '0', '', '2021-02-28 07:23:19');
INSERT INTO `t_post` VALUES ('51a8b8b1ef574a89b8eaa0773a26d031', '999', '999', '3', 0x3C703E52543C2F703E, '求日在校园资源', '0', '1', '20', '0', '0', '0', '', '2021-02-28 07:21:09');
INSERT INTO `t_post` VALUES ('582d4bae326d4d6ebd7ceb080f7d1ac0', '999', '999', '3', 0x3C703E52543C2F703E, '进击的巨人S3资源', '0', '3', '10', '0', '0', '0', '', '2021-02-28 07:23:24');
INSERT INTO `t_post` VALUES ('8c8b90465108421ba174c20dc5d741a4', '999', '999', '3', '', '求进入巨人S1资源', '0', '1', '10', '0', '0', '0', '', '2021-02-28 07:22:32');
INSERT INTO `t_post` VALUES ('8d96a4ab23a544b1a1260aa6616b4817', '999', '999', '888', 0x3C703EE9809AE5BE80E4BDA0E79A84E8B7AFE6808EE4B988E8B5B03F3C2F703E0A3C703E3C7370616E207374796C653D22666F6E742D73697A653A20313870783B223EE9809AE5BE80E4BDA0E79A84E8B7AFE6808EE4B988E8B5B03F3C2F7370616E3E3C2F703E0A3C703E3C7370616E207374796C653D22666F6E742D73697A653A20323470783B223EE9809AE5BE80E4BDA0E79A84E8B7AFE6808EE4B988E8B5B03F3C2F7370616E3E3C2F703E, '通往你的路怎么走?', '0', '3', '20', '0', '0', '0', '', '2021-02-25 07:55:00');
INSERT INTO `t_post` VALUES ('999', '999', '999', '999', 0xE59388E59388, 'sp棋哥', '0', '1', '100', '0', '0', '1', '123', '2021-02-23 03:54:57');
INSERT INTO `t_post` VALUES ('9e1763049c91401b89d7a5f0659ed3fa', '999', '999', '3', 0x3C703E52543C2F703E, '进击的巨人S4资源', '0', '1', '10', '0', '0', '0', '', '2021-02-28 07:23:31');
INSERT INTO `t_post` VALUES ('b0cbc20c983045b5b7ef1c994562d8f3', '999', '999', '3', 0x3C703E52543C2F703E, '求进入巨人S1资源', '0', '1', '10', '0', '0', '0', '', '2021-02-28 07:22:37');
INSERT INTO `t_post` VALUES ('e83ed407304d4ef19323f51f00a89254', '999', '999', '3', 0x3C703E52543C2F703E, '进击的巨人S5资源', '0', '1', '10', '0', '0', '0', '', '2021-02-28 07:23:35');

-- ----------------------------
-- Table structure for t_post_category
-- ----------------------------
DROP TABLE IF EXISTS `t_post_category`;
CREATE TABLE `t_post_category` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '帖子分类名称',
  `deleted` int(1) DEFAULT '0' COMMENT '0=未删除 1=删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='帖子分类表';

-- ----------------------------
-- Records of t_post_category
-- ----------------------------
INSERT INTO `t_post_category` VALUES ('999', '默认分类', '0');
INSERT INTO `t_post_category` VALUES ('ca3af09715543aba29e736b93fdf41f2', '嚯嚯嚯', '0');

-- ----------------------------
-- Table structure for t_post_collect
-- ----------------------------
DROP TABLE IF EXISTS `t_post_collect`;
CREATE TABLE `t_post_collect` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `userId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `postId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '帖子id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='帖子收藏表';

-- ----------------------------
-- Records of t_post_collect
-- ----------------------------
INSERT INTO `t_post_collect` VALUES ('1fb3c4433e1199c301f87c16560659bc', '888', '582d4bae326d4d6ebd7ceb080f7d1ac0');
INSERT INTO `t_post_collect` VALUES ('282e798cff05aa1f807b3f968d77dbd1', '888', 'e83ed407304d4ef19323f51f00a89254');
INSERT INTO `t_post_collect` VALUES ('2fa73defdfbaca453fc670ff6b9d80d2', '888', '9e1763049c91401b89d7a5f0659ed3fa');
INSERT INTO `t_post_collect` VALUES ('9d112a4b89617ee81b95e0761b0b5c62', '999', '222');
INSERT INTO `t_post_collect` VALUES ('ba07bbd7753934e88d9b570b1d306b16', '888', '999');
INSERT INTO `t_post_collect` VALUES ('cb1fb4d8c17ac3dc1be6ff266f29506c', '888', 'b0cbc20c983045b5b7ef1c994562d8f3');
INSERT INTO `t_post_collect` VALUES ('da02e7121a253b3eccea5483de487b28', '999', '333');

-- ----------------------------
-- Table structure for t_post_like
-- ----------------------------
DROP TABLE IF EXISTS `t_post_like`;
CREATE TABLE `t_post_like` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `userId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `postId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '帖子id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='帖子点赞表';

-- ----------------------------
-- Records of t_post_like
-- ----------------------------
INSERT INTO `t_post_like` VALUES ('df3625d23d77a1dc73f895867c0fdb91', '999', '897bd76d19ea0a8b3c15457ccfa42f2a');

-- ----------------------------
-- Table structure for t_post_plate
-- ----------------------------
DROP TABLE IF EXISTS `t_post_plate`;
CREATE TABLE `t_post_plate` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '板块名称',
  `image` varchar(300) COLLATE utf8_bin DEFAULT '' COMMENT '图片路径',
  `remark` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '板块描述',
  `deleted` int(1) DEFAULT '0' COMMENT '0=未删除 1=删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='帖子板块表';

-- ----------------------------
-- Records of t_post_plate
-- ----------------------------
INSERT INTO `t_post_plate` VALUES ('999', '默认板块', '1', '123', '0');
INSERT INTO `t_post_plate` VALUES ('cacfecdedcb45f971250cf07a21318bc', '哈哈', '1', '1', '0');

-- ----------------------------
-- Table structure for t_post_reply
-- ----------------------------
DROP TABLE IF EXISTS `t_post_reply`;
CREATE TABLE `t_post_reply` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `userId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `postId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '帖子id',
  `content` mediumtext COLLATE utf8_bin COMMENT '内容',
  `adopted` int(1) DEFAULT '0' COMMENT '0=未采纳 1=已采纳',
  `top` int(11) DEFAULT '0' COMMENT '0=未置顶，1=置顶',
  `floor` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL COMMENT '时间',
  `likeNums` int(11) DEFAULT '0' COMMENT '点赞数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='回帖表';

-- ----------------------------
-- Records of t_post_reply
-- ----------------------------
INSERT INTO `t_post_reply` VALUES ('143f9f2dc6b7e9a1f734c7833c0487e6', '888', '8c8b90465108421ba174c20dc5d741a4', 0x3C703E3C6120687265663D22687474703A2F2F7777772E636F6D696361742E6F72672F73686F772D616165306231663139323366323135363332666563366230636632656533363062643261313265352E68746D6C22207461726765743D225F626C616E6B222072656C3D226E6F6F70656E6572223E5BE8BF9BE587BBE79A84E5B7A8E4BABA5331E8B584E6BA905D3C2F613E3C2F703E, '0', '0', '2', '2021-03-03 03:56:55', '0');
INSERT INTO `t_post_reply` VALUES ('381fa128515b140ccf870e60988d4dfa', '888', '582d4bae326d4d6ebd7ceb080f7d1ac0', 0x3C703E32303C2F703E, '0', '0', '1', '2021-03-02 16:21:43', '1');
INSERT INTO `t_post_reply` VALUES ('3d7627463e4017c88a00c0c2739b53fa', '888', '3808c3acc3b445f7a0751f6e53bcde5a', 0x3C703E32303C2F703E, '0', '0', '1', '2021-03-02 16:23:13', '0');
INSERT INTO `t_post_reply` VALUES ('3e48fb1cf423ea3b20a47590d9ffb019', '888', '8d96a4ab23a544b1a1260aa6616b4817', 0x3C703EE680A5E680A5E680A5213C2F703E, '0', '0', '1', '2021-02-25 07:56:57', '1');
INSERT INTO `t_post_reply` VALUES ('40e82dfc60443952f585bde8dca31490', '999', '999', 0x7370E6A38BE593A5, '0', '0', '3', '2021-02-23 09:15:09', '2');
INSERT INTO `t_post_reply` VALUES ('4ab303bca6db25aa03a7eb1127149299', '888', '582d4bae326d4d6ebd7ceb080f7d1ac0', 0x3C703EE8B584E6BA9026646172723B26646172723B26646172723B3C2F703E, '1', '1', '2', '2021-03-02 17:02:33', '2');
INSERT INTO `t_post_reply` VALUES ('69a6b885f0323741de1d5e7926c0e461', '999', '999', 0x313233, '0', '1', '1', '2021-02-23 07:59:16', '1');
INSERT INTO `t_post_reply` VALUES ('7414b0c54546b81cbc7fcca927cbf03c', '888', '8c8b90465108421ba174c20dc5d741a4', 0x3C703E3C7370616E207374796C653D22636F6C6F723A20233333363666663B223E3C6120687265663D222322207461726765743D225F626C616E6B222072656C3D226E6F6F70656E6572223EE7899BE980BC3C2F613E3C2F7370616E3E3C2F703E, '0', '0', '7', '2021-03-03 04:07:11', '0');
INSERT INTO `t_post_reply` VALUES ('79ca4492d45b63c1b31f7fb81e9a11dc', '888', '8c8b90465108421ba174c20dc5d741a4', 0x3C703E3C6120636C6173733D22746578742D626C61636B20686F7665723A746578742D7265642D3530302220687265663D22687474703A2F2F7777772E636F6D696361742E6F72672F73686F772D616165306231663139323366323135363332666563366230636632656533363062643261313265352E68746D6C22207461726765743D225F626C616E6B222072656C3D226E6F6F70656E6572223E5BE8BF9BE587BBE79A84E5B7A8E4BABA5331E8B584E6BA905D3131313C2F613E3C2F703E, '0', '0', '6', '2021-03-03 04:06:15', '0');
INSERT INTO `t_post_reply` VALUES ('94cf4c19d74492e13c363fe867079be8', '666', '999', 0x343536, '0', '0', '2', '2021-02-23 07:59:35', '0');
INSERT INTO `t_post_reply` VALUES ('9b596fec8fa77d3b862370d37e8fbc13', '888', '8c8b90465108421ba174c20dc5d741a4', 0x3C703E3C696D6720636C6173733D22682D3420772D3422207372633D2268747470733A2F2F63646E2E6A7364656C6976722E6E65742F6E706D2F74696E796D63652D616C6C2D696E2D6F6E6540342E392E332F706C7567696E732F656D6F7469636F6E732F696D672F736D696C65792D6372792E6769662220616C743D2263727922202F3E77646E6D643C2F703E, '0', '0', '5', '2021-03-03 04:01:09', '0');
INSERT INTO `t_post_reply` VALUES ('adec174baa2ca61a64eb0cb7fb02a3bd', '888', '8d96a4ab23a544b1a1260aa6616b4817', 0x3C703EE9A1B6E9A1B6E9A1B63C2F703E, '1', '1', '2', '2021-02-28 16:14:39', '0');
INSERT INTO `t_post_reply` VALUES ('aef675d85a426f97748011f5a8d5f77b', '888', '2786440f4cd74d08bf60a2b476cec666', 0x3C703EE69C89E9B8A1E590A73C2F703E, '0', '0', '1', '2021-02-28 16:27:31', '2');
INSERT INTO `t_post_reply` VALUES ('c06f1e7cc635a75329ac2fab3d2ce755', '888', '8c8b90465108421ba174c20dc5d741a4', 0x3C703E3C6120687265663D22687474703A2F2F7777772E636F6D696361742E6F72672F73686F772D616165306231663139323366323135363332666563366230636632656533363062643261313265352E68746D6C22207461726765743D225F626C616E6B222072656C3D226E6F6F70656E6572223E5BE8BF9BE587BBE79A84E5B7A8E4BABA5331E8B584E6BA905D3C2F613E3C2F703E0A3C703E3C6120687265663D22687474703A2F2F7777772E636F6D696361742E6F72672F73686F772D616165306231663139323366323135363332666563366230636632656533363062643261313265352E68746D6C22207461726765743D225F626C616E6B222072656C3D226E6F6F70656E6572223E5BE8BF9BE587BBE79A84E5B7A8E4BABA5331E8B584E6BA905D3C2F613E3C2F703E0A3C703E266E6273703B3C2F703E, '0', '0', '1', '2021-03-03 03:56:22', '0');
INSERT INTO `t_post_reply` VALUES ('e79fb9fe947a5202cf021c52cc001a13', '888', '8c8b90465108421ba174c20dc5d741a4', 0x3C703E3C7370616E207374796C653D22636F6C6F723A20236666303030303B223EE68891E698AFE7BAA2E79A843C696D67207372633D2268747470733A2F2F63646E2E6A7364656C6976722E6E65742F6E706D2F74696E796D63652D616C6C2D696E2D6F6E6540342E392E332F706C7567696E732F656D6F7469636F6E732F696D672F736D696C65792D636F6F6C2E6769662220616C743D22636F6F6C22202F3E3C2F7370616E3E3C2F703E, '0', '0', '3', '2021-03-03 03:58:15', '0');
INSERT INTO `t_post_reply` VALUES ('f4590d861bc0e84528b6c93fa590ab5e', '888', '8c8b90465108421ba174c20dc5d741a4', 0x3C703E3C696D67207372633D2268747470733A2F2F63646E2E6A7364656C6976722E6E65742F6E706D2F74696E796D63652D616C6C2D696E2D6F6E6540342E392E332F706C7567696E732F656D6F7469636F6E732F696D672F736D696C65792D6D6F6E65792D6D6F7574682E6769662220616C743D226D6F6E65792D6D6F75746822202F3E3C696D67207372633D2268747470733A2F2F63646E2E6A7364656C6976722E6E65742F6E706D2F74696E796D63652D616C6C2D696E2D6F6E6540342E392E332F706C7567696E732F656D6F7469636F6E732F696D672F736D696C65792D636F6F6C2E6769662220616C743D22636F6F6C22202F3E3C696D67207372633D2268747470733A2F2F63646E2E6A7364656C6976722E6E65742F6E706D2F74696E796D63652D616C6C2D696E2D6F6E6540342E392E332F706C7567696E732F656D6F7469636F6E732F696D672F736D696C65792D656D62617261737365642E6769662220616C743D22656D626172617373656422202F3E3C696D67207372633D2268747470733A2F2F63646E2E6A7364656C6976722E6E65742F6E706D2F74696E796D63652D616C6C2D696E2D6F6E6540342E392E332F706C7567696E732F656D6F7469636F6E732F696D672F736D696C65792D666F6F742D696E2D6D6F7574682E6769662220616C743D22666F6F742D696E2D6D6F75746822202F3E3C2F703E, '0', '0', '4', '2021-03-03 03:58:32', '0');

-- ----------------------------
-- Table structure for t_post_reply_like
-- ----------------------------
DROP TABLE IF EXISTS `t_post_reply_like`;
CREATE TABLE `t_post_reply_like` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `replyId` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `userId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='回帖点赞表';

-- ----------------------------
-- Records of t_post_reply_like
-- ----------------------------
INSERT INTO `t_post_reply_like` VALUES ('0083c5214311bf2f1a0987a6931f32a7', 'aef675d85a426f97748011f5a8d5f77b', '888');
INSERT INTO `t_post_reply_like` VALUES ('053253c490961e58ea527f723b1be2a7', '40e82dfc60443952f585bde8dca31490', '999');
INSERT INTO `t_post_reply_like` VALUES ('2a84d032afb8b30364374bfdf41956d0', '3e48fb1cf423ea3b20a47590d9ffb019', '888');
INSERT INTO `t_post_reply_like` VALUES ('3f97a977b333142e18f54c994b7f80bd', '40e82dfc60443952f585bde8dca31490', '666');
INSERT INTO `t_post_reply_like` VALUES ('6b5808b98f0d8c40f1f5afd2b253b779', '69a6b885f0323741de1d5e7926c0e461', '999');
INSERT INTO `t_post_reply_like` VALUES ('7a9e61501c38c94767bad8dae09ec2c9', '381fa128515b140ccf870e60988d4dfa', '888');
INSERT INTO `t_post_reply_like` VALUES ('9a05d11c0a8a77c56a3546a3cc4cdeae', '4ab303bca6db25aa03a7eb1127149299', '3');
INSERT INTO `t_post_reply_like` VALUES ('9d7ff583a594aee663d647d98e635bc5', '4ab303bca6db25aa03a7eb1127149299', '888');
INSERT INTO `t_post_reply_like` VALUES ('a485e4da177d66830b8ccbec8638aa43', 'aef675d85a426f97748011f5a8d5f77b', '888');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `name` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '普通用户');
INSERT INTO `t_role` VALUES ('2', '管理员');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名称',
  `email` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
  `password` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '登录密码',
  `status` varchar(100) COLLATE utf8_bin DEFAULT '1' COMMENT '1=正常，2=违禁 3=封号',
  `avatar` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '头像',
  `points` int(11) DEFAULT '1000' COMMENT '积分值',
  `deleted` int(1) DEFAULT '0' COMMENT '0=未删除 1=已删除',
  `roleId` int(11) DEFAULT '1',
  `lastLoginTime` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  KEY `name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '张三', '123@qq.com', '13745252585', '123', '1', '/images/avatar/avatar.jpg', '1000', '0', '1', '2021-02-01 03:00:46');
INSERT INTO `t_user` VALUES ('2', '李四', '456@qq.com', '13745252789', '123', '1', '/images/avatar/avatar.jpg', '1000', '0', '1', null);
INSERT INTO `t_user` VALUES ('3', '王五', '12345678@qq.com', '13747484412', '123', '1', '/images/7a90b9ce-1b0c-411d-a191-989ada8818ab.jpg', '720', '0', '1', '2021-03-07 13:24:31');
INSERT INTO `t_user` VALUES ('46d1c8ce6d622c406163f95c1bc2937b', 'itach', 'itach@hokake.com', '13722556678', '123', '1', '', '1000', '0', '1', null);
INSERT INTO `t_user` VALUES ('6032e20a36c868729d56f2ef4e74f1d3', '测试人员A', 'testA@tt.com', '13755667788', '123', '1', '/images/a518a425-ccd6-4420-bfde-01d6b0c1ae99.jpg', '301', '0', '1', '2021-03-09 05:37:03');
INSERT INTO `t_user` VALUES ('666', '棋哥', '1111111@qq.com', '13726452980', '123', '1', '/images/avatar/avatar.jpg', '1000', '0', '1', '2021-02-23 09:17:06');
INSERT INTO `t_user` VALUES ('66ccff', 'mikuchan', '30@miku.chan', '13711223344', '12345678', '1', '/images/avatar/avatar.jpg', '1000', '0', '1', '2021-02-05 01:13:40');
INSERT INTO `t_user` VALUES ('74079ae506ac5f1136602ae542c7baa3', 'itachikun', 'itachi@uchiha.sasuke', '13733445566', 'sasuke', '1', '/images/a78d3991-cb95-444f-bfde-2cbfb84efb5d.jpeg', '1000', '0', '1', '2021-03-08 16:38:46');
INSERT INTO `t_user` VALUES ('888', 'admin', 'admin', 'admin', '123', '1', '/images/avatar/avatar.jpg', '1005', '0', '2', '2021-03-09 04:12:13');
INSERT INTO `t_user` VALUES ('9942a52906f8408f875e0323a93233ce', '宇智波鼬', 'itachi@uchiha.com', '13522334455', 'sasuke', '1', '', '1000', '0', '1', null);
INSERT INTO `t_user` VALUES ('999', 'chenyf', '2510260629@qq.com', '123', '123', '1', '/images/avatar/avatar.jpg', '10000', '0', '1', '2021-03-09 05:18:58');
INSERT INTO `t_user` VALUES ('ce4d79d1c64384fd3d829a2fe514791f', 'itachi', 'itachi@hokake.com', '13722556677', '123', '1', '', '1000', '0', '1', null);

-- ----------------------------
-- Table structure for t_user_follow
-- ----------------------------
DROP TABLE IF EXISTS `t_user_follow`;
CREATE TABLE `t_user_follow` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL,
  `userId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `followId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '被关注的用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='关注-粉丝表';

-- ----------------------------
-- Records of t_user_follow
-- ----------------------------
INSERT INTO `t_user_follow` VALUES ('111111111111', '666', '999');
INSERT INTO `t_user_follow` VALUES ('2222222222', '999', '1');
INSERT INTO `t_user_follow` VALUES ('2bae08daca552b282b23f332680df400', '999', '666');
INSERT INTO `t_user_follow` VALUES ('333333333', '999', '2');
INSERT INTO `t_user_follow` VALUES ('444444', '3', '999');
INSERT INTO `t_user_follow` VALUES ('a04fe70a1ef0fbf380dc2cd2cebf163f', '999', '888');
INSERT INTO `t_user_follow` VALUES ('c931e04a20186012eba6ea5b088f60cc', '888', '3');
