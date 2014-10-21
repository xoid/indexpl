mysqladmin create indexpl 2>/dev/null

mysql -e "GRANT ALL PRIVILEGES ON indexpl.* TO 'indexpl'@'localhost' IDENTIFIED BY 'indexpl';"

cat<<EOF|mysql -f -u indexpl -pindexpl indexpl
CREATE TABLE post
(
	id 		   	MEDIUMINT  not null auto_increment,
	parent_id   MEDIUMINT auto_increment,
	title		varchar(64),
	url			varchar(64),
	created		datetime,
	text		varchar(8000),
	PRIMARY KEY (id)
);

CREATE TABLE post_tag_lnk
(
	post_id MEDIUMINT  not null auto_increment,
	tag		VARCHAR(255),
	PRIMARY KEY (post_id)
);

                              
EOF
                                