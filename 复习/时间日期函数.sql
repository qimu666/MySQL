#日期时间相关函数

-- CURRENT_DATE()  当前日期
SELECT CURRENT_DATE() FROM DUAL; 

-- CURRENT_TIME()  当前时间
SELECT CURRENT_TIME() FROM DUAL; 

-- CURRENT_TIMESTAMP() 当前时间戳
SELECT CURRENT_TIMESTAMP() FROM DUAL; 

-- NOW()  当前的日期和时间
SELECT NOW() FROM DUAL;

-- YEAR | MONTH | DAY | DATE(datetime) 返回指定的年或月或日
SELECT YEAR(NOW()) FROM DUAL;
SELECT MONTH(NOW()) FROM DUAL;
SELECT YEAR('2022-9-9') FROM DUAL;

-- DATE_ADD ( date, INTERVAL d_value d_type)  中date中加上日期或时间
-- INTERVAL后面可以是year minute second hour day等
-- 请查询在10分钟内发布的新闻
SELECT * FROM mes WHERE DATE_ADD(send_time, INTERVAL 10 MINUTE)>=NOW();

-- DATE_SUB( date, INTERVAL d_value d_type)  中date中减去日期或时间
-- 请查询在10分钟内发布的新闻
SELECT * FROM mes WHERE send_time >= DATE_SUB(NOW(), INTERVAL 10 MINUTE);

-- DATEDIFF(date1,date2) 两个日期差（结果是天）
SELECT DATEDIFF('2011-11-11','1990-01-01') FROM DUAL

-- UNIX_TIMESTAMP() 返回1970-1-1 到现在的秒数
SELECT UNIX_TIMESTAMP() FROM DUAL;

-- FROM_UNIXTIME() 可以把 UNIX_TIMESTAMP 秒数【时间戳】，转成指定格式的日期
-- %Y-%m-%d 表示年月日
-- %Y-%m-%d %H:%i:%s 表示年月日时分秒
SELECT FROM_UNIXTIME(1662645690,'%Y-%m-%d') FROM DUAL;
SELECT FROM_UNIXTIME(1662645690,'%Y-%m-%d %H:%i:%s') FROM DUAL;


-- 创建测试表 信息表
CREATE TABLE mes(
id INT,
content VARCHAR(30),
send_time DATETIME
);

-- 添加一条记录   使用时间戳
INSERT INTO mes VALUES(1,'北京新闻',CURRENT_TIMESTAMP());
--                使用 NOW() 函数
INSERT INTO mes VALUES(2,'广州新闻',NOW());
--                普通方法
INSERT INTO mes VALUES(3,'上海新闻','2022-9-19');

INSERT INTO mes VALUES(4,'河南新闻',CURRENT_TIMESTAMP());


#  应用实例:
-- 1.显示所有新闻信息，发布日期只显示日期，不用显示时间
SELECT id,content,DATE(send_time) FROM mes;

-- 2.请查询在10分钟内发布的新闻
-- (1).
SELECT * FROM mes WHERE DATE_ADD(send_time, INTERVAL 10 MINUTE)>=NOW();
-- (2).
SELECT * FROM mes WHERE send_time >= DATE_SUB(NOW(), INTERVAL 10 MINUTE);

-- 3.请在mysq1的sq1语句中求2011-11-11和1990-1-1相差多少天
SELECT DATEDIFF('2011-11-11','1990-01-01') FROM DUAL

-- 4.请用mysq1的sg1语句求出你活了多少天？
SELECT DATEDIFF(NOW(),'2002-05-14') FROM DUAL;

-- 5.如果你能活80岁，求出你还能活多少天
SELECT DATEDIFF(DATE_ADD('2002-05-14', INTERVAL 80 YEAR),NOW()) FROM DUAL;

SELECT * FROM mes
