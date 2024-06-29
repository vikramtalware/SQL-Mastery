/* Link - https://platform.stratascratch.com/coding/10285-acceptance-rate-by-date?code_type=1 */

WITH raw_data AS
(SELECT a.user_id_sender
     , b.user_id_receiver
     , a.date sent_date
     , b.date accept_date
     , a.action
     , b.action
FROM fb_friend_requests a
LEFT JOIN fb_friend_requests b
  ON a.user_id_sender = b.user_id_sender
 AND a.action <> b.action
WHERE a.action = 'sent')

SELECT sent_date as "date"
     , CAST(COUNT(user_id_receiver) AS DECIMAL)/CAST(COUNT(user_id_sender) AS DECIMAL) acceptance_rate
FROM raw_data
GROUP BY 1
ORDER BY 1