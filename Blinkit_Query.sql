create database blinkit ;

USE  blinkit ;

select * FROM blinkit_data ;

SELECT COUNT(*) FROM blinkit_data;

-- KPI 
# Total Sales
SELECT CAST(SUM(Total_Sales)/1000000 AS DECIMAL (10,2)) as Total_Sales_in_millions
FROM blinkit_data ;

# Average Sales 
SELECT CAST(AVG(Total_Sales) AS DECIMAL (10,0)) as Avg_Sales
FROM blinkit_data ;

# Number of data
SELECT COUNT(*) AS No_of_Items FROM blinkit_data;

#  Average Rating 
SELECT CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating FROM blinkit_data ;

# 1Total Sales by Fat Content
SELECT Item_Fat_Content , CAST(SUM(Total_Sales)AS DECIMAL(10,2))AS Total_Sales,
 CAST(AVG(Total_Sales) AS DECIMAL (10,0)) as Avg_Sales,
 COUNT(*) AS No_of_Items,
 CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating 
FROM blinkit_data
GROUP BY Item_Fat_Content 
ORDER BY Total_Sales DESC;

# 2 Total Sales by Item Type
SELECT Item_Type, CAST(SUM(Total_Sales)AS DECIMAL(10,2))AS Total_Sales,
 CAST(AVG(Total_Sales) AS DECIMAL (10,0)) as Avg_Sales,
 COUNT(*) AS No_of_Items,
 CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating 
FROM blinkit_data
GROUP BY Item_Type
ORDER BY Total_Sales DESC
LIMIT 5;


# 3 
 SELECT Outlet_Location_Type,Item_Fat_Content ,
 CAST(SUM(Total_Sales)AS DECIMAL(10,2))AS Total_Sales,
 CAST(AVG(Total_Sales) AS DECIMAL (10,0)) as Avg_Sales,
 COUNT(*) AS No_of_Items,
 CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating 
FROM blinkit_data
GROUP BY Outlet_Location_Type,Item_Fat_Content 
ORDER BY Total_Sales DESC;


 # 4
SELECT Outlet_Establishment_Year ,
 CAST(SUM(Total_Sales)AS DECIMAL(10,2))AS Total_Sales,
 CAST(AVG(Total_Sales) AS DECIMAL (10,0)) as Avg_Sales,
 COUNT(*) AS No_of_Items,
 CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating 
FROM blinkit_data
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year ASC ;

# 5
SELECT 
Outlet_Size, 
CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;

# 6 
SELECT Outlet_Location_Type ,
 CAST(SUM(Total_Sales)AS DECIMAL(10,2))AS Total_Sales,
 CAST(AVG(Total_Sales) AS DECIMAL (10,0)) as Avg_Sales,
 COUNT(*) AS No_of_Items,
 CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating 
FROM blinkit_data
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC ;

# 7
SELECT Outlet_Type ,
 CAST(SUM(Total_Sales)AS DECIMAL(10,2))AS Total_Sales,
 CAST((SUM(Total_Sales) * 100.0 / SUM(SUM(Total_Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage,
 CAST(AVG(Total_Sales) AS DECIMAL (10,0)) as Avg_Sales,
 COUNT(*) AS No_of_Items,
 CAST(AVG(Rating) AS DECIMAL(10,2)) AS Avg_Rating 
FROM blinkit_data
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC ;




