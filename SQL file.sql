CREATE database ecom_sales;
use ecom_sales;
DESCRIBE ecommerce_sales_data;
SELECT DISTINCT Product FROM ecommerce_sales_data;
SELECT DISTINCT Category FROM ecommerce_sales_data;
SELECT DISTINCT Platform FROM ecommerce_sales_data;
SELECT COUNT(OrderID) FROM ecommerce_sales_data;
SELECT SUM(TotalAmount) from ecommerce_sales_data;
SELECT AVG(TotalAmount) from ecommerce_sales_data;


SELECT Product, SUM(TotalAmount) AS Revenue, AVG(Rating) AS AvgRating
FROM ecommerce_sales_data
GROUP BY Product
ORDER BY Revenue DESC
LIMIT 5;


SELECT Product, SUM(Quantity) AS TotalUnitsSold,
SUM(TotalAmount) AS Revenue
FROM ecommerce_sales_data
GROUP BY Product
ORDER BY Revenue DESC
LIMIT 3;

SELECT Brand, SUM(TotalAmount) as TotalBrandSales
from ecommerce_sales_data
GROUP BY Brand
Order by TotalBrandSales DESC
LIMIT 3;

SELECT Platform,
COUNT(OrderID) AS TotalOrders,
SUM(TotalAmount) AS RevenueByPlatform,
AVG(TotalAmount) AS AvgOrderValue
FROM ecommerce_sales_data
GROUP BY Platform
order by RevenueByPlatform DESC
limit 5;


SELECT City, 
Count(OrderID) as TotalOrders,
SUM(TotalAmount) as RevenueByCity
from ecommerce_sales_data
GROUP BY City
Order by RevenueByCity DESC;


SELECT Category, SUM(TotalAmount) as TotalCategorySales
from ecommerce_sales_data
GROUP BY Category
Order by TotalCategorySales DESC
LIMIT 5;


SELECT Product, avg(Rating) as AvgRating,
SUM(Reviews) as NumberOfReviews
from ecommerce_sales_data
group by product
order by AvgRating DESC
LIMIT 3;


SELECT
CASE
   WHEN TotalAmount < 1000 THEN 'Low Priced Products'
   WHEN TotalAmount BETWEEN 1000 and 5000 THEN 'Mid Priced Products'
   ELSE 'High Priced Products'
END AS PriceRange,
SUM(TotalAmount) as Revenue,
SUM(Quantity) as TotalQuantity
from ecommerce_sales_data
group by PriceRange
Order by Revenue DESC;

SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    COUNT(OrderID) AS TotalOrders,
    SUM(TotalAmount) AS Revenue
FROM ecommerce_sales_data
GROUP BY Month
ORDER BY Revenue DESC;


SELECT Product, SUM(TotalAmount) as Revenue
FROM ecommerce_sales_data
GROUP BY Product
HAVING Revenue > (
       SELECT Avg(TotalAmount) 
       FROM ecommerce_sales_data
       )
ORDER BY Revenue DESC
Limit 5;


SELECT Product, SUM(TotalAmount) as Revenue
FROM ecommerce_sales_data
GROUP BY Product
HAVING Revenue > (
       SELECT Avg(TotalAmount) 
       FROM ecommerce_sales_data
       )
ORDER BY Revenue ASC
Limit 5;


SELECT City, SUM(TotalAmount) as Revenue
FROM ecommerce_sales_data
GROUP BY City
HAVING Revenue > (
        SELECT AVG(TotalAmount)
        FROM ecommerce_sales_data
        )
ORDER BY CITY DESC
LIMIT 3;
