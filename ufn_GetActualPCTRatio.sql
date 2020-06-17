USE [VBM]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_GetActualPCTRatio]    Script Date: 10/16/2014 18:10:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[ufn_GetActualPCTRatio]()
RETURNS decimal (18,5)
AS 
    BEGIN	
		DECLARE @LatestRatio decimal(18,5)
		set @LatestRatio = 
			(SELECT cast(CODE as decimal(18,5)) from SYS_LKP_CODE where CATEGORY = N'PCT_RATIO' and RANKING = 1)
		RETURN @LatestRatio

    END


GO


