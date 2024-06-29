/* Link - https://platform.stratascratch.com/coding/10308-salaries-differences?code_type=1

Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. Output just the absolute difference in salaries.

Tables: db_employee, db_dept
*/

SELECT
ABS(
(select MAX(e.salary) mar_sal
from db_employee e
join db_dept d
  ON d.id = e.department_id
WHERE department IN ('marketing'))
-
(select MAX(e.salary) mar_engg
from db_employee e
join db_dept d
  ON d.id = e.department_id
WHERE department IN ('engineering'))) AS salary_difference
