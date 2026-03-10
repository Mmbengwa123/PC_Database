CREATE DATABASE pc_database;

GO

CREATE TABLE pc_database.dbo
(
	Continent VARCHAR(250) NOT NULL,
	Country_or_State VARCHAR(250) NOT NULL,
	Province or City VARCHAR(250) NOT NULL,
	Shop_Name VARCHAR(250) NOT NULL,
	Shop_Age INT NOT NULL,
	PC_Make VARCHAR(250) NOT NULL,
	PC_Model VARCHAR(250) NOT NULL,
	Storage_Type VARCHAR(250) NOT NULL,
	Customer_Name VARCHAR(250) NOT NULL,
	Customer_Surname VARCHAR(250) NOT NULL,
	Customer_Contact_Number VARCHAR(250) NOT NULL,
	Customer_Email_Address VARCHAR(250) NOT NULL,
	Sales_Person_Name VARCHAR(250) NOT NULL,
	Sales_Person_Department VARCHAR(250) NOT NULL,
	Cost_Price INT NOT NULL,
	Sale_Price INT NOT NULL,
	Payment_Method VARCHAR(250) NOT NULL,
	Discount_Amount INT NOT NULL,
	Purchase_Date DATE NOT NULL,
	Ship_Date DATE NOT NULL,
	Finance_Amount INT NOT NULL,
	RAM VARCHAR(250) NOT NULL,
	Credit_Score INT NOT NULL,
	Channel VARCHAR(250) NOT NULL,
	Priority VARCHAR(250) NOT NULL,
	Cost_of_Repairs INT NOT NULL,
	Total_Sales_per_Employee INT NOT NULL,
	PC_Market_Price INT NOT NULL,
	Storage_Capacity VARCHAR(250) NOT NULL

	SELECT TOP (1000) [Continent]
      ,[Country_or_State]
      ,[Province_or_City]
      ,[Shop_Name]
      ,[Shop_Age]
      ,[PC_Make]
      ,[PC_Model]
      ,[Storage_Type]
      ,[Customer_Name]
      ,[Customer_Surname]
      ,[Customer_Contact_Number]
      ,[Customer_Email_Address]
      ,[Sales_Person_Name]
      ,[Sales_Person_Department]
      ,[Cost_Price]
      ,[Sale_Price]
      ,[Payment_Method]
      ,[Discount_Amount]
      ,[Purchase_Date]
      ,[Ship_Date]
      ,[Finance_Amount]
      ,[RAM]
      ,[Credit_Score]
      ,[Channel]
      ,[Priority]
      ,[Cost_of_Repairs]
      ,[Total_Sales_per_Employee]
      ,[PC_Market_Price]
      ,[Storage_Capacity]
  FROM [pc_database].[dbo].[pc_dataset.dbo]


  -- ======================================================
-- SQL PROJECT QUESTIONS
-- Dataset: PC Sales
-- ======================================================

-- BASIC QUESTIONS

-- 1. Count the total number of sales records.
SELECT COUNT(*) AS TotalSales FROM [pc_database].[dbo].[pc_dataset.dbo];

-- 2. Count the number of sales per Continent.

SELECT Continent, COUNT(*) AS SalesPerContinent
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY Continent
ORDER BY SalesPerContinent DESC;

-- 3. Count the number of sales per Country or State.

SELECT Country_or_State, COUNT(*) AS SalesPerCountryOrState
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY Country_or_State
ORDER BY SalesPerCountryOrState DESC;

-- 4. List all distinct Shop Name values.

SELECT DISTINCT Shop_Name
FROM [pc_database].[dbo].[pc_dataset.dbo]
ORDER BY Shop_Name;

-- 5. Find the average Sale Price.

SELECT AVG(Sale_Price) AS AverageSalePrice
FROM [pc_database].[dbo].[pc_dataset.dbo];


-- 6. Find the highest and lowest Sale Price.

SELECT MAX(Sale_Price) AS HighestSalePrice, MIN(Sale_Price) AS LowestSalePrice
FROM [pc_database].[dbo].[pc_dataset.dbo];

-- 7. Count the number of sales by Payment Method.

SELECT Payment_Method, COUNT(*) AS SalesPerPaymentMethod
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY Payment_Method
ORDER BY SalesPerPaymentMethod DESC;

-- 8. Count the number of sales by Channel (Online vs Offline).

SELECT Channel, COUNT(*) AS SalesPerChannel
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY Channel
ORDER BY SalesPerChannel DESC;

-- 9. Count the number of sales by Priority level.

SELECT Priority, COUNT(*) AS SalesPerPriority
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY Priority
ORDER BY SalesPerPriority DESC;

-- 10. Count the number of distinct PC Make values.

SELECT DISTINCT PC_Make, COUNT(*) AS SalesPerPCMake
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY PC_Make
ORDER BY SalesPerPCMake DESC;

-- INTERMEDIATE QUESTIONS

-- 11. Calculate total revenue (SUM of Sale Price).

SELECT SUM(Sale_Price) AS TotalRevenue
FROM [pc_database].[dbo].[pc_dataset.dbo];

-- 12. Calculate total profit (SUM of Sale Price - Cost Price).

SELECT SUM(Sale_Price - Cost_Price) AS TotalProfit
FROM [pc_database].[dbo].[pc_dataset.dbo];

-- 13. Find the average Discount Amount.

SELECT AVG(Discount_Amount) AS AverageDiscountAmount
FROM [pc_database].[dbo].[pc_dataset.dbo];

-- 14. Calculate total Finance Amount issued.

SELECT SUM(CAST(Finance_Amount AS DECIMAL(18,2))) AS TotalFinanceAmount
FROM [pc_database].[dbo].[pc_dataset.dbo];


-- 15. Find total revenue per PC Make.

SELECT PC_Make, SUM(Sale_Price) AS RevenuePerPCMake
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY PC_Make
ORDER BY RevenuePerPCMake DESC;

-- 16. Find average Sale Price per Storage Type.

SELECT Storage_Type, AVG(Sale_Price) AS AverageSalePricePerStorageType
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY Storage_Type
ORDER BY AverageSalePricePerStorageType DESC;

-- 17. Calculate total revenue per Shop Name.

SELECT Shop_Name, SUM(Sale_Price) AS RevenuePerShop
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY Shop_Name
ORDER BY RevenuePerShop DESC;

-- 18. Calculate total revenue per Sales Person Name.

SELECT Sales_Person_Name, SUM(Sale_Price) AS RevenuePerSalesPerson
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY Sales_Person_Name
ORDER BY RevenuePerSalesPerson DESC;

-- 19. Find average Credit Score per Payment Method.

SELECT Payment_Method, AVG(Credit_Score) AS AverageCreditScorePerPaymentMethod
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY Payment_Method
ORDER BY AverageCreditScorePerPaymentMethod DESC;

-- 20. Calculate total Cost of Repairs per Sales Person Department.

SELECT Sales_Person_Department,SUM(CAST(Cost_of_Repairs AS DECIMAL(18,2))) AS TotalCostOfRepairsPerDepartment
FROM [pc_database].[dbo].[pc_dataset.dbo]
WHERE TRY_CAST(Cost_of_Repairs AS DECIMAL(18,2)) IS NOT NULL
GROUP BY Sales_Person_Department
ORDER BY TotalCostOfRepairsPerDepartment DESC;


-- ADVANCED QUESTIONS

-- 21. Calculate profit per Shop Name.


SELECT Shop_Name, SUM(Sale_Price - Cost_Price) AS ProfitPerShop
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY Shop_Name
ORDER BY ProfitPerShop DESC;


-- 22. Calculate profit margin per sale ((Sale Price - Cost Price) / Sale Price).

SELECT Shop_Name, 
	   (SUM(Sale_Price) - SUM(Cost_Price)) / NULLIF(SUM(Sale_Price), 0) AS ProfitMarginPerShop
	   FROM [pc_database].[dbo].[pc_dataset.dbo]
	   GROUP BY Shop_Name
	   ORDER BY ProfitMarginPerShop DESC;
	
-- 23. Determine which Continent has the highest total revenue.

SELECT Continent, SUM(Sale_Price) AS RevenuePerContinent
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY Continent
ORDER BY RevenuePerContinent DESC;

-- 24. Calculate average Sale Price per RAM size.

SELECT RAM, AVG(Sale_Price) AS AverageSalePricePerRAM
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY RAM
ORDER BY AverageSalePricePerRAM DESC;


-- 25. Find the PC Model with the highest Sale Price.

SELECT PC_Model, MAX(Sale_Price) AS HighestSalePricePerModel
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY PC_Model
ORDER BY HighestSalePricePerModel DESC;

-- 26. Calculate the average number of days between Purchase Date and Ship Date.

SELECT Shop_Name,
       AVG(DATEDIFF(DAY, 
            TRY_CAST(Purchase_Date AS DATE), 
            TRY_CAST(Ship_Date AS DATE))) AS AverageDaysToShip
FROM [pc_database].[dbo].[pc_dataset.dbo]
WHERE TRY_CAST(Purchase_Date AS DATE) IS NOT NULL
  AND TRY_CAST(Ship_Date AS DATE) IS NOT NULL
GROUP BY Shop_Name
ORDER BY AverageDaysToShip ASC;


-- 27. Determine which Sales Person Department generates the highest revenue.

SELECT Sales_Person_Department, SUM(Sale_Price) AS RevenuePerDepartment
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY Sales_Person_Department
ORDER BY RevenuePerDepartment DESC;

-- 28. Calculate total revenue per Storage Capacity.

SELECT Storage_Capacity, SUM(Sale_Price) AS RevenuePerStorageCapacity
FROM [pc_database].[dbo].[pc_dataset.dbo]
GROUP BY Storage_Capacity
ORDER BY RevenuePerStorageCapacity DESC;

-- 29. Identify sales where Sale Price is lower than PC Market Price.

SELECT *
FROM [pc_database].[dbo].[pc_dataset.dbo]
WHERE Sale_Price < PC_Market_Price
ORDER BY Sale_Price ASC;

-- 30. Rank Sales Person Name by Total Sales per Employee using a window function.

SELECT Sales_Person_Name, 
	   Total_Sales_per_Employee,
	   RANK() OVER (ORDER BY Total_Sales_per_Employee DESC) AS SalesPersonRank
	   FROM [pc_database].[dbo].[pc_dataset.dbo]
	   ORDER BY SalesPersonRank ASC;

---------------------------------------------------------------------------------

SELECT 'Total Sales Records' AS MetricName,
       COUNT(*) AS MetricValue,
       'Large dataset may contain duplicates' AS IssueIdentified,
       'Implement unique constraints or deduplication' AS ProposedSolution
FROM [pc_database].[dbo].[pc_dataset.dbo]

UNION ALL
SELECT 'Total Revenue',
       SUM(TRY_CAST(Sale_Price AS DECIMAL(18,2))),
       'Sale_Price stored as text, causing conversion errors' AS IssueIdentified,
       'Alter column to DECIMAL and validate data' AS ProposedSolution
FROM [pc_database].[dbo].[pc_dataset.dbo]

UNION ALL
SELECT 'Total Profit',
       SUM(TRY_CAST(Sale_Price AS DECIMAL(18,2)) - TRY_CAST(Cost_Price AS DECIMAL(18,2))),
       'Cost_Price and Sale_Price inconsistencies' AS IssueIdentified,
       'Standardize pricing fields and enforce validation' AS ProposedSolution
FROM [pc_database].[dbo].[pc_dataset.dbo]

UNION ALL
SELECT 'Average Sale Price',
       AVG(TRY_CAST(Sale_Price AS DECIMAL(18,2))),
       'Invalid numeric values in Sale_Price' AS IssueIdentified,
       'Clean dataset and enforce numeric schema' AS ProposedSolution
FROM [pc_database].[dbo].[pc_dataset.dbo]

UNION ALL
SELECT 'Average Days to Ship',
       AVG(DATEDIFF(DAY, TRY_CAST(Purchase_Date AS DATE), TRY_CAST(Ship_Date AS DATE))),
       'Purchase_Date and Ship_Date stored as text, causing conversion errors' AS IssueIdentified,
       'Convert columns to DATE and filter invalid rows' AS ProposedSolution
FROM [pc_database].[dbo].[pc_dataset.dbo]
WHERE TRY_CAST(Purchase_Date AS DATE) IS NOT NULL
  AND TRY_CAST(Ship_Date AS DATE) IS NOT NULL;



