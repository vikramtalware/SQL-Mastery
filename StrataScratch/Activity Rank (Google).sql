/* Link - https://platform.stratascratch.com/coding/10351-activity-rank?code_type=1 */

select from_user
     , COUNT(to_user) total_emails
     , ROW_NUMBER() OVER(ORDER BY COUNT(to_user) DESC, from_user ASC) row_number
from google_gmail_emails
group by 1;