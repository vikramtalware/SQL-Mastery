/*Link - https://platform.stratascratch.com/coding/2102-flags-per-video?code_type=1 */

select video_id
     , COUNT(DISTINCT COALESCE(user_firstname,'') || ' ' ||COALESCE(user_lastname,'')) n_users
from user_flags
where flag_id IS NOT NULL
group by 1