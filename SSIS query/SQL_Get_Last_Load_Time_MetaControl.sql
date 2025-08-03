SELECT 
      [Last_Load_date]
FROM  [Sales_OLAP].[dbo].[Meta_Control_Fact_Sales_Load]
where [SalesOrderDetails] = 'Orders_Details'