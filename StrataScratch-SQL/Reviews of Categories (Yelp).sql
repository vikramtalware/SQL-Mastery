/* Link - https://platform.stratascratch.com/coding/10049-reviews-of-categories?code_type=1 */

select unnest(string_to_array(categories, ';'))
     , sum(review_count)
from yelp_business
group by 1
order by 2 desc