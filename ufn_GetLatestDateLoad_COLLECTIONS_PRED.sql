USE [VBM]
GO

/****** Object:  UserDefinedFunction [dbo].[ufn_GetLatestDateLoad_COLLECTIONS_PRED]    Script Date: 10/21/2014 10:47:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[ufn_GetLatestDateLoad_COLLECTIONS_PRED]
  (@Portfolio NVARCHAR(100))
RETURNS nvarchar(max)
AS 
    BEGIN
		declare @result as nvarchar(max)
		
		IF @Portfolio = N'' 
		set @Portfolio = N'%'
		
		set @result = 
		(select top 1 [VERSION]
		from dbo.COLLECTIONS_PRED
		order by [VERSION] desc)
		
		return @result
    END


GO


