-- PRACTICE PROBLEMS

/*
    1. Identify the top 5 skills that are most frequently mentioned in job postings. Use a subquery to 
find the skill IDs with the highest counts in the skills_job_dim table and then join this result 
with the skills_dim table to get the skill names.
*/

SELECT skills
FROM skills_dim
WHERE skill_id IN (
    SELECT skill_id
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY COUNT(skill_id) DESC
    LIMIT 5
)

/*
    2. Determine the size category ('Small', 'Medium', or 'Large') for each company by first identifying 
the number of job postings they have. Use a subquery to calculate the total job postings per 
company. A company is considered 'Small' if it has less than 10 job postings, 'Medium' if the 
number of job postings is between 10 and 50, and 'Large' if it has more than 50 job postings. 
Implement a subquery to aggregate job counts per company before classifying them based on 
size.
*/

SELECT
    company_dim.name AS company_name,
    company_jobs.total_job_counts,
    CASE
        WHEN company_jobs.total_job_counts < 10 THEN 'Small'
        WHEN company_jobs.total_job_counts BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM company_dim
LEFT JOIN
    (
        SELECT company_id, COUNT(job_id) AS total_job_counts
        FROM job_postings_fact
        GROUP BY company_id
    ) AS company_jobs
    ON company_dim.company_id = company_jobs.company_id


