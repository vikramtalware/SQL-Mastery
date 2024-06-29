/* Link - https://platform.stratascratch.com/coding/10159-ranking-most-active-guests?code_type=1 */

select dense_rank() over(order by sum_n_messages desc) ranking
     , id_guest
     , sum_n_messages
FROM(select id_guest
     , sum(n_messages) sum_n_messages
from airbnb_contacts
group by 1)a;