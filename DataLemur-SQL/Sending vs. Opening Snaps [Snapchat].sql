/*
This is the same question as problem #25 in the SQL Chapter of Ace the Data Science Interview!
Assume you're given tables with information on Snapchat users, including their ages and time spent sending and opening snaps.
Write a query to obtain a breakdown of the time spent sending vs. opening snaps as a percentage of total time spent on these activities grouped by age group. 
Round the percentage to 2 decimal places in the output.

Notes:

Calculate the following percentages:
time spent sending / (Time spent sending + Time spent opening)
Time spent opening / (Time spent sending + Time spent opening)
To avoid integer division in percentages, multiply by 100.0 and not 100.
Effective April 15th, 2023, the solution has been updated and optimised.

activities Table
Column Name	Type
activity_id	integer
user_id	integer
activity_type	string ('send', 'open', 'chat')
time_spent	float
activity_date	datetime

activities Example Input
activity_id	user_id	activity_type	time_spent	activity_date
7274	123	open	4.50	06/22/2022 12:00:00
2425	123	send	3.50	06/22/2022 12:00:00
1413	456	send	5.67	06/23/2022 12:00:00
1414	789	chat	11.00	06/25/2022 12:00:00
2536	456	open	3.00	06/25/2022 12:00:00

age_breakdown Table
Column Name	Type
user_id	integer
age_bucket	string ('21-25', '26-30', '31-25')

age_breakdown Example Input
user_id	age_bucket
123	31-35
456	26-30
789	21-25

Example Output
age_bucket	send_perc	open_perc
26-30	65.40	34.60
31-35	43.75	56.25

Explanation
Using the age bucket 26-30 as example, the time spent sending snaps was 5.67 and the time spent opening snaps was 3.
To calculate the percentage of time spent sending snaps, we divide the time spent sending snaps by the total time spent on sending and opening snaps, which is 5.67 + 3 = 8.67.
So, the percentage of time spent sending snaps is 5.67 / (5.67 + 3) = 65.4%, and the percentage of time spent opening snaps is 3 / (5.67 + 3) = 34.6%.

The dataset you are querying against may have different input & output - this is just an example!
*/
WITH cte1 AS
(SELECT b.age_bucket
      , a.activity_type
      , SUM(time_spent) time_spent
 FROM activities a
 JOIN age_breakdown b
   ON a.user_id = b.user_id
 WHERE a.activity_type IN ('open','send')
 GROUP BY 1,2)

,cte2 AS
(SELECT age_bucket
      , SUM(time_spent) total_time
FROM activities a
JOIN age_breakdown b
  ON a.user_id = b.user_id
WHERE a.activity_type IN ('open','send')
GROUP BY 1)

SELECT a.age_bucket
     , b.send_pct
     , a.open_pct
FROM
(SELECT c1.age_bucket
     , ROUND(100.0 * c1.time_spent/c2.total_time,2) open_pct
FROM cte1 c1
JOIN cte2 c2
  ON c1.age_bucket = c2.age_bucket
WHERE c1.activity_type = 'open')a
FULL OUTER JOIN
(SELECT c2.age_bucket
     , ROUND(100.0 * c1.time_spent/c2.total_time,2) send_pct
FROM cte1 c1
JOIN cte2 c2
  ON c1.age_bucket = c2.age_bucket
WHERE c1.activity_type = 'send')b
  ON a.age_bucket = b.age_bucket