mysql -u用户名 -p密码    进入数据库
SHOW DATABASES;    显示当前所有数据库
CREATE DATABASE 数据库名称;    创建数据库
SHOW CREATE DATABASE 数据库名称;    显示指定的数据库信息
cls   清屏
quit   退出
DROP DATABASE 数据库名称;    删除数据库






第二章：
CHARSET=utf8：解决数据库中文乱码
主键约束（PRIMARY KEY）：
1每张表只能存在一个主键
2.主键必须保证记录的唯一性
3.主键自动为不能为null
4.主键可以跟自增长约束同时存在
自增长约束（AUTO_INCREMENT）：
1.一个表中只能有一个字段使用AUTO_INCREMENT
2.必须与主键组合使用
3.默认情况下，起始值为1，增量为1
4.更改AUTO_INCREMENT初始值:ALTER TABLE 表名称 AUTO_INCREMENT=1
非空约束：
1.null空约束，字段值允许为null
2.not null非空约束，字段值不允许为null，必须赋值
默认约束（DEFAULT）：
当插入记录时，如果没有明确为字段赋值，则自动赋予默认值
唯一约束（UNIQUE）：
1.用来保证记录的唯一性 
2.唯一约束的字段可以为空值(NULL)
3.每张表中可以存在多个唯一约束





第三章：
算术运算符：
+ 加运算，求两个数或表达式相加的和，如2+5
- 减运算，求两个数或表达式相减的差
* 乘运算，求两个数或表达式相乘的积
/ 除运算，求两个数或表达式相除的商
% 取模运算，求个数或表达式相除的余数，如:7%4的值为3
赋值运算符：
= 把一个数、变量、表达式、函数赋值给另一个变量或字段
逻辑运算符：
AND 并且仅当两个条件都为真时才返回1
OR 只要其中任意一个条件为真就返回1
NOT 否定取反条件
比较运算符：
>  大于
>= 大于等于
<  小于
<= 小于等于
= 等于
!= 不等于
IS NULL 是否为空
IS NOT NULL 是否不为空
IN 判断一个值是IN列表中的任意一个值
NOT IN 判断一个值不是IN列表中的任意一个值
LIKE 通配符匹配
BETWEEN AND 判断一个值是否在两个值之间
#添加语句
INSERT INTO student(sname,sex,age,bj) VALUES('小三','女',18,'语文');#添加单条数据
INSERT INTO student(sname,sex,age,bj) VALUES('张三','男',33,'软件')#添加多条数据,('李四','女',29,'数学'),('张','男',22,'大数据');
#修改语句
UPDATE student SET sname=1,sex=1,age=1,bj=1 WHERE sid = 1;#修改单条数据
UPDATE student SET sname=1,sex=1,age=1,bj=1;#修改表中的全部数据
#删除语句
DELETE FROM student WHERE sid=2;#删除单条数据
DELETE FROM student;#删除表中的全部数据






#创建数据库
CREATE DATABASE e2022; 
#创建数据表
CREATE TABLE student(
		#主键约束   #自增涨约束
	sid INT PRIMARY KEY AUTO_INCREMENT,#学号
			  #默认约束
	sname VARCHAR(20) DEFAULT '张三',#姓名
		 #空约束NULL是可以为空值
	sex CHAR(2) NULL,#性别	
	    #非空约束NULL是不可以为空值
	age INT NOT NULL,#年龄	
			#唯一约束
	class VARCHAR(20) UNIQUE,#班级
	
	address VARCHAR(20),#地址
	TIME DATE #入学时间
 #中文乱码
)CHARSET=utf8;
#添加记录但不指定所有字段值，不指定字段时，该字段必须是允许为空；
#自动增长列尽量不要指定值；
#有默认值约束的列不指定值时将使用默认值；
#主键列、唯一约束列的值不能重复；
#值与字段名必须一一匹配，但是可以不按照表中字段顺序指定
#添加单条语句
INSERT INTO student (sname,sex,age,class,address,TIME) VALUES('张三','男',22,'软件','许昌','2020-01-01');
INSERT student (sname,sex,age,class,address,TIME) VALUES('张三','男',22,'大数据','许昌','2020-01-01');
INSERT INTO student (sname,sex,age,class,TIME) VALUES('小三','女',22,'高数','2020-05-22');
#添加多条语句
INSERT INTO student (sname,sex,age,class,address,TIME) VALUES('张三','男',22,'语文','许昌','2022-03-04'),
							('李四','男',23,'英语','洛阳','2020-01-05'),
							('王五','女',18,'数学','郑州','2020-06-21'),
							('赵六','女',20,'人工智能','河南','2021-11-11');
#修改单条语句
UPDATE student SET sname='1',sex='1',age=1,class='1',address='1',TIME='1998-02-11' WHERE sid=1;
#修改单个字段
UPDATE student SET sname='55' WHERE sid=1;
#修改全部数据
UPDATE student SET sname='55';

#删除单条语句
DELETE FROM student WHERE sid=1;s
#删除全部数据
DELETE FROM student;
#删除多条语句
DELETE FROM student WHERE sid IN (9,10,11);

#查询全部数据
SELECT * FROM student;
#查询单个字段
SELECT sname,sex,age FROM student;

#使用 修改单个字段的别名
SELECT sname 姓名 FROM student;
#使用AS修改全部字段别名
SELECT sid AS 学号,sname AS 姓名,sex AS 性别,age AS 年龄,class AS 班级,address AS 地址,TIME AS 时间 FROM student;

#条件查询：查询student表中年龄在21岁以上的学生信息
SELECT * FROM student WHERE age>21;
#条件查询：查询student表，地址不为null学生
SELECT * FROM student WHERE address IS NOT NULL;
#条件查询：只查询单个字段，地址为null学生
SELECT address FROM student WHERE address IS NULL;
#在student表中查询出不是1班的学生信息
SELECT * FROM student WHERE class <> '1';
SELECT * FROM student WHERE NOT (class=1);

#多条件查询：在student表中查询出年龄为20岁的女生信息
SELECT age,sex FROM student WHERE age=20 AND sex='女';
#在student表中查询出家不在郑州,年龄不到21岁的学生信息
SELECT address,age FROM student WHERE address <> '郑州' AND age<21;

#Distinct消除重复的字段
SELECT DISTINCT sex FROM student;

#limit限定查询：查询student表中的所有数据只显示前2条数据
SELECT * FROM student LIMIT 2;
#查询student表中的所有数据只显示第6条数据和第10条数据，LIMIT第一个数字是前面留几条数据，第一个数字是显示几条数据
SELECT * FROM student LIMIT 5,5;

#使用Order By进行单列排序：在student表中按照学生的年龄以降序进行排列
SELECT * FROM student ORDER BY age DESC;
#在student表中按照学生的年龄以升序进行排列
SELECT * FROM student ORDER BY age ASC;


#MySQL中字符串的函数
SELECT CONCAT('a','b','c','d');#concat() 连接字符串

SELECT LENGTH('aaaaaa');#length 返回字符串的长度

SELECT UPPER('aaaAAA');#将字符串转换为大写

SELECT LOWER ('aaaAAA');#将字符串转换为小写

SELECT LTRIM('   asd    ');#LTRIM去除左边空格

SELECT RTRIM('   asd    ');#RTRIM去除右边空格

SELECT TRIM('   asd    ');#trim去除两边空格

SELECT REPLACE('bbb','bbb','ccc')#replace 替换


#MySQL中日期的函数
SELECT NOW();#获取当前时间 包含年月日时分秒

SELECT CURDATE();#获取当前年月日

SELECT CURTIME();# 获取当前时分秒

SELECT UNIX_TIMESTAMP();#获取当前日期时间戳

SELECT FROM_UNIXTIME(1646617076)  #将时间戳转换成对应的年月日时间



#MySQL中获取日期时间指定部分的函数
SELECT MONTH('2021-04-17');#返回日期对应的月份（数字类型，返回1到12的整数）

SELECT MONTHNAME('2021-1-17');#返回日期对应的月份（字符串，返回月份的英文全名，如2月份是February）

SELECT DAYNAME('2022-3-7');#返回日期对应的工作日的英文名称

SELECT DAYOFWEEK('2022-3-6')  #返回日期对应的一周中的索引。1表示周日，2表示周一…….

SELECT WEEKDAY('2022-3-7')  #返回日期对应的工作日索引。0表示周一，1表示周二….6表示周日

SELECT WEEK('2022-3-14');  #计算日期是一年中的第几周，范围从1到52

SELECT DAYOFYEAR('2022-3-7');  #计算日期是一年中的第几天，范围从1到366

SELECT DAYOFMONTH('2022-3-7');  #计算日期是一个月中的第几天，范围从1到31

SELECT YEAR('2023-3-7');  #返回日期中年份，范围从1000到9999

SELECT QUARTER('2023-8-7');  #返回日期对应的一年中的季度值，范围从1到4

SELECT MINUTE('2022-3-7 9:4:20');  #返回时间的分钟部分，范围从0到59

SELECT SECOND(NOW());  #返回时间的秒部分，范围从0到59

#MySQL中计算日期和时间的函数
SELECT DATE_ADD('2022-03-07 09:04:20',INTERVAL,1,SECOND);  #为日期增加一个时间间隔

#MySQL中的数学函数
SELECT ABS(2),ABS(-2.2),ABS(-22); #绝对值:负数全部为整数

SELECT CEIL(-2.2),CEIL(3.9); #向上取整:整数向上取整，负数向下取整

SELECT FLOOR(-2.2),FLOOR(3.9); #向下取整:整数向下取整，负数向上取整

SELECT ROUND(3.62); #四舍五入

SELECT RAND(); #随机数

SELECT MOD(16,4); #取余



#查询所有学生的学号、姓名、性别和年龄
SELECT sid,sname,sex,age FROM student;
#查询student表中所有的数据，并且将查询结果中的sid改为学号，sname改为姓名，sex改为性别，age改为年龄
SELECT sid AS 学号,sname AS 姓名,sex AS 性别,age AS 年龄,class,score,address,phone,TIME FROM student;
#要求在student表中查询出年龄在21岁以上的学生信息,只显示学号和年龄
SELECT sid AS 学号,age AS 年龄 FROM student WHERE age>21;
#在student表中查询出年龄为20岁的女生信息  只要不是浮点型或者整型的都需要加''
SELECT * FROM student WHERE age='20' AND sex='女';
#在student表中查询出家不在郑州或者年龄不到21岁的学生信息
SELECT * FROM student WHERE address!='郑州' OR age<'21';
#查询student表中的所有数据,显示第4条到9条,第一个数字是前面留几条数据，第二数字是一共显示几条数据
SELECT * FROM student LIMIT 3,6;
#在student表中按照年龄从大到小排序，如果年龄相同就按着出生日期从小到大进行排列。
SELECT * FROM student ORDER BY age DESC,TIME ASC;

#MySQL中的系统函数
SELECT DATABASE(); #查看当前数据库
SELECT USER();  #查看当前用户
SELECT VERSION();  #查看当前mysql版本
SELECT LAST_INSERT_ID();  #查看添加的最后一条记录的主键id




#查询student表中所有手机尾号为5的学生信息(“%”代表任意n个字符)。
SELECT * FROM student WHERE phone LIKE '%6%';
#查询student表中姓名第一个字符是”小“的(“_”代表任意一个字符)
SELECT * FROM student WHERE sname LIKE '小_';
#查询student表中所有手机第三位数为1(“_”代表任意一个字符)，(“%”代表任意n个字符)
SELECT * FROM student WHERE phone LIKE '__1%';

#求出student表中每门课程的平均分数。
SELECT class AS 课程,AVG(score) AS 平均分 FROM student GROUP BY class;
#查询出每个班级的学生人数
SELECT class AS 班级,COUNT(sid) AS 人数 FROM student GROUP BY class;
#查询出每个城市中年龄最小的学生
SELECT address AS 城市,MIN(age) FROM student GROUP BY address;
#统计每门课程的成绩，分别对每一组进行平均分、最大值、最小值、总成绩和人数的计算。
SELECT class AS 课程,AVG(score)AS 平均分,MAX(score)AS 最大值,MIN(score)AS 最小值,SUM(score)AS 总成绩,COUNT(sid)AS 人数 FROM student GROUP BY class;

#获取student表中每个班级的男女生人数
SELECT class AS 班级,sex AS 性别,COUNT(sid)AS 人数 FROM student GROUP BY class,sex;



#查询student表中电话号的第三位数字为1的学生信息,_代表一个字符、可以连着写多个下划线,%代表n个字符
SELECT * FROM student WHERE phone LIKE '__1%';

#查询出每个城市中年龄年龄最小的学生，将其结果按照升序排列
SELECT address AS'城市',MIN(age)AS '最小年龄'FROM student GROUP BY address ORDER BY MIN(age) ASC;
#统计每门课程的成绩,然后分别对每门成绩进行avg()平均分、count()人数、min()最高分、min()最低分和sum()总分数。
SELECT class AS'课程',AVG(score)AS'平均分',COUNT(sid)AS'人数',MAX(score)AS'最高分',MIN(score)AS'最低分',SUM(score)AS'总分' FROM student GROUP BY class;

#获取student表中每个班级的男女生人数
SELECT class AS'班级',sex AS'sex',COUNT(sid) FROM student GROUP BY class,sex;

#从student表中查询出每个城市中年龄最小的学生,并且查询出所在城市的学生超过两人,Having:是分组查询中查询条件的关键字
SELECT address AS'城市',MIN(age)AS'年龄',COUNT(sid)AS'总人数' FROM student GROUP BY address HAVING COUNT(sid)>2;
#从student表中统计每个专业及格人数，只输出每个专业及格的平均分在80分以上
SELECT class AS'专业',COUNT(sid)AS'及格人数',AVG(score)AS'平均分'FROM student WHERE score>=60 GROUP BY class HAVING AVG(score)>80;


CREATE TABLE class(
cid INT PRIMARY KEY AUTO_INCREMENT,
cname VARCHAR(20)
)CHARSET=utf8;
CREATE TABLE student(
sid INT PRIMARY KEY AUTO_INCREMENT,
sname VARCHAR(20),
age VARCHAR(20),
class_id INT,
#CONSTRAINT fk_student_class:可以省略，删除外键时候必须添加 
FOREIGN KEY (class_id) REFERENCES class(cid)
)CHARSET=utf8;
INSERT INTO class(cname)VALUES('软件'),('大数据'),('人工智能');
INSERT INTO student(sname,age,class_id)VALUES('张三','20',1),('李四','22',3),('王五','18',2);
#交叉连接语法：select  字段列表   from  表1,表2,表3...... [where  连接条件1  and  连接条件2  ...]
SELECT * FROM student,class WHERE student.sid=class.cid;
#内连接语法：SELECT …. FROM 表1 [INNER] JOIN 表2 ON <表达式>
SELECT * FROM student INNER JOIN class ON student.sid=class.cid;




CREATE DATABASE e2022;
CREATE TABLE class(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(20)
)CHARSET=utf8;
CREATE TABLE student(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(20),
	sex VARCHAR(20),
	age VARCHAR(20),
	class_cid INT,
	FOREIGN KEY(class_cid)REFERENCES class(cid)
)CHARSET=utf8;
#给class表中添加数据
INSERT INTO class(cname)VALUES('软件'),('大数据'),('人工智能');
#给student表中添加数据
INSERT INTO student(sname,sex,age,class_cid)VALUES('张三','男','22',2),('李四','女','18',3),('三三','女','25',2),('四四','男','20',1);
#交叉连接语法：select  字段列表   from  表1,表2,表3...... [where  连接条件1  and  连接条件2  ...]
SELECT * FROM student,class WHERE class_cid AND cid;
#使用交叉连接class表和student表，查询出学生的学号，姓名，班级信息
SELECT sid '学号',sname '姓名',cid '班级编号',cname '班级姓名' FROM student,class WHERE class_cid AND cid;
#内链接语法：SELECT …. FROM 表1 [INNER] JOIN 表2 on <表达式>(只显示有效的信息，没有数据是不会显示的)
SELECT * FROM student INNER JOIN class ON class_cid=cid;
#使用INNER JOIN...ON子句实现查询出每个学生的姓名、年龄、性别和所在班级名称
SELECT sname '姓名',age '年龄',sex '性别',cname '班级' FROM student INNER JOIN class ON class_cid=cid;
#使用内链接查询出学员的姓名、课程名称、年龄；并且年龄在20岁以上；结果集按照年龄的降序排列
SELECT sname '姓名',cname '课程名称',age '年龄' FROM student INNER JOIN class ON class_cid=cid WHERE age>20 ORDER BY age DESC;




CREATE DATABASE e2022;
CREATE TABLE class(
cid INT PRIMARY KEY AUTO_INCREMENT,
cname VARCHAR(20)
)CHARSET=utf8;
CREATE TABLE student(
sid INT PRIMARY KEY AUTO_INCREMENT,
sname VARCHAR(20),
sex VARCHAR(20),
age VARCHAR(20),
class_cid INT,
FOREIGN KEY(class_cid)REFERENCES class(cid)
)CHARSET=utf8;
#给class表中添加数据
INSERT INTO class(cname)VALUES('软件'),('大数据'),('人工智能');
#给student表中添加数据
INSERT INTO student(sname,sex,age,class_cid)VALUES('张三','男','22',1),('李四','女','18',3),('三三','女','25',1),('四四','男','20',1);
#交叉连接(查询表中所有数据)
SELECT * FROM student,class WHERE class_cid AND cid;
#内连接(只能查询出有数据的信息)
SELECT * FROM student INNER JOIN class ON class_cid=cid;

#左外连接语法：SELECT …. FROM 表1 Left [OUTER] JOIN 表2 on <表达式>(显示左表全部数据)
SELECT * FROM student LEFT JOIN class ON class_cid=cid;
#右外连接语法：SELECT …. FROM 表1 RIGHT [OUTER] JOIN 表2 on <表达式>(显示右表全部数据)
SELECT * FROM student RIGHT JOIN class ON class_cid=cid;
#使用左外连接查询出所有学生的姓名和年龄
SELECT sname '姓名',age '年龄' FROM student LEFT JOIN class ON class_cid=cid;
#使用右外连接查询出所有学生的姓名和所属班级的班级名称
SELECT sname '学生姓名',cid '班级编号',cname '班级名称' FROM student RIGHT JOIN class ON class_cid=cid;



#使用子查询查询student，class表,并指定课程名为002，并且指定score1大于60分score2大于70分
SELECT * FROM student LEFT JOIN class ON class_cid=cid WHERE sid=(
SELECT sid FROM student LEFT JOIN class ON class_cid=cid WHERE cname='002' AND score1>60 AND score2>70); 

#使用in查询student，class表,并指定课程名为002，并且指定score1大于60分score2大于70分
SELECT * FROM student LEFT JOIN class ON class_cid=cid WHERE sid IN(
SELECT sid FROM student LEFT JOIN class ON class_cid=cid WHERE cname='002' AND score1>60 AND score2>70); 

#使用not in查询
SELECT * FROM student LEFT JOIN class ON class_cid=cid WHERE sid NOT IN(
SELECT sid FROM student LEFT JOIN class ON class_cid=cid WHERE cname='002' AND score1>60 AND score2>70); 
