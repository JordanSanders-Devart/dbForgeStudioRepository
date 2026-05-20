CREATE TABLE [Production].[WorkOrderRouting] (
  [WorkOrderID] [int] NOT NULL,
  [ProductID] [int] NOT NULL,
  [OperationSequence] [smallint] NOT NULL,
  [LocationID] [smallint] NOT NULL,
  [ScheduledStartDate] [datetime] NOT NULL,
  [ScheduledEndDate] [datetime] NOT NULL,
  [ActualStartDate] [datetime] NULL,
  [ActualEndDate] [datetime] NULL,
  [ActualResourceHrs] [decimal](9, 4) NULL,
  [PlannedCost] [money] NOT NULL,
  [ActualCost] [money] NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_WorkOrderRouting_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence] PRIMARY KEY CLUSTERED ([WorkOrderID], [ProductID], [OperationSequence]),
  CONSTRAINT [CK_WorkOrderRouting_ActualCost] CHECK ([ActualCost]>(0.00)),
  CONSTRAINT [CK_WorkOrderRouting_ActualEndDate] CHECK ([ActualEndDate]>=[ActualStartDate] OR [ActualEndDate] IS NULL OR [ActualStartDate] IS NULL),
  CONSTRAINT [CK_WorkOrderRouting_ActualResourceHrs] CHECK ([ActualResourceHrs]>=(0.0000)),
  CONSTRAINT [CK_WorkOrderRouting_PlannedCost] CHECK ([PlannedCost]>(0.00)),
  CONSTRAINT [CK_WorkOrderRouting_ScheduledEndDate] CHECK ([ScheduledEndDate]>=[ScheduledStartDate])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_WorkOrderRouting_ProductID]
  ON [Production].[WorkOrderRouting] ([ProductID])
  ON [PRIMARY]
GO

ALTER TABLE [Production].[WorkOrderRouting]
  ADD CONSTRAINT [FK_WorkOrderRouting_Location_LocationID] FOREIGN KEY ([LocationID]) REFERENCES [Production].[Location] ([LocationID])
GO

ALTER TABLE [Production].[WorkOrderRouting]
  ADD CONSTRAINT [FK_WorkOrderRouting_WorkOrder_WorkOrderID] FOREIGN KEY ([WorkOrderID]) REFERENCES [Production].[WorkOrder] ([WorkOrderID])
GO