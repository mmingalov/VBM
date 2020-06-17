USE [VBM]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Maxim Mingalov>
-- Create date: <01.09.2014>
-- Description:	<Обновление таблицы, содержащей информацию о Неокуп ст-ти с %>
-- =============================================
IF OBJECT_ID('sp_Updating_tmp_UNPAY_COST_WITH','P') IS NOT NULL
	DROP PROCEDURE sp_Updating_tmp_UNPAY_COST_WITH;
GO

CREATE PROCEDURE [dbo].[sp_Updating_tmp_UNPAY_COST_WITH]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/* здесь будут лежать данные для VIEW */
	IF OBJECT_ID('dbo.tmp_UNPAY_COST_WITH','U') IS NOT NULL
		DROP TABLE tmp_UNPAY_COST_WITH;
	CREATE TABLE tmp_UNPAY_COST_WITH (
		[ID_PORTFOLIO] nvarchar(32) NOT NULL,
		[PERIOD] date NOT NULL,
		[SUM] decimal(18,5) NULL,
		[TYPE1] nvarchar(8) NOT NULL,
		[DATE_INSERTED] [smalldatetime] NULL,
		[INSERTED_BY] [nvarchar](100) NULL,
		[DATA_SOURCE] [nvarchar](200) NULL,
		CONSTRAINT [tmp_UNPAY_COST_WITH_PK] PRIMARY KEY CLUSTERED 
		(
			[ID_PORTFOLIO] ASC,
			[PERIOD] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
	
	ALTER TABLE [dbo].[tmp_UNPAY_COST_WITH] ADD  CONSTRAINT [DF_tmp_UNPAY_COST_WITH_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
	ALTER TABLE [dbo].[tmp_UNPAY_COST_WITH] ADD  CONSTRAINT [DF_tmp_UNPAY_COST_WITH_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
	ALTER TABLE [dbo].[tmp_UNPAY_COST_WITH] ADD  CONSTRAINT [DF_tmp_UNPAY_COST_WITH_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]
		
	/* сперва считаем в месяцах покупки, добавляем их в tmp_UNPAY_COST_WITH */
	insert into tmp_UNPAY_COST_WITH ([ID_PORTFOLIO],[PERIOD],[SUM],[TYPE1])
	select 
		CFP.ID_PORTFOLIO,
		CFP.PERIOD,
		(
		(select P.PURCHASE_PRICE from PORTFOLIOS P where P.ID_PORTFOLIO = CFP.ID_PORTFOLIO) * (-1) - CTF.[SUM] + CFP.[SUM]
		) as [SUM],
		N'query'

	from GetCOLLECTIONS_FACTandPRED CFP left join GetCOSTS_TOTAL_FACT CTF
	on CFP.ID_PORTFOLIO = CTF.ID_PORTFOLIO and CFP.PERIOD = CTF.PERIOD
	where CFP.PERIOD = (select I.PURCHASE_DATE from PORTFOLIOS I where I.ID_PORTFOLIO = CFP.ID_PORTFOLIO)

	/* теперь считаем все месяца, пока не закончен жизненный цикл портфеля*/
		
	declare @monthCur date 
	declare @monthStart date
	declare @monthEnd date
	declare @sql1 nvarchar(1024)
	declare @portfolio nvarchar(32)
	declare @nn int 

	DECLARE CURSOR_P CURSOR FOR
		select ID_PORTFOLIO from PORTFOLIOS --where ID_PORTFOLIO = N'Альфа_4'
	FOR READ ONLY

	OPEN CURSOR_P

	FETCH NEXT FROM CURSOR_P INTO @portfolio
	--FETCH CURSOR_P into @portfolio
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--set @portfolio = N'Альфа_4'
		set @monthStart = (select PURCHASE_DATE from PORTFOLIOS where ID_PORTFOLIO = @portfolio) 
		set @monthEnd = (select ENDLIFE_DATE from PORTFOLIOS where ID_PORTFOLIO = @portfolio) 
		set @monthCur = @monthStart
		set @nn = 1
		while @monthCur < @monthEnd
		begin 
			set @monthCur = dateadd(month,@nn,@monthStart)
			insert into tmp_UNPAY_COST_WITH(ID_PORTFOLIO,PERIOD,[SUM],[TYPE1])
				(
				select 
					@portfolio, 
					@monthCur,
					(select T.[SUM] from tmp_UNPAY_COST_WITH T where T.ID_PORTFOLIO = @portfolio and T.PERIOD = dateadd(month,-1,@monthCur)) +
					(select POD.[SUM] from GetPROFIT_OPER_DIA POD where POD.ID_PORTFOLIO = @portfolio and POD.PERIOD = @monthCur) - 
					isnull((select CPFF.[SUM] from GetCOSTS_PCT_FACT_FULL CPFF where CPFF.ID_PORTFOLIO = @portfolio and CPFF.PERIOD = @monthCur),0),
					N'cursor'
				)
			set @nn = @nn + 1
		end
		FETCH NEXT FROM CURSOR_P INTO @portfolio
	END

	CLOSE CURSOR_P
	DEALLOCATE CURSOR_P
END
GO

DECLARE	@return_value int
EXEC	@return_value = [dbo].[sp_Updating_tmp_UNPAY_COST_WITH]
SELECT	'Return Value' = @return_value
