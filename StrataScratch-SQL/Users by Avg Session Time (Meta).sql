/*
Link - https://platform.stratascratch.com/coding/10352-users-by-avg-session-time?code_type=1
*/

WITH ordered_actions AS (
    SELECT user_id
         , timestamp
         , action
         , ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY timestamp) as seq_num
    FROM facebook_web_log
    WHERE action IN ('page_load', 'page_exit'))

,matched_sessions AS (
    SELECT
        a.user_id,
        a.timestamp AS load_time,
        b.timestamp AS exit_time,
        b.timestamp - a.timestamp AS session_duration
    FROM ordered_actions a
    JOIN ordered_actions b 
      ON a.user_id = b.user_id 
     AND a.seq_num = b.seq_num - 1
    WHERE a.action = 'page_load' 
      AND b.action = 'page_exit')
      
SELECT user_id
     , AVG(session_duration) AS avg_session_duration
FROM matched_sessions
GROUP BY user_id;