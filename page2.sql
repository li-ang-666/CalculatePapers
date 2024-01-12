

admin set frontend config("disable_balance" = "true");
admin set frontend config("disable_colocate_balance" = "true");
admin set frontend config("disable_tablet_scheduler" = "true");

admin set frontend config("disable_balance" = "false");
admin set frontend config("disable_colocate_balance" = "false");
admin set frontend config("disable_tablet_scheduler" = "false");

./spark-submit.sh 

doris --sql "insert into test_db.unique_test select date_format(date_add(current_date(),-1),'yyyyMMdd') pt, id, company_name name from hudi_ods.company_index limit 1000000" --parallelism 32


./test.sh --sql "insert into test_db.unique_test select date_format(date_add(current_date(),-1),'yyyyMMdd') pt, id, company_name name from hudi_ods.company_index" --parallelism 32

sql="${1}${2}${3}${4}"
insert_sql=$(echo "$sql" | grep -oE 'insert\s+into\s+\w+\.\w+')
res=$(echo "$insert_sql" | grep -oE '\w+\.\w+')

