use VBM;
go
/* здесь будут лежать данные для VIEW */
IF OBJECT_ID('dbo.tmp_COSTS_PCT_PRED','U') IS NOT NULL
	DROP TABLE tmp_COSTS_PCT_PRED;
CREATE TABLE tmp_COSTS_PCT_PRED (
	ID_PORTFOLIO nvarchar(32) NOT NULL,
	PERIOD date NOT NULL,
	[SUM] decimal(18,5) NOT NULL)
/*	
/* сперва считаем в месяцах покупки, добавляем их в tmp_COSTS_PCT_PRED */
insert into tmp_COSTS_PCT_PRED (ID_PORTFOLIO,PERIOD,[SUM])
select 
	CFP.ID_PORTFOLIO,
	CFP.PERIOD,
	(
	(select P.PURCHASE_PRICE from PORTFOLIOS P where P.ID_PORTFOLIO = CFP.ID_PORTFOLIO) * (-1) - CIN.[SUM]
	) as [SUM]

from GetCOLLECTIONS_FACTandPRED CFP left join GetCOSTS_IRR_NET CIN
on CFP.ID_PORTFOLIO = CIN.ID_PORTFOLIO and CFP.PERIOD = CIN.PERIOD
where CFP.PERIOD = (select I.PURCHASE_DATE from PORTFOLIOS I where I.ID_PORTFOLIO = CFP.ID_PORTFOLIO)
*/

/* теперь считаем все месяца, пока не закончен жизненный цикл портфеля*/
	
declare @monthStart date	
declare @monthCur date 
declare @monthEnd date
declare @portfolio nvarchar(32)
declare @SUM_cashflow decimal(18,5)
declare @SUM_result decimal(18,5)
declare @nn int 

DECLARE CURSOR_P CURSOR FOR
	select ID_PORTFOLIO from PORTFOLIOS
FOR READ ONLY

OPEN CURSOR_P

FETCH NEXT FROM CURSOR_P INTO @portfolio
WHILE @@FETCH_STATUS = 0
BEGIN
	set @monthEnd = (select ENDLIFE_DATE from PORTFOLIOS where ID_PORTFOLIO = @portfolio) 
	set @monthCur = dateadd(month,1,(select MAX(PERIOD) from GetCOSTS_PCT_FACT where ID_PORTFOLIO = @portfolio))
	set @monthStart = @monthCur
	set @nn = 1
	while @monthCur < @monthEnd
	begin 
		set @monthCur = dateadd(month,@nn,@monthStart)
		set @SUM_cashflow = (select SUM([SUM]) from GetCASHFLOW_WITH where ID_PORTFOLIO = @portfolio and PERIOD < @monthCur)
		set @SUM_result = (@SUM_cashflow * 0.14 / 12 * dbo.ufn_GetActualLeverageRatio())*(-1)
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