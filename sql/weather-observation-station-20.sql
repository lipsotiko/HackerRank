create database if not exists hacker_rank;
use hacker_rank;

drop table if exists station;
create table station (
	id int,
	lat_n int
);

insert into station (id, lat_n)
values (1, 123)
	, (2, 20703)
	, (3, 36396)
	, (4, 45)
	, (5, 44065)
	, (6, 23)
	, (7, 62529)
	, (8, 62529)
	, (9, 79722);

select round((a.lat_n + b.lat_n) / 2, 4)
from (
	select lat_n
	from (
		select lat_n, row_number() over () as row_num
		from station
		order by lat_n asc
	) q
	where row_num >= (select ceiling(count(*) / 2) from station)
    limit 1
) a
join (
	select lat_n
	from (
		select lat_n, row_number() over () as row_num
		from station
		order by lat_n desc
	) q
	where row_num >= (select ceiling(count(*) / 2) from station)
    limit 1
) b
on 1 = 1;
