drop table company_patent_basic_info_index_split;
CREATE TABLE `company_patent_basic_info_index_split` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
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
  KEY `idx_company_id` (`company_id`) COMMENT 'company_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='专利索引拆分表';



drop table company_patent_basic_info_index_split_statistic;
CREATE TABLE `company_patent_basic_info_index_split_statistic` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '公司id',
  `app_year_statistic` longtext NOT NULL COMMENT '申请日期图表',
  `pub_year_statistic` longtext NOT NULL COMMENT '公布日期图表',
  `type_statistic` longtext NOT NULL COMMENT '类型图表',
  `status_statistic` longtext NOT NULL COMMENT '状态图表',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_company_id` (`company_id`) COMMENT 'company_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='专利统计表';



