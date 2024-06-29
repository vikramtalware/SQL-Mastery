/*
Link - https://platform.stratascratch.com/coding/9622-number-of-bathrooms-and-bedrooms?code_type=1

Find the average number of bathrooms and bedrooms for each city’s property types. Output the result along with the city name and the property type.

Table: airbnb_search_details*/

select city
     , property_type
     , avg(bathrooms) a_baths
     , avg(bedrooms) a_beds
from airbnb_search_details
group by 1,2;