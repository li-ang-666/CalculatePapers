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

CREATE TABLE `test` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL,
  `dt` date DEFAULT NULL,
  `dtm` datetime DEFAULT NULL,
  `tmsp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

# For Spark versions: 3.0 - 3.1
export SPARK_VERSION=3.1 # or 3.0
spark-shell --packages org.apache.hudi:hudi-spark$SPARK_VERSION-bundle_2.12:0.15.0 \
--conf 'spark.serializer=org.apache.spark.serializer.KryoSerializer' \
--conf 'spark.sql.extensions=org.apache.spark.sql.hudi.HoodieSparkSessionExtension' \
--conf 'spark.kryo.registrator=org.apache.spark.HoodieSparkKryoRegistrar'

hudi_compaction_company_bond_plates
hudi_compaction_company_clean_info
hudi_compaction_company_equity_relation_details
hudi_compaction_company_human_relation
hudi_compaction_company_index
hudi_compaction_company_legal_person
hudi_compaction_entity_controller_details_new
hudi_compaction_personnel
hudi_compaction_senior_executive
hudi_compaction_senior_executive_hk


