drop table if exists hudi_ads.cooperation_partner_new;
create table if not exists hudi_ads.cooperation_partner_new(
  -- 老板
  boss_human_gid decimal(20, 0) comment '老板gid',
  boss_human_pid string comment '老板pid',
  boss_human_name string comment '老板名称',
  boss_identity string comment '老板身份',
  boss_shares decimal(32, 12) comment '老板持股(分)',
  -- 公司
  company_gid decimal(20, 0) comment '公司gid',
  company_name string comment '公司名称',
  company_registered_status string comment '公司经营状态',
  company_registered_capital decimal(20, 0) comment '公司注册资本(分)',
  s int comment '计算公式中的S, 公司为注吊销, 则为0, 否则为1',
  -- 伙伴
  partner_human_gid decimal(20, 0) comment '合作伙伴gid',
  partner_human_pid string comment '合作伙伴pid',
  partner_human_name string comment '合作伙伴名称',
  partner_identity string comment '合作伙伴身份',
  partner_shares decimal(32, 12) comment '合作伙伴持股(分)',
  -- 合作深度
  single_cooperation_score decimal(32, 12) comment '单次合作深度',
  multi_cooperation_score decimal(32, 12) comment '综合合作深度',
  single_cooperation_row_number int comment '单次合作深度排序',
  multi_cooperation_dense_rank int comment '综合合作深度排序',
  -- 补加
  cooperation_times_with_this_partner int comment '老板与该伙伴合作次数',
  cooperation_times_with_all_partner int comment '老板与所有伙伴合作次数',
  total_partners int comment '老板所有合作伙伴数'
)partitioned by (pt int comment 'yyyyMMdd');

drop table if exists hudi_ads.cooperation_partner_diff;
create table if not exists hudi_ads.cooperation_partner_diff(
  -- 老板
  boss_human_gid decimal(20, 0) comment '老板gid',
  -- 公司
  company_gid decimal(20, 0) comment '公司gid',
  -- 伙伴
  partner_human_gid decimal(20, 0) comment '合作伙伴gid',
  -- 其他
  column_map string comment 'columnMap',
  old_cipher string comment '旧表的cipher',
  new_cipher string comment '新表的cipher'
)partitioned by (pt int comment 'yyyyMMdd');
