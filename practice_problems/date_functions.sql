-- PRACTICE PROBLEMS 

-- 1. Write a query to find the average salary both yearly and hourly for job postings 
-- that were posted after June 1, 2023. Group the results by job schedule type

SELECT  
    job_schedule_type,
    AVG(salary_year_avg) AS average_yearly_salary,
    AVG(salary_hour_avg) AS average_hourly_salary
FROM 
    job_postings_fact
WHERE 
    job_posted_date > '2023-06-01'
GROUP BY 
    job_schedule_type;


-- 2. Write a query to count the number of job postings for each month in 2023, 
-- adjusting the job_posted_date to be in 'America/New_York' time zone 
-- before extracting (hint) the month. Assume the job_posted_date is stored in UTC. 
-- Group by and order by the month.
SELECT
    COUNT(job_id) AS job_postings_count,
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month,
    EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS year
FROM 
    job_postings_fact
WHERE 
    EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') = 2023
GROUP BY month, year
ORDER BY month;

-- 3. Write a query to find companies (include company name) that have posted jobs offering health
-- insurance , where these postings were made in the second quarter of 2023. Use data extraction
-- to filter by quarter.
SELECT DISTINCT
    cd.name
FROM
    company_dim AS cd   
    LEFT JOIN job_postings_fact AS jpf
    ON cd.company_id = jpf.company_id
WHERE 
    EXTRACT(QUARTER FROM jpf.job_posted_date) = 2 AND
    EXTRACT(YEAR FROM jpf.job_posted_date) = 2023 AND 
    jpf.job_health_insurance = TRUE;

