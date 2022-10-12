#增删改语句和注意事项
SELECT *FROM employee;


         -- 全部字段都要添加字段可以省略emp(表)后()中的字段
INSERT INTO employee VALUES(1,'白骨精','女','2001-1-1','2022-2-4 10:32:11','大王',6000,'抓唐僧')

-- 添加数据可以选择字段添加`emp``employee`
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