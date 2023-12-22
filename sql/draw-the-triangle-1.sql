-- P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
-- * * * * * 
-- * * * * 
-- * * * 
-- * * 
-- *
-- Write a query to print the pattern P(20).

with number_generator as (
	with recursive recursive_cte as (
		select num from (select 1 as num) q
		union all
		select num + 1 from recursive_cte where num < 20
	) select num from recursive_cte
)
select repeat('* ', num)
from number_generator
order by num desc;
