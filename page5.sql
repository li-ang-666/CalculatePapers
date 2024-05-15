drop table if exists test.lt;
create external table if not exists test.lt (
id                                          string,
tyc_unique_entity_id                        string,
entity_type_id                              string,
entity_name_valid                           string,
control_graph_data_application_type         string,
total_entity_cnt_through_multi_control_path string,
min_graph_tier_through_multi_control_path   string,
max_graph_tier_through_multi_control_path   string,
create_time                                 string,
update_time                                 string
)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
STORED AS TEXTFILE location 'obs://hadoop-obs/flink/test/';


