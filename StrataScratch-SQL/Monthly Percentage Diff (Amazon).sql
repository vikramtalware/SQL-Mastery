/* Link - https://platform.stratascratch.com/coding/10319-monthly-percentage-difference?code_type=1 */

WITH raw_data AS
(select to_char(created_at, 'YYYY-MM') as year_month
     , SUM(value) revenue
from sf_transactions
group by 1
order by 1)

SELECT year_month
     , ROUND(100 * CAST((revenue - LAG(revenue) OVER())AS DECIMAL)/LAG(revenue) OVER(),2) rev_diff
FROM raw_data