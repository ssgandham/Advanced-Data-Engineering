select * from artist;
use db_mini_project2;
show tables;
select * from artist;
select * from detail;
select * from gallery;
select * from image;

select * from image a inner join artist b on a.artist_id=b.artist_id where b.name = 'sit';
update image set link='http://www.planwallpaper.com/static/images/canberra_hero_image_JiMVvYU.jpg' where image_id=3;
select * from gallery a inner join image b on a.gallery_id=b.gallery_id where a.name='Indian Gallery';

insert into gallery (name,description) values("German Gally","Gallery in Germany");

select a.image_id, a.title, a.link, c.type, c.width,c.height,c.location, c.description from image a inner join artist b on a.artist_id=b.artist_id inner join detail c on c.image_id = a.image_id where a.image_id = 1;

select * from image where image_id=1;

select a.image_id, a.title, b.name, a.link, c.type, c.width,c.height,c.location, c.description from image a inner join artist b on a.artist_id=b.artist_id inner join detail c on c.image_id = a.image_id where a.image_id = 1;

insert into image (title) values("a");

select * from gallery a inner join image b on a.gallery_id=b.gallery_id;

select distinct gallery_id, name, description from gallery;
select * from gallery a inner join image b on a.gallery_id=b.gallery_id where a.gallery_id=5;

select distinct gallery_id, name, description from gallery;
select * from gallery a inner join image b on a.gallery_id=b.gallery_id where a.gallery_id=1;

select * from image a inner join artist b on a.artist_id=b.artist_id where a.image_id=31;
select * from image a inner join artist b on a.artist_id=b.artist_id where a.image_id=32;


select distinct a.title, a.link, b.type, b.location, c.name as 'Artist Name' from image a inner join detail b on a.image_id=b.image_id inner join artist c on a.artist_id=c.artist_id where b.location='' or c.name='sit';
select * from image a inner join detail b on a.detail_id=b.detail_id where b.location = 'Swaziland';
select * from image a inner join detail b on a.image_id=b.image_id where b.location = 'Syrian Arab Republic';

select a.image_id, a.title, b.name, a.link, c.type, c.width,c.height,c.location, c.description from image a inner join artist b on a.artist_id=b.artist_id inner join detail c on c.image_id = a.image_id where a.image_id = 31;