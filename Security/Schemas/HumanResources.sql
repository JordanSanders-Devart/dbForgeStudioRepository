CREATE SCHEMA [HumanResources]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Contains objects related to employees and departments.', 'SCHEMA', N'HumanResources'
GO