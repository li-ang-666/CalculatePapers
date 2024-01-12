"id",
"company_id_invested",
"tyc_unique_entity_id_invested",
"tyc_unique_entity_name_invested",
"investor_identity_type",
"company_id_investor",
"tyc_unique_entity_id_investor",
"tyc_unique_entity_name_investor",
"equity_amount",
"equity_amount_currency",
"equity_ratio",
"equity_relation_validation_year",
"reference_pt_year",

-- beeline
use test;
drop table if exists graph_export;
create table if not exists graph_export(
  `row` string
)stored as textfile location 'obs://hadoop-obs/flink';
-- 建表后再写入数据
select count(1) from graph_export;
-- spark-sql
use test;
insert overwrite table graph_export select /*+ REPARTITION(1) */ * from graph_export;
select count(1) from graph_export;

实例名称:rds486-hw0-prod-C后端-合作伙伴RO1
连接信息: jdhw_d_data_dml:2s0^tFa4SLrp72@c1aca3ace6fb4e138854db3b3b87deddin01.internal.cn-north-4.mysql.rds.myhuaweicloud.com:3306/company_base
业务线:C端
数据库类型:MySql
描述:rds486-hw0-prod-C后端-合作伙伴RO1

1. 列表页
合作伙伴列表页以及count相关 v2.0(get_human_pid_with_neighbor_list_by_human_id) -> 合作伙伴列表页 v1.0(get_cooperation_partner_list)
2. 明细页
合作伙伴明细页 v1.0(get_cooperation_partner_details) -> 合作伙伴明细页 v2.0(get_cooperation_partner_details)
3. count
合作伙伴列表页以及count相关 v3.0(get_human_pid_with_neighbor_list_by_human_id) -> 合作伙伴count v1.0(get_cooperation_partner_cnt)


admin set frontend config("disable_balance" = "true");
admin set frontend config("disable_colocate_balance" = "true");
admin set frontend config("disable_tablet_scheduler" = "true");

admin set frontend config("disable_balance" = "false");
admin set frontend config("disable_colocate_balance" = "false");
admin set frontend config("disable_tablet_scheduler" = "false");

./spark-submit.sh 

doris --sql "insert into test_db.unique_test select date_format(date_add(current_date(),-1),'yyyyMMdd') pt, id, company_name name from hudi_ods.company_index" --parallelism 32



