CREATE TABLE student(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(20) DEFAULT '张三',
	sex CHAR(2) NULL,	
	age INT NOT NULL,
	class VARCHAR(20),
	address VARCHAR(20),
	TIME DATE
)CHARSET=utf8;

INSERT INTO student (sname,sex,age,class,address,TIME) VALUES('张三','男',22,'语文','许昌','2022-03-04'),
								('王二','女',32,'数学','郑州','2022-09-13'),
								('李四','男',19,'英语','河南','2012-07-24'),
								('麻子','男',18,'软件','江苏','1998-7-4');

#查询所有学生的学号、姓名、性别和年龄								
SELECT sid,sname,sex,age FROM student;	
					
#用AS修改student表中字段别名 sid改为学号，sname改为姓名，sex改为性别，age改为年龄
SELECT sid AS 学号,sname AS 姓名,sex AS 性别,age AS 年龄 FROM student;

#在student表中查询出年龄在22岁以上的学生信息,只显示学号和年龄
SELECT sid AS 学号，age AS 年龄 FROM student WHERE age>22;

#在student表中查询出年龄在22岁以上女生的学生信息,
SELECT * FROM student WHERE age>22 AND sex='女';

#在student表中查询出年龄在22岁以上女生且不在河南的学生信息,
SELECT * FROM student WHERE age>22 AND sex='女' AND address!='河南';

#在student表中查询出年龄在22岁以上男生或者不在郑州的学生信息,
SELECT * FROM student WHERE age>22 AND sex='男' OR address <>'郑州';
 
#查询student表中的所有数据,显示第4条到9条,第一个数字是前面留几条数据，第二数字是一共显示几条数据
SELECT * FROM student LIMIT 3,6;

#在student表中按照年龄从大到小排序，如果年龄相同就按着出生日期从小到大进行排列。
SELECT * FROM student ORDER BY age DESC,TIME ASC;








