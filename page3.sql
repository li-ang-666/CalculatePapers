sparkSql="
select
  '2024-01-16' pt,
  tyc_user_id,
  dispatch_id,
  dispatch_date,
  mobile
from
  ads.ads_user_dispatch_log_tag_df
where
  pt = 20240116
"
sinkDatabase="ads"
sinkTable="ads_user_dispatch_log_tag_df"
doris \
  -sparkSql "${sparkSql}" \
  -sinkDatabase "${sinkDatabase}" \
  -sinkTable "${sinkTable}"
----------------------------------------------
sparkSql="
select
  '2024-01-16' pt,
  tyc_user_id,
  mobile,
  regist_date,
  regist_days,
  regist_months,
  last_active_date,
  active_days_by_month,
  is_active_latest_7_day,
  active_days_latest_7_day,
  is_active_latest_28_day,
  active_days_latest_28_day,
  is_active_latest_90_day,
  active_days_latest_90_day,
  is_active_latest_365_day,
  active_days_latest_365_day,
  is_biz_latest_7_day,
  biz_days_latest_7_day,
  is_biz_latest_28_day,
  biz_days_latest_28_day,
  is_biz_latest_90_day,
  biz_days_latest_90_day,
  is_svip_paypoint_latest_7_day,
  svip_paypoint_cnt_latest_7_day,
  is_svip_paypoint_latest_28_day,
  svip_paypoint_cnt_latest_28_day,
  is_svip_paypoint_latest_90_day,
  svip_paypoint_cnt_latest_90_day,
  is_vip_paypoint_latest_7_day,
  vip_paypoint_cnt_latest_7_day,
  is_vip_paypoint_latest_28_day,
  vip_paypoint_cnt_latest_28_day,
  is_vip_paypoint_latest_90_day,
  vip_paypoint_cnt_latest_90_day,
  last_vip_order_unpay_date,
  last_svip_order_unpay_date,
  vip_order_unpay_cnt_latest_7_day,
  svip_order_unpay_cnt_latest_7_day,
  vip_order_unpay_cnt_latest_28_day,
  svip_order_unpay_cnt_latest_28_day,
  vip_order_unpay_cnt_latest_90_day,
  svip_order_unpay_cnt_latest_90_day,
  last_vip_order_pay_date,
  last_svip_order_pay_date,
  last_vip_order_type,
  last_svip_order_type,
  last_combination_order_type,
  vip_to_time,
  svip_to_time,
  user_state,
  is_ga_user,
  is_vvip_media_user,
  is_blacklist_user,
  is_stuff_user,
  is_boss_user,
  is_person_page_with_property_latest_7_day,
  is_person_page_with_property_latest_14_day,
  is_person_page_with_property_latest_28_day
from
  ads.ads_user_distribution_user_tag_df
where
  pt = 20240116
"
sinkDatabase="ads"
sinkTable="ads_user_distribution_user_tag_df"
doris \
  -sparkSql "${sparkSql}" \
  -sinkDatabase "${sinkDatabase}" \
  -sinkTable "${sinkTable}"
