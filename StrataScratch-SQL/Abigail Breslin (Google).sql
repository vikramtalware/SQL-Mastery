/*
Link - https://platform.stratascratch.com/coding/10128-count-the-number-of-movies-that-abigail-breslin-nominated-for-oscar?code_type=1
Count the number of movies that Abigail Breslin was nominated for an oscar.

Table: oscar_nominees
*/
select COUNT(movie) n_movies_by_abi
from oscar_nominees
where nominee = 'Abigail Breslin';