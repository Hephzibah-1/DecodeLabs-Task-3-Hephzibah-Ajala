USE HephzibahAjala_DecodeLabs_Project3;
GO
--================================
--PROJECT 3:SQL DATA ANALYSIS
--FILE 1: DATA VERIFICATION
--================================
SELECT TOP 10 *
FROM dbo.Orders;

--1. CountTotal Records
SELECT COUNT(*) AS TotalRecords
FROM dbo.Orders

--2. Check Date Range
SELECT
	MIN([Date]) AS EarliestOrderDate,
	MAX([Date]) AS LatestOrderDate
FROM dbo.Orders