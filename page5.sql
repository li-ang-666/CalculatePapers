CREATE TABLE `crowd_user_bitmap` (
  `crowd_id` largeint COMMENT '人群包id',
  `create_timestamp` largeint COMMENT '创建时间',
  `user_id_bitmap` bitmap BITMAP_UNION COMMENT '用户id位图'
)
AGGREGATE KEY(`crowd_id`, `create_timestamp`)
DISTRIBUTED BY HASH(`crowd_id`) BUCKETS 30
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3"
);

CREATE TABLE `dispatch_user_bitmap` (
  `dispatch_id` largeint COMMENT '分发策略id',
  `create_timestamp` largeint COMMENT '创建时间',
  `user_id_count` largeint COMMENT '用户id数量',
  `user_id_bitmap` bitmap BITMAP_UNION COMMENT '用户id位图'
)
AGGREGATE KEY(`dispatch_id`, `create_timestamp`, `user_id_count`)
DISTRIBUTED BY HASH(`dispatch_id`) BUCKETS 30
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3"
);

CREATE TABLE `dispatch_sub_user_bitmap` (
  `dispatch_id` largeint COMMENT '分发策略id',
  `create_timestamp` largeint COMMENT '创建时间',
  `user_id_count` largeint COMMENT '用户id数量',
  `sub_num` largeint COMMENT '子编号',
  `result_type` largeint COMMENT '结果',
  `user_id_bitmap` bitmap BITMAP_UNION COMMENT '用户id位图'
)
AGGREGATE KEY(`dispatch_id`, `create_timestamp`, `user_id_count`, `sub_num`, `result_type`)
DISTRIBUTED BY HASH(`dispatch_id`) BUCKETS 30
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3"
);