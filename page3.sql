with
-- 老数据
t1 as(
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
    ) column_map,
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
  from hudi_ads.cooperation_partner_new where pt = 1
),
-- 新数据
t2 as(
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
    ) column_map,
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
  from hudi_ads.cooperation_partner_new where pt = $pt
)
insert overwrite table hudi_ads.cooperation_partner_diff partition(pt = $pt)
select
  -- unique key 有新取新, 无新取旧
  nvl(t2.boss_human_pid, t1.boss_human_pid) boss_human_pid,
  nvl(t2.company_gid, t1.company_gid) company_gid,
  nvl(t2.partner_human_pid, t1.partner_human_pid) partner_human_pid,
  -- values 恒取最新
  to_json(t2.column_map) column_map
from t1
full outer join t2 on t1.boss_human_pid = t2.boss_human_pid and t1.company_gid = t2.company_gid and t1.partner_human_pid = t2.partner_human_pid
where nvl(t1.cipher, 'NULL') <> nvl(t2.cipher, 'NULL')