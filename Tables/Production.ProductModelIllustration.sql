CREATE TABLE [Production].[ProductModelIllustration] (
  [ProductModelID] [int] NOT NULL,
  [IllustrationID] [int] NOT NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductModelIllustration_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_ProductModelIllustration_ProductModelID_IllustrationID] PRIMARY KEY CLUSTERED ([ProductModelID], [IllustrationID])
)
ON [PRIMARY]
GO

ALTER TABLE [Production].[ProductModelIllustration]
  ADD CONSTRAINT [FK_ProductModelIllustration_Illustration_IllustrationID] FOREIGN KEY ([IllustrationID]) REFERENCES [Production].[Illustration] ([IllustrationID])
GO

ALTER TABLE [Production].[ProductModelIllustration]
  ADD CONSTRAINT [FK_ProductModelIllustration_ProductModel_ProductModelID] FOREIGN KEY ([ProductModelID]) REFERENCES [Production].[ProductModel] ([ProductModelID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping product models and illustrations.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelIllustration'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to ProductModel.ProductModelID.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelIllustration', 'COLUMN', N'ProductModelID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Foreign key to Illustration.IllustrationID.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelIllustration', 'COLUMN', N'IllustrationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductModelIllustration', 'COLUMN', N'ModifiedDate'
GO