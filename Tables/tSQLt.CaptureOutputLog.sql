CREATE TABLE [tSQLt].[CaptureOutputLog] (
  [Id] [int] IDENTITY,
  [OutputText] [nvarchar](max) NULL,
  PRIMARY KEY CLUSTERED ([Id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO