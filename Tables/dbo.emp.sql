CREATE TABLE [dbo].[emp] (
  [empno] [int] NOT NULL,
  [ename] [varchar](10) NULL,
  [job] [varchar](9) NULL,
  [mgr] [int] NULL,
  [hiredate] [datetime] NULL,
  [sal] [numeric](7, 2) NULL,
  [comm] [numeric](7, 2) NULL,
  [dept] [int] NULL,
  PRIMARY KEY CLUSTERED ([empno])
)
ON [PRIMARY]
GO