/* =====================================
   ECOMMERCE SALES ANALYSIS - SQL SERVER
   ===================================== */


/* ---------- 1. DATA PREVIEW ---------- */

SELECT TOP 10 *
FROM orders;



/* ---------- 2. MONTHLY REVENUE ---------- */

SELECT 
    FORMAT(order_date, 'yyyy-MM') AS month,
    SUM(quantity * price) AS revenue
FROM orders
GROUP BY FORMAT(order_date, 'yyyy-MM')
ORDER BY month;



/* ---------- 3. TOP PRODUCTS ---------- */

SELECT 
    product,
    SUM(quantity * price) AS revenue
FROM orders
GROUP BY product
ORDER BY revenue DESC;



/* ---------- 4. REVENUE BY COUNTRY ---------- */

SELECT 
    country,
    SUM(quantity * price) AS revenue
FROM orders
GROUP BY country
ORDER BY revenue DESC;



/* ---------- 5. REPEAT CUSTOMERS ---------- */

SELECT 
    CAST(SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) * 100.0 
         / COUNT(*) AS DECIMAL(5,2)) AS repeat_percentage
FROM (
    SELECT customer_id, COUNT(*) order_count
    FROM orders
    GROUP BY customer_id
) t;



/* ---------- 6. TOP CUSTOMERS ---------- */

SELECT TOP 5
    customer_id,
    SUM(quantity * price) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;