create database if not exists hacker_rank;
use hacker_rank;

drop table if exists contests;
create table contests (
  contest_id int, 
  hacker_id int, 
  name varchar(255)
);

drop table if exists colleges;
create table colleges (
  college_id int, 
  contest_id int
);

drop table if exists challenges;
create table challenges (
  challenge_id int, 
  college_id int
);

drop table if exists view_stats;
create table view_stats (
  challenge_id int, 
  total_views int,
  total_unique_views int
);

drop table if exists submission_stats;
create table submission_stats (
  challenge_id int, 
  total_submissions int,
  total_accepted_submissions int
);

insert into contests (contest_id, name, hacker_id) 
values 
  (66406, 'Rose', 17973), 
  (66556, 'Angela', 79153),
  (94828, 'Frank', 80275);

insert into colleges (college_id, contest_id) 
values 
  (11219, 66406), 
  (32473, 66556),
  (56685, 94828);

insert into challenges (challenge_id, college_id) 
values 
  (18765, 11219), 
  (47127, 11219),
  (60292, 32473),
  (72974, 56685);

insert into view_stats (challenge_id, total_views, total_unique_views) 
values 
  (47127, 26, 19), 
  (47127, 15, 14),
  (18765, 43, 10),
  (18765, 72, 13),
  (75516, 35, 17),
  (60292, 11, 10),
  (72974, 41, 15),
  (75516, 75, 11);
    
insert into submission_stats (challenge_id, total_submissions, total_accepted_submissions) 
values 
  (75516, 34, 12), 
  (47127, 27, 10),
  (47127, 56, 18),
  (75516, 74, 12),
  (75516, 83, 8),
  (72974, 68, 24),
  (72974, 82, 14),
  (47127, 28, 11);

-- Samantha interviews many candidates from different colleges using coding challenges and contests. 
-- Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, 
-- total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are 0.
-- Note: A specific contest can be used to screen candidates at more than one college, but each college only holds 1 screening contest.

select b.contest_id,
       b.hacker_id,
       b.name,
       SUM(IFNULL(ss.mts, 0)),
       SUM(IFNULL(ss.mtas, 0)),
       SUM(IFNULL(vs.mtv, 0)),
       SUM(IFNULL(vs.mtuv, 0))
from colleges a
    join contests b
        on a.contest_id = b.contest_id
    join challenges c
        on a.college_id = c.college_id
    left join
    (
        select challenge_id,
               sum(total_views) as mtv,
               sum(total_unique_views) as mtuv
        from view_stats
        group by challenge_id
    ) vs
        on c.challenge_id = vs.challenge_id
    left join
    (
        select challenge_id,
               sum(total_submissions) as mts,
               sum(total_accepted_submissions) as mtas
        from submission_stats
        group by challenge_id
    ) ss
        on c.challenge_id = ss.challenge_id
group by b.contest_id,
         b.hacker_id,
         b.name
having SUM(IFNULL(vs.mtv, 0)) + SUM(IFNULL(vs.mtuv, 0)) + SUM(IFNULL(ss.mts, 0)) + SUM(IFNULL(ss.mtas, 0)) <> 0
order by b.contest_id;
