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
 select followee,followeer
 from follow
 order by folloee;
 
select *
from blurt_analysis as a,blurt_analysis as b 
inner join follow c
inner join view_follow d on a.email = d.followee
where a.topicid=b.topicid
and a.email <> b.email
order  by a.email;


