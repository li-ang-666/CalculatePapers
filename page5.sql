kafka-test.middleware.huawei
kafka-pre.middleware.huawei
kafka.middleware.huawei

kafka-console-consumer.sh --bootstrap-server kafka-test.middleware.huawei:9092 --topic open_api_record2bigdata --from-beginning
kafka-console-consumer.sh --bootstrap-server kafka-pre.middleware.huawei:9092 --topic open_api_record2bigdata --from-beginning
kafka-console-consumer.sh --bootstrap-server kafka.middleware.huawei:9092 --topic open_api_record2bigdata --from-beginning

drop table if exists flink.open_api_record;
create external table if not exists flink.open_api_record (
  org_name string,
  order_code string,
  -- token string,
  -- interface_id string,
  interface_name string,
  billing_rules string,
  request_ip string,
  request_timestamp string,
  -- request_date string,
  response_timestamp string,
  response_date string,
  cost string,
  error_code string,
  error_message string,
  charge_status string,
  return_status string,
  params string
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


INSERT OVERWRITE DIRECTORY 'obs://hadoop-obs/export/'ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' STORED AS TEXTFILE
SELECT *
FROM flink.open_api_record
WHERE token='aaf1704a-78ee-4e1d-bb04-039a6c8c93ab' AND interface_id=1152 AND request_date='2024-03-12'
LIMIT 10000;

