drop table `prism_shareholder_path`.`ratio_path_company_new`;
CREATE TABLE `prism_shareholder_path`.`ratio_path_company_new` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  -- 公司
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '公司id',
  `company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名称',
  `company_is_listed` tinyint NOT NULL DEFAULT '0' COMMENT '公司是否上市',
  `company_uscc` varchar(255) NOT NULL DEFAULT '' COMMENT '统一社会信用代码',
  `company_org_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'company_index.org_type',
  `company_entity_property` varchar(255) NOT NULL DEFAULT '' COMMENT 'tyc_entity_general_property_reference.entity_property',
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
  `is_big_shareholder` tinyint NOT NULL DEFAULT '0' COMMENT '是否大股东',
  `is_controlling_shareholder` tinyint NOT NULL DEFAULT '0' COMMENT '是否控股股东',
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

-- 上传
!sh hdfs dfs -put -f /home/hive/liang/hive-udf-1.0.jar /hive/jars/liang-hive-udf-1.0.jar
-- 加载
add jar hdfs:///hive/jars/liang-hive-udf-1.0.jar;
-- bitmap_to_string
drop function if exists doris.bitmap_to_string;
create function doris.bitmap_to_string as 'com.liang.udf.BitmapToStringUDF' USING JAR 'hdfs:///hive/jars/liang-hive-udf-1.0.jar';


set spark.driver.memory=24g;
set spark.executor.memory=24g;
INSERT OVERWRITE DIRECTORY 'obs://hadoop-obs/export2/' ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' STORED AS TEXTFILE
SELECT doris.bitmap_to_string(user_id_bitmap) FROM project.crowd_user_bitmap WHERE crowd_id = 111 AND create_timestamp = 1710702006238 AND pt = '20240317';
SELECT doris.bitmap_to_string(user_id_bitmap) FROM project.crowd_user_bitmap WHERE crowd_id = 361 AND create_timestamp = 1710702001821 AND pt = '20240317'



公司
Q 股权全景穿透图谱：最新年份及关系穿透层数
A 如果是面向 [股权全景穿透][股东持股穿透][对外投资穿透] 这3个图 问后端代码

Q 股东持股图：自然人股东数和企业股东数
A 如果是面向 [股权全景穿透][股东持股穿透][对外投资穿透] 这3个图 问后端代码

Q 对外投资图：投资企业数、投资最多的行业
A 如果是面向 [股权全景穿透][股东持股穿透][对外投资穿透] 这3个图 问后端代码

Q 实际控制人：实际控制人及其投资比例
A select shareholder_id as 股东ID,investment_ratio_total as 比例 from ratio_path_company where company_id = 22822 and is_controller = 1

Q 控制企业：实际控制企业数及累计股权关联路径数
A select count(1) from ratio_path_company where shareholder_id = '22822' and investment_ratio_total >= 0.05
  select sum(json_length(equity_holding_path)) from ratio_path_company where shareholder_id = '22822' and investment_ratio_total >= 0.05

Q 受益所有人：受益所有人名称
A select shareholder_id as 股东ID,investment_ratio_total as 比例 from ratio_path_company where company_id = 22822 and is_ultimate = 1

人
Q 对外投资图：投资企业数，最多投资行业
A 如果是面向 [股权全景穿透][股东持股穿透][对外投资穿透] 这3个图 问后端代码

Q 实际控制权：实际控制企业数
A select count(1) from ratio_path_company where shareholder_id = 'V0M9EM200ND6FPNUP' and is_controller in (1,2)
A select sum(json_length(equity_holding_path)) from ratio_path_company where shareholder_id = 'V0M9EM200ND6FPNUP' and is_controller in (1,2)

Q 受益所有权：收益所有人企业数
A select count(1) from ratio_path_company where shareholder_id = 'V0M9EM200ND6FPNUP' and is_ultimate = 1
A select sum(json_length(equity_holding_path)) from ratio_path_company where shareholder_id = 'V0M9EM200ND6FPNUP' and is_ultimate = 1

Q 股权结构全景：最新年份及关系穿透层数
A 如果是面向 [股权全景穿透][股东持股穿透][对外投资穿透] 这3个图 问后端代码

