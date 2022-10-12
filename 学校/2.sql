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
#增加单条
INSERT INTO student (sname,sex,age,class,address,TIME) VALUES ('张三','男','13','高数','河南','2022-12-09');
#增加多条
INSERT INTO student (sname,sex,age,class,address,TIME) VALUES ('张四','男','13','软件','北京','2022-2-18'),
								('张五','男','13','英语','河南','2022-8-27'),
								('张六','女','13','的数据','广州','2022-1-3');
#修改单条								
UPDATE student SET sname='11',sex='女',age='33',class='4',address='1',TIME='1998-3-5' WHERE sid=8;	
#修改单个
UPDATE student SET sname='44' WHERE sid=5;
#修改全部数据
UPDATE student SET sname='777';

#删除单条
DELETE FROM student WHERE sid=4;
#删除全部
DELETE FROM student;
#删除多条
DELETE FROM student WHERE sid IN (5,6,7);

#查询全部数据
SELECT * FROM student;
#查询单个字段
SELECT sname, sex, age FROM student;

#AS别名修改单个字段
SELECT sname AS 姓名 FROM student;
#空格修改单个字段
SELECT sname 姓名 FROM student;
#AS别名修改多个字段
SELECT sname AS 姓名 ,sex AS 性别 FROM student;

#条件查询：查询student表中年龄大于20岁以上的学生
SELECT * FROM student WHERE age >20;
#条件查询：查询student表中地址不为null的学生
SELECT * FROM student WHERE address IS NOT NULL;	
#条件查询：查询student表中地址为null的学生
SELECT * FROM student WHERE address IS NULL;	
#条件查询：查询单个字段中地址不为null的学生
SELECT address FROM student WHERE address IS NOT NULL;						
#多条件查询：查询student表中年龄大于30的女生
SELECT * FROM student WHERE age>30 AND sex='女';
#查询student表中，不在郑州且年龄大于30的女生
SELECT * FROM student WHERE age>30 AND sex='女' AND address<>'郑州';

#Distinct消除重复的字段
SELECT  DISTINCT sex FROM student;

#limit限定查询：查询student表中的所有数据只显示前2条数据
SELECT * FROM student LIMIT 2;
#查询student表中的所有数据只显示第6条数据和第10条数据，LIMIT第一个数字是前面留几条数据，第一个数字是显示几条数据
SELECT * FROM student LIMIT 5,5;

#使用Order By进行单列排序：在student表中按照学生的年龄以降序进行排列
SELECT * FROM student ORDER BY age DESC;
#在student表中按照学生的年龄以升序进行排列
SELECT * FROM student ORDER BY age ASC;







								
