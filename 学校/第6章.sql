CREATE TABLE class(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(20)
)CHARSET=utf8;
CREATE TABLE student(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(20),
	age VARCHAR(20),
	class_cid INT,
	FOREIGN KEY (class_cid) REFERENCES class(cid)
)CHARSET=utf8;
INSERT INTO class(cname) VALUES('软件'),('数学'),('英语');
INSERT INTO student(sname,age,class_cid) VALUES('张三','20',1),('李四','18',3),('王二','19',2);
#交叉连接
SELECT * FROM student,class WHERE class_cid AND cid;
SELECT * FROM student,class;
#内连接
SELECT * FROM student INNER JOIN class ON class_cid=cid;
#左外连接;输出左表中的全部数据
SELECT * FROM student LEFT JOIN class ON class_cid=cid;
#右外连接;输出右表中的全部数据
SELECT * FROM student RIGHT JOIN class ON class_cid=cid;
#全外连接
SELECT * FROM student FULL JOIN class ON class_cid=cid;


