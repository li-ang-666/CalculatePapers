hudi_ods.company_bond_plates            
hudi_ods.company_clean_info             
hudi_ods.company_equity_relation_details
hudi_ods.company_human_relation         
hudi_ods.company_index                  
hudi_ods.company_legal_person           
hudi_ods.personnel                      
hudi_ods.senior_executive               
hudi_ods.senior_executive_hk            


select
  shareholder_id,
  shareholder_name,
  shareholder_name_id,
  shareholder_master_company_id,
  concat('大股东') as tag
from
  shareholder_identity_type_details_new
where
  shareholder_id <> company_id
  and is_big_shareholder = 1
  and company_id = #{company_id}
union
all
select
  shareholder_id,
  shareholder_name,
  shareholder_name_id,
  shareholder_master_company_id,
  concat('控股股东') as tag
from
  shareholder_identity_type_details_new
where
  shareholder_id <> company_id
  and is_controlling_shareholder = 1
  and company_id = #{company_id}


equity_holding_path -> [[{"is_red":"0","total_percent":"0.1515%","path_usage":"1","type":"summary"},{"type":"company","cid":"2334594679","name":"江苏中润建设集团东方建筑有限公司"},{"type_count":"1","edges":[{"type":"INVEST","percent":"1.5156%","source":"80"}]},{"type":"company","cid":"2324050618","name":"江苏中润建设集团有限公司"},{"type_count":"1","edges":[{"type":"INVEST","percent":"10.0000%","source":"80"}]},{"type":"company","cid":"2334594681","name":"江苏中润建设集团东安建筑有限公司"}]]
江苏中润建设集团东方建筑有限公司 -> 江苏中润建设集团东安建筑有限公司


equity_holding_path -> [[{"is_red":"0","total_percent":"0.1515%","path_usage":"1","type":"summary"},{"type":"company","cid":"2334594681","name":"江苏中润建设集团东安建筑有限公司"},{"type_count":"1","edges":[{"type":"INVEST","percent":"1.5156%","source":"80"}]},{"type":"company","cid":"2324050618","name":"江苏中润建设集团有限公司"},{"type_count":"1","edges":[{"type":"INVEST","percent":"10.0000%","source":"80"}]},{"type":"company","cid":"2334594679","name":"江苏中润建设集团东方建筑有限公司"}]]
江苏中润建设集团东安建筑有限公司 -> 江苏中润建设集团东方建筑有限公司


with equity_ratio as(
  select * from ods.ods_prism1_equity_ratio_df where deleted = 0 and pt >= 20240420 and dw_is_del = 0
),
company_equity_relation_details as(
  select * from ods.ods_graph_data_company_equity_relation_details_df where reference_pt_year = 2024 and pt >= 20240420 and dw_is_del = 0
),
diff as (
  select distinct if(t1.id is not null,t1.company_graph_id,t2.company_id_invested) company_id
  from equity_ratio t1
  full outer join company_equity_relation_details t2
  on t1.company_graph_id = t2.company_id_invested and t1.shareholder_graph_id = t2.company_id_investor
  where t2.id is null or t1.id is null
)
select distinct company_id from diff;


select distinct company_graph_id from ods.ods_prism1_equity_ratio_df where deleted = 0 and pt = 20240427 and dw_is_del = 0
and percent < 0 limit 111;



select * from ods.ods_graph_data_company_equity_relation_details_df where reference_pt_year = 2024 and pt = 20240427 and dw_is_del = 0
and company_id_invested = 6913921755




bigger_than_1 as (
  select distinct company_id from ods.ods_prism_shareholder_path_ratio_path_company_new_all_df where investment_ratio_total > 1 and pt = 20240427 and dw_is_del = 0
)
select distinct company_id from
(
select company_id from diff
union all
select company_id from bigger_than_1 where 1 = 2
) t
order by company_id;




select distinct company_id from ods.ods_prism_shareholder_path_ratio_path_company_new_all_df where investment_ratio_total > 1 and pt = 20240425 and dw_is_del = 0



select distinct 




(select 2318455639)t1 left join (select 1 from bdp_company_profile_tag_details_total where company_id = 2318455639 and profile_tag_id in ())
