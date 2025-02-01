-- Retrieve the total number of orders placed.

SELECT 
    COUNT(order_id) as no_of_orders
FROM
    orders;
    
-- Calculate the total revenue generated from pizza sales.
SELECT 
    concat('₹ ',ROUND(SUM(od.quantity * p.price), 0)) AS Total_Revenue
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id;

-- Identify the highest-priced pizza.
SELECT 
    pt.name as Pizza_Name, concat('₹ ',p.price) as Highest_Price
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;

-- Identify the most common pizza size ordered.
SELECT 
    p.size, COUNT(od.pizza_id) AS no_of_orders
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY no_of_orders DESC ;

-- List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pt.name AS Pizza_Name,
    sum(od.quantity) AS No_Of_Quantity_Orders
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY Pizza_Name
ORDER BY No_Of_Quantity_Orders DESC
LIMIT 5;

-- Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT 
    pt.category AS Pizza_Category,
    sum(od.quantity) AS Total_Quantity
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    pizza_types pt ON pt.pizza_type_id = p.pizza_type_id
GROUP BY Pizza_Category
ORDER BY Total_Quantity DESC;

-- Determine the distribution of orders by hour of the day.

SELECT 
    HOUR(Time) AS Hour, COUNT(order_id) AS No_Orders
FROM
    orders
GROUP BY Hour
ORDER BY Hour;

-- Join relevant tables to find the category-wise distribution of pizzas.

SELECT 
    category, COUNT(name) AS Distribution_of_Pizzas
FROM
    pizza_types
GROUP BY category;

-- Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
   round(avg(Quantity),0) as avg_pizza_per_day
FROM
    (SELECT 
        o.Dates AS Day, SUM(od.quantity) AS Quantity
    FROM
        orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY Dates) AS t1;

-- Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pt.Name AS Pizza_Name,
    concat('₹ ',ROUND(SUM(od.quantity * p.price), 0)) AS Total_revenue
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY Pizza_Name
ORDER BY Total_revenue DESC
Limit 3;

-- Calculate the percentage contribution of each pizza category to total revenue.

SELECT 
    pt.category AS Pizza_Name,
    concat(ROUND(SUM(od.quantity * p.price)/(SELECT 
    ROUND(SUM(od.quantity * p.price), 2) AS Total_Price
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id)*100,2), ' %') as Revenue
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY Pizza_Name
ORDER BY Revenue DESC;

-- Analyze the cumulative revenue generated over time.

select 
	Dates, concat('₹ ', Round(sum(revenue) over (order by Dates),0)) as cum_revenue 
FROM
(SELECT 
    o.dates AS Dates,
    ROUND(SUM(od.quantity * p.price), 2) AS revenue
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    orders o ON o.order_id = od.order_id
GROUP BY Dates) sales;
    
    -- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

WITH ranked_pizzas AS (SELECT 
        pt.category AS Pizza_category, 
        pt.Name AS Pizza_name, 
        ROUND(SUM(od.quantity * p.price), 0) AS Total_revenue,
        ROW_NUMBER() OVER(PARTITION BY pt.category ORDER BY SUM(od.quantity * p.price) DESC) AS _Rank
    FROM
        order_details od
        JOIN pizzas p ON od.pizza_id = p.pizza_id
        JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY 
        pt.category, 
        pt.Name)
SELECT 
    Pizza_category,
    Pizza_name,
    CONCAT('₹ ', Total_revenue) AS Total_Revenue,
    _Rank
FROM 
    ranked_pizzas
WHERE 
    _Rank <= 3
ORDER BY 
    Pizza_category, 
    _Rank;

