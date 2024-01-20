select count(1) from ads.ads_user_dispatch_log_tag_df;
select count(1) from ads.ads_user_tag;
select count(1) from dwd.dwd_user_register_details;
select count(1) from dim.dim_user_comparison;
select count(1) from dwd.dwd_coupon_info;
select count(1) from ads.ads_user_distribution_user_tag_df;
select count(1) from ads.ads_user_tag_commercial_df;
select count(1) from crowd.crowd_user_bitmap;
select count(1) from crowd.dispatch_user_bitmap;
select count(1) from crowd.dispatch_sub_user_bitmap;


drop table test.bitmap_test;
create table test.bitmap_test(id string,bitmap binary);

with t as(
select 'company_bond_plates' id, doris.to_bitmap(id) bitmap from hudi_ods.company_bond_plates
union all
select 'company_clean_info' id, doris.to_bitmap(id) bitmap from hudi_ods.company_clean_info
union all
select 'company_equity_relation_details' id, doris.to_bitmap(id) bitmap from hudi_ods.company_equity_relation_details
union all
select 'company_human_relation' id, doris.to_bitmap(id) bitmap from hudi_ods.company_human_relation
union all
select 'company_index' id, doris.to_bitmap(id) bitmap from hudi_ods.company_index
union all
select 'company_legal_person' id, doris.to_bitmap(id) bitmap from hudi_ods.company_legal_person
union all
select 'personnel' id, doris.to_bitmap(id) bitmap from hudi_ods.personnel
union all
select 'senior_executive' id, doris.to_bitmap(id) bitmap from hudi_ods.senior_executive
union all
select 'senior_executive_hk' id, doris.to_bitmap(id) bitmap from hudi_ods.senior_executive_hk
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