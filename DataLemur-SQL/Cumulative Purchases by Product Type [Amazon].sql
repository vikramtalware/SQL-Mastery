/*
This is the same question as problem #4 in the SQL Chapter of Ace the Data Science Interview!

Assume you're given a table containing Amazon purchasing activity. 
Write a query to calculate the cumulative purchases for each product type, ordered chronologically.

The output should consist of the order date, product, and the cumulative sum of quantities purchased.

total_trans Table:
Column Name	Type
order_id	integer
product_type	string
quantity	integer
order_date	datetime

total_trans Example Input:
order_id	product_type	quantity	order_date
213824	printer	20	06/27/2022 12:00:00
132842	printer	18	06/28/2022 12:00:00

Example Output:
order_date	product_type	cum_purchased
06/27/2022 12:00:00	printer	20
06/28/2022 12:00:00	printer	38

Explanation:
On June 27, 2022, a total of 20 printers were purchased. 
Following that, on June 28, 2022, an additional 38 printers were purchased, resulting in a cumulative total of 58 printers (20 + 38).

The dataset you are querying against may have different input & output - this is just an example!
*/
SELECT order_date
     , product_type
     , SUM(quantity) OVER(PARTITION BY product_type ORDER BY order_date) cum_purchased
FROM total_trans
ORDER BY order_date