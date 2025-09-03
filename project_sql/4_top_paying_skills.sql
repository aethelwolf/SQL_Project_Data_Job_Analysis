/*
Question: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst postions
= Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact slary levels for Data Analyst and
    helps identify the most financially rewarding skills to aquire or improve
*/

SELECT
    ROUND(AVG(salary_year_avg), 0) AS avg_salary,
    skills
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location = 'New York, NY'
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/*
Heres a break down of the results for top paying skills
-Specialized databases & legacy tech pay the most → Elasticsearch, Neo4j, Cassandra,
and even older skills like Unix, Perl, and C command top salaries ($160K–185K).

-Core backend, cloud, and data stack are solid earners → Java/Spring, GCP, Linux, 
and Python data tools (Pandas, NumPy, Scikit-learn) average in the $125K–140K range.

-Frontend & visualization skills pay less comparatively → Angular, Plotly, Qlik, 
and similar tools sit closer to the $120K–130K range, making them useful but not the highest ROI.

[
  {
    "avg_salary": "185000",
    "skills": "elasticsearch"
  },
  {
    "avg_salary": "185000",
    "skills": "neo4j"
  },
  {
    "avg_salary": "175000",
    "skills": "cassandra"
  },
  {
    "avg_salary": "167500",
    "skills": "dplyr"
  },
  {
    "avg_salary": "162500",
    "skills": "unix"
  },
  {
    "avg_salary": "157000",
    "skills": "perl"
  },
  {
    "avg_salary": "150000",
    "skills": "twilio"
  },
  {
    "avg_salary": "147500",
    "skills": "spring"
  },
  {
    "avg_salary": "146500",
    "skills": "c"
  },
  {
    "avg_salary": "138516",
    "skills": "angular"
  },
  {
    "avg_salary": "135294",
    "skills": "gcp"
  },
  {
    "avg_salary": "135000",
    "skills": "kafka"
  },
  {
    "avg_salary": "133169",
    "skills": "pandas"
  },
  {
    "avg_salary": "130000",
    "skills": "scikit-learn"
  },
  {
    "avg_salary": "127500",
    "skills": "linux"
  },
  {
    "avg_salary": "126250",
    "skills": "shell"
  },
  {
    "avg_salary": "126005",
    "skills": "express"
  },
  {
    "avg_salary": "125147",
    "skills": "java"
  },
  {
    "avg_salary": "125062",
    "skills": "numpy"
  },
  {
    "avg_salary": "124044",
    "skills": "c++"
  },
  {
    "avg_salary": "123750",
    "skills": "git"
  },
  {
    "avg_salary": "122692",
    "skills": "azure"
  },
  {
    "avg_salary": "122500",
    "skills": "airflow"
  },
  {
    "avg_salary": "122500",
    "skills": "plotly"
  },
  {
    "avg_salary": "120763",
    "skills": "qlik"
  }
]

*/