CREATE TABLE [Production].[Illustration] (
  [IllustrationID] [int] IDENTITY,
  [Diagram] [xml] NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Illustration_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_Illustration_IllustrationID] PRIMARY KEY CLUSTERED ([IllustrationID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Bicycle assembly diagrams.', 'SCHEMA', N'Production', 'TABLE', N'Illustration'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Illustration records.', 'SCHEMA', N'Production', 'TABLE', N'Illustration', 'COLUMN', N'IllustrationID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Illustrations used in manufacturing instructions. Stored as XML.', 'SCHEMA', N'Production', 'TABLE', N'Illustration', 'COLUMN', N'Diagram'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'Illustration', 'COLUMN', N'ModifiedDate'
GO