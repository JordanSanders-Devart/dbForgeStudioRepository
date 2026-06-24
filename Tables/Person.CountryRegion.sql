CREATE TABLE [Person].[CountryRegion] (
  [CountryRegionCode] [nvarchar](3) NOT NULL,
  [Name] [dbo].[Name] NOT NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_CountryRegion_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_CountryRegion_CountryRegionCode] PRIMARY KEY CLUSTERED ([CountryRegionCode])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_CountryRegion_Name]
  ON [Person].[CountryRegion] ([Name])
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Lookup table containing the ISO standard codes for countries and regions.', 'SCHEMA', N'Person', 'TABLE', N'CountryRegion'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ISO standard code for countries and regions.', 'SCHEMA', N'Person', 'TABLE', N'CountryRegion', 'COLUMN', N'CountryRegionCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Country or region name.', 'SCHEMA', N'Person', 'TABLE', N'CountryRegion', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'CountryRegion', 'COLUMN', N'ModifiedDate'
GO