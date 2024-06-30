/* Link - https://platform.stratascratch.com/coding/2089-cookbook-recipes/official-solution?code_type=1 */

WITH RECURSIVE series AS (
    SELECT 0 AS pages
    UNION
    SELECT pages + 2 AS pages
    FROM series
    WHERE pages < (SELECT MAX(page_number)-1 FROM cookbook_titles))

,all_pages AS
(SELECT pages left_page_number
      , pages left_page
      , pages+1 right_page
FROM series)

SELECT left_page_number
     , CASE WHEN left_page = c1.page_number THEN c1.title END left_title
     , CASE WHEN right_page = c2.page_number THEN c2.title END right_title
FROM all_pages a
LEFT JOIN cookbook_titles c1
  ON a.left_page = c1.page_number
LEFT JOIN cookbook_titles c2
  ON a.right_page = c2.page_number
ORDER BY 1