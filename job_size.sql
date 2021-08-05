select
	j."name",
	round (sum(j.jobbytes*1.0) / (1024.0^3),2) size_in_gb 
from job j
where j.purgedfiles=0 
--and j.poolid>0 
group by j."name" 
order by j."name" ;