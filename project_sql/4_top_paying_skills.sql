/*
    Question: What are the top skills based on salary?
        - Look at the average salary associated with each skill for Data Analyst positions
        - Focuses on roles with specified salaries, regardless of location
        - Why? It reveals how different skills impact salary levels for #Data Analyts and
            helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL 
    AND job_work_from_home = True
GROUP BY 
    skills
ORDER BY 
   avg_salary DESC
LIMIT 25

/*
    Quick Insights into Top-Paying Data Analyst Skills (2023-2024)
1. Big Data & Cloud Technologies Dominate High Salaries
PySpark leads the top-paying skills with an average salary of $208,172, reflecting the high demand for big data processing expertise.
Databricks ($141,907) and Google Cloud Platform (GCP) ($122,500) show that cloud-based data engineering and machine learning platforms offer lucrative opportunities.

2. Version Control & DevOps Are Highly Valued
Bitbucket ($189,155) and GitLab ($154,500) are among the highest-paying skills, showing that strong version control knowledge is essential for data teams.
Jenkins ($125,436) and Kubernetes ($132,500) indicate that automation and containerization skills contribute to higher salaries.

3. Machine Learning & AI-Related Skills Are Rewarded
DataRobot ($155,486) and Scikit-Learn ($125,781) highlight that expertise in machine learning automation and frameworks can significantly boost earning potential.

4. Programming & Scripting Languages Play a Key Role
Swift ($153,750) and Golang ($145,000) suggest that data analysts with backend or app development experience are highly paid.
Scala ($124,903) remains valuable for big data applications.

5. Advanced Analytics & BI Tools Command High Salaries
MicroStrategy ($121,619) stands out as a high-paying BI tool, showing demand for advanced business intelligence expertise.
Couchbase ($160,515) and Elasticsearch ($145,000) indicate that specialized database and search engine expertise offer strong earning potential.
*/