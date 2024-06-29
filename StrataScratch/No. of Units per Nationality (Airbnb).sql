/* Link - https://platform.stratascratch.com/coding/10156-number-of-units-per-nationality?code_type=1*/

select nationality
     , COUNT(distinct unit_id)apartment_count
from airbnb_hosts h
join airbnb_units u
  on h.host_id = u.host_id
where unit_type = 'Apartment'
  and age < 30
group by 1;