/*
Practice Problem 1

Question:
I want to categorize the salaries from each job posting. To see if it fits in my desired salary range.

- Put salary into different buckets
- Define what's a high, standard, or low salary with our own conditions
- Why? It is easy to determine which job postings are worth looking at based on salary. Bucketing is a common practice in data analysis when viewing categories.
- I only want to look at data analyst roles
- Order from highest to lowest
*/

SELECT
    job_id,
    job_title_short, 
    salary_year_avg,
    CASE
        WHEN salary_year_avg < 30000 THEN 'low salary'
        WHEN salary_year_avg < 50000 THEN 'standard'
        WHEN salary_year_avg >= 50000 THEN 'high'
        ELSE 
            'no data'
    END AS salary_range
FROM job_postings_fact
WHERE
    job_title_short LIKE '%Data Analyst%' AND
    salary_year_avg IS NOT NULL 
ORDER BY salary_year_avg DESC
LIMIT 500;



