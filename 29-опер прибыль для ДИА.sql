use VBM;
go

select
	CFP.ID_PORTFOLIO,
	CFP.PERIOD,
	 (
	 CFP.[SUM] - COFP.[SUM] - 
	 CASE 
		WHEN TFP.[SUM2]<0 THEN 0
	 ELSE TFP.[SUM2]
	 END
	 ) as [SUM],
	CFP.[SUM] as [SUM_CFP],
	COFP.[SUM] as [SUM_CO],
	TFP.[SUM2] as [SUM_TFP]
	
from GetCOLLECTIONS_FACTandPRED CFP left join GetCOSTS_OPER_FACTandPRED COFP
on CFP.ID_PORTFOLIO = COFP.ID_PORTFOLIO and CFP.PERIOD = COFP.PERIOD
left join GetTAXES_FACTandPRED TFP
on CFP.ID_PORTFOLIO = TFP.ID_PORTFOLIO and CFP.PERIOD = TFP.PERIOD