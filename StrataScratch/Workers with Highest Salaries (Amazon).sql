/*
Link - https://platform.stratascratch.com/coding/10353-workers-with-the-highest-salaries?code_type=1
*/

select t.worker_title best_paid_title
from worker w
join title t
  on w.worker_id = t.worker_ref_id
where salary = (select max(salary) from worker)
order by 1