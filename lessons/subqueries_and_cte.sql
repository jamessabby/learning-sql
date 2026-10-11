-- SUBQUERY

-- Ex: get the company name that offers a job that doesn't require a degree
SELECT name AS company_name
FROM company_dim
WHERE company_id IN (   -- subquery starts here
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = TRUE
); -- Subquery ends here

/*
Common Table Expressions (CTEs): define a temporary result set that you can reference

- Can reference within a SELECT , INSERT , UPDATE , or DELETE statement
- Defined with WITH
*/

/*
    Find the companies that have the most job openings.
        - companies that has most job openings = companies that has job openings greater than the average job openings
        - Get the total number of job postings per company id
        - Return the total number of jobs with the company name
*/
WITH job_openings AS (
    SELECT 
        company_id,
        COUNT(job_id) AS total_job_postings
    FROM job_postings_fact
    GROUP BY company_id
)

SELECT AVG(total_job_postings) FROM job_openings

SELECT
    cd.name AS company_name,
    jo.total_job_postings AS most_job_openings
FROM company_dim AS cd
    LEFT JOIN job_openings as jo
        ON cd.company_id = jo.company_id
WHERE jo.total_job_postings > (
    SELECT AVG(total_job_postings) FROM job_openings
)
ORDER BY most_job_openings DESC;