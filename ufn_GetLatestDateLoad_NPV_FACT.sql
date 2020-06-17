SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.ufn_GetLatestDateLoad_NPV_FACT','FN') IS NOT NULL
	DROP FUNCTION ufn_GetLatestDateLoad_NPV_FACT;
GO

CREATE FUNCTION [dbo].[ufn_GetLatestDateLoad_NPV_FACT]
  (@Portfolio NVARCHAR(100))
RETURNS DATE
AS 
    BEGIN
		IF @Portfolio = N'' 
		set @Portfolio = N'%'
		
		DECLARE @LatestDate DATE
		
		SELECT  
			@LatestDate = MAX(DATE_LOAD)
		FROM
			dbo.NPV_FACT
		WHERE
			ID_PORTFOLIO like @Portfolio
		
		RETURN @LatestDate --ISNULL(@NextInstance,1)

    END
GO

select [VBM].dbo.ufn_GetLatestDateLoad_NPV_FACT(N'')