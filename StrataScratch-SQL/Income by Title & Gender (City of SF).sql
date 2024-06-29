/* Link - https://platform.stratascratch.com/coding/10077-income-by-title-and-gender?code_type=3 */

SELECT employee_title
     , sex
     , avg(total_compensation) avg_compensation
FROM (select id 
             , employee_title
             , sex
             , salary + sum(bonus) total_compensation
        from sf_employee e
        join sf_bonus b
          on e.id = b.worker_ref_id
        group by 1,2,3)a
GROUP BY 1,2