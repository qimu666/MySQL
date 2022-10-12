-- 多列子查询

-- 请思考如何查询与allen的部门和岗位完全相同的所有雇员（并且不含allen本人）

-- 1. 先查到allen的部门和工作
SELECT deptno ,job FROM emp WHERE ename ='ALLEN';
-- 2. 把上面的查询当作子查询

SELECT * FROM emp 
         WHERE (deptno , job ) = (
         SELECT deptno ,job 
         FROM emp 
         WHERE ename ='ALLEN'
         )AND ename != 'ALLEN';
         
-- 请查询和宋江数学，英语，语文成绩完全相同的学生

-- 1.查询到宋江的数学，英语，语文成绩
SELECT chinese,english,math 
            FROM student
            WHERE `name` = '宋江';
-- 2.把上面的查询当作子查询            
SELECT * FROM student
         WHERE (chinese,english,math)=(
               SELECT chinese,english,math 
               FROM student
               WHERE `name` = '宋江'
         ) AND NAME <> '宋江';