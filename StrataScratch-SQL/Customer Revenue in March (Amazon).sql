/* Link - https://platform.stratascratch.com/coding/9782-customer-revenue-in-march?code_type=1 */

select cust_id
     , SUM(total_order_cost)
from orders
where order_date between '2019-03-01' and '2019-03-31'
group by 1
order by 2 desc;