# 字符串相关函数
-- CHARSET(str) 返回字串字符集
SELECT CHARSET(ename) FROM emp;

-- CONCAT() 连接字串，将多个列拼接成一列
SELECT CONCAT(ename,' 工作是 ' , job ,' a') FROM emp;

-- INSERT(string,substring) 返回substring在string中出现的位置，没有返回0
-- dual 亚元表 ，系统表 可以作为测试表使用
SELECT INSERT('aaaaqimu666', 'q') FROM DUAL;

-- UCASE() 转换大写
SELECT UCASE(ename) FROM emp;

-- LCASE() 转换小
SELECT LCASE(ename) FROM emp;

-- LEFT(str,length),从str中的左边起取length个字符
SELECT LEFT(ename,2) FROM emp;

-- RIGHT(str,length),从str中的右边起取length个字符
SELECT RIGHT(ename,2) FROM emp;

-- LENGTH(str) string长度[按照字节]
SELECT LENGTH(ename) FROM emp;
SELECT LENGTH('柒木') FROM emp;

-- REPLACE(str , search_str , replace_str )
-- 在str中用 replace_str 替换 search_str
-- 例：如果在job中查询到 MANAGER , 就替换成经理
SELECT ename ,REPLACE(job , 'MANAGER' , '经理') FROM emp ;

-- STRCMP(str1,str2)  逐字符比较两字串大小
-- 返回 1 str1 大 ，0 相等 ，-1 str2 大
SELECT STRCMP('qimu1','QIMU') FROM DUAL;

-- SUBSTRING(str , position[ , length ])
-- 从str 的 position开始【从1开始计算】，截取length个字符
-- 从ename字段的数据第一个位置开始截取4个字符，
-- [注意] position 不能为0
SELECT SUBSTRING(ename,1,4) FROM emp;
 
-- LTRIM(str) 去除前端空格
-- RTRIM(str) 去除后端空格
-- TRIM(str)  去除前后两端空格
SELECT LTRIM(' 223的观点') FROM DUAL;
SELECT RTRIM('223的观点  ') FROM DUAL;
SELECT TRIM(' 223的观点  ') FROM DUAL;


#  练习：以首字母小写的方式显示所有员工emp表的姓名 （2种）
-- 1.
SELECT CONCAT(LCASE(SUBSTRING(ename,1,1)),SUBSTRING(ename,2)) AS '姓名'FROM emp  ;
-- 2.
SELECT CONCAT(LCASE(LEFT(ename,1)),SUBSTRING(ename,2)) AS '姓名'FROM emp  ;

SELECT * FROM emp;