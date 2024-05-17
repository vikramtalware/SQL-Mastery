/*Intuit, a company known for its tax filing products like TurboTax and QuickBooks, offers multiple versions of these products.

Write a query that identifies the user IDs of individuals who have filed their taxes using any version of TurboTax for three or more consecutive years. Each user is allowed to file taxes once a year using a specific product. Display the output in the ascending order of user IDs.

filed_taxes Table:
Column Name	Type
filing_id	integer
user_id	varchar
filing_date	datetime
product	varchar
filed_taxes Example Input:
filing_id	user_id	filing_date	product
1	1	4/14/2019	TurboTax Desktop 2019
2	1	4/15/2020	TurboTax Deluxe
3	1	4/15/2021	TurboTax Online
4	2	4/07/2020	TurboTax Online
5	2	4/10/2021	TurboTax Online
6	3	4/07/2020	TurboTax Online
7	3	4/15/2021	TurboTax Online
8	3	3/11/2022	QuickBooks Desktop Pro
9	4	4/15/2022	QuickBooks Online
Example Output:
user_id
1
Explanation:
User 1 has consistently filed their taxes using TurboTax for 3 consecutive years. User 2 is excluded from the results because they missed filing in the third year and User 3 transitioned to using QuickBooks in their third year.

The dataset you are querying against may have different input & output - this is just an example!*/

SELECT DISTINCT user_id
FROM (
SELECT user_id
           , DATE_TRUNC('year',filing_date) filing_year
           , LAG(DATE_TRUNC('year',filing_date)) OVER(PARTITION BY user_id ORDER BY filing_date) previous_year
           , LEAD(DATE_TRUNC('year',filing_date)) OVER(PARTITION BY user_id ORDER BY filing_date) following_year
      FROM filed_taxes
      WHERE product LIKE 'TurboTax%'
      )a
WHERE previous_year = filing_year - interval '1' YEAR
  AND following_year = filing_year + interval '1' YEAR