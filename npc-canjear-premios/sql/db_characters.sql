DROP TABLE `redemption`;

CREATE TABLE `redemption` (
	`passphrase` VARCHAR(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
	`type` INT(32) NOT NULL DEFAULT '0',
	`entry` INT(32) NOT NULL DEFAULT '0',
	`count` INT(32) NOT NULL DEFAULT '0',
	`redeemed` INT(32) NOT NULL DEFAULT '0',
	`player_guid` INT(32) DEFAULT NULL,
	`date` VARCHAR(32) DEFAULT NULL,
	PRIMARY KEY (`passphrase`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
