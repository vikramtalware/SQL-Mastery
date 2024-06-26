/*
 This is the same question as problem #9 in the SQL Chapter of Ace the Data Science Interview!
 
 Assume you're given a table containing Etsy user transactions. 
 Write a query that retrieves the customers whose first transaction was valued at $50 or more. 
 Output the total number of users who meet this criteria.
 
 Instructions:
 
 To determine the first transaction for each user, use the transaction_date field.
 Take into account scenarios where a user had multiple transactions on the same day. 
 Use a specific function (we can't give too much away 😉) to handle these cases and correctly identify the first transaction.
 Effective June 14th, 2023, the solution and hints have been revised.
 
 user_transactions Table:
 Column Name	Type
 transaction_id	integer
 user_id	integer
 spend	decimal
 transaction_date	timestamp
 
 user_transactions Example Input:
 transaction_id	user_id	spend	transaction_date
 759274	111	49.50	02/03/2022 00:00:00
 850371	111	51.00	03/15/2022 00:00:00
 615348	145	36.30	03/22/2022 00:00:00
 137424	156	151.00	04/04/2022 00:00:00
 248475	156	87.00	04/16/2022 00:00:00
 
 Example Output:
 users
 1
 Explanation:
 Among all the users, only user ID 156 had their first transaction valued at over $50.
 
 The dataset you are querying against may have different input & output - this is just an example!
 */

SELECT COUNT(DISTINCT user_id) users
FROM
(SELECT user_id
     , spend
     , transaction_date
     , ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date ASC, spend DESC) rn
FROM user_transactions)a
WHERE rn = 1 
  AND spend > 50
