use db_mini_project_1;

-- 1  
select a.topicid,b.description,count(a.blurtid) as BlurtID_Count
from blurt_analysis a
inner join topic b on a.topicid=b.id
group by topicid
order by topicid;

