/*Write a query to recommend a page to a user. A recommendation is based on a page liked by user friends.
 Assume you have two tables: a two-column table of users and their friends, and a two-column table of users and the pages they liked.

Assumptions:
Only recommend the top page to the user, and do not recommend pages that were already liked by the user.
Top page is defined as the page with the highest number of followers.
Output the user id and page recommended. Order the result in ascending order by user id.

friendship Table:
Column Name	Type
id	integer
user_id	string
friend_id	string

friendship Example Input:
id	user_id	friend_id
1	alice	bob
2	alice	charles
3	alice	david

page_following Table:
Column Name	Type
id	integer
user_id	string
page_id	string

page_following Example Input:
id	user_id	page_id
1	alice	google
2	alice	facebook
3	bob	google
4	bob	linkedin
5	bob	facebook

Example Output:
user_id	Page_Recommended
alice	linkedin

Alice's friend Bob is following Google, Linkedin, and Facebook pages. 
However, since Alice is already following Google and Facebook, the only page that can be recommended to her is Linkedin.
The dataset you are querying against may have different input & output - this is just an example!
*/
WITH cte1 AS (
SELECT user_id, friend_id
FROM friendship
UNION
SELECT friend_id, user_id
FROM friendship)

SELECT user_id
     , page_id
FROM 
(SELECT user_id
     , page_id
     , followers
     , DENSE_RANK() OVER(PARTITION BY user_id ORDER BY followers DESC) rn
FROM
(SELECT
  users.user_id,
  pages.page_id,
  COUNT(*) AS followers
FROM cte1 AS users
LEFT JOIN page_following AS pages
  ON users.friend_id = pages.user_id
WHERE NOT EXISTS (SELECT id 
                  FROM page_following pages2
                  WHERE users.user_id = pages2.user_id
                    AND pages.page_id = pages2.page_id)
GROUP BY 1,2)a)b
WHERE b.rn = 1