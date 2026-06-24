CREATE TABLE [Person].[ContactType] (
  [ContactTypeID] [int] IDENTITY,
  [Name] [dbo].[Name] NOT NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ContactType_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_ContactType_ContactTypeID] PRIMARY KEY CLUSTERED ([ContactTypeID])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_ContactType_Name]
  ON [Person].[ContactType] ([Name])
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Lookup table containing the types of business entity contacts.', 'SCHEMA', N'Person', 'TABLE', N'ContactType'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ContactType records.', 'SCHEMA', N'Person', 'TABLE', N'ContactType', 'COLUMN', N'ContactTypeID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Contact type description.', 'SCHEMA', N'Person', 'TABLE', N'ContactType', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'ContactType', 'COLUMN', N'ModifiedDate'
GO