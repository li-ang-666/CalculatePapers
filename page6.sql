0: jdbc:hive2://10.99.202.153:10000/> with t as(
. . . . . . . . . . . . . . . . . . >   select
. . . . . . . . . . . . . . . . . . >     boss_human_pid,
. . . . . . . . . . . . . . . . . . >     company_gid,
. . . . . . . . . . . . . . . . . . >     partner_human_pid,
. . . . . . . . . . . . . . . . . . >     named_struct(
. . . . . . . . . . . . . . . . . . >       'boss_human_gid', boss_human_gid,
. . . . . . . . . . . . . . . . . . >       'boss_human_pid', boss_human_pid,
. . . . . . . . . . . . . . . . . . >       'boss_human_name', boss_human_name,
. . . . . . . . . . . . . . . . . . >       'boss_identity', boss_identity,
. . . . . . . . . . . . . . . . . . >       'boss_shares', boss_shares,
. . . . . . . . . . . . . . . . . . >       'company_gid', company_gid,
. . . . . . . . . . . . . . . . . . >       'company_name', company_name,
. . . . . . . . . . . . . . . . . . >       'company_registered_status', company_registered_status,
. . . . . . . . . . . . . . . . . . >       'company_registered_capital', company_registered_capital,
. . . . . . . . . . . . . . . . . . >       's', s,
. . . . . . . . . . . . . . . . . . >       'partner_human_gid', partner_human_gid,
. . . . . . . . . . . . . . . . . . >       'partner_human_pid', partner_human_pid,
. . . . . . . . . . . . . . . . . . >       'partner_human_name', partner_human_name,
. . . . . . . . . . . . . . . . . . >       'partner_identity', partner_identity,
. . . . . . . . . . . . . . . . . . >       'partner_shares', partner_shares,
. . . . . . . . . . . . . . . . . . >       'single_cooperation_score', single_cooperation_score,
. . . . . . . . . . . . . . . . . . >       'multi_cooperation_score', multi_cooperation_score,
. . . . . . . . . . . . . . . . . . >       'single_cooperation_row_number', single_cooperation_row_number,
. . . . . . . . . . . . . . . . . . >       'multi_cooperation_dense_rank', multi_cooperation_dense_rank,
. . . . . . . . . . . . . . . . . . >       'cooperation_times_with_this_partner', cooperation_times_with_this_partner,
. . . . . . . . . . . . . . . . . . >       'cooperation_times_with_all_partner', cooperation_times_with_all_partner,
. . . . . . . . . . . . . . . . . . >       'total_partners', total_partners
. . . . . . . . . . . . . . . . . . >     ) json,
. . . . . . . . . . . . . . . . . . >     sha2(concat(
. . . . . . . . . . . . . . . . . . >       nvl(boss_human_gid, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(boss_human_pid, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(boss_human_name, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(boss_identity, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(boss_shares, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(company_gid, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(company_name, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(company_registered_status, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(company_registered_capital, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(s, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(partner_human_gid, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(partner_human_pid, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(partner_human_name, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(partner_identity, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(partner_shares, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(single_cooperation_score, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(multi_cooperation_score, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(single_cooperation_row_number, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(multi_cooperation_dense_rank, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(cooperation_times_with_this_partner, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(cooperation_times_with_all_partner, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(total_partners, 'NULL')
. . . . . . . . . . . . . . . . . . >     ), 512) cipher
. . . . . . . . . . . . . . . . . . >   from hudi_ads.cooperation_partner_new where pt = '20231221'
. . . . . . . . . . . . . . . . . . >   union all 
. . . . . . . . . . . . . . . . . . >   select
. . . . . . . . . . . . . . . . . . >     boss_human_pid,
. . . . . . . . . . . . . . . . . . >     company_gid,
. . . . . . . . . . . . . . . . . . >     partner_human_pid,
. . . . . . . . . . . . . . . . . . >     named_struct(
. . . . . . . . . . . . . . . . . . >       'boss_human_gid', boss_human_gid,
. . . . . . . . . . . . . . . . . . >       'boss_human_pid', boss_human_pid,
. . . . . . . . . . . . . . . . . . >       'boss_human_name', boss_human_name,
. . . . . . . . . . . . . . . . . . >       'boss_identity', boss_identity,
. . . . . . . . . . . . . . . . . . >       'boss_shares', boss_shares,
. . . . . . . . . . . . . . . . . . >       'company_gid', company_gid,
. . . . . . . . . . . . . . . . . . >       'company_name', company_name,
. . . . . . . . . . . . . . . . . . >       'company_registered_status', company_registered_status,
. . . . . . . . . . . . . . . . . . >       'company_registered_capital', company_registered_capital,
. . . . . . . . . . . . . . . . . . >       's', s,
. . . . . . . . . . . . . . . . . . >       'partner_human_gid', partner_human_gid,
. . . . . . . . . . . . . . . . . . >       'partner_human_pid', partner_human_pid,
. . . . . . . . . . . . . . . . . . >       'partner_human_name', partner_human_name,
. . . . . . . . . . . . . . . . . . >       'partner_identity', partner_identity,
. . . . . . . . . . . . . . . . . . >       'partner_shares', partner_shares,
. . . . . . . . . . . . . . . . . . >       'single_cooperation_score', single_cooperation_score,
. . . . . . . . . . . . . . . . . . >       'multi_cooperation_score', multi_cooperation_score,
. . . . . . . . . . . . . . . . . . >       'single_cooperation_row_number', single_cooperation_row_number,
. . . . . . . . . . . . . . . . . . >       'multi_cooperation_dense_rank', multi_cooperation_dense_rank,
. . . . . . . . . . . . . . . . . . >       'cooperation_times_with_this_partner', cooperation_times_with_this_partner,
. . . . . . . . . . . . . . . . . . >       'cooperation_times_with_all_partner', cooperation_times_with_all_partner,
. . . . . . . . . . . . . . . . . . >       'total_partners', total_partners
. . . . . . . . . . . . . . . . . . >     ) json,
. . . . . . . . . . . . . . . . . . >     sha2(concat(
. . . . . . . . . . . . . . . . . . >       nvl(boss_human_gid, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(boss_human_pid, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(boss_human_name, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(boss_identity, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(boss_shares, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(company_gid, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(company_name, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(company_registered_status, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(company_registered_capital, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(s, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(partner_human_gid, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(partner_human_pid, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(partner_human_name, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(partner_identity, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(partner_shares, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(single_cooperation_score, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(multi_cooperation_score, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(single_cooperation_row_number, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(multi_cooperation_dense_rank, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(cooperation_times_with_this_partner, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(cooperation_times_with_all_partner, 'NULL'),
. . . . . . . . . . . . . . . . . . >       nvl(total_partners, 'NULL')
. . . . . . . . . . . . . . . . . . >     ), 512) cipher
. . . . . . . . . . . . . . . . . . >   from hudi_ads.cooperation_partner_new where pt = '20231221'
. . . . . . . . . . . . . . . . . . > )select * from t limit 11;
INFO  : State: Compiling.
INFO  : Compiling command(queryId=omm_20231222190153_1ae177eb-5b31-498e-b57e-508a8ab64334): with t as(
select
boss_human_pid,
company_gid,
partner_human_pid,
named_struct(
'boss_human_gid', boss_human_gid,
'boss_human_pid', boss_human_pid,
'boss_human_name', boss_human_name,
'boss_identity', boss_identity,
'boss_shares', boss_shares,
'company_gid', company_gid,
'company_name', company_name,
'company_registered_status', company_registered_status,
'company_registered_capital', company_registered_capital,
's', s,
'partner_human_gid', partner_human_gid,
'partner_human_pid', partner_human_pid,
'partner_human_name', partner_human_name,
'partner_identity', partner_identity,
'partner_shares', partner_shares,
'single_cooperation_score', single_cooperation_score,
'multi_cooperation_score', multi_cooperation_score,
'single_cooperation_row_number', single_cooperation_row_number,
'multi_cooperation_dense_rank', multi_cooperation_dense_rank,
'cooperation_times_with_this_partner', cooperation_times_with_this_partner,
'cooperation_times_with_all_partner', cooperation_times_with_all_partner,
'total_partners', total_partners
) json,
sha2(concat(
nvl(boss_human_gid, 'NULL'),
nvl(boss_human_pid, 'NULL'),
nvl(boss_human_name, 'NULL'),
nvl(boss_identity, 'NULL'),
nvl(boss_shares, 'NULL'),
nvl(company_gid, 'NULL'),
nvl(company_name, 'NULL'),
nvl(company_registered_status, 'NULL'),
nvl(company_registered_capital, 'NULL'),
nvl(s, 'NULL'),
nvl(partner_human_gid, 'NULL'),
nvl(partner_human_pid, 'NULL'),
nvl(partner_human_name, 'NULL'),
nvl(partner_identity, 'NULL'),
nvl(partner_shares, 'NULL'),
nvl(single_cooperation_score, 'NULL'),
nvl(multi_cooperation_score, 'NULL'),
nvl(single_cooperation_row_number, 'NULL'),
nvl(multi_cooperation_dense_rank, 'NULL'),
nvl(cooperation_times_with_this_partner, 'NULL'),
nvl(cooperation_times_with_all_partner, 'NULL'),
nvl(total_partners, 'NULL')
), 512) cipher
from hudi_ads.cooperation_partner_new where pt = '20231221'
union all
select
boss_human_pid,
company_gid,
partner_human_pid,
named_struct(
'boss_human_gid', boss_human_gid,
'boss_human_pid', boss_human_pid,
'boss_human_name', boss_human_name,
'boss_identity', boss_identity,
'boss_shares', boss_shares,
'company_gid', company_gid,
'company_name', company_name,
'company_registered_status', company_registered_status,
'company_registered_capital', company_registered_capital,
's', s,
'partner_human_gid', partner_human_gid,
'partner_human_pid', partner_human_pid,
'partner_human_name', partner_human_name,
'partner_identity', partner_identity,
'partner_shares', partner_shares,
'single_cooperation_score', single_cooperation_score,
'multi_cooperation_score', multi_cooperation_score,
'single_cooperation_row_number', single_cooperation_row_number,
'multi_cooperation_dense_rank', multi_cooperation_dense_rank,
'cooperation_times_with_this_partner', cooperation_times_with_this_partner,
'cooperation_times_with_all_partner', cooperation_times_with_all_partner,
'total_partners', total_partners
) json,
sha2(concat(
nvl(boss_human_gid, 'NULL'),
nvl(boss_human_pid, 'NULL'),
nvl(boss_human_name, 'NULL'),
nvl(boss_identity, 'NULL'),
nvl(boss_shares, 'NULL'),
nvl(company_gid, 'NULL'),
nvl(company_name, 'NULL'),
nvl(company_registered_status, 'NULL'),
nvl(company_registered_capital, 'NULL'),
nvl(s, 'NULL'),
nvl(partner_human_gid, 'NULL'),
nvl(partner_human_pid, 'NULL'),
nvl(partner_human_name, 'NULL'),
nvl(partner_identity, 'NULL'),
nvl(partner_shares, 'NULL'),
nvl(single_cooperation_score, 'NULL'),
nvl(multi_cooperation_score, 'NULL'),
nvl(single_cooperation_row_number, 'NULL'),
nvl(multi_cooperation_dense_rank, 'NULL'),
nvl(cooperation_times_with_this_partner, 'NULL'),
nvl(cooperation_times_with_all_partner, 'NULL'),
nvl(total_partners, 'NULL')
), 512) cipher
from hudi_ads.cooperation_partner_new where pt = '20231221'
)select * from t limit 11; Current sessionId=feacb64f-5e81-4336-9e62-7f5fe50e6511
INFO  : hive.compile.auto.avoid.cbo=true
INFO  : Insert table not follow columns
INFO  : Insert table not follow columns
INFO  : Insert table not follow columns
INFO  : Concurrency mode is disabled, not creating a lock manager
INFO  : Current sql is not contains insert syntax, not need record dest table flag
INFO  : Semantic Analysis Completed (retrial = false)
INFO  : Returning Hive schema: Schema(fieldSchemas:[FieldSchema(name:t.boss_human_pid, type:string, comment:null), FieldSchema(name:t.company_gid, type:decimal(20,0), comment:null), FieldSchema(name:t.partner_human_pid, type:string, comment:null), FieldSchema(name:t.json, type:struct<boss_human_gid:decimal(20,0),boss_human_pid:string,boss_human_name:string,boss_identity:string,boss_shares:decimal(32,12),company_gid:decimal(20,0),company_name:string,company_registered_status:string,company_registered_capital:decimal(20,0),s:int,partner_human_gid:decimal(20,0),partner_human_pid:string,partner_human_name:string,partner_identity:string,partner_shares:decimal(32,12),single_cooperation_score:decimal(32,12),multi_cooperation_score:decimal(32,12),single_cooperation_row_number:int,multi_cooperation_dense_rank:int,cooperation_times_with_this_partner:int,cooperation_times_with_all_partner:int,total_partners:int>, comment:null), FieldSchema(name:t.cipher, type:string, comment:null)], properties:null)
INFO  : Completed compiling command(queryId=omm_20231222190153_1ae177eb-5b31-498e-b57e-508a8ab64334); Time taken: 0.091 seconds
INFO  : Concurrency mode is disabled, not creating a lock manager
INFO  : State: Executing.
INFO  : Executing command(queryId=omm_20231222190153_1ae177eb-5b31-498e-b57e-508a8ab64334): with t as(
select
boss_human_pid,
company_gid,
partner_human_pid,
named_struct(
'boss_human_gid', boss_human_gid,
'boss_human_pid', boss_human_pid,
'boss_human_name', boss_human_name,
'boss_identity', boss_identity,
'boss_shares', boss_shares,
'company_gid', company_gid,
'company_name', company_name,
'company_registered_status', company_registered_status,
'company_registered_capital', company_registered_capital,
's', s,
'partner_human_gid', partner_human_gid,
'partner_human_pid', partner_human_pid,
'partner_human_name', partner_human_name,
'partner_identity', partner_identity,
'partner_shares', partner_shares,
'single_cooperation_score', single_cooperation_score,
'multi_cooperation_score', multi_cooperation_score,
'single_cooperation_row_number', single_cooperation_row_number,
'multi_cooperation_dense_rank', multi_cooperation_dense_rank,
'cooperation_times_with_this_partner', cooperation_times_with_this_partner,
'cooperation_times_with_all_partner', cooperation_times_with_all_partner,
'total_partners', total_partners
) json,
sha2(concat(
nvl(boss_human_gid, 'NULL'),
nvl(boss_human_pid, 'NULL'),
nvl(boss_human_name, 'NULL'),
nvl(boss_identity, 'NULL'),
nvl(boss_shares, 'NULL'),
nvl(company_gid, 'NULL'),
nvl(company_name, 'NULL'),
nvl(company_registered_status, 'NULL'),
nvl(company_registered_capital, 'NULL'),
nvl(s, 'NULL'),
nvl(partner_human_gid, 'NULL'),
nvl(partner_human_pid, 'NULL'),
nvl(partner_human_name, 'NULL'),
nvl(partner_identity, 'NULL'),
nvl(partner_shares, 'NULL'),
nvl(single_cooperation_score, 'NULL'),
nvl(multi_cooperation_score, 'NULL'),
nvl(single_cooperation_row_number, 'NULL'),
nvl(multi_cooperation_dense_rank, 'NULL'),
nvl(cooperation_times_with_this_partner, 'NULL'),
nvl(cooperation_times_with_all_partner, 'NULL'),
nvl(total_partners, 'NULL')
), 512) cipher
from hudi_ads.cooperation_partner_new where pt = '20231221'
union all
select
boss_human_pid,
company_gid,
partner_human_pid,
named_struct(
'boss_human_gid', boss_human_gid,
'boss_human_pid', boss_human_pid,
'boss_human_name', boss_human_name,
'boss_identity', boss_identity,
'boss_shares', boss_shares,
'company_gid', company_gid,
'company_name', company_name,
'company_registered_status', company_registered_status,
'company_registered_capital', company_registered_capital,
's', s,
'partner_human_gid', partner_human_gid,
'partner_human_pid', partner_human_pid,
'partner_human_name', partner_human_name,
'partner_identity', partner_identity,
'partner_shares', partner_shares,
'single_cooperation_score', single_cooperation_score,
'multi_cooperation_score', multi_cooperation_score,
'single_cooperation_row_number', single_cooperation_row_number,
'multi_cooperation_dense_rank', multi_cooperation_dense_rank,
'cooperation_times_with_this_partner', cooperation_times_with_this_partner,
'cooperation_times_with_all_partner', cooperation_times_with_all_partner,
'total_partners', total_partners
) json,
sha2(concat(
nvl(boss_human_gid, 'NULL'),
nvl(boss_human_pid, 'NULL'),
nvl(boss_human_name, 'NULL'),
nvl(boss_identity, 'NULL'),
nvl(boss_shares, 'NULL'),
nvl(company_gid, 'NULL'),
nvl(company_name, 'NULL'),
nvl(company_registered_status, 'NULL'),
nvl(company_registered_capital, 'NULL'),
nvl(s, 'NULL'),
nvl(partner_human_gid, 'NULL'),
nvl(partner_human_pid, 'NULL'),
nvl(partner_human_name, 'NULL'),
nvl(partner_identity, 'NULL'),
nvl(partner_shares, 'NULL'),
nvl(single_cooperation_score, 'NULL'),
nvl(multi_cooperation_score, 'NULL'),
nvl(single_cooperation_row_number, 'NULL'),
nvl(multi_cooperation_dense_rank, 'NULL'),
nvl(cooperation_times_with_this_partner, 'NULL'),
nvl(cooperation_times_with_all_partner, 'NULL'),
nvl(total_partners, 'NULL')
), 512) cipher
from hudi_ads.cooperation_partner_new where pt = '20231221'
)select * from t limit 11; Current sessionId=feacb64f-5e81-4336-9e62-7f5fe50e6511
INFO  : Query ID = omm_20231222190153_1ae177eb-5b31-498e-b57e-508a8ab64334, Current sessionId=feacb64f-5e81-4336-9e62-7f5fe50e6511
INFO  : Total jobs = 1
INFO  : Launching Job 1 out of 1
INFO  : Starting task [Stage-1:MAPRED] in serial mode
INFO  : Hive on Spark State: STARTED
INFO  : Running with YARN Application = application_1701157926107_329653
INFO  : Kill Command = /opt/Bigdata/FusionInsight_HD_8.1.2.1/install/FusionInsight-Hive-3.1.0/hive-3.1.0/bin/..//../hadoop/bin/yarn application -kill application_1701157926107_329653
INFO  : Hive on Spark Session Web UI URL: http://node-group-1jdLM.mrs-68gj.com:22767
INFO  : Query Hive on Spark job[0] stages: [0]
INFO  : Spark job[0] status = RUNNING
INFO  : Job Progress Format
CurrentTime StageId_StageAttemptId: SucceededTasksCount(+RunningTasksCount-FailedTasksCount)/TotalTasksCount
INFO  : 2023-12-22 19:02:14,526	Stage-0_0: 0/512	
INFO  : 2023-12-22 19:02:17,539	Stage-0_0: 0(+2)/512	
INFO  : 2023-12-22 19:02:20,547	Stage-0_0: 1(+5)/512	
INFO  : 2023-12-22 19:02:23,555	Stage-0_0: 10(+20)/512	
INFO  : 2023-12-22 19:02:26,562	Stage-0_0: 33(+96)/512	
INFO  : 2023-12-22 19:02:29,572	Stage-0_0: 166(+101)/512	
INFO  : 2023-12-22 19:02:32,578	Stage-0_0: 510(+2)/512	
INFO  : Hive on Spark State: SUCCEEDED
INFO  : Spark job[0] finished successfully in 22.12 second(s)
INFO  : Completed executing command(queryId=omm_20231222190153_1ae177eb-5b31-498e-b57e-508a8ab64334); Time taken: 39.836 seconds
INFO  : OK
INFO  : Concurrency mode is disabled, not creating a lock manager
+--------------------+----------------+----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------+
|  t.boss_human_pid  | t.company_gid  | t.partner_human_pid  |                                                                                                                                                                                                                                                        t.json                                                                                                                                                                                                                                                        |                                                             t.cipher                                                              |
+--------------------+----------------+----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------+
| 00001MT02B4964BHJ  | 3224211461     | 000Y1MT02BQ917VNJ    | {"boss_human_gid":1879794235,"boss_human_pid":"00001MT02B4964BHJ","boss_human_name":"孙彦彦","boss_identity":"2@股东(持股100%)、3@法定代表人、1@执行董事兼总经理","boss_shares":100000000,"company_gid":3224211461,"company_name":"洛阳彦钰机械设备有限公司","company_registered_status":"存续","company_registered_capital":100000000,"s":1,"partner_human_gid":1811554493,"partner_human_pid":"000Y1MT02BQ917VNJ","partner_human_name":"刘恩华","partner_identity":"1@监事","partner_shares":null,"single_cooperation_score":12,"multi_cooperation_score":13,"single_cooperation_row_number":1,"multi_cooperation_dense_rank":1,"cooperation_times_with_this_partner":1,"cooperation_times_with_all_partner":2,"total_partners":2} | d3ac570ca67d146efd8379f46b54294140e23928aab68555a2808fc85001e3b01362e32a6bc0d71d01d27d2cfed00174fd500dda0435444c320bf77df47ddbff  |
| 00001MT02B4964BHJ  | 3224211461     | 000M1MT02B4994GDN    | {"boss_human_gid":1879794235,"boss_human_pid":"00001MT02B4964BHJ","boss_human_name":"孙彦彦","boss_identity":"2@股东(持股100%)、3@法定代表人、1@执行董事兼总经理","boss_shares":100000000,"company_gid":3224211461,"company_name":"洛阳彦钰机械设备有限公司","company_registered_status":"存续","company_registered_capital":100000000,"s":1,"partner_human_gid":1880875091,"partner_human_pid":"000M1MT02B4994GDN","partner_human_name":"孙楠","partner_identity":"1@财务负责人","partner_shares":null,"single_cooperation_score":12,"multi_cooperation_score":13,"single_cooperation_row_number":1,"multi_cooperation_dense_rank":2,"cooperation_times_with_this_partner":1,"cooperation_times_with_all_partner":2,"total_partners":2} | 17fac02eb966d4d8f4f2e524cd0770735448f94e2e6d6cddfd06454ebf00819a91c0118e7e845d35433790b5b48fed0b7d7e748667f5bf0097b87e3cc6b3afd7  |
| 00002MV02B928H4DA  | 3179407702     | C0JQH9S092M4B2ESH    | {"boss_human_gid":1812695448,"boss_human_pid":"00002MV02B928H4DA","boss_human_name":"刘晶","boss_identity":"3@法定代表人、2@股东(持股40%)、1@执行董事、经理","boss_shares":40000000,"company_gid":3179407702,"company_name":"厦门花墅商贸有限公司","company_registered_status":"注销","company_registered_capital":100000000,"s":0,"partner_human_gid":2257389419,"partner_human_pid":"C0JQH9S092M4B2ESH","partner_human_name":"陈美如","partner_identity":"1@监事、2@股东(持股30%)","partner_shares":30000000,"single_cooperation_score":5,"multi_cooperation_score":6,"single_cooperation_row_number":1,"multi_cooperation_dense_rank":1,"cooperation_times_with_this_partner":1,"cooperation_times_with_all_partner":2,"total_partners":2} | 1a88b1abeeb157bd342bc3e8e1f45a59d83e45de7061ef78b765b3095e7844e2acfe0c9f82a859085e98449ed16e8239bbcc39406134d8bb744b866e3b41083f  |
| 00002MV02B928H4DA  | 3179407702     | C0JPHMS092U47SBDB    | {"boss_human_gid":1812695448,"boss_human_pid":"00002MV02B928H4DA","boss_human_name":"刘晶","boss_identity":"3@法定代表人、2@股东(持股40%)、1@执行董事、经理","boss_shares":40000000,"company_gid":3179407702,"company_name":"厦门花墅商贸有限公司","company_registered_status":"注销","company_registered_capital":100000000,"s":0,"partner_human_gid":1976280763,"partner_human_pid":"C0JPHMS092U47SBDB","partner_human_name":"朱莉","partner_identity":"2@股东(持股30%)","partner_shares":30000000,"single_cooperation_score":4,"multi_cooperation_score":5,"single_cooperation_row_number":1,"multi_cooperation_dense_rank":2,"cooperation_times_with_this_partner":1,"cooperation_times_with_all_partner":2,"total_partners":2} | 31ab6bd33561179a9e5bc58b1974426e3857ee2d5af97b7eb961f9b6cbfbddb516d4174c3b1797d11c54d26d5eab5350670a343008c8ceb66f44d3787c18160b  |
| 000039G023ZMH2P5C  | 3222883346     | 000L3MG023LMD71Q4    | {"boss_human_gid":2248655580,"boss_human_pid":"000039G023ZMH2P5C","boss_human_name":"陈克飞","boss_identity":"1@监事","boss_shares":null,"company_gid":3222883346,"company_name":"垫江县百兴老年公寓有限公司","company_registered_status":"存续","company_registered_capital":100000000,"s":1,"partner_human_gid":1785994981,"partner_human_pid":"000L3MG023LMD71Q4","partner_human_name":"余登秀","partner_identity":"2@股东(持股100%)","partner_shares":100000000,"single_cooperation_score":4.666666666667,"multi_cooperation_score":5.66666666667,"single_cooperation_row_number":1,"multi_cooperation_dense_rank":1,"cooperation_times_with_this_partner":1,"cooperation_times_with_all_partner":2,"total_partners":2} | 16c79594915b0de515aba9bebb572386da2c25691d874b00d296ca4893773038dedcc180bcfd9c2a41ca3a9944498ef45fa631b7e713f517ca3ac562e6d9390e  |
| 000039G023ZMH2P5C  | 3222883346     | 50BK4MM09J2RYFN9U    | {"boss_human_gid":2248655580,"boss_human_pid":"000039G023ZMH2P5C","boss_human_name":"陈克飞","boss_identity":"1@监事","boss_shares":null,"company_gid":3222883346,"company_name":"垫江县百兴老年公寓有限公司","company_registered_status":"存续","company_registered_capital":100000000,"s":1,"partner_human_gid":1926303732,"partner_human_pid":"50BK4MM09J2RYFN9U","partner_human_name":"张扬海","partner_identity":"1@执行董事兼经理、3@法定代表人","partner_shares":null,"single_cooperation_score":3,"multi_cooperation_score":4,"single_cooperation_row_number":1,"multi_cooperation_dense_rank":2,"cooperation_times_with_this_partner":1,"cooperation_times_with_all_partner":2,"total_partners":2} | 8b4f1318d06d24b27cafd86eed860094961bed39e87d70829849b48a136b2665cf49ac5d33b964335f6b8b2a9730f4a5a748b8173bae57662ae8694e6c7d7f68  |
| 000049Z02TV0G1HBT  | 3221372952     | 000949Z02TE0C26KG    | {"boss_human_gid":2316170870,"boss_human_pid":"000049Z02TV0G1HBT","boss_human_name":"陈品玲","boss_identity":"1@财务负责人","boss_shares":null,"company_gid":3221372952,"company_name":"广西辉续医疗器械有限公司","company_registered_status":"存续","company_registered_capital":200000000,"s":1,"partner_human_gid":2250681681,"partner_human_pid":"000949Z02TE0C26KG","partner_human_name":"陈如辉","partner_identity":"1@经理、2@股东(持股100%)、3@法定代表人","partner_shares":200000000,"single_cooperation_score":12.301029995664,"multi_cooperation_score":13.30102999566,"single_cooperation_row_number":1,"multi_cooperation_dense_rank":1,"cooperation_times_with_this_partner":1,"cooperation_times_with_all_partner":2,"total_partners":2} | 89aa3dd55551beed63619956b2f12907addf2d957da5eb434205d4abbf045d0f2aa50be20ab79c821bec54c7770c4a8c59f08a6c089487e8f4b36e5a89c145f5  |
| 000049Z02TV0G1HBT  | 3221372952     | 000949Z02TA0JMY29    | {"boss_human_gid":2316170870,"boss_human_pid":"000049Z02TV0G1HBT","boss_human_name":"陈品玲","boss_identity":"1@财务负责人","boss_shares":null,"company_gid":3221372952,"company_name":"广西辉续医疗器械有限公司","company_registered_status":"存续","company_registered_capital":200000000,"s":1,"partner_human_gid":2183240671,"partner_human_pid":"000949Z02TA0JMY29","partner_human_name":"贺亚琼","partner_identity":"1@监事","partner_shares":null,"single_cooperation_score":2,"multi_cooperation_score":3,"single_cooperation_row_number":1,"multi_cooperation_dense_rank":2,"cooperation_times_with_this_partner":1,"cooperation_times_with_all_partner":2,"total_partners":2} | 63ff1cbf6b6cbd1f6a0d0cd3c1beb137fe8fbb250084ae9543d0d0be17b6fa1839893c25a0ababda94644abe95fd7ef68c3311139dd6608b0aecc25cf85b7f5d  |
| 0000592022F0AMG6J  | 5888044930     | 001TCMV09MP79YRUV    | {"boss_human_gid":2181620947,"boss_human_pid":"0000592022F0AMG6J","boss_human_name":"谷有香","boss_identity":"1@监事、2@股东(持股20%)","boss_shares":133377600,"company_gid":5888044930,"company_name":"山东金鼎置业有限公司","company_registered_status":"开业","company_registered_capital":666888000,"s":1,"partner_human_gid":2118447182,"partner_human_pid":"001TCMV09MP79YRUV","partner_human_name":"耿玉民","partner_identity":"1@执行董事兼总经理、财务负责人、2@股东(持股80%)、3@法定代表人","partner_shares":533510400,"single_cooperation_score":19.143864822073,"multi_cooperation_score":39.84283482641,"single_cooperation_row_number":1,"multi_cooperation_dense_rank":1,"cooperation_times_with_this_partner":3,"cooperation_times_with_all_partner":3,"total_partners":1} | f1583b3fa0a2a125953bbcb88f932f82f0277d56713b8be60272e2a3f0b448f604d379c6a886e2c2f439907b6789150b8a60a9f10745a59e3848aa94042df366  |
| 0000592022F0AMG6J  | 4253997802     | 001TCMV09MP79YRUV    | {"boss_human_gid":2181620947,"boss_human_pid":"0000592022F0AMG6J","boss_human_name":"谷有香","boss_identity":"1@监事","boss_shares":null,"company_gid":4253997802,"company_name":"一祝经济研究咨询有限公司","company_registered_status":"开业","company_registered_capital":5000000000,"s":1,"partner_human_gid":2118447182,"partner_human_pid":"001TCMV09MP79YRUV","partner_human_name":"耿玉民","partner_identity":"1@执行董事兼经理、2@股东(持股100%)、3@法定代表人","partner_shares":5000000000,"single_cooperation_score":13.698970004336,"multi_cooperation_score":39.84283482641,"single_cooperation_row_number":2,"multi_cooperation_dense_rank":1,"cooperation_times_with_this_partner":3,"cooperation_times_with_all_partner":3,"total_partners":1} | ddf4689d3ceb6d4323c176c99b5cf087a79383c67d37b9ff8ac92c9cf4ab45e556d0c078f07ca2ea4eaa2e2cc83b92a400f3addb343451018c80772f9ad2473d  |
| 0000592022F0AMG6J  | 3221326863     | 001TCMV09MP79YRUV    | {"boss_human_gid":2181620947,"boss_human_pid":"0000592022F0AMG6J","boss_human_name":"谷有香","boss_identity":"1@监事","boss_shares":null,"company_gid":3221326863,"company_name":"济南市金鼎不动产顾问有限公司","company_registered_status":"注销","company_registered_capital":300000000,"s":0,"partner_human_gid":2118447182,"partner_human_pid":"001TCMV09MP79YRUV","partner_human_name":"耿玉民","partner_identity":"1@执行董事兼经理、2@股东(持股100%)、3@法定代表人","partner_shares":300000000,"single_cooperation_score":4,"multi_cooperation_score":39.84283482641,"single_cooperation_row_number":3,"multi_cooperation_dense_rank":1,"cooperation_times_with_this_partner":3,"cooperation_times_with_all_partner":3,"total_partners":1} | bc32bf36d506eb0b1ec1d639b030bf66eff80b4e73c5d57116d294c974d452048103d38bfc0dc9969782da91008d21a6493f030b95e3fa1fe6ca2848f683cffc  |
+--------------------+----------------+----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------+
11 rows selected (40.003 seconds)
0: jdbc:hive2://10.99.202.153:10000/> 
0: jdbc:hive2://10.99.202.153:10000/> 
0: jdbc:hive2://10.99.202.153:10000/> 
