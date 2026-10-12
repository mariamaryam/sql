
use sql_course;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/company_dim.csv'
INTO TABLE company_dim
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/skills_dim.csv'
INTO TABLE skills_dim
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/job_postings_fact.csv'
INTO TABLE sql_course.job_postings_fact
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    job_id,
    company_id,
    job_title_short,
    job_title,
    job_location,
    job_via,
    job_schedule_type,
    @job_work_from_home,
    search_location,
    job_posted_date,
    @job_no_degree_mention,
    @job_health_insurance,
    job_country,
    salary_rate,
    @salary_year_avg,
    @salary_hour_avg
)
SET
    job_work_from_home =
        CASE
            WHEN LOWER(TRIM(@job_work_from_home)) = 'true' THEN 1
            WHEN LOWER(TRIM(@job_work_from_home)) = 'false' THEN 0
            ELSE NULL
        END,

    job_no_degree_mention =
        CASE
            WHEN LOWER(TRIM(@job_no_degree_mention)) = 'true' THEN 1
            WHEN LOWER(TRIM(@job_no_degree_mention)) = 'false' THEN 0
            ELSE NULL
        END,

    job_health_insurance =
        CASE
            WHEN LOWER(TRIM(@job_health_insurance)) = 'true' THEN 1
            WHEN LOWER(TRIM(@job_health_insurance)) = 'false' THEN 0
            ELSE NULL
        END,

    salary_year_avg =
        NULLIF(TRIM(@salary_year_avg), ''),

    salary_hour_avg =
        NULLIF(TRIM(@salary_hour_avg), '');

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/skills_job_dim.csv'
INTO TABLE skills_job_dim
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;