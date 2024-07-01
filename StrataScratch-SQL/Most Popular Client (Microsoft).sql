/* Link - https://platform.stratascratch.com/coding/2029-the-most-popular-client_id-among-users-using-video-and-voice-calls?code_type=1 */

WITH user_data AS
(SELECT client_id
     , user_id
     , COUNT(event_id) n_events
     , COUNT(CASE WHEN event_type IN ('video call received', 'video call sent', 'voice call received', 'voice call sent') THEN event_id END) specific_events
FROM fact_events
GROUP BY 1,2)

,users_by_client AS
(SELECT client_id
     , COUNT(user_id) n_users
FROM (SELECT client_id
           , user_id
           , 1.0 * specific_events/n_events ratio
    FROM user_data)a
WHERE ratio >= 0.5
GROUP BY 1)

SELECT client_id
FROM users_by_client
WHERE n_users = (SELECT MAX(n_users) FROM users_by_client)