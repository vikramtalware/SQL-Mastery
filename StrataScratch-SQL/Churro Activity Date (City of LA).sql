/*
Link - https://platform.stratascratch.com/coding/9688-churro-activity-date?code_type=1

Find the activity date and the pe_description of facilities with the name 'STREET CHURROS' and with a score of less than 95 points.

Table: los_angeles_restaurant_health_inspections
*/

select activity_date
     , pe_description
from los_angeles_restaurant_health_inspections
where facility_name = 'STREET CHURROS'
  and score < 95;