/*Facebook wants to recommend new friends to people who show interest in attending 2 or more of the same private events.
  Sort your results in order of user_a_id and user_b_id (refer to the Example Output below).

Notes:

A user interested in attending would have either 'going' or 'maybe' as their attendance status.
Friend recommendations are unidirectional, meaning if user x and user y should be recommended to each other, 
the result table should have both user x recommended to user y and user y recommended to user x.

The result should not contain duplicates (i.e., user y should not be recommended to user x multiple times).

friendship_status Table:
Column Name	Type
user_a_id	integer
user_b_id	integer
status	enum ('friends', 'not_friends')
Each row of this table indicates the status of the friendship between user_a_id and user_b_id.

friendship_status Example Input:
user_a_id	user_b_id	status
111	333	not_friends
222	333	not_friends
333	222	not_friends
222	111	friends
111	222	friends
333	111	not_friends

event_rsvp Table:
Column Name	    Type
user_id	        integer
event_id	    integer
event_type	    enum ('public', 'private')
attendance_status enum ('going', 'maybe', 'not_going')
event_date	    date

event_rsvp Example Input:
user_id	event_id	event_type	attendance_status	event_date
111	567	public	going	07/12/2022
222	789	private	going	07/15/2022
333	789	private	maybe	07/15/2022
111	234	private	not_going	07/18/2022
222	234	private	going	07/18/2022
333	234	private	going	07/18/2022

Example Output:
user_a_id	user_b_id
222	333
333	222
Users 222 and 333 who are not friends have shown interest in attending 2 or more of the same private events.

The dataset you are querying against may have different input & output - this is just an example!*/

WITH event_users AS
(SELECT user_id
     , ARRAY_AGG(event_id ORDER BY event_id) all_events
FROM event_rsvp
WHERE attendance_status IN ('going','maybe')
GROUP BY 1
HAVING array_length(ARRAY_AGG(event_id ORDER BY event_id), 1) > 1)

SELECT user_a_id
     , user_b_id
FROM friendship_status f
WHERE f.status = 'not_friends'
  AND f.user_a_id IN (SELECT user_id FROM event_users)
  AND f.user_b_id IN (SELECT user_id FROM event_users)
ORDER BY 1