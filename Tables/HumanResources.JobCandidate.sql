CREATE TABLE [HumanResources].[JobCandidate] (
  [JobCandidateID] [int] IDENTITY,
  [BusinessEntityID] [int] NULL,
  [Resume] [xml] (CONTENT HumanResources.HRResumeSchemaCollection) NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_JobCandidate_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_JobCandidate_JobCandidateID] PRIMARY KEY CLUSTERED ([JobCandidateID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_JobCandidate_BusinessEntityID]
  ON [HumanResources].[JobCandidate] ([BusinessEntityID])
  ON [PRIMARY]
GO

ALTER TABLE [HumanResources].[JobCandidate]
  ADD CONSTRAINT [FK_JobCandidate_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Résumés submitted to Human Resources by job applicants.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for JobCandidate records.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'JobCandidateID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee identification number if applicant was hired. Foreign key to Employee.BusinessEntityID.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Résumé in XML format.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'Resume'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'HumanResources', 'TABLE', N'JobCandidate', 'COLUMN', N'ModifiedDate'
GO

CREATE FULLTEXT INDEX
  ON [HumanResources].[JobCandidate]([Resume] LANGUAGE 1033)
  KEY INDEX [PK_JobCandidate_JobCandidateID]
  ON [AW2025FullTextCatalog]
  WITH CHANGE_TRACKING AUTO, STOPLIST SYSTEM
GO