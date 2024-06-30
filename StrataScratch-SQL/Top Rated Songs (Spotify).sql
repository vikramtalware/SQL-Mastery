/* Link - https://platform.stratascratch.com/coding/9991-top-ranked-songs?code_type=1 */

select DISTINCT trackname
     , COUNT(position) OVER(PARTITION BY trackname)
from spotify_worldwide_daily_song_ranking
where position = (select min(position) from spotify_worldwide_daily_song_ranking)
order by 2 desc;