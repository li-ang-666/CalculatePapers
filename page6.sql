
drop table bid_ai_v1;
create table bid_ai_v1(
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(255) NOT NULL DEFAULT '' COMMENT 'uuid',
  `title` varchar(500) NOT NULL DEFAULT '' COMMENT '标题',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '市',
  `v1` varchar(255) NOT NULL DEFAULT '' COMMENT '一级信息类型',
  `v2` varchar(255) NOT NULL DEFAULT '' COMMENT '二级信息类型',
  `bid_info` text COMMENT '算法解析原始json',
  `purchaser` text COMMENT '招标单位、采购人',
  `winner` text COMMENT '中标单位、供应商',
  `winner_amount` text COMMENT '中标金额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='招投标算法接口V1';

drop table bid_ai_v2;
create table bid_ai_v2(
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(255) NOT NULL DEFAULT '' COMMENT 'uuid',
  `title` varchar(500) NOT NULL DEFAULT '' COMMENT '标题',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '类型',
  `post_result` text COMMENT 'http接口返回结果',
  `bidding_unit` text COMMENT '投标单位',
  `tendering_proxy_agent` text COMMENT '代理单位',
  `bid_submission_deadline` text COMMENT '招标截止时间',
  `tender_document_acquisition_deadline` text COMMENT '标书下载截止时间',
  `project_number` text COMMENT '项目编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='招投标算法接口V2';

drop table company_bid_parsed_info_patch;
create table company_bid_parsed_info_patch(
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(255) NOT NULL DEFAULT '' COMMENT 'uuid',
  `title` varchar(500) NOT NULL DEFAULT '' COMMENT '标题',
  `link` varchar(500) NOT NULL DEFAULT '' COMMENT '链接',
  `publish_time` datetime NULL COMMENT '发布时间',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '类型',
  `content_obs_index` varchar(255) NOT NULL DEFAULT '' COMMENT 'obs地址',
  `deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否 删除or屏蔽',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '市',
  `v1` varchar(255) NOT NULL DEFAULT '' COMMENT '一级信息类型',
  `v2` varchar(255) NOT NULL DEFAULT '' COMMENT '二级信息类型',
  `bid_info` text COMMENT '算法解析原始json',
  `purchaser` text COMMENT '招标单位、采购人',
  `winner` text COMMENT '中标单位、供应商',
  `winner_amount` text COMMENT '中标金额',
  `post_result` text COMMENT 'http接口返回结果',
  `bidding_unit` text COMMENT '投标单位',
  `tendering_proxy_agent` text COMMENT '代理单位',
  `bid_submission_deadline` text COMMENT '招标截止时间',
  `tender_document_acquisition_deadline` text COMMENT '标书下载截止时间',
  `project_number` text COMMENT '项目编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='招投标线上表';

select * from bid_ai_v1\G
select * from bid_ai_v2\G
select * from company_bid_parsed_info_patch\G

drop table shareholder_investment_ratio_total_new;
CREATE TABLE `shareholder_investment_ratio_total_new_tmp` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '公司id',
  `company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名称',
  `shareholder_entity_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-company,2-human',
  `shareholder_id` varchar(50) NOT NULL DEFAULT '' COMMENT '股东id,人存human_pid,公司存储company_gid',
  `shareholder_name` varchar(255) NOT NULL DEFAULT '' COMMENT '股东名称',
  `shareholder_name_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '股东内链中的human_name_id',
  `shareholder_master_company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '股东内链中的company_id',
  `shareholder_first_appear_level` int(11) NOT NULL DEFAULT '0' COMMENT '股东第一次出现的层级',
  `shareholder_last_appear_level` int(11) NOT NULL DEFAULT '0' COMMENT '股东最后一次出现的层级',
  `investment_ratio_total` decimal(26,6) NOT NULL DEFAULT '0.000000' COMMENT '总持股比例',
  `investment_ratio_direct` decimal(26,6) NOT NULL DEFAULT '0.000000' COMMENT '直接持股比例',
  `investment_ratio_indirect` decimal(26,6) NOT NULL DEFAULT '0.000000' COMMENT '间接持股比例',
  `equity_holding_path` longtext COMMENT '持股路径json',
  `equity_holding_path_count` int(11) NOT NULL DEFAULT '0' COMMENT '持股路径json count',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  PRIMARY KEY (`id`),
  KEY `idx_company` (`company_id`),
  KEY `idx_shareholder` (`shareholder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='最终受益股份表';



