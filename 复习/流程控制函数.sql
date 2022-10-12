
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