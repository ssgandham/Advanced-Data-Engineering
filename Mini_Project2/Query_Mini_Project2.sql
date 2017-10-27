create database db_mini_project2;
use db_mini_project2;

drop table artist;

CREATE TABLE artist(
 artist_id int(11) NOT NULL AUTO_INCREMENT,
 name varchar(45) DEFAULT NULL,
 birth_year int(11) DEFAULT NULL,
 country varchar(45) DEFAULT NULL,
 description varchar(45) DEFAULT NULL,
 primary key (artist_id)
);

insert into artist values(1, 'ombalaji', '1993', 'India', 'Indian Artist');
insert into artist values(2, 'john', '1960', 'USA Artist');
insert into artist values(3,'Marry','1970','Russia','Russian Artist');
insert into artist values(4,'Priya', 1980, 'France','France Artist');
insert into artist values(5,'Li', 1990, 'China','Chinese Artist');
insert into artist values(6,'Lincohn', 2000, 'Spain','Spanish Artist');
insert into artist values(7,'Joe', 2010, 'Hungary','Hungary Artist');
insert into artist values(8,'Jack', 2010, 'Japan','Japan Artist');
insert into artist values(9,'Sophia', 2000, 'Nigeria','Nigeria Artist');
insert into artist values(10,'Obama', 2000, 'Serbia','Serbia Artist');



CREATE TABLE `detail` (
`detail_id` int(11) NOT NULL AUTO_INCREMENT, `image_id` int(11) DEFAULT NULL,
`year` int(11) DEFAULT NULL,
`type` varchar(45) DEFAULT NULL,
`width` int(11) DEFAULT NULL,
`height` int(11) DEFAULT NULL,
`location` varchar(45) DEFAULT NULL, `description` varchar(45) DEFAULT NULL,
  
PRIMARY KEY (`detail_id`) );

CREATE TABLE `gallery` (
`gallery_id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(45) DEFAULT NULL,
`description` varchar(2000) DEFAULT NULL, PRIMARY KEY (`gallery_id`)
);

CREATE TABLE `image` (
`image_id` int(11) NOT NULL AUTO_INCREMENT, `title` varchar(45) DEFAULT NULL,
`link` varchar(200) DEFAULT NULL,
`gallery_id` int(11) DEFAULT NULL,
`artist_id` int(11) DEFAULT NULL,
`detail_id` int(11) DEFAULT NULL,
PRIMARY KEY (`image_id`)
);

show tables;