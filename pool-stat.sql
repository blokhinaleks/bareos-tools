--Статистика использования пулов хранения
select 
	p.poolid,
	p."name",
	p.labelformat, 
	p.numvols,
	p.maxvols,
	case 
		when p.numvols=0 then 0
		else round(p.numvols *100.0 /p.maxvols ,2)
	end as use_percent,
	p.maxvolbytes * p.maxvols /(1024^3) max_size_gb
from pool p 
order by p."name" ;