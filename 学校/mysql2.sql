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

