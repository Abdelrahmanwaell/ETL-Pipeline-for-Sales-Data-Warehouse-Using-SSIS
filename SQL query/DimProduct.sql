USE [Sales_OLAP]
GO

/****** Object:  Table [dbo].[DimProduct]    Script Date: 8/3/2025 4:02:52 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimProduct](
	[ProductSK] [int] IDENTITY(1,1) NOT NULL,
	[productBK] [int] NOT NULL,
	[productName] [nvarchar](100) NULL,
	[productPrice] [decimal](10, 2) NULL,
	[subcategoryID_BK] [int] NULL,
	[subcategoryName] [nvarchar](100) NULL,
	[categoryID_BK] [int] NULL,
	[categoryName] [nvarchar](100) NULL,
	[SSCode] [tinyint] NULL,
	[stat_date] [datetime] NULL,
	[End_date] [datetime] NULL,
	[isCurrent] [tinyint] NULL,
 CONSTRAINT [PK__DimProdu__B40D13B03FC24DB9] PRIMARY KEY CLUSTERED 
(
	[ProductSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

