SELECT sum(total_bytes), t3.host_owner
	FROM public.f_bandwidth t1
	inner join dim_date t2 on t2.date_key = t1.date_key
	inner join dim_hosts t3 on t3.host_id = t1.host_id
	where t2."YEAR" = 2020
	  and t2.month_year  = 3
	  and t2.day_month = 31
	  and t2.hour_day = 8
group by t3.host_owner

SELECT sum(session_total_mbytes), t3.host_owner
	FROM public.f_session t1
	inner join dim_date t2 on t2.date_key = t1.session_start_date_key
	inner join dim_hosts t3 on t3.host_id = t1.host_id
	where t2."YEAR" = 2020
	  and t2.month_year  = 3
	  and t2.day_month = 31
	  and t2.hour_day = 8
group by t3.host_owner