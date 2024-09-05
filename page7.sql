drop table company_bid;
CREATE TABLE `company_bid` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(50) NOT NULL COMMENT 'uuid',
  `title` varchar(500) NOT NULL DEFAULT '' COMMENT '标题',
  `content` longtext NOT NULL COMMENT '正文信息',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `deleted` tinyint DEFAULT '0' COMMENT '是否删除 0 非删除 1 删除 2 屏蔽',
  PRIMARY KEY (`id`),
  KEY idx_uuid(`uuid`),
  KEY idx_title(`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='招投标数据';
