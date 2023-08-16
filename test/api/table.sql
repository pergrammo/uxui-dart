CREATE TABLE `member` (
  `id` int NOT NULL auto_increment,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `insert_date` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;