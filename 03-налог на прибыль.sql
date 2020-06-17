use VBM;
go

select
	ID_PORTFOLIO
	,PERIOD
	,[SUM2]
	,'FACT' as [SOURCE]
from	
	dbo.TAXES_FACT 
union all
/*
--не используем эту таблицу больше
select
	ID_PORTFOLIO
	,PERIOD
	,[SUM2]
	,'PRED'
from
	dbo.TAXES_PRED*/
SELECT     ID_PORTFOLIO, PERIOD, [SUM] * 0.2, 'PRED'
FROM         dbo.GetPROFIT_FACT
WHERE     PERIOD > (select ufnValue from tmp_UFN_VALUES where ufnName = N'ufn_GetLatestPeriod_TAXES_FACT')