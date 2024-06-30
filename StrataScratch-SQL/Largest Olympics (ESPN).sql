/* Link - https://platform.stratascratch.com/coding/9942-largest-olympics?code_type=1 */

WITH raw_data as
(select games
      , COUNT(DISTINCT id) athlete_cnt
from olympics_athletes_events
group by 1)

SELECT *
FROM raw_data r
WHERE r.athlete_cnt = (select max(athlete_cnt) from raw_data)