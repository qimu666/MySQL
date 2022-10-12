CREATE TABLE student2(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(20),
	sex VARCHAR(20),
	age VARCHAR(20),
	class VARCHAR(20),
	phone VARCHAR(20)

)CHARSET=utf8;
INSERT INTO student2(sname,sex,age,class,phone)VALUE('张三','男','18','软件','1543255');
INSERT INTO student2(sname,sex,age,class,phone)VALUE('李四','男','20','英语','235666'),
						('王二','女','22','数学','367666'),
						('麻子','男','17','历史','475777');
#查询表中电话号码第3位数是5的信息						
SELECT *FROM student2 WHERE phone LIKE '__5%';	
SELECT class AS '课程',age AS '年龄',AVG(age) AS'平均年龄',MAX(age)AS '最大年龄',MIN(age) AS '最小年龄',COUNT(sid) AS '人数'FROM student2 GROUP BY class;
SELECT class AS '课程',MIN(age) AS '最小年龄'FROM student2 GROUP BY class HAVING COUNT(age)<2;				