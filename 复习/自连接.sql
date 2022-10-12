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
