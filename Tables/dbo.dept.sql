CREATE TABLE [dbo].[dept] (
  [deptno] [int] NOT NULL,
  [dname] [varchar](14) NULL,
  [loc] [varchar](13) NULL,
  CONSTRAINT [PK_dept] PRIMARY KEY CLUSTERED ([deptno])
)
ON [PRIMARY]
GO