-- PROJECT: SUPERSTORE SALES ANALYSIS
-- Tools Used: MySQL, Power BI
-- Objective:
-- Analyze sales performance, customer behavior,
-- product performance, and regional trends.
USE superstore_sales;

-- Executive Analysis
SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Category
ORDER BY Total_Sales DESC;

SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Region
ORDER BY Total_Sales DESC;
SELECT
    YEAR(Order_Date) AS Year,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Year
ORDER BY Year;

-- Product Analysis	
SELECT
    `Sub-Category`,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY `Sub-Category`
ORDER BY Total_Sales DESC;

SELECT
    Region,
    Category,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Region, Category
ORDER BY Region, Total_Sales DESC;

-- Customer Analysis

SELECT
    Segment,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Segment
ORDER BY Total_Sales DESC;

SELECT
    Segment,
    COUNT(DISTINCT `Customer ID`) AS Customers,
    COUNT(DISTINCT `Order ID`) AS Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Sales)/COUNT(DISTINCT `Order ID`) AS Avg_Order_Value
FROM superstore_sales
GROUP BY Segment;

-- Regional Analysis
SELECT
    Region,
    COUNT(DISTINCT `Customer ID`) AS Customers
FROM superstore_sales
GROUP BY Region
ORDER BY Customers DESC;

SELECT
    Region,
    COUNT(DISTINCT `Customer ID`) AS Customers,
    COUNT(DISTINCT `Order ID`) AS Orders,
    COUNT(DISTINCT `Order ID`) /
    COUNT(DISTINCT `Customer ID`) AS Orders_Per_Customer
FROM superstore_sales
GROUP BY Region;
