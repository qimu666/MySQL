
-- 子查询是指嵌入在其它sql语句中的selecti语句，也叫嵌套查询


-- 单行子查询————————————————————————————————————————————————————————————————————————————————————————————
-- 单行子查询是指只返回一行数据的子查询语句

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
          
-- 多行子查询————————————————————————————————————————————————————————————————————————————————————————————
-- 多行子查询指返回多行数据的子查询 便用关键子 in

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
               
          
          
