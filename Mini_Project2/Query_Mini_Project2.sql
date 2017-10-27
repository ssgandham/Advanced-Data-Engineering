create database db_mini_project2;
use db_mini_project2;

CREATE TABLE artist(
 artist_id int(11) NOT NULL AUTO_INCREMENT,
 name varchar(45) DEFAULT NULL,
 birth_year int(11) DEFAULT NULL,
 country varchar(45) DEFAULT NULL,
 description varchar(45) DEFAULT NULL,
 primary key (artist_id)
);

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