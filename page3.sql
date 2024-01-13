use test_db;
drop table if exists unique_test force;
create table if not exists unique_test(
  id LARGEINT NOT NULL,
  pt INT NOT NULL,
  name STRING
)
UNIQUE KEY (`id`, `pt`)
PARTITION BY RANGE (`pt`) ()
DISTRIBUTED BY HASH (`id`) BUCKETS 6
PROPERTIES(
  -- 副本数
  "replication_allocation" = "tag.location.default: 3",
  -- MOW
  "enable_unique_key_merge_on_write" = "true",
  -- schema change
  "light_schema_change" = "true",
  -- partition
  "dynamic_partition.enable" = "true",
  "dynamic_partition.time_unit" = "DAY",
  "dynamic_partition.create_history_partition" = "true",
  "dynamic_partition.history_partition_num" = "1",
  "dynamic_partition.start" = "-1",
  "dynamic_partition.end" = "1",
  "dynamic_partition.prefix" = "p",
  -- partition 分桶数
  "dynamic_partition.buckets" = "6",
  -- partition 副本数
  "dynamic_partition.replication_allocation" = "tag.location.default: 3"
);
