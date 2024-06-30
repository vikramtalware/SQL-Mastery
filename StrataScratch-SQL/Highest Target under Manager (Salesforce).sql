/* Link - https://platform.stratascratch.com/coding/9905-highest-target-under-manager?code_type=1 */

WITH targets AS
(select first_name
     , max(target) target
from salesforce_employees
where manager_id = 13
group by 1)

SELECT first_name
     , target
FROM targets
WHERE target = (SELECT max(target) FROM targets)