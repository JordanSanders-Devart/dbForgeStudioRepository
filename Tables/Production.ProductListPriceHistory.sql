CREATE TABLE [Production].[ProductListPriceHistory] (
  [ProductID] [int] NOT NULL,
  [StartDate] [datetime] NOT NULL,
  [EndDate] [datetime] NULL,
  [ListPrice] [money] NOT NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductListPriceHistory_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_ProductListPriceHistory_ProductID_StartDate] PRIMARY KEY CLUSTERED ([ProductID], [StartDate]),
  CONSTRAINT [CK_ProductListPriceHistory_EndDate] CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL),
  CONSTRAINT [CK_ProductListPriceHistory_ListPrice] CHECK ([ListPrice]>(0.00))
)
ON [PRIMARY]
GO

ALTER TABLE [Production].[ProductListPriceHistory]
  ADD CONSTRAINT [FK_ProductListPriceHistory_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Changes in the list price of a product over time.', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'List price start date.', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'COLUMN', N'StartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'List price end date', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'COLUMN', N'EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product list price.', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'COLUMN', N'ListPrice'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductListPriceHistory', 'COLUMN', N'ModifiedDate'
GO