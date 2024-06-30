/* Link - https://platform.stratascratch.com/coding/9632-host-popularity-rental-prices/official-solution?code_type=1 */

WITH hosts AS
(SELECT DISTINCT concat(price, room_type, host_since, zipcode, number_of_reviews) AS host_id,
        number_of_reviews,
        price
   FROM airbnb_host_searches)

SELECT popularity_rating
     , min(price)
     , avg(price)
     , max(price)
FROM(SELECT CASE WHEN number_of_reviews = 0 THEN 'New'
                WHEN number_of_reviews between 1 and 5 THEN 'Rising'
                WHEN number_of_reviews between 6 and 15 THEN 'Trending Up'
                WHEN number_of_reviews between 16 and 40 THEN 'Popular'
                WHEN number_of_reviews > 40 THEN 'Hot' END popularity_rating
            , price
    FROM hosts)a
GROUP BY 1;