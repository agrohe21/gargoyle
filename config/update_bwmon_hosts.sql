SELECT distinct ip_addr, host_mac, host_name, user_name
	FROM public.gargoyle_bwmon
	where user_name is null Or host_name is null or host_mac is null
	order by ip_addr asc
	
UPDATE public.gargoyle_bwmon t2
	SET host_mac =(select host_mac  from public.gargoyle_hosts t1 where t1.host_ip = t2.ip_addr)
	where host_mac is null;

UPDATE public.gargoyle_bwmon t2
	SET host_name =(select host_name  from public.gargoyle_hosts t1 where t1.host_mac = t2.host_mac)
	WHERE host_name is null;

UPDATE public.gargoyle_bwmon t2
	SET user_name =(select user_name  from public.gargoyle_hosts t1 where t1.host_mac = t2.host_mac)
	WHERE user_name is null;

select distinct host_ip, host_mac, host_name, user_name
	FROM public.gargoyle_hosts
	where user_name is null Or host_name is null or host_mac is null
	order by host_ip asc

delete from public.gargoyle_hosts
where host_mac = 'xyz'