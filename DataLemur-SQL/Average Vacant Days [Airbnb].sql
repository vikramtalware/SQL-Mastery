/*The strategy team in Airbnb is trying to analyze the impact of Covid-19 during 2021. To do so, they need you to write a query that outputs the average vacant days across the AirBnbs in 2021.
 Some properties have gone out of business, so you should only analyze rentals that are currently active. Round the results to a whole number.

Assumptions:

is_active field equals to 1 when the property is active, and 0 otherwise.
In cases where the check-in or check-out date is in another year other than 2021, limit the calculation to the beginning or end of the year 2021 respectively.
Listing can be active even if there are no bookings throughout the year.
bookings Table:

Column Name	Type
listing_id	integer
checkin_date	date
checkout_date	date

bookings Example Input:
listing_id	checkin_date	checkout_date
1	08/17/2021 00:00:00	08/19/2021 00:00:00
1	08/19/2021 00:00:00	08/25/2021 00:00:00
2	08/19/2021 00:00:00	09/22/2021 00:00:00
3	12/23/2021 00:00:00	01/05/2022 00:00:00

listings Table:
Column Name	Type
listing_id	integer
is_active	integer
listings Example Input:
listing_id	is_active
1	1
2	0
3	1

Example Output:
avg_vacant_days
357
Explanation:
Property 1 was rented for 8 days, thus the property has 365 - 8 = 357 vacant days.
Property 2 is excluded as it is not active.
Property 3 was rented out for 12 days, thus the property as 365 - 12 = 353 vacant days.
Average vacant days are 355 days. (357 + 353 / 2).

The dataset you are querying against may have different input & output - this is just an example!*/

SELECT ROUND(AVG(vacant_days)) AS av_vacant_days
FROM (SELECT listing_id
           , 365 - COALESCE(SUM(checkout_date - checkin_date),0) vacant_days
      FROM  (SELECT l.listing_id
                  , CASE WHEN DATE(checkout_date) < '1/1/2021' THEN '1/1/2021' ELSE DATE(checkin_date) END checkin_date
                  , CASE WHEN DATE(checkout_date) > '12/31/2021' THEN '12/31/2021' ELSE DATE(checkout_date) END checkout_date
            FROM bookings b
            RIGHT JOIN listings l
                ON l.listing_id = b.listing_id
            WHERE l.is_active = 1)a
      GROUP BY 1)b      