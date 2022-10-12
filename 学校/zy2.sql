CREATE DATABASE zy;
CREATE TABLE class(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(20)
)CHARSET=utf8;
CREATE TABLE student(
	    #主键约束   #自增长约束
	sid INT PRIMARY KEY AUTO_INCREMENT,
		       #非空约束
	sname VARCHAR(20) NOT NULL,
		#空约束
	age INT NULL,
			  #唯一约束
	score VARCHAR(20) UNIQUE,
				  #默认约束
	sex VARCHAR(20) DEFAULT '男',
	
	class_cid INT,
	#外键约束
	FOREIGN KEY (class_cid) REFERENCES class(cid)
)CHARSET=utf8;
#添加语句
 INSERT INTO class(cname) VALUES ('软件'),('大数据'),('英语');
 INSERT INTO student(sname,age,score,sex,class_cid) VALUES('张三','18','80','男',1),('李四',20,'78','女',2),('麻子',23,'男','90',3);
#查询
SELECT * FROM student,class ;
#删除
DELETE FROM student sid=2;
#改
UPDATE student SET  age='18' WHERE sname ='张三';
#order by 降序
SELECT * FROM student ORDER BY age DESC;
#order by 升序
SELECT * FROM student ORDER BY age ASC;
