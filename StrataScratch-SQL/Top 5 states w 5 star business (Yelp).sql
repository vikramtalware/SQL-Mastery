/* Link - https://platform.stratascratch.com/coding/10046-top-5-states-with-5-star-businesses?code_type=1 */

SELECT state
     , business n_businesses
FROM (SELECT state
         , business
         , DENSE_RANK() OVER(ORDER BY business DESC) rn
    FROM (select state
               , COUNT(business_id) business
          from yelp_business
          where stars >= 5
          group by 1)a)b
WHERE rn < 5