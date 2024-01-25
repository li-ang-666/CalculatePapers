-- 上传
!sh hdfs dfs -put -f /home/hive/liang/hive-udf-1.0.jar /hive/jars/liang-hive-udf-2.0.jar
-- 加载
add jar hdfs:///hive/jars/liang-hive-udf-2.0.jar;
-- 创建UDAF函数
drop function if exists doris.bitmap_to_doris;
create function doris.bitmap_to_doris as 'com.liang.udf.BitmapToDorisUDF' USING JAR 'hdfs:///hive/jars/liang-hive-udf-2.0.jar';
-- 测试
desc function extended doris.bitmap_to_doris;



-- 设置内存
set spark.executor.memory=10g;
-- 第四个参数是'TEST', 可以将该bitmap写入doris.test.crowd_user_bitmap
select doris.bitmap_to_doris(crowd_id,create_timestamp,user_id_bitmap,'TEST') from project.crowd_user_bitmap where crowd_id = '-1' and create_timestamp = '-1' and pt = '-1';
-- 第四个参数是'PROD', 可以将该bitmap写入doris.crowd.crowd_user_bitmap
select doris.bitmap_to_doris(crowd_id,create_timestamp,user_id_bitmap,'PROD') from project.crowd_user_bitmap where crowd_id = '-1' and create_timestamp = '-1' and pt = '-1';


select bitmap_count(user_id_bitmap) from crowd.crowd_user_bitmap where crowd_id = -1;
select bitmap_count(user_id_bitmap) from test.crowd_user_bitmap where crowd_id = -1;


