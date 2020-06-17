
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Maxim Mingalov>
-- Create date: <29.08.2014>
-- Update date: <28.09.2014> - ufn usage was replaced
-- Description:	<ќбновление таблицы, содержащей информацию о прогнозном периоде ‘актических %расходов>
-- =============================================
IF OBJECT_ID('sp_Updating_tmp_COSTS_PCT_PRED','P') IS NOT NULL
	DROP PROCEDURE sp_Updating_tmp_COSTS_PCT_PRED;
GO
		
CREATE PROCEDURE sp_Updating_tmp_COSTS_PCT_PRED
AS
BEGIN
	/* здесь будут лежать данные дл€ VIEW */
	IF OBJECT_ID('dbo.tmp_COSTS_PCT_PRED','U') IS NOT NULL
		DROP TABLE tmp_COSTS_PCT_PRED;
	CREATE TABLE tmp_COSTS_PCT_PRED 
		(
		ID_PORTFOLIO nvarchar(32) NOT NULL,
		PERIOD date NOT NULL,
		[SUM] decimal(18,5) NOT NULL,
		[DATE_INSERTED] [smalldatetime] NULL,
		[INSERTED_BY] [nvarchar](100) NULL,
		[DATA_SOURCE] [nvarchar](200) NULL,
		CONSTRAINT [tmp_COSTS_PCT_PRED_PK] PRIMARY KEY CLUSTERED 
		(
			[ID_PORTFOLIO] ASC,
			[PERIOD] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
		) ON [PRIMARY]
	ALTER TABLE [dbo].[tmp_COSTS_PCT_PRED] ADD  CONSTRAINT [DF_tmp_COSTS_PCT_PRED_DATE_INSERTED]  DEFAULT (getdate()) FOR [DATE_INSERTED]
	ALTER TABLE [dbo].[tmp_COSTS_PCT_PRED] ADD  CONSTRAINT [DF_tmp_COSTS_PCT_PRED_INSERTED_BY]  DEFAULT (suser_sname()) FOR [INSERTED_BY]
	ALTER TABLE [dbo].[tmp_COSTS_PCT_PRED] ADD  CONSTRAINT [DF_tmp_COSTS_PCT_PRED_DATA_SOURCE]  DEFAULT ('User') FOR [DATA_SOURCE]

	/* теперь считаем все мес€ца, пока не закончен жизненный цикл портфел€*/
		
	declare @monthStart date	
	declare @monthCur date 
	declare @monthEnd date
	declare @portfolio nvarchar(32)
	declare @SUM_cashflow decimal(18,5)
	declare @SUM_result decimal(18,5)
	declare @nn int 

	DECLARE CURSOR_P CURSOR FOR
		select ID_PORTFOLIO from PORTFOLIOS where ID_PORTFOLIO <> N'¬ЁЅ_ќблигации'
	FOR READ ONLY

	OPEN CURSOR_P

	FETCH NEXT FROM CURSOR_P INTO @portfolio
	WHILE @@FETCH_STATUS = 0
	BEGIN
		set @monthEnd = (select ENDLIFE_DATE from PORTFOLIOS where ID_PORTFOLIO = @portfolio) 
		set @monthStart = dateadd(month,1,(select MAX(PERIOD) from GetCOSTS_PCT_FACT where ID_PORTFOLIO = @portfolio))
		set @monthCur = @monthStart
		set @nn = 0
		while @monthCur < @monthEnd
		begin 
			set @monthCur = dateadd(month,@nn,@monthStart)
			set @SUM_cashflow = (select SUM([SUM]) from GetCASHFLOW_WITH where ID_PORTFOLIO = @portfolio and PERIOD < @monthCur)
			set @SUM_result = (@SUM_cashflow * (select ufnValue from tmp_UFN_VALUES where ufnName = N'ufn_GetActualPCTRatio') / 12 * /*dbo.ufn_GetActualLeverageRatio()*/ (select ufnValue from tmp_UFN_VALUES where ufnName = N'ufn_GetActualLeverageRatio'))*(-1)
			insert into tmp_COSTS_PCT_PRED(ID_PORTFOLIO,PERIOD,[SUM])
				(
				select 
					@portfolio, 
					@monthCur,
					CASE
						WHEN @SUM_result > 0 then @SUM_result
						ELSE 0
					END
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
EXEC	@return_value = [dbo].[sp_Updating_tmp_COSTS_PCT_PRED]
SELECT	'Return Value' = @return_value

-- около 11 мину