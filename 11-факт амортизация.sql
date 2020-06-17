use VBM;
go

--������������ ��������, ������� ������ ������ 
SELECT     
	NP1.ID_PORTFOLIO, 
	NP1.PERIOD, 
	DATEADD(MONTH,-1,NP1.PERIOD) as [PERIOD_PREV], 
	(select NP2.[SUM] from NPV_FACT NP2 where NP2.PERIOD = DATEADD(MONTH,-1,NP1.PERIOD) and NP1.ID_PORTFOLIO = NP2.ID_PORTFOLIO) - NP1.[SUM] as [SUM_CALC]
	,(select NP2.[SUM] from NPV_FACT NP2 where NP2.PERIOD = DATEADD(MONTH,-1,NP1.PERIOD) and NP1.ID_PORTFOLIO = NP2.ID_PORTFOLIO) as [SUM_PREV]
	, NP1.[SUM] as [SUM_CURR]
FROM	dbo.NPV_FACT NP1 INNER JOIN dbo.PORTFOLIOS P
ON NP1.PERIOD <> P.PURCHASE_DATE and NP1.ID_PORTFOLIO = P.ID_PORTFOLIO
--��������� ������ ��� ������ �������, ��� �� ���������.
union all
select P.ID_PORTFOLIO, P.PURCHASE_DATE, NULL, (PURCHASE_PRICE - ( SELECT [SUM] FROM NPV_FACT where PERIOD = P.PURCHASE_DATE and ID_PORTFOLIO = P.ID_PORTFOLIO)),NULL,NULL
from PORTFOLIOS P
where P.ID_PORTFOLIO NOT IN (N'����',N'��������������')
--���������� ���������� �� ���������

EXCEPT
SELECT     
	NP1.ID_PORTFOLIO, 
	NP1.PERIOD, 
	DATEADD(MONTH,-1,NP1.PERIOD) as [PERIOD_PREV], 
	(select NP2.[SUM] from NPV_FACT NP2 where NP2.PERIOD = DATEADD(MONTH,-1,NP1.PERIOD) and NP1.ID_PORTFOLIO = NP2.ID_PORTFOLIO) - NP1.[SUM] as [SUM_CALC]
	,(select NP2.[SUM] from NPV_FACT NP2 where NP2.PERIOD = DATEADD(MONTH,-1,NP1.PERIOD) and NP1.ID_PORTFOLIO = NP2.ID_PORTFOLIO) as [SUM_PREV]
	, NP1.[SUM] as [SUM_CURR]
FROM	dbo.NPV_FACT NP1
WHERE (ID_PORTFOLIO = N'����' AND PERIOD IN ('2008-02-01','2008-03-01','2008-04-01','2008-05-01','2008-06-01','2008-07-01','2008-08-01'))

--������ ���������� �� ���������
union all
select N'��������������', cast('2009-04-01' as DATE), NULL, 320556.219,NULL,NULL --����� ������ ����� ���� �������. ������� �� ���� ��� ���������
union all
select N'����', cast('2008-02-01' as DATE), NULL, -4036.607025,NULL,NULL --����� ������ ����� ���� �������. ������� �� ���� ��� ���������
union all
select N'����', cast('2008-03-01' as DATE), NULL, 6681.107512,NULL,NULL
union all
select N'����', cast('2008-04-01' as DATE), NULL, 13496.4706,NULL,NULL
union all
select N'����', cast('2008-05-01' as DATE), NULL, 14166.42061,NULL,NULL
union all
select N'����', cast('2008-06-01' as DATE), NULL, 19713.77953,NULL,NULL
union all
select N'����', cast('2008-07-01' as DATE), NULL, 20310.73105,NULL,NULL
union all
select N'����', cast('2008-08-01' as DATE), NULL, 8769.205508,NULL,NULL
order by 1,2

