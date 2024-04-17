with group_v1 as(
  select * from ods.ods_company_group_company_group_v1_df where pt = '20240415' and dw_is_del = 0 and group_type = 0 and deleted = 0
),
tyc_group as (
  select * from test.tyc_group
)
-- select 'old count', count(distinct group_gid) from group_v1
-- union all
-- select 'new count', count(distinct group_id) from tyc_group
-- union all
-- select 'old only', count(distinct group_gid) from group_v1 t1 left anti join tyc_group t2 on t1.group_gid = t2.group_id
-- union all
-- select 'same', count(distinct group_gid) from group_v1 t1 left semi join tyc_group t2 on t1.group_gid = t2.group_id;
select distinct group_gid from group_v1 t1 left anti join tyc_group t2 on t1.group_gid = t2.group_id limit 111;







drop table if exists `tyc_group`;
CREATE TABLE `tyc_group` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '母公司gid',
  `group_name` varchar(255) NOT NULL DEFAULT '' COMMENT '母公司名称',
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '子公司gid',
  `company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '子公司名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_company` (`company_id`),
  KEY `idx_group` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='集团';


drop table if exists `tyc_group`;
CREATE TABLE `tyc_group` (
  `id` bigint  COMMENT '主键ID',
  `group_id` bigint COMMENT '母公司gid',
  `group_name` string COMMENT '母公司名称',
  `company_id` bigint COMMENT '子公司gid',
  `company_name` string COMMENT '子公司名称',
  `create_time` string COMMENT '创建时间',
  `update_time` string COMMENT '更新时间'
);

drop table dwd_coupon_info;
alter table dwd_coupon_info_ rename dwd_coupon_info;


insert into entity_legal_rep_list_total(tyc_unique_entity_id_legal_rep, 
    entity_type_id_legal_rep,
    entity_name_valid_legal_rep,
    legal_rep_admission_start_time_latest,
    legal_rep_resignation_time_latest,
    legal_rep_type_display_name)value(22822,22822,22822,22822,22822,22822);



    select *
from dwd.dwd_coupon_info
where unique_user_id in
      (1499999421738266709, 1500045301082230865, 1500074871147724860, 1500128021967798341, 1500363145175117859,
       1500365093852950570, 1500423399967555631, 1500489410464972809, 1500513282140667954, 1500569940464238654,
       1500576285586358287, 1500584498394312731, 1500632042096832554, 1500727055719858275, 1500831663289012235,
       1500851373703430176, 1500860233784758355, 1500867274133737472, 1500881853156950023, 1548423381651558428,
       1571843177931870288, 1583103925123325971, 1619923798880960586, 1665645394421358665, 1665979047500353563,
       1695288775833296898, 1704070072424730683, 1706581507830718467, 1710980388484038731, 1715723425982459951,
       1750805947241996303, 1753955228987695165, 1771908247045836823, 1773526249923174447, 1775724585321259059,
       1780245149591281730, 1780249252920827946, 1780251457027608662, 1780253116009058365, 1780258761768722505,
       1780258793989382156) and promotion_id in (1649,1640,1642,1698,1709,1735,1734)
  and create_time >= from_unixtime(1713196800000/1000)
  and create_time <= from_unixtime(1713283200000/1000);


DROP TABLE `dwd`.`dwd_coupon_info_bak` FORCE;
CREATE TABLE `dwd`.`dwd_coupon_info_bak` (
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


drop table dwd_coupon_info force;
alter table dwd_coupon_info_bak rename dwd_coupon_info;
