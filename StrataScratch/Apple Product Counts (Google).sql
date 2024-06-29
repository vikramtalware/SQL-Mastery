/* Link - https://platform.stratascratch.com/coding/10141-apple-product-counts?code_type=1 */

select language 
     , COUNT(DISTINCT CASE WHEN lower(device) IN ('macbook pro', 'iphone 5s', 'ipad air') THEN e.user_id END) n_apple_users
     , COUNT(DISTINCT e.user_id) n_total_users
from playbook_events e
join playbook_users u
  on e.user_id = u.user_id
GROUP BY 1
ORDER BY 3 DESC;