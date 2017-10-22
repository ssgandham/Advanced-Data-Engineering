create database db_mini_project_1;
use db_mini_project_1;
SET FOREIGN_KEY_CHECKS=0; 
drop table user;
drop table celebrity;
drop table blurt;
drop table hobby;
drop table follow;
drop table vendor;
drop table vendor_ambassador;
drop table topic;
drop table vendor_topics;
drop table blurt_analysis;
drop table advertisement;
drop table user_ad;
SET FOREIGN_KEY_CHECKS=1; 

create table user
	(email		varchar(30) not null,
	 password		varchar(30),
	 name		varchar(30),
	 date_of_birth varchar(10),
     address varchar(30),
     type varchar(2),
     PRIMARY key (email)
	)ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
    create table celebrity
	(email		varchar(30) not null,
	 website		varchar(30),
	 kind		varchar(30),
     PRIMARY key (email)
	)ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
	create table blurt
	(blurtid		varchar(30) not null,
    email		varchar(30) not null,
	 text		varchar(100),
	 location		varchar(30),
	 time		varchar(10),
     PRIMARY key (blurtid,email),
      foreign key (email) references user(email)
		on delete cascade on update no action
	)ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
    create table hobby
    (email varchar(30) not null,
    hobby varchar(30) not null,
    primary key(hobby,email),
    foreign key (email) references  user(email)
    on delete cascade on update no action)
    ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
	create table follow
    (follower varchar(30) not null,
    followee varchar(30) not null,
    primary key(follower,followee),
    foreign key (follower) references  user(email),
    foreign key(followee) references user(email)
    on delete cascade on update no action)
    ENGINE=InnoDB DEFAULT CHARSET=latin1; 
    
    create table vendor
    (id varchar(30) not null,
    name varchar(30),
    primary key(id)
    )engine=InnoDB default charset=latin1;
    
    create table vendor_ambassador(
    vendorid varchar(30) not null,
    email varchar(30) not null,
    primary key(vendorid,email),
    foreign key(email) references user(email),
    foreign key(vendorid) references vendor(id)
    on delete cascade on update no action
    )engine=InnoDB default charset=latin1;
    
    create table topic(
    id varchar(30),
    description varchar(30),
    primary key(id)
    )engine=InnoDB default charset=latin1;
    
	create table vendor_topics(
    vendorid varchar(30) not null,
    topicid varchar(30) not null,
    primary key(vendorid,topicid),
    foreign key(vendorid) references vendor(id) ,
    foreign key(topicid) references topic(id)
    on delete cascade on update no action
    )engine=InnoDB default charset=latin1;
    
    create table blurt_analysis(
    email varchar(30) not null,
    blurtid varchar(30) not null,
    topicid varchar(30) not null,
    confidence varchar(30) check(confidence>=0 and confidence<=10),
    sentiment varchar(30) check (sentiment>=-5 and sentiment<=5),
    primary key(email, blurtid,topicid),
    foreign key(blurtid,email) references blurt(blurtid,email) on delete cascade on update no action,
    foreign key(topicid) references topic(id)
    on delete cascade on update no action
    )engine=InnoDB default charset=latin1;
    
    
    create table advertisement(
    id varchar(30),
    content varchar(60),
    vendorid varchar(30),
    primary key(id),
    foreign key(vendorid) references vendor(id) 
    )engine=InnoDB default charset=latin1;
    
    create table user_ad(
    email varchar(30),
    adid varchar(30),
    primary key(email,adid),
    foreign key(email)  references user(email),
    foreign key(adid) references advertisement(id)
    )engine=InnoDb default charset=latin1;
    
	LOAD DATA LOCAL INFILE '/Users/balaji/Documents/github/DataEngineering/Mini_Project/csvdata/user.csv' INTO TABLE user COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
	LOAD DATA LOCAL INFILE '/Users/balaji/Documents/github/DataEngineering/Mini_Project/csvdata/celebrity.csv' INTO TABLE celebrity COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
	LOAD DATA LOCAL INFILE '/Users/balaji/Documents/github/DataEngineering/Mini_Project/csvdata/blurt.csv' INTO TABLE blurt COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
	LOAD DATA LOCAL INFILE '/Users/balaji/Documents/github/DataEngineering/Mini_Project/csvdata/hobby.csv' INTO TABLE hobby COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
	LOAD DATA LOCAL INFILE '/Users/balaji/Documents/github/DataEngineering/Mini_Project/csvdata/follow.csv' INTO TABLE follow COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
	LOAD DATA LOCAL INFILE '/Users/balaji/Documents/github/DataEngineering/Mini_Project/csvdata/vendor.csv' INTO TABLE vendor COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
	LOAD DATA LOCAL INFILE '/Users/balaji/Documents/github/DataEngineering/Mini_Project/csvdata/vendor_ambassador.csv' INTO TABLE vendor_ambassador COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
	LOAD DATA LOCAL INFILE '/Users/balaji/Documents/github/DataEngineering/Mini_Project/csvdata/topic.csv' INTO TABLE topic COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
	LOAD DATA LOCAL INFILE '/Users/balaji/Documents/github/DataEngineering/Mini_Project/csvdata/vendor_topic.csv' INTO TABLE vendor_topics COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
	LOAD DATA LOCAL INFILE '/Users/balaji/Documents/github/DataEngineering/Mini_Project/csvdata/blurt_analysis.csv' INTO TABLE blurt_analysis COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
	LOAD DATA LOCAL INFILE '/Users/balaji/Documents/github/DataEngineering/Mini_Project/csvdata/advertisement.csv' INTO TABLE advertisement COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
	LOAD DATA LOCAL INFILE '/Users/balaji/Documents/github/DataEngineering/Mini_Project/csvdata/user_ad.csv' INTO TABLE user_ad COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';
	
    
    
    show tables;
    SELECT * FROM blurt;


