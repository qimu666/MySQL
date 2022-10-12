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
 