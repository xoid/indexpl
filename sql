mysqladmin create indexpl 2>/dev/null

mysql -e "GRANT ALL PRIVILEGES ON indexpl.* TO 'indexpl'@'localhost' IDENTIFIED BY 'indexpl';"

cat<<EOF|mysql -f -u indexpl -pindexpl indexpl
CREATE TABLE IF NOT EXISTS post
(
	id 		   	MEDIUMINT  not null auto_increment,
	parent_id   MEDIUMINT,
	title		varchar(64),
	url			varchar(64),
	created		datetime,
	text		varchar(8000),
	PRIMARY KEY (id)
);

DELETE FROM post WHERE id=1;
INSERT INTO post VALUES (1, NULL, 'Как мочить козла', 'kak_lechit_kozla', '2014-08-08', 'Just do ti!');

CREATE TABLE IF NOT EXISTS post_tag_lnk
(
	post_id MEDIUMINT  not null auto_increment,
	tag		VARCHAR(255),
	KEY (post_id)
);

DELETE FROM post_tag_lnk WHERE post_id=1;
INSERT INTO post_tag_lnk VALUES (1, 'goat');
INSERT INTO post_tag_lnk VALUES (1, 'cure');



                              
EOF
                                