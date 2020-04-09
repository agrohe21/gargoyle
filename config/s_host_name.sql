SELECT host_name, hour_year, sum(upload_bytes), sum(download_bytes), sum(total_bytes)/1024/1024 as totalMB
	FROM public.f_bandwidth t1
	inner join public.dim_hosts t2 on t1.host_id = t2.host_id
	inner join public.dim_date  t3 on t3.date_key = t1.date_key
	where host_name like 'mckinley%'
group by host_name, hour_year
order by 5 desc