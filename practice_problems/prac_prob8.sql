/*
    PRACTICE PROBLEM 8
    
    Find the job postings from the first quarter that have a salary greater than $70k
    - Combine job posting tables from the first quarter of 2023 (Jan-Mar)
    - Get job postings with an average yearly salary > $70k
*/

SELECT
    quarter_one_job_postings.job_title_short,
    quarter_one_job_postings.job_location,
    quarter_one_job_postings.job_via,
    quarter_one_job_postings.salary_year_avg,
    quarter_one_job_postings.job_posted_date::DATE
FROM (
    SELECT * FROM january_jobs
    UNION ALL
    SELECT * FROM february_jobs
    UNION ALL
    SELECT * FROM march_jobs
) AS quarter_one_job_postings
WHERE 
    salary_year_avg > 70000 AND job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC