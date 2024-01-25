
admin set frontend config("max_running_txn_num_per_db"="10240");
admin set frontend config("min_replication_num_per_tablet"="3");
admin set frontend config("fetch_stream_load_record_interval_second"="30");
admin set frontend config("max_stream_load_record_size"="14400");

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

curl -X POST http://10.99.201.177:8040/api/update_config?streaming_load_json_max_mb=10240\&persist=true
curl -X POST http://10.99.197.74:8040/api/update_config?streaming_load_json_max_mb=10240\&persist=true
curl -X POST http://10.99.194.79:8040/api/update_config?streaming_load_json_max_mb=10240\&persist=true
curl -X POST http://10.99.200.146:8040/api/update_config?streaming_load_json_max_mb=10240\&persist=true
curl -X POST http://10.99.204.175:8040/api/update_config?streaming_load_json_max_mb=10240\&persist=true

curl -X POST http://10.99.201.177:8040/api/update_config?stream_load_record_batch_size=1000\&persist=true
curl -X POST http://10.99.197.74:8040/api/update_config?stream_load_record_batch_size=1000\&persist=true
curl -X POST http://10.99.194.79:8040/api/update_config?stream_load_record_batch_size=1000\&persist=true
curl -X POST http://10.99.200.146:8040/api/update_config?stream_load_record_batch_size=1000\&persist=true
curl -X POST http://10.99.204.175:8040/api/update_config?stream_load_record_batch_size=1000\&persist=true


