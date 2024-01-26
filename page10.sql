,34,35,36,37,38,39,40,43,44,46,47,48,49,51,52,53,54,55,56,57,58,59,60,61,67,68




create table if not exists test.graph_export_node_invalid(
  `row` string
)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile location 'obs://hadoop-obs/flink/graph/node_invalid';






with t1 as (
 select company_id from ods.ods_company_base_bdp_company_profile_tag_details_total_df
 where profile_tag_id in (34,35,36,37,38,39,40,43,44,46,47,48,49,51,52,53,54,55,56,57,58,59,60,61,67,68) and pt = '20240125' and dw_is_del = 0 and deleted = 0
 group by company_id
),
t2 as (
 select company_id,max(company_name) from ods.ods_company_base_company_index_df
 where pt = '20240125' and dw_is_del = 0
 group by company_id
)insert overwrite table test.graph_export_node_invalid
select /*+ REPARTITION(4) */
 t1.company_id row1,
 'node' row2,
 '2' row3,
 t1.company_id row4,
 '0' row5,
 regexp_replace(t2.company_name, "[,\n\r'\"]", "") row6,
 '' row7,
 'false' row8,
 '1704038400000' row9
from t1 join t2 on t1.company_id = t2.company_id;
