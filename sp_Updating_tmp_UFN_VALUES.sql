USE [VBM]
GO

/****** Object:  StoredProcedure [dbo].[sp_Updating_tmp_UFN_VALUES]    Script Date: 09/28/2014 19:35:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Maxim Mingalov>
-- Create date: <28.09.2014>
-- Description:	<Обновление таблицы с переменными, хранящими значения функций. Для импользования этих значений во VIEW вместо реальных ufn>
-- =============================================
IF OBJECT_ID('sp_Updating_tmp_UFN_VALUES','P') IS NOT NULL
	DROP PROCEDURE sp_Updating_tmp_UFN_VALUES;
GO
		
CREATE PROCEDURE [dbo].[sp_Updating_tmp_UFN_VALUES]
AS
BEGIN
	/* здесь будут лежать данные для VIEW */
UPDATE tmp_UFN_VALUES 
	set ufnValue = dbo.ufn_GetActualLeverageRatio() where ufnName = 'ufn_GetActualLeverageRatio'
UPDATE tmp_UFN_VALUES 
	set ufnValue = dbo.ufn_GetActualPCTRatio() where ufnName = 'ufn_GetActualPCTRatio'
	
UPDATE tmp_UFN_VALUES 
	set ufnValue = dbo.ufn_GetLatestDateLoad_COSTS_OPER_PLAN_MARGIN(N'') where ufnName = 'ufn_GetLatestDateLoad_COSTS_OPER_PLAN_MARGIN'
UPDATE tmp_UFN_VALUES 
	set ufnValue = dbo.ufn_GetLatestDateLoad_COLLECTIONS_PRED(N'') where ufnName = 'ufn_GetLatestDateLoad_COLLECTIONS_PRED'
UPDATE tmp_UFN_VALUES 	
	set ufnValue = dbo.ufn_GetLatestDateLoad_NPV_FACT(N'') where ufnName = 'ufn_GetLatestDateLoad_NPV_FACT'
UPDATE tmp_UFN_VALUES 
	set ufnValue = dbo.ufn_GetLatestPeriod_COLLECTIONS_FACT(N'%') where ufnName = 'ufn_GetLatestPeriod_COLLECTIONS_FACT'
UPDATE tmp_UFN_VALUES 	
	set ufnValue = dbo.ufn_GetLatestPeriod_COSTS_OPER(N'') where ufnName = 'ufn_GetLatestPeriod_COSTS_OPER'
UPDATE tmp_UFN_VALUES 	
	set ufnValue = dbo.ufn_GetLatestPeriod_TAXES_FACT(N'%') where ufnName = 'ufn_GetLatestPeriod_TAXES_FACT'                           
END

GO


