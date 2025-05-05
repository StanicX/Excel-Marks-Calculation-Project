-- 1. 'INNER JOIN'
       -- 👉 Retrieves only matching records from both tables.

-- Use Case: Find all sales along with customer details.

SELECT s.SalesID, s.SalesPersonID, s.CustomerID, c.FirstName, c.LastName, 
       s.ProductID, s.Quantity, s.TotalPrice, s.SalesDate 
FROM sales s
INNER JOIN customers c ON s.CustomerID = c.CustomerID;

-- 2. 'LEFT JOIN' (or LEFT OUTER JOIN)
       -- 👉 Retrieves all records from the left table (sales) and matching records from the right table (customers).
       
-- Use Case: Find all sales, including those where customer information is missing.

SELECT s.SalesID, s.SalesPersonID, s.CustomerID, c.FirstName, c.LastName, 
       s.ProductID, s.Quantity, s.TotalPrice, s.SalesDate 
FROM sales s
LEFT JOIN customers c ON s.CustomerID = c.CustomerID;

-- 3. 'RIGHT JOIN' (or RIGHT OUTER JOIN)
       -- 👉 Retrieves all records from the right table (customers) and matching records from the left table (sales).

-- Use Case: Find all customers, even those who haven't made any purchases.

SELECT s.SalesID, s.SalesPersonID, s.CustomerID, c.FirstName, c.LastName, 
       s.ProductID, s.Quantity, s.TotalPrice, s.SalesDate 
FROM sales s
RIGHT JOIN customers c ON s.CustomerID = c.CustomerID;

-- 4. 'FULL OUTER JOIN' (or FULL JOIN)
       -- 👉 Retrieves all records from both tables, showing NULL where there is no match.
       
-- Use Case: Get a complete list of all customers and sales.

SELECT s.SalesID, s.SalesPersonID, s.CustomerID, c.FirstName, c.LastName, 
       s.ProductID, s.Quantity, s.TotalPrice, s.SalesDate 
FROM sales s
LEFT JOIN customers c ON s.CustomerID = c.CustomerID

UNION

SELECT s.SalesID, s.SalesPersonID, s.CustomerID, c.FirstName, c.LastName, 
       s.ProductID, s.Quantity, s.TotalPrice, s.SalesDate 
FROM sales s
RIGHT JOIN customers c ON s.CustomerID = c.CustomerID;

-- 5. 'CROSS JOIN' (or Cartesian Join)
       -- 👉 Matches each row from the Sales table with every row from the Customers table.

-- Use Case: Generate all possible sales-customer combinations.
SELECT s.SalesID, s.SalesPersonID, s.CustomerID, c.FirstName, c.LastName, 
       s.ProductID, s.Quantity, s.TotalPrice, s.SalesDate 
FROM sales s
CROSS JOIN customers c;




