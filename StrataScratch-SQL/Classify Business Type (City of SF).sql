/* Link - https://platform.stratascratch.com/coding/9726-classify-business-type?code_type=1 */

SELECT DISTINCT business_name,
       CASE
           WHEN lower(business_name) LIKE '%school%' THEN 'school'
           WHEN lower(business_name) LIKE '%restaurant%' THEN 'restaurant'
           WHEN lower(business_name) LIKE '%cafe%' OR lower(business_name) LIKE '%coffee%' OR lower(business_name) LIKE '%café%' THEN 'cafe'
           ELSE 'other'
       END AS business_type
FROM sf_restaurant_health_violations;