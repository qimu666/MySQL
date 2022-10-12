# 数学函数——————————————————————————————————————————————————————————

-- ABS(num) 绝对值
-- dual 亚元表
SELECT ABS(10) FROM DUAL;

-- BIN(decimal_number) 十进制转二进制
SELECT BIN(10) FROM DUAL;

-- CEILING(num) 向上取整 ,得到比num 大的最小整数
SELECT CEILING(1.1) FROM DUAL; 

-- FLOOR(num) 向下取整 ,得到比num 小的最大整数
SELECT FLOOR(1.1) FROM DUAL; 

-- CONV(num , from_base , to_base) 进制转换
-- 下面的含义是：8 是十进制的8，转为2进制
SELECT CONV(8,10,2) FROM DUAL;

-- FORMAT(num ,decimal_places) 保留小数位数（四舍五入）
-- 保存小数点2位
SELECT FORMAT(1.345211,2) FROM DUAL; 

-- LEAST( num1,num2[, ....] )  求多个里面的最小值
SELECT LEAST(11,-1,-9,8) FROM DUAL; 

-- MOD (num , denominator )   求余
SELECT MOD(10,3) FROM DUAL; 

-- RAND([seed])  返回随机数 范围 0 <= v <= 1.0;
-- 如果使用 RAND() 每次执行返回不同的随机数， 范围 0 <= v <= 1.0;
SELECT RAND() FROM DUAL; 
--  如果使用 RAND(seed) 返回不同的随机数， 范围 0 <= v <= 1.0 ,如果seed不变则随机数也不会改变
SELECT RAND(1) FROM DUAL; 
SELECT RAND(3) FROM DUAL; 








