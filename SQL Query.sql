
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

-- PostGRESQL
UNNEST(string_to_array(column_name, 'delimiter')) - POSTGRESQL
generate_series(1,10,2); -- 2 is a step 1,3,5,etc
POSIX lower(column_name) ~ '\y(plum|cherry|rose|hazelnut)\y'
EXTRACT('year' from column_name)
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY column_name) AS median
COALESCE()

-- MySQL
SUBSTR(column_name, pos, len)
SUBSTRING_INDEX(column_name, 'delimiter', length)
REGEX lower(column_name) REGEX '([^a-z])(plum|rose|cherry|hazelnut)([^a-z])'


-- MEDIAN
WITH get_median AS (
  SELECT
    y
    ,row_number() OVER(ORDER BY y ASC) AS rn_asc
    ,COUNT(*) OVER() AS ct
  FROM dataset
)
SELECT
  AVG(y) AS median
FROM
  get_median
WHERE
  rn_asc BETWEEN ct/2.0 AND ct/2.0 + 1
;
