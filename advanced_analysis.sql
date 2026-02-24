/* ===========================================
   ADVANCED BUSINESS QUESTIONS - ECOMMERCE SQL
   =========================================== */


/* ---------- TOTAL COMPANY REVENUE ---------- */

-- What is the total revenue generated?

SELECT SUM(quantity * price) AS total_revenue
FROM orders;



/* ---------- AVERAGE ORDER VALUE ---------- */

-- What is the average value per order?

SELECT AVG(quantity * price) AS avg_order_value
FROM orders;



/* ---------- REVENUE BY CATEGORY ---------- */

-- Which product category generates the most revenue?

SELECT category,
       SUM(quantity * price) AS revenue
FROM orders
GROUP BY category
ORDER BY revenue DESC;



/* ---------- MOST SOLD PRODUCTS ---------- */

-- Which products sold the most units?

SELECT product,
       SUM(quantity) AS total_units
FROM orders
GROUP BY product
ORDER BY total_units DESC;



/* ---------- UNIQUE CUSTOMERS ---------- */

-- How many unique customers exist?

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM orders;



/* ---------- CUSTOMER SPENDING ---------- */

-- How much has each customer spent?

SELECT customer_id,
       SUM(quantity * price) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;



/* ---------- REVENUE BY YEAR ---------- */

-- Revenue grouped by year

SELECT YEAR(order_date) AS year,
       SUM(quantity * price) AS revenue
FROM orders
GROUP BY YEAR(order_date);



/* ---------- ORDERS PER MONTH ---------- */

-- Number of orders each month

SELECT FORMAT(order_date,'yyyy-MM') AS month,
       COUNT(*) AS total_orders
FROM orders
GROUP BY FORMAT(order_date,'yyyy-MM')
ORDER BY month;



/* ---------- COUNTRY WITH MOST ORDERS ---------- */

-- Which country places the most orders?

SELECT country,
       COUNT(*) AS orders
FROM orders
GROUP BY country
ORDER BY orders DESC;



/* ---------- HIGHEST PRICED PRODUCTS ---------- */

-- Highest recorded price for each product

SELECT product,
       MAX(price) AS highest_price
FROM orders
GROUP BY product
ORDER BY highest_price DESC;



/* ---------- CUSTOMER SPENDING RANK ---------- */

-- Rank customers by total spending (window function)

SELECT customer_id,
       SUM(quantity * price) AS total_spent,
       RANK() OVER (ORDER BY SUM(quantity * price) DESC) AS ranking
FROM orders
GROUP BY customer_id;