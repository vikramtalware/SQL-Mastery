/*
Link - https://platform.stratascratch.com/coding/10166-reviews-of-hotel-arena?code_type=1

Find the number of rows for each review score earned by 'Hotel Arena'. Output the hotel name (which should be 'Hotel Arena'), review score along with the corresponding number of rows with that score for the specified hotel.

Table: hotel_reviews
*/

select hotel_name 
     , reviewer_score
     , COUNT(*) AS "count"
from hotel_reviews
where hotel_name = 'Hotel Arena'
group by 1,2;