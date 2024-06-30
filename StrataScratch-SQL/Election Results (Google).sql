/* Link - https://platform.stratascratch.com/coding/2099-election-results?code_type=1 */

WITH voting_results AS
(SELECT candidate
     , SUM(vote_count) votes
FROM (SELECT voter
         , candidate
         , 1.0/COUNT(*) OVER(PARTITION BY voter) vote_count
    FROM voting_results
    WHERE candidate IS NOT NULL)a
GROUP BY 1)

SELECT candidate
FROM voting_results
WHERE votes = (SELECT max(votes) FROM voting_results)