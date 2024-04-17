with group_v1 as(
  select * from ods.ods_company_group_company_group_v1_df where pt = '20240415' and dw_is_del = 0
),
tyc_group as (
  select * from test.tyc_group
)
-- select count(distinct group_gid) from group_v1; -- 536354
-- select count(distinct group_id) from tyc_group; -- 891415








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
