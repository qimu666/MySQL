CREATE DATABASE e204;

CREATE TABLE class(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(20)
)CHARSET=utf8;

CREATE TABLE teacher(
	tid INT PRIMARY KEY AUTO_INCREMENT,
	tname VARCHAR(20)
)CHARSET=utf8;

CREATE TABLE student(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(20) NOT NULL,
	sex VARCHAR(20),
	age INT NULL,
	phone INT ,
	class_cid INT,
	teacher_tid INT,
	FOREIGN KEY(class_cid) REFERENCES class(cid),
	FOREIGN KEY(teacher_tid) REFERENCES teacher(tid)
)CHARSET=utf8;

INSERT INTO class(cname)VALUES('软件'),('大数据'),('英语');
INSERT INTO teacher(tname)VALUES('叶平'),('和平'),('万物');
INSERT INTO student(sname,sex,age,phone,class_cid,teacher_tid)VALUES('张三','男','18',123456,1,1),
								    ('李四','女','19',234567,2,2),
								    ('王二','男','20',345678,3,3);					    					
							    							    
SELECT * FROM student LEFT JOIN class ON class_cid=cid LEFT JOIN teacher ON teacher_tid=tid;
SELECT * FROM student LEFT JOIN class ON class_cid=cid LEFT JOIN teacher ON teacher_tid=tid GROUP BY age HAVING age>18

SELECT * FROM class;
SELECT * FROM teacher;
SELECT * FROM student;

UPDATE student SET age=55 WHERE class_cid=(
SELECT cid FROM class WHERE cname='软件') AND teacher_tid=(
SELECT tid FROM teacher WHERE tname='叶平');

UPDATE student SET age=55 WHERE class_cid IN(
SELECT cid FROM class WHERE cname='软件') AND teacher_tid IN(
SELECT tid FROM teacher WHERE tname='叶平');

DELETE FROM student WHERE class_cid IN(
SELECT cid FROM class WHERE cname='软件') AND teacher_tid IN(
SELECT tid FROM teacher WHERE tname='叶平');

#查看索引
SHOW INDEX FROM student;
#添加索引		#唯一索引
ALTER TABLE student ADD UNIQUE weiyi(sex);

SELECT * FROM student WHERE sex='女';