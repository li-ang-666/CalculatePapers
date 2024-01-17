DROP TABLE `ads`.`ads_user_dispatch_log_tag_df` FORCE;
CREATE TABLE `ads`.`ads_user_dispatch_log_tag_df` (
  `tyc_user_id` largeint COMMENT '天眼查用户ID',
  `dispatch_id` largeint COMMENT '分发ID',
  `pt` datev2 COMMENT '分区',
  `dispatch_date` datev2 COMMENT '分发日期',
  `mobile` string COMMENT '手机号'
)
DUPLICATE KEY(`tyc_user_id`, `dispatch_id`, `pt`)
PARTITION BY RANGE(`pt`) ()
DISTRIBUTED BY HASH(`tyc_user_id`) BUCKETS 40
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
  "dynamic_partition.prefix" = "p",
  "dynamic_partition.buckets" = "40"
);

-----------------------------------------------------------------------------------------------------
DROP TABLE `ads`.`ads_user_distribution_user_tag_df` FORCE;
CREATE TABLE `ads`.`ads_user_distribution_user_tag_df` (
  `tyc_user_id` largeint COMMENT '天眼查用户ID',
  `pt` datev2 COMMENT '分区',
  `mobile` string COMMENT '手机号',
  `regist_date` datev2 COMMENT '注册日期',
  `regist_days` largeint COMMENT '注册时长（天）',
  `regist_months` largeint COMMENT '注册时长（月）',
  `last_active_date` datev2 COMMENT '最近一次活跃日期（近一年）',
  `active_days_by_month` largeint COMMENT '当月活跃天数',
  `is_active_latest_7_day` string COMMENT '近7天是否活跃',
  `active_days_latest_7_day` largeint COMMENT '近7天活跃天数',
  `is_active_latest_28_day` string COMMENT '近28天是否活跃',
  `active_days_latest_28_day` largeint COMMENT '近28天活跃天数',
  `is_active_latest_90_day` string COMMENT '近90天是否活跃',
  `active_days_latest_90_day` largeint COMMENT '近90天活跃天数',
  `is_active_latest_365_day` string COMMENT '近365天是否活跃',
  `active_days_latest_365_day` largeint COMMENT '近365天活跃天数',
  `is_biz_latest_7_day` string COMMENT '近7天是否访问商业页面',
  `biz_days_latest_7_day` largeint COMMENT '近7天访问商业页面天数',
  `is_biz_latest_28_day` string COMMENT '近28天是否访问商业页面',
  `biz_days_latest_28_day` largeint COMMENT '近28天访问商业页面天数',
  `is_biz_latest_90_day` string COMMENT '近90天是否访问商业页面',
  `biz_days_latest_90_day` largeint COMMENT '近90天访问商业页面天数',
  `is_svip_paypoint_latest_7_day` string COMMENT '近7天是否触发SVIP痒点',
  `svip_paypoint_cnt_latest_7_day` largeint COMMENT '近7天触发SVIP痒点次数',
  `is_svip_paypoint_latest_28_day` string COMMENT '近28天是否触发SVIP痒点',
  `svip_paypoint_cnt_latest_28_day` largeint COMMENT '近28天触发SVIP痒点次数',
  `is_svip_paypoint_latest_90_day` string COMMENT '近90天是否触发SVIP痒点',
  `svip_paypoint_cnt_latest_90_day` largeint COMMENT '近90天触发SVIP痒点次数',
  `is_vip_paypoint_latest_7_day` string COMMENT '近7天是否触发VIP痒点',
  `vip_paypoint_cnt_latest_7_day` largeint COMMENT '近7天触发VIP痒点次数',
  `is_vip_paypoint_latest_28_day` string COMMENT '近28天是否触发VIP痒点',
  `vip_paypoint_cnt_latest_28_day` largeint COMMENT '近28天触发VIP痒点次数',
  `is_vip_paypoint_latest_90_day` string COMMENT '近90天是否触发VIP痒点',
  `vip_paypoint_cnt_latest_90_day` largeint COMMENT '近90天触发VIP痒点次数',
  `last_vip_order_unpay_date` datev2 COMMENT '最后一次下单VIP未支付时间',
  `last_svip_order_unpay_date` datev2 COMMENT '最后一次下单SVIP未支付时间',
  `vip_order_unpay_cnt_latest_7_day` largeint COMMENT '近7天下单VIP未支付次数',
  `svip_order_unpay_cnt_latest_7_day` largeint COMMENT '近7天下单SVIP未支付次数',
  `vip_order_unpay_cnt_latest_28_day` largeint COMMENT '近28天下单VIP未支付次数',
  `svip_order_unpay_cnt_latest_28_day` largeint COMMENT '近28天下单SVIP未支付次数',
  `vip_order_unpay_cnt_latest_90_day` largeint COMMENT '近90天下单VIP未支付次数',
  `svip_order_unpay_cnt_latest_90_day` largeint COMMENT '近90天下单SVIP未支付次数',
  `last_vip_order_pay_date` datev2 COMMENT '最后一次下单VIP支付时间',
  `last_svip_order_pay_date` datev2 COMMENT '最后一次下单SVIP支付时间',
  `last_vip_order_type` string COMMENT '上笔VIP订单类型',
  `last_svip_order_type` string COMMENT '上笔SVIP订单类型',
  `last_combination_order_type` string COMMENT '上笔企业套餐订单类型',
  `vip_to_time` datev2 COMMENT 'VIP到期时间',
  `svip_to_time` datev2 COMMENT 'SVIP到期时间',
  `user_state` string COMMENT '用户会员状态',
  `is_ga_user` string COMMENT '是否GA用户',
  `is_vvip_media_user` string COMMENT '是否VVIP/媒体用户',
  `is_blacklist_user` string COMMENT '是否黑名单用户',
  `is_stuff_user` string COMMENT '是否员工用户',
  `is_boss_user` string COMMENT '是否老板用户',
  `is_person_page_with_property_latest_7_day` string COMMENT '近7日是否访问有财产线索人员详情页',
  `is_person_page_with_property_latest_14_day` string COMMENT '近14日是否访问有财产线索人员详情页',
  `is_person_page_with_property_latest_28_day` string COMMENT '近28日是否访问有财产线索人员详情页'
) ENGINE=OLAP
UNIQUE KEY(`tyc_user_id`, `pt`)
PARTITION BY RANGE(`pt`) ()
DISTRIBUTED BY HASH(`tyc_user_id`) BUCKETS 40
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
  "dynamic_partition.prefix" = "p",
  "dynamic_partition.buckets" = "40"
);
-----------------------------------------------------------------------------------------------------
DROP TABLE `ads`.`ads_user_tag_commercial_df` FORCE;
CREATE TABLE `ads`.`ads_user_tag_commercial_df` (
  `tyc_user_id` largeint COMMENT '天眼查用户ID',
  `pt` datev2 COMMENT '分区',
  `mobile` string COMMENT '用户手机号-未加密',
  `user_state` string COMMENT '用户状态（全量）',
  `paypoint_show_30day` largeint COMMENT '近30日触发痒点次数',
  `is_unpay_180day` largeint COMMENT '近180日VIP未付订单订单数',
  `is_discount_last` string COMMENT '上一笔是否为优惠订单',
  `vip_order_sku_last` string COMMENT '上一笔VIP订单的购买期限',
  `vip_overdue_day` largeint COMMENT 'VIP过期天数',
  `vip_expiration_day` largeint COMMENT 'VIP剩余权益天数',
  `active_days_30day` largeint COMMENT '近30日活跃天数',
  `active_days_90day` largeint COMMENT '近90日活跃天数',
  `active_days_365day` largeint COMMENT '近365日活跃天数',
  `svip_paypoint_show_pv_30day` largeint COMMENT '近30日触发红钻/SVIP痒点次数',
  `svip_paypoint_show_pv_7day` largeint COMMENT '近7日触发红钻/SVIP痒点次数',
  `vip_paypoint_show_pv_7day` largeint COMMENT '近7日触发VIP痒点次数',
  `svip_unpay_order_cnt_30day` largeint COMMENT '近30日SVIP未付订单数',
  `is_boss_user` string COMMENT '是否老板用户',
  `is_stuff_user` string COMMENT '是否内部员工用户',
  `is_test_user` string COMMENT '是否测试黑名单用户',
  `is_vvip_media_user` string COMMENT '是否VVIP与媒体用户',
  `is_ga_user` string COMMENT '是否政府用户',
  `svip_expiration_day` largeint COMMENT '有效SVIP权益剩余天数',
  `red_expiration_day` largeint COMMENT '有效红钻权益剩余天数',
  `svip_overdue_day` largeint COMMENT '失效SVIP过期天数',
  `red_overdue_day` largeint COMMENT '失效/红钻过期天数',
  `regist_days` largeint COMMENT '注册天数',
  `paypoint_show_60day` largeint COMMENT '近60日触发痒点次数',
  `is_unpay_1day` largeint COMMENT '近1日VIP未付订单订单数',
  `is_unpay_15day` largeint COMMENT '近15日VIP未付订单订单数',
  `is_unpay_90day` largeint COMMENT '近90日VIP未付订单订单数',
  `svip_unpay_order_cnt_180day` largeint COMMENT '近180日SVIP未付订单数',
  `active_days_by_month` largeint COMMENT '当月活跃天数',
  `last_vip_order_goods_type` string COMMENT '上一笔VIP订单类型',
  `svip_unpay_order_cnt_7day` largeint COMMENT '近7日SVIP未付订单数',
  `vip_paypoint_show_pv_14day` largeint COMMENT '近14日触发VIP痒点次数',
  `vip_paypoint_show_pv_30day` largeint COMMENT '近30日触发VIP痒点次数',
  `tyc_user_id_last_number` string COMMENT '用户id尾号'
) ENGINE=OLAP
UNIQUE KEY(`tyc_user_id`, `pt`)
PARTITION BY RANGE(`pt`) ()
DISTRIBUTED BY HASH(`tyc_user_id`) BUCKETS 40
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
  "dynamic_partition.prefix" = "p",
  "dynamic_partition.buckets" = "40"
);
