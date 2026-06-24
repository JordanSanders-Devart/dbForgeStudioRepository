CREATE TABLE [Production].[ProductReview] (
  [ProductReviewID] [int] IDENTITY,
  [ProductID] [int] NOT NULL,
  [ReviewerName] [dbo].[Name] NOT NULL,
  [ReviewDate] [datetime] NOT NULL CONSTRAINT [DF_ProductReview_ReviewDate] DEFAULT (getdate()),
  [EmailAddress] [nvarchar](50) NOT NULL,
  [Rating] [int] NOT NULL,
  [Comments] [nvarchar](3850) NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ProductReview_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_ProductReview_ProductReviewID] PRIMARY KEY CLUSTERED ([ProductReviewID]),
  CONSTRAINT [CK_ProductReview_Rating] CHECK ([Rating]>=(1) AND [Rating]<=(5))
)
ON [PRIMARY]
GO

CREATE INDEX [IX_ProductReview_ProductID_Name]
  ON [Production].[ProductReview] ([ProductID], [ReviewerName])
  INCLUDE ([Comments])
  ON [PRIMARY]
GO

ALTER TABLE [Production].[ProductReview]
  ADD CONSTRAINT [FK_ProductReview_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Customer reviews of products they have purchased.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ProductReview records.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'ProductReviewID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Name of the reviewer.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'ReviewerName'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date review was submitted.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'ReviewDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Reviewer''s e-mail address.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'EmailAddress'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product rating given by the reviewer. Scale is 1 to 5 with 5 as the highest rating.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'Rating'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Reviewer''s comments', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'Comments'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'ProductReview', 'COLUMN', N'ModifiedDate'
GO

CREATE FULLTEXT INDEX
  ON [Production].[ProductReview]([Comments] LANGUAGE 1033)
  KEY INDEX [PK_ProductReview_ProductReviewID]
  ON [AW2025FullTextCatalog]
  WITH CHANGE_TRACKING AUTO, STOPLIST SYSTEM
GO