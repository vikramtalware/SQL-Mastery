/*
Link - https://platform.stratascratch.com/coding/2119-most-lucrative-products?code_type=1

You have been asked to find the 5 most lucrative products in terms of total revenue for the first half of 2022 (from January to June inclusive).
Output their IDs and the total revenue.
Table: online_orders
*/

select product_id
     , SUM(cost_in_dollars * units_sold) revenue 
from online_orders
where date between '2022-01-01' and '2022-06-30'
group by 1
order by 2 DESC
limit 5;