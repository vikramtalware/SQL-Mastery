/*
You are given a table of PayPal payments showing the payer, the recipient, and the amount paid. 
A two-way unique relationship is established when two people send money back and forth. 
Write a query to find the number of two-way unique relationships in this data.

Assumption:

A payer can send money to the same recipient multiple times.
payments Table:

Column Name	 Type
payer_id	 integer
recipient_id integer
amount	     integer

payments Example Input:
payer_id	recipient_id	amount
101	        201	            30
201	        101	            10
101	        301	            20
301	        101	            80
201	        301	            70

Example Output:
unique_relationships
2

Explanation
There are 2 unique two-way relationships between:

ID 101 and ID 201
ID 101 and ID 301
The dataset you are querying against may have different input & output - this is just an example!
*/

SELECT COUNT(*)/2 unique_pairs
FROM
(SELECT a.payer_id
     , b.payer_id
FROM payments a
JOIN payments b
  ON a.recipient_id = b.payer_id
 AND a.payer_id = b.recipient_id
GROUP BY 1,2)a