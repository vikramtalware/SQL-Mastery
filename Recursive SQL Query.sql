
-- Syntax

WITH [RECURSIVE] CTE_name AS
(SELECT query -- (Base query)
    UNION ALL -- UNION or UNION ALL
 SELECT query --(Recursive query using CTE_name [with a termination condition])
)

SELECT * FROM CTE_name

-- Display 1 to 10 numbers w/o using any in-built functions
WITH RECURSIVE numbers AS
	(SELECT 1 as n
    	UNION
     SELECT n+1 as n
	 FROM numbers
	 WHERE n < 10)

SELECT * FROM numbers


-- Display hierarchy of employees under a given manager "Asha"
WITH RECURSIVE employee_hierarchy AS
(SELECT e.id 
      , e.name
      , e.manager_id
      , e.designation
      , 1 as level
 FROM emp_details e
 WHERE name = 'Asha'
 UNION
 SELECT e.id 
      , e.name
      , e.manager_id
      , e.designation
      , h.level+1 as level
 FROM employee_hierarchy H
 JOIN emp_details e
   ON e.manager_id = h.id
)

SELECT * 
FROM employee_hierarchy