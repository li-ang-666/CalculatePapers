{ "000" :"[checkpoint] table: equity_ratio, pivot: 7,785,473, upperBound: 625,568,150,424,790, lag: 625,568,142,639,317",
"001" :"[checkpoint] table: equity_ratio, pivot: 1,251,136,300,849,579, upperBound: 1,251,136,300,849,579, lag: 0",
"002" :"[checkpoint] table: equity_ratio, pivot: 1,876,704,451,274,368, upperBound: 1,876,704,451,274,368, lag: 0",
"003" :"[checkpoint] table: equity_ratio, pivot: 2,502,272,601,699,157, upperBound: 2,502,272,601,699,157, lag: 0",
"004" :"[checkpoint] table: equity_ratio, pivot: 3,127,840,752,123,946, upperBound: 3,127,840,752,123,946, lag: 0",
"005" :"[checkpoint] table: equity_ratio, pivot: 3,753,408,902,548,735, upperBound: 3,753,408,902,548,735, lag: 0",
"006" :"[checkpoint] table: equity_ratio, pivot: 4,378,977,052,973,524, upperBound: 4,378,977,052,973,524, lag: 0",
"007" :"[checkpoint] table: equity_ratio, pivot: 5,004,545,203,398,313, upperBound: 5,004,545,203,398,313, lag: 0",
"008" :"[checkpoint] table: equity_ratio, pivot: 5,630,113,353,823,102, upperBound: 5,630,113,353,823,102, lag: 0",
"009" :"[checkpoint] table: equity_ratio, pivot: 6,255,681,504,247,891, upperBound: 6,255,681,504,247,891, lag: 0",
"010" :"[checkpoint] table: equity_ratio, pivot: 6,881,249,654,672,680, upperBound: 6,881,249,654,672,680, lag: 0",
"011" :"[checkpoint] table: equity_ratio, pivot: 7,506,817,805,097,469, upperBound: 7,506,817,805,097,469, lag: 0",
"012" :"[checkpoint] table: equity_ratio, pivot: 8,132,385,955,522,258, upperBound: 8,132,385,955,522,258, lag: 0",
"013" :"[checkpoint] table: equity_ratio, pivot: 8,757,954,105,947,047, upperBound: 8,757,954,105,947,047, lag: 0",
"014" :"[checkpoint] table: equity_ratio, pivot: 9,383,522,256,371,836, upperBound: 9,383,522,256,371,836, lag: 0",
"015" :"[checkpoint] table: equity_ratio, pivot: 10,009,090,356,663,400, upperBound: 10,009,090,406,796,625, lag: 50,133,225" }



alter table hudi_ads.cooperation_partner drop partition(pt=0);
alter table hudi_ads.cooperation_partner_diff drop partition(pt=0);
alter table hudi_ads.cooperation_partner drop partition(pt=1);
alter table hudi_ads.cooperation_partner_diff drop partition(pt=1);


truncate table hudi_ads.cooperation_partner;
truncate table hudi_ads.cooperation_partner_diff;


alter table hudi_ads.cooperation_partner partition(pt=1) rename to partition(pt=0);



select * from hudi_ads.cooperation_partner where pt=0
and boss_human_pid = '001U9MR09RKBKBS09'
and partner_human_pid = '00139MR09R5B07SMU'
and company_gid = 2344040450
;


SELECT t.*
          FROM hudi_ads.cooperation_partner t
          WHERE pt=20240513 and boss_identity like '%股东(持股%' and boss_shares is null
          LIMIT 100
          ;


SELECT count(1)
          FROM hudi_ads.cooperation_partner t
          WHERE pt=0 and boss_identity like '%股东(持股%' and boss_shares is null
          LIMIT 100
          ;


select boss_human_pid,boss_human_pid from hudi_ads.cooperation_partner_diff where pt=20240510
and boss_human_pid = 'Q0Q9YMV00KENQH40U'
and partner_human_pid = '90FDRML09G1L2NTN2'
and company_gid = 289862943;


drop table hudi_ads.cooperation_partner_diff;
CREATE TABLE `cooperation_partner_diff`(     
  boss_human_pid string,
  partner_human_pid string,
  company_gid decimal(20,0),                                       
  `_boss_human_gid_` decimal(20,0) COMMENT '老板gid',                          
  `_boss_human_pid_` string COMMENT '老板pid',                                 
  `_boss_human_name_` string COMMENT '老板名称',                               
  `_boss_identity_` string COMMENT '老板身份',                                 
  `_boss_shares_` decimal(32,12) COMMENT '老板持股(分)',                       
  `_company_gid_` decimal(20,0) COMMENT '公司gid',                             
  `_company_name_` string COMMENT '公司名称',                                  
  `_company_registered_status_` string COMMENT '公司经营状态',                 
  `_company_registered_capital_` decimal(20,0) COMMENT '公司注册资本(分)',     
  `_s_` int COMMENT '计算公式中的S, 公司为注吊销, 则为0, 否则为1',             
  `_partner_human_gid_` decimal(20,0) COMMENT '合作伙伴gid',                   
  `_partner_human_pid_` string COMMENT '合作伙伴pid',                          
  `_partner_human_name_` string COMMENT '合作伙伴名称',                        
  `_partner_identity_` string COMMENT '合作伙伴身份',                          
  `_partner_shares_` decimal(32,12) COMMENT '合作伙伴持股(分)',                
  `_single_cooperation_score_` decimal(32,12) COMMENT '单次合作深度',          
  `_multi_cooperation_score_` decimal(32,12) COMMENT '综合合作深度',           
  `_single_cooperation_row_number_` int COMMENT '单次合作深度排序',            
  `_multi_cooperation_dense_rank_` int COMMENT '综合合作深度排序',             
  `_cooperation_times_with_this_partner_` int COMMENT '老板与该伙伴合作次数',  
  `_cooperation_times_with_all_partner_` int COMMENT '老板与所有伙伴合作次数', 
  `_total_partners_` int COMMENT '老板所有合作伙伴数')                         
PARTITIONED BY (                                                             
  `pt` int COMMENT 'yyyyMMdd')                                               

