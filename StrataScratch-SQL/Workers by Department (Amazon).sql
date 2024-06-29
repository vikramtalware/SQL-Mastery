/* Link - https://platform.stratascratch.com/coding/9847-find-the-number-of-workers-by-department?code_type=1

Find the number of workers by department who joined in or after April.
Output the department name along with the corresponding number of workers.
Sort records based on the number of workers in descending order.

Table: worker
*/

select department
     , COUNT(worker_id) no_of_workers
from worker
where joining_date >= '2014-04-01'
group by 1
order by 2 desc;