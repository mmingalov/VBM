use VBM;
go

update [SYS_LKP_CODE]
set [CODE] = 0.15, [DESCRIPTION] = N'Comment'
where CATEGORY = N'PCT_RATIO'