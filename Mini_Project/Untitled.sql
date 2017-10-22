create database db_mini_project_1;
use db_mini_project_1;
SET FOREIGN_KEY_CHECKS=0; 
drop table user;
SET FOREIGN_KEY_CHECKS=1; 

create table user
	(email		varchar(30),
	 password		varchar(7),
	 name		varchar(30),
	 date_of_birth varchar(10),
     address varchar(30),
     type varchar(2),
     PRIMARY key (email)
	)ENGINE=InnoDB DEFAULT CHARSET=latin1;
    
    
	LOAD DATA LOCAL INFILE '/Users/balaji/Documents/github/Data Engineering/Mini Project/csvdata/user.csv' INTO TABLE USER COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n';

    
    
    show tables;
    SELECT * FROM USER;


