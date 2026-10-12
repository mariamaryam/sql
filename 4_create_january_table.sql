--create table for january
create table january_jobs as
   select * 
   FROM job_postings_fact
   where extract (month from job_posted_date) = 1;
select job_posted_date
from january_jobs
limit 20;

