with t as (
    select company_id_controlled,count(1) cnt from ods_bdp_equity_entity_controller_details_new_df 
    where pt = '20240829' and dw_is_del = 0 and is_controller_tyc_unique_entity_id = 1 group by company_id_controlled
)select * from t order by cnt desc limit 111