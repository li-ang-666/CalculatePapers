select count(1) from ads.ads_user_tag;
select count(1) from dwd.dwd_user_register_details;
select count(1) from dim.dim_user_comparison;
select count(1) from dwd.dwd_coupon_info;

create table bak.dwd_user_register_details as
select cast(tyc_user_id as string) tyc_user_id,cast(mobile as string) mobile,cast(register_time as string) register_time,cast(vip_from_time as string) vip_from_time,cast(vip_to_time as string) vip_to_time,cast(user_type as string) user_type,cast(create_time as string) create_time,cast(update_time as string) update_time
from dwd.dwd_user_register_details;

create table bak.dwd_coupon_info as
select cast(promotion_code as string) promotion_codeselect cast(unique_user_id as string) unique_user_idselect cast(promotion_id as string) promotion_idselect cast(use_status as string) use_statusselect cast(receive_time as string) receive_timeselect cast(effective_time as string) effective_timeselect cast(expiration_time as string) expiration_timeselect cast(create_time as string) create_timeselect cast(update_time as string) update_time
from dwd.dwd_coupon_info;

create table bak.dwd_app_active as
select cast(app_id2 as string) app_id2,cast(pt as string) pt,cast(android_id as string) android_id,cast(imei as string) imei,cast(oaid as string) oaid,cast(idfa as string) idfa,cast(idfv as string) idfv,cast(type as string) type,cast(umeng_channel as string) umeng_channel,cast(create_time as string) create_time,cast(app_version as string) app_version,cast(update_time as string) update_time
from dwd.dwd_app_active;

create table bak.dim_user_comparison as
select cast(uid as string) uid,cast(tyc_user_id as string) tyc_user_id,cast(tyc_user_id_new as string) tyc_user_id_new,cast(mobile as string) mobile,cast(create_time as string) create_time,cast(update_time as string) update_time
from dim.dim_user_comparison;

create table bak.dwd_order_info as
select cast(order_id as string) order_id,cast(order_code as string) order_code,cast(tyc_user_id as string) tyc_user_id,cast(mobile as string) mobile,cast(sku_id as string) sku_id,cast(vip_from_time as string) vip_from_time,cast(vip_to_time as string) vip_to_time,cast(order_status as string) order_status,cast(amount as string) amount,cast(actual_amount as string) actual_amount,cast(invite_code as string) invite_code,cast(pay_date as string) pay_date,cast(create_date as string) create_date,cast(platform_name as string) platform_name,cast(pay_way as string) pay_way,cast(pay_point_id as string) pay_point_id,cast(create_time as string) create_time,cast(update_time as string) update_time
from dwd.dwd_order_info;

admin set frontend config("max_running_txn_num_per_db"="10240");
admin set frontend config("min_replication_num_per_tablet"="3");

curl -X POST http://10.99.201.177:8040/api/update_config?max_tablet_version_num=10240\&persist=true
curl -X POST http://10.99.197.74:8040/api/update_config?max_tablet_version_num=10240\&persist=true
curl -X POST http://10.99.194.79:8040/api/update_config?max_tablet_version_num=10240\&persist=true
curl -X POST http://10.99.200.146:8040/api/update_config?max_tablet_version_num=10240\&persist=true
curl -X POST http://10.99.204.175:8040/api/update_config?max_tablet_version_num=10240\&persist=true

curl -X POST http://10.99.201.177:8040/api/update_config?enable_stream_load_record=true\&persist=true
curl -X POST http://10.99.197.74:8040/api/update_config?enable_stream_load_record=true\&persist=true
curl -X POST http://10.99.194.79:8040/api/update_config?enable_stream_load_record=true\&persist=true
curl -X POST http://10.99.200.146:8040/api/update_config?enable_stream_load_record=true\&persist=true
curl -X POST http://10.99.204.175:8040/api/update_config?enable_stream_load_record=true\&persist=true

curl -X POST http://10.99.201.177:8040/api/update_config?streaming_load_json_max_mb=2048\&persist=true
curl -X POST http://10.99.197.74:8040/api/update_config?streaming_load_json_max_mb=2048\&persist=true
curl -X POST http://10.99.194.79:8040/api/update_config?streaming_load_json_max_mb=2048\&persist=true
curl -X POST http://10.99.200.146:8040/api/update_config?streaming_load_json_max_mb=2048\&persist=true
curl -X POST http://10.99.204.175:8040/api/update_config?streaming_load_json_max_mb=2048\&persist=true
