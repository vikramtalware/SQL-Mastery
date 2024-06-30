/* Link - https://platform.stratascratch.com/coding/10300-premium-vs-freemium?code_type=1 */

WITH raw_data AS
(SELECT DISTINCT df.date
      , ad.paying_customer
      , SUM(downloads) OVER(PARTITION by date, paying_customer) n_downs
FROM ms_user_dimension ud
JOIN ms_acc_dimension ad
  ON ud.acc_id = ad.acc_id
JOIN ms_download_facts df
  ON ud.user_id = df.user_id
ORDER BY 1)
 
SELECT date
     , non_paying
     , paying
FROM (SELECT date,
       SUM(CASE WHEN paying_customer = 'yes' THEN n_downs ELSE 0 END) AS paying,
       SUM(CASE WHEN paying_customer = 'no' THEN n_downs ELSE 0 END) AS non_paying
      FROM raw_data
      GROUP BY 1)a
WHERE non_paying > paying;