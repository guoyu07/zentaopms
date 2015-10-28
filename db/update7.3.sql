ALTER TABLE `zt_action` CHANGE `extra` `extra` text COLLATE 'utf8_general_ci' NOT NULL AFTER `comment`;
ALTER TABLE `zt_release` ADD `leftBugs` text COLLATE 'utf8_general_ci' NOT NULL AFTER `bugs`;
ALTER TABLE `zt_release` ADD `status` varchar(20) COLLATE 'utf8_general_ci' NOT NULL DEFAULT 'normal' AFTER `desc`;
ALTER TABLE `zt_product` ADD `type` varchar(30) COLLATE 'utf8_general_ci' NOT NULL DEFAULT 'normal' AFTER `code`;

ALTER TABLE `zt_projectproduct` ADD `branch` mediumint(8) unsigned NOT NULL;
ALTER TABLE `zt_productplan` ADD `branch` mediumint(8) unsigned NOT NULL AFTER `product`;
ALTER TABLE `zt_build` ADD `branch` mediumint(8) unsigned NOT NULL AFTER `product`;
ALTER TABLE `zt_release` ADD `branch` mediumint(8) unsigned NOT NULL AFTER `product`;
ALTER TABLE `zt_bug` ADD `branch` mediumint(8) unsigned NOT NULL AFTER `product`;
ALTER TABLE `zt_case` ADD `branch` mediumint(8) unsigned NOT NULL AFTER `product`;
ALTER TABLE `zt_module` ADD `branch` mediumint(8) unsigned NOT NULL AFTER `root`;
ALTER TABLE `zt_story` ADD `branch` mediumint(8) unsigned NOT NULL AFTER `product`;

CREATE TABLE `zt_branch` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `product` mediumint unsigned NOT NULL,
  `name` varchar(255) COLLATE 'utf8_general_ci' NOT NULL,
  `deleted` enum('0','1') COLLATE 'utf8_general_ci' NOT NULL DEFAULT '0'
);
CREATE TABLE `zt_storystage` (
  `story` mediumint unsigned NOT NULL,
  `branch` mediumint unsigned NOT NULL,
  `stage` varchar(50) COLLATE 'utf8_general_ci' NOT NULL
);
