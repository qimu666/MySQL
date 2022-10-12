
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
         