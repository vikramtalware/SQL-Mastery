/*  You're given two tables containing data on Spotify users' streaming activity: songs_history which has historical streaming data, 
    and songs_weekly which has data from the current week.

    Write a query that outputs the user ID, song ID, and cumulative count of song plays up to August 4th, 2022, sorted in descending order.

    Assume that there may be new users or songs in the songs_weekly table that are not present in the songs_history table.

    Definitions:

    song_weeklytable only contains data for the week of August 1st to August 7th, 2022.
    songs_history table contains data up to July 31st, 2022. The query should include historical data from this table.

    songs_history Table:
    Column Name	Type
    history_id	integer
    user_id	integer
    song_id	integer
    song_plays	integer

    songs_history Example Input:
    history_id	user_id	song_id	song_plays
    10011	777	1238	11
    12452	695	4520	1
    song_plays field contains the historical data of the number of times a user has played a particular song.

    songs_weekly Table:
    Column Name	Type
    user_id	integer
    song_id	integer
    listen_time	datetime
    
    songs_weekly Example Input:
    user_id	song_id	listen_time
    777	1238	08/01/2022 12:00:00
    695	4520	08/04/2022 08:00:00
    125	9630	08/04/2022 16:00:00
    695	9852	08/07/2022 12:00:00

    Example Output:
    user_id	song_id	song_plays
    777	1238	12
    695	4520	2
    125	9630	1

    On 4 August 2022, the data shows that User 777 listened to the song with song ID 1238 for a total of 12 times, with 11 of those 
    times occurring before the current week and 1 time occurring within the current week.
    However, the streaming data for User 695 with the song ID 9852 are not included in the output because the streaming date for that 
    record falls outside the date range specified in the question.
    The dataset you are querying against may have different input & output - this is just an example!
*/

SELECT user_id
     , song_id
     , SUM(song_plays) song_plays
FROM (SELECT user_id
           , song_id
           , COUNT(song_id) song_plays
      FROM songs_weekly
      WHERE listen_time < '08/05/2022 00:00:00'
      GROUP BY 1,2
      UNION ALL
      SELECT user_id
           , song_id
           , song_plays
      FROM songs_history)a
GROUP BY 1,2
ORDER BY 3 DESC