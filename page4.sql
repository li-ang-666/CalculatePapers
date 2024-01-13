DROP TABLE `test_db`.`dwd_user_register_details`;
CREATE TABLE `test_db`.`dwd_user_register_details` (
  `tyc_user_id` largeint COMMENT '天眼查用户ID',
  `mobile` largeint COMMENT '手机号',
  `register_time` datetime COMMENT '注册时间',
  `vip_from_time` datetime COMMENT 'VIP开始时间',
  `vip_to_time` datetime COMMENT 'VIP结束日期',
  `user_type` largeint COMMENT '用户类型 0:普通,1:vvip,2:媒体用户,3:3个月vip,4:6个月vip,5:12个月以上vip,6:24个月vip,7:26个月以上vip,-1:删除,-2:黑名单',
  `create_time` datetime COMMENT '写入doris时间',
  `update_time` datetime COMMENT '更新doris时间'
) ENGINE=OLAP
UNIQUE KEY(`tyc_user_id`)
COMMENT '用户注册'
DISTRIBUTED BY HASH(`tyc_user_id`) BUCKETS 6
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3",
  -- MOW
  "enable_unique_key_merge_on_write" = "true",
  -- schema change
  "light_schema_change" = "true"
);
-----------------------------------------------------------------------------------------------------
DROP TABLE `test_db`.`dwd_coupon_info`;
CREATE TABLE `test_db`.`dwd_coupon_info` (
  `promotion_code` varchar(65530) COMMENT '优惠码',
  `unique_user_id` largeint COMMENT '天眼查用户ID',
  `promotion_id` largeint COMMENT '优惠ID',
  `use_status` largeint COMMENT '使用状态',
  `receive_time` datetime COMMENT '发券时间',
  `effective_time` datetime COMMENT '有效开始日期',
  `expiration_time` datetime COMMENT '有效结束日期',
  `create_time` datetime COMMENT '写入doris时间',
  `update_time` datetime COMMENT '更新doris时间'
) ENGINE=OLAP
UNIQUE KEY(`promotion_code`)
COMMENT '优惠券'
DISTRIBUTED BY HASH(`promotion_code`) BUCKETS 6
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3",
  -- MOW
  "enable_unique_key_merge_on_write" = "true",
  -- schema change
  "light_schema_change" = "true"
);
-----------------------------------------------------------------------------------------------------
DROP TABLE `test_db`.`dwd_app_active`;
CREATE TABLE `test_db`.`dwd_app_active` (
  `app_id2` varchar(65530) COMMENT 'app_id2唯一键',
  `pt` date COMMENT '分区',
  `android_id` string COMMENT '安卓用户设备标识,不唯一',
  `imei` string COMMENT '安卓用户设备唯一标识,安卓10及以上,无法获取',
  `oaid` string COMMENT '安卓用户设备标识,无需授权,不唯一,可手动重置',
  `idfa` string COMMENT 'iOS用户设备标识,需授权',
  `idfv` string COMMENT 'iOS用户设备标识,无需授权,不唯一,卸载重装会重置',
  `type` largeint COMMENT '设备类型 iOS:1 安卓:0',
  `umeng_channel` string COMMENT '渠道包,如huawei,iOS1',
  `create_time` datetime COMMENT '激活时间',
  `app_version` string COMMENT 'app版本',
  `update_time` datetime COMMENT '更新doris时间'
) ENGINE=OLAP
UNIQUE KEY(`app_id2`, `pt`)
COMMENT '激活'
PARTITION BY RANGE(`pt`) ()
DISTRIBUTED BY HASH(`app_id2`) BUCKETS 6
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3",
  -- MOW
  "enable_unique_key_merge_on_write" = "true",
  -- schema change
  "light_schema_change" = "true",
  -- partition
  "dynamic_partition.enable" = "true",
  "dynamic_partition.time_unit" = "DAY",
  "dynamic_partition.create_history_partition" = "true",
  "dynamic_partition.history_partition_num" = "30",
  "dynamic_partition.start" = "-30",
  "dynamic_partition.end" = "1",
  "dynamic_partition.prefix" = "p",
  -- partition 分桶数
  "dynamic_partition.buckets" = "6",
  -- partition 副本数
  "dynamic_partition.replication_allocation" = "tag.location.default: 3"
);