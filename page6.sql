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
select '-1' crowd_id, '-1' create_timestamp, doris.to_bitmap(id) user_id_bitmap from hudi_ods.company_index
)insert overwrite table project.crowd_user_bitmap partition(pt = '-1') select * from t;

select pt, crowd_id, create_timestamp, doris.bitmap_count(user_id_bitmap) cnt from project.crowd_user_bitmap where pt = '-1';

-- doris
insert into crowd.crowd_user_bitmap_tasks(crowd_id,create_timestamp,pt)values
(-1,-1,-1);

select * from crowd.crowd_user_bitmap_tasks;


select crowd_id, create_timestamp, bitmap_count(user_id_bitmap) from crowd.crowd_user_bitmap where crowd_id = -1;


with t0 as(
    select * from hudi_ods.company_index limit 50000000
),t as(
    select '-1' crowd_id, '-1' create_timestamp, doris.to_bitmap(id) user_id_bitmap from t0
)insert overwrite table project.crowd_user_bitmap partition(pt = '-1') select * from t;

