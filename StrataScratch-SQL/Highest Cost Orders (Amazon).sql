/* Link - https://platform.stratascratch.com/coding/9915-highest-cost-orders?code_type=1 */

WITH daily_order_costs AS
(select c.id
     , c.first_name
     , o.order_date
     , sum(o.total_order_cost) total_order_cost
from customers c
join orders o
  on o.cust_id = c.id
where o.order_date between '2019-02-01' and '2019-05-01'
group by 1,2,3)

SELECT first_name
     , total_order_cost
     , order_date
FROM daily_order_costs d
WHERE total_order_cost = (SELECT max(total_order_cost) FROM daily_order_costs)