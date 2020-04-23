select
 count(*)
,sum(total_bytes)/1000000 as tot_mb
,sum(download_bytes)/1000000 as dl_mb
,sum(upload_bytes)/1000000 as ul_mb
,t2.host_owner
,sum(total_bytes)-sum(download_bytes)-sum(upload_bytes) as diff
from f_bandwidth t1
inner join dim_hosts t2 on t2.host_id = t1.host_id
inner join dim_date t3 on t3.date_key = t1.date_key and date_trunc('day', t3."DATE") = CURRENT_DATE
group by t2.host_owner
order by 2 desc