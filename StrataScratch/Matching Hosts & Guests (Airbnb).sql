/* Link - https://platform.stratascratch.com/coding/10078-find-matching-hosts-and-guests-in-a-way-that-they-are-both-of-the-same-gender-and-nationality?code_type=3 */

select host_id
     , guest_id
from airbnb_hosts h
join airbnb_guests g
  on g.gender = h.gender
 and g.nationality = h.nationality
group by 1,2;