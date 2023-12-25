DROP TABLE IF EXISTS `company_base`.`cooperation_partner`;
CREATE TABLE `company_base`.`cooperation_partner`(
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `boss_human_gid` bigint unsigned DEFAULT NULL COMMENT '老板gid',
  `boss_human_pid` varchar(50) DEFAULT NULL COMMENT '老板pid',
  `boss_human_name` varchar(255) DEFAULT NULL COMMENT '老板名称',
  `boss_identity` varchar(255) DEFAULT NULL COMMENT '老板身份',
  `boss_shares` decimal(32,12) DEFAULT NULL COMMENT '老板持股(分)',
  `company_gid` bigint unsigned DEFAULT NULL COMMENT '公司gid',
  `company_name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `company_registered_status` varchar(255) DEFAULT NULL COMMENT '公司经营状态',
  `company_registered_capital` bigint unsigned DEFAULT NULL COMMENT '公司注册资本(分)',
  `s` tinyint DEFAULT NULL COMMENT '计算公式中的S, 公司为注吊销, 则为0, 否则为1',
  `partner_human_gid` bigint unsigned DEFAULT NULL COMMENT '合作伙伴gid',
  `partner_human_pid` varchar(50) DEFAULT NULL COMMENT '合作伙伴pid',
  `partner_human_name` varchar(255) DEFAULT NULL COMMENT '合作伙伴名称',
  `partner_identity` varchar(255) DEFAULT NULL COMMENT '合作伙伴身份',
  `partner_shares` decimal(32,12) DEFAULT NULL COMMENT '合作伙伴持股(分)',
  `single_cooperation_score` decimal(32,12) DEFAULT NULL COMMENT '单次合作深度',
  `multi_cooperation_score` decimal(32,12) DEFAULT NULL COMMENT '综合合作深度',
  `single_cooperation_row_number` int DEFAULT NULL COMMENT '单次合作深度排序',
  `multi_cooperation_dense_rank` int DEFAULT NULL COMMENT '综合合作深度排序',
  `cooperation_times_with_this_partner` int DEFAULT NULL COMMENT '老板与该伙伴合作次数',
  `cooperation_times_with_all_partner` int DEFAULT NULL COMMENT '老板与所有伙伴合作次数',
  `total_partners` int DEFAULT NULL COMMENT '老板所有合作伙伴数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
  -- ,UNIQUE KEY `uniq_detail` (`boss_human_pid`,`partner_human_pid`,`company_gid`)
  -- ,KEY `idx_list` (`boss_human_pid`,`single_cooperation_row_number`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

alter table cooperation_partner
add unique key `uniq_detail` (`boss_human_pid`,`partner_human_pid`,`company_gid`),
add key `idx_list` (`boss_human_pid`,`single_cooperation_row_number`);
