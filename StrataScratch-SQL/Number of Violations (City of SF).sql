/* Link - https://platform.stratascratch.com/coding/9728-inspections-that-resulted-in-violations?code_type=1 */

select extract('year' from inspection_date) as "year"
     , count(violation_id) n_inspections
from sf_restaurant_health_violations
where business_name = 'Roxanne Cafe'
group by 1
order by 1;