/*
Link - https://platform.stratascratch.com/coding/2056-number-of-shipments-per-month?code_type=1

Write a query that will calculate the number of shipments per month. The unique key for one shipment is a combination of shipment_id and sub_id. 
Output the year_month in format YYYY-MM and the number of shipments in that month.

Table: amazon_shipment
*/

SELECT to_char(shipment_date, 'YYYY-MM') AS year_month
      ,COUNT( CONCAT (shipment_id, sub_id))
FROM amazon_shipment
group by 1