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

INSERT INTO emp(id,‘name’)VALUES(3,'牛魔王');