CREATE TABLE [Person].[EmailAddress] (
  [BusinessEntityID] [int] NOT NULL,
  [EmailAddressID] [int] IDENTITY,
  [EmailAddress] [nvarchar](50) NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_EmailAddress_rowguid] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_EmailAddress_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_EmailAddress_BusinessEntityID_EmailAddressID] PRIMARY KEY CLUSTERED ([BusinessEntityID], [EmailAddressID])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_EmailAddress_EmailAddress]
  ON [Person].[EmailAddress] ([EmailAddress])
  ON [PRIMARY]
GO

ALTER TABLE [Person].[EmailAddress]
  ADD CONSTRAINT [FK_EmailAddress_Person_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Where to send a person email.', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. Person associated with this email address.  Foreign key to Person.BusinessEntityID', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key. ID of this email address.', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'COLUMN', N'EmailAddressID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'E-mail address for the person.', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'COLUMN', N'EmailAddress'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'EmailAddress', 'COLUMN', N'ModifiedDate'
GO