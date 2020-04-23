--Session counts on bandwidth
select "YEAR", month_year, day_month, hour_day, count(distinct session_id)
from f_bandwidth t1
inner join dim_date t2 on t2.date_key = t1.date_key
group by "YEAR", month_year, day_month, hour_day
order by "YEAR" desc, month_year desc, day_month desc, hour_day desc

--null sessions on bandwidth
select day_month, count(*), hour_day
from f_bandwidth t1
inner join dim_date t2 on t2.date_key = t1.date_key
where session_id is null
group by day_month, hour_day

--null session details on bandwidth
select t1.*, t2."DATE", t3.session_id
from f_bandwidth t1
inner join dim_date t2 on t2.date_key = t1.date_key
left outer join f_session t3 on t3.host_id = t1.host_id and t1.date_key between t3.session_start_date_key and t3.session_end_date_key
where t1.session_id is null
  and t2.day_month = 31
  and t2.hour_day  = 9
order by t2."DATE" asc

--null session details on session
select t1.*, t2."DATE", t3.session_id
from f_bandwidth t1
inner join dim_date t2 on t2.date_key = t1.date_key
left outer join f_session t3 on t3.host_id = t1.host_id and t1.date_key between t3.session_start_date_key and t3.session_end_date_key
where t1.session_id is null
 


select t2.day_month, count(*)
from f_session t1
inner join dim_date t2 on t2.date_key = t1.session_start_date_key
group by t2.day_month
order by t2.day_month desc
limit 1000

--sessions with a session but not on session table
select *
from f_bandwidth t1
where not exists (
	select 'x'
	from f_session t2
	where t1.date_key between t2.session_start_date_key and session_end_date_key)
and session_id is not null

--sessions without a session and date outside range
select t1.*, t2."DATE"
from f_bandwidth t1
inner join dim_date t2 on t2.date_key = t1.date_key
where not exists (
	select 'x'
	from f_session t2
	where t1.date_key between t2.session_start_date_key and session_end_date_key)
and session_id is null


select t1.*, t2."DATE", t3.session_start_date_key, t3.session_end_date_key
from f_bandwidth t1
INNER JOIN dim_date t2 on t2.date_key = t1.date_key
inner join f_session t3 on t3.session_id = t1.session_id
--where t1.session_id = 'd8085649-dfad-4385-b75d-60353366a290'
where t1.host_id = 7
  and date_trunc('day', t2."DATE") = to_date('2020-03-26', 'YYYY-MM-DD')
order by date_key desc

--Missing hosts
select count(*)
from f_bandwidth t1
where not exists (select 'x' from public.dim_hosts t2 where t2.host_id = t1. host_id)

--Missing dates
select count(*)
from f_bandwidth t1
where not exists (select 'x' from public.dim_date t2 where t2.date_key = t1.date_key)

SELECT
/*
  t1.host_id
, t1.date_key
, t2."DATE" as row_date
, upload_bytes
, download_bytes
, total_bytes
, t3.host_name
, t1.session_id as session_id_orig
*/
count(*)
FROM "public".f_bandwidth t1
left outer JOIN public.dim_date  t2 on t2.date_key = t1.date_key
left outer JOIN public.dim_hosts t3 on t3.host_id  = t1.host_id
where date_trunc('day', t2."DATE") = to_date('2020-03-26', 'YYYY-MM-DD')


select
 t3.host_name, t2.hour_day, t2."DATE" as start_date, t4."DATE" as end_date, t6.fqdn
,count(*), sum(session_total_mbytes) as total_mybtes, sum(session_duration) as total_duration, avg(session_duration) as avg_duration
from f_session t1
inner join dim_date t2 on t2.date_key = t1.session_start_date_key
inner join dim_hosts t3 on t3.host_id = t1.host_id
inner join dim_date t4 on t4.date_key = t1.session_end_date_key
left outer join f_connection t5 on t5.date_key between t1.session_start_date_key and t1.sessioN_end_date_key
left outer join dim_wan_host t6 on t6.wan_host_id = t5.wan_host_id
where host_owner ='eva'
  and host_name = 'eva-iPhone-11'
  and date_trunc('day', t2."DATE") = CURRENT_DATE
group by t2.hour_day, t3.host_name, t2."DATE", t4."DATE", t6.fqdn
order by host_name, t2.hour_day


delete from f_session t1
where exists (
	select 'x'
	from dim_date t2
	where t2.date_key = t1.session_start_date_key
	and date_trunc('day', t2."DATE") = to_date('2020-03-26', 'YYYY-MM-DD')
	)

	select * from f_session where session_id = '76bf3800-bee1-4a5e-8c8e-aa12d9a0d998'

	UPDATE f_bandwidth SET session_id = '76bf3800-bee1-4a5e-8c8e-aa12d9a0d998'
	select * from f_bandwidth
	WHERE  ( ( host_id = 40  ) ) AND    ( ( date_key BETWEEN 1585237020000 AND 1585237140000  ) )
	