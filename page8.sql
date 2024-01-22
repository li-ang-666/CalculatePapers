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



