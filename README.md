# PC_Database
Project Overview
This project analyses a retail PC sales dataset stored in SQL Server ([pc_database].[dbo].[pc_dataset.dbo]). The dataset includes sales transactions with attributes such as continent, country/state, shop name, product details, pricing, discounts, financing, and shipping dates.
The goal was to run  analytical SQL queries to uncover business insights, identify data quality issues, and propose solutions. The results are consolidated into a single diagnostic table for visualization in Power BI or Google Looker.
Data Challenges
During query execution, several issues were discovered:
•	Text stored as numbers - Sale_Price, Cost_Price, Finance_Amount, and Discount_Amount were stored as nvarchar, causing conversion errors.
•	Invalid dates - Purchase_Date and Ship_Date contained non date values, breaking DATEDIFF.
•	Duplicate records - Large dataset with potential duplication of sales entries.
•	Schema inconsistencies - Numeric and date fields not enforced at the database level.
Analytical Themes
The SQL queries were grouped into three levels:
1.	Basic KPIs
   
o	Total sales records
o	Sales per continent, country/state, shop
o	Distinct shop names and PC makes
o	Average, highest, and lowest sale price

3.	Intermediate Insights
o	Total revenue and profit
o	Average discount amount
o	Total finance amount issued
o	Revenue per PC make, shop, and salesperson
o	Average credit score per payment method
o	Cost of repairs per department

4.	Advanced Diagnostics
   
o	Profit per shop and profit margin per sale
o	Revenue per continent, storage type, and RAM size
o	Highest sale price per PC model
o	Average shipping days per shop
o	Sales below market price
o	Ranking salespeople by total sales

Consolidated Results Table

To simplify visualization, a single SQL query was created that outputs a table with four columns:

•	MetricName - KPI being measured (e.g., Total Revenue, Average Sale Price).
•	MetricValue - Numeric result of the query.
•	IssueIdentified - Data quality or operational issue discovered.
•	ProposedSolution - Recommended fix for the issue.
Example output:
MetricName	MetricValue	IssueIdentified	ProposedSolution
Total Sales Records	12,500	Dataset may contain duplicates	Implement unique constraints or deduplication
Total Revenue	45,000,000	Sale_Price stored as text	Alter column to DECIMAL and validate data
Total Profit	8,500,000	Cost_Price and Sale_Price inconsistencies	Standardize pricing fields
Average Sale Price	3,600	Invalid numeric values in Sale_Price	Clean dataset and enforce numeric schema
Average Days to Ship	5.2	Dates stored as text, causing conversion errors	Convert columns to DATE and filter invalid rows

Next Steps
•	Data Cleaning - Permanently convert numeric and date fields to proper types.
•	Schema Enforcement - Apply constraints to prevent invalid entries.
•	Advanced Modeling - Use clustering and forecasting to predict demand.
•	Dashboard Deployment - Publish interactive dashboards for executives.

