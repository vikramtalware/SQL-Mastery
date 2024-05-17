/*The Airbnb Booking Recommendations team is trying to understand the "substitutability" of two rentals and whether 
  one rental is a good substitute for another. They want you to write a query to find the unique combination of two 
  Airbnb rentals with the same exact amenities offered.

Output the count of the unique combination of Airbnb rentals.

Assumptions:

If property 1 has a kitchen and pool, and property 2 has a kitchen and pool too, it is a good substitute and represents a unique matching rental.
If property 3 has a kitchen, pool and fireplace, and property 4 only has a pool and fireplace, then it is not a good substitute.

rental_amenities Table:
Column Name	Type
rental_id	integer
amenity	string

rental_amenities Example Input:
rental_id	amenity
123	pool
123	kitchen
234	hot tub
234	fireplace
345	kitchen
345	pool
456	pool

Example Output:
matching_airbnb
1

Explanation: The count of matching rentals is 1 as rentals 123 and 345 are a match as they both have a kitchen and a pool.

The dataset you are querying against may have different input & output - this is just an example! */

WITH raw_data AS
(SELECT rental_id
     , ARRAY_AGG(amenity ORDER BY amenity) arr
FROM rental_amenities r
GROUP BY 1)

SELECT COUNT(*) unique_combinations
FROM raw_data r1
JOIN raw_data r2
 ON r1.rental_id <> r2.rental_id
WHERE r1.arr = r2.arr
  AND r1.rental_id < r2.rental_id