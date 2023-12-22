create database if not exists hacker_rank;
use hacker_rank;

drop table if exists hackers;
create table hackers (
	hacker_id int,
	name varchar(255)
);

drop table if exists submissions;
create table submissions (
	submission_date date,
	submission_id varchar(255),
	hacker_id int,
	score int
);

insert into hackers (hacker_id, name)
values (15758, 'Rose')
, (20703, 'Angelica')
, (36396, 'Frank')
, (38289, 'Patrick')
, (44065, 'Lisa')
, (53473, 'Kimberly')
, (62529, 'Bonie')
, (79722, 'Michael');

insert into submissions(submission_date, submission_id, hacker_id, score)
values ('2016-03-01', 8494, 20703, 0)
, ('2016-03-01', 22403, 53473, 15)
, ('2016-03-01', 23965, 79722, 60)
, ('2016-03-01', 30173, 36396, 70)
, ('2016-03-02', 34928, 20703, 0)
, ('2016-03-02', 38740, 15758, 60)
, ('2016-03-02', 42769, 79722, 25)
, ('2016-03-02', 44364, 79722, 60)
, ('2016-03-03', 45440, 20703, 0)
, ('2016-03-03', 49050, 36396, 70)
, ('2016-03-03', 50273, 79722, 5)
, ('2016-03-04', 50344, 20703, 0)
, ('2016-03-04', 51360, 44065, 90)
, ('2016-03-04', 54404, 53473, 65)
, ('2016-03-04', 61533, 79722, 45)
, ('2016-03-05', 72852, 20703, 0)
, ('2016-03-05', 74546, 38289, 0)
, ('2016-03-05', 76487, 62529, 0)
, ('2016-03-05', 82439, 36396, 10)
, ('2016-03-05', 90006, 36396, 40)
, ('2016-03-06', 90404, 20703, 0);

/**
Julia conducted a 15 days of learning SQL contest. The start date of the contest was March 01, 2016 and the end date was March 15, 2016.
Write a query to print total number of unique hackers who made at least 1 submission each day (starting on the first day of the contest), 
and find the hacker_id and name of the hacker who made maximum number of submissions each day. 
If more than one such hacker has a maximum number 
of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, sorted by the date.

Expected results:
2016-03-01 4 20703 Angela
2016-03-02 2 79722 Michael
2016-03-03 2 20703 Angela
2016-03-04 2 20703 Angela
2016-03-05 1 36396 Frank
2016-03-06 1 20703 Angela
*/

-- Figure it out the solutuon for each date first
set @end_dt = '2016-03-- -03';

select sum(q2.unique_hackers), q2.hacker_id
from (
	select count(distinct submission_date) as cnt
	from submissions
	where submission_date between '2016-03-01' and @end_dt
) q1
inner join (
	select hacker_id, 1 as unique_hackers, count(distinct submission_date) as cnt
	from submissions
	where submission_date between '2016-03-01' and @end_dt
	group by hacker_id
) q2
on q1.cnt = q2.cnt
group by hacker_id;

select min(s2.submission_date) as min_date, s1.submission_date as max_date
from submissions s1
join submissions s2
on 1 = 1
group by s1.submission_date;

-- With CTEs
select unique_count.max_date, unique_count.dts, max_submissions_by_day.hid, max_submissions_by_day.name
from (
	select q.max_date, count(q.dts) as dts
    from (
		with tmp_dates as (
			select min(s2.submission_date) as min_date, s1.submission_date as max_date
			from submissions s1
			join submissions s2
			on 1 = 1
			group by s1.submission_date)
		select td.min_date, td.max_date, s.hacker_id, count(distinct s.submission_date) as dts
		from tmp_dates td
		join submissions s
		on s.submission_date between td.min_date and td.max_date
		group by td.min_date, td.max_date, s.hacker_id
		having count(distinct s.submission_date) = datediff(td.max_date, td.min_date) + 1
    ) q
    group by q.max_date
) as unique_count
inner join (
	select q3.dt, q3.hid, h.name
    from (
		with max_hacker_submissions_by_day as (
			select submission_date as dt, hacker_id, count(*) as cnt
			from submissions
			group by submission_date, hacker_id
        )
		select q.dt, min(q.hacker_id) as hid
		from max_hacker_submissions_by_day q
		inner join (
			select dt, max(cnt) as cnt
			from max_hacker_submissions_by_day
			group by dt
		) q2
		on q.dt = q2.dt
		and q.cnt = q2.cnt
		group by q.dt
	) q3
    inner join hackers h
    on q3.hid = h.hacker_id
) max_submissions_by_day
on unique_count.max_date = max_submissions_by_day.dt
order by max_submissions_by_day.dt;

-- Without CTEs
select unique_count.max_date, unique_count.dts, max_submissions_by_day.hid, max_submissions_by_day.name
from (
	select q.max_date, count(q.dts) as dts
    from (
		select td.min_date, td.max_date, s.hacker_id, count(distinct s.submission_date) as dts
		from (
			select min(s2.submission_date) as min_date, s1.submission_date as max_date
			from submissions s1
			join submissions s2
			on 1 = 1
			group by s1.submission_date
        ) td
		join submissions s
		on s.submission_date between td.min_date and td.max_date
		group by td.min_date, td.max_date, s.hacker_id
		having count(distinct s.submission_date) = datediff(td.max_date, td.min_date) + 1
    ) q
    group by q.max_date
) as unique_count
inner join (
	select q3.dt, q3.hid, h.name
    from (
		select q.dt, min(q.hacker_id) as hid
		from (
			select submission_date as dt, hacker_id, count(*) as cnt
			from submissions
			group by submission_date, hacker_id
        ) q
		inner join (
			select dt, max(cnt) as cnt
			from (
				select submission_date as dt, hacker_id, count(*) as cnt
				from submissions
				group by submission_date, hacker_id
            ) q
			group by dt
		) q2
		on q.dt = q2.dt
		and q.cnt = q2.cnt
		group by q.dt
	) q3
    inner join hackers h
    on q3.hid = h.hacker_id
) max_submissions_by_day
on unique_count.max_date = max_submissions_by_day.dt
order by max_submissions_by_day.dt;




