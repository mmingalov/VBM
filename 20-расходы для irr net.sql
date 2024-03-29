use VBM;
GO

select
	COFP.ID_PORTFOLIO,
	COFP.PERIOD,
		(COFP.[SUM] + TFP.[SUM2]) as [SUM],
	COFP.[SUM] as [SUM_COFP],
	TFP.[SUM2] as [SUM_TFP]

from GetCOSTS_OPER_FACTandPRED COFP
left join GetTAXES_FACTandPRED TFP
on COFP.ID_PORTFOLIO = TFP.ID_PORTFOLIO and COFP.PERIOD = TFP.PERIOD 