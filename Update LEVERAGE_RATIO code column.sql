use VBM;
go

update [SYS_LKP_CODE]
set [CODE] = 0.43, [DESCRIPTION] = N'Comment'
where CATEGORY = N'LEVERAGE_RATIO'