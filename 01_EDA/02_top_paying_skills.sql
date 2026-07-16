/*
Question: What are the highest-paying skills for data engineers? 
- Calculate the median salary for each skill required in data engineer positions - Focus on remote positions with specified salaries 
- Include skill frequency to identify both salary and demand 
- Why? Helps identify which skills command the highest compensation while also showing 
how common those skills are, providing a more comp lete picture for skill development priorities
*/

SELECT sd.skills,
ROUND(MEDIAN(jpf.salary_year_avg), 0) AS MEDIAN_salary,
COUNT(sd.skills) AS hight_demand_skills
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
AND jpf.job_work_from_home = True 
GROUP BY skills 
HAVING COUNT(sd.skills) > 100
ORDER BY MEDIAN_salary DESC
LIMIT 15;

/*
Hear are the top 15 highest-paying skills
┌───────────┬───────────────┬─────────────────────┐
│  skills   │ MEDIAN_salary │ hight_demand_skills │
│  varchar  │    double     │        int64        │
├───────────┼───────────────┼─────────────────────┤
│ rust      │      210000.0 │                 232 │
│ terraform │      184000.0 │                3248 │
│ golang    │      184000.0 │                 912 │
│ spring    │      175500.0 │                 364 │
│ neo4j     │      170000.0 │                 277 │
│ gdpr      │      169616.0 │                 582 │
│ zoom      │      168438.0 │                 127 │
│ graphql   │      167500.0 │                 445 │
│ mongo     │      162250.0 │                 265 │
│ fastapi   │      157500.0 │                 204 │
│ django    │      155000.0 │                 265 │
│ bitbucket │      155000.0 │                 478 │
│ crystal   │      154224.0 │                 129 │
│ c         │      151500.0 │                 444 │
│ atlassian │      151500.0 │                 249 │
└───────────┴───────────────┴─────────────────────┘
  15 rows                               3 columns
*/
