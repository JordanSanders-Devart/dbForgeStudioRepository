CREATE SCHEMA [Purchasing]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Contains objects related to vendors and purchase orders.', 'SCHEMA', N'Purchasing'
GO