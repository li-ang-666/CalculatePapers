DROP TABLE unique_test;
CREATE TABLE `unique_test` (
  `id` largeint NOT NULL,
  `name` string NULL
) UNIQUE KEY(`id`) DISTRIBUTED BY HASH(`id`) BUCKETS 1;
DROP TABLE agg_test;
CREATE TABLE `agg_test` (
  `id` largeint NOT NULL,
  `name` string REPLACE_IF_NOT_NULL NULL
) AGGREGATE KEY(`id`) DISTRIBUTED BY HASH(`id`) BUCKETS 1;
