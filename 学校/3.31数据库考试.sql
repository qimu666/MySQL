CREATE DATABASE studb;
CREATE TABLE t_class(
	classid INT PRIMARY KEY AUTO_INCREMENT,
	classname VARCHAR(20) NOT NULL
)CHARSET=utf8;

CREATE TABLE t_student(
	stuid INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(20) NOT NULL,
	idcard INT UNIQUE,
	sex VARCHAR(20) DEFAULT '女',
	t_class_classid INT,
	FOREIGN KEY (t_class_classid) REFERENCES t_class(classid)
	
)CHARSET=utf8;

INSERT INTO t_class(classname) VALUES ('软件'),('大数据'),('英语');
INSERT INTO t_student(NAME,idcard,sex,t_class_classid) VALUES ('李四',123456,'女',1),
							      ('张三',234567,'男',2),
							      ('王二',323456,'女',3);
INSERT INTO t_student(NAME,idcard,sex,t_class_classid) VALUES ('麻子',456789,'男',NULL);
#二
#1
SELECT COUNT(stuid) '学生总数' FROM t_student;	
#2
SELECT * FROM t_student ORDER BY stuid DESC;
#3
UPDATE t_student SET NAME='张三' WHERE stuid=1
#三  
#1.
SELECT * FROM t_student LEFT JOIN t_class ON t_class_classid=classid WHERE t_class_classid IS NULL;
#2.
SELECT NAME '学生姓名',classname '班级名称'FROM t_student LEFT JOIN t_class ON t_class_classid=classid;
					      
#四。
CREATE TABLE USER(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(20),
	Tel VARCHAR(20),
	Content VARCHAR(20),
	DATE DATE
)CHARSET=utf8;

#1.
INSERT INTO USER(user.name,Tel,Content,DATE)VALUES('小王','132********','高中毕业','2007-05-06');
#2	
UPDATE USER SET Content='本科毕业' WHERE NAME='小王'
#3
DELETE FROM USER WHERE Content='高中毕业' AND id=1

			      		      