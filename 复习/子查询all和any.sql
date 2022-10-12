-- all 和 any 的使用

-- 显示工资比部门30的所有员工的工资高的员工的姓名、工资和部门号
-- 1.查询部门30的所有员工的工资
SELECT sal FROM emp WHERE deptno =30;

-- 2.查询工资比30部门的所有员工的工资高的员工的姓名、工资和部门号
-- (1)第一种
SELECT ename , sal ,deptno FROM emp
               WHERE sal > ALL(
               SELECT sal FROM emp WHERE deptno =30
               );
-- (2)第二种
SELECT ename , sal ,deptno FROM emp
               WHERE sal > (
               SELECT MAX(sal) FROM emp WHERE deptno =30
               );
               
-- 请思考：如何显示工资比部门30的其中一个员工的工资高的员工的姓名、工资和部门号
-- (1)第一种
SELECT ename , sal ,deptno FROM emp
               WHERE sal > ANY(
               SELECT sal FROM emp WHERE deptno =30
               );
-- (2)第二种
SELECT ename , sal ,deptno FROM emp
               WHERE sal > (
               SELECT MIN(sal) FROM emp WHERE deptno =30
               );