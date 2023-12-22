-- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. 
-- Output one of the following statements for each record in the table:
-- Equilateral: It's a triangle with  sides of equal length.
-- Isosceles: It's a triangle with  sides of equal length.
-- Scalene: It's a triangle with  sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.

create database if not exists hacker_rank;
use hacker_rank;

drop table if exists triangles;
create table triangles (
  a int,
  b int,
  c int
);

insert into triangles (a, b, c) values (20, 20, 23);
insert into triangles (a, b, c) values (20, 20, 20);
insert into triangles (a, b, c) values (20, 21, 22);
insert into triangles (a, b, c) values (13, 14, 30);

select * from triangles;