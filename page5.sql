DROP TABLE `test_db`.`ads_user_dispatch_log_tag_df`;
CREATE TABLE `test_db`.`ads_user_dispatch_log_tag_df` (
  `tyc_user_id` largeint COMMENT '天眼查用户ID',
  `dispatch_id` largeint COMMENT '分发ID',
  `pt` datev2 COMMENT '分区',
  `dispatch_date` datev2 COMMENT '分发日期',
  `mobile` string COMMENT '手机号'
) ENGINE=OLAP
DUPLICATE KEY(`tyc_user_id`, `dispatch_id`, `pt`)
COMMENT '分发策略标签明细表'
PARTITION BY RANGE(`pt`) ()
DISTRIBUTED BY HASH(`tyc_user_id`) BUCKETS 30
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3",
  -- partition
  "dynamic_partition.enable" = "true",
  "dynamic_partition.time_unit" = "DAY",
  "dynamic_partition.create_history_partition" = "true",
  "dynamic_partition.history_partition_num" = "1",
  "dynamic_partition.start" = "-1",
  "dynamic_partition.end" = "1",
  "dynamic_partition.prefix" = "p"
);
-----------------------------------------------------------------------------------------------------
