
-- 1. Products with Highest Profit per Unit Sold
SELECT 
  Product,
  SUM(Profit) / COUNT(*) AS ProfitPerProduct
FROM 
  Skin_Care_Target
GROUP BY 
  Product
ORDER BY 
  ProfitPerProduct DESC
LIMIT 10;

-- 2. Total Sales and Profit by Customer Segment
SELECT 
  Segment,
  SUM(Sales) AS TotalSales,
  SUM(Profit) AS TotalProfit
FROM 
  Skin_Care_Target
GROUP BY 
  Segment;

-- 3. Average Sales per Order by Segment
SELECT 
  Segment,
  AVG(Sales) AS AvgSalesPerOrder
FROM 
  Skin_Care_Target
GROUP BY 
  Segment;

-- 4. Profit Margin by Region
SELECT 
  Region,
  SUM(Profit) / NULLIF(SUM(Sales), 0) AS ProfitMargin
FROM 
  Skin_Care_Target
GROUP BY 
  Region
ORDER BY 
  ProfitMargin DESC;

-- 5. Profit Margin by Discount Level
SELECT 
  CASE 
    WHEN Discount <= 0.1 THEN '0-10%'
    WHEN Discount <= 0.2 THEN '11-20%'
    WHEN Discount <= 0.3 THEN '21-30%'
    WHEN Discount <= 0.4 THEN '31-40%'
    ELSE '41%+'
  END AS DiscountRange,
  AVG(Profit / NULLIF(Sales, 0)) AS AvgProfitMargin
FROM 
  Skin_Care_Target
GROUP BY 
  DiscountRange
ORDER BY 
  DiscountRange;

-- 6. Top Categories by Total Profit
SELECT 
  Category,
  SUM(Profit) AS TotalProfit
FROM 
  Skin_Care_Target
GROUP BY 
  Category
ORDER BY 
  TotalProfit DESC;

-- 7. Order Count by Segment
SELECT 
  Segment,
  COUNT(*) AS TotalOrders
FROM 
  Skin_Care_Target
GROUP BY 
  Segment;
