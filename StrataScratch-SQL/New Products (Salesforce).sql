/*
Link - https://platform.stratascratch.com/coding/10318-new-products?code_type=1
*/

SELECT a.company_name,
       brand_2020 - brand_2019 net_products
FROM
  (SELECT company_name,
          COUNT(DISTINCT product_name) AS brand_2020
   FROM car_launches
   WHERE YEAR = 2020
   GROUP BY 1) a
    FULL JOIN
  (SELECT company_name,
          COUNT(DISTINCT product_name) AS brand_2019
   FROM car_launches
   WHERE YEAR = 2019
   GROUP BY 1) b 
 ON a.company_name = b.company_name


