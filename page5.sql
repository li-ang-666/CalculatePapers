drop table company_patent_basic_info_index_split;
CREATE TABLE `company_patent_basic_info_index_split` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `company_patent_basic_info_index_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'company_patent_basic_info_index表的主键id',
  `company_patent_basic_info_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'company_patent_basic_info表的主键id',
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '公司id',
  `patent_type` int NOT NULL DEFAULT '0' COMMENT '专利类型',
  `patent_publish_year` int NOT NULL DEFAULT '0' COMMENT '发布年份 ',
  `patent_application_year` int NOT NULL DEFAULT '0' COMMENT '申请年份',
  `patent_title` varchar(1000) NOT NULL DEFAULT '' COMMENT '专利名称',
  `patent_application_number` varchar(50) NOT NULL DEFAULT '' COMMENT '申请号',
  `patent_announce_number` varchar(50) NOT NULL DEFAULT '' COMMENT '公开号',
  `patent_status` varchar(255) NOT NULL DEFAULT '' COMMENT '专利状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_company_patent_basic_info_index_id` (`company_patent_basic_info_index_id`) COMMENT 'company_patent_basic_info_index_id',
  KEY `idx_company_patent_basic_info_id` (`company_patent_basic_info_id`) COMMENT 'company_patent_basic_info_id',
  KEY `idx_patent_application_number` (`patent_application_number`) COMMENT 'patent_application_number',
  KEY `idx_patent_announce_number` (`patent_announce_number`) COMMENT 'patent_announce_number',
  KEY `idx_company_id_patent_type_pub_year` (`company_id`,`patent_type`,`patent_publish_year`) COMMENT 'company_id,patent_type,patent_publish_year',
  KEY `idx_company_id_patent_type_app_year` (`company_id`,`patent_type`,`patent_application_year`) COMMENT 'company_id,patent_type,patent_application_year',
  KEY `idx_company_id_patent_status` (`company_id`,`patent_status`) COMMENT 'company_id,patent_status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='专利索引拆分表';



