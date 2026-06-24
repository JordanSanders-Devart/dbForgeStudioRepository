CREATE SCHEMA [Person]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Contains objects related to names and addresses of customers, vendors, and employees', 'SCHEMA', N'Person'
GO