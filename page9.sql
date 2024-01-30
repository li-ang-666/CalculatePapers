
INSERT INTO test.crowd_user_bitmap PARTITION(pt=#{latestPartition})
SELECT 30 crowd_id, 222222 create_timestamp, doris.to_bitmap(t1.old_user_id) user_id_bitmap FROM dim_offline.dim_user_comparison_df t1 where t1.pt = 20240129 and t1.old_user_id regexp '^\\d+$'


SELECT %s, 222222, doris.bitmap_count(doris.bitmap_union(t.uid))
FROM (SELECT %s c, doris.to_bitmap(t1.old_user_id) uid FROM dim_offline.dim_user_comparison_df t1 where t1.pt = 20240129 and t1.old_user_id regexp '^\\d+$') t GROUP BY t.c





select crowd_id,create_timestamp,default.bitmap_count(user_id_bitmap)
from test.crowd_user_bitmap
where create_timestamp = -5 and pt = 20240129 order by crowd_id;