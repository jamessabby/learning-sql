-- Create individual tables for all 12 months of 2023 from job_postings_fact

-- January
CREATE TABLE january_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 1 AND
        EXTRACT(YEAR FROM job_posted_date) = 2023;

-- February
CREATE TABLE february_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 2 AND
        EXTRACT(YEAR FROM job_posted_date) = 2023;

-- March
CREATE TABLE march_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE
        EXTRACT(MONTH FROM job_posted_date) = 3 AND
        EXTRACT(YEAR FROM job_posted_date) = 2023;

SELECT * FROM march_jobs LIMIT 10;