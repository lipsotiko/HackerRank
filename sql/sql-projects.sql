-- You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. 
-- It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.
-- If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

-- Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. 
-- If there is more than one project that have the same number of completion days, then order by the start date of the project.

create database if not exists hacker_rank;
use hacker_rank;

drop table if exists projects;
create table projects (
  task_id int,
  start_date date,
  end_date date
);

insert into projects(task_id, start_date, end_date) values (1, '2015-10-01', '2015-10-02');
insert into projects(task_id, start_date, end_date) values (2, '2015-10-02', '2015-10-03');
insert into projects(task_id, start_date, end_date) values (3, '2015-10-03', '2015-10-04');
insert into projects(task_id, start_date, end_date) values (4, '2015-10-13', '2015-10-14');
insert into projects(task_id, start_date, end_date) values (5, '2015-10-14', '2015-10-15');
insert into projects(task_id, start_date, end_date) values (6, '2015-10-28', '2015-10-29');
insert into projects(task_id, start_date, end_date) values (7, '2015-10-30', '2015-10-31');

select a.start_date, b.end_date
from (
	select p2.start_date, p2.end_date, row_number() over () as r_num
	from projects p1
	right join projects p2
	on p1.end_date = p2.start_date
	where p1.start_date is null
) a
inner join (
	select p1.start_date, p1.end_date, row_number() over () as r_num
	from projects p1
	left join projects p2
	on datediff(p2.end_date, p1.start_date) = 2
	where p2.start_date is null
) b
on a.r_num = b.r_num
order by datediff(b.end_date, a.start_date);
