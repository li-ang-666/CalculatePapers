set hive.input.format=org.apache.hadoop.hive.ql.io.HiveInputFormat;
with equity_ratio as(
  select * from ods.ods_prism1_equity_ratio_df where deleted = 0 and pt = 20240428 and dw_is_del = 0
),
company_equity_relation_details as(
  -- select * from ods.ods_graph_data_company_equity_relation_details_df where reference_pt_year = 2024 and pt >= 20240420 and dw_is_del = 0
  select * from hudi_ods.company_equity_relation_details where reference_pt_year = 2024
),
diff as (
  select distinct if(t1.id is not null,t1.company_graph_id,t2.company_id_invested) company_id
  from equity_ratio t1
  full outer join company_equity_relation_details t2
  on t1.company_graph_id = t2.company_id_invested and t1.shareholder_graph_id = t2.company_id_investor
  where t2.id is null or t1.id is null
),
latest as (
  select distinct company_id_invested company_id from hudi_ods.company_equity_relation_details where op_ts >= '2024-04-26 15:00:00'
),
union_all as(
  select distinct company_id from diff
  union all
  select distinct company_id from latest
)
insert overwrite table test.abc
select distinct company_id from union_all;
