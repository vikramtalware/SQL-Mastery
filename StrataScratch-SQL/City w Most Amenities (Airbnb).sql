/*Link - https://platform.stratascratch.com/coding/9633-city-with-most-amenities?code_type=1 */

SELECT city
FROM airbnb_search_details
GROUP BY 1
ORDER BY SUM(array_length(string_to_array(amenities,','),1)) DESC
LIMIT 1