use VBM;
go

select 
	CO.ID_PORTFOLIO,
	CO.PERIOD,
		(isnull(CO.[SUM],0) + isnull(CPFF.[SUM],0) + isnull(TF.[SUM2],0)) as [SUM],
	CO.[SUM] as [SUM_CO],
	CPFF.[SUM] as [SUM_CPF],
	TF.[SUM2] as [SUM_TF]
from GetCOSTS_OPER_FACTandPRED CO left join GetCOSTS_PCT_FACT_FULL CPFF
on CO.ID_PORTFOLIO = CPFF.ID_PORTFOLIO and CO.PERIOD = CPFF.PERIOD
left join GetTAXES_FACTandPRED TF
on CO.ID_PORTFOLIO = TF.ID_PORTFOLIO and CO.PERIOD = TF.PERIOD

where CO.ID_PORTFOLIO = N'�����_4' and CO.PERIOD > '2014-07-01'