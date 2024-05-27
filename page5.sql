drop table test.lt;
create external table test.lt
(
    id                                  string,
    boss_human_gid                      string,
    boss_human_pid                      string,
    boss_human_name                     string,
    boss_identity                       string,
    boss_shares                         string,
    company_gid                         string,
    company_name                        string,
    company_registered_status           string,
    company_registered_capital          string,
    s                                   string,
    partner_human_gid                   string,
    partner_human_pid                   string,
    partner_human_name                  string,
    partner_identity                    string,
    partner_shares                      string,
    single_cooperation_score            string,
    multi_cooperation_score             string,
    single_cooperation_row_number       string,
    multi_cooperation_dense_rank        string,
    cooperation_times_with_this_partner string,
    cooperation_times_with_all_partner  string,
    total_partners                      string,
    create_time                         string,
    update_time                         string
)ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
STORED AS TEXTFILE
LOCATION 'obs://hadoop-obs/flink/test';

drop table test.lt2;
create external table test.lt2
(
    id                                  string,
    boss_human_gid                      string,
    boss_human_pid                      string,
    boss_human_name                     string,
    boss_identity                       string,
    boss_shares                         string,
    company_gid                         string,
    company_name                        string,
    company_registered_status           string,
    company_registered_capital          string,
    s                                   string,
    partner_human_gid                   string,
    partner_human_pid                   string,
    partner_human_name                  string,
    partner_identity                    string,
    partner_shares                      string,
    single_cooperation_score            string,
    multi_cooperation_score             string,
    single_cooperation_row_number       string,
    multi_cooperation_dense_rank        string,
    cooperation_times_with_this_partner string,
    cooperation_times_with_all_partner  string,
    total_partners                      string,
    create_time                         string,
    update_time                         string
)
STORED AS parquet
LOCATION 'obs://hadoop-obs/flink/pqt';



drop table test.group_empty;
create external table test.group_empty
(
company_id string,
company_name string
)ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
STORED AS TEXTFILE
LOCATION 'obs://hadoop-obs/flink/group';


select t1.*,t2.* from test.group_empty t1 left join test.tyc_group t2 on t1.company_id = t2.company_id order by t1.company_name;

select t1.*,t2.* from test.group_empty t1 left join test.tyc_group t2 on t1.company_id = t2.group_id order by t1.company_name;

