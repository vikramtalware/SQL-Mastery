/*
Link - https://platform.stratascratch.com/coding/10087-find-all-posts-which-were-reacted-to-with-a-heart?code_type=1
Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.

Tables: facebook_reactions, facebook_posts
*/

select distinct p.*
from facebook_posts p
join facebook_reactions r
  on p.post_id = r.post_id
where r.reaction = 'heart';