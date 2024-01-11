use test_db;
-- SET show_hidden_columns=true;
-------------------------------------------------------
drop table if exists unique_test;
create table if not exists unique_test(
  id int not null,
  name text
)UNIQUE KEY(`id`) DISTRIBUTED BY HASH(`id`) BUCKETS 36;
-------------------------------------------------------
drop table if exists agg_test;
create table if not exists agg_test(
  id int not null,
  name text REPLACE_IF_NOT_NULL
)AGGREGATE KEY(`id`) DISTRIBUTED BY HASH(`id`) BUCKETS 36;




select * from agg_test;
SET enable_insert_strict = true;
insert into agg_test(id,name)values('aaa','bbb');
select * from agg_test;

