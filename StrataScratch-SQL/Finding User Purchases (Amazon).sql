/* Link - https://platform.stratascratch.com/coding/10322-finding-user-purchases?code_type=1 */

SELECT user_id
FROM
(SELECT user_id
     , next_order_date - created_at date_diff
FROM (select user_id
           , created_at
           , lead(created_at) OVER(PARTITION BY user_id ORDER BY created_at) next_order_date
      from amazon_transactions
      order by 1,2)a
WHERE next_order_date IS NOT NULL)b
WHERE date_diff <= 7
GROUP BY 1;