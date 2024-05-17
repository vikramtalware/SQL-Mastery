/*You’re a consultant for a major pizza chain that will be running a promotion where all 3-topping pizzas will be sold for a fixed price, and are trying to understand the costs involved.

Given a list of pizza toppings, consider all the possible 3-topping pizzas, and print out the total cost of those 3 toppings. Sort the results with the highest total cost on the top followed by pizza toppings in ascending order.

Break ties by listing the ingredients in alphabetical order, starting from the first ingredient, followed by the second and third.

P.S. Be careful with the spacing (or lack of) between each ingredient. Refer to our Example Output.

Notes:

Do not display pizzas where a topping is repeated. For example, ‘Pepperoni,Pepperoni,Onion Pizza’.
Ingredients must be listed in alphabetical order. For example, 'Chicken,Onions,Sausage'. 'Onion,Sausage,Chicken' is not acceptable.

pizza_toppings Table:
Column Name	Type
topping_name	varchar(255)
ingredient_cost	decimal(10,2)

pizza_toppings Example Input:
topping_name	ingredient_cost
Pepperoni	0.50
Sausage	0.70
Chicken	0.55
Extra Cheese	0.40

Example Output:
pizza	total_cost
Chicken,Pepperoni,Sausage	1.75
Chicken,Extra Cheese,Sausage	1.65
Extra Cheese,Pepperoni,Sausage	1.60
Chicken,Extra Cheese,Pepperoni	1.45

Explanation
There are four different combinations of the three toppings. Cost of the pizza with toppings Chicken, Pepperoni and Sausage is $0.55 + $0.50 + $0.70 = $1.75.
Additionally, they are arranged alphabetically; in the dictionary, the chicken comes before pepperoni and pepperoni comes before sausage.

The dataset you are querying against may have different input & output - this is just an example!*/

SELECT t1||','||t2||','||t3
     , p1+p2+p3 total_cost
FROM  (SELECT p1.topping_name t1
            , p1.ingredient_cost p1
            , p2.topping_name t2
            , p2.ingredient_cost p2
            , p3.topping_name t3
            , p3.ingredient_cost p3
        FROM pizza_toppings p1
        JOIN pizza_toppings p2
          ON p1.topping_name != p2.topping_name
        JOIN pizza_toppings p3
          ON p1.topping_name != p3.topping_name
         AND p2.topping_name != p3.topping_name
        GROUP BY 1,2,3,4,5,6)a
WHERE t1 < t2 and t2 < t3
ORDER BY 2 DESC, 1 ASC