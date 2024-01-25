DROP TABLE `crowd`.`crowd_user_bitmap_tasks`;
CREATE TABLE `crowd`.`crowd_user_bitmap_tasks` (
  `crowd_id` largeint NOT NULL COMMENT 'hive.project.crowd_user_bitmap.crowd_id',
  `create_timestamp` largeint NOT NULL COMMENT 'hive.project.crowd_user_bitmap.create_timestamp',
  `pt` largeint NOT NULL COMMENT 'hive.project.crowd_user_bitmap.pt',
  `task_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务创建时间',
  `task_start_time` datetime NULL COMMENT '任务开始时间',
  `task_finish_time` datetime NULL COMMENT '任务结束时间',
  `error_message` string NULL COMMENT '报错'
)
UNIQUE KEY(`crowd_id`,`create_timestamp`,`pt`)
DISTRIBUTED BY HASH(`crowd_id`) BUCKETS 5
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3"
);


select count(1) from dwd.dwd_user_register_details;
select count(1) from dwd.dwd_coupon_info;
select count(1) from dwd.dwd_app_active;
select count(1) from dim.dim_user_comparison;
select count(1) from dwd.dwd_order_info;
select count(1) from dwd.dwd_pay_point_com_detail;
select count(1) from dwd.dwd_dispatch_task;
select count(1) from dwd.dwd_basic_data_collect_monitor_hours;
select count(1) from ads.ads_user_tag;

spark-beeline --master yarn --driver-memory 2g


spark-sql --master yarn spark-sql --master yarn --conf spark.driver.host=10.99.194.128 \
  --driver-memory 2g --driver-cores 1 \
  --conf spark.driver.memoryOverhead=512m \
  --executor-memory 8g --num-executors 64 --executor-cores 2 \
  --conf spark.executor.memoryOverhead=512m \
  --queue offline \
  --conf spark.memory.fraction=0.8 \
  --conf spark.driver.extraJavaOptions=-Dlog4j.configuration=file:////home/hive/liang/doris/log4j-all.properties
  --conf spark.yarn.maxAppAttempts=1 \
  --conf spark.yarn.priority=999 \
  --conf spark.sql.shuffle.partitions=1024 \
  --conf spark.shuffle.io.maxRetries=10 \
  --conf spark.sql.autoBroadcastJoinThreshold=104857600


create table if not exists test.graph_export_node_0(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00000*';
create table if not exists test.graph_export_node_1(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00001*';
create table if not exists test.graph_export_node_2(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00002*';
create table if not exists test.graph_export_node_3(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00003*';
create table if not exists test.graph_export_node_4(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00004*';
create table if not exists test.graph_export_node_5(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00005*';
create table if not exists test.graph_export_node_6(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00006*';
create table if not exists test.graph_export_node_7(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00007*';
create table if not exists test.graph_export_node_8(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00008*';
create table if not exists test.graph_export_node_9(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00009*';
create table if not exists test.graph_export_node_10(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00010*';
create table if not exists test.graph_export_node_11(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00011*';
create table if not exists test.graph_export_node_12(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00012*';
create table if not exists test.graph_export_node_13(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00013*';
create table if not exists test.graph_export_node_14(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00014*';
create table if not exists test.graph_export_node_15(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00015*';
create table if not exists test.graph_export_node_16(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00016*';
create table if not exists test.graph_export_node_17(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00017*';
create table if not exists test.graph_export_node_18(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00018*';
create table if not exists test.graph_export_node_19(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00019*';
create table if not exists test.graph_export_node_20(`row` string)stored as textfile location 'obs://hadoop-obs/flink/graph/node/part-00020*';



