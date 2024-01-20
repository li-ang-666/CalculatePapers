drop table test.bitmap_test;
create table test.bitmap_test(id string, bitmap binary);

with ids as(
    select 1 id
    union all
    select 9223372036854775805 id
),t as(
select '1' id, doris.to_bitmap(id) bitmap from ids
)insert overwrite table test.bitmap_test select * from t;


select id, doris.bitmap_count(bitmap) cnt from test.bitmap_test;



drop table test.bitmap_test;
CREATE TABLE `test`.`bitmap_test` (
  `id` varchar(65530) COMMENT '人群包id',
  `user_id_bitmap` bitmap BITMAP_UNION COMMENT '用户id位图'
)
AGGREGATE KEY(`id`)
DISTRIBUTED BY HASH(`id`) BUCKETS 30
PROPERTIES (
  -- 副本数
  "replication_allocation" = "tag.location.default: 3"
);

select id,bitmap_to_string(user_id_bitmap) str from test.bitmap_test;
