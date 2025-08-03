USE [Sales_OLAP]
GO

/****** Object:  Table [dbo].[Fact_sales]    Script Date: 8/3/2025 4:04:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fact_sales](
	[Fact_SK] [int] IDENTITY(1,1) NOT NULL,
	[customerID_FK] [int] NULL,
	[productID_FK] [int] NULL,
	[salesmanID_FK] [int] NULL,
	[orderdate_FK] [int] NULL,
	[ordertime_FK] [int] NULL,
	[orderID_BK] [int] NULL,
	[orderDetailsID_BK] [int] NULL,
	[totalPrice] [int] NULL,
	[quantity] [int] NULL,
	[LoadedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Fact_SK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Fact_sales]  WITH CHECK ADD  CONSTRAINT [FK__Fact_sale__custo__4316F928] FOREIGN KEY([customerID_FK])
REFERENCES [dbo].[DimCustomer] ([CustomerSK])
GO

ALTER TABLE [dbo].[Fact_sales] CHECK CONSTRAINT [FK__Fact_sale__custo__4316F928]
GO

ALTER TABLE [dbo].[Fact_sales]  WITH CHECK ADD FOREIGN KEY([orderdate_FK])
REFERENCES [dbo].[DimDate] ([DateSK])
GO

ALTER TABLE [dbo].[Fact_sales]  WITH CHECK ADD FOREIGN KEY([ordertime_FK])
REFERENCES [dbo].[DimTime] ([TimeSK])
GO

ALTER TABLE [dbo].[Fact_sales]  WITH CHECK ADD  CONSTRAINT [FK__Fact_sale__produ__440B1D61] FOREIGN KEY([productID_FK])
REFERENCES [dbo].[DimProduct] ([ProductSK])
GO

ALTER TABLE [dbo].[Fact_sales] CHECK CONSTRAINT [FK__Fact_sale__produ__440B1D61]
GO

ALTER TABLE [dbo].[Fact_sales]  WITH CHECK ADD  CONSTRAINT [FK__Fact_sale__sales__44FF419A] FOREIGN KEY([salesmanID_FK])
REFERENCES [dbo].[DimSaleMan] ([SalesManSK])
GO

ALTER TABLE [dbo].[Fact_sales] CHECK CONSTRAINT [FK__Fact_sale__sales__44FF419A]
GO

