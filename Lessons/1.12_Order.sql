SELECT cd.name,
COUNT (jpf.*)
FROM job_postings_fact as jpf
left join company_dim as cd
on jpf.company_id = cd.company_id
GROUP BY cd.name