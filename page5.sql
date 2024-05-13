set hive.input.format=org.apache.hadoop.hive.ql.io.HiveInputFormat;
with equity_ratio as(
  select * from ods.ods_prism1_equity_ratio_df where deleted = 0 and pt = 20240506 and dw_is_del = 0
),
company_equity_relation_details as(
  -- select * from ods.ods_graph_data_company_equity_relation_details_df where reference_pt_year = 2024 and pt >= 20240420 and dw_is_del = 0
  select * from hudi_ods.company_equity_relation_details where reference_pt_year = 2024
)
-- insert overwrite table test.abc
select distinct if(t1.id is not null,t1.company_graph_id,t2.company_id_invested) company_id
from equity_ratio t1
full outer join company_equity_relation_details t2
on t1.company_graph_id = t2.company_id_invested and t1.shareholder_graph_id = t2.company_id_investor
where t2.id is null or t1.id is null




drop table if exists `bdp_equity`.`shareholder_investment_ratio_total`;
CREATE TABLE if not exists `bdp_equity`.`shareholder_investment_ratio_total` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  -- 公司
  `company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '公司id',
  `company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '公司名称',
  -- 股东
  `shareholder_entity_type` tinyint NOT NULL DEFAULT '0' COMMENT '1-company,2-human',
  `shareholder_id` varchar(50) NOT NULL DEFAULT '' COMMENT '股东id,人存human_pid,公司存储company_gid',
  `shareholder_name` varchar(255) NOT NULL DEFAULT '' COMMENT '股东名称',
  `shareholder_name_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '股东内链中的human_name_id',
  `shareholder_master_company_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '股东内链中的company_id',
  -- 投资
  `investment_ratio_total` decimal(26,6) NOT NULL DEFAULT '0' COMMENT '总持股比例',
  `equity_holding_path` longtext COMMENT '持股路径json',
  -- 其他
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create_time',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  PRIMARY KEY (`id`),
  KEY `idx_company` (`company_id`),
  KEY `idx_shareholder` (`shareholder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='投资路径结果表';

Path(elements=[Node(id=2318455639, name=北京金堤科技有限公司), Edge(ratio=0.0123080, isValid=true), Node(id=2351781797, name=国同汇智创业投资（北京）有限公司), Edge(ratio=0.5049020, isValid=true), Node(id=3006770821, name=北京清鑫睿智创业投资有限公司), Edge(ratio=0.4951460, isValid=true), Node(id=5882281, name=北京海鑫科金高科技股份有限公司), Edge(ratio=0.0985000, isValid=true), Node(id=4847431, name=盈富泰克创业投资有限公司), Edge(ratio=0.0938460, isValid=true), Node(id=10236902, name=云南南天电子信息产业股份有限公司), Edge(ratio=0.3458000, isValid=true), Node(id=205612470, name=云南省工业投资控股集团有限责任公司), Edge(ratio=0.3600000, isValid=true), Node(id=2343891887, name=云南省土地储备运营有限公司), Edge(ratio=0.1000000, isValid=true), Node(id=29258269, name=云南城投置业股份有限公司), Edge(ratio=0.0203000, isValid=true), Node(id=3272590205, name=云南融智投资有限公司), Edge(ratio=0.0995400, isValid=true), Node(id=2344256065, name=芜湖长厚投资中心（有限合伙）), Edge(ratio=0.9999970, isValid=true), Node(id=142635126, name=建信资本管理有限责任公司), Edge(ratio=0.5100000, isValid=true), Node(id=26161694, name=建信基金管理有限责任公司), Edge(ratio=0.1000000, isValid=true), Node(id=15766474, name=中国华电集团资本控股有限公司), Edge(ratio=0.0267280, isValid=true), Node(id=2943360177, name=中央企业乡村产业投资基金股份有限公司), Edge(ratio=0.0245840, isValid=true), Node(id=1877061, name=航天投资控股有限公司), Edge(ratio=0.1797710, isValid=true), Node(id=3088175134, name=国创投资引导基金（有限合伙）), Edge(ratio=0.0035090, isValid=true), Node(id=2968806235, name=国新国同（浙江）投资基金合伙企业（有限合伙）), Edge(ratio=0.1426940, isValid=true), Node(id=2965707688, name=浙江富浙投资有限公司), Edge(ratio=0.1000000, isValid=true), Node(id=59618538, name=浙江浙能电力股份有限公司), Edge(ratio=0.0095000, isValid=true), Node(id=70626615, name=河北港口集团有限公司), Edge(ratio=0.0324320, isValid=true), Node(id=13649968, name=河北建投交通投资有限责任公司), Edge(ratio=0.0122880, isValid=true), Node(id=619481099, name=邢台建投交通投资有限公司), Edge(ratio=0.9967000, isValid=true), Node(id=18922995, name=百瑞信托有限责任公司), Edge(ratio=0.5024000, isValid=true), Node(id=2358827284, name=国家电投集团资本控股有限公司), Edge(ratio=1.0000000, isValid=true), Node(id=3149546802, name=国家电投集团产融控股股份有限公司), Edge(ratio=0.0712000, isValid=true), Node(id=3312205325, name=云南能投资本投资有限公司), Edge(ratio=1.0000000, isValid=true), Node(id=28845447, name=云南省能源投资集团有限公司), Edge(ratio=0.0403220, isValid=true), Node(id=5849882, name=云南冶金集团股份有限公司), Edge(ratio=0.0001000, isValid=true), Node(id=3048822526, name=云南省建设物资有限公司), Edge(ratio=1.0000000, isValid=true), Node(id=28036190, name=云南铜业（集团）有限公司)], nodeIds=[2318455639, 3312205325, 1877061, 5882281, 2943360177, 26161694, 29258269, 3088175134, 59618538, 619481099, 3048822526, 13649968, 142635126, 10236902, 2968806235, 4847431, 3149546802, 3272590205, 2965707688, 2358827284, 2344256065, 15766474, 18922995, 2351781797, 70626615, 28036190, 28845447, 2343891887, 5849882, 3006770821, 205612470], validRatio=1.17466032280001481215739660710193267991878822183349011054597991324564436252597950208802816000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E-31)

,1017,1065,1101,1172,1258,1301,1307,1347,1418,1617
