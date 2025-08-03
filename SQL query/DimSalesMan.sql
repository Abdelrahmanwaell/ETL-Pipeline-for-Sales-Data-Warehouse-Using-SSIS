USE [Sales_OLAP]
GO

/****** Object:  Table [dbo].[DimSaleMan]    Script Date: 8/3/2025 4:03:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimSaleMan](
	[SalesManSK] [int] IDENTITY(1,1) NOT NULL,
	[salesmanBK] [int] NULL,
	[FName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NULL,
	[phone] [nvarchar](20) NULL,
	[email] [nvarchar](100) NULL,
	[addressID_BK] [int] NULL,
	[streetAddress] [nvarchar](255) NULL,
	[city] [nvarchar](100) NULL,
	[state] [nvarchar](50) NULL,
	[zipcode] [nvarchar](20) NULL,
	[SSCode] [tinyint] NULL,
	[stat_date] [datetime] NULL,
	[End_date] [datetime] NULL,
	[isCurrent] [tinyint] NULL,
 CONSTRAINT [PK__DimSaleM__2A199F1AF8D14187] PRIMARY KEY CLUSTERED 
(
	[SalesManSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


