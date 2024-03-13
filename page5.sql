kafka-test.middleware.huawei
kafka-pre.middleware.huawei
kafka.middleware.huawei

kafka-console-consumer.sh --bootstrap-server kafka-test.middleware.huawei:9092 --topic open_api_record2bigdata --from-beginning
kafka-console-consumer.sh --bootstrap-server kafka-pre.middleware.huawei:9092 --topic open_api_record2bigdata --from-beginning
kafka-console-consumer.sh --bootstrap-server kafka.middleware.huawei:9092 --topic open_api_record2bigdata --from-beginning

drop table if exists flink.open_api_record;
create external table if not exists flink.open_api_record (
  
  
  
  
  org_name,order_code,token,interface_id,interface_name,billing_rules,request_ip,request_timestamp,request_date,response_timestamp,response_date,cost,error_code,error_message,charge_status,return_status,params
)
partitioned by(token string, interface_id string, request_date string)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
STORED AS TEXTFILE;

MSCK REPAIR TABLE flink.open_api_record;

obs://hadoop-obs/hive/warehouse/flink.db/open_api_record/token=aaf1704a-78ee-4e1d-bb04-039a6c8c93ab/interface_id=1152/request_date=2024-03-12/

set spark.yarn.priority=999;
INSERT OVERWRITE DIRECTORY 'obs://hadoop-obs/export/'
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' STORED AS TEXTFILE
SELECT org_name, org_name, org_name
FROM flink.open_api_record
WHERE token='aaf1704a-78ee-4e1d-bb04-039a6c8c93ab' AND interface_id=1152 AND request_date='2024-03-12'
LIMIT 100;



flink run -t yarn-per-job -d \
-D yarn.application.queue=online \
-D parallelism.default=64 \
-D jobmanager.memory.process.size=2g \
-D taskmanager.memory.process.size=4g \
-D taskmanager.numberOfTaskSlots=8 \
-D yarn.application.name=company_bid_parsed_info \
-c com.tyc.darwin.transform.JobStart ./transform-1.0-SNAPSHOT.jar \
--conf one_data/operating_info/one_data_new_operating_info_company_bid_parsed_info.properties \
--sourceKafkaOffsetResetDate 2024-03-12T13:20:00


with t as(select pt,count(1) cnt from origindb_offline.origindb_operating_info_company_bid_parsed_info_hi where pt >= '20230901' group by pt having count(1) > 300000) select * from t order by cnt desc;
with t as(select pt,count(1) cnt from origindb_offline.origindb_operating_info_company_bid_parsed_info_hi where pt >= '20230901' group by pt having count(1) > 400000) select * from t order by cnt desc;
with t as(select pt,count(1) cnt from origindb_offline.origindb_operating_info_company_bid_parsed_info_hi where pt >= '20230901' group by pt having count(1) > 500000) select * from t order by cnt desc;
with t as(select pt,count(1) cnt from origindb_offline.origindb_operating_info_company_bid_parsed_info_hi where pt >= '20230901' group by pt having count(1) > 600000) select * from t order by cnt desc;
with t as(select pt,count(1) cnt from origindb_offline.origindb_operating_info_company_bid_parsed_info_hi where pt >= '20230901' group by pt having count(1) > 700000) select * from t order by cnt desc;
with t as(select pt,count(1) cnt from origindb_offline.origindb_operating_info_company_bid_parsed_info_hi where pt >= '20230901' group by pt having count(1) > 1000000) select * from t order by cnt desc;
with t as(select pt,count(1) cnt from origindb_offline.origindb_operating_info_company_bid_parsed_info_hi where pt >= '20230901' group by pt having count(1) > 2000000) select * from t order by cnt desc;



with t as(
select pt,count(1) cnt from origindb_offline.origindb_operating_info_company_bid_parsed_info_hi
where pt >= '20240212'
group by pt
)
select avg(cnt) avg from t;


set spark.yarn.queue=offline;
set spark.yarn.priority=999;
set spark.executor.memory=5g;
set spark.executor.memoryOverhead=512m;
set spark.driver.memory=2g;
set spark.driver.memoryOverhead=512m;
set mapred.max.split.size=9223372036854775807;
set mapred.min.split.size.per.node=9223372036854775807;
set mapred.min.split.size.per.rack=9223372036854775807;
INSERT OVERWRITE DIRECTORY 'obs://hadoop-obs/export2/'ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' STORED AS TEXTFILE
SELECT *
FROM flink.open_api_record
LIMIT 10000000;
