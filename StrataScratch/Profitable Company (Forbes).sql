/*
Link - https://platform.stratascratch.com/coding/9663-find-the-most-profitable-company-in-the-financial-sector-of-the-entire-world-along-with-its-continent?code_type=1

Find the most profitable company from the financial sector. Output the result along with the continent.

Table: forbes_global_2010_2014
*/
select company
     , continent
from 
forbes_global_2010_2014
order by profits DESC
limit 1;