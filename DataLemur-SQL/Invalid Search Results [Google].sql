/*
Assume you are given the table below containing the information on the searches attempted and the percentage of invalid searches by country.
 Write a query to obtain the percentage of invalid searches.

Output the country in ascending order, total searches and overall percentage of invalid searches rounded to 2 decimal places.

Notes:

num_search = Number of searches attempted; invalid_result_pct = Percentage of invalid searches.
In cases where countries have search attempts but do not have a percentage of invalid searches in invalid_result_pct, it should be excluded, and vice versa.
To find the percentages, multiply by 100.0 and not 100 to avoid integer division.

search_category Table:
Column Name	Type
country	string
search_cat	string
num_search	integer
invalid_result_pct	decimal

search_category Example Input:
country	search_cat	num_search	invalid_result_pct
UK	home	null	null
UK	tax	98000	1.00
UK	travel	100000	3.25

Example Output:
country	total_search	invalid_searches_pct
UK	198000	2.14

Example: UK had 98,000 * 1% + 100,000 x 3.25% = 4,230 invalid searches, out of the total 198,000 searches, resulting in a percentage of 2.14%.
The dataset you are querying against may have different input & output - this is just an example!
*/
SELECT country
     , total_searches
     , ROUND(100.0 * SUM(invalid_searches)/total_searches,2) invalid_search_pct
FROM (SELECT country
     , num_search * (invalid_result_pct/100.0) invalid_searches
     , SUM(num_search) OVER(PARTITION BY country) total_searches
FROM search_category
WHERE invalid_result_pct IS NOT NULL)a
GROUP BY 1,2
ORDER BY 1