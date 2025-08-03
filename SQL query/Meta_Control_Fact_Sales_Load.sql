USE [Sales_OLAP]
GO

/****** Object:  Table [dbo].[Meta_Control_Fact_Sales_Load]    Script Date: 8/3/2025 4:19:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Meta_Control_Fact_Sales_Load](
	[id] [int] NOT NULL,
	[SalesOrderDetails] [nvarchar](100) NULL,
	[Last_Load_date] [datetime] NULL,
	[Last_Load_OrderDetailID_BK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


