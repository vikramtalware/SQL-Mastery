/*  Given a table containing information about bank deposits and withdrawals made using Paypal, 
    write a query to retrieve the final account balance for each account, taking into account 
    all the transactions recorded in the table with the assumption that there are no missing 
    transactions.account.

    transactions Table:
    Column Name	Type
    transaction_id	integer
    account_id	integer
    transaction_type varchar
    amount	decimal

    transactions Example Input:
    transaction_id	account_id	transaction_type	amount
    123	101	Deposit	10.00
    124	101	Deposit	20.00
    125	101	Withdrawal	5.00
    126	201	Deposit	20.00
    128	201	Withdrawal	10.00

    Example Output:
    account_id	final_balance
    101	        25.00
    201	        10.00

    Explanation:
    Using account ID 101 as an example, $30.00 was deposited into this account, while $5.00 was withdrawn. 
    Therefore, the final account balance can be calculated as the difference between the total deposits 
    and withdrawals which is $30.00 - $5.00, resulting in a final balance of $25.00.
    The dataset you are querying against may have different input & output - this is just an example!
*/

SELECT account_id
     , SUM(CASE WHEN transaction_type = 'Withdrawal' THEN amount*-1 ELSE amount END) amount
FROM transactions t
GROUP BY 1
