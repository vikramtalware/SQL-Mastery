/* Link - https://platform.stratascratch.com/coding/9881-make-a-report-showing-the-number-of-survivors-and-non-survivors-by-passenger-class?code_type=1 */

select survived
     , SUM(CASE WHEN pclass = 1 THEN 1 END) first_class
     , SUM(CASE WHEN pclass = 2 THEN 1 END) second_class
     , SUM(CASE WHEN pclass = 3 THEN 1 END) third_class
from titanic
group by 1;