#select查询

 CREATE TABLE student (
  id INT NOT NULL DEFAULT 1,
  NAME VARCHAR (20) NOT NULL DEFAULT '',
  chinese FLOAT NOT NULL DEFAULT 0.0,
  english FLOAT NOT NULL DEFAULT 0.0,
  math FLOAT NOT NULL DEFAULT 0.0
);

INSERT INTO student(id,NAME,chinese,english,math)VALUES(1,'韩涵',89,78,90);
INSERT INTO student(id,NAME,chinese,english,math)VALUES(2,'张飞',67,98,56);
INSERT INTO student(id,NAME,chinese,english,math)VALUES(3,'宋江',87,78,77);
INSERT INTO student(id,NAME,chinese,english,math)VALUES(4,'关羽',88,98,90);
INSERT INTO student(id,NAME,chinese,english,math)VALUES(5,'赵云',82,84,67);
INSERT INTO student(id,NAME,chinese,english,math)VALUES(6,'欧阳锋',55,85,15);
INSERT INTO student(id,NAME,chinese,english,math)VALUES(7,'黄蓉',75,65,30);

-- 查询所有学生信息
SELECT * FROM student;
-- 查询表中所有学生的姓名和对应的英语成绩
SELECT NAME,english FROM student;
-- 过滤表中重复的数据  每个字段都相同，才会去重
SELECT DISTINCT * FROM student;-- 没有重复不过滤
SELECT DISTINCT english FROM student;-- 过滤英语成绩相同的记录 可以去重
SELECT DISTINCT NAME , english FROM student;-- 过滤英语成绩相同的记录,每个字段都相同，才会去重

-- 统计每个学生的总分
SELECT NAME,(chinese+english+math) FROM student;
-- 给每个学生加10分
SELECT NAME,(chinese+english+math+10) FROM student;
-- 使用别名查询分数 AS
SELECT NAME AS '姓名',(chinese+english+math) AS '总分' FROM student;

# where ——————————————————————————————————————————————————————————————————————————————————————————————————

-- 查询math大于60并且id大于3的学生成绩
SELECT * FROM student WHERE math > 60 AND id > 3;
-- 查询英语成绩大于语文成绩的同学
SELECT * FROM student WHERE english > chinese;
-- 查询总分大于200，并且数学大于语文成绩的，姓韩的同学
-- 韩%  表示 名字以韩开头就可以 ,0-n个,只要开头是韩就可以
SELECT * FROM student                                                               
                      WHERE (chinese+english+math) > 200 
                      AND math > chinese AND NAME LIKE '韩%';                   
-- 查询英语分数在80-90之间的同学
SELECT * FROM student WHERE english >= 80 AND english <= 90;      
SELECT * FROM student WHERE english BETWEEN 80 AND 90; --  BETWEEN...and ..是闭区间包含两头         
-- 查询数学分数为89，90，77的同学
SELECT * FROM student WHERE math = 89 OR math = 90 OR math = 77; 
SELECT * FROM student WHERE math IN (89,90,77);                                        
-- 查询所有姓赵的同学成绩
SELECT * FROM student WHERE NAME LIKE '赵%';
-- 查询数学比语文多1分的同学
SELECT * FROM student WHERE (math - chinese) =1;

# order by 排序 ——————————————————————————————————————————————————————————————————————————————————————————————————

-- 对数学成绩排序后输出【升序】
-- ASC升序[默认]
SELECT math FROM student ORDER BY math ASC;
-- 对总分按照从高到低的顺序输出
-- DESC降序 
SELECT NAME,(chinese+english+math) AS '总分' FROM student ORDER BY 总分 DESC;

# count() 统计 ——————————————————————————————————————————————————————————————————————————————————————————————————
-- count:返回行的总数

-- 统计一个班级有多少学生
SELECT COUNT(*) AS '总人数' FROM student;
-- 统计数学成绩大于60的学生有多少个
SELECT COUNT(*) AS '数学成绩大于90分' FROM student WHERE math > 60 ;
-- 统计总分大于250的人有多少
SELECT COUNT(*) AS '总分大于250分' FROM student WHERE (chinese+english+math) > 250 ;

-- count(*) 和 count(列的区别)
-- 解释： count(*) 返回满足条件的记录行数
--        count(列) 统计满足条件的某列非空的有多少个,但会排除数据为null的数据

CREATE TABLE count_test (
              ‘name’ VARCHAR(20));
              
INSERT INTO count_test VALUES('jake');
INSERT INTO count_test VALUES('qimu');
INSERT INTO count_test VALUES('marry');
INSERT INTO count_test VALUES(NULL);

SELECT * FROM count_test;
-- count(*)  返回满足条件的记录行数
SELECT COUNT(*) FROM count_test;
-- count(列) 统计满足条件的某列非空的有多少个,但会排除数据为null的数据
SELECT COUNT(‘name’) FROM count_test;


-- sum 求和——————————————————————————————————————————————————————————————————————————————————————————————————
-- 注意：仅对数值有效，否则会报错
--       对于多列求和， , （逗号）不能少

-- 统计一个班级的数学总成绩
SELECT SUM(math) FROM student;
-- 统计一个班的语文，英语，数学各科的总成绩
SELECT SUM(chinese),SUM(english),SUM(math) FROM student;
-- 统计一个班的语文，英语，数学的成绩总和；
SELECT SUM(chinese+english+math) AS '成绩总和' FROM student;
-- 统计一个班的语文成绩平均分
SELECT SUM(chinese)/COUNT(*) FROM student;

-- avg 求平均值——————————————————————————————————————————————————————————————————————————————————————————————————
 
-- 求一个班级数学的平均分
SELECT AVG(math) FROM student;
-- 求一个班级总分的平均分
SELECT AVG(chinese+english+math) FROM student;

-- min/max 最小值/最大值

-- 求班级最高分和最低分
SELECT
  MAX(chinese + english + math) AS '最高分',
  MIN(chinese + english + math) AS '最低分'
FROM
  student;
-- 求班级数学最高分和最低分
SELECT MAX(math) AS '数学最高分',
       MIN(math) AS '数学最低分' FROM student;
       
       

