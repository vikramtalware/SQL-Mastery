/* Link - https://platform.stratascratch.com/coding/10284-popularity-percentage?code_type=1*/

WITH total_users AS
(SELECT user1 users
 FROM facebook_friends
 UNION 
 SELECT user2 users
 FROM facebook_friends)

SELECT friend
      , 100.0 * CAST(SUM(friend_count) AS DECIMAL)/(SELECT COUNT(users) FROM total_users) pop
FROM (SELECT user1 friend
           , COUNT(*) friend_count
        FROM facebook_friends
        GROUP BY 1
        UNION ALL
        SELECT user2 friend
             , COUNT(*) friend_count
        FROM facebook_friends
        GROUP BY 1)a
GROUP BY 1
ORDER BY 1