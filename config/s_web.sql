SELECT domain, count(*)
  FROM public.f_webmon t1
GROUP BY
domain
having count(*) > 100
order by 2 desc

select *
from f_webmon t1
where domain like '%amazonaws.com'

 
SELECT t2.day_month, t3.host_name, domain, count(*)
  FROM public.f_webmon t1
  INNER JOIN public.dim_date t2  on t2.date_key = t1.date_key
  INNER JOIN public.dim_hosts t3 on t3.host_id  = t1.host_id
GROUP BY
 t2.day_month, t3.host_name, domain
 order by 4 desc

 SELECT t2.hour_day, t3.host_name, domain, count(*), sum(total_mbytes)
  FROM public.f_webmon t1
  INNER JOIN public.dim_date t2  on t2.date_key = t1.date_key
  INNER JOIN public.dim_hosts t3 on t3.host_id  = t1.host_id
  where date_trunc('day', t2."DATE") = CURRENT_DATE
    and t3.host_owner = 'eva'
GROUP BY
 t2.hour_date, t3.host_name, domain
 order by 4 desc