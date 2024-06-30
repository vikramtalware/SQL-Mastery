/*Link - https://platform.stratascratch.com/coding/9781-find-the-rate-of-processed-tickets-for-each-type?code_type=1 */

select type
     , CAST(COUNT(CASE WHEN processed = TRUE THEN complaint_id END) AS DECIMAL)/COUNT(*) processed_rate
from facebook_complaints
group by 1;