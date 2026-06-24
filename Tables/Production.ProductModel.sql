CREATE TABLE [Production].[ProductModel] (
  [ProductModelID] [int] IDENTITY,
  [Name] [dbo].[Name] NOT NULL,
  [CatalogDescription] [xml] (CONTENT Production.ProductDescriptionSchemaCollection) NULL,
  [Instructions] [xml] (CONTENT Production.ManuInstructionsSchemaCollection) NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProductModel_rowguid] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductModel_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_ProductModel_ProductModelID] PRIMARY KEY CLUSTERED ([ProductModelID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PRIMARY XML INDEX [PXML_ProductModel_Instructions]
  ON [Production].[ProductModel] ([Instructions])
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PRIMARY XML INDEX [PXML_ProductModel_CatalogDescription]
  ON [Production].[ProductModel] ([CatalogDescription])
GO

CREATE UNIQUE INDEX [AK_ProductModel_Name]
  ON [Production].[ProductModel] ([Name])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_ProductModel_rowguid]
  ON [Production].[ProductModel] ([rowguid])
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product model classification.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ProductModel records.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'COLUMN', N'ProductModelID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product model description.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Detailed product catalog information in xml format.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'COLUMN', N'CatalogDescription'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Manufacturing instructions in xml format.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'COLUMN', N'Instructions'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductModel', 'COLUMN', N'ModifiedDate'
GO