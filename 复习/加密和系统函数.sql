
-- USER() 查询用户
-- 可以查看登录到mysq1的有哪些用户，以及登录的ip
SELECT USER() FROM DUAL; -- 用户@ip地址

-- DATABASE(); 查询当前使用数据库名称
SELECT DATABASE();

-- MD5(str) 为字符串算出一个MD5 32位的字符串，常用（用户密码）加密
-- root密码是 qimu ->加密md5->在数据库中存放的是加密后的密码
SELECT MD5('qimu')FROM DUAL;

-- 演示用户表 ,存放密码 是MD5
CREATE TABLE user_md5 (
  `ame` VARCHAR (20) NOT NULL DEFAULT '',
  pwd CHAR (32) NOT NULL DEFAULT ''
);

INSERT INTO user_md5 VALUES ('柒木',MD5('qimu'));

-- 查询 的时候要加上MD5() 才能查到
SELECT * FROM user_md5 WHERE ame = '柒木' AND pwd =MD5('qimu');

SELECT * FROM user_md5;

-- PASSWORD(str) 加密函数  MySQL数据库的用户密码就是用PASSWORD函数加密
SELECT PASSWORD('qimu')FROM DUAL;