/*
Question: What are the most hight demand skills
 for data enginner
*/ 

SELECT sd.skills, COUNT(sd.skills) AS hight_demand_skills
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
AND jpf.job_work_from_home = True
GROUP BY skills
ORDER BY hight_demand_skills DESC
LIMIT 15;

/*
Hear are the most hight demand skills
┌────────────┬─────────────────────┐
│   skills   │ hight_demand_skills │
│  varchar   │        int64        │
├────────────┼─────────────────────┤
│ sql        │               29221 │
│ python     │               28776 │
│ aws        │               17823 │
│ azure      │               14143 │
│ spark      │               12799 │
│ airflow    │                9996 │
│ snowflake  │                8639 │
│ databricks │                8183 │
│ java       │                7267 │
│ gcp        │                6446 │
│ kafka      │                6415 │
│ scala      │                6304 │
│ redshift   │                5737 │
│ hadoop     │                5447 │
│ pyspark    │                4898 │
└────────────┴─────────────────────┘
  15 rows                2 columns
*/

