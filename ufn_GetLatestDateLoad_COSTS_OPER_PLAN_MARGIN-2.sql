USE [VBM]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_GetLatestDateLoad_COSTS_OPER_PLAN_MARGIN]    Script Date: 09/25/2014 17:44:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[ufn_GetLatestDateLoad_COSTS_OPER_PLAN_MARGIN]
  (@Portfolio NVARCHAR(100))
RETURNS nvarchar(max)
AS 
    BEGIN
		declare @result as nvarchar(max)
		
		IF @Portfolio = N'' 
		set @Portfolio = N'%'
		
		set @result = 
		(select top 1 date_load
		from dbo.COSTS_OPER_PLAN_MARGIN
		order by date_load desc)
		
		return @result
    END

GO


select dbo.ufn_GetLatestDateLoad_COSTS_OPER_PLAN_MARGIN(N'')