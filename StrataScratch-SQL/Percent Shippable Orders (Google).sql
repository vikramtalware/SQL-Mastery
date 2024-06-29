/*Link - https://platform.stratascratch.com/coding/10090-find-the-percentage-of-shipable-orders?code_type=3 */

select (SUM(CASE WHEN address IS NOT NULL THEN 1 ELSE 0 END)/count(*))*100 as percent_shipable
from orders o
left join customers c
  on o.cust_id = c.id