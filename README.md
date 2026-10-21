# SQL Data Analysis — DecodeLabs Project 3

## Project Overview

This project focuses on using SQL to query, clean, explore, and analyze a retail orders dataset to extract meaningful business insights. It was completed as part of the DecodeLabs Data Analytics Industrial Training Program.

## Objectives

- Verify the dataset's structure and completeness.
- Identify and address missing values.
- Explore order patterns, product performance, payment methods, and sales trends.
- Analyze referral sources and coupon usage.
- Calculate product contributions to total recorded sales.

## Tools Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL

## Dataset Overview

The dataset contains **1,200 records and 14 columns**, covering retail orders from January 1, 2023, to June 30, 2025.

Key fields include OrderID, Date, CustomerID, Product, Quantity, UnitPrice, PaymentMethod, OrderStatus, CouponCode, ReferralSource, and TotalPrice.

## Project Workflow

### 1. Data Verification
- Counted the total number of records.
- Identified the earliest and latest order dates.

### 2. Data Quality Assessment
- Checked for missing values, duplicate order IDs, invalid quantities, non-positive unit prices, and blank product names.
- Identified 309 missing CouponCode values.
- Replaced missing coupon codes with `No Coupon` and verified that no missing coupon codes remained.

### 3. Exploratory Data Analysis
- Examined order status distributions.
- Compared product quantities and recorded sales.
- Analyzed average order values by product and payment method.
- Explored monthly recorded sales trends.
- Identified high-value orders and compared recorded sales across order statuses.

### 4. Business Analysis
- Compared referral sources by order volume and recorded sales.
- Compared average order values for coupon and non-coupon orders.
- Calculated each product's percentage contribution to total recorded sales.

## Key Findings

- **Chair** recorded the highest product sales at 195,620.11, narrowly ahead of Printer at 195,612.61.
- **Phone** recorded the lowest product sales at 151,722.39.
- **June 2024** had the highest monthly recorded sales at 68,068.54, while April 2023 had the lowest at 27,751.71.
- **Instagram** had the highest number of orders (259) and the highest total recorded sales among referral sources.
- Orders with coupon codes had an average order value of 1,057.64, compared with 1,043.37 for orders without coupons.

*Note: These figures represent recorded order values across the dataset. Because the data includes cancelled, returned, and pending orders, they should not be interpreted as confirmed realized revenue. The coupon comparison also does not establish causation.*

## SQL Concepts Applied

- `SELECT` and `WHERE`
- `ORDER BY` and `GROUP BY`
- Aggregate functions: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`
- `HAVING`
- `CASE`
- Subqueries
- `ROUND()` and `TOP`

## Repository Structure

- `01_Data_Verification.sql` — Record counts and date-range checks.
- `02_Data_Quality.sql` — Data quality checks and missing-value handling.
- `03_Data_Exploration.sql` — Exploratory queries and trends.
- `04_SQL_Analysis.sql` — Business analysis and percentage contribution.

## Conclusion

This project strengthened my practical SQL skills in data verification, data quality assessment, filtering, aggregation, exploratory analysis, and business insight generation. It also reinforced the importance of validating results and interpreting transactional data within its limitations.
