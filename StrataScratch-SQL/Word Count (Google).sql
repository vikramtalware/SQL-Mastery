/* Link - https://platform.stratascratch.com/coding/9817-find-the-number-of-times-each-word-appears-in-drafts?code_type=1 */


WITH raw_data AS
(select filename 
     , REPLACE(REPLACE(contents, ',', ''), '.','') words
from google_file_store)

SELECT words word
     , COUNT(words) nentry
FROM (SELECT filename
           , UNNEST(string_to_array(words, ' ')) words
      FROM raw_data)a
WHERE filename IN ('draft1.txt','draft2.txt')
GROUP BY 1
ORDER BY 1 DESC