use test_db;
-- SET show_hidden_columns=true;
-------------------------------------------------------
drop table if exists unique_test force;
create table if not exists unique_test(
  id LARGEINT NOT NULL,
  name STRING
)UNIQUE KEY(`id`) DISTRIBUTED BY HASH(`id`) BUCKETS 6;
-------------------------------------------------------
-- drop table if exists agg_test force;
-- create table if not exists agg_test(
--   id LARGEINT NOT NULL,
--   name STRING REPLACE_IF_NOT_NULL
-- )AGGREGATE KEY(`id`) DISTRIBUTED BY HASH(`id`) BUCKETS 6;
;
