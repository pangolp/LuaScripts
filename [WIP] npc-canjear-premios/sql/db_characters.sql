DROP TABLE IF EXISTS `premios`;

CREATE TABLE `premios` (
	`codigo` VARCHAR (32) NOT NULL,
	`entry_item` INT (32) NOT NULL,
	`count_item` INT (32) NOT NULL,
	`entregado` TINYINT(1) DEFAULT 0,
	`player_guid` INT (32) NULL,
	`player_name` VARCHAR (32) NULL,
	`pedido` VARCHAR (32) NULL,
	`alta` DATE DEFAULT NOW(),
	PRIMARY KEY (`codigo`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;
