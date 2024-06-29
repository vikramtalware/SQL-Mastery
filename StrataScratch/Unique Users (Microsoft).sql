/*
Link - https://platform.stratascratch.com/coding/2024-unique-users-per-client-per-month?code_type=1

Write a query that returns the number of unique users per client per month

Table: fact_events
*/

select client_id
     , extract(month from time_id) as month
     , COUNT(DISTINCT user_id) user_count
from fact_events
group by 1,2
order by 1,2