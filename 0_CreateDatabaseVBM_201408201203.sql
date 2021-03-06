USE [VBM]
GO
/****** Object:  Table [dbo].[SYS_LKP_CATEGORY]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYS_LKP_CATEGORY](
	[CATEGORY] [nvarchar](32) NOT NULL,
	[DESCRIPTION] [nvarchar](64) NOT NULL,
 CONSTRAINT [SYS_LKP_CATEGORY_PK] PRIMARY KEY CLUSTERED 
(
	[CATEGORY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PORTFOLIOS]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PORTFOLIOS](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[NAME] [nvarchar](64) NOT NULL,
	[PURCHASE_PRICE] [decimal](18, 5) NULL,
	[PURCHASE_PRICE2] [decimal](18, 5) NULL,
	[PURCHASE_DATE] [date] NULL,
	[ENDLIFE_DATE] [date] NULL,
	[TOTAL_VALUE] [decimal](18, 5) NULL,
	[TOP_MONTH] [date] NULL,
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [PORTFOLIOS_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EBITDA_PLAN]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EBITDA_PLAN](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[SUM] [decimal](18, 5) NULL,
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [EBITDA_PLAN_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COSTS_PCT]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COSTS_PCT](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[SUM] [decimal](18, 5) NOT NULL,
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [COSTS_PCT_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COSTS_OTHER]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COSTS_OTHER](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[CATEGORY] [nvarchar](32) NOT NULL,
	[SUM] [decimal](18, 5) NOT NULL,
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [COSTS_OTHER_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC,
	[CATEGORY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COSTS_OPER_PLAN_MARGIN]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COSTS_OPER_PLAN_MARGIN](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
		[VALUE] [decimal](18, 5) NOT NULL,	--(!)
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [COSTS_OPER_PLAN_MARGIN_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COSTS_OPER_PLAN]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COSTS_OPER_PLAN](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[CATEGORY] [nvarchar](32) NOT NULL,
	[SUM] [decimal](18, 5) NOT NULL,
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [COSTS_OPER_PLAN_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC,
	[CATEGORY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COSTS_OPER]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COSTS_OPER](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[CATEGORY] [nvarchar](32) NOT NULL,
	[SUM] [decimal](18, 5) NOT NULL,
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [COSTS_OPER_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC,
	[CATEGORY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COLLECTIONS_PRED]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COLLECTIONS_PRED](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[CATEGORY] [nvarchar](32) NOT NULL,
	[VERSION] [nvarchar](10) NOT NULL,
	[SUM] [decimal](18, 5) NOT NULL,
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [COLLECTIONS_PRED_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC,
	[CATEGORY] ASC,
	[VERSION] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COLLECTIONS_PLAN]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COLLECTIONS_PLAN](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[CATEGORY] [nvarchar](32) NOT NULL,
	[SUM] [decimal](18, 5) NOT NULL,
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [COLLECTIONS_PLAN_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC,
	[CATEGORY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COLLECTIONS_FACT]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COLLECTIONS_FACT](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[CATEGORY] [nvarchar](32) NOT NULL,
	[SUM] [decimal](18, 5) NOT NULL,
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [COLLECTIONS_FACT_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC,
	[CATEGORY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ASSIGNMENT]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASSIGNMENT](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[SUM1] [decimal](18, 5) NULL,
	[SUM2] [decimal](18, 5) NULL,
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [ASSIGNMENT_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPV_PLAN]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPV_PLAN](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[SUM] [decimal](18, 5) NULL,
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [NPV_PLAN_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NPV_FACT]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NPV_FACT](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[SUM] [decimal](18, 5) NULL,
	[DATE_LOAD] [date] NOT NULL,
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [NPV_FACT_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC,
	[DATE_LOAD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_PORTFOLIOS]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-Updates the UPDATED_BY & DATE_UPDATED fields when updates occur--*/ 
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_PORTFOLIOS] ON [dbo].[PORTFOLIOS]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  PORTFOLIOS 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    PORTFOLIOS AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] --AND I.[PERIOD] = A.[PERIOD] --AND I.[CATEGORY] = A.[CATEGORY]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_PORTFOLIOS '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  Table [dbo].[TAXES_PRED]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAXES_PRED](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[SUM1] [decimal](18, 5) NULL,
	[SUM2] [decimal](18, 5) NULL,
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [TAXES_PRED_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAXES_FACT]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAXES_FACT](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[SUM1] [decimal](18, 5) NULL,
	[SUM2] [decimal](18, 5) NULL,
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [TAXES_FACT_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYS_LKP_CODE]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SYS_LKP_CODE](
	[CATEGORY] [nvarchar](32) NOT NULL,
	[CODE] [nvarchar](32) NOT NULL,
	[DESCRIPTION] [nvarchar](128) NULL,
	[RANKING] [int] NULL,
	[EXT_DESCRIPTION] [nvarchar](256) NULL,
	[CODE_GROUP] [nvarchar](32) NULL,
	[HISTORIC] [char](1) NULL,
 CONSTRAINT [SYS_LKP_CODE_PK] PRIMARY KEY CLUSTERED 
(
	[CATEGORY] ASC,
	[CODE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROFIT_OPER_PLAN]    Script Date: 08/20/2014 12:01:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROFIT_OPER_PLAN](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[SUM] [decimal](18, 5) NOT NULL,
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [PROFIT_OPER_PLAN_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GetCOLLECTIONS_FACT]    Script Date: 08/20/2014 12:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Фактические сборы [COLLECTIONS_FACT] */
CREATE VIEW [dbo].[GetCOLLECTIONS_FACT]
AS
SELECT     ID_PORTFOLIO, PERIOD, CATEGORY, SUM
FROM         dbo.COLLECTIONS_FACT
WHERE     (CATEGORY = N'total')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "COLLECTIONS_FACT"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 209
               Right = 240
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetCOLLECTIONS_FACT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetCOLLECTIONS_FACT'
GO
/****** Object:  View [dbo].[GetActualCOLLECTIONS_PRED]    Script Date: 08/20/2014 12:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Comments 
 Прогонозные сборы [COLLECTIONS_PRED] с последней актуальной подгрузкой [VERSION] */
CREATE VIEW [dbo].[GetActualCOLLECTIONS_PRED]
AS
SELECT     ID_PORTFOLIO, PERIOD, CATEGORY, VERSION, SUM
FROM         dbo.COLLECTIONS_PRED
WHERE     (VERSION =
                          (SELECT DISTINCT TOP (1) VERSION
                            FROM          dbo.COLLECTIONS_PRED AS COLLECTIONS_PRED_1
                            ORDER BY VERSION DESC)) AND (CATEGORY = N'total')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[24] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "COLLECTIONS_PRED"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 182
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 6165
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetActualCOLLECTIONS_PRED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetActualCOLLECTIONS_PRED'
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_NPV_PLAN]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-Updates the UPDATED_BY & DATE_UPDATED fields when updates occur--*/ 
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_NPV_PLAN] ON [dbo].[NPV_PLAN]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  NPV_PLAN 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    NPV_PLAN AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] AND I.[PERIOD] = A.[PERIOD] --AND I.[DATE_LOAD] = A.[DATE_LOAD] --AND I.[VERSION] = A.[VERSION]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_NPV_PLAN '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_NPV_FACT]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-Updates the UPDATED_BY & DATE_UPDATED fields when updates occur--*/ 
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_NPV_FACT] ON [dbo].[NPV_FACT]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  NPV_FACT 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    NPV_FACT AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] AND I.[PERIOD] = A.[PERIOD] AND I.[DATE_LOAD] = A.[DATE_LOAD] --AND I.[VERSION] = A.[VERSION]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_NPV_FACT '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_EBITDA_PLAN]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_EBITDA_PLAN] ON [dbo].[EBITDA_PLAN]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  EBITDA_PLAN 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    EBITDA_PLAN AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] AND I.[PERIOD] = A.[PERIOD] --AND I.[CATEGORY] = A.[CATEGORY] AND I.[VERSION] = A.[VERSION]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_EBITDA_PLAN '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_COSTS_PCT]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-Updates the UPDATED_BY & DATE_UPDATED fields when updates occur--*/ 
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_COSTS_PCT] ON [dbo].[COSTS_PCT]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  COSTS_PCT 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    COSTS_PCT AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] AND I.[PERIOD] = A.[PERIOD] --AND I.[DATE_LOAD] = A.[DATE_LOAD]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_COSTS_PCT '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_COSTS_OTHER]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-Updates the UPDATED_BY & DATE_UPDATED fields when updates occur--*/ 
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_COSTS_OTHER] ON [dbo].[COSTS_OTHER]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  COSTS_OTHER 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    COSTS_OTHER AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] AND I.[PERIOD] = A.[PERIOD] AND I.[CATEGORY] = A.[CATEGORY]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_COSTS_OTHER '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_COSTS_OPER_PLAN_MARGIN]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-Updates the UPDATED_BY & DATE_UPDATED fields when updates occur--*/ 
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_COSTS_OPER_PLAN_MARGIN] ON [dbo].[COSTS_OPER_PLAN_MARGIN]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  COSTS_OPER_PLAN_MARGIN 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    COSTS_OPER_PLAN_MARGIN AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] AND I.[PERIOD] = A.[PERIOD] --AND I.[DATE_LOAD] = A.[DATE_LOAD]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_COSTS_OPER_PLAN_MARGIN '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_COSTS_OPER_PLAN]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-Updates the UPDATED_BY & DATE_UPDATED fields when updates occur--*/ 
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_COSTS_OPER_PLAN] ON [dbo].[COSTS_OPER_PLAN]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  COSTS_OPER_PLAN 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    COSTS_OPER_PLAN AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] AND I.[PERIOD] = A.[PERIOD] AND I.[CATEGORY] = A.[CATEGORY]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_COSTS_OPER_PLAN '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_COSTS_OPER]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-Updates the UPDATED_BY & DATE_UPDATED fields when updates occur--*/ 
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_COSTS_OPER] ON [dbo].[COSTS_OPER]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  COSTS_OPER 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    COSTS_OPER AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] AND I.[PERIOD] = A.[PERIOD] AND I.[CATEGORY] = A.[CATEGORY]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_COSTS_OPER '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_COLLECTIONS_PRED]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-Updates the UPDATED_BY & DATE_UPDATED fields when updates occur--*/ 
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_COLLECTIONS_PRED] ON [dbo].[COLLECTIONS_PRED]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  COLLECTIONS_PRED 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    COLLECTIONS_PRED AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] AND I.[PERIOD] = A.[PERIOD] AND I.[CATEGORY] = A.[CATEGORY] AND I.[VERSION] = A.[VERSION]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_COLLECTIONS_PRED '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_COLLECTIONS_PLAN]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-Updates the UPDATED_BY & DATE_UPDATED fields when updates occur--*/ 
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_COLLECTIONS_PLAN] ON [dbo].[COLLECTIONS_PLAN]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  COLLECTIONS_PLAN 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    COLLECTIONS_PLAN AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] AND I.[PERIOD] = A.[PERIOD] AND I.[CATEGORY] = A.[CATEGORY]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_COLLECTIONS_PLAN '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_COLLECTIONS_FACT]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-Updates the UPDATED_BY & DATE_UPDATED fields when updates occur--*/ 
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_COLLECTIONS_FACT] ON [dbo].[COLLECTIONS_FACT]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  COLLECTIONS_FACT 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    COLLECTIONS_FACT AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] AND I.[PERIOD] = A.[PERIOD] AND I.[CATEGORY] = A.[CATEGORY]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_COLLECTIONS_FACT '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_ASSIGNMENT]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-Updates the UPDATED_BY & DATE_UPDATED fields when updates occur--*/ 
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_ASSIGNMENT] ON [dbo].[ASSIGNMENT]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  ASSIGNMENT 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    ASSIGNMENT AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] AND I.[PERIOD] = A.[PERIOD]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_ASSIGNMENT '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_TAXES_PRED]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-Updates the UPDATED_BY & DATE_UPDATED fields when updates occur--*/ 
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_TAXES_PRED] ON [dbo].[TAXES_PRED]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  TAXES_PRED 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    TAXES_PRED AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] AND I.[PERIOD] = A.[PERIOD] --AND I.[CATEGORY] = A.[CATEGORY] AND I.[VERSION] = A.[VERSION]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_TAXES_PRED '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_TAXES_FACT]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-Updates the UPDATED_BY & DATE_UPDATED fields when updates occur--*/ 
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_TAXES_FACT] ON [dbo].[TAXES_FACT]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  TAXES_FACT 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    TAXES_FACT AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] AND I.[PERIOD] = A.[PERIOD] --AND I.[CATEGORY] = A.[CATEGORY] AND I.[VERSION] = A.[VERSION]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_TAXES_FACT '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  Trigger [TR_AFT_U_AUDIT_PROFIT_OPER_PLAN]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-Updates the UPDATED_BY & DATE_UPDATED fields when updates occur--*/ 
CREATE TRIGGER [dbo].[TR_AFT_U_AUDIT_PROFIT_OPER_PLAN] ON [dbo].[PROFIT_OPER_PLAN]
  FOR UPDATE
  NOT FOR REPLICATION
AS
  BEGIN
    DECLARE @errMsg NVARCHAR(2000) 
    SET XACT_ABORT ON ;
    BEGIN TRY 
      BEGIN TRANSACTION
      SET NOCOUNT ON
      SET ANSI_NULLS ON

      UPDATE  PROFIT_OPER_PLAN 
      SET     UPDATED_BY = SYSTEM_USER ,
              DATE_UPDATED = GETDATE()
      FROM    PROFIT_OPER_PLAN AS A 
              INNER JOIN INSERTED I
                ON I.[ID_PORTFOLIO] = A.[ID_PORTFOLIO] AND I.[PERIOD] = A.[PERIOD] --AND I.[CATEGORY] = A.[CATEGORY] AND I.[VERSION] = A.[VERSION]
      SET NOCOUNT OFF
      COMMIT 
    END TRY
  
    BEGIN CATCH
      IF @@TRANCOUNT > 0 
        ROLLBACK 
      SELECT  @errMsg = 'TR_AFT_U_AUDIT_PROFIT_OPER_PLAN '+ERROR_MESSAGE() 
      RAISERROR (@errMsg, 16,1) 
    END CATCH              
  END
GO
/****** Object:  View [dbo].[GetCOSTS_OPER_PLAN_MARGIN]    Script Date: 08/20/2014 12:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetCOSTS_OPER_PLAN_MARGIN]
AS
/* сочетает исторические данные [COSTS_OPER_PLAN_MARGIN] и формулу для новых портфелей [COSTS_OPER_PLAN]/[COLLECTIONS_PLAN] */
SELECT     COPM.ID_PORTFOLIO, COPM.PERIOD, COPM.[VALUE], N'OLD' AS [TYPE1]
FROM         COSTS_OPER_PLAN_MARGIN COPM
UNION ALL
SELECT     COP.ID_PORTFOLIO, COP.PERIOD, ISNULL(COP.[SUM], 0) / CP.[SUM], N'NEW'
FROM         COSTS_OPER_PLAN COP INNER JOIN
                      COLLECTIONS_PLAN CP ON COP.ID_PORTFOLIO = CP.ID_PORTFOLIO AND COP.PERIOD = CP.PERIOD
WHERE     COP.CATEGORY = N'total' AND CP.CATEGORY = N'total'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[56] 4[5] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetCOSTS_OPER_PLAN_MARGIN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetCOSTS_OPER_PLAN_MARGIN'
GO
/****** Object:  View [dbo].[GetCOLLECTIONS_PLAN]    Script Date: 08/20/2014 12:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Плановые сборы [COLLECTIONS_PLAN] */
CREATE VIEW [dbo].[GetCOLLECTIONS_PLAN]
AS
SELECT     ID_PORTFOLIO, PERIOD, CATEGORY, SUM
FROM         dbo.COLLECTIONS_PLAN
WHERE     (CATEGORY = N'total')
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "COLLECTIONS_PLAN"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 206
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetCOLLECTIONS_PLAN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetCOLLECTIONS_PLAN'
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_GetLatestPeriod_TAXES_FACT]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufn_GetLatestPeriod_TAXES_FACT]
  (@Portfolio NVARCHAR(100))
RETURNS DATE
AS 
    BEGIN
		IF @Portfolio = N'' 
		set @Portfolio = N'%'
		
		DECLARE @LatestPeriod DATE
		
		SELECT  
			@LatestPeriod = MAX(PERIOD)
		FROM
			dbo.TAXES_FACT
		WHERE
			ID_PORTFOLIO like @Portfolio
		
		RETURN @LatestPeriod --ISNULL(@NextInstance,1)

    END
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_GetLatestPeriod_COSTS_OPER]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufn_GetLatestPeriod_COSTS_OPER]
  (@Portfolio NVARCHAR(100))
RETURNS DATE
AS 
    BEGIN
		IF @Portfolio = N'' 
		set @Portfolio = N'%'
		
		DECLARE @LatestPeriod DATE
		
		SELECT  
			@LatestPeriod = MAX(PERIOD)
		FROM
			dbo.COSTS_OPER
		WHERE
			ID_PORTFOLIO like @Portfolio
		
		RETURN @LatestPeriod --ISNULL(@NextInstance,1)

    END
GO
/****** Object:  View [dbo].[GetTAXES_FACTandPRED]    Script Date: 08/20/2014 12:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetTAXES_FACTandPRED]
AS
/* Налог на прибыль факт и прогноз */
select
	ID_PORTFOLIO
	,PERIOD
	,[SUM2]
	,'FACT' as [SOURCE]
from	
	dbo.TAXES_FACT 
union all
select
	ID_PORTFOLIO
	,PERIOD
	,[SUM2]
	,'PRED'
from
	dbo.TAXES_PRED
where PERIOD > (dbo.ufn_GetLatestPeriod_TAXES_FACT(N'%'))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TAXES_FACT"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TAXES_PRED"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 125
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetTAXES_FACTandPRED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetTAXES_FACTandPRED'
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_GetLatestPeriod_COLLECTIONS_FACT]    Script Date: 08/20/2014 12:01:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufn_GetLatestPeriod_COLLECTIONS_FACT]
  (@Portfolio NVARCHAR(100))
RETURNS DATE
AS 
    BEGIN
		IF @Portfolio = N'' 
		set @Portfolio = N'%'
		
		DECLARE @LatestPeriod DATE
		
		SELECT  
			@LatestPeriod = MAX(PERIOD)
		FROM
			dbo.GetCOLLECTIONS_FACT
		WHERE
			ID_PORTFOLIO like @Portfolio
		
		RETURN @LatestPeriod --ISNULL(@NextInstance,1)

    END
GO
/****** Object:  View [dbo].[GetCOLLECTIONS_FACTandPRED]    Script Date: 08/20/2014 12:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetCOLLECTIONS_FACTandPRED]
AS
/* Лист "Справочник" - динамика сборов по портфелям факт плюс прогноз */
select
	ID_PORTFOLIO
	,PERIOD
	,CATEGORY
	,[SUM]
	,'FACT' as [SOURCE]
from	
	dbo.GetCOLLECTIONS_FACT 
union all
select
	ID_PORTFOLIO
	,PERIOD
	,CATEGORY
	,[SUM]
	,'PRED'
from
	dbo.GetActualCOLLECTIONS_PRED
where PERIOD > (dbo.ufn_GetLatestPeriod_COLLECTIONS_FACT(N'%'))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "GetActualCOLLECTIONS_PRED"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GetCOLLECTIONS_FACT"
            Begin Extent = 
               Top = 6
               Left = 240
               Bottom = 125
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetCOLLECTIONS_FACTandPRED'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetCOLLECTIONS_FACTandPRED'
GO
/****** Object:  Default [DF_ASSIGNMENT_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[ASSIGNMENT] ADD  CONSTRAINT [DF_ASSIGNMENT_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_ASSIGNMENT_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[ASSIGNMENT] ADD  CONSTRAINT [DF_ASSIGNMENT_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_ASSIGNMENT_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[ASSIGNMENT] ADD  CONSTRAINT [DF_ASSIGNMENT_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  Default [DF_COLLECTIONS_FACT_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COLLECTIONS_FACT] ADD  CONSTRAINT [DF_COLLECTIONS_FACT_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_COLLECTIONS_FACT_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COLLECTIONS_FACT] ADD  CONSTRAINT [DF_COLLECTIONS_FACT_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_COLLECTIONS_FACT_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COLLECTIONS_FACT] ADD  CONSTRAINT [DF_COLLECTIONS_FACT_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  Default [DF_COLLECTIONS_PLAN_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COLLECTIONS_PLAN] ADD  CONSTRAINT [DF_COLLECTIONS_PLAN_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_COLLECTIONS_PLAN_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COLLECTIONS_PLAN] ADD  CONSTRAINT [DF_COLLECTIONS_PLAN_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_COLLECTIONS_PLAN_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COLLECTIONS_PLAN] ADD  CONSTRAINT [DF_COLLECTIONS_PLAN_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  Default [DF_COLLECTIONS_PRED_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COLLECTIONS_PRED] ADD  CONSTRAINT [DF_COLLECTIONS_PRED_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_COLLECTIONS_PRED_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COLLECTIONS_PRED] ADD  CONSTRAINT [DF_COLLECTIONS_PRED_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_COLLECTIONS_PRED_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COLLECTIONS_PRED] ADD  CONSTRAINT [DF_COLLECTIONS_PRED_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  Default [DF_COSTS_OPER_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OPER] ADD  CONSTRAINT [DF_COSTS_OPER_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_COSTS_OPER_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OPER] ADD  CONSTRAINT [DF_COSTS_OPER_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_COSTS_OPER_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OPER] ADD  CONSTRAINT [DF_COSTS_OPER_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  Default [DF_COSTS_OPER_PLAN_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OPER_PLAN] ADD  CONSTRAINT [DF_COSTS_OPER_PLAN_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_COSTS_OPER_PLAN_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OPER_PLAN] ADD  CONSTRAINT [DF_COSTS_OPER_PLAN_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_COSTS_OPER_PLAN_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OPER_PLAN] ADD  CONSTRAINT [DF_COSTS_OPER_PLAN_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  Default [DF_COSTS_OPER_PLAN_MARGIN_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OPER_PLAN_MARGIN] ADD  CONSTRAINT [DF_COSTS_OPER_PLAN_MARGIN_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_COSTS_OPER_PLAN_MARGIN_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OPER_PLAN_MARGIN] ADD  CONSTRAINT [DF_COSTS_OPER_PLAN_MARGIN_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_COSTS_OPER_PLAN_MARGIN_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OPER_PLAN_MARGIN] ADD  CONSTRAINT [DF_COSTS_OPER_PLAN_MARGIN_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  Default [DF_COSTS_OTHER_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OTHER] ADD  CONSTRAINT [DF_COSTS_OTHER_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_COSTS_OTHER_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OTHER] ADD  CONSTRAINT [DF_COSTS_OTHER_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_COSTS_OTHER_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OTHER] ADD  CONSTRAINT [DF_COSTS_OTHER_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  Default [DF_COSTS_PCT_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_PCT] ADD  CONSTRAINT [DF_COSTS_PCT_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_COSTS_PCT_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_PCT] ADD  CONSTRAINT [DF_COSTS_PCT_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_COSTS_PCT_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_PCT] ADD  CONSTRAINT [DF_COSTS_PCT_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  Default [DF_EBITDA_PLAN_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[EBITDA_PLAN] ADD  CONSTRAINT [DF_EBITDA_PLAN_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_EBITDA_PLAN_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[EBITDA_PLAN] ADD  CONSTRAINT [DF_EBITDA_PLAN_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_EBITDA_PLAN_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[EBITDA_PLAN] ADD  CONSTRAINT [DF_EBITDA_PLAN_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  Default [DF_NPV_FACT_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[NPV_FACT] ADD  CONSTRAINT [DF_NPV_FACT_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_NPV_FACT_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[NPV_FACT] ADD  CONSTRAINT [DF_NPV_FACT_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_NPV_FACT_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[NPV_FACT] ADD  CONSTRAINT [DF_NPV_FACT_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  Default [DF_NPV_PLAN_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[NPV_PLAN] ADD  CONSTRAINT [DF_NPV_PLAN_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_NPV_PLAN_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[NPV_PLAN] ADD  CONSTRAINT [DF_NPV_PLAN_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_NPV_PLAN_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[NPV_PLAN] ADD  CONSTRAINT [DF_NPV_PLAN_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  Default [DF_PORTFOLIOS_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[PORTFOLIOS] ADD  CONSTRAINT [DF_PORTFOLIOS_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_PORTFOLIOS_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[PORTFOLIOS] ADD  CONSTRAINT [DF_PORTFOLIOS_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_PORTFOLIOS_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[PORTFOLIOS] ADD  CONSTRAINT [DF_PORTFOLIOS_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  Default [DF_PROFIT_OPER_PLAN_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[PROFIT_OPER_PLAN] ADD  CONSTRAINT [DF_PROFIT_OPER_PLAN_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_PROFIT_OPER_PLAN_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[PROFIT_OPER_PLAN] ADD  CONSTRAINT [DF_PROFIT_OPER_PLAN_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_PROFIT_OPER_PLAN_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[PROFIT_OPER_PLAN] ADD  CONSTRAINT [DF_PROFIT_OPER_PLAN_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  Default [DF_TAXES_FACT_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[TAXES_FACT] ADD  CONSTRAINT [DF_TAXES_FACT_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_TAXES_FACT_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[TAXES_FACT] ADD  CONSTRAINT [DF_TAXES_FACT_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_TAXES_FACT_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[TAXES_FACT] ADD  CONSTRAINT [DF_TAXES_FACT_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  Default [DF_TAXES_PRED_DATE_INSERTED]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[TAXES_PRED] ADD  CONSTRAINT [DF_TAXES_PRED_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
/****** Object:  Default [DF_TAXES_PRED_INSERTED_BY]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[TAXES_PRED] ADD  CONSTRAINT [DF_TAXES_PRED_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
/****** Object:  Default [DF_TAXES_PRED_DATA_SOURCE]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[TAXES_PRED] ADD  CONSTRAINT [DF_TAXES_PRED_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
/****** Object:  ForeignKey [ASSIGNMENT_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[ASSIGNMENT]  WITH NOCHECK ADD  CONSTRAINT [ASSIGNMENT_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[ASSIGNMENT] CHECK CONSTRAINT [ASSIGNMENT_FK1]
GO
/****** Object:  ForeignKey [COLLECTIONS_FACT_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COLLECTIONS_FACT]  WITH NOCHECK ADD  CONSTRAINT [COLLECTIONS_FACT_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[COLLECTIONS_FACT] CHECK CONSTRAINT [COLLECTIONS_FACT_FK1]
GO
/****** Object:  ForeignKey [COLLECTIONS_PLAN_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COLLECTIONS_PLAN]  WITH NOCHECK ADD  CONSTRAINT [COLLECTIONS_PLAN_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[COLLECTIONS_PLAN] CHECK CONSTRAINT [COLLECTIONS_PLAN_FK1]
GO
/****** Object:  ForeignKey [COLLECTIONS_PRED_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COLLECTIONS_PRED]  WITH NOCHECK ADD  CONSTRAINT [COLLECTIONS_PRED_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[COLLECTIONS_PRED] CHECK CONSTRAINT [COLLECTIONS_PRED_FK1]
GO
/****** Object:  ForeignKey [COSTS_OPER_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OPER]  WITH NOCHECK ADD  CONSTRAINT [COSTS_OPER_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[COSTS_OPER] CHECK CONSTRAINT [COSTS_OPER_FK1]
GO
/****** Object:  ForeignKey [COSTS_OPER_PLAN_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OPER_PLAN]  WITH NOCHECK ADD  CONSTRAINT [COSTS_OPER_PLAN_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[COSTS_OPER_PLAN] CHECK CONSTRAINT [COSTS_OPER_PLAN_FK1]
GO
/****** Object:  ForeignKey [COSTS_OPER_PLAN_MARGIN_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OPER_PLAN_MARGIN]  WITH NOCHECK ADD  CONSTRAINT [COSTS_OPER_PLAN_MARGIN_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[COSTS_OPER_PLAN_MARGIN] CHECK CONSTRAINT [COSTS_OPER_PLAN_MARGIN_FK1]
GO
/****** Object:  ForeignKey [COSTS_OTHER_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_OTHER]  WITH NOCHECK ADD  CONSTRAINT [COSTS_OTHER_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[COSTS_OTHER] CHECK CONSTRAINT [COSTS_OTHER_FK1]
GO
/****** Object:  ForeignKey [COSTS_PCT_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[COSTS_PCT]  WITH NOCHECK ADD  CONSTRAINT [COSTS_PCT_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[COSTS_PCT] CHECK CONSTRAINT [COSTS_PCT_FK1]
GO
/****** Object:  ForeignKey [EBITDA_PLAN_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[EBITDA_PLAN]  WITH NOCHECK ADD  CONSTRAINT [EBITDA_PLAN_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[EBITDA_PLAN] CHECK CONSTRAINT [EBITDA_PLAN_FK1]
GO
/****** Object:  ForeignKey [NPV_FACT_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[NPV_FACT]  WITH NOCHECK ADD  CONSTRAINT [NPV_FACT_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[NPV_FACT] CHECK CONSTRAINT [NPV_FACT_FK1]
GO
/****** Object:  ForeignKey [NPV_PLAN_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[NPV_PLAN]  WITH NOCHECK ADD  CONSTRAINT [NPV_PLAN_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[NPV_PLAN] CHECK CONSTRAINT [NPV_PLAN_FK1]
GO
/****** Object:  ForeignKey [PROFIT_OPER_PLAN_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[PROFIT_OPER_PLAN]  WITH NOCHECK ADD  CONSTRAINT [PROFIT_OPER_PLAN_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[PROFIT_OPER_PLAN] CHECK CONSTRAINT [PROFIT_OPER_PLAN_FK1]
GO
/****** Object:  ForeignKey [SYS_LKP_CODE_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[SYS_LKP_CODE]  WITH NOCHECK ADD  CONSTRAINT [SYS_LKP_CODE_FK1] FOREIGN KEY([CATEGORY])
REFERENCES [dbo].[SYS_LKP_CATEGORY] ([CATEGORY])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[SYS_LKP_CODE] CHECK CONSTRAINT [SYS_LKP_CODE_FK1]
GO
/****** Object:  ForeignKey [TAXES_FACT_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[TAXES_FACT]  WITH NOCHECK ADD  CONSTRAINT [TAXES_FACT_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[TAXES_FACT] CHECK CONSTRAINT [TAXES_FACT_FK1]
GO
/****** Object:  ForeignKey [TAXES_PRED_FK1]    Script Date: 08/20/2014 12:01:11 ******/
ALTER TABLE [dbo].[TAXES_PRED]  WITH NOCHECK ADD  CONSTRAINT [TAXES_PRED_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[TAXES_PRED] CHECK CONSTRAINT [TAXES_PRED_FK1]
GO
