-- You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. 
-- Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
-- Packages contains two columns: ID and Salary (offered salary in $ thousands per month).
-- Write a query to output the names of those students whose best friends got offered a higher salary than them. 
-- Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.

create database if not exists hacker_rank;
use hacker_rank;

drop table if exists students;
create table students (
  id int,
  name varchar(255)
);

insert into students(id, name) values (1, 'Ashley');
insert into students(id, name) values (2, 'Samantha');
insert into students(id, name) values (3, 'Julia');
insert into students(id, name) values (4, 'Scarlet');

drop table if exists friends;
create table friends (
  id int,
  friend_id int
);

insert into friends (id, friend_id) values (1, 2);
insert into friends (id, friend_id) values (2, 3);
insert into friends (id, friend_id) values (3, 4);
insert into friends (id, friend_id) values (4, 1);

drop table if exists packages;
create table packages (
  id int,
  salary float
);

insert into packages (id, salary) values (1, 15.20);
insert into packages (id, salary) values (2, 10.06);
insert into packages (id, salary) values (3, 11.55);
insert into packages (id, salary) values (4, 12.12);

select * from students;

select * from friends;

select * from packages;
