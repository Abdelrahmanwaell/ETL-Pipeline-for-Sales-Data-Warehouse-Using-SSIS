USE [Sales_OLAP]
GO

/****** Object:  Table [dbo].[DimCustomer]    Script Date: 8/3/2025 4:01:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimCustomer](
	[CustomerSK] [int] IDENTITY(1,1) NOT NULL,
	[customerBK] [int] NULL,
	[FName] [nvarchar](50) NULL,
	[LName] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](100) NULL,
	[gender_BK] [int] NULL,
	[genderName] [nvarchar](20) NULL,
	[SSCode] [tinyint] NULL,
	[stat_date] [datetime] NULL,
	[End_date] [datetime] NULL,
	[isCurrent] [tinyint] NULL,
 CONSTRAINT [PK__DimCusto__A4AF97EBE37683D5] PRIMARY KEY CLUSTERED 
(
	[CustomerSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


