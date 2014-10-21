mysqladmin create indexphp 2>/dev/null

mysql -e "GRANT ALL PRIVILEGES ON indexphp.* TO 'indexphp'@'localhost' IDENTIFIED BY 'indexphp';"

cat<<EOF|mysql -f -u indexphp -pindexphp indexphp 
CREATE TABLE `Люди`
(
	`id`		MEDIUMINT  not null auto_increment,
	`Имя` 		varchar(32),
    `Полное имя` varchar(64),	
	`Статус` 	varchar(10),
	`Создан`	datetime,
	`Изменен`	timestamp,
	`Закрыт` 	datetime,
	`Возраст`	integer,
	`Фирмы_id`	integer
) ENGINE=MyISAM;

CREATE TABLE `Фирмы`
(
	`id` 		MEDIUMINT  not null auto_increment,
    `Имя`       varchar(32),
    `Полное имя` varchar(64),
    `Статус`    varchar(10),
    `Создан`    datetime,
    `Изменен`   timestamp,
    `Закрыт`    datetime,
	`Возраст`   integer,
	PRIMARY KEY (id)
) ENGINE=MyISAM;

CREATE TABLE `Заказы`
(
    `id`        MEDIUMINT  not null auto_increment,
	`Имя`       varchar(32),
	`Полное имя` varchar(64),
	`Заказчик`   	integer,
	`Исполнитель`	integer,
	`Статус`    varchar(10),
	`Создан`    datetime,
	`Изменен`   timestamp,
	`Закрыт`    datetime,
	`Сумма`     float,
	PRIMARY KEY (id)
) ENGINE=MyISAM;
                              
EOF
                                