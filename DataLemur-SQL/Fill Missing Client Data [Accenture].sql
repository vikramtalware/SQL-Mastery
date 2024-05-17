/*  When accessing Accenture's retailer client's database, you observe that the category column 
    in products table contains null values.

    Write a query that returns the updated product table with all the category values filled in, 
    taking into consideration the assumption that the first product in each category will always 
    have a defined category value.

    Assumptions:

    Each category is expected to be listed only once in the column and products within the same
    category should be grouped together based on sequential product IDs.
    
    The first product in each category will always have a defined category value.
    For instance, the category for product ID 1 is 'Shoes', then the subsequent product IDs 2 and 3 will be categorised as 'Shoes'.
    Similarly, product ID 4 is 'Jeans', then the following product ID 5 is categorised as 'Jeans' category, and so forth.
    Effective April 16, 2023, the question, assumptions, solution and hints were revised.

    products Table
    Column Name	Type
    product_id	integer
    category	varchar
    name	varchar
    
    products Example Input
    product_id	category	name
    1	Shoes	Sperry Boat Shoe
    2		    Adidas Stan Smith
    3		    Vans Authentic
    4	Jeans	Levi 511
    5		    Wrangler Straight Fit
    6   Shirts	Lacoste Classic Polo
    7		    Nautica Linen Shirt
    
    Example Output
    product_id	category	name
    1	Shoes	Sperry Boat Shoe
    2	Shoes	Adidas Stan Smith
    3	Shoes	Vans Authentic
    4	Jeans	Levi 511
    5	Jeans	Wrangler Straight Fit
    6	Shirts	Lacoste Classic Polo
    7	Shirts	Nautica Linen Shirt
    
    Explanation
    Shoes will replace all NULL values below the product Sperry Boat Shoe until Jeans appears. 
    Similarly, Jeans will replace NULLs for the product Wrangler Straight Fit, and so on.
    The dataset you are querying against may have different input & output - this is just an example!
*/

WITH num_category AS
(SELECT *,
      COUNT(category) OVER (ORDER BY product_id) AS num_cat
FROM products)

SELECT product_id
     , MAX(category) OVER(PARTITION BY num_cat ORDER BY product_id) max_cat
     , name
FROM num_category