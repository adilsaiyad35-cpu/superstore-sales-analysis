# Superstore Sales Analysis

An end-to-end data analysis project: cleaning data in Python, analyzing it with SQL in PostgreSQL, and presenting the results in an interactive Power BI dashboard.

## Objective
Find out which products, regions, and discount levels drive or hurt profit, and recommend ways to improve profitability.

## Business Questions
1. Which products and categories bring the most sales and profit?
2. Which regions perform best and worst?
3. How do sales change month by month?
4. Do discounts reduce profit?
5. Who are the top customers?

## Tools
- **Python (pandas):** data cleaning
- **PostgreSQL:** SQL analysis (aggregations, CASE, window functions)
- **Power BI:** dashboard with DAX measures and slicers

## Process
1. **Cleaning (Python):** removed duplicates, fixed date formats, standardized column names, added Order_Year, Order_Month and Profit_Margin columns.
2. **Analysis (PostgreSQL):** loaded the cleaned data into a table and wrote queries for top products, regional performance, monthly trend, profit by sub-category, discount impact, and top customers (see `queries.sql`).
3. **Dashboard (Power BI):** built KPI cards (Total Sales, Total Profit, Profit Margin %, Total Orders), charts, a Top 10 Customers table, and slicers for year, segment, and category.

## Key Insights
1. West and East lead in sales; South is the lowest.
2. Sales grow year over year, with peaks near the end of each year.
3. Orders with discounts above 20% lose money.
4. Copiers, Phones, and Accessories are the top profit makers.
5. Tables, Bookcases, and Supplies are loss-making sub-categories.

## Recommendation
Limit discounts above 20%, especially on Tables and Bookcases, to protect profit.

## Dashboard

## Files
- `Superstore_Dashboard.pbix`: Power BI dashboard
- `queries.sql`: SQL queries
- `cleaning.ipynb`: Python cleaning notebook
- `dashboard.png`: dashboard screenshot

## Author
Saiyad Adil, BCA graduate
