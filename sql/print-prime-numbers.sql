-- Write a query to print all prime numbers less than or equal to 1000.
-- Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).
-- For example, the output for all prime numbers <=10  would be: '2&3&5&7'

with number_generator as (
	with recursive recursive_cte as (
		select num from (select 1 as num) q
		union all
		select num + 1 from recursive_cte where num < 1000
	) select num from recursive_cte
)
select group_concat(q.num order by q.num asc separator '&')
from (
	select a.num
	from number_generator a
	join number_generator b
	on 1 = 1
	where a.num % b.num = 0 and a.num <> b.num
	group by a.num
	having count(*) = 1
	order by a.num
) q
order by q.num
