-- Syntax
WITH [RECURSIVE] CTE_name AS
(SELECT query -- (Base query)
    UNION ALL -- UNION or UNION ALL
 SELECT query --(Recursive query using CTE_name [with a termination condition])
)
SELECT * FROM CTE_name
-- Example
WITH RECURSIVE employee_hierarchy AS (
  SELECT employee_id,
         first_name,
         last_name,
         reports_to,
         'Owner' AS path
  FROM employee
  WHERE reports_to IS NULL
  UNION ALL 
  SELECT e.employee_id,
         e.first_name,
         e.last_name,
         e.reports_to,
         employee_hierarchy.path || '->' || e.last_name
  FROM employee e 
  JOIN employee_hierarchy 
    ON e.reports_to = employee_hierarchy.employee_id)

SELECT *
FROM employee_hierarchy;
	
-- Display 1 to 10 numbers w/o using any in-built functions
WITH RECURSIVE numbers AS
	(SELECT 1 as n
    	UNION
     SELECT n+1 as n
	 FROM numbers
	 WHERE n < 10)
SELECT * FROM numbers

-- PostGRESQL
UNNEST(string_to_array(column_name, 'delimiter'))

array_length(string_to_array(column_name, 'delimiter'),1)

STRING_AGG(passenger_name, ', ')
	
generate_series(1,10,2); -- 2 is a step 1,3,5,etc

POSIX lower(column_name) ~ '\y(plum|cherry|rose|hazelnut)\y'

EXTRACT('year' from column_name)

PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY column_name) AS median

COALESCE()

REDUCE()

QUALIFY()

-- MySQL
SUBSTR(column_name, pos, len)

SUBSTRING_INDEX(column_name, 'delimiter', length)

REGEX lower(column_name) REGEX '([^a-z])(plum|rose|cherry|hazelnut)([^a-z])'

-- MEDIAN
WITH get_median AS (
  SELECT y
       , row_number() OVER(ORDER BY y ASC) AS rn_asc
       , COUNT(*) OVER() AS ct
  FROM dataset)
SELECT AVG(y) AS median
FROM get_median
WHERE rn_asc BETWEEN ct/2.0 AND ct/2.0 + 1;

INSERT INTO table_name (column1, column2, column3, ...) VALUES (value1, value2, value3, ...);
UPDATE table_name SET column1 = value1, column2 = value2, ... WHERE condition;
DELETE FROM table_name WHERE condition;
TRUNCATE TABLE table_name;
ROWS or RANGE- specifying rows or range.
PRECEDING – get rows before the current one.
FOLLOWING – get rows after the current one.
UNBOUNDED – when used with PRECEDING or FOLLOWING, it returns all before or after CURRENT ROW


Subqueries vs Correlated Queries (Find Example)
A correlated subquery is a subquery that refers to a column from the outer query. 
This is different from a regular subquery, which is self-contained and can be executed independently of the outer query. 
Correlated subqueries can be slower to execute than regular subqueries because they need to be executed for each row in the outer query.


