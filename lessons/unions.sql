/*
    UNONS  - Combines results of two or more SELECT statement into a 
            single result set

        UNION       - remove duplicate rows
        UNION ALL   - include all duplicate rows

    NOTE: Each statement within the UNION must have the same number of 
        columns in the result set with similar data types.
*/

/*
    PRACTICE PROBLEM 1

    - Get the corresponding skill and skill type for each job posting in Q1
    - include those without any skills too
    - Why? Look at the skills and the type and the type for each job in the first quarter that has a salary > 70,000
*/

WITH q1_jobs AS (
    SELECT * FROM january_jobs
    UNION ALL
    SELECT * FROM february_jobs
    UNION ALL
    SELECT * FROM march_jobs
)

SELECT 
    sd.skill_id, 
    sd.skills AS skill_name, 
    sd.type, q1_jobs.salary_year_avg
FROM q1_jobs
LEFT JOIN skills_job_dim AS sjd
    ON q1_jobs.job_id = sjd.job_id
LEFT JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE q1_jobs.salary_year_avg > 70000
ORDER BY q1_jobs.salary_year_avg DESC