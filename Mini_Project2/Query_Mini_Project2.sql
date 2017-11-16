create database db_mini_project2;
use db_mini_project2;

show tables;
drop table artist;
drop table detail;
drop table gallery;
drop table image;

CREATE TABLE artist(
 artist_id int(11) NOT NULL AUTO_INCREMENT,
 name varchar(45) DEFAULT NULL,
 birth_year int(11) DEFAULT NULL,
 country varchar(45) DEFAULT NULL,
 description varchar(45) DEFAULT NULL,
 primary key (artist_id)
);

insert into artist values(1, 'ombalaji', 1993, 'India', 'Indian Artist');
insert into artist values(2, 'john', 1960, 'USA','USA Artist');
insert into artist values(3,'Marry',1970,'Russia','Russian Artist');
insert into artist values(4,'Priya', 1980, 'France','France Artist');
insert into artist values(5,'Li', 1990, 'China','Chinese Artist');
insert into artist values(6,'Lincohn', 2000, 'Spain','Spanish Artist');
insert into artist values(7,'Joe', 2010, 'Hungary','Hungary Artist');
insert into artist values(8,'Jack', 2010, 'Japan','Japan Artist');
insert into artist values(9,'Sophia', 2000, 'Nigeria','Nigeria Artist');
insert into artist values(10,'Obama', 2000, 'Serbia','Serbia Artist');

select * from detail;

CREATE TABLE `detail` (
`detail_id` int(11) NOT NULL AUTO_INCREMENT, 
`image_id` int(11) DEFAULT NULL,
`year` int(11) DEFAULT NULL,
`type` varchar(45) DEFAULT NULL,
`width` int(11) DEFAULT NULL,
`height` int(11) DEFAULT NULL,
`location` varchar(45) DEFAULT NULL, 
`description` varchar(45) DEFAULT NULL,
  
PRIMARY KEY (`detail_id`) );


insert into detail values(1,1,1993,'Fine Art', 20,30, 'India','Indian Art');
insert into detail values(2,2,1960,'Visual Art', 20,30, 'USA', 'USA Art');
insert into detail values(3,3,1970,'Decorative Art', 20,30, 'Russia', 'Russian Art');
insert into detail values(4,4,1980,'Fine Art', 20,30, 'France','France Art');
insert into detail values(5,5,1990,'Applied Art', 20,30, 'China','Chinese Art');
insert into detail values(6,6,2000,'Craft', 20,30, 'Spain', 'Spanish Art');
insert into detail values(7,7,2010,'Visual Art', 20,30, 'Hungary','Hungary Art');
insert into detail values(8,8,2010,'Fine Art', 20,30, 'Japan', 'Japanese Art');
insert into detail values(9,9,2000,'Decorative Art', 20,30, 'Nigeria','Nigerian Art');
insert into detail values(10,10,1993,'Fine Art', 20,30, 'Siberia','Siberian Art');

CREATE TABLE `gallery` (
`gallery_id` int(11) NOT NULL AUTO_INCREMENT, 
`name` varchar(45) DEFAULT NULL,
`description` varchar(2000) DEFAULT NULL, 
PRIMARY KEY (`gallery_id`)
);

insert into gallery values(1, 'Indian Gallery', 'Gallery in India');
insert into gallery values(2, 'USA Gallery', 'Gallery in USA');
insert into gallery values(3, 'Russia Gallery', 'Gallery in Russia');
insert into gallery values(4, 'France Gallery', 'Gallery in France');
insert into gallery values(5, 'China Gallery', 'Gallery in China');
insert into gallery values(6, 'Spain Gallery', 'Gallery in Spain');
insert into gallery values(7, 'Hungary Gallery', 'Gallery in Hungary');
insert into gallery values(8, 'Japan Gallery', 'Gallery in Japan');
insert into gallery values(9, 'Nigeria Gallery', 'Gallery in Nigeria');
insert into gallery values(10, 'Siberia Gallery', 'Gallery in Siberia');

CREATE TABLE `image` (
`image_id` int(11) NOT NULL AUTO_INCREMENT, 
`title` varchar(45) DEFAULT NULL,
`link` varchar(200) DEFAULT NULL,
`gallery_id` int(11) DEFAULT NULL,
`artist_id` int(11) DEFAULT NULL,
`detail_id` int(11) DEFAULT NULL,
PRIMARY KEY (`image_id`)
);

insert into image values(1,'Img_India','http://www.ciarb.org/images/default-source/ciarb/our-network/landing/india-resized.jpg?sfvrsn=6',1,1,1);
insert into image values(2,'Img_USA','https://www.google.com/search?q=usa&source=lnms&tbm=isch&sa=X&ved=0ahUKEwj5gLGto5DXAhVJ42MKHWr6AyoQ_AUIDCgD&biw=1422&bih=781#imgrc=qup2Q7SbmYvwuM:',2,2,2);
insert into image values(3,'Img_Russia','https://www.hdwallpapers.in/walls/husqvarna_vitpilen_701_2018_4k-wide.jpg',3,3,3);
insert into image values(4,'Img_France','https://www.google.com/search?q=france+map&source=lnms&tbm=isch&sa=X&ved=0ahUKEwihgYeRpJDXAhUM32MKHVpGAS8Q_AUICygC&biw=1422&bih=781#imgrc=JgafQ1vhMCXTgM:',4,4,4);
insert into image values(5,'Img_China','https://www.travelchinaguide.com/images/map/china/china-map-9.jpg',5,5,5);
insert into image values(6,'Img_Spain','https://www.roughguides.com/wp-content/uploads/2015/05/area-map-of-spain.png',6,6,6);
insert into image values(7,'Img_Hungary','https://www.google.com/search?q=hungary+map&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjX0onFpJDXAhUP7GMKHc9eDpgQ_AUICygC&biw=1422&bih=781#imgrc=P7nwT-2pNMwXkM:',7,7,7);
insert into image values(8,'Img_Japan','https://www.roughguides.com/wp-content/uploads/2015/07/area%E2%80%93map%E2%80%93of%E2%80%93Japan.png',8,8,8);
insert into image values(9,'Img_Nigeria','https://www.mapsofworld.com/nigeria/maps/nigeria-map.gif',9,9,9);
insert into image values(10,'Img_Siberia','https://www.welt-atlas.de/datenbank/karten/karte-6-1017.gif',10,10,10);
show tables;