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
  KEY `idx_company_id_dim` (`company_id`,`patent_application_year`,`patent_publish_year`,`patent_type`,`patent_status_detail`) COMMENT 'company_id_dim'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='专利索引拆分表';



drop table company_patent_basic_info_index_split_statistic;
CREATE TABLE `company_patent_basic_info_index_split_statistic` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '公司id',
  `app_year_statistic` longtext NOT NULL COMMENT '申请日期统计图表json',
  `pub_year_statistic` longtext NOT NULL COMMENT '公布日期统计图表json',
  `type_statistic` longtext NOT NULL COMMENT '类型统计图表json',
  `status_statistic` longtext NOT NULL COMMENT '状态统计图表json',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_company_id` (`company_id`) COMMENT 'company_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='专利统计表';


drop table company_equity_relation_details_tmp;
CREATE TABLE `company_equity_relation_details_tmp` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '公司gid',
  `company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名称',
  `shareholder_type` int(11) NOT NULL DEFAULT '0' COMMENT '股东类型，1代表人，2代表公司，3代表其他（非人非公司）',
  `shareholder_type_show` int(11) NOT NULL DEFAULT '0' COMMENT '股东类型(包含公示类型)，1企业法人，2事业法人，3社团法人，4机关法人，5外商投资企业，6自然人股东，7外国(地区)投资者，8合伙企业，9个人独资企业，10其他投资者',
  `shareholder_name_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '股东gid',
  `shareholder_id` varchar(50) NOT NULL DEFAULT '' COMMENT '股东pid',
  `shareholder_name` varchar(255) NOT NULL DEFAULT '' COMMENT '股东名称',
  `equity_ratio` decimal(32,12) NOT NULL DEFAULT '0' COMMENT '持股比例',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `company_id_invested` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被投资企业ID',
  `tyc_unique_entity_id_invested` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被投资方的天眼查唯一商查ID',
  `tyc_unique_entity_name_invested` varchar(255) NOT NULL DEFAULT '' COMMENT '被投资方的天眼查唯一商查名称',
  `investor_identity_type` int(11) NOT NULL DEFAULT '0' COMMENT '投资方身份属性，1代表人，2代表公司，3代表其他（非人非公司）',
  `company_id_investor` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '投资企业ID',
  `tyc_unique_entity_id_investor` varchar(255) NOT NULL DEFAULT '' COMMENT '投资方的天眼查唯一商查ID',
  `tyc_unique_entity_name_investor` varchar(255) NOT NULL DEFAULT '' COMMENT '投资方的天眼查唯一商查名称',
  `equity_amount` decimal(32,12) NOT NULL DEFAULT '0' COMMENT '认缴出资金额',
  `equity_amount_currency` varchar(50) NOT NULL DEFAULT '' COMMENT '金额单位币种',
  `equity_relation_validation_year` int(11) NOT NULL DEFAULT '0' COMMENT '股权关系生效年份',
  `reference_pt_year` int(11) NOT NULL DEFAULT '0' COMMENT '股权关系生效年份',
  PRIMARY KEY (`id`),
  KEY `idx_company_id` (`company_id`),
  KEY `idx_shareholder_name_id` (`shareholder_name_id`),
  KEY `idx_shareholder_id` (`shareholder_id`),
  KEY `idx_invested` (`company_id_invested`,`reference_pt_year`,`company_id_investor`,`tyc_unique_entity_name_investor`),
  KEY `idx_investor` (`tyc_unique_entity_id_investor`,`tyc_unique_entity_id_invested`,`reference_pt_year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='股权明细';

