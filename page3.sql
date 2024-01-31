curl --location-trusted -u admin:Tyc@1234 \
-H "Expect:100-continue" \
-H "format:parquet" \
-H "merge_type:MERGE" \
-H "delete:__DORIS_DELETE_SIGN__=1" \
-H "columns:id,name,__DORIS_DELETE_SIGN__" \
-T ~/Desktop/aaa.parquet \
-XPUT http://10.99.203.64:8030/api/test/parquet_test/_stream_load