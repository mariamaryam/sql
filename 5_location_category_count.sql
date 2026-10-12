select 
   COUNT(job_id) AS number_of_jobs,
   case
      when job_location = lower ('anywhere') then 'Remote'
      when job_location = lower ('new york, ny') then 'Local'
      else 'Onsite'
    End as Location_category
from job_postings_fact
where job_title_short = lower('data analyst')
GROUP BY Location_category
ORDER BY number_of_jobs DESC;

