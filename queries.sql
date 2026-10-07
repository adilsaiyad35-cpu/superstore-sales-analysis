-- Superstore Sales Analysis: PostgreSQL queries
-- Table: store (cleaned data loaded from Python)

-- 1. Top 10 products by sales
SELECT product_name,
       ROUND(SUM(sales)::numeric, 2)  AS total_sales,
       ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM store
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- 2. Sales and profit by region
SELECT region,
       ROUND(SUM(sales)::numeric, 2)  AS total_sales,
       ROUND(SUM(profit)::numeric, 2) AS total_profit,
       ROUND((SUM(profit) * 100.0 / SUM(sales))::numeric, 2) AS profit_margin_pct
FROM store
GROUP BY region
ORDER BY total_sales DESC;

-- 3. Monthly revenue trend
SELECT order_month,
       ROUND(SUM(sales)::numeric, 2) AS monthly_sales
FROM store
GROUP BY order_month
ORDER BY order_month;

-- 4. Profit by category and sub-category (losses first)
SELECT category, sub_category,
       ROUND(SUM(sales)::numeric, 2)  AS total_sales,
       ROUND(SUM(profit)::numeric, 2) AS total_profit
FROM store
GROUP BY category, sub_category
ORDER BY total_profit ASC;

-- 5. Does discount reduce profit?
SELECT CASE
         WHEN discount = 0   THEN '0%'
         WHEN discount <= 0.2 THEN '1-20%'
         WHEN discount <= 0.4 THEN '21-40%'
         ELSE '40%+'
       END AS discount_band,
       COUNT(*) AS num_orders,
       ROUND(SUM(profit)::numeric, 2) AS total_profit,
       ROUND(AVG(profit)::numeric, 2) AS avg_profit
FROM store
GROUP BY 1
ORDER BY MIN(discount);

-- 6. Top 10 customers (window function)
SELECT customer_name,
       ROUND(SUM(sales)::numeric, 2) AS total_sales,
       RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank
FROM store
GROUP BY customer_name
ORDER BY sales_rank
LIMIT 10;