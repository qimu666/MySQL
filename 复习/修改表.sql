# 修改表
-- 员工表emp增加一个image列，varchar类型，要求在‘resume’后面
ALTER TABLE emp 
                         -- 不允许为空 默认值为 ''
       ADD image VARCHAR(32) NOT NULL DEFAULT ''
       -- 在 ‘resume’ 列之后
       AFTER ‘resume’;


ALTER TABLE emp MODIFY job VARCHAR(60);-- 修改列

ALTER TABLE emp DROP sex; -- 删除列

RENAME TABLE emp TO employee;-- 修改表名

SELECT *FROM employee;

INSERT INTO employee(id)VALUES(2);

INSERT INTO employee(id,user_name)VALUES(3,'牛魔王');

DESC employee -- 显示表结构

ALTER TABLE employee CHARSET utf8; -- 修改表的字符集

-- 修改列的名称
-- ALTER TABLE employee CHANGE ‘name’  user_name VARCHAR(64) NOT NULL DEFAULT '';
ALTER TABLE employee CHANGE   
                     ‘name’ -- 要修改的字段（列名）
                      user_name  -- 新的字段（列名）
                      VARCHAR(64);
