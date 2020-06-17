SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.ufn_GetLatestPeriod_COSTS_OPER','FN') IS NOT NULL
	DROP FUNCTION ufn_GetLatestPeriod_COSTS_OPER;
GO

CREATE FUNCTION [dbo].[ufn_GetLatestPeriod_COSTS_OPER]
  (@Portfolio NVARCHAR(100))
RETURNS DATE
AS 
    BEGIN
		IF @Portfolio = N'' 
		set @Portfolio = N'%'
		
		DECLARE @LatestPeriod DATE
		
		SELECT  
			@LatestPeriod = MAX(PERIOD)
		FROM
			dbo.COSTS_OPER
		WHERE
			ID_PORTFOLIO like @Portfolio
		
		RETURN @LatestPeriod --ISNULL(@NextInstance,1)

    END
GO

select [VBM].dbo.ufn_GetLatestPeriod_COSTS_OPER(N'')