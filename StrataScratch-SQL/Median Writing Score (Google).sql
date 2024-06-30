/* Link - https://platform.stratascratch.com/coding/9610-find-students-with-a-median-writing-score?code_type=1 */

WITH get_median AS
(SELECT sat_writing
      , ROW_NUMBER() OVER(ORDER BY sat_writing) as rn
      , COUNT(*) OVER() total_rows
 FROM sat_scores
)

,median_score as
(SELECT AVG(sat_writing) median
FROM get_median
WHERE rn BETWEEN total_rows/2.0 AND total_rows/2.0 + 1)

SELECT student_id
FROM sat_scores
WHERE sat_writing = (SELECT median from median_score)