USE HephzibahAjala_DecodeLabs_Project3;
GO

--================================
--PROJECT 3:SQL DATA ANALYSIS
--FILE 2: DATA QUALITY CHECKS
--================================

--1. Check Missing Values in All Columns
SELECT
	COUNT(*) AS TotalRecords,
	COUNT(OrderID) AS NonMissingOrderID,
	COUNT([Date]) AS NonMissingDate,
	COUNT(CustomerID) AS NonMissingCustomerID,
	COUNT(Product) AS NonMissingProduct,
	COUNT(Quantity) AS NonMissingQuantity,
	COUNT(UnitPrice) AS NonMisingUnitPrice,
	COUNT(ShippingAddress) AS NonMissingShippingAddress,
	COUNT(PaymentMethod) AS NonMissingPaymentMethod,
	COUNT(OrderStatus) AS NonMissingOrderStatus,
	COUNT(TrackingNumber) AS NonMissingTrackingNumber,
	COUNT(ItemsInCart) AS NonMissingItemsInCart,
	COUNT(CouponCode) AS NonMissingCouponCode,
	COUNT(ReferralSource) AS NonMissingReferralSource,
	COUNT(TotalPrice) AS NonMissingTotalPrice
FROM dbo.Orders;

--2. Check for Duplicate Order IDs
SELECT 
	OrderID,
	COUNT(*) AS DuplicateCount
FROM dbo.Orders
GROUP BY OrderID
HAVING COUNT(*) > 1;

--3. Check for zero or negative quantities
SELECT *
FROM dbo.Orders
WHERE Quantity <= 0;

--4. Check for zero or negative unit prices
SELECT *
FROM dbo.Orders
WHERE UnitPrice <= 0;

--5. Check for missing or blank product names
SELECT *
FROM dbo.Orders
WHERE Product IS NULL
	OR LTRIM(RTRIM(Product)) = ' ';

--6. Examine Order Statuses and their frequencies
SELECT 
	OrderStatus,
	COUNT(*) AS NumberOfOrders
FROM dbo.Orders
GROUP BY OrderStatus
ORDER BY NumberOfOrders DESC;

--7. Examine payment methods and their frequencies
SELECT 
	PaymentMethod,
	COUNT(*) AS NumberOfOrders
FROM dbo.Orders
GROUP BY PaymentMethod
ORDER BY NumberOfOrders DESC;

-- 8. Examine referral sources and their frequencies
SELECT
    ReferralSource,
    COUNT(*) AS NumberOfOrders
FROM dbo.Orders
GROUP BY ReferralSource
ORDER BY NumberOfOrders DESC;

-- 9. Examine products by number of orders
SELECT
    Product,
    COUNT(*) AS NumberOfOrders
FROM dbo.Orders
GROUP BY Product
ORDER BY NumberOfOrders DESC;

USE HephzibahAjala_DecodeLabs_Project3;
GO

-- 10. Check missing CouponCode values
SELECT
    COUNT(*) AS TotalRecords,
    SUM(
        CASE
            WHEN CouponCode IS NULL
                 OR LTRIM(RTRIM(CouponCode)) = ''
            THEN 1
            ELSE 0
        END
    ) AS MissingCouponCodes
FROM dbo.Orders;

-- 11. Replace missing CouponCode values

UPDATE dbo.Orders
SET CouponCode = 'No Coupon'
WHERE CouponCode IS NULL
   OR LTRIM(RTRIM(CouponCode)) = '';