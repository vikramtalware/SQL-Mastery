/*
Link - https://platform.stratascratch.com/coding/9992-find-artists-that-have-been-on-spotify-the-most-number-of-times?code_type=1

Find how many times each artist appeared on the Spotify ranking list
Output the artist name along with the corresponding number of occurrences.
Order records by the number of occurrences in descending order.

Table: spotify_worldwide_daily_song_ranking*/

select artist
     , COUNT(position) n_occurences
from spotify_worldwide_daily_song_ranking
group by 1
order by 2 desc;