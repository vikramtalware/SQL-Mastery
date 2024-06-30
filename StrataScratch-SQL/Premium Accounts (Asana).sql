/* Link - https://platform.stratascratch.com/coding/2097-premium-acounts?code_type=1 */

select a.entry_date
     , count(a.account_id) premium_paid_accounts
     , count(b.account_id) premium_paid_after_7d
from premium_accounts_by_day a
left join premium_accounts_by_day b
  on a.account_id = b.account_id
 and (b.entry_date - a.entry_date) = 7
 and b.final_price > 0
where a.final_price > 0
group by 1
order by 1
limit 7