# Zepto-Inventory-SQL-Project
## Project Overview
    This project analyzes a Zepto inventory dataset using MySQL. The goal was to explore product data, clean the dataset, and generate business insights related to pricing, discounts, inventory levels, stock availability, and product categories.
## Dataset Information
    The dataset contains:
    * Product Name
    * Category
    * MRP
    * Discount Percentage
    * Discounted Selling Price
    * Available Quantity
    * Weight (in grams)
    * Stock Availability
    
## Tools Used
    * MySQL
    * SQL
    
## Project Tasks:
1.  Data Cleaning & Preparation    
    * Added a Primary Key using AUTO_INCREMENT.
    * Checked for NULL values.
    * Identified products with zero prices.
    * Converted prices from paise to rupees for analysis.
    
2.  Data Exploration
    * Counted total records.
    * Identified unique product categories.
    * Analyzed out-of-stock products.
    * Detected duplicate product names.
    
## Business Analysis:
    1. Top 10 products with the highest discount percentage.
    2. High-MRP products that are currently out of stock.
    3. Estimated revenue by category.
    4. Products with MRP greater than ₹500 and discount below 10%.
    5. Top 5 categories offering the highest average discount.
    6. Price-per-gram analysis for value comparison.
    7. Product classification based on weight (Low, Medium, Bulk).
    8. Total inventory weight available per category.
    9. Product count by category.
    10. Product with the highest available stock.
    11. Products priced above the overall average MRP (Subquery).
    12. Categories whose average MRP exceeds the overall average MRP (GROUP BY + HAVING + Subquery).
    
 ## SQL Concepts Used
    * SELECT
    * WHERE
    * ORDER BY
    * GROUP BY
    * HAVING
    * Aggregate Functions (COUNT, SUM, AVG, MAX)
    * CASE Statements
    * Subqueries
    
## Key Insights:
    * Identified heavily discounted products.
    * Estimated category-wise revenue potential.
    * Compared product value using price-per-gram analysis.
    * Analyzed stock distribution across categories.
    * Used subqueries to compare category performance against overall averages.
    
## Files Included
    * zepto_inventory.sql
    * zepto_dataset.csv
    * README.md
    * screenshots/
    
## Conclusion:
    This project demonstrates the use of SQL for inventory analysis, data cleaning, business reporting, and insight generation using real-world retail data.
**
