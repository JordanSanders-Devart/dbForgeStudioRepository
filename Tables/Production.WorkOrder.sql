CREATE TABLE [Production].[WorkOrder] (
  [WorkOrderID] [int] IDENTITY,
  [ProductID] [int] NOT NULL,
  [OrderQty] [int] NOT NULL,
  [StockedQty] AS (isnull([OrderQty]-[ScrappedQty],(0))),
  [ScrappedQty] [smallint] NOT NULL,
  [StartDate] [datetime] NOT NULL,
  [EndDate] [datetime] NULL,
  [DueDate] [datetime] NOT NULL,
  [ScrapReasonID] [smallint] NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_WorkOrder_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_WorkOrder_WorkOrderID] PRIMARY KEY CLUSTERED ([WorkOrderID]),
  CONSTRAINT [CK_WorkOrder_EndDate] CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL),
  CONSTRAINT [CK_WorkOrder_OrderQty] CHECK ([OrderQty]>(0)),
  CONSTRAINT [CK_WorkOrder_ScrappedQty] CHECK ([ScrappedQty]>=(0))
)
ON [PRIMARY]
GO

CREATE INDEX [IX_WorkOrder_ProductID]
  ON [Production].[WorkOrder] ([ProductID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_WorkOrder_ScrapReasonID]
  ON [Production].[WorkOrder] ([ScrapReasonID])
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [Production].[iWorkOrder] ON [Production].[WorkOrder]
AFTER INSERT AS
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0
        RETURN;

    SET NOCOUNT ON;

    BEGIN TRY
        INSERT INTO [Production].[TransactionHistory](
            [ProductID]
            ,[ReferenceOrderID]
            ,[TransactionType]
            ,[TransactionDate]
            ,[Quantity]
            ,[ActualCost])
        SELECT
            inserted.[ProductID]
            ,inserted.[WorkOrderID]
            ,'W'
            ,GETDATE()
            ,inserted.[OrderQty]
            ,0
        FROM inserted;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspPrintError];

        -- Rollback any active or uncommittable transactions before
        -- inserting information in the ErrorLog
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [Production].[uWorkOrder] ON [Production].[WorkOrder]
AFTER UPDATE AS
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0
        RETURN;

    SET NOCOUNT ON;

    BEGIN TRY
        IF UPDATE([ProductID]) OR UPDATE([OrderQty])
        BEGIN
            INSERT INTO [Production].[TransactionHistory](
                [ProductID]
                ,[ReferenceOrderID]
                ,[TransactionType]
                ,[TransactionDate]
                ,[Quantity])
            SELECT
                inserted.[ProductID]
                ,inserted.[WorkOrderID]
                ,'W'
                ,GETDATE()
                ,inserted.[OrderQty]
            FROM inserted;
        END;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspPrintError];

        -- Rollback any active or uncommittable transactions before
        -- inserting information in the ErrorLog
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;
GO

ALTER TABLE [Production].[WorkOrder]
  ADD CONSTRAINT [FK_WorkOrder_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
GO

ALTER TABLE [Production].[WorkOrder]
  ADD CONSTRAINT [FK_WorkOrder_ScrapReason_ScrapReasonID] FOREIGN KEY ([ScrapReasonID]) REFERENCES [Production].[ScrapReason] ([ScrapReasonID])
GO