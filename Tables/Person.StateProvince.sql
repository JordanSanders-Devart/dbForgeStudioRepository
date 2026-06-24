CREATE TABLE [Person].[StateProvince] (
  [StateProvinceID] [int] IDENTITY,
  [StateProvinceCode] [nchar](3) NOT NULL,
  [CountryRegionCode] [nvarchar](3) NOT NULL,
  [IsOnlyStateProvinceFlag] [dbo].[Flag] NOT NULL CONSTRAINT [DF_StateProvince_IsOnlyStateProvinceFlag] DEFAULT (1),
  [Name] [dbo].[Name] NOT NULL,
  [TerritoryID] [int] NOT NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_StateProvince_rowguid] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_StateProvince_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_StateProvince_StateProvinceID] PRIMARY KEY CLUSTERED ([StateProvinceID])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_StateProvince_Name]
  ON [Person].[StateProvince] ([Name])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_StateProvince_rowguid]
  ON [Person].[StateProvince] ([rowguid])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_StateProvince_StateProvinceCode_CountryRegionCode]
  ON [Person].[StateProvince] ([StateProvinceCode], [CountryRegionCode])
  ON [PRIMARY]
GO

ALTER TABLE [Person].[StateProvince]
  ADD CONSTRAINT [FK_StateProvince_CountryRegion_CountryRegionCode] FOREIGN KEY ([CountryRegionCode]) REFERENCES [Person].[CountryRegion] ([CountryRegionCode])
GO

ALTER TABLE [Person].[StateProvince]
  ADD CONSTRAINT [FK_StateProvince_SalesTerritory_TerritoryID] FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'State and province lookup table.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for StateProvince records.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'StateProvinceID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ISO standard state or province code.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'StateProvinceCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ISO standard country or region code. Foreign key to CountryRegion.CountryRegionCode. ', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'CountryRegionCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = StateProvinceCode exists. 1 = StateProvinceCode unavailable, using CountryRegionCode.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'IsOnlyStateProvinceFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'State or province description.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ID of the territory in which the state or province is located. Foreign key to SalesTerritory.SalesTerritoryID.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'TerritoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'StateProvince', 'COLUMN', N'ModifiedDate'
GO