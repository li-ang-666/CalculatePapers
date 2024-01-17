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
