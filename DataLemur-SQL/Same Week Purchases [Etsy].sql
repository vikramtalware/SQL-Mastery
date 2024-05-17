/* This is the same question as problem #29 in the SQL Chapter of Ace the Data Science Interview!

You are given the two tables containing information on Etsy’s user signups and purchases. 
Write a query to obtain the percentage of users who signed up and made a purchase within 7 days of signing up. 
The result should be rounded to the nearest 2 decimal places.

Assumptions:

Signups who didn't buy any products yet should also count as part of the percentage of users who signed up and made a purchase within 7 days of signing up
If the signup date is on 06/21/2022 and the purchase date on 06/26/2022, then the user makes up part of the percentage of users who signed up and purchased within the 7 days of signing up.

signups Table:
Column Name	Type
user_id	integer
signup_date	datetime

signups Example Input:
user_id	signup_date
445	06/21/2022 12:00:00
742	06/19/2022 12:00:00
648	06/24/2022 12:00:00
789	06/27/2022 12:00:00
123	06/27/2022 12:00:00

user_purchases Table:
Column Name	Type
user_id	integer
product_id	integer
purchase_amount	decimal
purchase_date	datetime

user_purchases Example Input:
user_id	product_id	purchase_amount	purchase_date
244	7575	45.00	06/22/2022 12:00:00
742	1241	50.00	06/28/2022 12:00:00
648	3632	55.50	06/25/2022 12:00:00
123	8475	67.30	06/29/2022 12:00:00
244	2341	74.10	06/30/2022 12:00:00

Example Output:
single_purchase_pct
40.00
Explanation: The only users who purchased within 7 days of signing up are users 648 and 123. The total count of given signups is 5, resulting in a percentage of 2/5 = 40%.

The dataset you are querying against may have different input & output - this is just an example! */

WITH users AS
(SELECT s.user_id
     , s.signup_date
     , MIN(u.purchase_date) min_purchase_date
FROM signups s
LEFT JOIN user_purchases u
  ON s.user_id = u.user_id
GROUP BY 1,2)


SELECT ROUND(100.0 * SUM(CASE WHEN purchases = 1 THEN 1 END)/COUNT(*),2) same_week_purchases
FROM
(SELECT user_id
     , CASE WHEN signup_date <= min_purchase_date + INTERVAL '7' day THEN 1 ELSE 0 END purchases
FROM users)a