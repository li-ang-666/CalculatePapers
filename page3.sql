sparkSql="
select
  '2024-01-19' pt,
  tyc_user_id,
  dispatch_id,
  dispatch_date,
  mobile
from
  ads.ads_user_dispatch_log_tag_df
where
  pt = 20240119
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
  '2024-01-19' pt,
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
  pt = 20240119
"
sinkDatabase="ads"
sinkTable="ads_user_distribution_user_tag_df"
doris \
  -sparkSql "${sparkSql}" \
  -sinkDatabase "${sinkDatabase}" \
  -sinkTable "${sinkTable}"

-------------------------------------------------

sparkSql="
select
  '2024-01-19' pt,
  tyc_user_id,
  mobile,
  user_state,
  paypoint_show_30day,
  is_unpay_180day,
  is_discount_last,
  vip_order_sku_last,
  vip_overdue_day,
  vip_expiration_day,
  active_days_30day,
  active_days_90day,
  active_days_365day,
  svip_paypoint_show_pv_30day,
  svip_paypoint_show_pv_7day,
  vip_paypoint_show_pv_7day,
  svip_unpay_order_cnt_30day,
  is_boss_user,
  is_stuff_user,
  is_test_user,
  is_vvip_media_user,
  is_ga_user,
  svip_expiration_day,
  red_expiration_day,
  svip_overdue_day,
  red_overdue_day,
  regist_days,
  paypoint_show_60day,
  is_unpay_1day,
  is_unpay_15day,
  is_unpay_90day,
  svip_unpay_order_cnt_180day,
  active_days_by_month,
  last_vip_order_goods_type,
  svip_unpay_order_cnt_7day,
  vip_paypoint_show_pv_14day,
  vip_paypoint_show_pv_30day,
  tyc_user_id_last_number
from
  ads.ads_user_tag_commercial_df
where
  pt = 20240119
"
sinkDatabase="ads"
sinkTable="ads_user_tag_commercial_df"
doris \
  -sparkSql "${sparkSql}" \
  -sinkDatabase "${sinkDatabase}" \
  -sinkTable "${sinkTable}"
