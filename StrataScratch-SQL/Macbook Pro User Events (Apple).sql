/* Link - https://platform.stratascratch.com/coding/9653-count-the-number-of-user-events-performed-by-macbookpro-users?code_type=1

Count the number of user events performed by MacBookPro users.
Output the result along with the event name.
Sort the result based on the event count in the descending order.

Table: playbook_events*/

select event_name
     , count(user_id) 
from playbook_events
where lower(device) like 'macbook%pro%'
group by 1
order by 2 desc