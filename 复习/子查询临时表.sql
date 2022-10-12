-- 临时表————————————————————————————————————————————
-- 创建测试表 
CREATE TABLE goods(
goods_id INT,
cat_id INT,
goods_sn VARCHAR(10),
goods_name VARCHAR(60),
goods_price DOUBLE,
goods_model INT,
goods_weight VARCHAR(20)
);

-- 查询goods表中各个类别中，价格最高的商品,并且对商品进行升序排列

-- 1.查询到每个商品类别的最高价
SELECT cat_id,MAX(goods_price) FROM goods GROUP BY cat_id;
-- 2.用goods表与临时表进行查询
-- goods.cat_id 表示:两个表中都有的字段要表明查询的是哪个表中的字段,不能直接写
SELECT goods_id,goods.cat_id,goods_name,goods_price 
         FROM goods ,(
              --  把第一步的sql语句当作一个临时表 与 goods 表进行查询     
                      SELECT cat_id,MAX(goods_price) AS max_price
                      FROM goods 
                      GROUP BY cat_id
                      ) temp
           --  临时表temp 的cat_id要等于 goods表的 cat_id
           --  并且临时表temp的最高价格max_price要等于goods中的商品价格goods_price
         WHERE goods.cat_id = temp.cat_id
         AND   goods.goods_price = temp.max_price
         -- 对cat_id进行升序排列
         ORDER BY temp.cat_id;

-- 所有数据 
SELECT * FROM goods;
-- 删除表
DROP TABLE goods;