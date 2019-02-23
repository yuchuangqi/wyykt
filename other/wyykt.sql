#客户端编码为UTF8
SET NAMES UTF8;
#丢弃数据库wyykt,如果存在
DROP DATABASE IF EXISTS wyykt;
#创建数据库wyykt,设置编码为UTF8
CREATE DATABASE	wyykt charset=utf8;
#进入数据库
USE wyykt;

#轮播图图片OK
DROP TABLE IF EXISTS wyykt_index_carousel;
CREATE TABLE wyykt_index_carousel(
	cid TINYINT PRIMARY KEY AUTO_INCREMENT,
	img varchar(128) default NULL,
	title varchar(64) default NULL,
	href varchar(128) default NULL,
	stated varchar(64) default NULL,
	bgColor varchar(12) default NULL
);
INSERT INTO wyykt_index_carousel values(null,"imgs/index/lunbotu1.png","轮播图1",null,'1',"000000");
INSERT INTO wyykt_index_carousel values(null,"imgs/index/lunbotu2.png","轮播图2",null,'1',"081C31");
INSERT INTO wyykt_index_carousel values(null,"imgs/index/lunbotu3.png","轮播图3",null,'1',"DE323C");
INSERT INTO wyykt_index_carousel values(null,"imgs/index/lunbotu4.png","轮播图4",null,'1',"030224");
INSERT INTO wyykt_index_carousel values(null,"imgs/index/lunbotu5.png","轮播图5",null,'1',"030313");
INSERT INTO wyykt_index_carousel values(null,"imgs/index/lunbotu6.png","轮播图6",null,'1',"353454");
INSERT INTO wyykt_index_carousel values(null,"imgs/index/lunbotu7.png","轮播图7",null,"false","");
INSERT INTO wyykt_index_carousel values(null,"imgs/index/lunbotu8.png","轮播图8",null,"false","");
INSERT INTO wyykt_index_carousel values(null,"imgs/index/lunbotu9.png","轮播图9",null,"false","");
#下方滑动图OK
DROP TABLE IF EXISTS wyykt_index_hdend;
CREATE TABLE wyykt_index_hdend(
	id INT default NULL,
	img varchar(128) default NULL,
	title varchar(64) default NULL,
	txt varchar(64) NOT NULL,
	href varchar(128) default NULL
);
INSERT INTO wyykt_index_hdend values(null,"imgs/index/top01.png","电商数据分析师","网易电商数据分析全揭秘",NULL);
INSERT INTO wyykt_index_hdend values(null,"imgs/index/top02.png","数据可视化","传授高效数据可视化技法",NULL);
INSERT INTO wyykt_index_hdend values(null,"imgs/index/top03.png","自然语言处理工程师","解锁NLP工程师必备技能",NULL);
INSERT INTO wyykt_index_hdend values(null,"imgs/index/top04.png","Java高级开发工程师","高并发分布式架构核心技术",NULL);
INSERT INTO wyykt_index_hdend values(null,"imgs/index/top05.png","Java基础入门","零基础入门Java第一课",NULL);
INSERT INTO wyykt_index_hdend values(null,"imgs/index/top06.png","高级UI设计师2.0","网易出品的设计进阶指导",NULL);
INSERT INTO wyykt_index_hdend values(null,"imgs/index/top07.png","深度学习工程师","35个实战项目+GPU在线实操",NULL);
INSERT INTO wyykt_index_hdend values(null,"imgs/index/top08.png","AI计算机视觉工程师","城市数据图&网易&硅谷团队",NULL);
INSERT INTO wyykt_index_hdend values(null,"imgs/index/top09.png","人工智能数学基础","精准掌握人工智能核心教学",NULL);
INSERT INTO wyykt_index_hdend values(null,"imgs/index/top10.png","交互设计师","网易&浙大最强交互设计导师",NULL);
INSERT INTO wyykt_index_hdend values(null,"imgs/index/top11.png","互联网项目管理","网易一线成功项目经验",NULL);

#登录——用户信息，md5加密,明文一样，加密一样
DROP TABLE IF EXISTS wyykt_user;
CREATE TABLE wyykt_user(
	uid int(11) not null auto_increment COMMENT '用户ID',
	uname varchar(32) default NULL COMMENT '用户昵称',
	upwd varchar(32) default NULL COMMENT '用户密码',
	email varchar(64) default NULL COMMENT '用户邮箱',
	phone varchar(16) NOT NULL COMMENT '用户手机',#手机注册
	avatar varchar(128) default NULL COMMENT '用户头像',
	user_name varchar(32) default NULL COMMENT '用户真实姓名',
	gender int(11) default NULL COMMENT '用户姓名',
	isVip  int default NULL COMMENT '是否VIP',
	primary key(uid)
);
INSERT INTO wyykt_user values('1','dingding', md5('123456'), 'ding@qq.com', '12345678901', 'img/avatar/default.png', '丁春秋', '0','1');
INSERT INTO wyykt_user values('2','dangdang',md5('123456'),'dang@163.com','123',null,null,'1','0');
INSERT INTO wyykt_user VALUES ('3', 'doudou', md5('123456'), 'dou@qq.com','13501234569', null, '窦志强', '1','0');
INSERT INTO wyykt_user values ('4', 'yaya', md5('123456'), 'ya@qq.com', '13501234560', null, '小明', '0','0');
INSERT INTO wyykt_user values ('5', 'yu', md5('123456'), 'ya@qq.com', '15018465704', null, '鱼传奇', '0','1');
INSERT INTO wyykt_user values ('6', 'dd', md5('123456'), 'ya@qq.com', '123456', null, '鱼传奇', '0','1');

#主页——推荐行家
DROP TABLE IF EXISTS wyykt_tjhj;
CREATE TABLE wyykt_tjhj(
	tid int(11) not null auto_increment,
	tname varchar(32) default NULL,
	img varchar(128) NOT NULL,
	title varchar(64) not null,
	primary key(tid)
);
INSERT INTO wyykt_tjhj values('1','文豪', 'imgs/index/HJ_WH.png', '福布斯精英、华尔街投行分析师');
INSERT INTO wyykt_tjhj values('2','秋叶', 'imgs/index/HJ_QY.png', '秋叶PPT创始人、畅销书作者');
INSERT INTO wyykt_tjhj values('3','橘子老师', 'imgs/index/HJ_JZLS.png', '同济大学博士设计软件通网站创始人');
INSERT INTO wyykt_tjhj values('4','咔图叶梓', 'imgs/index/HJ_KTYZ.png', '咔图摄影教育中心创始人及CEO');
INSERT INTO wyykt_tjhj values('5','简七', 'imgs/index/HJ_JQ.png', '简七理财创始人，理财明星讲师');
INSERT INTO wyykt_tjhj values('6','刘万祥ExcelPro', 'imgs/index/HJ_LWX.png', '数据可视化专家，著《Excel图表之道》');
INSERT INTO wyykt_tjhj values('7','唐宇迪','imgs/index/HJ_TYD.png','人工智能与数据科学领域培训专家');

#主页——系列课程
DROP TABLE IF EXISTS wyykt_index_xlkc;
CREATE TABLE wyykt_index_xlkc(
    xid TINYINT default null,
	title varchar(128) not null,
	img varchar(128) not null,
	detail varchar(128) default null
);
INSERT INTO wyykt_index_xlkc values(null,'轻松学做产品经理','imgs/index/xlkc01.png','一线互联网大牛带你做产品');
INSERT INTO wyykt_index_xlkc values(null,'影视制作进阶班','imgs/index/xlkc02.png','让我们一起学点进阶技术吧');
INSERT INTO wyykt_index_xlkc values(null,'跟C计划学思辨','imgs/index/xlkc03.png','系统提高理性思维能力');
INSERT INTO wyykt_index_xlkc values(null,'跟曾兰一起学摄影','imgs/index/xlkc04.png','为什么用心拍照了,总还是差点什么');
INSERT INTO wyykt_index_xlkc values(null,'跟外教学地道英语口语','imgs/index/xlkc05.png','告别哑巴英语，从这一刻开始！');
INSERT INTO wyykt_index_xlkc values(null,'Python人工智能实战','imgs/index/xlkc06.png','快速掌握必备基础及实战技巧');
INSERT INTO wyykt_index_xlkc values(null,'设计必学：2大利器','imgs/index/xlkc07.png','Photoshop和Illustrator');
INSERT INTO wyykt_index_xlkc values(null,'人人都用得上的通识课','imgs/index/xlkc08.png','云课堂行家出品，通俗易懂讲解新知');


#主页——精选好课
DROP TABLE IF EXISTS wyykt_index_jxhk;
CREATE TABLE wyykt_index_jxhk(
	hpid  TINYINT default null,
    jxid TINYINT default null,
	title varchar(128) not null,
	img varchar(128) not null,
	detail varchar(128) default null,
	href varchar(128) default NULL
);
INSERT INTO wyykt_index_jxhk values(null,null,'跟橘子学Ai','imgs/index/jxhk01.png','云课堂行家精品课，Ai入门必备',null);
INSERT INTO wyykt_index_jxhk values(null,null,'【送福利】和秋叶一起学PPT','imgs/index/jxhk02.png','网易云课堂独家好课，超6万人学习',null);
INSERT INTO wyykt_index_jxhk values(null,null,'秀米排版设计全攻略','imgs/index/jxhk03.png','由浅入深介绍图文排版的基本操作',null);
INSERT INTO wyykt_index_jxhk values(null,null,'HR专家训练营2018版','imgs/index/jxhk04.png','学会更深层的营业与业务思维',null);
INSERT INTO wyykt_index_jxhk values(null,null,'[400节]秋叶Word+Excel+PPT','imgs/index/jxhk05.png','精选办公实战案例，场景化教学',null);
INSERT INTO wyykt_index_jxhk values(null,null,'告别低效，人人必备的聪明工作法','imgs/index/jxhk06.png','少数派重磅新课',null);
INSERT INTO wyykt_index_jxhk values(null,null,'python全栈习题课','imgs/index/jxhk07.png','免费Python全栈班收费辅导课',null);
INSERT INTO wyykt_index_jxhk values(null,null,'英语口语革命【外教+证书】','imgs/index/jxhk08.png','跟着外教三个月练一口地道口语',null);

#主页——新课推荐
DROP TABLE IF EXISTS wyykt_index_xktj;
CREATE TABLE wyykt_index_xktj(
	hpid  TINYINT default null,
    xkid TINYINT default null,
	title varchar(128) not null,
	img varchar(128) not null,
	detail varchar(128) default null,
	href varchar(128) default NULL
);
INSERT INTO wyykt_index_xktj values(null,null,'和波波养一起学时间管理','imgs/index/xktj01.png','30天超级训练营，每天多出2小时',null);
INSERT INTO wyykt_index_xktj values(null,null,'嗨宝手工折出来','imgs/index/xktj02.png','免费赠送课程配套品牌材料包',null);
INSERT INTO wyykt_index_xktj values(null,null,'Adobe UI设计工具全家桶','imgs/index/xktj03.png','橘子老师新作，UI设计筑基课',null);
INSERT INTO wyykt_index_xktj values(null,null,'绘本写作课','imgs/index/xktj04.png','探索成长足迹',null);INSERT INTO wyykt_index_xktj values(null,null,'如何在一个月内迅速提高听力','imgs/index/xktj05.png','迅速提高听力能力',null);
INSERT INTO wyykt_index_xktj values(null,null,'网易官方股票进阶课','imgs/index/xktj06.png','十年投资经验总结提炼',null);
INSERT INTO wyykt_index_xktj values(null,null,'锐普的PPT图表课','imgs/index/xktj07.png','超易懂！超专业！分分钟变大神！',null);
INSERT INTO wyykt_index_xktj values(null,null,'1分钟战胜拖延','imgs/index/xktj08.png','深入介绍战胜拖延的神奇方法',null);


DROP TABLE IF EXISTS wyykt_courses_pic;
CREATE TABLE wyykt_courses_pic(
    id INT PRIMARY KEY AUTO_INCREMENT, 
	pid TINYINT default null,
	sm varchar(128) default null,
	lg varchar(128) default null
);
#好评
INSERT INTO wyykt_courses_pic values(NULL,1,"imgs/course/sm/haoping/25b22997b3784bd8bd86c563a86e4a46.png","imgs/course/lg/haoping/25b22997b3784bd8bd86c563a86e4a46.png");
INSERT INTO wyykt_courses_pic values(NULL,2,"imgs/course/sm/haoping/6631884702838490066.jpg","imgs/course/lg/haoping/6631884702838490066.jpg");
INSERT INTO wyykt_courses_pic values(NULL,3,"imgs/course/sm/haoping/846676730045899622.jpg","imgs/course/lg/haoping/846676730045899622.jpg");
INSERT INTO wyykt_courses_pic values(NULL,4,"imgs/course/sm/haoping/672da0b7380e40c4af5c3f17b9accf07.jpg","imgs/course/lg/haoping/672da0b7380e40c4af5c3f17b9accf07.jpg");
INSERT INTO wyykt_courses_pic values(NULL,5,"imgs/course/sm/haoping/82dac410-8ef9-44f4-8f89-fab7e3aeb82a.jpg","imgs/course/lg/haoping/82dac410-8ef9-44f4-8f89-fab7e3aeb82a.jpg");
INSERT INTO wyykt_courses_pic values(NULL,6,"imgs/course/sm/haoping/4E20256B63A38DBAEA72920A573DD829.png","imgs/course/lg/haoping/4E20256B63A38DBAEA72920A573DD829.png");
INSERT INTO wyykt_courses_pic values(NULL,7,"imgs/course/sm/haoping/aca56433095949b496146fba04654229.png","imgs/course/lg/haoping/aca56433095949b496146fba04654229.png");
INSERT INTO wyykt_courses_pic values(NULL,8,"imgs/course/sm/haoping/87fb83e4-9d70-4f7d-a2ce-9573e709e4d0.png","imgs/course/lg/haoping/87fb83e4-9d70-4f7d-a2ce-9573e709e4d0.png");
INSERT INTO wyykt_courses_pic values(NULL,9,"imgs/course/sm/haoping/369e1373-25f7-4424-8c81-0d7f61038558.jpg","imgs/course/lg/haoping/369e1373-25f7-4424-8c81-0d7f61038558.jpg");
INSERT INTO wyykt_courses_pic values(NULL,10,"imgs/course/sm/haoping/DD0350D1CE29CE1ABEC7C0B279EBB8BD.jpg","imgs/course/lg/haoping/DD0350D1CE29CE1ABEC7C0B279EBB8BD.jpg");
INSERT INTO wyykt_courses_pic values(NULL,11,"imgs/course/sm/haoping/adaed10d3bc148de9ef64361055c1573.jpg","imgs/course/lg/haoping/adaed10d3bc148de9ef64361055c1573.jpg");
INSERT INTO wyykt_courses_pic values(NULL,12,"imgs/course/sm/haoping/0316fc82-898f-4c3e-95e1-ad8dd7e6efc1.jpg","imgs/course/lg/haoping/0316fc82-898f-4c3e-95e1-ad8dd7e6efc1.jpg");
INSERT INTO wyykt_courses_pic values(NULL,13,"imgs/course/sm/haoping/af2c654414a7441d99e696c1770a55c1.png","imgs/course/lg/haoping/af2c654414a7441d99e696c1770a55c1.png");
INSERT INTO wyykt_courses_pic values(NULL,14,"imgs/course/sm/haoping/0bceeb71-2e81-45a1-b6d5-202755b5e31d.png","imgs/course/lg/haoping/0bceeb71-2e81-45a1-b6d5-202755b5e31d.png");
INSERT INTO wyykt_courses_pic values(NULL,15,"imgs/course/sm/haoping/9618743e-6a97-411c-87f4-cd37119d5bab.jpg","imgs/course/lg/haoping/9618743e-6a97-411c-87f4-cd37119d5bab.jpg");
#畅销
#新课
INSERT INTO wyykt_courses_pic values(NULL,16,"imgs/course/sm/xinke/aa672d2c51c4476296d1c6efd8b8f532.jpg","imgs/course/lg/xinke/aa672d2c51c4476296d1c6efd8b8f532.jpg");
INSERT INTO wyykt_courses_pic values(NULL,17,"imgs/course/sm/xinke/14d9d0fa67034a70a76b474ff62fab25.png","imgs/course/lg/xinke/14d9d0fa67034a70a76b474ff62fab25.png");
INSERT INTO wyykt_courses_pic values(NULL,18,"imgs/course/sm/xinke/8feb146e7d184738bf3da91daa1ef8a2.png","imgs/course/lg/xinke/8feb146e7d184738bf3da91daa1ef8a2.png");
INSERT INTO wyykt_courses_pic values(NULL,19,"imgs/course/sm/xinke/b5e81c64-885e-44f6-b93a-56b16870510c.png","imgs/course/lg/xinke/b5e81c64-885e-44f6-b93a-56b16870510c.png");
INSERT INTO wyykt_courses_pic values(NULL,20,"imgs/course/sm/xinke/c7639789-1540-46da-a8ec-aeb67249d02c.jpg","imgs/course/lg/xinke/c7639789-1540-46da-a8ec-aeb67249d02c.jpg");
INSERT INTO wyykt_courses_pic values(NULL,21,"imgs/course/sm/xinke/0897fb94dbf745a79c7a0e85b2e341aa.jpeg","imgs/course/lg/xinke/0897fb94dbf745a79c7a0e85b2e341aa.jpeg");
INSERT INTO wyykt_courses_pic values(NULL,22,"imgs/course/sm/xinke/93c69289a22747558cfbecc0c8a0aa38.png","imgs/course/lg/xinke/93c69289a22747558cfbecc0c8a0aa38.png");
INSERT INTO wyykt_courses_pic values(NULL,23,"imgs/course/sm/xinke/e9510a76-6775-4935-badd-b32f7068d4d5.jpg","imgs/course/lg/xinke/e9510a76-6775-4935-badd-b32f7068d4d5.jpg");
INSERT INTO wyykt_courses_pic values(NULL,24,"imgs/course/sm/xinke/5eb2221cfba04687abeccc3df6298fd7.jpg","imgs/course/lg/xinke/5eb2221cfba04687abeccc3df6298fd7.jpg");
INSERT INTO wyykt_courses_pic values(NULL,25,"imgs/course/sm/xinke/fa9ff83866d34a718588a4e56521d335.jpg","imgs/course/lg/xinke/fa9ff83866d34a718588a4e56521d335.jpg");
INSERT INTO wyykt_courses_pic values(NULL,26,"imgs/course/sm/xinke/b9c80a5561ed4922bae2957a9e33c1ca.jpg","imgs/course/lg/xinke/b9c80a5561ed4922bae2957a9e33c1ca.jpg");
INSERT INTO wyykt_courses_pic values(NULL,27,"imgs/course/sm/xinke/c3fd5c5dc0124b018f7a8898c164c8ab.jpg","imgs/course/lg/xinke/c3fd5c5dc0124b018f7a8898c164c8ab.jpg");
INSERT INTO wyykt_courses_pic values(NULL,28,"imgs/course/sm/xinke/189d94a9de0042e9970b92629635d37e.jpg","imgs/course/lg/xinke/189d94a9de0042e9970b92629635d37e.jpg");
INSERT INTO wyykt_courses_pic values(NULL,29,"imgs/course/sm/xinke/eaa64d9cb5dd4019b39f79931a12d580.png","imgs/course/lg/xinke/eaa64d9cb5dd4019b39f79931a12d580.png");
INSERT INTO wyykt_courses_pic values(NULL,30,"imgs/course/sm/xinke/115d195392e146b09f6143514c037c74.png","imgs/course/lg/xinke/115d195392e146b09f6143514c037c74.png");
INSERT INTO wyykt_courses_pic values(NULL,31,"imgs/course/sm/xinke/6ef0236121524c97ae4d7ab2d9116e56.jpg","imgs/course/lg/xinke/6ef0236121524c97ae4d7ab2d9116e56.jpg");
INSERT INTO wyykt_courses_pic values(NULL,32,"imgs/course/sm/xinke/a4ba7ee6927c4c169e727c8fec7c7bf4.jpg","imgs/course/lg/xinke/a4ba7ee6927c4c169e727c8fec7c7bf4.jpg");
INSERT INTO wyykt_courses_pic values(NULL,33,"imgs/course/sm/xinke/0bd0cb3859f0463a8deb76ec0f314aef.jpg","imgs/course/lg/xinke/0bd0cb3859f0463a8deb76ec0f314aef.jpg");
INSERT INTO wyykt_courses_pic values(NULL,34,"imgs/course/sm/xinke/4d0bd330adf949e5829669c6243f4b85.jpg","imgs/course/lg/xinke/4d0bd330adf949e5829669c6243f4b85.jpg");
INSERT INTO wyykt_courses_pic values(NULL,35,"imgs/course/sm/xinke/f4a5820748414d53abe10bd9bad0b075.jpeg","imgs/course/lg/xinke/f4a5820748414d53abe10bd9bad0b075.jpeg");
INSERT INTO wyykt_courses_pic values(NULL,36,"imgs/course/sm/xinke/370759f970824b8a92002cf427f0f95d.jpg","imgs/course/lg/xinke/370759f970824b8a92002cf427f0f95d.jpg");
INSERT INTO wyykt_courses_pic values(NULL,37,"imgs/course/sm/xinke/cea418a929914128b5bd7afd94965f91.png","imgs/course/lg/xinke/cea418a929914128b5bd7afd94965f91.png");
INSERT INTO wyykt_courses_pic values(NULL,38,"imgs/course/sm/xinke/885fcf6f6e134d849ac357640b2f026a.jpg","imgs/course/lg/xinke/885fcf6f6e134d849ac357640b2f026a.jpg");
INSERT INTO wyykt_courses_pic values(NULL,39,"imgs/course/sm/xinke/cae234c05f6047ff8577debd7d3deb08.jpg","imgs/course/lg/xinke/cae234c05f6047ff8577debd7d3deb08.jpg");
INSERT INTO wyykt_courses_pic values(NULL,40,"imgs/course/sm/xinke/6710fe38ef5f41faa9f07233429d3e25.png","imgs/course/lg/xinke/6710fe38ef5f41faa9f07233429d3e25.png");

-- create table xz_login(
--     id int primary key auto_increment,
--    uname varchar(25) not null default '',
--    upwd varchar(32) not null default ''
-- --   注意分号，一般设置为非空，默认为‘’都比空好
-- )
-- insert into xz_login values(null,'dd',md5('123'));
-- insert into xz_login values(null,'dd',md5('112'));
-- insert into xz_login values(null,'dd',md5('134'));

#全部课程,cid课程,AUTO_INCREMENT删除不会自动替换编号
DROP TABLE IF EXISTS wyykt_courses;
CREATE TABLE wyykt_courses(
	cid INT  PRIMARY KEY AUTO_INCREMENT,
	title varchar(128) default null,
	price varchar(64) default null,
	Saleprice varchar(64) default null,
	orgName varchar(64) default null,
	starClass varchar(64) default null,
	isHot varchar(128) ,
	isVip varchar(128) ,
	vipPrice varchar(128) ,
	Search varchar(128),
	Array varchar(128)
);
INSERT INTO wyykt_courses values(1,'PS教程超级合辑【800+集爆款课】','￥199.00',"￥699.00",'设计软件通','100%',1,"","",'好评PS教程超级合辑【800+集爆款课】设计软件通畅销','好评');
INSERT INTO wyykt_courses values(2,'老九零基础学编程系列之C语言','免费',"",'老九学堂','100%',0,"","",'好评老九零基础学编程系列之C语言老九学堂','好评');
INSERT INTO wyykt_courses values(3,'跟王佩丰学Excel视频教程：Excel实战1800分钟','免费',"",'ExcelPPT王佩丰','100%',0,"","",'好评跟王佩丰学Excel视频教程：Excel实战1800分钟ExcelPPT王佩丰','好评');
INSERT INTO wyykt_courses values(4,'【送模板】工作型PPT应该这样做','￥249.00',"",'幻方秋叶PPT','100%',1,"","",'好评【送模板】工作型PPT应该这样做幻方秋叶PPT畅销','好评');
INSERT INTO wyykt_courses values(5,'免费Python全系列教程全栈工程师','免费',"",'北京图灵学院','100%',0,"","",'好评免费Python全系列教程全栈工程师北京图灵学院','好评');
INSERT INTO wyykt_courses values(6,'吴恩达机器学习','免费',"",'网易杭州研究院','100%',1,"","",'好评吴恩达机器学习网易杭州研究院畅销','好评');
INSERT INTO wyykt_courses values(7,'AI教程超级合辑【含超值优惠券】','￥699.00',"",'设计软件通','100%',1,"","",'好评AI教程超级合辑【含超值优惠券】设计软件通畅销','好评');
INSERT INTO wyykt_courses values(8,'从零玩转HTML5前端+跨平台开发','免费',"",'指趣学院','100%',0,"","",'好评从零玩转HTML5前端+跨平台开发指趣学院','好评');
INSERT INTO wyykt_courses values(9,'Java学习指南①','免费',"",'啊发你好','100%',0,"","",'好评Java学习指南①啊发你好','好评');
INSERT INTO wyykt_courses values(10,'全名一起VBA基础篇(Excel数据处理)','免费',"",'杨阳老师','100%',1,"","",'好评全名一起VBA基础篇(Excel数据处理)杨阳老师','好评');
INSERT INTO wyykt_courses values(11,'【省30】秋叶Office三合一','￥399.00',"",'幻方秋叶PPT','100%',1,"","",'好评【省30】秋叶Office三合一幻方秋叶PPT畅销','好评');
INSERT INTO wyykt_courses values(12,'大师级PS教程【500+集精品浓缩】','￥119.00','￥699','PS东方站','100%',0,"VIP",'￥99.00','好评大师级PS教程【500+集精品浓缩】PS东方站','好评');
INSERT INTO wyykt_courses values(13,'AE教程超级合辑【影视后期必学】','￥149.00','￥699','设计软件通','100%',0,'','','好评AE教程超级合辑【影视后期必学】设计软件通畅销','好评');
INSERT INTO wyykt_courses values(14,'淘宝开网店入门精通淘宝网店教程','￥188.00','￥800','云里子商学院','100%',0,"VIP",'￥180.00','好评淘宝开网店入门精通淘宝网店教程云里子商学院','好评');
INSERT INTO wyykt_courses values(15,'大师级PS教程【500+集精品浓缩】','免费','','齐轮教育','100%',0,"",'','好评大师级PS教程【500+集精品浓缩】齐轮教育','好评');
#新课
INSERT INTO wyykt_courses values(16,'深入浅出人工智能与机器学习实战','￥99.00',"399.00",'前端学堂FED123','',0,"","",'深入浅出人工智能与机器学习实战前端学堂FED123新课畅销','新课');
INSERT INTO wyykt_courses values(17,'2018大学英语四六级-考前点拔','￥1',"",'陕西文都教育','',0,"","",'2018大学英语四六级-考前点拔陕西文都教育新课','新课');
INSERT INTO wyykt_courses values(18,'全基因组分析构建预后ceRNA网络','￥1000.00',"",'生信人课堂','100%',0,"","",'全基因组分析构建预后ceRNA网络生信人课堂新课','新课');
INSERT INTO wyykt_courses values(19,'情绪管理提升课','￥69.00',"",'培教院','100%',1,"","",'情绪管理提升课培教院新课','新课');
INSERT INTO wyykt_courses values(20,'微课设计开发','￥39.00',"",'培教院','100%',0,"","",'微课设计开发培教院新课','新课');
INSERT INTO wyykt_courses values(21,'韩语零基础发音系统课1月寒假班','￥29.00',"",'蜗牛韩语公社','100%',1,"","",'韩语零基础发音系统课1月寒假班蜗牛韩语公社新课畅销','新课');
INSERT INTO wyykt_courses values(22,'EXCEL财务建模入门','￥1.00',"",'木子','100%',1,"","",'EXCEL财务建模入门木子新课','新课');
INSERT INTO wyykt_courses values(23,'FTT引导课程设计','￥128.00',"",'培教院','100%',0,"","",'FTT引导课程设计培教院新课','新课');
INSERT INTO wyykt_courses values(24,'打碟基础课','￥500.00',"",'指导教学DJ打碟','100%',0,"","",'打碟基础课指导教学DJ打碟新课','新课');
INSERT INTO wyykt_courses values(25,'牛师开讲啦-高中数学考点及规划','￥1000.00',"",'希来教育','100%',1,"","",'牛师开讲啦-高中数学考点及规划希来教育新课','新课');
INSERT INTO wyykt_courses values(26,'牛师开讲啦-高中物理考点及规划','￥1000.00',"",'希来教育','100%',0,"","",'牛师开讲啦-高中物理考点及规划希来教育新课','新课');
INSERT INTO wyykt_courses values(27,'牛师开讲啦-如何做好转介绍回收','￥1000.00',"",'希来教育','100%',0,"","",'牛师开讲啦-如何做好转介绍回收希来教育新课','新课');
INSERT INTO wyykt_courses values(28,'Java教程_java线程状态及转化','免费',"",'黑马程序员','100%',0,"","",'Java教程_java线程状态及转化黑马程序员新课','新课');
INSERT INTO wyykt_courses values(29,'七年级语文上册全国名师优质课','￥88.00',"",'黑马','100%',0,"","",'七年级语文上册全国名师优质课黑马新课','新课');
INSERT INTO wyykt_courses values(30,'十分钟即可制作一个在线技术文档','￥1.00',"",'数据瞎分析','100%',0,"","",'十分钟即可制作一个在线技术文档数据瞎分析新课','新课');
INSERT INTO wyykt_courses values(31,'摄影传统技艺','免费',"",'英之影','100%',1,"","",'摄影传统技艺英之影新课','新课');
INSERT INTO wyykt_courses values(32,'第六时限线上小班精品课N5','￥99.00','￥100.00','第六时限','100%',0,"VIP",'￥99.00','第六时限线上小班精品课N5第六时限新课','新课');
INSERT INTO wyykt_courses values(33,'After Effects2017入门到精通','￥99.00','','火山课堂','100%',0,'','','After Effects2017入门到精通火山课堂新课','新课');
INSERT INTO wyykt_courses values(34,'初级日语上','￥66.00','','第六时限','100%',0,"",'','初级日语上第六时限新课','新课');
INSERT INTO wyykt_courses values(35,'韩语零基础直达初级系统1月班','￥898.00','￥1200.00','蜗牛韩语公社','100%',0,"",'','韩语零基础直达初级系统1月班蜗牛韩语公社新课','新课');
INSERT INTO wyykt_courses values(36,'朗读时如何调动思想感情','￥28.88',"",'土圭专家','100%',0,"","",'朗读时如何调动思想感情土圭专家新课','新课');
INSERT INTO wyykt_courses values(37,'注册消防工程师 教材精讲班','￥1599.00',"",'平安学院','100%',0,"","",'注册消防工程师 教材精讲班平安学院新课','新课');
INSERT INTO wyykt_courses values(38,'高考日语作文写作','￥88.00',"",'第六时限','100%',0,"","",'高考日语作文写作第六时限新课','新课');
INSERT INTO wyykt_courses values(39,'Django开发大型分布式电商平台','￥128.00',"",'可锐职场','100%',0,"","",'Django开发大型分布式电商平台可锐职场新课','新课');
INSERT INTO wyykt_courses values(40,'每天轻松多赚几元多省几块小巧妙','￥1.00',"￥10.00",'软件测试123','100%',0,"","",'每天轻松多赚几元多省几块小巧妙软件测试123新课','新课');

#畅销好课，手机端web
DROP TABLE IF EXISTS wyy_index_cxhk;
CREATE TABLE wyy_index_cxhk(
	id INT PRIMARY KEY AUTO_INCREMENT,
	hkic INT NOT NULL,
	title VARCHAR(255),
	title_new VARCHAR(28) NOT NULL default "",
	title_old VARCHAR(28) NOT NULL default "",
	href varchar(128) NOT NULL
);
INSERT INTO wyy_index_cxhk(id,hkic,title,title_new,title_old,href) VALUES(NULL,4,'Execl从入门到忘记','￥96','￥120','imgs/index/cxhk/cxhk04.jpg');
INSERT INTO wyy_index_cxhk(id,hkic,title,title_new,title_old,href) VALUES(NULL,5,'Excel图表制作思路方法与案例','￥158','','imgs/index/cxhk/cxhk05.jpg');
INSERT INTO wyy_index_cxhk(id,hkic,title,title_new,title_old,href) VALUES(NULL,6,'PPT数据分析报告实战','￥119','￥129','imgs/index/cxhk/cxhk06.jpg');
INSERT INTO wyy_index_cxhk(id,hkic,title,title_new,title_old,href) VALUES(NULL,7,'和秋叶一起学PPT','￥169','','imgs/index/cxhk/cxhk07.jpg');
INSERT INTO wyy_index_cxhk(id,hkic,title,title_new,title_old,href) VALUES(NULL,8,'会声会影X10视频教程之案例提高篇','￥138','￥149','imgs/index/cxhk/cxhk08.jpg');
INSERT INTO wyy_index_cxhk(id,hkic,title,title_new,title_old,href) VALUES(NULL,9,'数码单反摄影高手速成','￥89','￥129','imgs/index/cxhk/cxhk09.jpg');






