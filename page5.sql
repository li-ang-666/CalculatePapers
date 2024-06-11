drop table company_patent_basic_info_index_split;
CREATE TABLE `company_patent_basic_info_index_split` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `company_patent_basic_info_index_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'company_patent_basic_info_index表的主键id',
  `company_patent_basic_info_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'company_patent_basic_info表的主键id',
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '公司id',
  `patent_type` int(11) NOT NULL DEFAULT '0' COMMENT '专利类型: 1-发明类型 2-实用新型 3-外观设计',
  `patent_publish_year` int(11) NOT NULL DEFAULT '0' COMMENT '发布年份 ',
  `patent_application_year` int(11) NOT NULL DEFAULT '0' COMMENT '申请年份',
  `patent_status` int(11) NOT NULL DEFAULT '0' COMMENT '专利状态 10-有效 20-失效 30-审中 40-无效',
  `patent_status_detail` varchar(255) NOT NULL DEFAULT '' COMMENT '专利状态二级',
  `patent_title` varchar(1000) NOT NULL DEFAULT '' COMMENT '专利名称',
  `patent_application_number` varchar(50) NOT NULL DEFAULT '' COMMENT '申请号',
  `patent_announce_number` varchar(50) NOT NULL DEFAULT '' COMMENT '公开号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_company_patent_basic_info_index_id` (`company_patent_basic_info_index_id`) COMMENT 'company_patent_basic_info_index_id',
  KEY `idx_company_patent_basic_info_id` (`company_patent_basic_info_id`) COMMENT 'company_patent_basic_info_id',
  KEY `idx_patent_application_number` (`patent_application_number`) COMMENT 'patent_application_number',
  KEY `idx_patent_announce_number` (`patent_announce_number`) COMMENT 'patent_announce_number',
  KEY `idx_company_id_patent_type_pub_year` (`company_id`,`patent_type`,`patent_publish_year`) COMMENT 'company_id,patent_type,patent_publish_year',
  KEY `idx_company_id_patent_type_app_year` (`company_id`,`patent_type`,`patent_application_year`) COMMENT 'company_id,patent_type,patent_application_year',
  KEY `idx_company_id_patent_status_detail` (`company_id`,`patent_status_detail`) COMMENT 'company_id,patent_status_detail'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='专利索引拆分表';

-- 穿透后,目标股东对这些公司的总股比大于等于50%
-- 119894
set spark.executor.cores=2;
set spark.executor.memory=12g;
with ratio_path_company as (
  select * from ods.ods_prism_shareholder_path_ratio_path_company_new_all_df where pt = 20240606
)
select count(distinct company_id)
from ratio_path_company
where 
(shareholder_name like '%市国资委%'
or
shareholder_name like '%市政府国有资产监督管理委员会%'
or
shareholder_name like '%市人民政府%'
or
shareholder_name like '%市财政厅%'
)
and investment_ratio_total >= 0.5
;

-- 目标股东是这些公司的实控人
-- 118674
set spark.executor.cores=2;
set spark.executor.memory=12g;
with entity_controller_details as (
  select * from test.bdp_equity_entity_controller_details_new_test where pt = 20240606
)
select count(distinct company_id_controlled)
from entity_controller_details
where 
(entity_name_valid like '%市国资委%'
or
entity_name_valid like '%市政府国有资产监督管理委员会%'
or
entity_name_valid like '%市人民政府%'
or
entity_name_valid like '%市财政厅%'
)
and is_controller_tyc_unique_entity_id = 1
;

-- 目标股东对这些公司有实控权
-- 122299
set spark.executor.cores=2;
set spark.executor.memory=12g;
with entity_controller_details as (
  select * from test.bdp_equity_entity_controller_details_new_test where pt = 20240606
)
select count(distinct company_id_controlled)
from entity_controller_details
where 
(entity_name_valid like '%市国资委%'
or
entity_name_valid like '%市政府国有资产监督管理委员会%'
or
entity_name_valid like '%市人民政府%'
or
entity_name_valid like '%市财政厅%'
)
;
