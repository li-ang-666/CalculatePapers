with
-- 老数据
t1 as(
  select
    boss_human_pid,
    company_gid,
    partner_human_pid,
    md5(concat(
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
    )) cipher
  from hudi_ads.cooperation_partner where pt = 0
),
-- 新数据
t2 as(
  select
    boss_human_pid,
    company_gid,
    partner_human_pid,
    md5(concat(
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
    )) cipher,
      boss_human_gid as _boss_human_gid_,
      boss_human_pid as _boss_human_pid_,
      boss_human_name as _boss_human_name_,
      boss_identity as _boss_identity_,
      boss_shares as _boss_shares_,
      company_gid as _company_gid_,
      company_name as _company_name_,
      company_registered_status as _company_registered_status_,
      company_registered_capital as _company_registered_capital_,
      s as _s_,
      partner_human_gid as _partner_human_gid_,
      partner_human_pid as _partner_human_pid_,
      partner_human_name as _partner_human_name_,
      partner_identity as _partner_identity_,
      partner_shares as _partner_shares_,
      single_cooperation_score as _single_cooperation_score_,
      multi_cooperation_score as _multi_cooperation_score_,
      single_cooperation_row_number as _single_cooperation_row_number_,
      multi_cooperation_dense_rank as _multi_cooperation_dense_rank_,
      cooperation_times_with_this_partner as _cooperation_times_with_this_partner_,
      cooperation_times_with_all_partner as _cooperation_times_with_all_partner_,
      total_partners as _total_partners_
  from hudi_ads.cooperation_partner where pt = $pt
)
insert overwrite table hudi_ads.cooperation_partner_diff partition(pt = $pt)
select
  -- unique key 有新取新, 无新取旧
  nvl(t2.boss_human_pid, t1.boss_human_pid) boss_human_pid,
  nvl(t2.partner_human_pid, t1.partner_human_pid) partner_human_pid,
  nvl(t2.company_gid, t1.company_gid) company_gid,
  -- values 恒取最新
  t2._boss_human_gid_,
  t2._boss_human_pid_,
  t2._boss_human_name_,
  t2._boss_identity_,
  t2._boss_shares_,
  t2._company_gid_,
  t2._company_name_,
  t2._company_registered_status_,
  t2._company_registered_capital_,
  t2._s_,
  t2._partner_human_gid_,
  t2._partner_human_pid_,
  t2._partner_human_name_,
  t2._partner_identity_,
  t2._partner_shares_,
  t2._single_cooperation_score_,
  t2._multi_cooperation_score_,
  t2._single_cooperation_row_number_,
  t2._multi_cooperation_dense_rank_,
  t2._cooperation_times_with_this_partner_,
  t2._cooperation_times_with_all_partner_,
  t2._total_partners_
from t1
full outer join t2
  on t1.boss_human_pid = t2.boss_human_pid
  and t1.partner_human_pid = t2.partner_human_pid
  and t1.company_gid = t2.company_gid
where t1.cipher <> t2.cipher