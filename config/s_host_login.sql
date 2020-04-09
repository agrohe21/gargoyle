SELECT t1.host_id, t2.host_name, t3."DATE", sum(t1.total_bytes)
	FROM public.f_bandwidth t1
	inner join public.dim_hosts t2 on t1.host_id = t2.host_id
	inner join public.dim_date  t3 on t3.date_key = t1.date_key
where (now() - interval '1days') >t3."DATE"
group by t1.host_id, t2.host_name, t3."DATE"
order by t1.host_id, t3."DATE" desc