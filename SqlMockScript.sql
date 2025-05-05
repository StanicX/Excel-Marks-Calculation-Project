-- Use Case 1. Sales Performance Analysis (Business Insights & Revenue Trends)
    -- Objective:Analyze total revenue, top-selling products, and sales trends over time.
    -- Identify best-performing salespersons and customers.

-- 🔹 Total Sales & Revenue Calculation
SELECT SUM(TotalPrice) AS Total_Revenue, COUNT(SalesID) AS Total_Transactions 
FROM sales;

-- Top 5 Best-Selling Products
SELECT ProductID, COUNT(*) AS Total_Sold, SUM(TotalPrice) AS Total_Revenue 
FROM sales 
GROUP BY ProductID 
ORDER BY Total_Sold DESC 
LIMIT 5;

-- 🔹 Sales Trends Over Time (Daily Sales)
SELECT SalesDate, SUM(TotalPrice) AS Daily_Revenue 
FROM sales 
GROUP BY SalesDate 
ORDER BY SalesDate;

-- 🔹 Best Performing Salesperson
SELECT SalesPers, COUNT(SalesID) AS Total_Sales, SUM(TotalPrice) AS Revenue 
FROM sales
GROUP BY SalesPers 
ORDER BY Revenue DESC 
LIMIT 1;

-- Use Case 2.Customer Purchase Behavior Analysis (Marketing Insights & Segmentation)
    -- Objective: Identify high-value customers and their shopping patterns.
    -- Group customers based on purchase frequency and spending habits.


-- 🔹 Top 5 Most Valuable Customers
SELECT Customer, COUNT(SalesID) AS Purchase_Count, SUM(TotalPrice) AS Total_Spending 
FROM sales 
GROUP BY Customer 
ORDER BY Total_Spending DESC 
LIMIT 5;

-- 🔹 Average Spending Per Customer
SELECT AVG(TotalPrice) AS Avg_Spending 
FROM sales;

-- 🔹 Customer Segmentation Based on Purchase Frequency
SELECT Customer, COUNT(SalesID) AS Purchase_Frequency 
FROM sales 
GROUP BY Customer 
ORDER BY Purchase_Frequency DESC;


-- Use Case 3.Sales Fraud Detection & Anomaly Analysis (Identify Unusual Transactions & Errors)

     -- Objective:Detect anomalies such as duplicate transactions or abnormally high/low prices.

-- Find sales where the quantity is too high or too low.


-- 🔹 Identify Duplicate Transactions
SELECT TransactionNumber, COUNT(*) AS Occurrences 
FROM sales 
GROUP BY TransactionNumber 
HAVING COUNT(*) > 1;

-- 🔹 Find Abnormally High Sales (Potential Fraud)
SELECT * FROM sales 
WHERE TotalPrice > (SELECT AVG(TotalPrice) * 2 FROM sales);

-- 🔹 Identify Negative or Zero Quantity Transactions (Data Entry Errors)
SELECT * FROM sales 
WHERE Quantity <= 0;

-- Use Case 4.Sales Forecasting & Trend Analysis (Predict Future Sales Trends)

     -- Objective:Identify seasonal trends in sales.
     -- Predict future demand based on historical data.

-- 🔹 Monthly Sales Trends
SELECT STRFTIME('%Y-%m', SalesDate) AS Month, SUM(TotalPrice) AS Monthly_Revenue 
FROM sales 
GROUP BY Month 
ORDER BY Month;

-- 🔹 Identifying Peak Sales Hours
SELECT SalesDate, COUNT(SalesID) AS Transactions 
FROM sales 
GROUP BY SalesDate 
ORDER BY Transactions DESC 
LIMIT 10;

-- 🔹 Predict Future Sales (Simple Moving Average)
SELECT SalesDate, 
       AVG(TotalPrice) OVER (ORDER BY SalesDate ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS Moving_Average 
FROM sales;