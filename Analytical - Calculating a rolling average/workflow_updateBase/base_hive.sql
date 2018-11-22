with cte_sessions as (
	select  
		country,
		(unix_timestamp(concat(cast(ymd as string),time), 'yyyyMMddHH:mm:ss') DIV 60)*60 as ymdhm, 
		count(1) as visits
	from 
		sessions_table
	where
		date BETWEEN addDays(${crunchDate},-2) and addDays(${crunchDate},1) 
	group by 
		country, 
		(unix_timestamp(concat(cast(ymd as string),time), 'yyyyMMddHH:mm:ss') DIV 60)*60
	),

cte_baseline_raw as (
	select
	    country,
	    ymdhm,
	    percentile(visits,(27/60)) over (PARTITION by is_app,locale order by ymdhm ROWS BETWEEN 30 preceding and 30 following) as bl_visits,
	    visits
	from    
	    cte_sessions),

cte_baseline_smoothed AS (
	select
	    locale,
	    cast(ymdhm + nd.offset * 60 as bigint) as ymdhm,
	    sum(if(offset=0,visits,0)) as visits,
	    sum(weight*bl_visits)/sum(weight) as bl_visits
	from
		cte_baseline_raw
	join
		norm_dist_minutes nd
	group by        
	    country,
	    cast(ymdhm + nd.offset * 60 as bigint)
	    ),
	    
cte_prep as (
SELECT
	country,
	cast(from_unixtime(ymdhm,'yyyyMMddHHmmss') as bigint) as time_stamp,
	sum(visits) as visits,
	sum(bl_visits) as bl_visits,
	cast(from_unixtime(ymdhm,'yyyyMMdd') as int) as ymd
FROM
	cte_baseline_smoothed
WHERE
	cast(from_unixtime(ymdhm,'yyyyMMdd') as int) BETWEEN addDays(${crunchDate},-1) and ${crunchDate}
GROUP BY
	country,
	ymdhm,
	ymdhm div 10000L)
	
INSERT OVERWRITE TABLE baseline 
PARTITION (ymd)
SELECT
	country,
	time_stamp,
	visits,
	IF(bl_visits<=1,0.5,bl_visits) as bl_visits, -- makes sure that in cases where there is a low baseline this will not be 1.. 
	ymd
FROM
	cte_prep
;