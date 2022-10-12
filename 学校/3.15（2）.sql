CREATE TABLE class(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(20)
)CHARSET=utf8;
CREATE TABLE student3(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(20),
	age VARCHAR(20),
	class_id INT,
	FOREIGN KEY (class_id) REFERENCES class(cid)
)CHARSET=utf8;
INSERT INTO class(cname) VALUES('软件'),('数学'),('英语');
INSERT INTO student3(sname,age,class_id) VALUES('张三','20',1),('李四','18',3),('王二','19',2);
SELECT * FROM student3,class WHERE student3.sid=class.cid;#交叉连接
SELECT * FROM student3 INNER JOIN class ON student3.sid=class.cid;#内连接