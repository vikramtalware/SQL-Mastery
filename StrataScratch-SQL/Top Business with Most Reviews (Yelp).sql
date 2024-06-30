/* Link - https://platform.stratascratch.com/coding/10048-top-businesses-with-most-reviews?code_type=1 */

select name
     , review_count
from yelp_business
order by 2 desc
limit 5;