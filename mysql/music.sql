/*
Navicat MySQL Data Transfer

Source Server         : music
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : music

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2020-07-20 13:09:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for album
-- ----------------------------
DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `id` bigint(255) unsigned NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '专辑名',
  `picurl` varchar(255) NOT NULL COMMENT '专辑图像',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of album
-- ----------------------------
INSERT INTO `album` VALUES ('508966781', '高辨识度嗓音| 巧克力般回味无穷的味道', 'https://p2.music.126.net/gvsYfabJSEFt6KyC6BFgRA==/109951164758673831.jpg');
INSERT INTO `album` VALUES ('512755447', '你怎么好像总是忘记我爱你', 'https://p2.music.126.net/SnEHKuWlfVoQexPwe1y3sQ==/109951164516680440.jpg');
INSERT INTO `album` VALUES ('2070050345', '老歌越听越有味 旧人越看越无情｜男声版', 'https://p2.music.126.net/X-RTQEKCApdN_YtKE69_Yw==/109951164055346509.jpg');
INSERT INTO `album` VALUES ('2303649893', '2018上半年最热新歌TOP50', 'https://p2.music.126.net/wsPS7l8JZ3EAOvlaJPWW-w==/109951163393967421.jpg');
INSERT INTO `album` VALUES ('2719385392', '《陈情令》歌曲全收录', 'https://p2.music.126.net/EXP_FJ8QsTr_jGRZptXFHQ==/109951164890015081.jpg');
INSERT INTO `album` VALUES ('2944041907', '终究还是没能成为她的例外', 'https://p2.music.126.net/3ySpIljaCR6Hf7c8kbwi2A==/109951164699144371.jpg');
INSERT INTO `album` VALUES ('3184424973', 'Askar-Muhtar 艾斯凯尔·穆合塔尔', 'https://p2.music.126.net/XFl9op6QDU0FagIyzC3Y0Q==/109951164667238155.jpg');
INSERT INTO `album` VALUES ('4869164805', '私藏 | 值得循环的Cover合集', 'https://p2.music.126.net/zk3QExfjxafpWTKu0DZsGA==/109951164717393424.jpg');
INSERT INTO `album` VALUES ('4975739424', '「别样演绎」华语歌手带你重温欧美经典', 'https://p2.music.126.net/-j3X2BjmQiyDKs--sa00TA==/109951164917355667.jpg');

-- ----------------------------
-- Table structure for coll_list
-- ----------------------------
DROP TABLE IF EXISTS `coll_list`;
CREATE TABLE `coll_list` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `artname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of coll_list
-- ----------------------------
INSERT INTO `coll_list` VALUES ('122914', '摘星的晚上', '李国祥');
INSERT INTO `coll_list` VALUES ('190713', '如没有你', '张学友');
INSERT INTO `coll_list` VALUES ('1400259397', '有我呢', '郭一凡');
INSERT INTO `coll_list` VALUES ('1440176366', '夏天的风', '赵栖兑');

-- ----------------------------
-- Table structure for more
-- ----------------------------
DROP TABLE IF EXISTS `more`;
CREATE TABLE `more` (
  `id` bigint(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `picurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of more
-- ----------------------------
INSERT INTO `more` VALUES ('318112231', '【妖气弥漫】那些妖异的古风歌曲', 'https://p2.music.126.net/JZguHNVDUvmo0rjhQVYjiA==/3405187517388215.jpg');
INSERT INTO `more` VALUES ('374820366', '曾经是否有被一句歌词打动过', 'https://p2.music.126.net/cjh_BIDWLqk7c0Ytiwakqw==/18961078021601966.jpg');
INSERT INTO `more` VALUES ('508966781', '高辨识度嗓音| 巧克力般回味无穷的味道', 'https://p2.music.126.net/gvsYfabJSEFt6KyC6BFgRA==/109951164758673831.jpg');
INSERT INTO `more` VALUES ('512755447', '你怎么好像总是忘记我爱你', 'https://p2.music.126.net/SnEHKuWlfVoQexPwe1y3sQ==/109951164516680440.jpg');
INSERT INTO `more` VALUES ('607130398', 'UyGuR ♬ 维吾尔', 'https://p2.music.126.net/KFnzNyrQsOqe3AMDahQItA==/109951164676708078.jpg');
INSERT INTO `more` VALUES ('766384376', '中文翻唱【女声】', 'https://p2.music.126.net/MnXh4v-_uQGdgOqD0WJVXQ==/19219463253977143.jpg');
INSERT INTO `more` VALUES ('904123596', '黑暗系『致郁 偏执 病娇 独占欲』', 'https://p2.music.126.net/YjnqjTpmKmw1BWoCb5-P8w==/18645518186084594.jpg');
INSERT INTO `more` VALUES ('2033700325', '全球高考/AWM/伪渣/提映/破云/大哥/影帝', 'https://p2.music.126.net/8EU_2-9x6y9kWggnNCpEig==/109951164054786590.jpg');
INSERT INTO `more` VALUES ('2070050345', '老歌越听越有味 旧人越看越无情｜男声版', 'https://p2.music.126.net/X-RTQEKCApdN_YtKE69_Yw==/109951164055346509.jpg');
INSERT INTO `more` VALUES ('2163003993', 'Like 属于你的神仙歌单丨超好听循环播放', 'https://p2.music.126.net/49m1Rc_5yt0iLGOkDL01lA==/109951164505868188.jpg');
INSERT INTO `more` VALUES ('2303649893', '2018上半年最热新歌TOP50', 'https://p2.music.126.net/wsPS7l8JZ3EAOvlaJPWW-w==/109951163393967421.jpg');
INSERT INTO `more` VALUES ('2384581760', '骚气满满 抱歉 我有点飘了', 'https://p2.music.126.net/rVQYmoxroUMDwVFtsMbwzw==/109951163512819440.jpg');
INSERT INTO `more` VALUES ('2427721462', '【吾守尔喀热】｛HoxurKari｝', 'https://p2.music.126.net/Z6eMq-K5Ry5DDttPWVs_5Q==/109951164696271102.jpg');
INSERT INTO `more` VALUES ('2453004291', 'MaHMutjan MaMut麦合木提江', 'https://p2.music.126.net/cEo0TvKJruVH5r6M7myG9A==/109951164236000035.jpg');
INSERT INTO `more` VALUES ('2482210411', '那些听一遍就喜欢的歌', 'https://p2.music.126.net/R61ZF0gTfd6fuVc41oo5Lg==/109951164286019220.jpg');
INSERT INTO `more` VALUES ('2516179927', '【纯白噪音】自然声音|雨声|猫咪呼噜|炉火', 'https://p2.music.126.net/0m-U9koTLThkE45gCOsFKw==/109951163695436549.jpg');
INSERT INTO `more` VALUES ('2671145804', '高考百日冲刺：乾坤未定，你我皆是黑马', 'https://p2.music.126.net/a4qCDQjCjPmpz1EXZGYEhg==/109951163869221016.jpg');
INSERT INTO `more` VALUES ('2688664397', '☢︎_乌兹别克明星丨Sevinch Mo\'minova', 'https://p2.music.126.net/CCUe6FkkZJynx09P5Jzjmg==/109951163925137185.jpg');
INSERT INTO `more` VALUES ('2719385392', '《陈情令》歌曲全收录', 'https://p2.music.126.net/EXP_FJ8QsTr_jGRZptXFHQ==/109951164890015081.jpg');
INSERT INTO `more` VALUES ('2824368771', '王者荣耀李信战歌 吾持剑锋以驻长城', 'https://p2.music.126.net/M3BaPtgeY0q2lt6hPy1kMA==/109951164115017342.jpg');
INSERT INTO `more` VALUES ('2944041907', '终究还是没能成为她的例外', 'https://p2.music.126.net/3ySpIljaCR6Hf7c8kbwi2A==/109951164699144371.jpg');
INSERT INTO `more` VALUES ('3072133338', '神仙翻唱｜神仙宝藏！', 'https://p2.music.126.net/ViZe-DL9vArgLNBYmmdo7A==/109951164944760053.jpg');
INSERT INTO `more` VALUES ('3087548423', '曾经火遍全网的歌曲', 'https://p2.music.126.net/LIkVhvNw89QaBnvfSbUCeg==/109951164505464441.jpg');
INSERT INTO `more` VALUES ('3092652961', '-❥维吾尔族歌曲↬Taxmamat-Batur ღ', 'https://p2.music.126.net/9q4Vm8buiMJfWqBaNwDb8A==/109951164512561227.jpg');
INSERT INTO `more` VALUES ('3132447900', '排位打野节奏（推荐）', 'https://p2.music.126.net/OZUXgQ9GB6bYJyEQ38p0Pw==/109951164746809287.jpg');
INSERT INTO `more` VALUES ('3168423108', 'Rapper超甜 | 沉溺在你爱的告白', 'https://p2.music.126.net/LXLmrqE-xZQSTxjGdYKNVw==/109951164690516639.jpg');
INSERT INTO `more` VALUES ('3184424973', 'Askar-Muhtar 艾斯凯尔·穆合塔尔', 'https://p2.music.126.net/XFl9op6QDU0FagIyzC3Y0Q==/109951164667238155.jpg');
INSERT INTO `more` VALUES ('3194482794', '伤感（片段）☹︎', 'https://p2.music.126.net/DXsYusL40OoLpOAzRdCWZw==/109951164812692006.jpg');
INSERT INTO `more` VALUES ('4869164805', '私藏 | 值得循环的Cover合集', 'https://p2.music.126.net/zk3QExfjxafpWTKu0DZsGA==/109951164717393424.jpg');
INSERT INTO `more` VALUES ('4975739424', '「别样演绎」华语歌手带你重温欧美经典', 'https://p2.music.126.net/-j3X2BjmQiyDKs--sa00TA==/109951164917355667.jpg');

-- ----------------------------
-- Table structure for mv_all
-- ----------------------------
DROP TABLE IF EXISTS `mv_all`;
CREATE TABLE `mv_all` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `artistName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mv_all
-- ----------------------------
INSERT INTO `mv_all` VALUES ('5363255', 'Casanova', 'http://p1.music.126.net/PWLSI-lEF3vJd3ZFX1P65Q==/18803847858332947.jpg', 'Allie X');
INSERT INTO `mv_all` VALUES ('5437670', '让座', 'http://p1.music.126.net/ZuyG2aIzBFn9g3zAgfvbdg==/18554258720490268.jpg', '群星');
INSERT INTO `mv_all` VALUES ('5443256', 'Satellites (歌词版)', 'http://p1.music.126.net/2oF0XzXSbfkKZMIMOEIlBA==/18866520021012871.jpg', 'Timmy Trumpet');
INSERT INTO `mv_all` VALUES ('10840507', 'Wisal Izdep', 'http://p1.music.126.net/Ke-Kc1vBHufUyfoSJIoFiQ==/109951163733434405.jpg', 'Mehmutjan_Mamut麦合木提江');
INSERT INTO `mv_all` VALUES ('10841080', '起风了 Live版', 'http://p1.music.126.net/dQ2Nb0IT-ViwffPN4_Gbsw==/109951163738076896.jpg', '买辣椒也用券');
INSERT INTO `mv_all` VALUES ('10841267', '[IDOL RADIO]乐华七子NEXT随机舞蹈挑战！', 'http://p1.music.126.net/Uu1OsNhptyoNRLgYNcAEug==/109951163752798459.jpg', '乐华七子NEXT');
INSERT INTO `mv_all` VALUES ('10841346', '[GOT7 STUDIO] Take Me To You 现场版', 'http://p1.music.126.net/o1wO6Z-xgHXaLIe54nSs_w==/109951163760464623.jpg', 'GOT7');
INSERT INTO `mv_all` VALUES ('10841379', 'Lemon (第69回NHK红白歌会)', 'http://p1.music.126.net/R4ucuCG3gllzYla39kGJCA==/109951163764711886.jpg', '米津玄師');
INSERT INTO `mv_all` VALUES ('10842163', '계단 앞 (Stair Way)', 'http://p1.music.126.net/91richsUFn0jI0DJpiVzkA==/109951163745394282.jpg', 'Jaguar中士');
INSERT INTO `mv_all` VALUES ('10843386', '平凡的你我', 'http://p1.music.126.net/U-CBl5SyNrtf7EwGoCmULQ==/109951163764717611.jpg', '马良');
INSERT INTO `mv_all` VALUES ('10844134', 'Yaqisan 迷恋我', 'http://p1.music.126.net/Hs98ecYU-ApLxGgkfDV3iw==/109951163739462181.jpg', 'AlimjanAbdujilil');
INSERT INTO `mv_all` VALUES ('10844205', 'Lullaby | SBS 歌谣大战 18/12/25 现场版', 'http://p1.music.126.net/iqh6ny8JFiy8iZVFMXKm2Q==/109951163747950089.jpg', 'GOT7');
INSERT INTO `mv_all` VALUES ('10844215', 'Man Yok', 'http://p1.music.126.net/EQBxWHEcSpzM_BAcoutKAA==/109951163749042611.jpg', 'Turgunjan Tursun');
INSERT INTO `mv_all` VALUES ('10846018', 'Darling (feat. Anastasia)', 'http://p1.music.126.net/msoYyqOZ-FFMmIpRFJ21TQ==/109951163764882444.jpg', '朱彦安');
INSERT INTO `mv_all` VALUES ('10846157', 'Faking It', 'http://p1.music.126.net/4_tAQV1JecahMQrBTIDiaQ==/109951163780996867.jpg', 'Sasha Sloan');
INSERT INTO `mv_all` VALUES ('10846238', '写给黄淮', 'http://p1.music.126.net/0kaVwO2TdnlB9BdXVTy7lw==/109951163784079548.jpg', '解忧邵帅');
INSERT INTO `mv_all` VALUES ('10846635', 'I WON\'T LET YOU GO (Vertical Ver.)', 'http://p1.music.126.net/HfjBUwImZCrNL76BzRAJEQ==/109951163812038246.jpg', 'GOT7');
INSERT INTO `mv_all` VALUES ('10846843', '我想part2', 'http://p1.music.126.net/tliJmdOZT5vQbvF45CAGvQ==/109951163827889951.jpg', '法老');
INSERT INTO `mv_all` VALUES ('10847257', '来不及勇敢', 'http://p1.music.126.net/4TK1giGWVmZ93JaPpZZ8Hg==/109951163785415574.jpg', '厦门二中合唱团');
INSERT INTO `mv_all` VALUES ('10847549', 'REBEL FLAG -edit ver.-', 'http://p1.music.126.net/B_ozdAWJuHk7YTp6jHXFVw==/109951163804377067.jpg', 'GARNiDELiA');
INSERT INTO `mv_all` VALUES ('10847745', 'DAZED x LISA in CELINE', 'http://p1.music.126.net/9Fk3KI4ESVYxBIc6AB6wlQ==/109951163816574338.jpg', 'LISA');
INSERT INTO `mv_all` VALUES ('10847768', 'ixanmas Boldum', 'http://p1.music.126.net/GitdSg4rKvb5pypkwt5NuA==/109951163818515352.jpg', 'AlimjanHasan');
INSERT INTO `mv_all` VALUES ('10847873', 'Home | MBC Show Champion 19/01/30 现场版', 'http://p1.music.126.net/SIBxUL_5JIy7nWshmM1-Aw==/109951163828488026.jpg', 'SEVENTEEN');
INSERT INTO `mv_all` VALUES ('10848344', 'Silence', 'http://p1.music.126.net/2dMEq3aMtu7dJGuGGxK8IQ==/109951163794545917.jpg', 'Before You Exit');
INSERT INTO `mv_all` VALUES ('10848950', 'Sola (English Version)', 'http://p1.music.126.net/xpXq4HqBo3A5YskekgqrmQ==/109951163855963770.jpg', 'Luis Fonsi');
INSERT INTO `mv_all` VALUES ('10849828', 'bury a friend', 'http://p1.music.126.net/4JIanqDaftXVMb2kuA-Sag==/109951163829693580.jpg', 'Billie Eilish');
INSERT INTO `mv_all` VALUES ('10849939', 'shut up', 'http://p1.music.126.net/p-0LTsk4C0x-R5GsEKzwSA==/109951163855938085.jpg', 'Greyson Chance');
INSERT INTO `mv_all` VALUES ('10852146', 'Sauce!', 'http://p1.music.126.net/IK9oA6MOCkjI15opkpWopA==/109951163865629024.jpg', 'XXXTENTACION');
INSERT INTO `mv_all` VALUES ('10853121', 'Moral of the Story', 'http://p1.music.126.net/5pjVfYekHTjXsyisNYzRsw==/109951163863103097.jpg', 'Ashe');
INSERT INTO `mv_all` VALUES ('10855337', '[IDOL RADIO]MONSTA X随机舞蹈挑战！', 'http://p1.music.126.net/IAtUEHTeoUDMKFXldEiMFA==/109951163891771114.jpg', 'MONSTA X');

-- ----------------------------
-- Table structure for mv_new
-- ----------------------------
DROP TABLE IF EXISTS `mv_new`;
CREATE TABLE `mv_new` (
  `id` bigint(255) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `cover` varchar(255) NOT NULL,
  `artistName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mv_new
-- ----------------------------
INSERT INTO `mv_new` VALUES ('10920954', '猫咪共和国', 'http://p1.music.126.net/pOCFX6g2YgiNyr3N4ORYEw==/109951164809849649.jpg', '韦礼安');
INSERT INTO `mv_new` VALUES ('10921893', '100 Ways', 'http://p1.music.126.net/_a0haPNnd7DBgLM7hNciuA==/109951164818523542.jpg', '王嘉尔');
INSERT INTO `mv_new` VALUES ('10922219', '毎日がBrand new day', 'http://p1.music.126.net/CEQECeYyVz5HsB1oEq-nAw==/109951164817732183.jpg', '乃木坂46');
INSERT INTO `mv_new` VALUES ('10923537', 'おちゃらけたよ', 'http://p1.music.126.net/k7Zu24EJLAnjeTiMVNIuOQ==/109951164840379670.jpg', 'DAOKO');
INSERT INTO `mv_new` VALUES ('10923557', '안녕, 오늘의 그대에게 (Hello)', 'http://p1.music.126.net/nMo0FX4VbI2i-fjd1dbovA==/109951164840879868.jpg', '林韩星');
INSERT INTO `mv_new` VALUES ('10923600', 'チューリップ', 'http://p1.music.126.net/brxOGd2fV8YimU-Mp8Bymw==/109951164842077330.jpg', 'indigo la End');
INSERT INTO `mv_new` VALUES ('10924237', '全放空', 'http://p1.music.126.net/XWRKEZKfdBWlSsNFYGqJVw==/109951164853270220.jpg', '文慧如');
INSERT INTO `mv_new` VALUES ('10924698', '有一件美好的事情将要发生', 'http://p1.music.126.net/BwmUZ3pGd8ZMiDrKNzWbZg==/109951164871245110.jpg', '周深');
INSERT INTO `mv_new` VALUES ('10925179', '마음의 기록', 'http://p1.music.126.net/JXeYqk3cW6qVbPvbgNcERw==/109951164862873495.jpg', 'Yangpa');
INSERT INTO `mv_new` VALUES ('10925215', '直火帮《倒时差》Official Music Video', 'http://p1.music.126.net/hYgF0nC7rjo7IhqdfUSpsg==/109951164863659892.jpg', '直火帮 Straight Fire Gang');
INSERT INTO `mv_new` VALUES ('10925236', '꽃 (flower)', 'http://p1.music.126.net/pZCnh9LCmt1KYaV_cQ22yg==/109951164864295940.jpg', 'Code Kunst');
INSERT INTO `mv_new` VALUES ('10925273', 'Fight as ONE', 'http://p1.music.126.net/6EzVSv_gRGTpHUNzrKnfcg==/109951164871233576.jpg', '陈奕迅');
INSERT INTO `mv_new` VALUES ('10925401', '无畏的模样', 'http://p1.music.126.net/iGvZwXfPe6ux371jNNkE2Q==/109951164871406561.jpg', '许魏洲');
INSERT INTO `mv_new` VALUES ('10925581', '云谷鹤峰', 'http://p1.music.126.net/UvRXz25HPTojuAdbTkGiyg==/109951164889756229.jpg', '仙剑奇侠传');
INSERT INTO `mv_new` VALUES ('10925861', '虫洞诗', 'http://p1.music.126.net/C8dWZ99AFDBWbXi_lVmVpQ==/109951164887303361.jpg', '原子邦妮');
INSERT INTO `mv_new` VALUES ('10926051', '遥望天体', 'http://p1.music.126.net/h8Bgwi_wEgxIxtAGBN0hmw==/109951164880355847.jpg', '唐汉霄');
INSERT INTO `mv_new` VALUES ('10926651', '덤더럼(Dumhdurum)', 'http://p1.music.126.net/1N4ZVvQeQH-hDPF6pAuYZQ==/109951164900536711.jpg', 'Apink');
INSERT INTO `mv_new` VALUES ('10926655', '基地 FOUNDATION', 'http://p1.music.126.net/-RMdpDNYmp_Di3PEKRwD4A==/109951164900721913.jpg', '邱比（CHIU PI）');
INSERT INTO `mv_new` VALUES ('10927227', '让我守护妳', 'http://p1.music.126.net/ndbTVKA1ilBE8tGqOXeNFA==/109951164900215395.jpg', '邱胜翊');
INSERT INTO `mv_new` VALUES ('10927307', '恋爱手册', 'http://p1.music.126.net/Rvgqr4FEtG3Anp7zDD0l7Q==/109951164903290218.jpg', '宗赢');
INSERT INTO `mv_new` VALUES ('10928327', '그대만이 (You)', 'http://p1.music.126.net/fMIhMoIIS6u9S4GZdicSug==/109951164910099959.jpg', '张德澈');
INSERT INTO `mv_new` VALUES ('10930678', '乡巴佬', 'http://p1.music.126.net/75so8i5ZjlAc8gWUItN5GQ==/109951164925872942.jpg', 'Melo');
INSERT INTO `mv_new` VALUES ('10930888', '倩女幽魂 (电影《倩女幽魂：人间情》主题曲)', 'http://p1.music.126.net/2Ep5IIIyWhKhcrdoGNOOfA==/109951164931953622.jpg', '阿云嘎');
INSERT INTO `mv_new` VALUES ('10931235', '余情幽梦', 'http://p1.music.126.net/JuoKyc8ueUq87cI5ioAJug==/109951164924857184.jpg', '仙剑奇侠传');
INSERT INTO `mv_new` VALUES ('10931367', '时间教会我们的事', 'http://p1.music.126.net/KLXSuUAMhIssMY5inCplhA==/109951164928601966.jpg', '魏妙如');
INSERT INTO `mv_new` VALUES ('10931377', '우리 만남이 (But I\'ll Miss You)', 'http://p1.music.126.net/e-3FytH8gXxxu60lqP5IEA==/109951164928898753.jpg', 'Paul Kim');
INSERT INTO `mv_new` VALUES ('10931722', '想你了', 'http://p1.music.126.net/efkhC5JxYFfg_mVrDrC-Nw==/109951164940436332.jpg', '光良');
INSERT INTO `mv_new` VALUES ('10931756', 'After (English Ver.)', 'http://p1.music.126.net/V-vFYmoyguzfrl9VnIlIqg==/109951164940913004.jpg', '蔡文静');
INSERT INTO `mv_new` VALUES ('10931844', '[Look Me Up] 뱉어 (Spit it out) 中字', 'http://p1.music.126.net/RX7EWDp8b1xW-cw75vsPFw==/109951164942994928.jpg', 'Solar');
INSERT INTO `mv_new` VALUES ('10932428', 'BAZOOKA!', 'http://p1.music.126.net/107zzaH5X8nHtzeu65Y0BQ==/109951164946116811.jpg', '公园少女');

-- ----------------------------
-- Table structure for mv_ranking
-- ----------------------------
DROP TABLE IF EXISTS `mv_ranking`;
CREATE TABLE `mv_ranking` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `artistName` varchar(255) DEFAULT NULL,
  `cover` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mv_ranking
-- ----------------------------
INSERT INTO `mv_ranking` VALUES ('10892777', '绿叶', '王晨艺', 'http://p1.music.126.net/S8CeP19sv4InWVmrOIKd9A==/109951164380652219.jpg');
INSERT INTO `mv_ranking` VALUES ('10893055', 'MVlog 第十期：游弋在广州的夏末，迷失于The fin.的歌', '云音乐MVLog', 'http://p1.music.126.net/Hp7AUNihLTpcqN9FJih6rA==/109951164373488601.jpg');
INSERT INTO `mv_ranking` VALUES ('10893896', '《我和我的祖国》告白版MV 网易云音乐超燃情线上大合唱', '网易云音乐', 'http://p1.music.126.net/9o5DU0dxioWfzVHvfNfIuw==/109951164390161577.jpg');
INSERT INTO `mv_ranking` VALUES ('10895139', 'TIGER+呼吸声', 'Lil Ghost小鬼', 'http://p1.music.126.net/9-eUHPjItfaEavH1ULUVjQ==/109951164395407836.jpg');
INSERT INTO `mv_ranking` VALUES ('10896368', '《宅の死》', '深蓝儿童', 'http://p1.music.126.net/vWgRnPT2YS9tZALc6X-dyQ==/109951164430533623.jpg');
INSERT INTO `mv_ranking` VALUES ('10896579', '尘', '薛之谦', 'http://p1.music.126.net/U1jivxXc-u4U2QoifR3Ahg==/109951164433647514.jpg');
INSERT INTO `mv_ranking` VALUES ('10898320', '不摇滚', '八三夭', 'http://p1.music.126.net/8n597o4ng4S7L6Us4sh_QA==/109951164452144979.jpg');
INSERT INTO `mv_ranking` VALUES ('10898465', '七页纸的信 Live Show', '洪一诺', 'http://p1.music.126.net/5EBR0x84vIppU62pAK_OXw==/109951164455722398.jpg');
INSERT INTO `mv_ranking` VALUES ('10898521', '过路人 Live Show', '冯希瑶', 'http://p1.music.126.net/JOljSnq-S_CbUBxfSOyJtA==/109951164456282837.jpg');
INSERT INTO `mv_ranking` VALUES ('10899613', '龙的传人', '刘宪华 (Henry)', 'http://p1.music.126.net/Chmfw0nVSq2pT-KAMNd7Ag==/109951164459102450.jpg');
INSERT INTO `mv_ranking` VALUES ('10899740', '只只', '孟凡明', 'http://p1.music.126.net/QhneCuukyCygpXAL1X0U9w==/109951164460888673.jpg');
INSERT INTO `mv_ranking` VALUES ('10900290', 'Y.M.C Cypher Ⅰ', '夜楠H.', 'http://p1.music.126.net/xx-y8gbe_Npb8IoVuz5BZw==/109951164473806353.jpg');
INSERT INTO `mv_ranking` VALUES ('10901166', '候鸟的北方 Live Show', '苏北北', 'http://p1.music.126.net/EfBFS8-6UIJopMuSHMpXuQ==/109951164473464919.jpg');
INSERT INTO `mv_ranking` VALUES ('10902170', '(鲁艺合唱团) 可惜不是你 (Cover：梁静茹)', '鲁东大学艺术学院鲁艺合唱团', 'http://p1.music.126.net/D46ONyz1_br_qHqllAdvdA==/109951164496517533.jpg');
INSERT INTO `mv_ranking` VALUES ('10902348', '小哥哥的咖啡店', '陆思恒', 'http://p1.music.126.net/m1ezdF0DbgAVlX3Ydq7QVg==/109951164501106739.jpg');
INSERT INTO `mv_ranking` VALUES ('10903127', '《明日方舟》「喧闹法则」EP - SPEED OF LIGHT by DJ OKAWARI', '塞壬唱片-MSR', 'http://p1.music.126.net/z_4K4vlLbTg6GyU7DRrTHg==/109951164498325181.jpg');
INSERT INTO `mv_ranking` VALUES ('10903906', '那个Ta', '董向科', 'http://p1.music.126.net/eFpTQWnFO_D2y7nJ6k680Q==/109951164517244814.jpg');
INSERT INTO `mv_ranking` VALUES ('10904208', '夜游大唐城', '杨虹', 'http://p1.music.126.net/nRH1Sk26zyb922w0Tb2kwQ==/109951164513805367.jpg');
INSERT INTO `mv_ranking` VALUES ('10904580', '别认怂', '萧敬腾', 'http://p1.music.126.net/uBlkIbYdKkuqey_5AIdvfQ==/109951164524829696.jpg');
INSERT INTO `mv_ranking` VALUES ('10904989', '麻雀', '李荣浩', 'http://p1.music.126.net/-LkI0yoGquAWFl2W3kEXIg==/109951164536308330.jpg');
INSERT INTO `mv_ranking` VALUES ('10905039', '角儿无大小', 'R1SE', 'http://p1.music.126.net/aqkof8LWmsIM_ghb1J-9hQ==/109951164522938408.jpg');
INSERT INTO `mv_ranking` VALUES ('10905226', '空降ING EP2 隔壁老樊:把我曾经的故事唱给你听', '隔壁老樊', 'http://p1.music.126.net/3OZyio4fq38Yer9-hQg3dA==/109951164526254429.jpg');
INSERT INTO `mv_ranking` VALUES ('10905586', '疯子 (完整版)', 'R1SE', 'http://p1.music.126.net/gnDz2OTY4ytzJXuifTMCCg==/109951164536211266.jpg');
INSERT INTO `mv_ranking` VALUES ('10905645', '来不及 Live版', '刘瑞琦', 'http://p1.music.126.net/DBlzbqlRRs_sSuZjQfCCYw==/109951164538646049.jpg');
INSERT INTO `mv_ranking` VALUES ('10905772', '二零三', '毛不易', 'http://p1.music.126.net/UwOYU1Tm4OrgmN8_XUs1Mg==/109951164540879273.jpg');
INSERT INTO `mv_ranking` VALUES ('10905775', '《明日方舟》EP – Zone 10⁻⁸', '塞壬唱片-MSR', 'http://p1.music.126.net/5ZPDJlPvXkubU13h24TM8Q==/109951164540987598.jpg');
INSERT INTO `mv_ranking` VALUES ('10906490', 'Never Surrender', 'R1SE', 'http://p1.music.126.net/diWxAqNktdFdFB2Se8MU4g==/109951164551145323.jpg');
INSERT INTO `mv_ranking` VALUES ('10907034', '曾经深爱的你', '绿霖风', 'http://p1.music.126.net/asXICnaRHJtEe7_rBVfCEQ==/109951164546425917.jpg');
INSERT INTO `mv_ranking` VALUES ('10907103', '外婆', '张艺兴', 'http://p1.music.126.net/wQ1FFZbeUg0Weh7sklf8fQ==/109951164551968249.jpg');
INSERT INTO `mv_ranking` VALUES ('10907275', 'Free-Out 2019 cypher', 'Free-Out', 'http://p1.music.126.net/7w0lURaoKDI0EA9bLZE5CQ==/109951164563937063.jpg');

-- ----------------------------
-- Table structure for url
-- ----------------------------
DROP TABLE IF EXISTS `url`;
CREATE TABLE `url` (
  `user_name` bigint(12) NOT NULL,
  `music_url` varchar(255) DEFAULT NULL,
  `music_src` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of url
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` bigint(11) NOT NULL,
  `password` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `music` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '13172750325', '123456', null, null, '');
INSERT INTO `user` VALUES ('7', '15975554067', '123456789', null, null, null);
INSERT INTO `user` VALUES ('8', '15975554067', '123456', null, null, null);
