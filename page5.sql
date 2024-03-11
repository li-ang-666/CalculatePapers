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
  token string,
  interface_id string,
  interface_name string,
  billing_rules string,
  request_ip string,
  request_timestamp string,
  response_timestamp string,
  cost string,
  error_code string,
  error_message string,
  charge_status string,
  return_status string,
  params string
)
partitioned by(pt string)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
STORED AS TEXTFILE;

MSCK REPAIR TABLE flink.open_api_record;
