/* Link - https://platform.stratascratch.com/coding/9892-second-highest-salary?code_type=1 */

select salary
from employee
group by 1
order by 1 DESC
limit 1 offset 1;