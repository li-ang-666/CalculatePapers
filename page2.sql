
admin set frontend config("disable_balance" = "true");
admin set frontend config("disable_colocate_balance" = "true");
admin set frontend config("disable_tablet_scheduler" = "true");

admin set frontend config("disable_balance" = "false");
admin set frontend config("disable_colocate_balance" = "false");
admin set frontend config("disable_tablet_scheduler" = "false");

doris \
  --parallelism 64 \
  --sql "insert into test_db.ads_user_dispatch_log_tag_df select date_add(current_date(),-1) pt, tyc_user_id, dispatch_id,dispatch_date,mobile from ads.ads_user_dispatch_log_tag_df where pt = 20240114"
