/*Link - https://platform.stratascratch.com/coding/2104-user-with-most-approved-flags?code_type=1 */

WITH raw_data AS
(select user_firstname || ' ' || user_lastname name
     , COUNT(DISTINCT CASE WHEN reviewed_by_yt = 'TRUE' and reviewed_outcome = 'APPROVED' THEN video_id END) flagged
from user_flags f
join flag_review r
 on f.flag_id = r.flag_id
GROUP BY 1)

SELECT name
FROM raw_data
WHERE flagged = (SELECT max(flagged) FROM raw_data)