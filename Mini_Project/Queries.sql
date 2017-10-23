use db_mini_project_1;

-- 1  
select count(blurtid) as count, topicid
from blurt_analysis
order by topicid;