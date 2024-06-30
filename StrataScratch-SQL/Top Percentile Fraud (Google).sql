/* Link - https://platform.stratascratch.com/coding/10303-top-percentile-fraud?code_type=1 */

WITH percentiles AS
(select state
      , percentile_cont(0.05) WITHIN GROUP (ORDER BY fraud_score DESC) as percentile
from fraud_score
group by 1)

SELECT f.policy_num
     , f.state
     , f.claim_cost
     , f.fraud_score
FROM fraud_score f
JOIN percentiles p 
  ON f.state = p.state
WHERE f.fraud_score >= p.percentile