/*
This is the same question as problem #7 in the SQL Chapter of Ace the Data Science Interview!

Assume you are given the table below containing information on user purchases. 
Write a query to obtain the number of users who purchased the same product on two or more different days. Output the number of unique users.

PS. On 26 Oct 2022, we expanded the purchases data set, thus the official output may vary from before.

purchases Table:
Column Name	Type
user_id	integer
product_id	integer
quantity	integer
purchase_date	datetime

purchasesExample Input:
user_id	product_id	quantity	purchase_date
536	3223	6	01/11/2022 12:33:44
827	3585	35	02/20/2022 14:05:26
536	3223	5	03/02/2022 09:33:28
536	1435	10	03/02/2022 08:40:00
827	2452	45	04/09/2022 00:00:00

Example Output:
repeat_purchasers
1
The dataset you are querying against may have different input & output - this is just an example!
*/

SELECT COUNT(user_id) repeat_purchasers
FROM (SELECT user_id
      FROM purchases
      GROUP BY 1
      HAVING COUNT(DISTINCT CAST(purchase_date AS DATE)) > 1)a