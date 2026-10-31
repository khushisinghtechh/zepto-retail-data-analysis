# Zepto Retail Data Analysis using SQL

## Project Overview
This project focuses on analyzing Zepto's retail inventory and product dataset using SQL and PostgreSQL. The objective is to explore product-level data, clean inconsistencies, and extract meaningful business insights to support data-driven decision-making.

## Tools & Technologies
- PostgreSQL
- pgAdmin 4
- SQL
- Microsoft Excel

## Dataset Description
The dataset contains information about Zepto products, including:
- SKU ID
- Product name and category
- Maximum Retail Price (MRP)
- Discount percentage
- Discounted selling price
- Available quantity
- Stock availability
- Product weight

## Project Workflow

### 1. Data Exploration
- Checked the total number of records.
- Retrieved sample records for initial inspection.
- Identified missing or NULL values.
- Explored distinct product categories.
- Analyzed in-stock and out-of-stock products.
- Identified duplicate product names across multiple SKUs.

### 2. Data Cleaning
- Identified products with zero MRP or selling price.
- Removed records with zero MRP.
- Converted price values from paise to Indian rupees.
- Renamed columns for better consistency and readability.

### 3. Business Analysis & Insights
- Identified the top 10 best-value products based on discount percentage.
- Analyzed high-MRP products that were out of stock.
- Estimated revenue by product category using selling price and available quantity.
- Identified expensive products offering discounts below 10%.
- Ranked the top 5 categories by average discount percentage.
- Calculated price per gram to compare product value.
- Categorized products based on weight (low and bulk).
- Calculated total inventory weight by product category.

## SQL Concepts Demonstrated
- CREATE TABLE and DROP TABLE
- SELECT, WHERE, DISTINCT
- ORDER BY and LIMIT
- GROUP BY and HAVING
- Aggregate functions (COUNT, SUM, AVG)
- NULL value handling
- DELETE and UPDATE
- ALTER TABLE and RENAME COLUMN
- CASE statements
- ROUND() function

## Project Objective
To demonstrate practical SQL skills through retail data analysis, data cleaning, and business-oriented queries that generate actionable insights.
