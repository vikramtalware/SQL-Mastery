/*
Link - https://platform.stratascratch.com/coding/9913-order-details?code_type=1

Find order details made by Jill and Eva.
Consider the Jill and Eva as first names of customers.
Output the order date, details and cost along with the first name.
Order records based on the customer id in ascending order.

Tables: customers, orders

*/

select c.first_name
     , o.order_date
     , o.order_details
     , o.total_order_cost
from customers c
join orders o
  on c.id = o.cust_id
where first_name in ('Jill', 'Eva')
order by cust_id asc;