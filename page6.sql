{
  "bidding_unit":[{"company_id":22822,"company_name":"北京百度网讯科技有限公司","company_name_raw":"百度公司"},{"company_id":2318455639,"company_name":"北京金堤科技有限公司"}],
  "tendering_proxy_agent":[{"company_id":22822,"company_name":"北京百度网讯科技有限公司"},{"company_id":2318455639,"company_name":"北京金堤科技有限公司","company_name_raw":"金堤天眼查"}],
  "bid_submission_deadline":["2024-01-01","2024-01-01"],
  "tender_document_acquisition_deadline":["2023-12-31","2024-01-01"],
  "project_number":["IB98IJB89UJKN","IB98IJB89UJKN"]
}


create table bid_ai_interface_v2(
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(255) NOT NULL DEFAULT '' COMMENT '招投标uuid',
  `bidding_unit` text COMMENT '招标单位',
  `tendering_proxy_agent` text COMMENT '招标代理',
  `bid_submission_deadline` text COMMENT '招标截止时间',
  `tender_document_acquisition_deadline` text COMMENT '标书下载截止时间',
  `project_number` text COMMENT '项目编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='招投标算法接口V2';


