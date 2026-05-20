SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [Production].[uspDeleteWorkOrder] ( @WorkOrderID INT )
AS
 
BEGIN TRY
BEGIN TRANSACTION
-- Delete the rows from the parent table, WorkOrder, for the specified work order.
DELETE FROM Production.WorkOrder
WHERE WorkOrderID = @WorkOrderID;
 
-- Delete rows from the child table, WorkOrderRouting, for the specified work order.
DELETE FROM Production.WorkOrderRouting
WHERE WorkOrderID = @WorkOrderID;
COMMIT TRANSACTION
END TRY
 
BEGIN CATCH
-- Determine if an error occurred.
IF @@TRANCOUNT > 0
ROLLBACK TRANSACTION
 
-- Return the error information.
DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT;
SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY();
RAISERROR(@ErrorMessage, @ErrorSeverity, 1);
END CATCH;
GO