CREATE DATABASE e205;
CREATE TABLE class(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	cname VARCHAR(20),
	cteacher VARCHAR(20)
)CHARSET=utf8;
CREATE TABLE student(
	sid INT PRIMARY KEY AUTO_INCREMENT,
	sname VARCHAR(20),
	xuanke INT,
	score1 VARCHAR(20),
	score2 VARCHAR(20),
	class_cid INT,
	FOREIGN KEY (class_cid) REFERENCES class(cid)
)CHARSET=utf8;
INSERT INTO class(cname,cteacher) VALUES('001','李四'),('002','叶平'),('003','王二');
INSERT INTO student(sname,xuanke,score1,score2,class_cid) VALUES('张三','2','80','78',1),('六五','1','78','80',2),('麻子','1','58','90',3);
SELECT * FROM student INNER JOIN class ON class_cid=cid;
SELECT * FROM student,class
#课程001比课程002成绩高的学生的学号
SELECT sid '学号' FROM student WHERE score1>score2 GROUP BY sid;
#2
SELECT sid '学号',(score1+score2)/2 '平均分'FROM student WHERE (score1+score2)/2 >60;
#3
SELECT sid '学号' ,sname '姓名' ,xuanke '选课数', SUM(score1+score2) '总成绩' FROM student GROUP BY sid;
#4 
SELECT COUNT(cteacher)'姓李的老师个数' FROM class WHERE cteacher LIKE '李%'
#5
SELECT sid '学号',sname'姓名' FROM student LEFT JOIN class ON class_cid=cid WHERE cteacher != '叶平' ;
#6
SELECT sid '学号',sname'姓名' FROM student,class WHERE cname='001' AND cname='002' ;
#7
SELECT sid '学号',sname '姓名' FROM student LEFT JOIN class ON class_cid=cid WHERE cteacher=(SELECT cteacher FROM student LEFT JOIN class ON class_cid=cid WHERE cteacher = '叶平' ); 
#8课程002比课程001成绩高的学生的学号
SELECT sid '学号',sname '姓名' FROM student WHERE score2<score1 GROUP BY sid;
#9
SELECT sid '学号',sname'姓名' FROM student WHERE score1<60 AND score2<60;
#10
SELECT sid '学号',sname'姓名' FROM student WHERE xuanke=0;

SELECT * FROM student WHERE sid=(SELECT sid FROM student WHERE xuanke='2'AND sname='张三');



#使用子查询查询student，class表,并指定课程名为002，并且指定score1大于60分score2大于70分
SELECT * FROM student LEFT JOIN class ON class_cid=cid WHERE sid=(
SELECT sid FROM student LEFT JOIN class ON class_cid=cid WHERE cname='002' AND score1>60 AND score2>70); 

#使用in查询student，class表,并指定课程名为002，并且指定score1大于60分score2大于70分
SELECT * FROM student LEFT JOIN class ON class_cid=cid WHERE sid IN(
SELECT sid FROM student LEFT JOIN class ON class_cid=cid WHERE cname='002' AND score1>60 AND score2>70); 

#使用not in查询
SELECT * FROM student LEFT JOIN class ON class_cid=cid WHERE sid NOT IN(
SELECT sid FROM student LEFT JOIN class ON class_cid=cid WHERE cname='002' AND score1>60 AND score2>70); 

#使用exists子查询，子查询有值才会执行外面，子查询有值外面没有值是没有结果的
SELECT * FROM student LEFT JOIN class ON class_cid=cid WHERE xuanke=2 AND EXISTS(
SELECT sid FROM student LEFT JOIN class ON class_cid=cid WHERE cteacher='李四'); 

#使用not exists子查询，子查询没有值会执行外面，子查询有值就直接结束
SELECT * FROM student LEFT JOIN class ON class_cid=cid WHERE xuanke=2 AND NOT EXISTS(
SELECT sid FROM student LEFT JOIN class ON class_cid=cid WHERE cteacher='222'); 

#使用not exists子查询，子查询有值就直接结束
SELECT * FROM student LEFT JOIN class ON class_cid=cid WHERE xuanke=2 AND NOT EXISTS(
SELECT sid FROM student LEFT JOIN class ON class_cid=cid WHERE cteacher='李四');

#使用all子查询
SELECT * FROM student WHERE xuanke < ALL(SELECT xuanke FROM student WHERE sid=1);

#使用any/some子查询
SELECT * FROM student WHERE xuanke < ANY(SELECT xuanke FROM student WHERE sid=1);