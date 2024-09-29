,46729694,47452367,47459274,47456975,47453092,47453766,47458474,47450648,47458731,46557760,47453900,47460110,47450328,47140163,47453088,47454510,47451132,47457404,45622678,47459891,47457149,47449980,47457973


drop table company_bond_plates                   ;
drop table company_clean_info                    ;
drop table company_equity_relation_details       ;
drop table company_human_relation                ;
drop table company_index                         ;
drop table company_legal_person                  ;
drop table entity_controller_details_new         ;
drop table personnel                             ;
drop table senior_executive                      ;
drop table senior_executive_hk                   ;
drop table shareholder_investment_ratio_total_new;


yarn app -kill application_1725250243649_370596
yarn app -kill application_1725250243649_370591	
yarn app -kill application_1725250243649_370590
yarn app -kill application_1725250243649_370585
yarn app -kill application_1725250243649_370580
yarn app -kill application_1725250243649_370578
yarn app -kill application_1725250243649_370555

drop table crowd.crowd_user_bitmap_bak;
create table crowd.crowd_user_bitmap_bak like crowd.crowd_user_bitmap;
insert into crowd.crowd_user_bitmap_bak select * from crowd.crowd_user_bitmap where create_timestamp >= 1727107200000;
drop table crowd.crowd_user_bitmap;
alter table crowd_user_bitmap_bak rename crowd_user_bitmap;


select * from ${tabl}