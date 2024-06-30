/* Link - https://platform.stratascratch.com/coding/2005-share-of-active-users?code_type=1 */

select CAST(COUNT(DISTINCT CASE WHEN status ='open' THEN user_id END)AS DECIMAL)/count(*) active_users_share
from fb_active_users
where country = 'USA';