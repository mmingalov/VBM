USE [VBM]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('PORTFOLIOS','U') IS NOT NULL
	DROP TABLE PORTFOLIOS

CREATE TABLE [dbo].[PORTFOLIOS](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[NAME] [nvarchar](64) NOT NULL,
	[PURCHASE_PRICE] [decimal](14,2) NULL,
	[PURCHASE_PRICE2] [decimal](14,2) NULL,
	[PURCHASE_DATE] [date] NULL,
	[ENDLIFE_DATE] [date] NULL,
	[TOTAL_VALUE] [decimal](14,2) NULL,
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
ALTER TABLE [dbo].[PORTFOLIOS] ADD  CONSTRAINT [DF_PORTFOLIOS_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
ALTER TABLE [dbo].[PORTFOLIOS] ADD  CONSTRAINT [DF_PORTFOLIOS_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
ALTER TABLE [dbo].[PORTFOLIOS] ADD  CONSTRAINT [DF_PORTFOLIOS_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO

--����� �� ��������
IF OBJECT_ID('COLLECTIONS_FACT','U') IS NOT NULL
	DROP TABLE COLLECTIONS_FACT

CREATE TABLE [dbo].[COLLECTIONS_FACT](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[CATEGORY] [nvarchar](32) NOT NULL,
	[SUM] [decimal](14,2) NOT NULL,
 	
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
ALTER TABLE [dbo].[COLLECTIONS_FACT] ADD  CONSTRAINT [DF_COLLECTIONS_FACT_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
ALTER TABLE [dbo].[COLLECTIONS_FACT] ADD  CONSTRAINT [DF_COLLECTIONS_FACT_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
ALTER TABLE [dbo].[COLLECTIONS_FACT] ADD  CONSTRAINT [DF_COLLECTIONS_FACT_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO
--�������� ����� �� ��������
IF OBJECT_ID('COLLECTIONS_PLAN','U') IS NOT NULL
	DROP TABLE COLLECTIONS_PLAN

CREATE TABLE [dbo].[COLLECTIONS_PLAN](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[CATEGORY] [nvarchar](32) NOT NULL,
	[SUM] [decimal](14,2) NOT NULL,
		
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
ALTER TABLE [dbo].[COLLECTIONS_PLAN] ADD  CONSTRAINT [DF_COLLECTIONS_PLAN_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
ALTER TABLE [dbo].[COLLECTIONS_PLAN] ADD  CONSTRAINT [DF_COLLECTIONS_PLAN_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
ALTER TABLE [dbo].[COLLECTIONS_PLAN] ADD  CONSTRAINT [DF_COLLECTIONS_PLAN_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO

--������ �������
IF OBJECT_ID('COSTS_OTHER','U') IS NOT NULL
	DROP TABLE COSTS_OTHER

CREATE TABLE [dbo].[COSTS_OTHER](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[CATEGORY] [nvarchar](32) NOT NULL,
	[SUM] [decimal](14,2) NOT NULL,
		
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
ALTER TABLE [dbo].[COSTS_OTHER] ADD  CONSTRAINT [DF_COSTS_OTHER_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
ALTER TABLE [dbo].[COSTS_OTHER] ADD  CONSTRAINT [DF_COSTS_OTHER_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
ALTER TABLE [dbo].[COSTS_OTHER] ADD  CONSTRAINT [DF_COSTS_OTHER_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO

--������������ �������
IF OBJECT_ID('COSTS_OPER_VAR','U') IS NOT NULL
	DROP TABLE COSTS_OPER_VAR

CREATE TABLE [dbo].[COSTS_OPER_VAR](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[CATEGORY] [nvarchar](32) NOT NULL,
	[SUM] [decimal](14,2) NOT NULL,
		
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [COSTS_OPER_VAR_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC,
	[CATEGORY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[COSTS_OPER_VAR] ADD  CONSTRAINT [DF_COSTS_OPER_VAR_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
ALTER TABLE [dbo].[COSTS_OPER_VAR] ADD  CONSTRAINT [DF_COSTS_OPER_VAR_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
ALTER TABLE [dbo].[COSTS_OPER_VAR] ADD  CONSTRAINT [DF_COSTS_OPER_VAR_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO

--�������� ������������ �������
IF OBJECT_ID('COSTS_OPER_VAR_PLAN','U') IS NOT NULL
	DROP TABLE COSTS_OPER_VAR_PLAN

CREATE TABLE [dbo].[COSTS_OPER_VAR_PLAN](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[CATEGORY] [nvarchar](32) NOT NULL,
	[SUM] [decimal](14,2) NOT NULL,
		
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [COSTS_OPER_VAR_PLAN_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC,
	[CATEGORY] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[COSTS_OPER_VAR_PLAN] ADD  CONSTRAINT [DF_COSTS_OPER_VAR_PLAN_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
ALTER TABLE [dbo].[COSTS_OPER_VAR_PLAN] ADD  CONSTRAINT [DF_COSTS_OPER_VAR_PLAN_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
ALTER TABLE [dbo].[COSTS_OPER_VAR_PLAN] ADD  CONSTRAINT [DF_COSTS_OPER_VAR_PLAN_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO

--������
IF OBJECT_ID('TAXES','U') IS NOT NULL
	DROP TABLE TAXES

CREATE TABLE [dbo].[TAXES](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[SUM1] [decimal](14,2) NULL,
	[SUM2] [decimal](14,2) NULL,
		
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [TAXES_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[TAXES] ADD  CONSTRAINT [DF_TAXES_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
ALTER TABLE [dbo].[TAXES] ADD  CONSTRAINT [DF_TAXES_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
ALTER TABLE [dbo].[TAXES] ADD  CONSTRAINT [DF_TAXES_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO


--�����������
IF OBJECT_ID('ASSIGNMENT','U') IS NOT NULL
	DROP TABLE ASSIGNMENT

CREATE TABLE [dbo].[ASSIGNMENT](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[SUM1] [decimal](14,2) NULL,
	[SUM2] [decimal](14,2) NULL,
		
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
ALTER TABLE [dbo].[ASSIGNMENT] ADD  CONSTRAINT [DF_ASSIGNMENT_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
ALTER TABLE [dbo].[ASSIGNMENT] ADD  CONSTRAINT [DF_ASSIGNMENT_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
ALTER TABLE [dbo].[ASSIGNMENT] ADD  CONSTRAINT [DF_ASSIGNMENT_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO

--NPV
IF OBJECT_ID('NPV','U') IS NOT NULL
	DROP TABLE NPV

CREATE TABLE [dbo].[NPV](
	[ID_PORTFOLIO] [nvarchar](32) NOT NULL,
	[PERIOD] [date] NOT NULL,
	[NPV_SUM] [decimal](14,2) NULL,
	[DATE_LOAD] [date] NOT NULL,
		
	[DATE_INSERTED] [smalldatetime] NULL,
	[INSERTED_BY] [nvarchar](100) NULL,
	[DATE_UPDATED] [smalldatetime] NULL,
	[UPDATED_BY] [nvarchar](100) NULL,
	[DATA_SOURCE] [nvarchar](200) NULL,
 CONSTRAINT [NPV_PK] PRIMARY KEY CLUSTERED 
(
	[ID_PORTFOLIO] ASC,
	[PERIOD] ASC,
	[DATE_LOAD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[NPV] ADD  CONSTRAINT [DF_NPV_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
GO
ALTER TABLE [dbo].[NPV] ADD  CONSTRAINT [DF_NPV_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
GO
ALTER TABLE [dbo].[NPV] ADD  CONSTRAINT [DF_NPV_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
GO

--------------------------------
ALTER TABLE [dbo].[TAXES]  WITH NOCHECK ADD  CONSTRAINT [TAXES_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[TAXES] CHECK CONSTRAINT [TAXES_FK1]
GO

ALTER TABLE [dbo].[NPV]  WITH NOCHECK ADD  CONSTRAINT [NPV_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[NPV] CHECK CONSTRAINT [NPV_FK1]
GO

ALTER TABLE [dbo].[COSTS_OTHER]  WITH NOCHECK ADD  CONSTRAINT [COSTS_OTHER_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[COSTS_OTHER] CHECK CONSTRAINT [COSTS_OTHER_FK1]
GO

ALTER TABLE [dbo].[COSTS_OPER_VAR_PLAN]  WITH NOCHECK ADD  CONSTRAINT [COSTS_OPER_VAR_PLAN_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[COSTS_OPER_VAR_PLAN] CHECK CONSTRAINT [COSTS_OPER_VAR_PLAN_FK1]
GO

ALTER TABLE [dbo].[COLLECTIONS_FACT]  WITH NOCHECK ADD  CONSTRAINT [COLLECTIONS_FACT_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[COLLECTIONS_FACT] CHECK CONSTRAINT [COLLECTIONS_FACT_FK1]
GO

ALTER TABLE [dbo].[COLLECTIONS_PLAN]  WITH NOCHECK ADD  CONSTRAINT [COLLECTIONS_PLAN_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[COLLECTIONS_PLAN] CHECK CONSTRAINT [COLLECTIONS_PLAN_FK1]
GO

ALTER TABLE [dbo].[COSTS_OPER_VAR]  WITH NOCHECK ADD  CONSTRAINT [COSTS_OPER_VAR_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[COSTS_OPER_VAR] CHECK CONSTRAINT [COSTS_OPER_VAR_FK1]
GO

ALTER TABLE [dbo].[ASSIGNMENT]  WITH NOCHECK ADD  CONSTRAINT [ASSIGNMENT_FK1] FOREIGN KEY([ID_PORTFOLIO])
REFERENCES [dbo].[PORTFOLIOS] ([ID_PORTFOLIO])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO

ALTER TABLE [dbo].[ASSIGNMENT] CHECK CONSTRAINT [ASSIGNMENT_FK1]
GO