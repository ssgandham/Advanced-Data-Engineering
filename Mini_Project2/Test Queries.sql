select * from artist;
use db_mini_project2;
show tables;
select * from artist;
select * from detail;
select * from gallery;
select * from image;
select * from gallery a inner join image b on a.gallery_id=b.gallery_id where a.name='Indian Gallery';

insert into gallery (name,description) values("German Gally","Gallery in Germany");

select a.image_id, a.title, a.link, c.type, c.width,c.height,c.location, c.description from image a inner join artist b on a.artist_id=b.artist_id inner join detail c on c.image_id = a.image_id where a.image_id = 1;

select * from image where image_id=1;
select a.image_id, a.title, b.name, a.link, c.type, c.width,c.height,c.location, c.description from image a inner join artist b on a.artist_id=b.artist_id inner join detail c on c.image_id = a.image_id where a.image_id = 1;
