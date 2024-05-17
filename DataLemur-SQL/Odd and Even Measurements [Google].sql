/*
This is the same question as problem #28 in the SQL Chapter of Ace the Data Science Interview!

Assume you're given a table with measurement values obtained from a Google sensor over multiple days with measurements taken multiple times within each day.
Write a query to calculate the sum of odd-numbered and even-numbered measurements separately for a particular day and display the results in two different columns. 
Refer to the Example Output below for the desired format.

Definition:
Within a day, measurements taken at 1st, 3rd, and 5th times are considered odd-numbered measurements, and measurements taken at 2nd, 4th, and 6th times are considered even-numbered measurements.
Effective April 15th, 2023, the question and solution for this question have been revised.

measurements Table:
Column Name	Type
measurement_id	integer
measurement_value	decimal
measurement_time	datetime

measurements Example Input:
measurement_id	measurement_value	measurement_time
131233	1109.51	07/10/2022 09:00:00
135211	1662.74	07/10/2022 11:00:00
523542	1246.24	07/10/2022 13:15:00
143562	1124.50	07/11/2022 15:00:00
346462	1234.14	07/11/2022 16:45:00

Example Output:
measurement_day	odd_sum	even_sum
07/10/2022 00:00:00	2355.75	1662.74
07/11/2022 00:00:00	1124.50	1234.14

Explanation
Based on the results,

On 07/10/2022, the sum of the odd-numbered measurements is 2355.75, while the sum of the even-numbered measurements is 1662.74.
On 07/11/2022, there are only two measurements available. The sum of the odd-numbered measurements is 1124.50, and the sum of the even-numbered measurements is 1234.14.
The dataset you are querying against may have different input & output - this is just an example!
*/
SELECT DATE(measurement_time) measurement_time
     , SUM(CASE WHEN rn%2 = 0 THEN measurement_value END) even_sum
     , SUM(CASE WHEN rn%2 = 1 THEN measurement_value END) odd_sum
FROM
(SELECT measurement_time
      , measurement_value
      , ROW_NUMBER() OVER(PARTITION BY DATE(measurement_time) ORDER BY measurement_time ASC) rn
FROM measurements)a
GROUP BY 1
ORDER BY 1
