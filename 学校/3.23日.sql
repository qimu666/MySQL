CREATE DATABASE e203;

CREATE TABLE class(
	       #主键约束   #自增长约束
	id INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(20)
)CHARSET=utf8;

CREATE TABLE student(
                #主键约束   #自增长约束
	sid INT PRIMARY KEY AUTO_INCREMENT,
			  #空约束
	sname VARCHAR(20) NULL,
			#默认约束
	sex VARCHAR(20) DEFAULT '男',
	        #非空约束
	age INT NOT NULL,
		  #唯一约束
	phone INT UNIQUE,
	
	class_id INT,
	#主键约束
	FOREIGN KEY (class_id) REFERENCES class(id)

)CHARSET=utf8;

#增
INSERT INTO class(cname)VALUES('软件'),('大数据'),('英语');
INSERT INTO student(sname,sex,age,phone,class_id)VALUES('张三','男','19',132456,1),('李四','女','20',234567,2),('麻子','男','20',3456789,3);

#删
DELETE FROM student WHERE sid=1;

#改
UPDATE student SET age=18 WHERE sname='李四';

#查
SELECT * FROM student LEFT JOIN class ON class_id=id;

#模糊查询
SELECT * FROM student LEFT JOIN class ON class_id=id WHERE  phone LIKE ('__5%')

#排序
SELECT * FROM student LEFT JOIN class ON class_id=id GROUP BY age ASC;

#分组
SELECT age '年龄' FROM student LEFT JOIN class ON class_id=id GROUP BY age;

#指定查询,第一个数是前面留几条数，第二个是查询几个
SELECT * FROM student LIMIT 2,1;

#查询几条数据
SELECT * FROM student LIMIT 3;

#在student表中查询出张三的班级编号和相同学生编号姓名和手机号
SELECT id '班级编号',sid '学生编号',sname '姓名',phone '手机号码' FROM student LEFT JOIN class ON class_id=id WHERE sname='张三';

#使用子查询，子查询只能一个一下的查询，如果需要查询多条需要加in
SELECT id '班级编号',sid '学生编号',sname '姓名',phone '手机号码' FROM student LEFT JOIN class ON class_id=id WHERE sname IN(
SELECT sname FROM student LEFT JOIN class ON class_id=id WHERE sname='张三');

#not in 和in 相反
SELECT id '班级编号',sid '学生编号',sname '姓名',phone '手机号码' FROM student LEFT JOIN class ON class_id=id WHERE sname NOT IN(
SELECT sname FROM student LEFT JOIN class ON class_id=id WHERE sname='张三');

#使用exists子查询，子查询有值才会执行外面，子查询有值外面没有值是没有结果的
SELECT id '班级编号',sid '学生编号',sname '姓名',phone '手机号码' FROM student LEFT JOIN class ON class_id=id WHERE sname='麻子' AND EXISTS(
SELECT sname FROM student LEFT JOIN class ON class_id=id WHERE age='21');

#使用not exists子查询，子查询没有值会执行外面，子查询有值就直接结束
SELECT id '班级编号',sid '学生编号',sname '姓名',phone '手机号码' FROM student LEFT JOIN class ON class_id=id WHERE sname='李四' AND NOT EXISTS(
SELECT sname FROM student LEFT JOIN class ON class_id=id WHERE age='23');

#使用all子查询
SELECT * FROM student WHERE age > ALL (SELECT age FROM student WHERE sid=1);

#使用any/some子查询
SELECT * FROM student WHERE age > ANY (SELECT age FROM student WHERE sid=1);
