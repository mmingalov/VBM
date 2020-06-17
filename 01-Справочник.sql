use VBM;
go

--Справочник сводная информация по портфелям
select 
	 P.ID_PORTFOLIO
	,P.TOP_MONTH
	,P.PURCHASE_PRICE
		, (select SUM([SUM_CALC]) from GetAMORTIZATION_FACT where ID_PORTFOLIO = P.ID_PORTFOLIO) as SUM_AMO
	,P.ENDLIFE_DATE
	,P.PURCHASE_DATE
	,P.TOTAL_VALUE
	,CAST((P.PURCHASE_PRICE / (select SUM(PURCHASE_PRICE) from PORTFOLIOS)) as decimal(4,4)) as WEIGHT1
	,CAST((P.PURCHASE_PRICE / TOTAL_VALUE) as decimal(4,4)) as PRICE_NOMINAL
	,(select SUM(F.[SUM]) from dbo.GetCOLLECTIONS_FACT F where F.ID_PORTFOLIO = P.ID_PORTFOLIO)/P.PURCHASE_PRICE as CASH_current
	,(select SUM(FP.[SUM]) from dbo.GetCOLLECTIONS_FACTandPRED FP where FP.ID_PORTFOLIO = P.ID_PORTFOLIO)/P.PURCHASE_PRICE as CASH_total
		,UCW.COUNT1 as PERIOD_total
		,CASE
			WHEN isnull(UCW2.COUNT2,0) = 0 
				THEN N'окупился'
				ELSE cast(isnull(UCW2.COUNT2,0) + 1 as nvarchar)
				
		END as PERIOD_current
	,P.IRR_BRUTTO
	,P.IRR_NET
 from 
	PORTFOLIOS P left JOIN 
	(
	select U.ID_PORTFOLIO, (count(U.[SUM]) + 1) as [COUNT1]
	from GetUNPAY_COST_WITH U
	where U.[SUM] <0
	group by ID_PORTFOLIO
	) UCW
	on P.ID_PORTFOLIO = UCW.ID_PORTFOLIO
	left JOIN 
	(
	select U.ID_PORTFOLIO, (count(U.[SUM])) as [COUNT2]
	from GetUNPAY_COST_WITH U
	where U.[SUM] <0 and U.PERIOD >= (dbo.ufn_GetLatestPeriod_COLLECTIONS_FACT(U.ID_PORTFOLIO))
	group by U.ID_PORTFOLIO
	) UCW2
	on P.ID_PORTFOLIO = UCW2.ID_PORTFOLIO