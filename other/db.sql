#1:进入xz库中
USE xz;
#2:创建新闻表
CREATE TABLE xz_news(
 id    INT PRIMARY KEY AUTO_INCREMENT, 
 title VARCHAR(128),
 ctime DATETIME,
 img_url VARCHAR(255),
 point INT
);
#now() 当前数据库时间 年月日时分秒
INSERT INTO xz_news VALUES(null,'..1',now(),
"http://127.0.0.1:3000/img/muwu.jpg",0);
INSERT INTO xz_news VALUES(null,'..2',now(),
"http://127.0.0.1:3000/img/muwu.jpg",0);
INSERT INTO xz_news VALUES(null,'..3',now(),
"http://127.0.0.1:3000/img/muwu.jpg",0);
INSERT INTO xz_news VALUES(null,'..4',now(),
"http://127.0.0.1:3000/img/muwu.jpg",0);
INSERT INTO xz_news VALUES(null,'..5',now(),
"http://127.0.0.1:3000/img/muwu.jpg",0);
INSERT INTO xz_news VALUES(null,'..6',now(),
"http://127.0.0.1:3000/img/muwu.jpg",0);
INSERT INTO xz_news VALUES(null,'..7',now(),
"http://127.0.0.1:3000/img/muwu.jpg",0);
INSERT INTO xz_news VALUES(null,'..8',now(),
"http://127.0.0.1:3000/img/muwu.jpg",0);
INSERT INTO xz_news VALUES(null,'..9',now(),
"http://127.0.0.1:3000/img/muwu.jpg",0);
INSERT INTO xz_news VALUES(null,'..10',now(),
"http://127.0.0.1:3000/img/muwu.jpg",0);
INSERT INTO xz_news VALUES(null,'..11',now(),
"http://127.0.0.1:3000/img/muwu.jpg",0);
INSERT INTO xz_news VALUES(null,'..12',now(),
"http://127.0.0.1:3000/img/muwu.jpg",0);
INSERT INTO xz_news VALUES(null,'..13',now(),
"http://127.0.0.1:3000/img/muwu.jpg",0);
INSERT INTO xz_news VALUES(null,'..14',now(),
"http://127.0.0.1:3000/img/muwu.jpg",0);
INSERT INTO xz_news VALUES(null,'..15',now(),
"http://127.0.0.1:3000/img/muwu.jpg",0);
CREATE TABLE `xz_comment` (
  `id` int(11) NOT NULL,
  `content` varchar(140) DEFAULT NULL,
  `ctime` datetime DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `nid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--

--

INSERT INTO `xz_comment` (`id`, `content`, `ctime`, `user_name`, `nid`) VALUES
(1, 'ha ha1', '2018-10-31 19:32:08', '匿名 ', 1),
(2, 'ha ha2', '2018-10-31 19:32:08', '匿名 ', 1),
(3, 'ha ha3', '2018-10-31 19:32:08', '匿名 ', 1),
(4, 'ha ha4', '2018-10-31 19:32:08', '匿名 ', 1),
(5, 'ha ha5', '2018-10-31 19:32:08', '匿名 ', 1),
(6, 'ha ha6', '2018-10-31 19:32:08', '匿名 ', 1),
(7, 'ha ha7', '2018-10-31 19:32:08', '匿名 ', 1),
(8, 'ha ha8', '2018-10-31 19:32:09', '匿名 ', 1),
(9, 'ha ha9', '2018-10-31 19:32:09', '匿名 ', 1),
(10, 'ha ha10', '2018-10-31 19:32:09', '匿名 ', 1),
(11, 'ha ha11', '2018-10-31 19:32:09', '匿名 ', 1),
(12, 'ha ha12', '2018-10-31 19:32:09', '匿名 ', 1),
(13, 'ha ha13', '2018-10-31 19:32:09', '匿名 ', 1),
(14, 'ha ha14', '2018-10-31 19:32:09', '匿名 ', 1),
(15, 'ha ha15', '2018-10-31 19:32:09', '匿名 ', 1),
(21, '超超', '2018-11-01 16:56:52', '匿名', 1),
(22, 'hfdgh', '2018-11-01 20:19:25', '匿名', 1);










