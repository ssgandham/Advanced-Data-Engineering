use db_mini_project_1;

-- 1  
select a.topicid,b.description,count(a.blurtid) as BlurtID_Count
from blurt_analysis a
inner join topic b on a.topicid=b.id
group by topicid
order by topicid;


-- 2
select b.name, count(a.follower) 
from follow a inner join user b
on a.followee = b.email
group by (a.followee)
order by b.name;

-- 3
select a.name,count(b.blurtid) as blurt_count from user a
inner join blurt b
on a.email=b.email
where a.type='C'
group by (a.name)
order by blurt_count desc;

select * from user where type='C';
select * from blurt where email='Michael_Phelps@uss.net';
