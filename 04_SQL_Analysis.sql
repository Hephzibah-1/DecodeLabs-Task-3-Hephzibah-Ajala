USE HephzibahAjala_DecodeLabs_Project3;
GO

-- =============================================
-- PROJECT 3: SQL DATA ANALYSIS
-- FILE 4: BUSINESS ANALYSIS
-- =============================================

-- 1. Analyse recorded sales by referral source
SELECT
    ReferralSource,
    COUNT(*) AS NumberOfOrders,
    ROUND(SUM(TotalPrice), 2) AS TotalRecordedSales,
    ROUND(AVG(TotalPrice), 2) AS AverageOrderValue
FROM dbo.Orders
GROUP BY ReferralSource
ORDER BY TotalRecordedSales DESC;

-- 2. Compare orders with and without coupon codes
SELECT
    CASE
        WHEN CouponCode = 'No Coupon'
        THEN 'No Coupon'
        ELSE 'Coupon Used'
    END AS CouponUsage,
    COUNT(*) AS NumberOfOrders,
    ROUND(AVG(TotalPrice), 2) AS AverageOrderValue,
    ROUND(SUM(TotalPrice), 2) AS TotalRecordedSales
FROM dbo.Orders
GROUP BY
    CASE
        WHEN CouponCode = 'No Coupon'
        THEN 'No Coupon'
        ELSE 'Coupon Used'
    END
ORDER BY NumberOfOrders DESC;

-- 3. Calculate each product's percentage contribution
-- to total recorded sales

SELECT
    Product,
    ROUND(SUM(TotalPrice), 2) AS ProductSales,
    ROUND(
        SUM(TotalPrice) * 100.0 /
        (SELECT SUM(TotalPrice)
         FROM dbo.Orders),
        2
    ) AS PercentageContribution
FROM dbo.Orders
GROUP BY Product
ORDER BY PercentageContribution DESC;