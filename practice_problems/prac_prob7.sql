/*
PRACTICE PROBLEM 7
    Find the count of the number of remote jobs per skill
        - Display the top 5 skills by their demands in remote jobs
        - Include the skill ID, name, and count of postings reuquiring the skill
*/

-- MY SOLUTION
-- SUBQUERY
SELECT
    skills_job_table.skill_id, 
    skills_dim.skills AS skill_name,
    skills_job_table.job_postings
FROM (
    SELECT 
        skills_job_dim.skill_id,
        COUNT(skills_job_dim.job_id) AS job_postings
    FROM skills_job_dim
    INNER JOIN job_postings_fact
        ON skills_job_dim.job_id = job_postings_fact.job_id
    WHERE job_postings_fact.job_work_from_home = TRUE
    GROUP BY skill_id
) AS skills_job_table
INNER JOIN skills_dim
    ON skills_job_table.skill_id = skills_dim.skill_id
ORDER BY(skills_job_table.job_postings) DESC
LIMIT 5;

-- CTE
WITH job_skills_requirement AS (
    SELECT skills_job_dim.skill_id,
    COUNT(skills_job_dim.job_id) AS job_postings_count
    FROM skills_job_dim
    INNER JOIN job_postings_fact
        ON skills_job_dim.job_id = job_postings_fact.job_id
    WHERE job_postings_fact.job_work_from_home = TRUE
    GROUP BY skill_id
)

SELECT 
    skills_dim.skill_id,    
    skills_dim.skills, 
    job_skills_requirement.job_postings_count
FROM job_skills_requirement 
    INNER JOIN skills_dim
        ON job_skills_requirement.skill_id = skills_dim.skill_id
ORDER BY job_skills_requirement.job_postings_count DESC
LIMIT 5;

-- TUTORIAL SOLUTION + only Data Analysts
WITH remote_job_skills AS (
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM
        skills_job_dim AS skills_to_jobs
    INNER JOIN job_postings_fact AS job_postings
        ON skills_to_jobs.job_id = job_postings.job_id
    WHERE job_postings.job_work_from_home = True AND 
            job_postings.job_title_short = 'Data Analyst'
    GROUP BY 
        skill_id
)

SELECT 
    skill.skill_id,
    skill.skills,
    remote_job_skills.skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skill
    ON skill.skill_id = remote_job_skills.skill_id
ORDER BY remote_job_skills.skill_count DESC
LIMIT 5;
