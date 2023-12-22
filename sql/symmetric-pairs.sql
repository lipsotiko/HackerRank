create database if not exists hacker_rank;
use hacker_rank;

-- You are given a table, Functions, containing two columns: X and Y.
-- Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.
-- Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1.

drop table if exists functions;
create table functions (
  x int, 
  y int
);

insert into functions(x, y)
values (20, 20), (20, 20), (20, 21), (23, 22), (22, 23), (21, 20);

with symetric_pairs as (
	select f1.x, f1.y
	from functions f1
	join functions f2
	on f1.x = f2.y
	and f1.y = f2.x
	order by f1.x, f1.y
) select x, y
from symetric_pairs
where x < y
union all
select x, y
from symetric_pairs
where x = y
group by x, y
having count(*) > 1
order by x, y;
