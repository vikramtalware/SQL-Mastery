/* Link - https://platform.stratascratch.com/coding/514-marketing-campaign-success-advanced?code_type=1 */

SELECT COUNT(DISTINCT user_id) 
FROM (
    SELECT  user_id
         ,  product_id
         ,  created_at
         ,  RANK() OVER (PARTITION BY user_id ORDER BY created_at) AS rn_1
         ,  RANK() OVER (PARTITION BY user_id, product_id ORDER BY created_at) AS rn_2
    FROM marketing_campaign) AS agg_tab
WHERE rn_1 > 1 AND rn_2 = 1;
