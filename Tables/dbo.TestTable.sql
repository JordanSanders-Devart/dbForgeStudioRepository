CREATE TABLE [dbo].[TestTable] (
  [col1] [int] NOT NULL,
  [col2] [char](5) NULL,
  CONSTRAINT [PK_TestTable_col1] PRIMARY KEY CLUSTERED ([col1])
)
ON [PRIMARY]
GO