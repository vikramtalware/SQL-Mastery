/* Link - https://platform.stratascratch.com/coding/9814-counting-instances-in-text?code_type=1 */

WITH raw_data AS
(select UNNEST(string_to_array(replace(replace(contents, '.', ''),',',''),' ')) words
from google_file_store)

SELECT lower(words)
     , COUNT(*)
FROM raw_data
WHERE lower(words) ~ '\y(bull|bear)\y'
GROUP BY 1
ORDER BY 2 DESC