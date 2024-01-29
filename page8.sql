  --driver-memory 2g --driver-cores 1 \
  --conf spark.driver.memoryOverhead=512m \
  --executor-memory 5g --num-executors 4 --executor-cores 8 \
  --conf spark.executor.memoryOverhead=512m \
  --conf spark.memory.offHeap.enabled=true --conf spark.memory.offHeap.size=512m \



set spark.driver.memory=1g;
set spark.driver.memoryOverhead=512m;
set spark.executor.num=1;
set spark.executor.cores=1;
set spark.executor.memory=4g;
set spark.executor.memoryOverhead=512m;
set spark.memory.fraction=0.01;



INSERT INTO test.crowd_user_bitmap PARTITION(pt=20240128) 
SELECT 1, -1, doris.bitmap_union(t.uid) 
FROM (SELECT 1 c, doris.to_bitmap(t1.old_user_id) uid FROM dim_offline.dim_user_comparison_df t1 where t1.pt=20240128 and t1.old_user_id regexp '^\\d+$') t GROUP BY t.c



SELECT count(1) FROM dim_offline.dim_user_comparison_df t1 where t1.pt=20240128 and t1.old_user_id regexp '^\\d+$'


