,34,35,36,37,38,39,40,43,44,46,47,48,49,51,52,53,54,55,56,57,58,59,60,61,67,68


drop table test.graph_export_node_invalid_new;
create table if not exists test.graph_export_node_invalid_new(
  `row1` string,
  `row2` string,
  `row3` string,
  `row4` string,
  `row5` string,
  `row6` string,
  `row7` string,
  `row8` string,
  `row9` string
)row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile location 'obs://hadoop-obs/flink/graph/node_invalid_new';


drop table test.graph_export_node_invalid_diff;
create table if not exists test.graph_export_node_invalid_diff(
  `row1` string,
  `row2` string,
  `row3` string,
  `row4` string,
  `row5` string,
  `row6` string,
  `row7` string,
  `row8` string,
  `row9` string
)row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile location 'obs://hadoop-obs/flink/graph/node_invalid_diff';



with t1 as (
 select company_id from ods.ods_company_base_bdp_company_profile_tag_details_total_df
 where profile_tag_id in (34,35,36,37,38,39,40,43,44,46,47,48,49,51,52,53,54,55,56,57,58,59,60,61,67,68) and pt = '20240125' and dw_is_del = 0 and deleted = 0
 group by company_id
),
t2 as (
 select company_id,max(company_name) company_name from ods.ods_company_base_company_index_df
 where pt = '20240125' and dw_is_del = 0
 group by company_id
)insert overwrite table test.graph_export_node_invalid_new
select /*+ REPARTITION(4) */
 t1.company_id row1,
 'node' row2,
 '2' row3,
 t1.company_id row4,
 '0' row5,
 regexp_replace(t2.company_name, '[,\n\r\'\"]', '') row6,
 '' row7,
 'false' row8,
 '1704038400000' row9
from t1 join t2 on t1.company_id = t2.company_id;


with t as(
    select t1.* from test.graph_export_node_invalid_new t1 left anti join test.graph_export_node_invalid t2 on t1.row1 = t2.row1
)
insert overwrite table test.graph_export_node_invalid_diff
select /*+ REPARTITION(1) */ * from t;
