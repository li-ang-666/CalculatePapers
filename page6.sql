{
  "bidding_unit":[{"company_id":22822,"company_name":"北京百度网讯科技有限公司","company_name_raw":"百度公司"},{"company_id":2318455639,"company_name":"北京金堤科技有限公司"}],
  "tendering_proxy_agent":[{"company_id":22822,"company_name":"北京百度网讯科技有限公司"},{"company_id":2318455639,"company_name":"北京金堤科技有限公司","company_name_raw":"金堤天眼查"}],
  "bid_submission_deadline":["2024-01-01","2024-01-01"],
  "tender_document_acquisition_deadline":["2023-12-31","2024-01-01"],
  "project_number":["IB98IJB89UJKN","IB98IJB89UJKN"]
}



drop table bid_ai_v1;
create table bid_ai_v1(
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(255) NOT NULL DEFAULT '' COMMENT '招投标uuid',
  `title` varchar(500) NOT NULL DEFAULT '' COMMENT '标题',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '市',
  `v1` varchar(255) NOT NULL DEFAULT '' COMMENT '一级信息类型',
  `v2` varchar(255) NOT NULL DEFAULT '' COMMENT '二级信息类型',
  `bid_type` varchar(255) NOT NULL DEFAULT '' COMMENT '招标方式',
  `bid_info` text COMMENT '算法解析原始json',
  `contract_no` text COMMENT '合同编号',
  `candidates` text COMMENT '候选机构',
  `winners` text COMMENT '中标机构',
  `winner_raw_amounts` text COMMENT '中标金额',
  `winner_amounts` text COMMENT '中标金额',
  `budget_raw_amounts` text COMMENT '预算金额',
  `budget_amounts` text COMMENT '预算金额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='招投标算法接口V1';


create table bid_ai_v2(
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(255) NOT NULL DEFAULT '' COMMENT '招投标uuid',
  `title` varchar(500) NOT NULL DEFAULT '' COMMENT '招投标title',
  `content` text COMMENT '招投标content',
  `bidding_unit` text COMMENT '招标单位',
  `tendering_proxy_agent` text COMMENT '代理单位',
  `bid_submission_deadline` text COMMENT '招标截止时间',
  `tender_document_acquisition_deadline` text COMMENT '标书下载截止时间',
  `project_number` text COMMENT '项目编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='招投标算法接口V2';


