use VBM;
go
/* здесь будут лежать данные дл¤ VIEW */
IF OBJECT_ID('dbo.tmp_UNPAY_COST_WITHOUT','U') IS NOT NULL
	DROP TABLE tmp_UNPAY_COST_WITHOUT;
CREATE TABLE tmp_UNPAY_COST_WITHOUT (
	ID_PORTFOLIO nvarchar(32) NOT NULL,
	PERIOD date NOT NULL,
	[SUM] decimal(18,5) NOT NULL)
	
/* сперва считаем в мес¤цах покупки, добавл¤ем их в tmp_UNPAY_COST_WITHOUT */
insert into tmp_UNPAY_COST_WITHOUT (ID_PORTFOLIO,PERIOD,[SUM])
select 
	CFP.ID_PORTFOLIO,
	CFP.PERIOD,
	(
	(select P.PURCHASE_PRICE from PORTFOLIOS P where P.ID_PORTFOLIO = CFP.ID_PORTFOLIO) * (-1) - CIN.[SUM] + CFP.[SUM]
	) as [SUM]

from GetCOLLECTIONS_FACTandPRED CFP left join GetCOSTS_IRR_NET CIN
on CFP.ID_PORTFOLIO = CIN.ID_PORTFOLIO and CFP.PERIOD = CIN.PERIOD
where CFP.PERIOD = (select I.PURCHASE_DATE from PORTFOLIOS I where I.ID_PORTFOLIO = CFP.ID_PORTFOLIO)

/* теперь считаем все мес¤ца, пока не закончен жизненный цикл портфел¤*/
	
declare @monthCur date 
declare @monthStart date
declare @monthEnd date
declare @sql1 nvarchar(1024)
declare @portfolio nvarchar(32)
declare @nn int 

DECLARE CURSOR_P CURSOR FOR
	select ID_PORTFOLIO from PORTFOLIOS
FOR READ ONLY

OPEN CURSOR_P

FETCH NEXT FROM CURSOR_P INTO @portfolio
--FETCH CURSOR_P into @portfolio
WHILE @@FETCH_STATUS = 0
BEGIN
	--set @portfolio = N'¬ЁЅ'
	set @monthStart = (select PURCHASE_DATE from PORTFOLIOS where ID_PORTFOLIO = @portfolio) 
	set @monthEnd = (select ENDLIFE_DATE from PORTFOLIOS where ID_PORTFOLIO = @portfolio) 
	set @monthCur = @monthStart
	set @nn = 1
	while @monthCur < @monthEnd
	begin 
		set @monthCur = dateadd(month,@nn,@monthStart)
		insert into tmp_UNPAY_COST_WITHOUT(ID_PORTFOLIO,PERIOD,[SUM])
			(
			select 
				@portfolio, 
				@monthCur,
				(select T.[SUM] from tmp_UNPAY_COST_WITHOUT T where T.ID_PORTFOLIO = @portfolio and T.PERIOD = dateadd(month,-1,@monthCur)) +
				(select POD.[SUM] from GetPROFIT_OPER_DIA POD where POD.ID_PORTFOLIO = @portfolio and POD.PERIOD = @monthCur)
			)
		set @nn = @nn + 1
	end
	FETCH NEXT FROM CURSOR_P INTO @portfolio
END

CLOSE CURSOR_P
DEALLOCATE CURSOR_P