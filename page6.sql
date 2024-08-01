
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

