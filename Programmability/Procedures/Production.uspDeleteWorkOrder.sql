SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [Production].[uspDeleteWorkOrder] (@WorkOrderID INT)
AS
BEGIN TRY
 
BEGIN TRANSACTION;
 
-- Delete child rows first
DELETE FROM Production.WorkOrderRouting
WHERE WorkOrderID = @WorkOrderID;
 
-- Delete parent row
DELETE FROM Production.WorkOrder
WHERE WorkOrderID = @WorkOrderID;
 
COMMIT TRANSACTION;
 
END TRY
BEGIN CATCH
 
IF @@TRANCOUNT > 0
ROLLBACK TRANSACTION;
 
DECLARE @ErrorMessage NVARCHAR(4000)
,@ErrorSeverity INT;
 
SELECT
@ErrorMessage = ERROR_MESSAGE()
,@ErrorSeverity = ERROR_SEVERITY();
 
RAISERROR (@ErrorMessage, @ErrorSeverity, 1);
 
END CATCH;
GO