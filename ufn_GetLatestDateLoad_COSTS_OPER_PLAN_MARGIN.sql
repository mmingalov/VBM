USE [VBM]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_GetLatestDateLoad_COSTS_OPER_PLAN_MARGIN]    Script Date: 09/25/2014 17:44:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[ufn_GetLatestDateLoad_COSTS_OPER_PLAN_MARGIN]
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
			dbo.COSTS_OPER_PLAN_MARGIN
		WHERE
			ID_PORTFOLIO like @Portfolio
		
		RETURN @LatestDate --ISNULL(@NextInstance,1)

    END

GO


