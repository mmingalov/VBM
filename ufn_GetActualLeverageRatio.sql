USE [VBM]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.ufn_GetActualLeverageRatio','FN') IS NOT NULL
	DROP FUNCTION ufn_GetActualLeverageRatio;
GO

CREATE FUNCTION [dbo].[ufn_GetActualLeverageRatio]()
RETURNS decimal (18,5)
AS 
    BEGIN	
		DECLARE @LatestRatio decimal(18,5)
		set @LatestRatio = 
			(SELECT cast(CODE as decimal(18,5)) from SYS_LKP_CODE where CATEGORY = N'LEVERAGE_RATIO' and RANKING = 1)
		RETURN @LatestRatio

    END

GO


select VBM.dbo.ufn_GetActualLeverageRatio()