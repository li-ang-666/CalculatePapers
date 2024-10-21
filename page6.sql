

use hudi_ods;
with t as(
  select company_id,max(equity_ratio) max_ratio from company_equity_relation_details group by company_id
),tt as(
  select t1.company_id,t1.company_name,t1.shareholder_id,t1.shareholder_name,t1.equity_ratio
  from company_equity_relation_details t1 
  join t t2 on t1.equity_ratio = t2.max_ratio and t1.company_id = t2.company_id
  join company_001_company_list_total t3 on t3.deleted = 0 and t1.shareholder_id = t3.company_id
)select * from tt limit 111;

with outer_land_company as(
    select company_id from company_index where company_type in (2, 3)
),001_company as(
    select company_id from company_001_company_list_total where deleted = 0
),

,controller as(
    select tyc_unique_entity_id controller_id, entity_name_valid controller_name, collect_set(company_id) collection, count(company_id) cnt from entity_controller_details_new where is_controller_tyc_unique_entity_id = 1 group by tyc_unique_entity_id,entity_name_valid
)




with t as(
select tyc_unique_entity_id,entity_name_valid,count(1) cnt from entity_controller_details_new where is_controller_tyc_unique_entity_id = 1 group by tyc_unique_entity_id,entity_name_valid
)select * from t order by cnt desc limit 1111;


INSERT OVERWRITE DIRECTORY 'obs://hadoop-obs/flink/relation/result/company/'
ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
  LINES TERMINATED BY '\n'
SELECT /*+ REPARTITION(128) */ distinct * FROM test.relation_node_company;

drop table if exists test.company_bid;
create external table if not exists test.company_bid (
  id s
  content string
)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
STORED AS TEXTFILE location 'obs://hadoop-obs/flink/test/';
