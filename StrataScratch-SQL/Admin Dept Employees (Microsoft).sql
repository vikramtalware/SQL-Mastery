/* Link - https://platform.stratascratch.com/coding/9845-find-the-number-of-employees-working-in-the-admin-department?code_type=1

Find the number of employees working in the Admin department that joined in April or later.

Table: worker
*/

select count(worker_id) n_admins
from worker
where department = 'Admin'
  and joining_date >= '2014-04-01';