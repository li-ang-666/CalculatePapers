DROP TABLE `test_db`.`dwd_user_register_details`;
CREATE TABLE `test_db`.`dwd_user_register_details` (
  `tyc_user_id` largeint COMMENT '天眼查用户ID',
  `mobile` largeint COMMENT '手机号',
  `register_time` datetimev2(6) COMMENT '注册时间',
  `vip_from_time` datetimev2(6) COMMENT 'VIP开始时间',
  `vip_to_time` datetimev2(6) COMMENT 'VIP结束日期',
  `user_type` largeint COMMENT '用户类型 0:普通,1:vvip,2:媒体用户,3:3个月vip,4:6个月vip,5:12个月以上vip,6:24个月vip,7:26个月以上vip,-1:删除,-2:黑名单',
  `create_time` datetimev2(6) COMMENT '写入doris时间',
  `update_time` datetimev2(6) COMMENT '更新doris时间'
) ENGINE=OLAP
UNIQUE KEY(`tyc_user_id`)
COMMENT '注册'
DISTRIBUTED BY HASH(`tyc_user_id`) BUCKETS 6
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3",
  -- MOW
  "enable_unique_key_merge_on_write" = "false",
  -- schema change
  "light_schema_change" = "false"
);
-----------------------------------------------------------------------------------------------------
DROP TABLE `test_db`.`dwd_coupon_info`;
CREATE TABLE `test_db`.`dwd_coupon_info` (
  `promotion_code` varchar(255) COMMENT '优惠码',
  `unique_user_id` largeint COMMENT '天眼查用户ID',
  `promotion_id` largeint COMMENT '优惠ID',
  `use_status` largeint COMMENT '使用状态',
  `receive_time` datetimev2(6) COMMENT '发券时间',
  `effective_time` datetimev2(6) COMMENT '有效开始日期',
  `expiration_time` datetimev2(6) COMMENT '有效结束日期',
  `create_time` datetimev2(6) COMMENT '写入doris时间',
  `update_time` datetimev2(6) COMMENT '更新doris时间'
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
  `app_id2` varchar(255) COMMENT 'app_id2唯一键',
  `pt` datev2 COMMENT '分区',
  `android_id` string COMMENT '安卓用户设备标识,不唯一',
  `imei` string COMMENT '安卓用户设备唯一标识,安卓10及以上,无法获取',
  `oaid` string COMMENT '安卓用户设备标识,无需授权,不唯一,可手动重置',
  `idfa` string COMMENT 'iOS用户设备标识,需授权',
  `idfv` string COMMENT 'iOS用户设备标识,无需授权,不唯一,卸载重装会重置',
  `type` largeint COMMENT '设备类型 iOS:1 安卓:0',
  `umeng_channel` string COMMENT '渠道包,如huawei,iOS1',
  `create_time` datetimev2(6) COMMENT '激活时间',
  `app_version` string COMMENT 'app版本',
  `update_time` datetimev2(6) COMMENT '更新doris时间'
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
-----------------------------------------------------------------------------------------------------
DROP TABLE `test_db`.`dim_user_comparison`;
CREATE TABLE `test_db`.`dim_user_comparison` (
  `uid` largeint COMMENT '用户关联',
  `tyc_user_id` largeint COMMENT '老用户ID',
  `tyc_user_id_new` largeint COMMENT '新用户ID',
  `mobile` largeint COMMENT '手机号',
  `create_time` datetimev2(6) COMMENT '写入doris时间',
  `update_time` datetimev2(6) COMMENT '更新doris时间'
) ENGINE=OLAP
UNIQUE KEY(`uid`)
COMMENT '新老用户映射'
DISTRIBUTED BY HASH(`uid`) BUCKETS 6
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3",
  -- MOW
  "enable_unique_key_merge_on_write" = "true",
  -- schema change
  "light_schema_change" = "true"
);
-----------------------------------------------------------------------------------------------------
DROP TABLE `test_db`.`dwd_order_info`;
CREATE TABLE `test_db`.`dwd_order_info` (
  `order_id` varchar(255) COMMENT '订单ID',
  `order_code` string COMMENT '新交易订单ID',
  `tyc_user_id` largeint COMMENT '天眼查用户ID',
  `mobile` largeint COMMENT '手机号',
  `sku_id` largeint COMMENT '商品ID',
  `vip_from_time` datetimev2(6) COMMENT 'VIP开始时间',
  `vip_to_time` datetimev2(6) COMMENT 'VIP结束日期',
  `order_status` largeint COMMENT '订单状态',
  `amount` largeint COMMENT '总金额',
  `actual_amount` largeint COMMENT '实收金额',
  `invite_code` string COMMENT '邀请码',
  `pay_date` datetimev2(6) COMMENT '支付时间',
  `create_date` datetimev2(6) COMMENT '下单时间',
  `platform_name` string COMMENT '平台名称 ',
  `pay_way` string COMMENT '支付方式',
  `pay_point_id` string COMMENT '痒点ID',
  `create_time` datetimev2(6) COMMENT '写入doris时间',
  `update_time` datetimev2(6) COMMENT '更新doris时间'
) ENGINE=OLAP
UNIQUE KEY(`order_id`)
COMMENT '订单'
DISTRIBUTED BY HASH(`order_id`) BUCKETS 6
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3",
  -- MOW
  "enable_unique_key_merge_on_write" = "true",
  -- schema change
  "light_schema_change" = "true"
);
