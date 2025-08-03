UPDATE dbo.Meta_Control_Fact_Sales_Load
SET Last_Load_date = ?
WHERE SalesOrderDetails = 'Orders_Details'