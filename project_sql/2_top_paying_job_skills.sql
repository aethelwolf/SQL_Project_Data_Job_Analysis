/* 
Question: What skills are required for the top-paying Data Analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from the first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying job demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/


WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        company_dim.name AS company_name,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'New York, NY' AND
        salary_year_avg IS NOT NULL
    ORDER BY 
        salary_year_avg DESC
    LIMIT 
        10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;

-- Utilized AI to run some quick insights
-- Utlized Excel to confirm AI insights and look for other trends

/*
Most in-demand skills (appearing across multiple postings):

- SQL (6 mentions)
- Python (6 mentions)
- Excel (3 mentions)
- R (3 mentions)
- Express (3 mentions – possibly referring to Express.js, though unusual for analysts)

[
  {
    "job_id": 339646,
    "job_title": "Data Sector Analyst - Hedge Fund in Midtown",
    "company_name": "Coda Search│Staffing",
    "salary_year_avg": "240000.0",
    "skills": "sql"
  },
  {
    "job_id": 339646,
    "job_title": "Data Sector Analyst - Hedge Fund in Midtown",
    "company_name": "Coda Search│Staffing",
    "salary_year_avg": "240000.0",
    "skills": "python"
  },
  {
    "job_id": 339646,
    "job_title": "Data Sector Analyst - Hedge Fund in Midtown",
    "company_name": "Coda Search│Staffing",
    "salary_year_avg": "240000.0",
    "skills": "pandas"
  },
  {
    "job_id": 841064,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "company_name": "TikTok",
    "salary_year_avg": "239777.5",
    "skills": "sql"
  },
  {
    "job_id": 841064,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "company_name": "TikTok",
    "salary_year_avg": "239777.5",
    "skills": "python"
  },
  {
    "job_id": 841064,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "company_name": "TikTok",
    "salary_year_avg": "239777.5",
    "skills": "r"
  },
  {
    "job_id": 841064,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "company_name": "TikTok",
    "salary_year_avg": "239777.5",
    "skills": "express"
  },
  {
    "job_id": 1713491,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "company_name": "TikTok",
    "salary_year_avg": "239777.5",
    "skills": "sql"
  },
  {
    "job_id": 1713491,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "company_name": "TikTok",
    "salary_year_avg": "239777.5",
    "skills": "python"
  },
  {
    "job_id": 1713491,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "company_name": "TikTok",
    "salary_year_avg": "239777.5",
    "skills": "r"
  },
  {
    "job_id": 1713491,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "company_name": "TikTok",
    "salary_year_avg": "239777.5",
    "skills": "express"
  },
  {
    "job_id": 204500,
    "job_title": "Reference Data Analyst",
    "company_name": "Selby Jennings",
    "salary_year_avg": "225000.0",
    "skills": "sql"
  },
  {
    "job_id": 204500,
    "job_title": "Reference Data Analyst",
    "company_name": "Selby Jennings",
    "salary_year_avg": "225000.0",
    "skills": "python"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "company_name": "Pronix Inc",
    "salary_year_avg": "185000.0",
    "skills": "sql"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "company_name": "Pronix Inc",
    "salary_year_avg": "185000.0",
    "skills": "neo4j"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "company_name": "Pronix Inc",
    "salary_year_avg": "185000.0",
    "skills": "elasticsearch"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "company_name": "Pronix Inc",
    "salary_year_avg": "185000.0",
    "skills": "sql server"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "company_name": "Pronix Inc",
    "salary_year_avg": "185000.0",
    "skills": "aws"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "company_name": "Pronix Inc",
    "salary_year_avg": "185000.0",
    "skills": "oracle"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "company_name": "Pronix Inc",
    "salary_year_avg": "185000.0",
    "skills": "spark"
  },
  {
    "job_id": 1563879,
    "job_title": "Data Analysis Manager",
    "company_name": "Pronix Inc",
    "salary_year_avg": "185000.0",
    "skills": "kafka"
  },
  {
    "job_id": 396924,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "company_name": "TikTok",
    "salary_year_avg": "181177.5",
    "skills": "sql"
  },
  {
    "job_id": 396924,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "company_name": "TikTok",
    "salary_year_avg": "181177.5",
    "skills": "python"
  },
  {
    "job_id": 396924,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "company_name": "TikTok",
    "salary_year_avg": "181177.5",
    "skills": "r"
  },
  {
    "job_id": 396924,
    "job_title": "Investigations and Insights Lead Data Analyst - USDS",
    "company_name": "TikTok",
    "salary_year_avg": "181177.5",
    "skills": "express"
  },
  {
    "job_id": 386504,
    "job_title": "Data Associate, Investor Relations",
    "company_name": "Brewer Morris",
    "salary_year_avg": "180000.0",
    "skills": "python"
  },
  {
    "job_id": 386504,
    "job_title": "Data Associate, Investor Relations",
    "company_name": "Brewer Morris",
    "salary_year_avg": "180000.0",
    "skills": "excel"
  },
  {
    "job_id": 386504,
    "job_title": "Data Associate, Investor Relations",
    "company_name": "Brewer Morris",
    "salary_year_avg": "180000.0",
    "skills": "tableau"
  },
  {
    "job_id": 386504,
    "job_title": "Data Associate, Investor Relations",
    "company_name": "Brewer Morris",
    "salary_year_avg": "180000.0",
    "skills": "power bi"
  },
  {
    "job_id": 1468996,
    "job_title": "Data Analyst & Investor Relations",
    "company_name": "Marlowe Partners LP",
    "salary_year_avg": "175000.0",
    "skills": "excel"
  },
  {
    "job_id": 1468996,
    "job_title": "Data Analyst & Investor Relations",
    "company_name": "Marlowe Partners LP",
    "salary_year_avg": "175000.0",
    "skills": "powerpoint"
  },
  {
    "job_id": 415878,
    "job_title": "Cloud Financial Data Analyst, Director - Financial Operations (FinOps)",
    "company_name": "Smarsh",
    "salary_year_avg": "175000.0",
    "skills": "aws"
  },
  {
    "job_id": 415878,
    "job_title": "Cloud Financial Data Analyst, Director - Financial Operations (FinOps)",
    "company_name": "Smarsh",
    "salary_year_avg": "175000.0",
    "skills": "gcp"
  },
  {
    "job_id": 415878,
    "job_title": "Cloud Financial Data Analyst, Director - Financial Operations (FinOps)",
    "company_name": "Smarsh",
    "salary_year_avg": "175000.0",
    "skills": "excel"
  }
]
*/