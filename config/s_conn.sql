SELECT sum(total_bytes)/1000000 as total_mbytes, t3.host_name, t2.wan_domain, t2.fqdn, t4.day_month, count(*)
  FROM public.f_connection t1
  inner join public.dim_wan_host t2 on t2.wan_host_id = t1.wan_host_id
  inner join public.dim_hosts t3 on t3.host_id = t1.host_id
  inner join public.dim_date  t4 on t4.date_key = t1.date_key
group by t3.host_name, t2.wan_domain, t2.fqdn, t4.day_month
order by 1 desc

SELECT sum(total_bytes)/1000000 as total_mbytes, t4.day_month, t4.hour_day, count(*)
  FROM public.f_connection t1
  inner join public.dim_wan_host t2 on t2.wan_host_id = t1.wan_host_id
  inner join public.dim_hosts t3 on t3.host_id = t1.host_id
  inner join public.dim_date  t4 on t4.date_key = t1.date_key
group by t4.day_month, t4.hour_day
order by 2 desc, 3 desc
limit 12

SELECT sum(total_bytes)/1000000 as total_mbytes, count(*), t3.host_owner, t3.host_name
  FROM public.f_connection t1
  inner join public.dim_wan_host t2 on t2.wan_host_id = t1.wan_host_id
  inner join public.dim_hosts t3 on t3.host_id = t1.host_id
  inner join public.dim_date  t4 on t4.date_key = t1.date_key
 where date_trunc('day', t4."DATE") = CURRENT_DATE
group by t3.host_owner, host_name
order by 1 desc
limit 10

SELECT sum(total_bytes)/1000000 as total_mbytes, count(*), date_trunc('hour', conn_date)
  FROM public.stg_conn t1
group by date_trunc('hour', conn_date)
order by 3 desc
limit 12

SELECT to_char(sum(total_bytes)/1000000, '9,990D99') as total_mbytes, count(*), t2.wan_domain
  FROM public.f_connection t1
  inner join public.dim_wan_host t2 on t2.wan_host_id = t1.wan_host_id
  inner join public.dim_hosts t3 on t3.host_id = t1.host_id
  inner join public.dim_date  t4 on t4.date_key = t1.date_key
where date_trunc('day', t4."DATE") = CURRENT_DATE AND fqdn is not null
group by t2.wan_domain
order by sum(total_bytes)/1000000 desc
limit 20

SELECT t3.host_name, t4.hour_day,  replace(t2.wan_domain, 'unknown', t2.wan_ip), fqdn, round(sum(total_bytes)/1000000::numeric,2) as total_mbytes, count(*)
  FROM public.f_connection t1
  inner join public.dim_wan_host t2 on t2.wan_host_id = t1.wan_host_id
  inner join public.dim_hosts t3 on t3.host_id = t1.host_id
  inner join public.dim_date  t4 on t4.date_key = t1.date_key
Where date_trunc('day', t4."DATE") = CURRENT_DATE
  and t3.host_owner = 'eva'
  and host_name = 'eva-iPhone-11'
group by host_name, t4.hour_day, replace(t2.wan_domain, 'unknown', t2.wan_ip), fqdn
having sum(total_bytes)/1000000 > 1
order by t3.host_name, hour_day asc, sum(total_bytes) desc

select *
from f_connection t1
inner join public.dim_wan_host t2 on t2.wan_host_id = t1.wan_host_id
where t2.fqdn like '%flingo%'
