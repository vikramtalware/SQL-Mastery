/*  This is the same question as problem #30 in the SQL Chapter of Ace the Data Science Interview!
    Given the Walmart transaction and product tables, write a query to determine the count of unique product combinations that are 
    purchased together in the same transaction, considering that there must be a minimum of two products in the transaction. Display the 
    output in ascending order of the product combinations.

    For instance, if there are two transactions where apples and bananas are bought together, and another transaction where bananas and 
    soy milk are bought together, the total count of unique combinations would be 2.
    Psst, you may or may not need to use the products table.

    Effective April 17th, 2023, the problem statement, assumptions, and solution were modified to align with the question.

    transactions Table:
    Column Name	Type
    transaction_id	integer
    product_id	integer
    user_id	integer
    transaction_date	datetime

    transactions Example Input:
    transaction_id	product_id	user_id	transaction_date
    231574	        111	234	03/01/2022 12:00:00
    231574	        444	234	03/01/2022 12:00:00
    231574	        222	234	03/01/2022 12:00:00
    137124	        111	125	03/05/2022 12:00:00

    products Table:
    Column Name	Type
    product_id	integer
    product_name string

    products Example Input:
    product_id	product_name
    111	        apple
    222	        soy milk
    333	        instant oatmeal
    444	        banana
    555	        chia seed

    Example Output:
    combination
    111","222","444
    The dataset you are querying against may have different input & output - this is just an example!
*/

SELECT DISTINCT combinations
FROM 
(SELECT transaction_id,
       ARRAY_AGG(CAST(product_id AS TEXT) ORDER BY product_id) as combinations
FROM transactions
GROUP BY transaction_id)a
WHERE ARRAY_LENGTH(combinations, 1) > 1
ORDER BY 1