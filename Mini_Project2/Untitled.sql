use db_data;
show databases;
use db_mini_project2;

show tables;
select * from artist;

select * from detail;
select * from gallery;
select *,count(*) from gallery a inner join image b on a.gallery_id=b.gallery_id where a.name='Indian Gallery';
select * from image;
select * from artist where country='USA';
select count(*) as count from image;
select * from detail a inner join image b on a.image_id=b.image_id where a.year>=1960 and a.year<=2000;

select * from detail a inner join image b on a.type='Fine Art';
select * from artist where birth_year=2000;

select * from detail a inner join image b on a.image_id=b.image_id where a.type='fine art';

select a.title, a.link, b.type, b.location, c.name as 'Artist Name' from image a inner join detail b on a.image_id=b.image_id inner join artist c on a.artist_id =  c.artist_id where b.location='' or c.name='ombalaji';


select a.title, a.link, b.type, b.location, c.name as 'Artist Name' from image a inner join detail b on a.image_id=b.image_id inner join artist c where b.location='' or c.name='ombalaji';

select a.title, a.link, b.type, b.location, c.name as 'Artist Name' from image a inner join detail b on a.image_id=b.image_id inner join inner join artist c where b.location='' or c.name='ombalaji';

select a.title, a.link, b.type, b.location, c.name as 'Artist Name' from image a inner join detail b on a.image_id=b.image_id inner join artist c on a.artist_id = c.artist_id where b.location='' or c.name='ombalaji';
select distinct a.title, a.link, b.type, b.location, c.name as 'Artist Name' from image a inner join detail b on a.image_id=b.image_id inner join artist c on a.artist_id=c.artist_id where b.location='usa' or c.name='';
