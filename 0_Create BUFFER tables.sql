USE [VBM]
GO
/****** Object:  Table [dbo].[BUFFER_TAXES_FACT]    Script Date: 11/27/2014 10:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BUFFER_TAXES_FACT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BUFFER_TAXES_FACT](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[SUM1] [decimal](18, 5) NULL,
	[SUM2] [decimal](18, 5) NULL,
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BUFFER_COSTS_PCT]    Script Date: 11/27/2014 10:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BUFFER_BUFFER_COSTS_PCT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BUFFER_COSTS_PCT](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[SUM] [decimal](18, 5) NOT NULL,
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BUFFER_COSTS_OTHER]    Script Date: 11/27/2014 10:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BUFFER_BUFFER_COSTS_OTHER]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BUFFER_COSTS_OTHER](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[CATEGORY] [nvarchar](32) NOT NULL,
	[SUM] [decimal](18, 5) NOT NULL,
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BUFFER_COSTS_OPER]    Script Date: 11/27/2014 10:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BUFFER_COSTS_OPER]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BUFFER_COSTS_OPER](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[CATEGORY] [nvarchar](32) NOT NULL,
	[SUM] [decimal](18, 5) NOT NULL,
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[BUFFER_COLLECTIONS_FACT]    Script Date: 11/27/2014 10:41:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BUFFER_COLLECTIONS_FACT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BUFFER_COLLECTIONS_FACT](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[CATEGORY] [nvarchar](32) NOT NULL,
	[SUM] [decimal](18, 5) NOT NULL,
) ON [PRIMARY]
END
GO
