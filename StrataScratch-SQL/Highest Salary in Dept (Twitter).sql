/*Link - https://platform.stratascratch.com/coding/9897-highest-salary-in-department?code_type=1 */

WITH salaries AS
(select department
     , first_name
     , max(salary) salary
from employee
group by 1,2)

SELECT department
     , first_name
     , salary
FROM (SELECT *
         , RANK() OVER(PARTITION BY department ORDER BY salary DESC) rn
        FROM salaries)a
WHERE rn = 1
ORDER BY 3 DESC