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


spark-beeline \
--hiveconf spark.driver.memory=2g \
--hiveconf spark.driver.memoryOverhead=512m \
--hiveconf spark.executor.memory=8g \
--hiveconf spark.executor.memoryOverhead=512m \
--hiveconf spark.executor.cores=4 \
--hiveconf spark.memory.fraction=0.8 \
--hiveconf spark.yarn.priority=999 \
--hiveconf spark.dynamicAllocation.maxExecutors=32
