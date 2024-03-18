drop table `prism_shareholder_path`.`ratio_path_company_new`;
CREATE TABLE `prism_shareholder_path`.`ratio_path_company_new` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  -- 公司
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '公司id',
  `company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名称',
  `company_is_listed` tinyint NOT NULL DEFAULT '0' COMMENT '公司是否上市',
  `uscc` varchar(255) NOT NULL DEFAULT '' COMMENT '统一社会信用代码',
  -- 股东
  `shareholder_entity_type` tinyint NOT NULL DEFAULT '0' COMMENT '1-company,2-human',
  `shareholder_id` varchar(50) NOT NULL DEFAULT '' COMMENT '股东id,人存human_pid,公司存储company_gid',
  `shareholder_name` varchar(255) NOT NULL DEFAULT '' COMMENT '股东名称',
  `shareholder_name_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '股东内链中的human_name_id',
  `shareholder_master_company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '股东内链中的company_id',
  -- 投资
  `is_direct_shareholder` tinyint NOT NULL DEFAULT '0' COMMENT '是否为直接股东',
  `investment_ratio_direct` decimal(26,6) NOT NULL DEFAULT '0' COMMENT '直接持股比例',
  `max_deliver` decimal(26,6) NOT NULL DEFAULT '0' COMMENT '最大直接持股传递',
  `investment_ratio_total` decimal(26,6) NOT NULL DEFAULT '0' COMMENT '总持股比例',
  `equity_holding_path` longtext COMMENT '持股路径json',
  `is_end` tinyint NOT NULL DEFAULT '0' COMMENT '是否是某条持股路径的终点',
  -- 其他
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  PRIMARY KEY (`id`),
  KEY `idx_company` (`company_id`),
  KEY `idx_shareholder` (`shareholder_id`,`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='投资路径结果表';


drop table `bdp_equity`.`entity_controller_details_new`;
CREATE TABLE `bdp_equity`.`entity_controller_details_new` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tyc_unique_entity_id` varchar(50) NOT NULL DEFAULT '' COMMENT '实体ID',
  `entity_type_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '实体类型',
  `entity_name_valid` varchar(255) NOT NULL DEFAULT '' COMMENT '实体名称',
  `company_name_controlled` varchar(255) NOT NULL DEFAULT '' COMMENT '被控制的企业名称',
  `company_id_controlled` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被控制的企业ID',
  `equity_relation_path_cnt` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联路径数',
  `estimated_equity_ratio_total` decimal(26,6) NOT NULL DEFAULT '0' COMMENT '预计总持股比例',
  `controlling_equity_relation_path_detail` longtext COMMENT '实际控制关系路径详情',
  `is_controller_tyc_unique_entity_id` tinyint(4) NOT NULL DEFAULT '1' COMMENT '实体是否为实际控制人',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '判定原因',
  `reason_detail` varchar(255) NOT NULL DEFAULT '' COMMENT '判定原因细化',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_company` (`company_id_controlled`),
  KEY `idx_shareholder` (`tyc_unique_entity_id`,`company_id_controlled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='实际控制人/对外控制企业';
