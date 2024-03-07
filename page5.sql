select company_id,count(distinct shareholder_id) cnt
from ods.ods_prism_shareholder_path_ratio_path_company_df
where pt = '20240305' and is_controller in (1,2) and dw_is_del = 0
group by company_id order by cnt desc limit 10;


select shareholder_id,count(distinct company_id) cnt
from ods.ods_prism_shareholder_path_ratio_path_company_df
where pt = '20240305' and is_controller in (1,2) and dw_is_del = 0
group by shareholder_id having count(1) >= 200 order by cnt desc limit 10000;



select shareholder_id,count(distinct company_id) cnt
from ods.ods_prism_shareholder_path_ratio_path_company_df
where pt = '20240305' and is_ultimate in (1,2) and dw_is_del = 0
group by shareholder_id having count(1) >= 200 order by cnt desc limit 10000;



drop table if exists flink.open_api_record;
create external table if not exists flink.open_api_record (
 id bigint,
 name string,
 age int
)partitioned by(pt string)
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
STORED AS TEXTFILE;
MSCK REPAIR TABLE flink.open_api_record;


