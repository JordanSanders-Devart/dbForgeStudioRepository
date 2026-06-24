CREATE TABLE [Sales].[PersonCreditCard] (
  [BusinessEntityID] [int] NOT NULL,
  [CreditCardID] [int] NOT NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_PersonCreditCard_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_PersonCreditCard_BusinessEntityID_CreditCardID] PRIMARY KEY CLUSTERED ([BusinessEntityID], [CreditCardID])
)
ON [PRIMARY]
GO

ALTER TABLE [Sales].[PersonCreditCard]
  ADD CONSTRAINT [FK_PersonCreditCard_CreditCard_CreditCardID] FOREIGN KEY ([CreditCardID]) REFERENCES [Sales].[CreditCard] ([CreditCardID])
GO

ALTER TABLE [Sales].[PersonCreditCard]
  ADD CONSTRAINT [FK_PersonCreditCard_Person_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Cross-reference table mapping people to their credit card information in the CreditCard table. ', 'SCHEMA', N'Sales', 'TABLE', N'PersonCreditCard'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Business entity identification number. Foreign key to Person.BusinessEntityID.', 'SCHEMA', N'Sales', 'TABLE', N'PersonCreditCard', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Credit card identification number. Foreign key to CreditCard.CreditCardID.', 'SCHEMA', N'Sales', 'TABLE', N'PersonCreditCard', 'COLUMN', N'CreditCardID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'PersonCreditCard', 'COLUMN', N'ModifiedDate'
GO