select
	j."name",
	j.poolid ,
	p."name", 
	round (sum(j.jobbytes*1.0) / (1024.0^3),2) size_in_gb 
from job j
left join pool p on j.poolid =p.poolid 
where 
	j.purgedfiles=0 -- По идее ещё не очистились
	and j.poolid>0  -- По идее исключить ошибки и задания восстановления
group by j."name",j.poolid,p."name"
order by j."name" ;