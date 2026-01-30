-- Monthly Revenue
SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS month,
    SUM(Quantity * UnitPrice) AS revenue
FROM online_retail
WHERE Quantity > 0 AND UnitPrice > 0
GROUP BY month
ORDER BY month;

-- Top Customers
SELECT 
    CustomerID,
    SUM(Quantity * UnitPrice) AS total_spent
FROM online_retail
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;

-- Repeat Customers
SELECT 
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS orders
FROM online_retail
GROUP BY CustomerID
HAVING orders > 1;

