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
select a.name,count(b.blurtid) as blurt_count from user 
inner join blurt b
on a.email=b.email
where a.type='C'
group by (a.name)
order by blurt_count desc;

-- 4
select name from user where email not in (select follower from follow) and type='C';

-- 5
select a.name, count(*) from vendor_ambassador a 
inner join vendor b on a.vendorid=b.id
inner join follow c on a.email=c.followee
group by (b.email);

-- 6 
select * from blurt_analysis a
inner join vendor_topics b on a.topicid=b.topicid
inner join vendor c on c.id=b.vendorid
group by c.name
order by a.confidence;
