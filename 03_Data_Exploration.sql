USE HephzibahAjala_DecodeLabs_Project3;
GO

-- =============================================
-- PROJECT 3: SQL DATA ANALYSIS
-- FILE 3: DATA EXPLORATION
-- =============================================

-- 1. Explore the distribution of order statuses
SELECT
    OrderStatus,
    COUNT(*) AS NumberOfOrders,
    CAST(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM dbo.Orders)
        AS DECIMAL(5,2)
    ) AS PercentageOfOrders
FROM dbo.Orders
GROUP BY OrderStatus
ORDER BY NumberOfOrders DESC;

-- 2. Explore total quantity ordered by product
SELECT
    Product,
    SUM(Quantity) AS TotalQuantityOrdered
FROM dbo.Orders
GROUP BY Product
ORDER BY TotalQuantityOrdered DESC;

-- 3. Explore average order value by payment method
SELECT
    PaymentMethod,
    COUNT(*) AS NumberOfOrders,
    AVG(TotalPrice) AS AverageOrderValue
FROM dbo.Orders
GROUP BY PaymentMethod
ORDER BY AverageOrderValue DESC;

-- 4. Display average order value rounded to two decimal places
SELECT
    PaymentMethod,
    COUNT(*) AS NumberOfOrders,
    ROUND(AVG(TotalPrice), 2) AS AverageOrderValue
FROM dbo.Orders
GROUP BY PaymentMethod
ORDER BY AverageOrderValue DESC;

-- 5. Calculate total recorded sales by product
SELECT
    Product,
    SUM(TotalPrice) AS TotalSales
FROM dbo.Orders
GROUP BY Product
ORDER BY TotalSales DESC;

-- 6. Explore average order value by product
SELECT
    Product,
    COUNT(*) AS NumberOfOrders,
    ROUND(AVG(TotalPrice), 2) AS AverageOrderValue
FROM dbo.Orders
GROUP BY Product
ORDER BY AverageOrderValue DESC;

-- 7. Explore monthly sales trends
SELECT
    YEAR([Date]) AS OrderYear,
    MONTH([Date]) AS OrderMonth,
    COUNT(*) AS NumberOfOrders,
    ROUND(SUM(TotalPrice), 2) AS TotalSales
FROM dbo.Orders
GROUP BY
    YEAR([Date]),
    MONTH([Date])
ORDER BY
    OrderYear,
    OrderMonth;

-- 8. Explore order count and recorded sales by order status
SELECT
    OrderStatus,
    COUNT(*) AS NumberOfOrders,
    ROUND(SUM(TotalPrice), 2) AS TotalRecordedSales,
    ROUND(AVG(TotalPrice), 2) AS AverageOrderValue
FROM dbo.Orders
GROUP BY OrderStatus
ORDER BY TotalRecordedSales DESC;

-- 9. Identify high-value orders
SELECT
    OrderID,
    [Date],
    Product,
    Quantity,
    TotalPrice,
    OrderStatus
FROM dbo.Orders
WHERE TotalPrice >= 1500
ORDER BY TotalPrice DESC;

-- 10. Find products with total recorded sales above 180,000
SELECT
    Product,
    COUNT(*) AS NumberOfOrders,
    ROUND(SUM(TotalPrice), 2) AS TotalSales
FROM dbo.Orders
GROUP BY Product
HAVING SUM(TotalPrice) > 180000
ORDER BY TotalSales DESC;