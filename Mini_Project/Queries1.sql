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
select b.name, a.email,(select count(follower) from follow where followee=a.email) as 'Follower Count' from vendor_ambassador a 
inner join vendor b on a.vendorid=b.id
order by b.name;

-- 6 
    create or replace view ads_perUser_perTopic as
    select u.email, ut.topicid, count(adid) as nr_of_ads
    from user_ad u left join 
    (select email, topicid
    from blurt_analysis
    group by email, topicid) as ut on u.email = ut.email
    group by u.email, ut.topicid;
    select * from ads_perUser_perTopic;
    select count(distinct(email)) from ads_perUser_perTopic;
    
    
    create or replace view blurts_perUser_perTopic as
    select email, topicid, count(blurtid) as nr_of_blurts
    from blurt_analysis
    group by email, topicid;
    
--     select * from blurts_perUser_perTopic;
--     select count(distinct(email)) from blurts_perUser_perTopic;
    
select v.name, count(distinct(b.email)) as ad_gap
from (blurts_perUser_perTopic b left join ads_perUser_perTopic a  on b.email = a.email and b.topicid = a.topicid)
	left join vendor_topics vt on (b.topicid = vt.topicid)
    left join vendor v on (vt.vendorid = v.id)
    where a.email is NULL or a.topicid is NULL
    group by v.name
    order by ad_gap desc;
    
-- select b.email, a.email, b.topicid, a.nr_of_ads, b.nr_of_blurts
-- from (blurts_perUser_perTopic b left join ads_perUser_perTopic a  on b.email = a.email)
-- where a.email is NULL;

-- 7

  select follower,followee
 from follow;
 
 create or replace view view_follow as
 select follower, followee
 from follow
 order by follower;
 
 create or replace view view_results as
select a.email as follower,b.email as followee
from blurt_analysis as a,blurt_analysis as b 
-- inner join follow c
-- inner join view_follow d on a.email = d.followee
where a.topicid=b.topicid
and a.email <> b.email
-- and a.topicid='6'
order  by a.email;

select distinct b.follower, b.followee, c.name,d.name from view_follow a
right join view_results b
on a.follower=b.follower and a.followee=b.followee
inner join user c on c.email = b.follower
inner join user d on d.email = b.followee
where a.follower is null;

select * from follow where follower='Albert_Larson@hotmail.com' and followee='Albert_Karipova@gmail.com';
-- 
-- 
--  create or replace view view_results as
-- SELECT *
-- FROM (SELECT email,topicid FROM blurt_analysis) AS T1
-- inner JOIN (SELECT email,topicid FROM blurt_analysis) AS T2
-- ON T1.topicid=T2.topicid and (t1.email<>t2.email);
-- 
-- WHERE  T1.email not in
-- (
--     SELECT follower
--     FROM follow T3
--     WHERE T2.email = T3.follower
-- )
-- ORDER BY t2.email;

-- Query 8
-- create or replace view view_first as
-- SELECT  distinct A.NAME as 'follower', B.NAME as 'followee', A.email as 'follower_email', B.email as 'followee_email'
-- FROM USER A, USER B,FOLLOW F1, FOLLOW F2
-- WHERE A.EMAIL = F1.FOLLOWER 
-- AND F1.FOLLOWEE = B.EMAIL;
-- 
-- select *
-- from view_first A,user c, follow B 
-- where A.followee=B.follower
-- and B.followee=c.email;

select distinct a.name,b.name,c.name,a.email,b.email,c.email
from 
user as a inner join user as b on a.email<>b.email
inner join user c on a.email<>c.email and b.email<>c.email
inner join follow as f1, follow as f2, follow as f3
where a.email=f1.follower
and f1.followee=b.email
and f2.followee=c.email
and b.email = f2.follower
and a.email=f3.follower
and c.email<>f3.followee
and a.name='Albert Helibron';

-- Query 9
select * from blurt_analysis;

create or replace view view_topic_count as
select a.topicid,avg(a.sentiment) as avg_sentiment, b.location, count(b.blurtid) as blurt_count
from blurt_analysis a inner join blurt b on a.blurtid=b.blurtid
group by a.topicid,b.location
order by avg_sentiment;

select distinct a.topicid, d.description, b.location, b.blurt_count, b.avg_sentiment from blurt_analysis a inner join view_topic_count b on b.topicid=a.topicid
inner join topic d on d.id=a.topicid
where b.avg_sentiment<0;

