with
-- 上市公司
listed_company as(
  select 
    company_id,
    stock_type
  from company_bond_plates
  where listed_status is not null and listed_status not in (0, 3, 5, 8, 9)
    and company_id is not null and company_id > 0
  group by company_id, stock_type
),
-- 非港股上市公司主要人员
listed_boss as(
  select
    t1.company_id company_id,
    t3.human_pid human_id,
    concat('1@', trim(max(t1.position_name))) identity,
    0 shares
  from senior_executive t1
  left semi join listed_company t2 on t1.company_id = t2.company_id and t2.stock_type <> 6
  join company_human_relation t3 on t1.company_id = t3.company_graph_id and t1.senior_executive_name = t3.human_name
  where t1.company_id is not null and t1.company_id > 0
    and t3.human_pid is not null and length(t3.human_pid) >= 17
    and t1.position_name is not null and trim(t1.position_name) <> ''
  group by t1.company_id, t3.human_pid
),
-- 港股上市公司主要人员
listed_hk_boss as(
  select
    t1.company_id company_id,
    t3.human_pid human_id,
    concat('1@', trim(max(t1.position_name))) identity,
    0 shares
  from senior_executive_hk t1
  left semi join listed_company t2 on t1.company_id = t2.company_id and t2.stock_type = 6
  join company_human_relation t3 on t1.company_id = t3.company_graph_id and t1.human_name = t3.human_name
  where t1.company_id is not null and t1.company_id > 0
    and t1.position_status is not null and t1.position_status = 0
    and t3.human_pid is not null and length(t3.human_pid) >= 17
    and t1.position_name is not null and trim(t1.position_name) <> ''
  group by t1.company_id, t3.human_pid
),
-- 非上市公司主要人员
not_listed_boss as(
  select
    t1.company_id company_id,
    t1.human_id human_id,
    concat('1@', trim(max(t1.personnel_position))) identity,
    0 shares
  from personnel t1
  left anti join listed_company t2 on t1.company_id = t2.company_id
  where t1.company_id is not null and t1.company_id > 0
    and t1.human_id is not null and length(t1.human_id) >= 17
    and t1.personnel_position is not null and trim(t1.personnel_position) <> ''
  group by t1.company_id, t1.human_id
),
-- 股东
shareholder as(
  select
    company_id_invested company_id,
    tyc_unique_entity_id_investor human_id,
    concat('2@股东(持股', format_ratio(max(equity_ratio)), ')') identity,
    max(equity_amount) shares
  from company_equity_relation_details t1
  where company_id_invested is not null and company_id_invested > 0
    and tyc_unique_entity_id_investor is not null and length(tyc_unique_entity_id_investor) >= 17
    and investor_identity_type is not null and investor_identity_type = 1
    and equity_ratio is not null and equity_ratio > 0
    and equity_amount is not null and equity_amount > 0
    and reference_pt_year is not null and reference_pt_year = 2023
  group by company_id_invested, tyc_unique_entity_id_investor
),
-- 法人
legal as(
  select
    company_id,
    legal_rep_human_id human_id,
    concat('3@', trim(max(legal_rep_display_name))) identity,
    0 shares
  from company_legal_person
  where company_id is not null and company_id > 0
    and legal_rep_human_id is not null and length(legal_rep_human_id) >= 17
    and legal_rep_type is not null and legal_rep_type = 2
    and legal_rep_display_name is not null and trim(legal_rep_display_name) <> ''
  group by company_id, legal_rep_human_id
),
-- 拼接
u as(
  select company_id, human_id, identity, shares from listed_boss
  union all
  select company_id, human_id, identity, shares from listed_hk_boss
  union all
  select company_id, human_id, identity, shares from not_listed_boss
  union all
  select company_id, human_id, identity, shares from shareholder
  union all
  select company_id, human_id, identity, shares from legal
),
-- 聚合
group_by_company_boss as(
  select
    company_id,
    human_id,
    collect_list(identity) identity,
    max(shares) shares
  from u
  group by company_id, human_id
),
-- 老板维表
dimension_boss as(
  select
    human_pid,
    trim(max(human_name)) human_name,
    max(human_graph_id) human_gid,
    min(id) human_dictionary
  from company_human_relation
  where human_pid is not null and length(human_pid) >= 17
    and human_graph_id is not null and human_graph_id > 0
    and human_name is not null and trim(human_name) <> ''
  group by human_pid
),
-- 维度补全
dimension_fill as(
  select
    t1.company_id,
    t1.human_id,
    t1.identity,
    t1.shares,
    max(t2.company_name) company_name,
    if(max(t4.reg_status) is not null and trim(max(t4.reg_status)) <> '', trim(max(t4.reg_status)),
      if(max(t2.company_registation_status) is not null and trim(max(t2.company_registation_status)) <> '', trim(max(t2.company_registation_status)), '其他')) company_registered_status,
    max(t2.register_capital_amt) company_registered_capital,
    max(t3.human_name) human_name,
    max(t3.human_gid) human_gid,
    min(t3.human_dictionary) human_dictionary,
    format_reg_st(
      if(max(t4.reg_status) is not null and trim(max(t4.reg_status)) <> '', trim(max(t4.reg_status)),
        if(max(t2.company_registation_status) is not null and trim(max(t2.company_registation_status)) <> '', trim(max(t2.company_registation_status)), '其他'))
    ) s
  from group_by_company_boss t1
  join company_index t2 on t1.company_id = t2.company_id
  join company_clean_info t4 on t2.id = t4.id
  join dimension_boss t3 on t1.human_id = t3.human_pid
  group by t1.company_id, t1.human_id, t1.identity, t1.shares
),
-- 全排列 & 单次合作深度
cross_join as(
  select
    -- 公司
    t1.company_id company_gid,
    t1.company_name company_name,
    t1.company_registered_status company_registered_status,
    t1.company_registered_capital company_registered_capital,
    t1.s,
    -- 老板
    t1.human_gid boss_human_gid,
    t1.human_id boss_human_pid,
    t1.human_name boss_human_name,
    t1.identity boss_identity,
    t1.shares boss_shares,
    -- 伙伴
    t2.human_gid partner_human_gid,
    t2.human_id partner_human_pid,
    t2.human_name partner_human_name,
    t2.identity partner_identity,
    t2.shares partner_shares,
    t2.human_dictionary partner_human_dictionary,
    -- 单次合作深度
    cast(
      (t1.s * if(log10(t1.shares) > 0, log10(t1.shares), 0) / 3 + 1) * size(t1.identity) +
      (t1.s * if(log10(t2.shares) > 0, log10(t2.shares), 0) / 3 + 1) * size(t2.identity)
    as decimal(32, 12)) single_cooperation_score
  from dimension_fill t1
  join dimension_fill t2 on t1.company_id = t2.company_id and t1.human_id <> t2.human_id
),
-- 合作次数 & 综合合作深度 & 单次合作深度排序
cooperation as(
  select
    *,
    count(1)                      over(partition by boss_human_pid, partner_human_pid) cooperation_times_with_this_partner,
    count(1)                      over(partition by boss_human_pid, partner_human_pid) +
    sum(single_cooperation_score) over(partition by boss_human_pid, partner_human_pid) multi_cooperation_score,
    row_number()                  over(partition by boss_human_pid, partner_human_pid order by single_cooperation_score desc, s desc, company_registered_capital desc, company_name asc, company_gid asc) single_cooperation_row_number
  from cross_join
),
-- 综合合作深度排序 & 总伙伴数 & 总合作次数
final as(
  select
    *,
    dense_rank()                             over(partition by boss_human_pid order by multi_cooperation_score desc, cooperation_times_with_this_partner desc, partner_human_name asc, partner_human_pid asc) multi_cooperation_dense_rank,
    count_distinct(partner_human_dictionary) over(partition by boss_human_pid) total_partners,
    count(1)                                 over(partition by boss_human_pid) cooperation_times_with_all_partner
  from cooperation
)
insert overwrite table hudi_ads.cooperation_partner_new partition(pt = ${pt})
select
  -- 老板
  boss_human_gid,
  boss_human_pid,
  boss_human_name,
  format_identity(concat_ws('、', sort_array(boss_identity))) boss_identity,
  if(boss_shares > 0, boss_shares, NULL) boss_shares,
  -- 公司
  company_gid,
  company_name,
  company_registered_status,
  if(company_registered_capital > 0, company_registered_capital, NULL) company_registered_capital,
  s,
  -- 伙伴
  partner_human_gid,
  partner_human_pid,
  partner_human_name,
  format_identity(concat_ws('、', sort_array(partner_identity))) partner_identity,
  if(partner_shares > 0, partner_shares, NULL) partner_shares,
  -- 合作深度
  single_cooperation_score,
  multi_cooperation_score,
  single_cooperation_row_number,
  multi_cooperation_dense_rank,
  -- 补加
  cooperation_times_with_this_partner,
  cooperation_times_with_all_partner,
  total_partners
from final where multi_cooperation_dense_rank <= 20