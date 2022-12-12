SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [HumanResources].[uspGetEmployees]
@LastName NVARCHAR(50),
@FirstName NVARCHAR(50),
@JobTitle NVARCHAR (50)

AS
SET NOCOUNT ON;
SELECT FirstName, LastName, JobTitle, Department
FROM HumanResources.vEmployeeDepartment
WHERE FirstName = @FirstName AND LastName = @LastName AND @JobTitle = @JobTitle;

GO