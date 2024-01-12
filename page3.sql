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
  "replication_allocation" = "tag.location.default: 3",
  "dynamic_partition.enable" = "true",
  "dynamic_partition.time_unit" = "DAY",
  "dynamic_partition.start" = "-1",
  "dynamic_partition.end" = "1",
  "dynamic_partition.prefix" = "p",
  "dynamic_partition.buckets" = "6",
  "dynamic_partition.replication_allocation" = "tag.location.default: 3"
);
