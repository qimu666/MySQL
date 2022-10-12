-- 查找每个部门工资高于本部门平均工资的人的资料
-- 1.查找每个部门的平均工资
SELECT deptno,AVG(sal) FROM emp GROUP BY deptno;
-- 2.把是一步当作临时表与emp表进行查询
SELECT ename,sal,emp.deptno,temp.avg_sal 
              FROM emp ,(
                         SELECT deptno,AVG(sal) AS avg_sal  
                         FROM emp 
                         GROUP BY deptno
                         ) temp
              WHERE  emp.deptno=temp.deptno 
              AND emp.sal > avg_sal
              ORDER BY emp.deptno;
              
-- 查找每个部门工资最高的人的详细资料
SELECT deptno , MAX(sal)  AS max_sal FROM emp GROUP BY deptno

SELECT ename,sal,emp.deptno,temp.max_sal  
                    FROM emp ,(
                    SELECT deptno , 
                    MAX(sal)  AS max_sal 
                    FROM emp 
                    GROUP BY deptno) temp
          WHERE emp.deptno = temp.deptno 
          AND emp.sal=temp.max_sal
          ORDER BY emp.deptno;