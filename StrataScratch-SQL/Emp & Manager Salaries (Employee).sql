/* Link - https://platform.stratascratch.com/coding/9894-employee-and-manager-salaries?code_type=1 */

select e.first_name
     , e.salary employee_salary
from employee e
join employee m
  ON e.manager_id = m.id
WHERE e.salary > m.salary