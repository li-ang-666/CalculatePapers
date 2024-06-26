drop table test.company_bid_plus;
CREATE TABLE `company_bid_plus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uuid` varchar(50) NOT NULL DEFAULT '' COMMENT 'UUID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `link` varchar(255) NOT NULL DEFAULT '' COMMENT '详细信息链接',
  `intro` varchar(255) NOT NULL DEFAULT '' COMMENT '正文简介',
  `abs` longtext NOT NULL COMMENT '摘要信息',
  `content` longtext NOT NULL COMMENT '正文信息',
  `publish_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  `purchaser` varchar(255) NOT NULL DEFAULT '' COMMENT '采购人',
  `proxy` varchar(255) NOT NULL DEFAULT '' COMMENT '代理机构',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除, 0 非删除, 1 删除, 2 hidden',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省份',
  `base` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `items` varchar(255) NOT NULL DEFAULT '',
  `post_result` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='招投标信息';
