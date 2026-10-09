/*
PRACTICE PROBLEM 7
    Find the count of the number of remote jobs per skill
        - Display the top 5 skills by their demands in remote jobs
        - Include the skill ID, name, and count of postings reuquiring the skill
*/


SELECT 
    skills_dim.skill_id,  
    skills_dim.skills AS skill_name,
    top_remote_skills.skill_count AS remote_jobs
FROM (
    -- get the skills skill id and count of REMOTE JOBS ONLY
    SELECT 
        sjd.skill_id, 
        COUNT(sjd.job_id) AS skill_count
    FROM skills_job_dim AS sjd
    INNER JOIN job_postings_fact AS jpf
        ON sjd.job_id = jpf.job_id
    WHERE jpf.job_work_from_home = TRUE
    GROUP BY sjd.skill_id
) AS top_remote_skills
-- join to get the skill name of top 5 most required skill
INNER JOIN skills_dim
    ON skills_dim.skill_id = top_remote_skills.skill_id
ORDER BY top_remote_skills.skill_count DESC
LIMIT 5;