CREATE TABLE [Production].[Location] (
  [LocationID] [smallint] IDENTITY,
  [Name] [dbo].[Name] NOT NULL,
  [CostRate] [smallmoney] NOT NULL CONSTRAINT [DF_Location_CostRate] DEFAULT (0.00),
  [Availability] [decimal](8, 2) NOT NULL CONSTRAINT [DF_Location_Availability] DEFAULT (0.00),
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Location_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_Location_LocationID] PRIMARY KEY CLUSTERED ([LocationID]),
  CONSTRAINT [CK_Location_Availability] CHECK ([Availability]>=(0.00)),
  CONSTRAINT [CK_Location_CostRate] CHECK ([CostRate]>=(0.00))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_Location_Name]
  ON [Production].[Location] ([Name])
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product inventory and manufacturing locations.', 'SCHEMA', N'Production', 'TABLE', N'Location'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Location records.', 'SCHEMA', N'Production', 'TABLE', N'Location', 'COLUMN', N'LocationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Location description.', 'SCHEMA', N'Production', 'TABLE', N'Location', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Standard hourly cost of the manufacturing location.', 'SCHEMA', N'Production', 'TABLE', N'Location', 'COLUMN', N'CostRate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Work capacity (in hours) of the manufacturing location.', 'SCHEMA', N'Production', 'TABLE', N'Location', 'COLUMN', N'Availability'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'Location', 'COLUMN', N'ModifiedDate'
GO