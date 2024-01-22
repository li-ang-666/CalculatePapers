select count(1) from ads.ads_user_dispatch_log_tag_df;
select count(1) from ads.ads_user_tag;
select count(1) from dwd.dwd_user_register_details;
select count(1) from dim.dim_user_comparison;
select count(1) from dwd.dwd_coupon_info;
select count(1) from ads.ads_user_distribution_user_tag_df;
select count(1) from ads.ads_user_tag_commercial_df;
select count(1) from crowd.crowd_user_bitmap;
select count(1) from crowd.dispatch_user_bitmap;
select count(1) from crowd.dispatch_sub_user_bitmap;

-- hive
set spark.executor.memory=8g;
with t as(
select '-1' crowd_id, '-1' create_timestamp, doris.to_bitmap(id) user_id_bitmap from (select id from ods.ods_company_base_company_index_df where pt = '20240121' limit 12345678)tb
)insert overwrite table project.crowd_user_bitmap partition(pt = '-1') select * from t;

select pt, crowd_id, create_timestamp, doris.bitmap_count(user_id_bitmap) cnt from project.crowd_user_bitmap where pt = '-1';

-- doris
insert into crowd.crowd_user_bitmap_tasks(crowd_id,create_timestamp,pt)values(-1,-1,-1);

select * from crowd.crowd_user_bitmap_tasks;


select bitmap_count(user_id_bitmap) from crowd.crowd_user_bitmap where crowd_id = -1;


