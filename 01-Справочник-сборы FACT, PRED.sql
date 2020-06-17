use VBM;
go

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

--путь второй. К сожалению он не подходит для VIEW
declare @date1 as date = (dbo.ufn_GetLatestPeriod_COLLECTIONS_FACT(N'%'))
declare @sql as nvarchar(1024) = 
'
select
	ID_PORTFOLIO
	,PERIOD
	,CATEGORY
	,[SUM]
	,''FACT'' as [SOURCE]
from	
	dbo.GetCOLLECTIONS_FACT 
union all
select
	ID_PORTFOLIO
	,PERIOD
	,CATEGORY
	,[SUM]
	,''PRED''
from
	dbo.GetActualCOLLECTIONS_PRED
where PERIOD >  ''' + cast(@date1 as nvarchar) +  ''' 
'
exec (@sql)