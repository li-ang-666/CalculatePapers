use operating_info;
drop table if exists `company_bid_parsed_info_patch`;
CREATE TABLE if not exists `company_bid_parsed_info_patch` like `operating_info`.`company_bid_parsed_info`;
alter table  company_bid_parsed_info_patch
add column `party_a`               longtext comment '招标方',
add column `agent`                 longtext comment '代理方',
add column `tenderer`              longtext comment '投标方',
add column `candidate`             longtext comment '候选方',
add column `winner`                longtext comment '中标方',
add column `winner_amt`            longtext comment '中标金额',
add column `mention`               longtext comment '其他提及',
add column `item_no`               varchar(255) not null default '' comment '项目编号',
add column `bid_deadline`          datetime comment '投标截止时间',
add column `bid_download_deadline` datetime comment '标书获取截止时间',
add column `province`              varchar(50) not null default '' comment '省',
add column `city`                  varchar(50) not null default '' comment '市',
add column `publish_year`          int comment '发布年份',
add column `roles`                 longtext comment '所有涉及角色';
