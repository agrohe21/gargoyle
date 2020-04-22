select count(*), sum(total_bytes)/1000000, sum(download_bytes)/1000000, sum(upload_bytes)/1000000, t2.host_owner, sum(total_bytes)-sum(download_bytes)-sum(upload_bytes)
from f_bandwidth t1
inner join dim_hosts t2 on t2.host_id = t1.host_id
group by t2.host_owner