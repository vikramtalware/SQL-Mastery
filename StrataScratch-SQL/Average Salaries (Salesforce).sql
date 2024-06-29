/*
Link - https://platform.stratascratch.com/coding/9917-average-salaries?code_type=1

Compare each employee's salary with the average salary of the corresponding department.
Output the department, first name, and salary of employees along with the average salary of that department.

Table: employee
*/
select department
     , first_name
     , salary
     , avg(salary) over(partition by department) avg_sal
from employee;