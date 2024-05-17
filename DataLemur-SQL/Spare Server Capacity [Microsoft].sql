/*
Microsoft Azure's capacity planning team wants to understand how much data its customers are using, 
and how much spare capacity is left in each of its data centers. You’re given three tables: customers, data centers, and forecasted_demand.

Write a query to find each data centre’s total unused server capacity. Output the data center id in ascending order and the total spare capacity.

Definitions:

monthly_capacity is the total monthly server capacity for each centers.
monthly_demand is the server demand for each customer.
P.S. If you've read the Ace the Data Science Interview and liked it, consider writing us a review?

datacenters Table:
Column Name	Type
datacenter_id	integer
name	string
monthly_capacity	integer

datacenters Example Input:
datacenter_id	name	monthly_capacity
1	London	100
3	Amsterdam	250
4	Hong Kong	400

forecasted_demand Table:
Column Name	Type
customer_id	integer
datacenter_id	integer
monthly_demand	integer

forecasted_demand Example Input:
customer_id	datacenter_id	monthly_demand
109	4	120
144	3	60
144	4	105
852	1	60
852	3	178

Example Output:
datacenter_id	spare_capacity
1	40
3	12
4	175
The dataset you are querying against may have different input & output - this is just an example!
*/

SELECT datacenter_id
     , monthly_capacity - demand as spare_capacity
FROM (SELECT d.datacenter_id
     , d.monthly_capacity
     , SUM(f.monthly_demand) demand
FROM datacenters d
LEFT JOIN forecasted_demand f
  ON d.datacenter_id = f.datacenter_id
GROUP BY 1,2)a
ORDER BY 1 ASC