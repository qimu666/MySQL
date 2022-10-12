### <font color="red">注意：修正错误：</font>

><font color="red">创建数据库/创建表的表名或字段名为`关键字`时应该用 `` `表名/字段名` `` ,而不是`‘表名/字段名’`</font>

#### 不建议写法

```mysql
-- 1. 表名/字段名为关键字时，会自动转为大写
CREATE TABLE NAME(
   DATA DATETIME,
);
-- 2. 用单引号括起来
CREATE TABLE ‘name’(
    ‘data’ DATETIME,
);
```

#### <font color="red">推荐使用：</font>

```mysql
CREATE TABLE `name`(
    `data` DATETIME,
);
```

### 1. 创建表

```mysql
CREATE TABLE emp (
  id INT PRIMARY KEY AUTO_INCREMENT,
  ‘name’ VARCHAR (32),
  sex CHAR (1),
  brithday DATE,
  entry_data DATETIME,
  -- 入职时间
   job VARCHAR (32),
  Salary DOUBLE,
  ‘resume’ TEXT-- 个人介绍
   -- 字符格式  -- 校对规则      --引擎
) CHARSET utf8 COLLATE utf8_bin ENGINE INNODB;

SELECT *FROM emp
         -- 全部字段都要添加字段可以省略emp(表)后()中的字段
INSERT INTO emp VALUES(1,'白骨精','女','2001-1-1','2022-2-4 10:32:11','大王',6000,'抓唐僧')

-- 添加数据可以选择字段添加
INSERT INTO emp(id)VALUES(2);

INSERT INTO emp(id,user_name)VALUES(3,'牛魔王');
```

### 2. 修改表

```mysql
# 修改表
-- 员工表emp增加一个image列，varchar类型，要求在‘resume’后面
ALTER TABLE emp 
                         -- 不允许为空 默认值为 ''
       ADD image VARCHAR(32) NOT NULL DEFAULT ''
       -- 在 ‘resume’ 列之后
       AFTER ‘resume’;


ALTER TABLE emp MODIFY job VARCHAR(60);-- 修改列

ALTER TABLE emp DROP sex; -- 删除列

RENAME TABLE emp TO employee;-- 修改表名

SELECT *FROM employee;

INSERT INTO employee(id)VALUES(2);

INSERT INTO employee(id,user_name)VALUES(3,'牛魔王');

DESC employee -- 显示表结构

ALTER TABLE employee CHARSET utf8; -- 修改表的字符集

-- 修改列的名称
-- ALTER TABLE employee CHANGE ‘name’  user_name VARCHAR(64) NOT NULL DEFAULT '';
ALTER TABLE employee CHANGE   
                     ‘name’ -- 要修改的字段（列名）
                      user_name  -- 新的字段（列名）
                      VARCHAR(64);
```

### 3. 增删改操作

```mysql
#增删改语句和注意事项
SELECT *FROM employee;


         -- 全部字段都要添加字段可以省略emp(表)后()中的字段
INSERT INTO employee VALUES(1,'白骨精','女','2001-1-1','2022-2-4 10:32:11','大王',6000,'抓唐僧')

-- 添加数据可以选择字段添加
INSERT INTO employee(id)VALUES(2);

INSERT INTO employee(id,user_name)VALUES(3,'牛魔王');

-- ——————————————————————————————————————————————————————————

-- 将所有员工的工资修改为5000，如果没有带where条件会修改所有的记录 【慎用】
UPDATE employee SET Salary =5000;
-- 将姓名为牛魔王 的工资修改为3000块 where子句指定应更新哪些行，没有则更新所有的行
UPDATE employee SET Salary =3000 WHERE user_name='牛魔王' ;
-- 给白骨精涨1000块钱工资
UPDATE employee SET Salary =Salary+1000 WHERE user_name='白骨精' ;
-- 修改多个字段(列)的值，可以通过SET 字段1=值1,字段2=值2...
UPDATE employee SET Salary =3000,job='火焰山大王' WHERE user_name='牛魔王' ;

-- ——————————————————————————————————————————————————————————

-- 删除表中id为2的记录
DELETE FROM employee WHERE id =2;

-- 删除表
DROP TABLE employee;
```

### 4. 查询操作

#### 4.1 查询01

```mysql
#select查询

 CREATE TABLE student (
  id INT NOT NULL DEFAULT 1,
  NAME VARCHAR (20) NOT NULL DEFAULT '',
  chinese FLOAT NOT NULL DEFAULT 0.0,
  english FLOAT NOT NULL DEFAULT 0.0,
  math FLOAT NOT NULL DEFAULT 0.0
);

INSERT INTO student(id,NAME,chinese,english,math)VALUES(1,'韩函',89,78,90);
INSERT INTO student(id,NAME,chinese,english,math)VALUES(2,'张飞',67,98,56);
INSERT INTO student(id,NAME,chinese,english,math)VALUES(3,'米江',87,78,77);
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
```

#### 4.2 查询02

```mysql
-- 部门表
CREATE TABLE dept( 
deptno MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
dname VARCHAR(20) NOT NULL DEFAULT "",
loc VARCHAR(13)NOT NULL DEFAULT ""
);

INSERT INTO dept VALUES (10,'ACCOUNTING','NEW YORK'),
                        (20,'RESEARCH','DALLAS'),
                        (30,'SALES','CHICAGO'),
                        (40,'OPERATIONS','BOSTON');
SELECT * FROM dept;

-- 员工表
CREATE TABLE emp(
empno MEDIUMINT UNSIGNED NOT NULL DEFAULT 0, -- 编号
ename VARCHAR(20) NOT NULL DEFAULT "", -- 名字
job VARCHAR(9) NOT NULL DEFAULT "", -- 工作
mgr MEDIUMINT UNSIGNED, -- 上级编号
hiredate DATE NOT NULL , -- 入职时间
sal DECIMAL(7,2) NOT NULL,-- 薪水
comn DECIMAL(7,2),-- 奖金
deptno  MEDIUMINT UNSIGNED NOT NULL DEFAULT 0 -- 部门编号
);

INSERT INTO emp VALUES(7369,'SMITH','CLERK',7902,'1990-12-17',800.00,NULL,20),
(7499,'ALLEN','SALESMAN',7698,'1991-2-20',1600.00,300.00,30),
(7521,'WARD','SALESMAN',7698,'1991-2-22',1250.00,500.00,30),
(7566,'JONES','MANAGER',7839,'1991-4-2',2975.00,NULL,20),
(7654,'MARTIN','SALESMAN',7698,'1991-9-28',1250.00,1400.00,30),
(7698,'BLAKE','MANAGER',7839,'1991-5-1',2850.00,NULL,30),
(7782,'CLARK','MANAGER',7839,'1991-6-9',2450.00,NULL,10),
(7788,'SCOTT','ANALYST',7566,'1997-4-19',3000.00,NULL,20),
(7839,'KING','PRESIDENT',NULL,'1991-11-17',5000.00,NULL,10),
(7844,'TURNER','SALESMAN',7698,'1991-9-8',1500.00,NULL,30),
(7900,'JAMES','CLERK',7698,'1991-12-3',950.00,NULL,30),
(7902,'FoRD','ANALYST',7566,'1991-12-3',3000.00,NULL,20),
(7934,'MILLER','CLERK',7782,'1992-1-23',1300.00,NULL,10);

SELECT * FROM emp;

-- 工资级别表
CREATE TABLE salgrade( 
grade MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,-- 工资级别
losal DECIMAL (17,2) NOT NULL,    -- 该级别最低工资
hisal DECIMAL(17,2)NOT NULL       -- 该级别最高工资
);
INSERT INTO salgrade VALUES (1,700,1200);
INSERT INTO salgrade VALUES (2,1201,1400);
INSERT INTO salgrade VALUES (3,1401,2000);
INSERT INTO salgrade VALUES (4,2001,3000);
INSERT INTO salgrade VALUES (5,3001,9999);

-- 查询表
SELECT * FROM dept;
SELECT * FROM emp;
SELECT * FROM salgrade;

# group by + having ——————————————————————————————————————————————————————————————————————————————————

-- 如何显示每个部门的平均工资和最高工资
SELECT AVG(sal) ,MAX(sal),deptno FROM emp GROUP BY deptno;

-- 显示每个部门的每种岗位的平均工资和最低工资
SELECT AVG(sal) ,MIN(sal),deptno,job FROM emp GROUP BY deptno ,job;

-- 显示平均工资低2000的部门号和它的平均工资/别名
SELECT AVG(sal) AS sal_avg, deptno FROM emp GROUP BY deptno HAVING sal_avg<2000;
```

#### 4.3 查询增强

```mysql
SELECT * FROM dept;
SELECT * FROM emp;
SELECT * FROM salgrade;

-- 使用where子句————————————————————————————————————————————————————————————————————————————————————————————————
-- ?如何查找1992.1.1后入职的员工
-- 说明:在mysq1中,日期类型可以直接比较 ,要注意格式
SELECT * FROM emp WHERE hiredate > '1992-01-01';

-- 使用1ike操作符（模糊）
-- % (百分号): 表示0到多个任意字符 , _ (下划线)：表示单个任意字符
-- 如何显示首字符为S的员工姓名和工资
SELECT ename,sal FROM emp WHERE ename LIKE 'S%';

-- ?如何显示第三个字符为大写0的所有员工的姓名和工资
SELECT ename,sal FROM emp WHERE ename LIKE '__O%';

-- 如何显示没有上级的雇员的情况
SELECT * FROM emp WHERE mgr IS NULL;

-- 查询表结结构
DESC emp;

-- 使用order by子句——————————————————————————————————————————————————————————————————————————————————————
-- ?如何按照工资的从低到高的顺序[升序]，显示雇员的信息
SELECT * FROM emp ORDER BY sal;

-- ?按照部门号升序而雇员的工资降序排列，显示雇员信息
SELECT * FROM emp ORDER BY deptno ,sal DESC;

# 分页查询 ————————————————————————————————————————————————————————————————————————————————————————————
-- 按雇员的id号升序取出，每页显示3条记录，请分别显示第1页，第2页，第3页
-- 第一页
SELECT * FROM emp ORDER BY empno LIMIT 0 ,3;
-- 第二页
SELECT * FROM emp ORDER BY empno LIMIT 3 ,3;
-- 第三页
SELECT * FROM emp ORDER BY empno LIMIT 6 ,3;

-- groub by ——————————————————————————————————————————————————————————————————————————————————————————————————
-- (1)显示每种岗位的雇员总数、平均工资。
SELECT COUNT(*),AVG(sal),job FROM emp GROUP BY job;

-- (2)显示雇员总数，以及获得补助的雇员数。
SELECT COUNT(*),COUNT(comn)FROM emp;

-- 统计没有获得补助的雇员数
SELECT COUNT(*),COUNT(IF(comn IS NULL,1,NULL)) FROM emp;
SELECT COUNT(*),COUNT(*)-COUNT(comn) FROM emp;

-- (3)显示管理者的总人数。-- DISTINCT 去重复
SELECT COUNT(DISTINCT mgr)FROM emp;

-- (4)显示雇员工资的最人差额。
SELECT MAX(sal)-MIN(sal) FROM emp;

-- ————————————————————————————————————————————————————————————————————————————————————————————————————————————————
-- 如果 select 语句同时包含有 group by,having,limit,order by 
-- 那么他们的顺序是 group by,having,order by,limit

-- 应用案例：请统计各个部门的平均工资，并且是大于1000的，
-- 并且按照平均工资从高到纸排序，取出前两行记录.
SELECT AVG(sal) AS avg_sal,deptno FROM emp GROUP BY deptno
                                  HAVING avg_sal>1000
                                  ORDER BY avg_sal DESC 
                                  LIMIT 0,2 ;
 
```

### 5. 多表查询

#### 5.1 笛卡尔集

> 多表查询的条件不能少于表的个数-1，否则会出现笛卡尔集

```mysql
-- 多表查询的笛卡尔集
-- 这样会出现笛卡尔集
SELECT * FROM emp , dept;

-- 显示雇员名，雇员工资,部门号及所在部门的名字
                        -- 当我们需要指定显示某个表的列时，指要表名.列名
SELECT ename ,sal, dname , emp.deptno 
                   FROM emp , dept 
                -- 多表查询的条件不能少于表的个数-1，否则会出现笛卡尔集
                   WHERE emp.deptno = dept.deptno;

-- 如何显示部门号为10的部门名、员工名和工资
SELECT ename,sal,dname ,emp.deptno FROM emp,dept
                       WHERE emp.deptno = dept.deptno
                       AND emp.deptno=10;
                       
 -- 显示各个员工的姓名，工资，及其工资的级别
 SELECT ename ,sal ,grade FROM emp, salgrade
                          WHERE sal BETWEEN losal AND hisal ;

-- 练习：显示雇员名，雇员工资及所在部门的名字，并按部门排序降序排.
SELECT ename ,sal ,dname,emp.deptno 
                   FROM emp , dept
                   WHERE emp.deptno = dept.deptno
                   ORDER BY emp.deptno DESC;
```

#### 5.2 自连接

> 自连接特点 :
>
> 1. 把同一张表当做两张表使用
> 2. 需要给表取别名表名表别名
> 3. 列名不明确，可以指定列的别名列名as列的别名

```mysql
-- 多表查询的自连接

-- 显示公司员工名字和他的上级的名字

/* 分析:
         员工名字在emp表,上级的名字的名字也在emp表
         员工和上级是通过emp表的mgr和empno列关联
*/

-- 自连接特点:
--             1.把同一张表当做两张表使用
--             2.需要给表取别名表名表别名
--             3.列名不明确，可以指定列的别名列名as列的别名

-- 用笛卡尔集的方式查询
SELECT worker.ename AS '员工',boss.ename AS '上级' 
                    FROM emp worker, emp boss
                    WHERE worker.empno = boss.mgr;

```

#### 5.3 子查询

> 子查询是指嵌入在其它sql语句中的selecti语句，也叫嵌套查询

##### 5.3.1 单行子查询

> 单行子查询是指只返回一行数据的子查询语句

```mysql
-- 如何显示与SMITH同一部门的所有员工？
/*
   1.先查询到SMITH的部门号
   2.把查询到SMITH的部门号的sql语句当做一个子查询来使用
*/
SELECT deptno FROM emp
          WHERE ename = 'SMITH';
          
SELECT * FROM emp 
         WHERE deptno =(
-- 把查询到SMITH的部门号的sql语句当做一个子查询来使用         
		SELECT deptno 
		FROM emp
		WHERE ename = 'SMITH'
          );
          
```

##### 5.3.2 多行子查询

> 多行子查询指返回多行数据的子查询 便用关键子 in

```mysql
-- 课堂练习：如何查询和部门10的工作相同的雇员的
-- 名字、岗位、工资、部门号，但是不含10号部门自已的雇员. 

-- 1.先查询到部门号为10的雇员有哪些工作
SELECT DISTINCT job FROM emp 
         WHERE deptno =10;   

-- 2.
SELECT ename,job,sal,deptno FROM emp 
             WHERE job IN(
                      SELECT DISTINCT job 
                      FROM emp 
                      WHERE deptno =10
              ) AND deptno != 10;       
```


### 6. 常用函数

#### 6.1 字符串函数

```mysql
# 字符串相关函数
-- CHARSET(str) 返回字串字符集
SELECT CHARSET(ename) FROM emp;

-- CONCAT() 连接字串，将多个列拼接成一列
SELECT CONCAT(ename,' 工作是 ' , job ,' a') FROM emp;

-- INSERT(string,substring) 返回substring在string中出现的位置，没有返回0
-- dual 亚元表 ，系统表 可以作为测试表使用
SELECT INSERT('aaaaqimu666', 'q') FROM DUAL;

-- UCASE() 转换大写
SELECT UCASE(ename) FROM emp;

-- LCASE() 转换小
SELECT LCASE(ename) FROM emp;

-- LEFT(str,length),从str中的左边起取length个字符
SELECT LEFT(ename,2) FROM emp;

-- RIGHT(str,length),从str中的右边起取length个字符
SELECT RIGHT(ename,2) FROM emp;

-- LENGTH(str) string长度[按照字节]
SELECT LENGTH(ename) FROM emp;
SELECT LENGTH('柒木') FROM emp;

-- REPLACE(str , search_str , replace_str )
-- 在str中用 replace_str 替换 search_str
-- 例：如果在job中查询到 MANAGER , 就替换成经理
SELECT ename ,REPLACE(job , 'MANAGER' , '经理') FROM emp ;

-- STRCMP(str1,str2)  逐字符比较两字串大小
-- 返回 1 str1 大 ，0 相等 ，-1 str2 大
SELECT STRCMP('qimu1','QIMU') FROM DUAL;

-- SUBSTRING(str , position[ , length ])
-- 从str 的 position开始【从1开始计算】，截取length个字符
-- 从ename字段的数据第一个位置开始截取4个字符，
-- [注意] position 不能为0
SELECT SUBSTRING(ename,1,4) FROM emp;
 
-- LTRIM(str) 去除前端空格
-- RTRIM(str) 去除后端空格
-- TRIM(str)  去除前后两端空格
SELECT LTRIM(' 223的观点') FROM DUAL;
SELECT RTRIM('223的观点  ') FROM DUAL;
SELECT TRIM(' 223的观点  ') FROM DUAL;


#  练习：以首字母小写的方式显示所有员工emp表的姓名 （2种）
-- 1.
SELECT CONCAT(LCASE(SUBSTRING(ename,1,1)),SUBSTRING(ename,2)) AS '姓名'FROM emp  ;
-- 2.
SELECT CONCAT(LCASE(LEFT(ename,1)),SUBSTRING(ename,2)) AS '姓名'FROM emp  ;

SELECT * FROM emp;
```

#### 6.2 数学函数

```mysql
# 数学函数——————————————————————————————————————————————————————————

-- ABS(num) 绝对值
-- dual 亚元表
SELECT ABS(10) FROM DUAL;

-- BIN(decimal_number) 十进制转二进制
SELECT BIN(10) FROM DUAL;

-- CEILING(num) 向上取整 ,得到比num 大的最小整数
SELECT CEILING(1.1) FROM DUAL; 

-- FLOOR(num) 向下取整 ,得到比num 小的最大整数
SELECT FLOOR(1.1) FROM DUAL; 

-- CONV(num , from_base , to_base) 进制转换
-- 下面的含义是：8 是十进制的8，转为2进制
SELECT CONV(8,10,2) FROM DUAL;

-- FORMAT(num ,decimal_places) 保留小数位数（四舍五入）
-- 保存小数点2位
SELECT FORMAT(1.345211,2) FROM DUAL; 

-- LEAST( num1,num2[, ....] )  求多个里面的最小值
SELECT LEAST(11,-1,-9,8) FROM DUAL; 

-- MOD (num , denominator )   求余
SELECT MOD(10,3) FROM DUAL; 

-- RAND([seed])  返回随机数 范围 0 <= v <= 1.0;
-- 如果使用 RAND() 每次执行返回不同的随机数， 范围 0 <= v <= 1.0;
SELECT RAND() FROM DUAL; 
--  如果使用 RAND(seed) 返回不同的随机数， 范围 0 <= v <= 1.0 ,如果seed不变则随机数也不会改变
SELECT RAND(1) FROM DUAL; 
SELECT RAND(3) FROM DUAL; 
```

#### 6.3 时间和日期函数

```mysql
#日期时间相关函数

-- CURRENT_DATE()  当前日期
SELECT CURRENT_DATE() FROM DUAL; 

-- CURRENT_TIME()  当前时间
SELECT CURRENT_TIME() FROM DUAL; 

-- CURRENT_TIMESTAMP() 当前时间戳
SELECT CURRENT_TIMESTAMP() FROM DUAL; 

-- NOW()  当前的日期和时间
SELECT NOW() FROM DUAL;

-- YEAR | MONTH | DAY | DATE(datetime) 返回指定的年或月或日
SELECT YEAR(NOW()) FROM DUAL;
SELECT MONTH(NOW()) FROM DUAL;
SELECT YEAR('2022-9-9') FROM DUAL;

-- DATE_ADD ( date, INTERVAL d_value d_type)  中date中加上日期或时间
-- INTERVAL后面可以是year minute second hour day等
-- 请查询在10分钟内发布的新闻
SELECT * FROM mes WHERE DATE_ADD(send_time, INTERVAL 10 MINUTE)>=NOW();

-- DATE_SUB( date, INTERVAL d_value d_type)  中date中减去日期或时间
-- 请查询在10分钟内发布的新闻
SELECT * FROM mes WHERE send_time >= DATE_SUB(NOW(), INTERVAL 10 MINUTE);

-- DATEDIFF(date1,date2) 两个日期差（结果是天）
SELECT DATEDIFF('2011-11-11','1990-01-01') FROM DUAL

-- UNIX_TIMESTAMP() 返回1970-1-1 到现在的秒数
SELECT UNIX_TIMESTAMP() FROM DUAL;

-- FROM_UNIXTIME() 可以把 UNIX_TIMESTAMP 秒数【时间戳】，转成指定格式的日期
-- %Y-%m-%d 表示年月日
-- %Y-%m-%d %H:%i:%s 表示年月日时分秒
SELECT FROM_UNIXTIME(1662645690,'%Y-%m-%d') FROM DUAL;
SELECT FROM_UNIXTIME(1662645690,'%Y-%m-%d %H:%i:%s') FROM DUAL;


-- 创建测试表 信息表
CREATE TABLE mes(
id INT,
content VARCHAR(30),
send_time DATETIME
);

-- 添加一条记录   使用时间戳
INSERT INTO mes VALUES(1,'北京新闻',CURRENT_TIMESTAMP());
--                使用 NOW() 函数
INSERT INTO mes VALUES(2,'广州新闻',NOW());
--                普通方法
INSERT INTO mes VALUES(3,'上海新闻','2022-9-19');

INSERT INTO mes VALUES(4,'河南新闻',CURRENT_TIMESTAMP());


#  应用实例:
-- 1.显示所有新闻信息，发布日期只显示日期，不用显示时间
SELECT id,content,DATE(send_time) FROM mes;

-- 2.请查询在10分钟内发布的新闻
-- (1).
SELECT * FROM mes WHERE DATE_ADD(send_time, INTERVAL 10 MINUTE)>=NOW();
-- (2).
SELECT * FROM mes WHERE send_time >= DATE_SUB(NOW(), INTERVAL 10 MINUTE);

-- 3.请在mysq1的sq1语句中求2011-11-11和1990-1-1相差多少天
SELECT DATEDIFF('2011-11-11','1990-01-01') FROM DUAL

-- 4.请用mysq1的sg1语句求出你活了多少天？
SELECT DATEDIFF(NOW(),'2002-05-14') FROM DUAL;

-- 5.如果你能活80岁，求出你还能活多少天
SELECT DATEDIFF(DATE_ADD('2002-05-14', INTERVAL 80 YEAR),NOW()) FROM DUAL;

SELECT * FROM mes
```

#### 6.4 加密和系统函数

```mysql
-- USER() 查询用户
-- 可以查看登录到mysq1的有哪些用户，以及登录的ip
SELECT USER() FROM DUAL; -- 用户@ip地址

-- DATABASE(); 查询当前使用数据库名称
SELECT DATABASE();

-- MD5(str) 为字符串算出一个MD5 32位的字符串，常用（用户密码）加密
-- root密码是 qimu ->加密md5->在数据库中存放的是加密后的密码
SELECT MD5('qimu')FROM DUAL;

-- 演示用户表 ,存放密码 是MD5
CREATE TABLE user_md5 (
  `ame` VARCHAR (20) NOT NULL DEFAULT '',
  pwd CHAR (32) NOT NULL DEFAULT ''
);

INSERT INTO user_md5 VALUES ('柒木',MD5('qimu'));

-- 查询 的时候要加上MD5() 才能查到
SELECT * FROM user_md5 WHERE ame = '柒木' AND pwd =MD5('qimu');

SELECT * FROM user_md5;

-- PASSWORD(str) 加密函数  MySQL数据库的用户密码就是用PASSWORD函数加密
SELECT PASSWORD('qimu')FROM DUAL;
```

#### 6.5 控制流程函数

```mysql
-- IF(expr1,expr2,expr3) 如果expr1为True,则返回expr2,否则返回expr3
SELECT IF(TRUE,'上海','北京') FROM DUAL;

-- IFNULL(expr1,expr2) 如果expr1不为空NULL,则返回expr1,否则返回expr2
SELECT IFNULL(NULL,'柒木') FROM DUAL;

-- SELECT CASE WHEN expr1(TRUE/FALSE) THEN expr2 
            -- WHEN expr3(TRUE/FALSE) THEN expr4 
            -- ..... 
            -- ELSE expr5 END;[类似多重分支]
            
-- 如果 expr1 为TRUE 则返回expr2,
-- 如果 expr1 为FALSE , expr3 为TRUE 则返回expr4,
-- 如果 如果 expr1 为FALSE , expr3 为FALSE 则返回expr5,

SELECT CASE WHEN TRUE THEN 'jake' 
            WHEN TRUE THEN 'tom' 
            ELSE 'mary' END;
            
-- 查询emp表，如果comm是null,则显示0.0
-- 判断是否为nul1要使用is nul1,判断不为空使用is not  
 SELECT ename ,IF(comn IS NULL,0.0,comn) FROM emp;          
 
 SELECT ename ,IFNULL(comn ,0.0) FROM emp;          
 
-- 如果emp表的job是 CLERK 则显示职员，
-- 如果是MANAGER则显示经理
-- 如果是SALESMAN则显示销售人员，其它正常显示
SELECT ename ,(SELECT CASE 
            WHEN job = 'CLERK' THEN '职员'
            WHEN job = 'MANGER'THEN '经理'
            WHEN job = 'SALESMAN' THEN '销售人员'
            ELSE job END) AS 'job'
            FROM emp;
```
### 7. 临时表

#### 1. 创建测试表

~~~sql
CREATE TABLE goods(
goods_id INT,
cat_id INT,
goods_sn VARCHAR(10),
goods_name VARCHAR(60),
goods_price DOUBLE,
goods_model INT,
goods_weight VARCHAR(20)
);
~~~

#### 2. 添加数据

> 由于要测试的数据比较多，这边使用IDEA来添加数据

##### 2.1 通过IDEA快速添加数据

> 1. 导入Druid，dbutils ,mysql 三个jar包 ，

![image](https://img2022.cnblogs.com/blog/2923613/202209/2923613-20220910220859656-226816804.png)


>2. 选中三个jar包右键添加到项目中

![image](https://img2022.cnblogs.com/blog/2923613/202209/2923613-20220910220909638-395667307.png)


![image](https://img2022.cnblogs.com/blog/2923613/202209/2923613-20220910220918378-2145417139.png)


>3. 在src目录下创建druid.properties文件

~~~properties
driverClassName=com.mysql.jdbc.Driver
# 数据库地址
url=jdbc:mysql://localhost:3306/fuxi?characterEncoding=UTF-8&rewriteBatchedStatements=true
username=数据库账号
password=数据库密码

#\u521D\u59CB\u5316\u8FDE\u63A5\u6570
initialPoolSize=10
#\u6700\u5C0F\u8FDE\u63A5\u6570
minIdle=5
#\u6700\u5927\u8FDE\u63A5
maxActive=50
# \u8D85\u65F6\u65F6\u95F4\uFF0C\u4EE5\u6BEB\u79D2\u4E3A\u5355\u4F4D\uFF0C1000\u6BEB\u79D2==1\u79D2
maxWait=5000
~~~

> 4. 创建JDBCDruid工具类 ,可以频繁使用

~~~java
import com.alibaba.druid.pool.DruidDataSourceFactory;


import javax.sql.DataSource;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.sql.Statement;
import java.util.Properties;

public class JDBCDruid {
    private static DataSource ds;

    static {
        try {
            Properties properties = new Properties();
            properties.load(new FileInputStream("D:\\学习\\qimu\\src\\druid.properties"));
            ds = DruidDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static Connection getConnection() throws Exception {
        return ds.getConnection();
    }

    public static void close(ResultSet resultSet, Statement statement, Connection connection) {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

~~~

> 5.  创建Test类用于提交sql语句

~~~java
import org.apache.commons.dbutils.QueryRunner;

import java.sql.Connection;


public class Test {
    public static void main(String[] args) throws Exception {
        Connection connection = JDBCDruid.getConnection();
        QueryRunner queryRunner = new QueryRunner();
        String sql = "INSERT INTO goods VALUES(?,?,?,?,?,?,?)";
        int update = 0;
        for (int i = 0; i < 20; i++) {
            int a = (int) (Math.random() * 10+1);
            double b = (int) (Math.random() * 3000+2000);
            update = queryRunner.update(connection, sql, i,a,"ECS00000"+i,a+a+"手机"+a,b,a+a+a+i+a,a+a+"KG");
        }
        System.out.println(update > 0 ? "执行成功" : "执行失败");
        JDBCDruid.close(null, null, connection);
    }
}
~~~

#### 3. 执行SQL查询语句

> 查询goods表中各个类别中，价格最高的商品 , 并且对商品进行升序排列

~~~sql
-- 1.查询到每个商品类别的最高价
SELECT cat_id,MAX(goods_price) FROM goods GROUP BY cat_id;
-- 2.用goods表与临时表进行查询
-- goods.cat_id 表示:两个表中都有的字段要表明查询的是哪个表中的字段,不能直接写
SELECT goods_id,goods.cat_id,goods_name,goods_price 
         FROM goods ,(
              --  把第一步的sql语句当作一个临时表 与 goods 表进行查询     
                      SELECT cat_id,MAX(goods_price) AS max_price
                      FROM goods 
                      GROUP BY cat_id
                      ) temp
           --  临时表temp 的cat_id要等于 goods表的 cat_id
           --  并且临时表temp的最高价格max_price要等于goods中的商品价格goods_price
         WHERE goods.cat_id = temp.cat_id
         AND   goods.goods_price = temp.max_price
         -- 对cat_id进行升序排列
         ORDER BY temp.cat_id;

-- 所有数据 
SELECT * FROM goods;
-- 删除表
DROP TABLE goods;
~~~
