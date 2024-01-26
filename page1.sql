DROP TABLE `dwd`.`dwd_user_register_details` FORCE;
CREATE TABLE `dwd`.`dwd_user_register_details` (
  `tyc_user_id` largeint COMMENT '天眼查用户ID',
  `mobile` largeint COMMENT '手机号',
  `register_time` datetimev2(3) COMMENT '注册时间',
  `vip_from_time` datetimev2(3) COMMENT 'VIP开始时间',
  `vip_to_time` datetimev2(3) COMMENT 'VIP结束日期',
  `user_type` largeint COMMENT '用户类型 0:普通,1:vvip,2:媒体用户,3:3个月vip,4:6个月vip,5:12个月以上vip,6:24个月vip,7:26个月以上vip,-1:删除,-2:黑名单',
  `create_time` datetimev2(3) COMMENT '写入doris时间',
  `update_time` datetimev2(3) COMMENT '更新doris时间'
)
UNIQUE KEY(`tyc_user_id`)
DISTRIBUTED BY HASH(`tyc_user_id`) BUCKETS 40
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3"
);

-----------------------------------------------------------------------------------------------------

DROP TABLE `dwd`.`dwd_coupon_info` FORCE;
CREATE TABLE `dwd`.`dwd_coupon_info` (
  `promotion_code` varchar(255) COMMENT '优惠码',
  `unique_user_id` largeint COMMENT '天眼查用户ID',
  `promotion_id` largeint COMMENT '优惠ID',
  `use_status` largeint COMMENT '使用状态',
  `receive_time` datetimev2(3) COMMENT '发券时间',
  `effective_time` datetimev2(3) COMMENT '有效开始日期',
  `expiration_time` datetimev2(3) COMMENT '有效结束日期',
  `create_time` datetimev2(3) COMMENT '写入doris时间',
  `update_time` datetimev2(3) COMMENT '更新doris时间'
)
UNIQUE KEY(`promotion_code`)
DISTRIBUTED BY HASH(`promotion_code`) BUCKETS 40
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3"
);

-----------------------------------------------------------------------------------------------------

DROP TABLE `dim`.`dim_user_comparison` FORCE;
CREATE TABLE `dim`.`dim_user_comparison` (
  `uid` largeint COMMENT '用户关联',
  `tyc_user_id` largeint COMMENT '老用户ID',
  `tyc_user_id_new` largeint COMMENT '新用户ID',
  `mobile` largeint COMMENT '手机号',
  `create_time` datetimev2(3) COMMENT '写入doris时间',
  `update_time` datetimev2(3) COMMENT '更新doris时间'
)
UNIQUE KEY(`uid`)
DISTRIBUTED BY HASH(`uid`) BUCKETS 40
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3"
);

-----------------------------------------------------------------------------------------------------

DROP TABLE `dwd`.`dwd_order_info` FORCE;
CREATE TABLE `dwd`.`dwd_order_info` (
  `order_id` varchar(255) COMMENT '订单ID',
  `order_code` string COMMENT '新交易订单ID',
  `tyc_user_id` largeint COMMENT '天眼查用户ID',
  `mobile` largeint COMMENT '手机号',
  `sku_id` largeint COMMENT '商品ID',
  `vip_from_time` datetimev2(3) COMMENT 'VIP开始时间',
  `vip_to_time` datetimev2(3) COMMENT 'VIP结束日期',
  `order_status` largeint COMMENT '订单状态',
  `amount` largeint COMMENT '总金额',
  `actual_amount` largeint COMMENT '实收金额',
  `invite_code` string COMMENT '邀请码',
  `pay_date` datetimev2(3) COMMENT '支付时间',
  `create_date` datetimev2(3) COMMENT '下单时间',
  `platform_name` string COMMENT '平台名称 ',
  `pay_way` string COMMENT '支付方式',
  `pay_point_id` string COMMENT '痒点ID',
  `create_time` datetimev2(3) COMMENT '写入doris时间',
  `update_time` datetimev2(3) COMMENT '更新doris时间'
)
UNIQUE KEY(`order_id`)
DISTRIBUTED BY HASH(`order_id`) BUCKETS 40
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3"
);

-----------------------------------------------------------------------------------------------------

DROP TABLE `dwd`.`dwd_pay_point_com_detail` FORCE;
CREATE TABLE `dwd`.`dwd_pay_point_com_detail` (
  `tyc_user_id` largeint COMMENT '天眼查用户ID',
  `request_time` datetimev2(3) COMMENT '请求时间',
  `pt` datev2 COMMENT '分区',
  `sensor_event` string COMMENT '神策事件',
  `mobile` string COMMENT '手机号',
  `platform_name`string COMMENT '平台',
  `pay_point_id` string COMMENT '痒点ID',
  `prepare_order_id` string COMMENT '预下单订单ID',
  `activity_id` string COMMENT '活动id',
  `update_time` datetimev2(3) COMMENT '更新时间'
)
UNIQUE KEY(`tyc_user_id`, `request_time`, `pt`)
PARTITION BY RANGE(`pt`) ()
DISTRIBUTED BY HASH(`tyc_user_id`) BUCKETS 40
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3",
  -- partition
  "dynamic_partition.enable" = "true",
  "dynamic_partition.time_unit" = "DAY",
  "dynamic_partition.create_history_partition" = "true",
  "dynamic_partition.history_partition_num" = "30",
  "dynamic_partition.start" = "-30",
  "dynamic_partition.end" = "1",
  "dynamic_partition.prefix" = "p",
  "dynamic_partition.buckets" = "40"
);

-----------------------------------------------------------------------------------------------------

DROP TABLE `dwd`.`dwd_dispatch_task` FORCE;
CREATE TABLE `dwd`.`dwd_dispatch_task` (
  `id` largeint COMMENT '自增id',
  `dispatch_id` largeint COMMENT '分发id',
  `dispatch_status` largeint COMMENT '分发策略状态,1:初始,2:运行中,3:已完成,4:已暂停,5:已失败',
  `retry_times` largeint COMMENT '失败重试次数',
  `schedule_time` largeint COMMENT '调度时间',
  `start_time` largeint COMMENT '开始时间',
  `end_time` largeint COMMENT '结束时间',
  `remark` string COMMENT '备注',
  `deleted` largeint COMMENT '是否删除,0:否,1:是',
  `create_time` largeint COMMENT '创建时间',
  `update_time` largeint COMMENT '修改时间'
)
UNIQUE KEY(`id`)
DISTRIBUTED BY HASH(`id`) BUCKETS 40
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3"
);

-----------------------------------------------------------------------------------------------------

DROP TABLE `dwd`.`dwd_basic_data_collect_monitor_hours` FORCE;
CREATE TABLE `dwd`.`dwd_basic_data_collect_monitor_hours` (
  `id` largeint COMMENT 'id',
  `create_time` datetimev2(3) COMMENT '创建时间',
  `dimension` string COMMENT '维度名称',
  `table_name` string COMMENT '对应表名',
  `collect_date` datetimev2(3) COMMENT '采集日期',
  `data_type` largeint COMMENT '类型:0变更1新增2删除',
  `value` largeint COMMENT '对应的条数',
  `related_company_count` largeint COMMENT '涉及公司数',
  `deleted` largeint COMMENT '是否逻辑删除',
  `update_time` datetimev2(3) COMMENT '更新时间'
)
UNIQUE KEY(`id`)
DISTRIBUTED BY HASH(`id`) BUCKETS 40
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3"
);

-----------------------------------------------------------------------------------------------------

DROP TABLE `ads`.`ads_user_tag` FORCE;
CREATE TABLE `ads`.`ads_user_tag` (
  `tyc_user_id` largeint COMMENT '天眼查用户ID',
  `vip_unpay_time` datetimev2(3) COMMENT '下单VIP未支付时间',
  `svip_pay_last_time` datetimev2(3) COMMENT '最后一次付费svip时间',
  `vip_pay_last_time` datetimev2(3) COMMENT '最后一次付费vip时间',
  `svip_unpay_time` datetimev2(3) COMMENT '下单svip未支付时间',
  `first_show_vip_paypoint_time` datetimev2(3) COMMENT '当日首次触发VIP痒点时间',
  `update_time` datetimev2(3) COMMENT '更新doris时间'
)
UNIQUE KEY(`tyc_user_id`)
DISTRIBUTED BY HASH(`tyc_user_id`) BUCKETS 40
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3"
);
