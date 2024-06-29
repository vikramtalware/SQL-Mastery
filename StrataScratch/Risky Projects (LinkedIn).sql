/* Link - https://platform.stratascratch.com/coding/10304-risky-projects?code_type=1 */

WITH raw_data AS
(select p.id project_id
      , budget
      , (SUM(salary)/365) * (p.end_date - p.start_date) as prorated_employee_expense
from linkedin_emp_projects ep
join linkedin_employees e
  on ep.emp_id = e.id
join linkedin_projects p
  on ep.project_id = p.id
GROUP BY p.id, budget, end_date, start_date
)

SELECT p.title
     , p.budget
     , CEILING(r.prorated_employee_expense) prorated_employee_expense
FROM raw_data r
JOIN linkedin_projects p
  ON p.id = r.project_id
WHERE p.budget < r.prorated_employee_expense
ORDER BY 1